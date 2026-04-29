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
import words from './data/words.json';

interface Word {
  id: string;
  word: string;
  definition: string;
  japanese: string;
  useCase: string;
  examples: string[];
  synonyms: string[];
}

interface ReviewData {
  wordId: string;
  lastReviewDate: number;
  nextReviewDate: number;
  reviewCount: number;
  isReviewed: boolean;
}

const App = () => {
  const [currentWord, setCurrentWord] = useState<Word | null>(null);
  const [reviewData, setReviewData] = useState<ReviewData[]>([]);
  const [stats, setStats] = useState({ total: 0, reviewed: 0, todayReview: 0 });
  const [loading, setLoading] = useState(true);
  const [showAnswer, setShowAnswer] = useState(false);

  // アプリ起動時：復習データ読み込み
  useEffect(() => {
    loadReviewData();
  }, []);

  // 復習データ読み込み
  const loadReviewData = async () => {
    try {
      const stored = await AsyncStorage.getItem('reviewData');
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

  // 初期化：すべての単語を登録
  const initializeReviewData = (): ReviewData[] => {
    return words.map((word: Word) => ({
      wordId: word.id,
      lastReviewDate: 0,
      nextReviewDate: 0,
      reviewCount: 0,
      isReviewed: false,
    }));
  };

  // 今日復習すべき単語をランダムに取得
  const loadTodayWord = (data: ReviewData[]) => {
    const now = Date.now();
    const todayWords = data.filter(
      (review) => review.nextReviewDate <= now && !review.isReviewed
    );

    if (todayWords.length === 0) {
      setCurrentWord(null);
      return;
    }

    // ランダムに1つ選択
    const randomReview = todayWords[Math.floor(Math.random() * todayWords.length)];
    const word = words.find((w: Word) => w.id === randomReview.wordId);
    setCurrentWord(word || null);
    setShowAnswer(false);
  };

  // 統計情報を更新
  const updateStats = (data: ReviewData[]) => {
    const now = Date.now();
    const today = new Date(now);
    today.setHours(0, 0, 0, 0);

    const todayReview = data.filter(
      (review) => review.nextReviewDate <= now && !review.isReviewed
    ).length;

    setStats({
      total: words.length,
      reviewed: data.filter((r) => r.reviewCount > 0).length,
      todayReview,
    });
  };

  // 復習ボタン押下
  const handleReview = (button: '〇' | '△' | '×') => {
    if (!currentWord) return;

    const now = Date.now();
    const updated = [...reviewData];
    const reviewIndex = updated.findIndex(
      (r) => r.wordId === currentWord.id
    );

    if (reviewIndex !== -1) {
      let nextReviewDays = 1;
      if (button === '〇') nextReviewDays = 60; // 2か月後
      else if (button === '△') nextReviewDays = 7; // 1週間後
      else if (button === '×') nextReviewDays = 1; // 1日後

      updated[reviewIndex] = {
        ...updated[reviewIndex],
        lastReviewDate: now,
        nextReviewDate: now + nextReviewDays * 24 * 60 * 60 * 1000,
        reviewCount: updated[reviewIndex].reviewCount + 1,
        isReviewed: true,
      };

      setReviewData(updated);
      AsyncStorage.setItem('reviewData', JSON.stringify(updated));
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
        {/* ヘッダー */}
        <View style={styles.header}>
          <Text style={styles.title}>English Vocab</Text>
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
              {/* 単語 */}
              <Text style={styles.word}>{currentWord.word}</Text>
              <Text style={styles.japanese}>{currentWord.japanese}</Text>
              <Text style={styles.useCase}>{currentWord.useCase}</Text>

              {/* 回答表示ボタン */}
              <TouchableOpacity
                style={styles.showButton}
                onPress={() => setShowAnswer(!showAnswer)}
              >
                <Text style={styles.showButtonText}>
                  {showAnswer ? '隠す' : '定義を表示'}
                </Text>
              </TouchableOpacity>

              {/* 回答 */}
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

            {/* ボタン */}
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
  scrollContainer: {
    padding: 16,
    paddingBottom: 40,
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
