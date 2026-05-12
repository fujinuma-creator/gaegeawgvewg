import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  ScrollView,
  TouchableOpacity,
  ActivityIndicator,
  Alert,
} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import englishWords from './data/words.json';
import chineseWords from './data/chinese-words.json';

type Language = 'english' | 'chinese';

interface Word {
  id: string;
  word: string;
  definition: string;
  japanese: string;
  useCase: string;
  examples: string[];
  synonyms: string[];
  pinyin?: string;
}

interface ReviewData {
  wordId: string;
  lastReviewDate: number;
  nextReviewDate: number;
  reviewCount: number;
  isReviewed: boolean;
}

const LANGUAGE_CONFIG: Record<
  Language,
  { title: string; words: Word[]; storageKey: string }
> = {
  english: {
    title: 'English Vocab',
    words: englishWords as Word[],
    storageKey: 'reviewData',
  },
  chinese: {
    title: 'Chinese Vocab',
    words: chineseWords as Word[],
    storageKey: 'reviewData_chinese',
  },
};

const App = () => {
  const [language, setLanguage] = useState<Language | null>(null);

  if (!language) {
    return <LanguagePicker onPick={setLanguage} />;
  }
  return <VocabApp language={language} onBack={() => setLanguage(null)} />;
};

const LanguagePicker = ({ onPick }: { onPick: (lang: Language) => void }) => (
  <SafeAreaView style={styles.container}>
    <View style={styles.pickerContainer}>
      <Text style={styles.pickerTitle}>単語復習アプリ</Text>
      <Text style={styles.pickerSubtitle}>学びたい言語を選択</Text>

      <TouchableOpacity
        style={[styles.pickerButton, styles.englishButton]}
        onPress={() => onPick('english')}
      >
        <Text style={styles.pickerButtonText}>🇬🇧 English</Text>
        <Text style={styles.pickerButtonSub}>英単語復習</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.pickerButton, styles.chineseButton]}
        onPress={() => onPick('chinese')}
      >
        <Text style={styles.pickerButtonText}>🇨🇳 中文</Text>
        <Text style={styles.pickerButtonSub}>中国語単語復習</Text>
      </TouchableOpacity>
    </View>
  </SafeAreaView>
);

const VocabApp = ({
  language,
  onBack,
}: {
  language: Language;
  onBack: () => void;
}) => {
  const config = LANGUAGE_CONFIG[language];
  const words = config.words;

  const [currentWord, setCurrentWord] = useState<Word | null>(null);
  const [reviewData, setReviewData] = useState<ReviewData[]>([]);
  const [stats, setStats] = useState({ total: 0, reviewed: 0, todayReview: 0 });
  const [loading, setLoading] = useState(true);
  const [showAnswer, setShowAnswer] = useState(false);

  useEffect(() => {
    loadReviewData();
  }, [language]);

  const loadReviewData = async () => {
    try {
      const stored = await AsyncStorage.getItem(config.storageKey);
      const data = stored ? JSON.parse(stored) : initializeReviewData();
      setReviewData(data);
      loadTodayWord(data);
      updateStats(data);
    } catch (error) {
      console.error('データ読み込みエラー:', error);
      Alert.alert('エラー', 'データ読み込みに失敗しました');
    } finally {
      setLoading(false);
    }
  };

  const initializeReviewData = (): ReviewData[] =>
    words.map((word) => ({
      wordId: word.id,
      lastReviewDate: 0,
      nextReviewDate: 0,
      reviewCount: 0,
      isReviewed: false,
    }));

  const loadTodayWord = (data: ReviewData[]) => {
    const now = Date.now();
    const todayWords = data.filter(
      (review) => review.nextReviewDate <= now && !review.isReviewed
    );

    if (todayWords.length === 0) {
      setCurrentWord(null);
      return;
    }

    const randomReview =
      todayWords[Math.floor(Math.random() * todayWords.length)];
    const word = words.find((w) => w.id === randomReview.wordId);
    setCurrentWord(word || null);
    setShowAnswer(false);
  };

  const updateStats = (data: ReviewData[]) => {
    const now = Date.now();
    const todayReview = data.filter(
      (review) => review.nextReviewDate <= now && !review.isReviewed
    ).length;

    setStats({
      total: words.length,
      reviewed: data.filter((r) => r.reviewCount > 0).length,
      todayReview,
    });
  };

  const handleReview = (button: '〇' | '△' | '×') => {
    if (!currentWord) return;

    const now = Date.now();
    const updated = [...reviewData];
    const reviewIndex = updated.findIndex((r) => r.wordId === currentWord.id);

    if (reviewIndex !== -1) {
      let nextReviewDays = 1;
      if (button === '〇') nextReviewDays = 60;
      else if (button === '△') nextReviewDays = 7;
      else if (button === '×') nextReviewDays = 1;

      updated[reviewIndex] = {
        ...updated[reviewIndex],
        lastReviewDate: now,
        nextReviewDate: now + nextReviewDays * 24 * 60 * 60 * 1000,
        reviewCount: updated[reviewIndex].reviewCount + 1,
        isReviewed: true,
      };

      setReviewData(updated);
      AsyncStorage.setItem(config.storageKey, JSON.stringify(updated));
      updateStats(updated);
      loadTodayWord(updated);
    }
  };

  if (loading) {
    return (
      <SafeAreaView style={styles.container}>
        <ActivityIndicator size="large" color="#007AFF" />
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView contentContainerStyle={styles.scrollContainer}>
        {/* 戻るボタン */}
        <TouchableOpacity style={styles.backButton} onPress={onBack}>
          <Text style={styles.backButtonText}>← 言語選択へ</Text>
        </TouchableOpacity>

        {/* ヘッダー */}
        <View style={styles.header}>
          <Text style={styles.title}>{config.title}</Text>
          <Text style={styles.subtitle}>エビングハウス復習アプリ</Text>
        </View>

        {/* 統計情報 */}
        <View style={styles.statsContainer}>
          <View style={styles.statBox}>
            <Text style={styles.statLabel}>全単語数</Text>
            <Text style={styles.statValue}>{stats.total}</Text>
          </View>
          <View style={styles.statBox}>
            <Text style={styles.statLabel}>復習済み</Text>
            <Text style={styles.statValue}>{stats.reviewed}</Text>
          </View>
          <View style={styles.statBox}>
            <Text style={styles.statLabel}>今日の復習</Text>
            <Text style={styles.statValue}>{stats.todayReview}</Text>
          </View>
        </View>

        {/* 単語カード */}
        {currentWord ? (
          <View style={styles.cardContainer}>
            <View style={styles.card}>
              <Text style={styles.word}>{currentWord.word}</Text>
              {currentWord.pinyin && (
                <Text style={styles.pinyin}>{currentWord.pinyin}</Text>
              )}
              <Text style={styles.japanese}>{currentWord.japanese}</Text>
              <Text style={styles.useCase}>{currentWord.useCase}</Text>

              <TouchableOpacity
                style={styles.showButton}
                onPress={() => setShowAnswer(!showAnswer)}
              >
                <Text style={styles.showButtonText}>
                  {showAnswer ? '隠す' : '定義を表示'}
                </Text>
              </TouchableOpacity>

              {showAnswer && (
                <View style={styles.answerContainer}>
                  <Text style={styles.definition}>
                    <Text style={styles.label}>定義: </Text>
                    {currentWord.definition}
                  </Text>

                  <Text style={styles.examplesTitle}>例文:</Text>
                  {currentWord.examples.map((example, idx) => (
                    <Text key={idx} style={styles.example}>
                      • {example}
                    </Text>
                  ))}

                  <Text style={styles.synonymsTitle}>類義語:</Text>
                  {currentWord.synonyms.map((synonym, idx) => (
                    <Text key={idx} style={styles.synonym}>
                      • {synonym}
                    </Text>
                  ))}
                </View>
              )}
            </View>

            {showAnswer && (
              <View style={styles.buttonContainer}>
                <TouchableOpacity
                  style={[styles.button, styles.buttonGood]}
                  onPress={() => handleReview('〇')}
                >
                  <Text style={styles.buttonText}>〇 覚えた (60日後)</Text>
                </TouchableOpacity>
                <TouchableOpacity
                  style={[styles.button, styles.buttonSo]}
                  onPress={() => handleReview('△')}
                >
                  <Text style={styles.buttonText}>△ 忘れそう (7日後)</Text>
                </TouchableOpacity>
                <TouchableOpacity
                  style={[styles.button, styles.buttonBad]}
                  onPress={() => handleReview('×')}
                >
                  <Text style={styles.buttonText}>× 覚えてない (1日後)</Text>
                </TouchableOpacity>
              </View>
            )}
          </View>
        ) : (
          <View style={styles.emptyContainer}>
            <Text style={styles.emptyText}>🎉</Text>
            <Text style={styles.emptyMessage}>今日の復習は完了しました！</Text>
            <Text style={styles.emptySubMessage}>明日もがんばろう！</Text>
          </View>
        )}
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  pickerContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
  },
  pickerTitle: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#000',
    marginBottom: 4,
  },
  pickerSubtitle: {
    fontSize: 14,
    color: '#999',
    marginBottom: 40,
  },
  pickerButton: {
    width: '100%',
    paddingVertical: 24,
    borderRadius: 12,
    alignItems: 'center',
    marginBottom: 16,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 3,
  },
  englishButton: {
    backgroundColor: '#007AFF',
  },
  chineseButton: {
    backgroundColor: '#FF3B30',
  },
  pickerButtonText: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#fff',
  },
  pickerButtonSub: {
    fontSize: 13,
    color: '#fff',
    marginTop: 4,
    opacity: 0.9,
  },
  scrollContainer: {
    padding: 16,
    paddingBottom: 40,
  },
  backButton: {
    alignSelf: 'flex-start',
    paddingVertical: 4,
    paddingHorizontal: 8,
    marginBottom: 8,
  },
  backButtonText: {
    color: '#007AFF',
    fontSize: 14,
  },
  header: {
    alignItems: 'center',
    marginBottom: 24,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: '#007AFF',
  },
  subtitle: {
    fontSize: 14,
    color: '#999',
    marginTop: 4,
  },
  statsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    marginBottom: 24,
  },
  statBox: {
    backgroundColor: '#fff',
    padding: 12,
    borderRadius: 8,
    alignItems: 'center',
    flex: 1,
    marginHorizontal: 4,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 2,
  },
  statLabel: {
    fontSize: 12,
    color: '#999',
  },
  statValue: {
    fontSize: 20,
    fontWeight: 'bold',
    color: '#007AFF',
    marginTop: 4,
  },
  cardContainer: {
    marginBottom: 24,
  },
  card: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 24,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 3,
  },
  word: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#000',
    marginBottom: 8,
  },
  pinyin: {
    fontSize: 18,
    color: '#666',
    marginBottom: 8,
  },
  japanese: {
    fontSize: 16,
    color: '#007AFF',
    marginBottom: 8,
  },
  useCase: {
    fontSize: 13,
    color: '#666',
    fontStyle: 'italic',
    marginBottom: 16,
  },
  showButton: {
    backgroundColor: '#007AFF',
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 8,
    alignItems: 'center',
    marginBottom: 16,
  },
  showButtonText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 14,
  },
  answerContainer: {
    backgroundColor: '#f9f9f9',
    padding: 16,
    borderRadius: 8,
    borderLeftWidth: 4,
    borderLeftColor: '#007AFF',
  },
  label: {
    fontWeight: 'bold',
  },
  definition: {
    fontSize: 15,
    color: '#333',
    lineHeight: 22,
    marginBottom: 16,
  },
  examplesTitle: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#000',
    marginBottom: 8,
  },
  example: {
    fontSize: 13,
    color: '#555',
    lineHeight: 20,
    marginBottom: 6,
  },
  synonymsTitle: {
    fontSize: 14,
    fontWeight: 'bold',
    color: '#000',
    marginTop: 12,
    marginBottom: 8,
  },
  synonym: {
    fontSize: 13,
    color: '#555',
    lineHeight: 20,
    marginBottom: 6,
  },
  buttonContainer: {
    marginTop: 16,
    gap: 10,
  },
  button: {
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderRadius: 8,
    alignItems: 'center',
  },
  buttonGood: {
    backgroundColor: '#34C759',
  },
  buttonSo: {
    backgroundColor: '#FF9500',
  },
  buttonBad: {
    backgroundColor: '#FF3B30',
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 14,
  },
  emptyContainer: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 40,
    alignItems: 'center',
    marginTop: 40,
  },
  emptyText: {
    fontSize: 60,
    marginBottom: 16,
  },
  emptyMessage: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#000',
  },
  emptySubMessage: {
    fontSize: 14,
    color: '#999',
    marginTop: 8,
  },
});

export default App;
