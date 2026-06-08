import Foundation

/// Additional vocabulary added in batch updates. Returned by `WordStore.seedWords()`
/// alongside the original mockup-derived seeds. New seeds are merged into existing
/// users' libraries on launch (preserving review progress on words they already had).
enum SeedData {

    static var additionalWords: [Word] {
        return phrasalVerbs + idioms + adjectives + verbs + nouns
            + dailyAndEmotion + workAndBusiness + travel
            + moneyAndShopping + healthAndBody + tech
            + timeAndFrequency + communication + dailyCore
            + extraPhrasalVerbs + extraIdioms + extraAdjectives
            + conversationFillers + connectives
            + extraPhrasalVerbs2 + extraVerbs + extraAdjectives2
            + extraNouns + extraIdioms2
            + extraPhrasalVerbs3 + extraVerbs3 + extraAdjectives3
            + extraNouns3 + extraConnectives3
            + casualPhrasals + casualFillers + reactionWords
            + casualIdioms + emotionStates
            + casualPhrasals4 + casualVerbs4 + casualAdjectives4
            + casualNouns4 + casualIdioms4 + casualConnectives4
            + grammarPhrases4
            + directionPhrases5 + howQuestions5 + whatQuestions5
            + causatives5 + comeGetUsed5 + emphasis5 + comparatives5
            + conditionals5 + thereIts5 + requestPatterns5
            + tooEnoughSo5 + gerundPatterns5 + seemAppear5
            + casualConstructions5
            + plansAndIntentions6 + pastNarratives6 + iVerbThat6
            + youCheckPatterns6 + theWayPatterns6 + proposalSuggest6
            + ingPatterns6 + letMeVariations6 + idVerbPatterns6
            + tendToHappenTo6 + emphasisExclaim6 + hedgingPatterns6
            + endUpVariations6 + supposedToForms6 + predictions6
            + wheneverPatterns6 + negativePatterns6 + theXIs6
            + comeGoVerb6 + sentenceEnders6
            + britishGreetings7 + britishReactions7 + britishDegree7
            + britishFood7 + britishSuggestions7 + britishVerbs7
            + britishComplaints7 + britishAgreement7
            + elegantOpeners8 + elegantAgreement8 + elegantDisagreement8
            + elegantHedging8 + elegantStructure8 + elegantSuggestions8
            + elegantEvaluations8 + elegantConnectives8
            + miscBatch9
            + actionVerbs10 + thinkingVerbs10 + communicationVerbs10
            + stateChangeVerbs10 + handlingVerbs10
            + iVerbSimple10 + youVerbCheck10 + thatsReactions10
            + howVerbQuestions10 + verbGerund10 + verbInfinitive10
            + toBeAdj10 + sentenceEnders10
            + howReactions11 + ifPatterns11 + theresPatterns11
            + itsPatterns11 + causativePatterns11 + whatPatterns11
            + adverbPatterns11 + endingPatterns11
            + failureSuccessVerbs11 + relationshipVerbs11
            + mindChangeVerbs11 + observationVerbs11
            + prepositionalConnectors11
            + dailyNouns12 + personNouns12 + emotionNouns12
            + situationNouns12 + reactionVerbs12 + changeVerbs12
            + enjoyVerbs12 + destructionVerbs12 + supportVerbs12
            + feelingPhrases12 + sayingPhrases12 + conversationFlow12
            + emotionWords13 + communicationWords13 + workWords13
            + dailyWords13 + troubleWords13 + evaluationWords13
            + casualWords13
            + pathAndOthers14
            + peopleWords15 + emotionWords15 + relationshipWords15
            + workWords15 + dailyWords15 + troubleWords15
            + evaluationWords15 + situationWords15
            + slangActions16 + slangFeelings16 + slangPraise16
            + slangReactions16 + slangAbbreviations16
            + slangPeopleAndMoney16 + slangStateAndOthers16
            + workComms17 + critiqueWords17 + outcomeWords17
            + adjectiveWords17 + verbWords17 + idiomWords17
            + thinkingPhrases18 + businessVerbs18 + learningWords18
            + discussionPhrases19 + actionAdjectives19 + conceptPhrases19
            + reactionWords20 + mediaAndOthers20
            + opinionPhrases21 + learningPhrases21 + actionPhrases21
            + economySocial22 + businessTerms22 + actionVerbs22
            + characterStates22 + evaluationMedia22
            + personalityTypes23 + planningThoughts23
            + actionObjects23 + conceptsStates23
            + legalSocial24 + qualityVerbs24
            + emotionMood25 + actionMotion25 + adjectiveObjects25
            + emotionStates26 + qualityAdjectives26 + verbNouns26
            + impressionEmotion27 + stateLocation27 + verbFlow27
            + emotionMemory28 + actionVerbs28 + nounAdjective28
            + actionStates29 + qualityConcepts29
            + actionVerbs30 + qualityExpression30
            + actionVerbs31 + qualityAdjectives31
            + conversationalPhrases32
            + actionVerbs33 + emotionStates33
            + expressionFillers33 + nounConcepts33
            + businessCommerce34 + actionVerbs34
            + idiomsProverbs35 + nounExpressions35
            + actionVerbs36 + qualityAdjectives36
            + objectsItems36 + foodAndAnimals36
            + conceptStates36
            + assumptionPhrases37 + sentencePatterns37 + responsePhrases37
            + businessComms38 + actionResponses38
            + casualReactions39
            + verbsActions40 + adjectiveNouns40
            + conversationOpeners41
            + idiomsObjects42
            + sizeQualities43
            + casualExpressions44
            + greetingsReactions45 + verbStates45
            + conceptsNouns46
            + techConcepts47
            + politicsActions48
            + landscapeConcepts49 + verbStates49 + abstractTraits49
            + actionVerbs50 + nounAdjectives50
            + skillsAndStyle51
            + businessAnalysis52 + verbsAndRelations52
            + miscNouns53
            + statesAndJudgments54
            + actionVerbs55 + nounConcepts55 + statesExpressions55
            + businessNouns56 + verbsActions56 + adjectivesTraits56
            + phrasesAndExpressions57
            + businessLegal58 + healthBody58 + verbsActions58
            + nounsObjects58 + adjectives58 + expressions58 + eduMisc58
            + dayOffLife59 + workStudy59 + gamingSports59
            + dataConcepts59 + sensoryMisc59
            + expressionsQA60 + thingsObjects60 + verbsMix60 + adjectivesMix60
            + healthBody61 + businessConcepts61 + verbsActions61
            + nounsObjects61 + expressionsPhrases61
            + dailyLife62 + verbsActions62 + nounsObjects62
            + adjectivesStates62 + expressionsPhrases62 + education62
            + politeRequests63 + casualPhrases63 + schedulingMisc63
            + verbsAndPhrases63 + nounsAndMisc63 + statesAndFaults63
    }

    /// Words that have been removed from the seed list and should also be
    /// purged from existing users' libraries on next launch (one-time
    /// cleanup driven by WordStore).
    static let retiredWords: [String] = [
        // Singlish words — removed per user request.
        "cannot", "shiok", "sian", "paiseh", "kiasu", "kiasi",
        "alamak", "wah", "chope",
        "makan", "dabao", "kopi", "teh",
        "see how", "like that", "last time", "next time",
        "where got", "got or not", "already"
    ]

    private static func make(
        _ word: String,
        _ defEN: String,
        _ defJA: String,
        useCases: [String],
        examples: [(String, String)],
        ipa: String? = nil
    ) -> Word {
        Word(
            word: word,
            ipa: ipa,
            definitionEnglish: defEN,
            definitionJapanese: defJA,
            useCases: useCases,
            examples: examples.map { ExampleSentence(english: $0.0, japanese: $0.1) },
            synonyms: []
        )
    }

    // MARK: - Phrasal verbs (20)

    private static var phrasalVerbs: [Word] {
        [
            make("come up with",
                 "think of an idea, plan, or solution",
                 "思いつく・考え出す",
                 useCases: ["アイデアや解決策を提案するとき", "会議でブレストする場面"],
                 examples: [
                    ("She came up with a great idea.", "彼女は素晴らしいアイデアを思いついた。"),
                    ("Can you come up with a better plan?", "もっと良い案を思いつける？")
                 ], ipa: "/kˈʌm ˈʌp wɪð/"),
            make("put off",
                 "postpone or delay something",
                 "延期する・先延ばしにする",
                 useCases: ["予定を後ろにずらすとき", "嫌な作業を先延ばしにするとき"],
                 examples: [
                    ("Let's put off the meeting.", "会議を延期しよう。"),
                    ("Don't put off your homework.", "宿題を先延ばしにしないで。")
                 ], ipa: "/pˌʊt ˈɒf/"),
            make("look up to",
                 "respect and admire someone",
                 "尊敬する・憧れる",
                 useCases: ["年上や上司を尊敬するとき", "憧れの人物を表すとき"],
                 examples: [
                    ("I look up to my mother.", "母を尊敬している。"),
                    ("Kids look up to their teachers.", "子どもは先生を尊敬する。")
                 ], ipa: "/lˈʊk ˈʌp tuː/"),
            make("give up",
                 "stop trying; surrender",
                 "諦める・やめる",
                 useCases: ["挫折・断念を表すとき", "「諦めるな」と励ますとき", "悪習慣をやめると言うとき"],
                 examples: [
                    ("Don't give up!", "諦めないで！"),
                    ("He gave up smoking.", "彼はタバコをやめた。")
                 ], ipa: "/ɡˈɪv ˈʌp/"),
            make("figure out",
                 "understand or solve something after thinking",
                 "理解する・解明する",
                 useCases: ["問題の答えに辿り着くとき", "状況を把握しようとするとき"],
                 examples: [
                    ("I can't figure it out.", "理解できない。"),
                    ("Let me figure out the password.", "パスワードを考えてみる。")
                 ], ipa: "/fˈɪɡɐɹ ˈaʊt/"),
            make("take care of",
                 "be responsible for; look after",
                 "世話する・対処する",
                 useCases: ["子どもやペットの世話", "仕事や問題を担当するとき"],
                 examples: [
                    ("I'll take care of it.", "私が対処します。"),
                    ("She takes care of her brother.", "彼女は弟の面倒を見ている。")
                 ], ipa: "/tˈeɪk kˈeəɹ ɒv/"),
            make("run into",
                 "meet someone unexpectedly",
                 "偶然出会う",
                 useCases: ["街中で知人にバッタリ会ったとき", "偶然の出会いを話すとき"],
                 examples: [
                    ("I ran into Tom yesterday.", "昨日トムにバッタリ会った。"),
                    ("We ran into each other at the cafe.", "カフェで偶然会った。")
                 ], ipa: "/ɹˈʌn ˌɪntʊ/"),
            make("break down",
                 "stop working; analyze in detail",
                 "故障する・分析する",
                 useCases: ["機械や車が壊れたとき", "データや情報を細かく分析するとき"],
                 examples: [
                    ("My car broke down.", "車が故障した。"),
                    ("Let's break down the data.", "データを分析しよう。")
                 ], ipa: "/bɹˈeɪk dˈaʊn/"),
            make("carry out",
                 "perform a task or plan",
                 "実行する・遂行する",
                 useCases: ["計画や指示を実施するとき", "実験や調査を行うとき"],
                 examples: [
                    ("We carried out the plan.", "計画を実行した。"),
                    ("They carried out an experiment.", "彼らは実験を行った。")
                 ], ipa: "/kˈæɹɪ ˈaʊt/"),
            make("look forward to",
                 "feel excited about a future event",
                 "楽しみにする",
                 useCases: ["メールや会話で「楽しみ」と言うとき", "次回の予定にワクワクするとき"],
                 examples: [
                    ("I look forward to seeing you.", "会えるのを楽しみにしています。"),
                    ("She's looking forward to the trip.", "彼女は旅行を楽しみにしている。")
                 ], ipa: "/lˈʊk fˈɔːwəd tuː/"),
            make("catch up",
                 "reach the same level; share recent news",
                 "追いつく・近況を話す",
                 useCases: ["遅れを取り戻すとき", "久しぶりに会って近況報告するとき"],
                 examples: [
                    ("Let's catch up over coffee.", "コーヒーでもしながら近況話そう。"),
                    ("I need to catch up on my work.", "仕事の遅れを取り戻さないと。")
                 ], ipa: "/kˈætʃ ˈʌp/"),
            make("show up",
                 "arrive or appear",
                 "現れる・姿を見せる",
                 useCases: ["人が約束の場所に来るとき", "予期されていた人が姿を見せたとき"],
                 examples: [
                    ("He didn't show up.", "彼は来なかった。"),
                    ("She showed up late.", "彼女は遅れて現れた。")
                 ], ipa: "/ʃˈəʊ ˈʌp/"),
            make("turn out",
                 "end up being a particular way; happen as a result",
                 "結局〜になる・判明する",
                 useCases: ["結果や結論を述べるとき", "後から判明したことを伝えるとき"],
                 examples: [
                    ("It turned out fine.", "結局うまくいった。"),
                    ("He turned out to be right.", "結局彼が正しかった。")
                 ], ipa: "/tˈɜːn ˈaʊt/"),
            make("get along",
                 "have a friendly relationship",
                 "仲良くやる",
                 useCases: ["人間関係について話すとき", "チームの相性について話すとき"],
                 examples: [
                    ("We get along well.", "私たちは仲が良い。"),
                    ("They don't get along.", "彼らは仲が悪い。")
                 ], ipa: "/ɡɛt ɐlˈɒŋ/"),
            make("hold on",
                 "wait; grip firmly",
                 "待つ・しがみつく",
                 useCases: ["電話で「ちょっと待って」と言うとき", "物理的にしっかり掴むとき"],
                 examples: [
                    ("Hold on a second.", "ちょっと待って。"),
                    ("Hold on tight.", "しっかりつかまって。")
                 ], ipa: "/hˈəʊld ˈɒn/"),
            make("take over",
                 "take control or responsibility",
                 "引き継ぐ・支配する",
                 useCases: ["仕事を引き継ぐとき", "会社が買収されるとき"],
                 examples: [
                    ("I'll take over from here.", "ここから私が引き継ぎます。"),
                    ("She took over the project.", "彼女がプロジェクトを引き継いだ。")
                 ], ipa: "/tˈeɪk ˈəʊvɐ/"),
            make("point out",
                 "bring attention to something",
                 "指摘する・示す",
                 useCases: ["間違いや事実を指摘するとき", "注意を促すとき"],
                 examples: [
                    ("He pointed out the error.", "彼は間違いを指摘した。"),
                    ("Let me point out one thing.", "一つ指摘させて。")
                 ], ipa: "/pˈɔɪnt ˈaʊt/"),
            make("bring up",
                 "mention a topic; raise a child",
                 "話題に出す・育てる",
                 useCases: ["会話で話題を持ち出すとき", "子育てを表すとき"],
                 examples: [
                    ("Don't bring up that topic.", "その話題は出さないで。"),
                    ("She was brought up in Tokyo.", "彼女は東京で育った。")
                 ], ipa: "/bɹˈɪŋ ˈʌp/"),
            make("come across",
                 "find by chance; encounter",
                 "偶然見つける・出会う",
                 useCases: ["本やネットで偶然見つけたとき", "古い物を発掘したとき"],
                 examples: [
                    ("I came across this article.", "この記事を偶然見つけた。"),
                    ("He came across an old letter.", "彼は古い手紙を見つけた。")
                 ], ipa: "/kˈʌm əkɹˈɒs/"),
            make("make sense",
                 "be reasonable or understandable",
                 "理にかなう・納得がいく",
                 useCases: ["説明が論理的か確認するとき", "意味が通るかを話すとき"],
                 examples: [
                    ("That makes sense.", "なるほど、納得。"),
                    ("It doesn't make sense to me.", "私には意味が分からない。")
                 ], ipa: "/mˌeɪk sˈɛns/")
        ]
    }

    // MARK: - Idioms / Transitions (10)

    private static var idioms: [Word] {
        [
            make("once in a while",
                 "occasionally; not often",
                 "たまに・時々",
                 useCases: ["頻度を表すとき", "「ときどき」のニュアンスで"],
                 examples: [
                    ("I see him once in a while.", "たまに彼に会う。"),
                    ("Once in a while, I cook.", "たまに料理する。")
                 ], ipa: "/wˈʌns ɪn ɐ wˈaɪl/"),
            make("by the way",
                 "used to introduce a new topic",
                 "ところで・ちなみに",
                 useCases: ["会話で話題を変えるとき", "思い出して付け加えるとき"],
                 examples: [
                    ("By the way, did you eat?", "ところで、食べた？"),
                    ("By the way, I love it.", "ちなみに、それ好き。")
                 ], ipa: "/baɪ ðə wˈeɪ/"),
            make("as far as",
                 "to the extent that",
                 "〜に関する限り",
                 useCases: ["自分の知る限りで、と限定するとき", "範囲を示すとき"],
                 examples: [
                    ("As far as I know, it's true.", "私の知る限り本当だ。"),
                    ("As far as I'm concerned, it's fine.", "私としては問題ない。")
                 ], ipa: "/æz fˈɑːɹ æz/"),
            make("on the other hand",
                 "introducing a contrasting point",
                 "一方で・他方では",
                 useCases: ["対比を示すとき", "議論で別の見方を提示するとき"],
                 examples: [
                    ("On the other hand, it's expensive.", "一方で、高い。"),
                    ("On the other hand, it works fast.", "一方で、動作は速い。")
                 ], ipa: "/ɒnðɪ ˈʌðɐ hˈænd/"),
            make("so to speak",
                 "as it were; in a manner of speaking",
                 "言ってみれば・いわば",
                 useCases: ["比喩的に言うとき", "厳密ではないが大まかに表現するとき"],
                 examples: [
                    ("He's our boss, so to speak.", "言ってみれば彼が我々のボスだ。"),
                    ("It's our home, so to speak.", "我々の家のようなものだ。")
                 ], ipa: "/sˌəʊ tə spˈiːk/"),
            make("for the time being",
                 "for now; temporarily",
                 "当面の間・今のところ",
                 useCases: ["一時的な対応を伝えるとき", "暫定措置を示すとき"],
                 examples: [
                    ("Stay here for the time being.", "当面ここにいて。"),
                    ("This will do for the time being.", "当面はこれで十分。")
                 ], ipa: "/fəðə tˈaɪm bˈiːɪŋ/"),
            make("no matter what",
                 "regardless of what happens",
                 "何があっても・どんなことがあっても",
                 useCases: ["強い決意を示すとき", "約束や宣言の場面で"],
                 examples: [
                    ("I'll be there, no matter what.", "何があっても行く。"),
                    ("No matter what, I love you.", "何があっても君を愛してる。")
                 ], ipa: "/nˈəʊ mˈætɐ wˈɒt/"),
            make("as a result",
                 "because of something that happened",
                 "結果として・その結果",
                 useCases: ["因果関係を述べるとき", "結論を導くとき"],
                 examples: [
                    ("As a result, sales rose.", "結果として売上が上がった。"),
                    ("As a result, he was promoted.", "結果として彼は昇進した。")
                 ], ipa: "/æz ɐ ɹɪzˈʌlt/"),
            make("to be honest",
                 "speaking truthfully",
                 "正直に言うと",
                 useCases: ["本音を言う前置きに", "率直な意見を述べるとき"],
                 examples: [
                    ("To be honest, I don't like it.", "正直、好きじゃない。"),
                    ("To be honest, I'm tired.", "正直疲れた。")
                 ], ipa: "/təbɪ ˈɒnɪst/"),
            make("in the long run",
                 "over a long period of time",
                 "長い目で見れば・長期的には",
                 useCases: ["長期的な視点を強調するとき", "将来の利益を語るとき"],
                 examples: [
                    ("It pays off in the long run.", "長い目で見ると報われる。"),
                    ("It's better in the long run.", "長期的にはこの方が良い。")
                 ], ipa: "/ɪnðə lˈɒŋ ɹˈʌn/")
        ]
    }

    // MARK: - Adjectives (10)

    private static var adjectives: [Word] {
        [
            make("genuine",
                 "real; sincere",
                 "本物の・誠実な",
                 useCases: ["感情や人柄を「誠実」と評するとき", "商品が偽物でないと示すとき"],
                 examples: [
                    ("She has a genuine smile.", "彼女は誠実な笑顔だ。"),
                    ("This is genuine leather.", "これは本物の革だ。")
                 ], ipa: "/dʒˈɛnjuːɪn/"),
            make("crucial",
                 "extremely important",
                 "極めて重要な・決定的な",
                 useCases: ["重大な決断について話すとき", "不可欠な要素を強調するとき"],
                 examples: [
                    ("Sleep is crucial for health.", "睡眠は健康に不可欠だ。"),
                    ("This is a crucial step.", "これは重要なステップだ。")
                 ], ipa: "/kɹˈuːʃəl/"),
            make("tedious",
                 "long, slow, and boring",
                 "退屈で面倒な",
                 useCases: ["単調な作業について話すとき", "時間がかかる作業に文句を言うとき"],
                 examples: [
                    ("The work is tedious.", "その仕事は退屈だ。"),
                    ("A tedious meeting.", "退屈な会議。")
                 ], ipa: "/tˈiːdiəs/"),
            make("obvious",
                 "easy to see or understand",
                 "明らかな・明白な",
                 useCases: ["明白な事実を指摘するとき", "「言うまでもない」と表現するとき"],
                 examples: [
                    ("It's obvious.", "それは明らかだ。"),
                    ("An obvious mistake.", "明らかなミス。")
                 ], ipa: "/ˈɒbviəs/"),
            make("reluctant",
                 "unwilling and hesitant",
                 "気が進まない・しぶしぶの",
                 useCases: ["乗り気でないと伝えるとき", "しぶしぶ同意するとき"],
                 examples: [
                    ("He was reluctant to go.", "彼は行きたがらなかった。"),
                    ("A reluctant agreement.", "しぶしぶの同意。")
                 ], ipa: "/ɹɪlˈʌktənt/"),
            make("ambiguous",
                 "open to more than one interpretation",
                 "曖昧な・多義的な",
                 useCases: ["意味や指示が複数解釈できるとき", "立場や表現が不明確なとき"],
                 examples: [
                    ("The answer was ambiguous.", "答えが曖昧だった。"),
                    ("Ambiguous wording.", "あいまいな言い回し。")
                 ], ipa: "/æmbˈɪɡjuːəs/"),
            make("spontaneous",
                 "happening naturally without planning",
                 "自然発生的な・思いつきの",
                 useCases: ["計画なしの行動を表すとき", "自発的な反応を表すとき"],
                 examples: [
                    ("A spontaneous trip.", "思いつきの旅行。"),
                    ("Spontaneous laughter.", "自然な笑い。")
                 ], ipa: "/spɒntˈeɪniəs/"),
            make("vague",
                 "not clear or precise",
                 "漠然とした・あいまいな",
                 useCases: ["説明が具体性に欠けるとき", "記憶があやふやなとき"],
                 examples: [
                    ("I have a vague memory.", "ぼんやりした記憶がある。"),
                    ("A vague answer.", "あいまいな答え。")
                 ], ipa: "/vˈeɪɡ/"),
            make("peculiar",
                 "strange or unusual",
                 "独特な・奇妙な",
                 useCases: ["変わった特徴を表すとき", "独特の風味や匂いを伝えるとき"],
                 examples: [
                    ("A peculiar smell.", "独特な匂い。"),
                    ("His behavior was peculiar.", "彼の行動は奇妙だった。")
                 ], ipa: "/pɪkjˈuːliə/"),
            make("consistent",
                 "always the same; not changing",
                 "一貫した・首尾一貫した",
                 useCases: ["パフォーマンスや方針が安定していると評するとき", "矛盾がないと表すとき"],
                 examples: [
                    ("Be consistent in your work.", "仕事に一貫性を持って。"),
                    ("Consistent results.", "一貫した結果。")
                 ], ipa: "/kənsˈɪstənt/")
        ]
    }

    // MARK: - Verbs (20)

    private static var verbs: [Word] {
        [
            make("acknowledge",
                 "accept or admit something",
                 "認める・承認する",
                 useCases: ["事実や受領を認めるとき", "相手の貢献を尊重するとき"],
                 examples: [
                    ("I acknowledge my mistake.", "自分の間違いを認める。"),
                    ("He acknowledged her work.", "彼は彼女の働きを認めた。")
                 ], ipa: "/ɐknˈɒlɪdʒ/"),
            make("anticipate",
                 "expect or predict",
                 "予測する・期待する",
                 useCases: ["先読みして準備するとき", "需要や問題を見越すとき"],
                 examples: [
                    ("We anticipate problems.", "問題を予測している。"),
                    ("I anticipated his answer.", "彼の答えを予想していた。")
                 ], ipa: "/æntˈɪsɪpˌeɪt/"),
            make("appreciate",
                 "be thankful; recognize value",
                 "感謝する・価値を認める",
                 useCases: ["お礼を伝えるとき", "物事の価値を理解する場面で"],
                 examples: [
                    ("I appreciate your help.", "助けてくれてありがとう。"),
                    ("I appreciate good music.", "良い音楽が分かる。")
                 ], ipa: "/ɐpɹˈiːʃɪˌeɪt/"),
            make("assume",
                 "take for granted without proof",
                 "仮定する・思い込む",
                 useCases: ["証拠なしに信じるとき", "仮の前提を置いて議論するとき"],
                 examples: [
                    ("I assumed you knew.", "君は知っていると思った。"),
                    ("Let's assume it's true.", "それが本当だと仮定しよう。")
                 ], ipa: "/ɐsjˈuːm/"),
            make("clarify",
                 "make something easier to understand",
                 "明確にする・はっきりさせる",
                 useCases: ["説明を補足するとき", "誤解を解くとき"],
                 examples: [
                    ("Could you clarify?", "もう少し詳しく説明してくれる？"),
                    ("Let me clarify my point.", "言いたいことを明確にさせて。")
                 ], ipa: "/klˈæɹɪfˌaɪ/"),
            make("demonstrate",
                 "show clearly",
                 "示す・実演する",
                 useCases: ["使い方を実演するとき", "能力や事実を証明するとき"],
                 examples: [
                    ("He demonstrated the tool.", "彼は道具の使い方を実演した。"),
                    ("Demonstrate your skill.", "実力を示して。")
                 ], ipa: "/dˈɛmənstɹˌeɪt/"),
            make("emphasize",
                 "give special importance to",
                 "強調する",
                 useCases: ["プレゼンで重要点を伝えるとき", "強く言いたい部分を際立たせるとき"],
                 examples: [
                    ("She emphasized the deadline.", "彼女は締切を強調した。"),
                    ("Let me emphasize this.", "ここを強調させてください。")
                 ], ipa: "/ˈɛmfɐsˌaɪz/"),
            make("evaluate",
                 "judge the value or quality",
                 "評価する・査定する",
                 useCases: ["パフォーマンスや成果を判断するとき", "製品をレビューするとき"],
                 examples: [
                    ("We evaluate employees yearly.", "毎年従業員を評価する。"),
                    ("Evaluate the risks.", "リスクを評価して。")
                 ], ipa: "/ɪvˈæljuːˌeɪt/"),
            make("illustrate",
                 "explain by giving examples",
                 "例示する・図解する",
                 useCases: ["例を挙げて説明するとき", "図やイラストで示すとき"],
                 examples: [
                    ("Let me illustrate with an example.", "例を挙げて説明します。"),
                    ("The graph illustrates the trend.", "グラフが傾向を示している。")
                 ], ipa: "/ˈɪləstɹˌeɪt/"),
            make("interpret",
                 "explain the meaning; translate spoken words",
                 "解釈する・通訳する",
                 useCases: ["データや出来事の意味を読み解くとき", "会話を別言語に変換するとき"],
                 examples: [
                    ("How do you interpret this?", "これをどう解釈する？"),
                    ("She interprets Japanese.", "彼女は日本語を通訳する。")
                 ], ipa: "/ɪntˈɜːpɹɪt/"),
            make("justify",
                 "show or prove to be right",
                 "正当化する・理由を示す",
                 useCases: ["行動や決定の理由を説明するとき", "言い訳や弁明をするとき"],
                 examples: [
                    ("Justify your decision.", "あなたの決断の理由を述べて。"),
                    ("He justified his actions.", "彼は自分の行動を正当化した。")
                 ], ipa: "/dʒˈʌstɪfˌaɪ/"),
            make("modify",
                 "make small changes",
                 "修正する・変更する",
                 useCases: ["既存の物に変更を加えるとき", "計画やデザインを微調整するとき"],
                 examples: [
                    ("Modify the design.", "デザインを修正して。"),
                    ("We modified the plan.", "計画を変更した。")
                 ], ipa: "/mˈɒdɪfˌaɪ/"),
            make("negotiate",
                 "discuss to reach an agreement",
                 "交渉する",
                 useCases: ["契約条件を話し合うとき", "価格や妥協点を探るとき"],
                 examples: [
                    ("Let's negotiate the price.", "価格を交渉しよう。"),
                    ("He negotiated a deal.", "彼は契約をまとめた。")
                 ], ipa: "/nɪɡˈəʊʃɪˌeɪt/"),
            make("perceive",
                 "become aware; understand in a particular way",
                 "知覚する・捉える",
                 useCases: ["感じ方や受け取り方を表すとき", "客観的な観察を述べるとき"],
                 examples: [
                    ("How do you perceive it?", "君はそれをどう捉える？"),
                    ("He perceived the danger.", "彼は危険を察した。")
                 ], ipa: "/pəsˈiːv/"),
            make("preserve",
                 "keep in original or good condition",
                 "保存する・保つ",
                 useCases: ["文化や自然を守るとき", "食品を保存するとき"],
                 examples: [
                    ("Preserve nature.", "自然を守ろう。"),
                    ("Preserve the tradition.", "伝統を守る。")
                 ], ipa: "/pɹɪzˈɜːv/"),
            make("resemble",
                 "look or be similar to",
                 "似ている",
                 useCases: ["人や物の見た目が似ているとき", "性格や形が似ていると言うとき"],
                 examples: [
                    ("She resembles her mother.", "彼女は母親に似ている。"),
                    ("It resembles a cat.", "それは猫に似ている。")
                 ], ipa: "/ɹɪzˈɛmbəl/"),
            make("simulate",
                 "imitate; recreate the appearance",
                 "シミュレートする・模倣する",
                 useCases: ["実験や訓練で疑似体験を行うとき", "状況を再現するとき"],
                 examples: [
                    ("Simulate a real situation.", "実際の状況を再現する。"),
                    ("We simulated the test.", "テストをシミュレートした。")
                 ], ipa: "/sˈɪmjʊlˌeɪt/"),
            make("tolerate",
                 "accept or endure",
                 "我慢する・許容する",
                 useCases: ["不快なことを耐えるとき", "多様性を受け入れる場面で"],
                 examples: [
                    ("I can't tolerate noise.", "騒音には耐えられない。"),
                    ("Tolerate other opinions.", "他の意見を受け入れて。")
                 ], ipa: "/tˈɒləɹˌeɪt/"),
            make("underline",
                 "emphasize; draw a line under text",
                 "強調する・下線を引く",
                 useCases: ["重要性を強調するとき", "文書で目立たせる作業を表すとき"],
                 examples: [
                    ("Underline the key points.", "重要なところに下線を。"),
                    ("This underlines the issue.", "このことが問題を浮き彫りにする。")
                 ], ipa: "/ˌʌndəlˈaɪn/"),
            make("urge",
                 "strongly encourage",
                 "強く促す・駆り立てる",
                 useCases: ["行動を強く勧めるとき", "切迫した促しを表すとき"],
                 examples: [
                    ("I urge you to act now.", "今すぐ行動するよう強く促す。"),
                    ("She urged me to apply.", "彼女は応募するよう強く勧めた。")
                 ], ipa: "/ˈɜːdʒ/")
        ]
    }

    // MARK: - Nouns (20)

    private static var nouns: [Word] {
        [
            make("agenda",
                 "list of items to discuss; underlying plan",
                 "議題・予定・思惑",
                 useCases: ["会議の議題を伝えるとき", "「裏の意図」(hidden agenda)を表すとき"],
                 examples: [
                    ("What's on the agenda?", "議題は何？"),
                    ("He has a hidden agenda.", "彼には裏の意図がある。")
                 ], ipa: "/ɐdʒˈɛndɐ/"),
            make("analysis",
                 "detailed examination",
                 "分析",
                 useCases: ["データや状況を詳しく検討するとき", "レポートや論文の見出しに"],
                 examples: [
                    ("Do an analysis.", "分析して。"),
                    ("Detailed analysis is needed.", "詳細な分析が必要だ。")
                 ], ipa: "/ɐnˈæləsˌɪs/"),
            make("assumption",
                 "a thing accepted as true without proof",
                 "仮定・前提・思い込み",
                 useCases: ["議論の出発点となる前提を示すとき", "誤った思い込みを指摘するとき"],
                 examples: [
                    ("That's a wrong assumption.", "それは誤った仮定だ。"),
                    ("Based on the assumption...", "その前提に基づくと…")
                 ], ipa: "/ɐsˈʌmpʃən/"),
            make("benefit",
                 "an advantage or good result",
                 "利益・恩恵・メリット",
                 useCases: ["メリットを説明するとき", "福利厚生や恩恵について話すとき"],
                 examples: [
                    ("What's the benefit?", "どんな利点があるの？"),
                    ("Health benefits.", "健康への恩恵。")
                 ], ipa: "/bˈɛnɪfˌɪt/"),
            make("circumstance",
                 "a fact or condition relevant to a situation",
                 "状況・事情",
                 useCases: ["事情や経緯を説明するとき", "「状況によります」と言うとき"],
                 examples: [
                    ("Under the circumstances...", "そういう事情なので…"),
                    ("Special circumstances apply.", "特別な事情がある。")
                 ], ipa: "/sˈɜːkəmstˌæns/"),
            make("commitment",
                 "a promise; dedication",
                 "約束・献身・コミットメント",
                 useCases: ["仕事への熱意を示すとき", "約束や責任を果たす姿勢を表すとき"],
                 examples: [
                    ("He has strong commitment.", "彼には強い意志がある。"),
                    ("Make a commitment.", "約束をする。")
                 ], ipa: "/kəmˈɪtmənt/"),
            make("consequence",
                 "a result of an action",
                 "結果・影響",
                 useCases: ["行動の影響を説明するとき", "重大さを強調するとき"],
                 examples: [
                    ("Face the consequences.", "結果を受け入れて。"),
                    ("Serious consequences.", "深刻な結果。")
                 ], ipa: "/kˈɒnsɪkwəns/"),
            make("context",
                 "the situation in which something happens",
                 "文脈・状況",
                 useCases: ["言葉の意味を文脈で判断するとき", "背景情報を補足するとき"],
                 examples: [
                    ("Out of context.", "文脈を無視して。"),
                    ("In this context...", "この文脈では…")
                 ], ipa: "/kˈɒntɛkst/"),
            make("criteria",
                 "standards used to judge",
                 "基準（criterionの複数形）",
                 useCases: ["選考や評価の基準を示すとき", "比較する基準を述べるとき"],
                 examples: [
                    ("Meet the criteria.", "基準を満たす。"),
                    ("Evaluation criteria.", "評価基準。")
                 ], ipa: "/kɹaɪtˈiəɹɪɐ/"),
            make("distinction",
                 "difference; honor",
                 "区別・特色・栄誉",
                 useCases: ["二つの違いを明確にするとき", "優れた成果を称えるとき"],
                 examples: [
                    ("Make a distinction.", "区別をつけて。"),
                    ("Graduated with distinction.", "優秀な成績で卒業した。")
                 ], ipa: "/dɪstˈɪŋkʃən/"),
            make("expertise",
                 "special skill or knowledge",
                 "専門知識・専門性",
                 useCases: ["専門分野を説明するとき", "スキルセットをアピールするとき"],
                 examples: [
                    ("His expertise in law.", "彼の法律の専門知識。"),
                    ("We need your expertise.", "君の専門知識が必要だ。")
                 ], ipa: "/ˌɛkspətˈiːz/"),
            make("framework",
                 "a basic structure",
                 "枠組み・骨組み・フレームワーク",
                 useCases: ["計画や考え方の骨組みを話すとき", "ソフトウェアの基盤を指すとき"],
                 examples: [
                    ("A new framework.", "新しい枠組み。"),
                    ("Use a framework.", "フレームワークを使う。")
                 ], ipa: "/fɹˈeɪmwɜːk/"),
            make("hypothesis",
                 "a proposed explanation",
                 "仮説",
                 useCases: ["科学的研究で仮説を立てるとき", "議論で仮の説を提示するとき"],
                 examples: [
                    ("Test the hypothesis.", "仮説を検証する。"),
                    ("A bold hypothesis.", "大胆な仮説。")
                 ], ipa: "/haɪpˈɒθəsˌɪs/"),
            make("initiative",
                 "ability to act without being told; new program",
                 "主導権・自発性・新しい取り組み",
                 useCases: ["自発的な行動を取るとき", "新事業や活動を立ち上げるとき"],
                 examples: [
                    ("Take the initiative.", "主導権を握って。"),
                    ("Launch an initiative.", "新たな取り組みを始める。")
                 ], ipa: "/ɪnˈɪʃiətˌɪv/"),
            make("milestone",
                 "a significant point in development",
                 "節目・重要な達成",
                 useCases: ["プロジェクトの節目を祝うとき", "人生の重要な出来事について話すとき"],
                 examples: [
                    ("Reach a milestone.", "節目を迎える。"),
                    ("A major milestone.", "大きな節目。")
                 ], ipa: "/mˈaɪlstəʊn/"),
            make("perspective",
                 "a particular way of viewing things",
                 "視点・観点",
                 useCases: ["別の角度から見るとき", "視野を広げる話をするとき"],
                 examples: [
                    ("From my perspective...", "私の視点では…"),
                    ("Get some perspective.", "視野を広げて。")
                 ], ipa: "/pəspˈɛktɪv/"),
            make("priority",
                 "something important that must be dealt with first",
                 "優先順位・優先事項",
                 useCases: ["仕事の優先度を決めるとき", "重要事項を強調するとき"],
                 examples: [
                    ("Set your priorities.", "優先順位を決めて。"),
                    ("Family is my priority.", "家族が一番大切だ。")
                 ], ipa: "/pɹaɪˈɒɹɪtɪ/"),
            make("tendency",
                 "an inclination to behave in a certain way",
                 "傾向・性向",
                 useCases: ["人の性格や行動パターンを話すとき", "統計的な傾向を述べるとき"],
                 examples: [
                    ("He has a tendency to be late.", "彼は遅刻する傾向がある。"),
                    ("A growing tendency.", "高まる傾向。")
                 ], ipa: "/tˈɛndənsɪ/"),
            make("trait",
                 "a distinguishing characteristic",
                 "特徴・特性",
                 useCases: ["性格的な特徴を説明するとき", "遺伝的特性を話すとき"],
                 examples: [
                    ("A good trait.", "良い特徴。"),
                    ("Inherited traits.", "遺伝的特性。")
                 ], ipa: "/tɹˈeɪt/"),
            make("virtue",
                 "a good moral quality",
                 "美徳・長所",
                 useCases: ["人の良い性質を称えるとき", "「忍耐は美徳」のような言い回しで"],
                 examples: [
                    ("Patience is a virtue.", "忍耐は美徳。"),
                    ("His main virtue.", "彼の主な長所。")
                 ], ipa: "/vˈɜːtʃuː/")
        ]
    }

    // MARK: - 日常生活・感情 (15)

    private static var dailyAndEmotion: [Word] {
        [
            make("miss out", "lose a chance to do or get something",
                 "チャンスを逃す・参加しそびれる",
                 useCases: ["楽しい予定を逃したとき", "セールやイベントを逃したとき"],
                 examples: [
                    ("Don't miss out on this deal.", "このセール逃すなよ。"),
                    ("I missed out on the party.", "パーティー行きそびれた。")
                 ], ipa: "/mˈɪs ˈaʊt/"),
            make("keep in mind", "remember to consider something",
                 "心に留めておく・覚えておく",
                 useCases: ["注意点を念押しするとき", "後で思い出してほしいことを伝えるとき"],
                 examples: [
                    ("Keep in mind we have a meeting at 3.", "3時に会議あるって覚えといて。"),
                    ("Just keep that in mind.", "それだけ覚えといて。")
                 ], ipa: "/kˈiːp ɪn mˈaɪnd/"),
            make("on purpose", "intentionally; not by accident",
                 "わざと・意図的に",
                 useCases: ["故意かどうか確認するとき", "意図的な行動を表すとき"],
                 examples: [
                    ("Did you do that on purpose?", "わざとやった？"),
                    ("I broke it on purpose.", "わざと壊したんだ。")
                 ], ipa: "/ˌɒn pˈɜːpəs/"),
            make("get used to", "become familiar with something",
                 "慣れる",
                 useCases: ["新しい環境に慣れる話をするとき", "時間が経って慣れたと言うとき"],
                 examples: [
                    ("I'm getting used to the new job.", "新しい仕事に慣れてきた。"),
                    ("You'll get used to it.", "そのうち慣れるよ。")
                 ], ipa: "/ɡɛt jˈuːzd tuː/"),
            make("feel free to", "you're welcome to do something",
                 "気軽に〜してね",
                 useCases: ["気軽な行動を促すとき", "丁寧に許可を出すとき"],
                 examples: [
                    ("Feel free to ask me anything.", "何でも気軽に聞いてね。"),
                    ("Feel free to grab a snack.", "好きにお菓子つまんで。")
                 ], ipa: "/fˈiːl fɹˈiː tuː/"),
            make("come in handy", "be useful when needed",
                 "役に立つ・重宝する",
                 useCases: ["後で使えると伝えるとき", "もしもの時に便利だと言うとき"],
                 examples: [
                    ("This will come in handy.", "これ後で役立つよ。"),
                    ("That tip came in handy.", "そのコツ役に立った。")
                 ], ipa: "/kˈʌm ɪn hˈændɪ/"),
            make("on second thought", "after reconsidering",
                 "やっぱり・考え直して",
                 useCases: ["決断を変えるとき", "言い直すとき"],
                 examples: [
                    ("On second thought, let's stay home.", "やっぱり家にいよう。"),
                    ("On second thought, I'll skip dessert.", "やっぱりデザートはやめとく。")
                 ], ipa: "/ˌɒn sˈɛkənd θˈɔːt/"),
            make("in case", "as a precaution; if something happens",
                 "念のため・万一に備えて",
                 useCases: ["保険として準備するとき", "もしもに備えると言うとき"],
                 examples: [
                    ("Bring a jacket in case it's cold.", "寒い時用にジャケット持ってきて。"),
                    ("Just in case.", "念のためね。")
                 ], ipa: "/ɪn kˈeɪs/"),
            make("by mistake", "unintentionally; accidentally",
                 "間違って・うっかり",
                 useCases: ["うっかりミスを伝えるとき", "故意でないと釈明するとき"],
                 examples: [
                    ("I texted her by mistake.", "間違えて彼女にメッセージ送った。"),
                    ("I deleted it by mistake.", "間違えて消しちゃった。")
                 ], ipa: "/baɪ mɪstˈeɪk/"),
            make("in advance", "ahead of time; beforehand",
                 "事前に・前もって",
                 useCases: ["事前準備の話をするとき", "予約や予告について話すとき"],
                 examples: [
                    ("Let me know in advance.", "前もって教えて。"),
                    ("Thanks in advance.", "先にありがとう。")
                 ], ipa: "/ɪn ɐdvˈæns/"),
            make("out of the blue", "unexpectedly; suddenly",
                 "突然・急に",
                 useCases: ["予期せぬ出来事を伝えるとき", "予告なしの連絡に驚いたとき"],
                 examples: [
                    ("She called me out of the blue.", "急に彼女から電話来たんだ。"),
                    ("It happened out of the blue.", "急に起きたんだ。")
                 ], ipa: "/ˌaʊtəv ðə blˈuː/"),
            make("sooner or later", "at some point; eventually",
                 "遅かれ早かれ・いずれ",
                 useCases: ["いずれ起きると伝えるとき", "避けられない結果を予測するとき"],
                 examples: [
                    ("You'll find out sooner or later.", "遅かれ早かれわかるよ。"),
                    ("Sooner or later, he'll quit.", "そのうち彼辞めるよ。")
                 ], ipa: "/sˈuːnɐɹ ɔː lˈeɪtɐ/"),
            make("believe it or not", "you may find this surprising",
                 "信じられないかもしれないけど",
                 useCases: ["驚きの話を切り出すとき", "意外な事実を共有するとき"],
                 examples: [
                    ("Believe it or not, I won.", "信じられないけど勝ったんだ。"),
                    ("Believe it or not, he's 50.", "信じられる？彼50歳なんだ。")
                 ], ipa: "/bɪlˈiːv ɪt ɔː nˈɒt/"),
            make("speaking of", "since you mentioned that",
                 "そういえば・〜と言えば",
                 useCases: ["話題を関連事項に繋げるとき", "ふと思い出して話を振るとき"],
                 examples: [
                    ("Speaking of food, I'm hungry.", "食べ物といえばお腹減った。"),
                    ("Speaking of work, did you hear?", "そういえば仕事の話聞いた？")
                 ], ipa: "/spˈiːkɪŋ ɒv/"),
            make("as usual", "in the same way as normal",
                 "いつものように・相変わらず",
                 useCases: ["普段通りであることを表すとき", "繰り返し起きる事象を述べるとき"],
                 examples: [
                    ("She's late, as usual.", "彼女、いつも通り遅刻。"),
                    ("Same place as usual?", "いつものとこで？")
                 ], ipa: "/æz jˈuːʒuːəl/")
        ]
    }

    // MARK: - 仕事・ビジネス (15)

    private static var workAndBusiness: [Word] {
        [
            make("deadline", "the latest time something must be done",
                 "締切・期限",
                 useCases: ["締切を確認するとき", "プロジェクトの納期について話すとき"],
                 examples: [
                    ("What's the deadline?", "締切いつ？"),
                    ("I missed the deadline.", "締切過ぎちゃった。")
                 ], ipa: "/dˈɛdlaɪn/"),
            make("workload", "the amount of work to do",
                 "仕事量・業務量",
                 useCases: ["業務の多さを伝えるとき", "誰かに負担を聞くとき"],
                 examples: [
                    ("My workload is crazy this week.", "今週仕事量ヤバい。"),
                    ("Heavy workload again.", "また仕事量多い。")
                 ], ipa: "/wˈɜːkləʊd/"),
            make("overtime", "work beyond regular hours",
                 "残業・時間外労働",
                 useCases: ["残業について話すとき", "勤務時間の話をするとき"],
                 examples: [
                    ("I'm working overtime tonight.", "今夜残業だ。"),
                    ("Too much overtime lately.", "最近残業多すぎ。")
                 ], ipa: "/ˈəʊvətˌaɪm/"),
            make("colleague", "a person you work with",
                 "同僚",
                 useCases: ["職場の人を紹介するとき", "同じ会社のメンバーを指すとき"],
                 examples: [
                    ("She's my colleague.", "彼女、同僚なんだ。"),
                    ("I had lunch with a colleague.", "同僚とランチした。")
                 ], ipa: "/kˈɒliːɡ/"),
            make("feedback", "comments on something you've done",
                 "フィードバック・意見",
                 useCases: ["意見を求めるとき", "改善点を共有するとき"],
                 examples: [
                    ("Can I get your feedback?", "意見もらえる？"),
                    ("Thanks for the feedback.", "フィードバックありがとう。")
                 ], ipa: "/fˈiːdbæk/"),
            make("in charge of", "responsible for something",
                 "〜の担当・責任者",
                 useCases: ["責任者を確認するとき", "業務分担を伝えるとき"],
                 examples: [
                    ("Who's in charge of this project?", "この案件誰が担当？"),
                    ("I'm in charge of marketing.", "マーケティング担当してます。")
                 ], ipa: "/ɪn tʃˈɑːdʒ ɒv/"),
            make("due to", "because of",
                 "〜のため・〜が原因で",
                 useCases: ["原因を説明するとき", "予定変更の理由を述べるとき"],
                 examples: [
                    ("Delayed due to traffic.", "渋滞で遅れた。"),
                    ("Due to weather, we cancelled.", "天気のせいでキャンセルした。")
                 ], ipa: "/djˈuː tuː/"),
            make("approve", "officially agree to something",
                 "承認する・OKを出す",
                 useCases: ["決済や許可を出すとき", "上司の承認待ちの話をするとき"],
                 examples: [
                    ("My boss approved it.", "上司がOK出した。"),
                    ("Has it been approved yet?", "もう承認された？")
                 ], ipa: "/ɐpɹˈuːv/"),
            make("decline", "politely refuse",
                 "断る・辞退する",
                 useCases: ["招待や提案を断るとき", "丁寧に拒否するとき"],
                 examples: [
                    ("I had to decline the offer.", "オファー断るしかなかった。"),
                    ("She declined politely.", "彼女は丁寧に断った。")
                 ], ipa: "/dɪklˈaɪn/"),
            make("client", "a customer or person you do work for",
                 "クライアント・顧客",
                 useCases: ["取引先について話すとき", "顧客対応の話題のとき"],
                 examples: [
                    ("The client wants changes.", "クライアントが変更を希望してる。"),
                    ("Big client meeting today.", "今日大事なクライアントとの会議。")
                 ], ipa: "/klˈaɪənt/"),
            make("meeting", "a planned discussion with people",
                 "会議・打ち合わせ",
                 useCases: ["打ち合わせの予定を伝えるとき", "ミーティング全般について話すとき"],
                 examples: [
                    ("I have a meeting at 2.", "2時に会議ある。"),
                    ("That meeting was useless.", "あの会議無駄だった。")
                 ], ipa: "/mˈiːtɪŋ/"),
            make("presentation", "a talk that explains something",
                 "プレゼン・発表",
                 useCases: ["発表の準備や本番について話すとき", "学校・仕事の場面で"],
                 examples: [
                    ("I'm nervous about the presentation.", "プレゼン緊張する。"),
                    ("Great presentation!", "プレゼンよかった！")
                 ], ipa: "/pɹˌɛzəntˈeɪʃən/"),
            make("brainstorm", "throw out ideas together",
                 "アイデアを出し合う・ブレストする",
                 useCases: ["新企画の発想会で", "ブレストの場面を表現するとき"],
                 examples: [
                    ("Let's brainstorm some ideas.", "アイデア出し合おう。"),
                    ("We brainstormed for an hour.", "1時間ブレストした。")
                 ], ipa: "/bɹˈeɪnstɔːm/"),
            make("on track", "going as planned",
                 "順調に・予定通りに",
                 useCases: ["プロジェクト進捗を伝えるとき", "計画通りと言うとき"],
                 examples: [
                    ("We're on track to finish.", "完了に向けて順調。"),
                    ("Everything's on track.", "全部順調。")
                 ], ipa: "/ˌɒn tɹˈæk/"),
            make("behind schedule", "later than planned",
                 "予定より遅れている",
                 useCases: ["遅延を伝えるとき", "プロジェクトが遅れていると報告するとき"],
                 examples: [
                    ("We're behind schedule.", "予定より遅れてる。"),
                    ("The project is behind schedule.", "プロジェクト遅れてる。")
                 ], ipa: "/bɪhˌaɪnd ʃˈɛdjuːl/")
        ]
    }

    // MARK: - 旅行・移動 (15)

    private static var travel: [Word] {
        [
            make("book", "reserve a place or seat in advance",
                 "予約する",
                 useCases: ["ホテルや航空券を予約するとき", "予約済みと伝えるとき"],
                 examples: [
                    ("I booked a flight.", "フライト予約した。"),
                    ("Did you book the hotel?", "ホテル予約した？")
                 ], ipa: "/bˈʊk/"),
            make("cancel", "call off a plan or reservation",
                 "キャンセルする",
                 useCases: ["予定や予約を取り消すとき"],
                 examples: [
                    ("I had to cancel the trip.", "旅行キャンセルしないといけなかった。"),
                    ("They cancelled the flight.", "フライトがキャンセルになった。")
                 ], ipa: "/kˈænsəl/"),
            make("departure", "leaving from a place",
                 "出発",
                 useCases: ["飛行機・電車の出発時刻を確認するとき"],
                 examples: [
                    ("What's your departure time?", "出発何時？"),
                    ("Departure is at 9.", "出発は9時だ。")
                 ], ipa: "/dɪpˈɑːtʃɐ/"),
            make("arrival", "reaching a place",
                 "到着",
                 useCases: ["到着予定時刻を確認するとき"],
                 examples: [
                    ("Arrival's around 5.", "到着は5時くらい。"),
                    ("Check the arrival board.", "到着案内板見て。")
                 ], ipa: "/ɐɹˈaɪvəl/"),
            make("luggage", "bags you take when traveling",
                 "荷物・手荷物",
                 useCases: ["旅行の荷物について話すとき", "空港でのやり取り"],
                 examples: [
                    ("Don't forget your luggage.", "荷物忘れないで。"),
                    ("My luggage didn't arrive.", "荷物届かなかった。")
                 ], ipa: "/lˈʌɡɪdʒ/"),
            make("head to", "go in the direction of",
                 "〜へ向かう",
                 useCases: ["これから行く場所を伝えるとき"],
                 examples: [
                    ("I'm heading to the airport.", "これから空港に向かう。"),
                    ("Let's head to the cafe.", "カフェに行こう。")
                 ], ipa: "/hˈɛd tuː/"),
            make("pull over", "stop a car at the side of the road",
                 "路肩に車を寄せる",
                 useCases: ["運転中に止まる必要があるとき", "警察に止められた話をするとき"],
                 examples: [
                    ("Pull over up here.", "ここで止めて。"),
                    ("The cop pulled me over.", "警察に止められた。")
                 ], ipa: "/pˈʊl ˈəʊvɐ/"),
            make("detour", "an alternative route around something",
                 "迂回路・回り道",
                 useCases: ["道路工事や事故で迂回するとき"],
                 examples: [
                    ("There's a detour ahead.", "この先迂回路あるよ。"),
                    ("We had to take a detour.", "迂回するしかなかった。")
                 ], ipa: "/dˈiːtɔː/"),
            make("shortcut", "a quicker route",
                 "近道・ショートカット",
                 useCases: ["最短ルートを提案するとき"],
                 examples: [
                    ("I know a shortcut.", "近道知ってる。"),
                    ("Take the shortcut.", "近道使って。")
                 ], ipa: "/ʃˈɔːtkʌt/"),
            make("in the middle of", "currently doing something",
                 "〜の最中・〜している途中",
                 useCases: ["何かをやっている途中だと伝えるとき"],
                 examples: [
                    ("I'm in the middle of something.", "ちょっと今手が離せない。"),
                    ("In the middle of dinner.", "今ご飯中。")
                 ], ipa: "/ɪnðə mˈɪdəl ɒv/"),
            make("all set", "ready; everything's done",
                 "準備万端・もう大丈夫",
                 useCases: ["準備完了を確認するとき", "支払い完了などを伝えるとき"],
                 examples: [
                    ("Are you all set?", "準備できた？"),
                    ("We're all set.", "準備OK。")
                 ], ipa: "/ˈɔːl sˈɛt/"),
            make("check in", "register on arrival",
                 "チェックインする",
                 useCases: ["ホテルや空港でチェックインするとき", "出勤時の打刻"],
                 examples: [
                    ("Let's check in at the hotel.", "ホテルでチェックインしよう。"),
                    ("I'll check in online.", "オンラインでチェックインする。")
                 ], ipa: "/tʃˈɛk ˈɪn/"),
            make("check out", "leave; or take a look at",
                 "チェックアウトする・見てみる",
                 useCases: ["ホテルを出るとき", "新しいものを見てみてと言うとき"],
                 examples: [
                    ("I'll check out at 11.", "11時にチェックアウトする。"),
                    ("Check out this song.", "この曲聴いてみて。")
                 ], ipa: "/tʃˈɛk ˈaʊt/"),
            make("on the way", "in the process of going somewhere",
                 "向かっている途中・道中で",
                 useCases: ["移動中であることを伝えるとき"],
                 examples: [
                    ("I'm on the way.", "今向かってる。"),
                    ("On the way home now.", "今帰り道。")
                 ], ipa: "/ɒnðə wˈeɪ/"),
            make("in person", "face to face, not online",
                 "直接・対面で",
                 useCases: ["会って話したいとき", "オンラインではなく対面と区別するとき"],
                 examples: [
                    ("Let's talk in person.", "直接会って話そう。"),
                    ("I want to meet in person.", "実際に会いたい。")
                 ], ipa: "/ɪn pˈɜːsən/")
        ]
    }

    // MARK: - お金・買い物 (10)

    private static var moneyAndShopping: [Word] {
        [
            make("afford", "have enough money for something",
                 "〜する余裕がある・買える",
                 useCases: ["金銭的余裕を話すとき"],
                 examples: [
                    ("I can't afford it.", "余裕ないよ。"),
                    ("Can you afford that?", "それ買える？")
                 ], ipa: "/ɐfˈɔːd/"),
            make("discount", "a reduction in price",
                 "割引・値引き",
                 useCases: ["値引きについて話すとき"],
                 examples: [
                    ("Any discount?", "割引ある？"),
                    ("They gave me a discount.", "割引してくれた。")
                 ], ipa: "/dˈɪskaʊnt/"),
            make("refund", "money returned to you",
                 "返金",
                 useCases: ["返品時の返金を求めるとき"],
                 examples: [
                    ("Can I get a refund?", "返金できる？"),
                    ("I want a refund.", "返金してほしい。")
                 ], ipa: "/ɹɪfˈʌnd/"),
            make("split the bill", "divide the cost evenly",
                 "割り勘する",
                 useCases: ["友達と食事代を分けるとき"],
                 examples: [
                    ("Let's split the bill.", "割り勘しよう。"),
                    ("Split the bill, OK?", "割り勘でいい？")
                 ], ipa: "/splˈɪt ðə bˈɪl/"),
            make("on sale", "available at a reduced price",
                 "セール中・特価で",
                 useCases: ["セール商品を見つけたとき"],
                 examples: [
                    ("It's on sale!", "セール中だ！"),
                    ("These shoes are on sale.", "この靴セール中。")
                 ], ipa: "/ˌɒn sˈeɪl/"),
            make("receipt", "proof of purchase",
                 "レシート・領収書",
                 useCases: ["買い物のレシートをやり取りするとき"],
                 examples: [
                    ("Can I have the receipt?", "レシートもらえる？"),
                    ("Save the receipt.", "レシート取っといて。")
                 ], ipa: "/ɹɪsˈiːt/"),
            make("expense", "money spent",
                 "経費・出費",
                 useCases: ["費用について話すとき", "出費が大きいと嘆くとき"],
                 examples: [
                    ("That's a big expense.", "それ大きい出費だ。"),
                    ("I'll claim it as an expense.", "経費で落とす。")
                 ], ipa: "/ɪkspˈɛns/"),
            make("service charge", "an extra fee for service",
                 "サービス料",
                 useCases: ["レストランの請求を確認するとき"],
                 examples: [
                    ("There's a service charge.", "サービス料込みだ。"),
                    ("Service charge is 10%.", "サービス料は10%。")
                 ], ipa: "/sˈɜːvɪs tʃˈɑːdʒ/"),
            make("out of stock", "no longer available",
                 "在庫切れ",
                 useCases: ["商品が買えないとき"],
                 examples: [
                    ("It's out of stock.", "在庫切れだ。"),
                    ("Sorry, it's out of stock.", "ごめん、在庫切れ。")
                 ], ipa: "/ˌaʊtəv stˈɒk/"),
            make("warranty", "a guarantee on a product",
                 "保証",
                 useCases: ["保証期間について話すとき"],
                 examples: [
                    ("Is there a warranty?", "保証ある？"),
                    ("It's still under warranty.", "まだ保証期間内だ。")
                 ], ipa: "/wˈɒɹəntɪ/")
        ]
    }

    // MARK: - 健康・体 (10)

    private static var healthAndBody: [Word] {
        [
            make("recover", "get well again",
                 "回復する・治る",
                 useCases: ["病気から治ったと伝えるとき", "怪我の回復について話すとき"],
                 examples: [
                    ("I'm recovering well.", "順調に回復してる。"),
                    ("Hope you recover soon.", "早く治るといいね。")
                 ], ipa: "/ɹɪkˈʌvɐ/"),
            make("prescription", "doctor's note for medicine",
                 "処方箋",
                 useCases: ["薬を処方されたとき"],
                 examples: [
                    ("I need to fill my prescription.", "処方箋出さないと。"),
                    ("Got a prescription from the doctor.", "医者から処方箋もらった。")
                 ], ipa: "/pɹɪskɹˈɪpʃən/"),
            make("symptom", "a sign of illness",
                 "症状",
                 useCases: ["体調不良を医者に説明するとき"],
                 examples: [
                    ("What are your symptoms?", "症状は？"),
                    ("Cold-like symptoms.", "風邪っぽい症状。")
                 ], ipa: "/sˈɪmptəm/"),
            make("appointment", "a scheduled meeting",
                 "予約・アポ",
                 useCases: ["医者や美容院のアポを取るとき"],
                 examples: [
                    ("I have an appointment at 2.", "2時にアポある。"),
                    ("Book an appointment.", "予約取って。")
                 ], ipa: "/ɐpˈɔɪntmənt/"),
            make("sore", "painful, especially muscle pain",
                 "痛い・筋肉痛で",
                 useCases: ["体が痛いと伝えるとき"],
                 examples: [
                    ("My legs are sore.", "脚が痛い。"),
                    ("I've got a sore throat.", "喉が痛い。")
                 ], ipa: "/sˈɔː/"),
            make("workout", "a session of exercise",
                 "トレーニング・運動",
                 useCases: ["運動について話すとき"],
                 examples: [
                    ("Good workout today.", "今日のトレ良かった。"),
                    ("I'm done with my workout.", "トレ終わった。")
                 ], ipa: "/wˈɜːkaʊt/"),
            make("stress out", "feel very stressed",
                 "ストレスがたまる・イライラする",
                 useCases: ["仕事や生活のストレスを話すとき"],
                 examples: [
                    ("Don't stress out.", "ストレスためないで。"),
                    ("I'm super stressed out.", "めっちゃストレスたまってる。")
                 ], ipa: "/stɹˈɛs ˈaʊt/"),
            make("diet", "what you eat; eating plan",
                 "食事・ダイエット",
                 useCases: ["食事制限の話をするとき"],
                 examples: [
                    ("I'm on a diet.", "ダイエット中。"),
                    ("Bad for your diet.", "ダイエットに悪いよ。")
                 ], ipa: "/dˈaɪət/"),
            make("fall asleep", "drift off to sleep",
                 "寝落ちする・眠ってしまう",
                 useCases: ["寝てしまった話をするとき"],
                 examples: [
                    ("I fell asleep on the couch.", "ソファで寝落ちした。"),
                    ("Don't fall asleep!", "寝るな！")
                 ], ipa: "/fˈɔːl ɐslˈiːp/"),
            make("wake up", "stop sleeping",
                 "起きる・目を覚ます",
                 useCases: ["朝の習慣を話すとき"],
                 examples: [
                    ("I wake up at 6.", "6時に起きる。"),
                    ("Wake up!", "起きろ！")
                 ], ipa: "/wˈeɪk ˈʌp/")
        ]
    }

    // MARK: - テック・ネット (10)

    private static var tech: [Word] {
        [
            make("download", "transfer a file to your device",
                 "ダウンロードする",
                 useCases: ["アプリやファイルを取得するとき"],
                 examples: [
                    ("Did you download the app?", "アプリダウンロードした？"),
                    ("It's downloading now.", "今ダウンロード中。")
                 ], ipa: "/dˈaʊnləʊd/"),
            make("upload", "send a file from your device",
                 "アップロードする",
                 useCases: ["ファイルやデータを送るとき"],
                 examples: [
                    ("I'll upload it later.", "あとでアップする。"),
                    ("Upload finished.", "アップロード終わった。")
                 ], ipa: "/ˈʌpləʊd/"),
            make("log in", "sign into an account",
                 "ログインする",
                 useCases: ["アカウントにアクセスするとき"],
                 examples: [
                    ("I can't log in.", "ログインできない。"),
                    ("Just log in here.", "ここでログインして。")
                 ], ipa: "/lˈɒɡ ˈɪn/"),
            make("sign up", "create a new account",
                 "登録する・サインアップする",
                 useCases: ["新規アカウント作成のとき"],
                 examples: [
                    ("Did you sign up?", "登録した？"),
                    ("Sign up for free.", "無料登録できるよ。")
                 ], ipa: "/sˈaɪn ˈʌp/"),
            make("update", "make something more current",
                 "アップデート・更新する",
                 useCases: ["ソフトの更新の話", "近況の最新情報を伝えるとき"],
                 examples: [
                    ("Update your app.", "アプリ更新して。"),
                    ("Got an update?", "なんか進捗ある？")
                 ], ipa: "/ˈʌpdeɪt/"),
            make("crash", "stop working unexpectedly",
                 "クラッシュする・落ちる",
                 useCases: ["アプリやPCが落ちたとき"],
                 examples: [
                    ("My app keeps crashing.", "アプリよく落ちる。"),
                    ("The system crashed.", "システムが落ちた。")
                 ], ipa: "/kɹˈæʃ/"),
            make("swipe", "drag your finger across the screen",
                 "スワイプする",
                 useCases: ["スマホの操作を伝えるとき"],
                 examples: [
                    ("Swipe right to like.", "右にスワイプでいいね。"),
                    ("Just swipe up.", "上にスワイプして。")
                 ], ipa: "/swˈaɪp/"),
            make("settings", "options to control the app/device",
                 "設定",
                 useCases: ["アプリやデバイスの設定を確認するとき"],
                 examples: [
                    ("Check your settings.", "設定見て。"),
                    ("It's in the settings.", "設定の中にあるよ。")
                 ], ipa: "/sˈɛtɪŋz/"),
            make("backup", "a copy of data for safety",
                 "バックアップ",
                 useCases: ["データを保存するとき"],
                 examples: [
                    ("Did you back up your phone?", "携帯バックアップ取った？"),
                    ("I lost the backup.", "バックアップ消えた。")
                 ], ipa: "/bˈækʌp/"),
            make("notification", "an alert from an app",
                 "通知",
                 useCases: ["通知設定や通知音について話すとき"],
                 examples: [
                    ("Turn off notifications.", "通知切って。"),
                    ("I missed your notification.", "通知見落とした。")
                 ], ipa: "/nˌəʊtɪfɪkˈeɪʃən/")
        ]
    }

    // MARK: - 時間・頻度 (10)

    private static var timeAndFrequency: [Word] {
        [
            make("as soon as", "immediately when something happens",
                 "〜したらすぐに",
                 useCases: ["何かが終わり次第すぐにと伝えるとき"],
                 examples: [
                    ("Call me as soon as you arrive.", "着いたらすぐ電話して。"),
                    ("I'll do it as soon as I can.", "できる限りすぐやる。")
                 ], ipa: "/æz sˈuːn æz/"),
            make("meanwhile", "at the same time",
                 "その間に・一方で",
                 useCases: ["並行して別のことが起きていると伝えるとき"],
                 examples: [
                    ("I cooked. Meanwhile, she set the table.", "料理してる間に彼女がテーブル準備した。"),
                    ("Meanwhile, let's wait.", "とりあえず待とう。")
                 ], ipa: "/mˈiːnwaɪl/"),
            make("these days", "currently; in the recent period",
                 "最近・このごろ",
                 useCases: ["近況を伝えるとき"],
                 examples: [
                    ("I've been busy these days.", "最近忙しい。"),
                    ("It's hot these days.", "最近暑い。")
                 ], ipa: "/ðiːz dˈeɪz/"),
            make("the other day", "recently in the past",
                 "先日・この前",
                 useCases: ["過去のちょっと前の出来事を話すとき"],
                 examples: [
                    ("I saw him the other day.", "この前彼に会った。"),
                    ("The other day, I went hiking.", "先日ハイキング行った。")
                 ], ipa: "/ðɪ ˈʌðɐ dˈeɪ/"),
            make("in a row", "consecutively",
                 "連続して・続けて",
                 useCases: ["連続記録について話すとき"],
                 examples: [
                    ("Three days in a row.", "3日連続。"),
                    ("I won 5 in a row.", "5回連続で勝った。")
                 ], ipa: "/ˌɪnɐ ɹˈəʊ/"),
            make("from now on", "starting at this moment",
                 "今後は・これから先",
                 useCases: ["習慣を変えると宣言するとき"],
                 examples: [
                    ("From now on, I'll be early.", "これからは早めに行く。"),
                    ("From now on, no junk food.", "これからジャンクフード禁止。")
                 ], ipa: "/fɹɒm nˈaʊ ˈɒn/"),
            make("a while ago", "some time in the past",
                 "少し前に・しばらく前に",
                 useCases: ["少し前の出来事を伝えるとき"],
                 examples: [
                    ("She left a while ago.", "彼女ちょっと前に出た。"),
                    ("I texted you a while ago.", "少し前にメッセージ送ったよ。")
                 ], ipa: "/ɐ wˈaɪl ɐɡˈəʊ/"),
            make("any minute now", "very soon",
                 "今にも・もうすぐ",
                 useCases: ["何かが起きる直前に"],
                 examples: [
                    ("He should be here any minute now.", "彼すぐ来るはず。"),
                    ("It'll start any minute now.", "今にも始まる。")
                 ], ipa: "/ˌɛnɪ mˈɪnɪt nˈaʊ/"),
            make("every now and then", "occasionally",
                 "時々・たまに",
                 useCases: ["たまに起きることを話すとき"],
                 examples: [
                    ("I see her every now and then.", "彼女には時々会う。"),
                    ("Every now and then I cook.", "たまに料理する。")
                 ], ipa: "/ˈɛvɹɪ nˈaʊ ænd ðˈɛn/"),
            make("way too", "excessively",
                 "あまりにも〜すぎる",
                 useCases: ["強調して文句や驚きを言うとき"],
                 examples: [
                    ("It's way too cold.", "寒すぎ。"),
                    ("Way too expensive.", "高すぎ。")
                 ], ipa: "/wˈeɪ tˈuː/")
        ]
    }

    // MARK: - コミュニケーション・意見 (10)

    private static var communication: [Word] {
        [
            make("agree with", "share the same opinion as",
                 "〜に同意する・賛成する",
                 useCases: ["相手の意見に賛成するとき"],
                 examples: [
                    ("I agree with you.", "君に賛成。"),
                    ("She agrees with me.", "彼女も同意してる。")
                 ], ipa: "/ɐɡɹˈiː wɪð/"),
            make("disagree", "have a different opinion",
                 "反対する・同意しない",
                 useCases: ["反対意見を述べるとき"],
                 examples: [
                    ("I disagree, honestly.", "正直反対だな。"),
                    ("They disagreed on everything.", "彼ら全部で意見合わなかった。")
                 ], ipa: "/dˌɪsɐɡɹˈiː/"),
            make("convince", "make someone believe or agree",
                 "説得する・納得させる",
                 useCases: ["相手を説得する場面で"],
                 examples: [
                    ("I convinced her to come.", "彼女説得して連れてきた。"),
                    ("Convince me.", "納得させて。")
                 ], ipa: "/kənvˈɪns/"),
            make("argue", "exchange opposing views; quarrel",
                 "議論する・言い争う",
                 useCases: ["口論や議論を表すとき"],
                 examples: [
                    ("They were arguing again.", "また言い合いしてた。"),
                    ("Don't argue with me.", "言い返さないで。")
                 ], ipa: "/ˈɑːɡjuː/"),
            make("complain", "express dissatisfaction",
                 "文句を言う・不満を述べる",
                 useCases: ["不満を述べるとき"],
                 examples: [
                    ("Stop complaining.", "文句言うのやめて。"),
                    ("She complained about the food.", "彼女料理に文句言ってた。")
                 ], ipa: "/kəmplˈeɪn/"),
            make("explain", "make something clear",
                 "説明する",
                 useCases: ["何かを分かりやすく伝えるとき"],
                 examples: [
                    ("Can you explain it?", "説明してくれる？"),
                    ("Let me explain.", "説明させて。")
                 ], ipa: "/ɪksplˈeɪn/"),
            make("mention", "refer to something briefly",
                 "ちょっと触れる・言及する",
                 useCases: ["話題にちらっと触れるとき"],
                 examples: [
                    ("Did she mention it?", "彼女それ言ってた？"),
                    ("Just mentioned it briefly.", "ちらっと言っただけ。")
                 ], ipa: "/mˈɛnʃən/"),
            make("reply", "respond to a message",
                 "返信する・返事する",
                 useCases: ["メッセージや問い合わせに返事するとき"],
                 examples: [
                    ("I'll reply later.", "あとで返信する。"),
                    ("She didn't reply.", "彼女返事くれなかった。")
                 ], ipa: "/ɹɪplˈaɪ/"),
            make("swear", "promise strongly; or curse",
                 "誓う・罵り言葉を使う",
                 useCases: ["強く約束するとき", "口の悪さを注意する場面"],
                 examples: [
                    ("I swear I didn't do it.", "やってないって誓う。"),
                    ("Don't swear.", "口悪くしないで。")
                 ], ipa: "/swˈeə/"),
            make("whisper", "speak very quietly",
                 "ささやく・小声で話す",
                 useCases: ["小声で話すとき"],
                 examples: [
                    ("She whispered something.", "彼女何かささやいた。"),
                    ("Why are you whispering?", "なんでひそひそ話してるの？")
                 ], ipa: "/wˈɪspɐ/")
        ]
    }

    // MARK: - 日常動詞・名詞 (5)

    private static var dailyCore: [Word] {
        [
            make("borrow", "take with permission to return later",
                 "借りる",
                 useCases: ["人から物を借りるとき"],
                 examples: [
                    ("Can I borrow your pen?", "ペン借りていい？"),
                    ("I borrowed his book.", "彼の本借りた。")
                 ], ipa: "/bˈɒɹəʊ/"),
            make("lend", "give with the expectation of return",
                 "貸す",
                 useCases: ["人に物を貸すとき"],
                 examples: [
                    ("I'll lend it to you.", "貸してあげるよ。"),
                    ("Can you lend me $5?", "5ドル貸してくれる？")
                 ], ipa: "/lˈɛnd/"),
            make("return", "give back; come back",
                 "返す・返却する・戻る",
                 useCases: ["借りた物を戻すとき", "店に返品するとき"],
                 examples: [
                    ("I'll return it tomorrow.", "明日返す。"),
                    ("Returned the book.", "本返した。")
                 ], ipa: "/ɹɪtˈɜːn/"),
            make("share", "use or have something jointly",
                 "共有する・分け合う",
                 useCases: ["物や情報をシェアするとき"],
                 examples: [
                    ("Let's share the pizza.", "ピザシェアしよう。"),
                    ("Share the link.", "リンク共有して。")
                 ], ipa: "/ʃˈeə/"),
            make("reach", "get in touch with; arrive at",
                 "連絡を取る・到達する",
                 useCases: ["連絡が取れるか確認するとき", "目的地に着く場面で"],
                 examples: [
                    ("I couldn't reach her.", "彼女に連絡取れなかった。"),
                    ("We finally reached the top.", "ついに頂上に着いた。")
                 ], ipa: "/ɹˈiːtʃ/")
        ]
    }

    // MARK: - 句動詞（追加 30）

    private static var extraPhrasalVerbs: [Word] {
        [
            make("knock it off", "stop doing something annoying",
                 "やめろ・いい加減にしろ",
                 useCases: ["相手の悪ふざけを止めるとき"],
                 examples: [
                    ("Knock it off, you two!", "二人ともいい加減にして！"),
                    ("Knock it off, that's not funny.", "やめろよ、面白くない。")
                 ], ipa: "/nˈɒk ɪt ˈɒf/"),
            make("rule out", "exclude as a possibility",
                 "除外する・可能性を排除する",
                 useCases: ["選択肢から外すとき", "原因を絞り込むとき"],
                 examples: [
                    ("Let's rule out food poisoning first.", "まず食中毒は除外しよう。"),
                    ("I wouldn't rule it out.", "可能性は否定しないよ。")
                 ], ipa: "/ɹˈuːl ˈaʊt/"),
            make("bring about", "cause something to happen",
                 "引き起こす・もたらす",
                 useCases: ["変化や結果を引き起こすとき"],
                 examples: [
                    ("Tech brought about huge change.", "テクノロジーが大きな変化をもたらした。"),
                    ("It brought about a new era.", "新しい時代をもたらした。")
                 ], ipa: "/bɹˈɪŋ ɐbˈaʊt/"),
            make("carry on", "continue doing something",
                 "続ける",
                 useCases: ["作業を続けてと伝えるとき", "継続を促すとき"],
                 examples: [
                    ("Carry on with what you were doing.", "やってたこと続けて。"),
                    ("Just carry on, I'll catch up.", "先進んで、追いつくから。")
                 ], ipa: "/kˈæɹɪ ˈɒn/"),
            make("look after", "take care of someone or something",
                 "世話をする・面倒を見る",
                 useCases: ["子どもやペットの世話", "誰かのケアを頼むとき"],
                 examples: [
                    ("Can you look after my dog?", "うちの犬の世話お願いできる？"),
                    ("She looks after her mom.", "彼女はお母さんの世話してる。")
                 ], ipa: "/lˈʊk ˈɑːftɐ/"),
            make("look up", "search for information; raise your eyes",
                 "調べる・見上げる",
                 useCases: ["辞書やネットで情報を調べるとき", "上を見上げる動作"],
                 examples: [
                    ("Look it up online.", "ネットで調べて。"),
                    ("Look up at the stars.", "星を見上げてみて。")
                 ], ipa: "/lˈʊk ˈʌp/"),
            make("look down on", "regard as inferior",
                 "見下す",
                 useCases: ["他人を軽く扱う態度を表すとき"],
                 examples: [
                    ("Don't look down on him.", "彼を見下さないで。"),
                    ("She looks down on us.", "彼女は私たちを見下してる。")
                 ], ipa: "/lˈʊk dˌaʊn ˈɒn/"),
            make("take after", "resemble a family member",
                 "（家族に）似ている",
                 useCases: ["親や親戚に似ていると言うとき"],
                 examples: [
                    ("She takes after her mom.", "彼女はお母さん似だ。"),
                    ("You really take after your dad.", "君、お父さんにそっくり。")
                 ], ipa: "/tˈeɪk ˈɑːftɐ/"),
            make("take in", "understand; absorb; let in",
                 "理解する・受け入れる",
                 useCases: ["情報を頭に入れるとき", "誰かを家に迎え入れるとき"],
                 examples: [
                    ("Hard to take in all at once.", "一度に全部理解するのは難しい。"),
                    ("They took in a stray cat.", "彼ら、野良猫を引き取った。")
                 ], ipa: "/tˈeɪk ˈɪn/"),
            make("take off", "depart; remove; gain popularity",
                 "離陸する・脱ぐ・人気が出る",
                 useCases: ["飛行機の出発", "服を脱ぐとき", "ヒットする話"],
                 examples: [
                    ("The flight just took off.", "便、たった今離陸した。"),
                    ("Take off your shoes.", "靴脱いで。")
                 ], ipa: "/tˈeɪk ˈɒf/"),
            make("take on", "accept a task or challenge",
                 "引き受ける・挑む",
                 useCases: ["新しい仕事を引き受けるとき"],
                 examples: [
                    ("She took on the project.", "彼女、その案件引き受けた。"),
                    ("Take on the challenge.", "その挑戦受けて立てよ。")
                 ], ipa: "/tˈeɪk ˈɒn/"),
            make("take up", "start a hobby; occupy space or time",
                 "始める（趣味を）・占める",
                 useCases: ["新しい趣味を始める話", "場所や時間を取るとき"],
                 examples: [
                    ("I took up yoga.", "ヨガ始めた。"),
                    ("This takes up too much room.", "これ場所取りすぎ。")
                 ], ipa: "/tˈeɪk ˈʌp/"),
            make("put up with", "tolerate something annoying",
                 "我慢する・耐える",
                 useCases: ["不快なことを我慢する話"],
                 examples: [
                    ("I can't put up with the noise.", "この騒音は我慢できない。"),
                    ("She puts up with a lot.", "彼女はいろいろ我慢してる。")
                 ], ipa: "/pˌʊt ˈʌp wɪð/"),
            make("put down", "place down; criticize harshly",
                 "置く・けなす",
                 useCases: ["物を下に置くとき", "誰かを馬鹿にするとき"],
                 examples: [
                    ("Put it down here.", "ここに置いて。"),
                    ("Stop putting him down.", "彼をけなすのやめて。")
                 ], ipa: "/pˌʊt dˈaʊn/"),
            make("put together", "assemble; organize",
                 "組み立てる・まとめる",
                 useCases: ["家具を組み立てる", "資料や計画をまとめる"],
                 examples: [
                    ("I put together a slideshow.", "スライド作った。"),
                    ("Help me put this together.", "これ組み立てるの手伝って。")
                 ], ipa: "/pˌʊt təɡˈɛðɐ/"),
            make("put aside", "set apart; save for later",
                 "脇に置く・取っておく",
                 useCases: ["後で使う物を取っておくとき", "感情を一旦置いておくとき"],
                 examples: [
                    ("Put aside some money each month.", "毎月少しずつ貯金してる。"),
                    ("Let's put that aside for now.", "今はそれ脇に置いとこう。")
                 ], ipa: "/pˌʊt ɐsˈaɪd/"),
            make("get over", "recover from something",
                 "乗り越える・克服する",
                 useCases: ["失恋や病気から立ち直る話"],
                 examples: [
                    ("Get over it!", "もう忘れなよ。"),
                    ("I'm finally getting over the flu.", "やっとインフルから回復してきた。")
                 ], ipa: "/ɡɛt ˈəʊvɐ/"),
            make("get through", "finish or survive a difficult thing",
                 "やり遂げる・通り抜ける",
                 useCases: ["大変な期間を乗り切る話"],
                 examples: [
                    ("We got through the week.", "なんとか今週乗り切った。"),
                    ("I'll get through this somehow.", "なんとかこれを乗り切る。")
                 ], ipa: "/ɡɛt θɹˈuː/"),
            make("get by", "manage to survive with what you have",
                 "何とかやっていく",
                 useCases: ["最低限の生活でしのぐ話"],
                 examples: [
                    ("We get by on a small budget.", "少ない予算でやりくりしてる。"),
                    ("I'm just getting by.", "なんとか食いつないでる。")
                 ], ipa: "/ɡɛt bˈaɪ/"),
            make("get ahead", "advance or succeed",
                 "先に進む・出世する",
                 useCases: ["キャリアで成功する話"],
                 examples: [
                    ("She works hard to get ahead.", "彼女は出世のために頑張ってる。"),
                    ("Just trying to get ahead.", "前に進もうとしてるだけ。")
                 ], ipa: "/ɡɛt ɐhˈɛd/"),
            make("make out", "understand; perceive",
                 "理解する・見分ける",
                 useCases: ["小さな声や字を読み取る話"],
                 examples: [
                    ("I can't make out what he's saying.", "彼が何言ってるか分からない。"),
                    ("Can you make out the sign?", "あの標識読める？")
                 ], ipa: "/mˌeɪk ˈaʊt/"),
            make("make do", "manage with what you have",
                 "間に合わせる・代用する",
                 useCases: ["足りない物で済ますとき"],
                 examples: [
                    ("We'll have to make do.", "間に合わせるしかない。"),
                    ("Make do with what you've got.", "あるもので何とかして。")
                 ], ipa: "/mˌeɪk dˈuː/"),
            make("wear out", "exhaust; become worn",
                 "すり減らす・疲れさせる",
                 useCases: ["疲れ切ったとき", "靴や服が古くなるとき"],
                 examples: [
                    ("The kids wore me out.", "子どもたちにヘトヘトにされた。"),
                    ("My shoes are worn out.", "靴がボロボロだ。")
                 ], ipa: "/wˈeəɹ ˈaʊt/"),
            make("carry through", "complete a task to the end",
                 "やり遂げる",
                 useCases: ["最後までやり通すとき"],
                 examples: [
                    ("She carried it through.", "彼女は最後までやり遂げた。"),
                    ("Carry the plan through.", "計画を最後までやり通して。")
                 ], ipa: "/kˈæɹɪ θɹˈuː/"),
            make("pull through", "survive a tough situation",
                 "困難を乗り越える",
                 useCases: ["病気や危機から回復する話"],
                 examples: [
                    ("He pulled through the surgery.", "彼は手術を乗り越えた。"),
                    ("We'll pull through this.", "これ乗り越えられるよ。")
                 ], ipa: "/pˈʊl θɹˈuː/"),
            make("pull up", "stop a vehicle; bring up",
                 "車を停める・引き上げる",
                 useCases: ["車を寄せて停めるとき", "椅子を寄せるとき"],
                 examples: [
                    ("Pull up over there.", "あそこに停めて。"),
                    ("Pull up a chair.", "椅子持ってきて座って。")
                 ], ipa: "/pˈʊl ˈʌp/"),
            make("pull together", "cooperate as a team",
                 "力を合わせる",
                 useCases: ["チームで頑張る話"],
                 examples: [
                    ("Let's pull together.", "みんなで力合わせよう。"),
                    ("They pulled together to win.", "彼らは力を合わせて勝った。")
                 ], ipa: "/pˈʊl təɡˈɛðɐ/"),
            make("set aside", "save or reserve",
                 "取っておく・脇に置く",
                 useCases: ["お金や時間を確保する話"],
                 examples: [
                    ("Set aside some time.", "ちょっと時間取っといて。"),
                    ("I set aside money for travel.", "旅行用にお金取ってある。")
                 ], ipa: "/sˈɛt ɐsˈaɪd/"),
            make("set off", "depart; trigger something",
                 "出発する・引き起こす",
                 useCases: ["旅行に出発する話", "アラームを鳴らす場面"],
                 examples: [
                    ("We set off at dawn.", "夜明けに出発した。"),
                    ("That set off the alarm.", "それでアラーム鳴った。")
                 ], ipa: "/sˈɛt ˈɒf/"),
            make("set out", "begin a journey or task",
                 "出発する・着手する",
                 useCases: ["何かに取り組み始めるとき"],
                 examples: [
                    ("We set out to find a solution.", "解決策を探し始めた。"),
                    ("They set out early.", "彼らは早めに出発した。")
                 ], ipa: "/sˈɛt ˈaʊt/")
        ]
    }

    // MARK: - イディオム（追加 25）

    private static var extraIdioms: [Word] {
        [
            make("a piece of work", "a difficult or annoying person",
                 "困った人・厄介な物",
                 useCases: ["扱いにくい人について話すとき"],
                 examples: [
                    ("That guy is a piece of work.", "あいつ、ほんと厄介。"),
                    ("She's quite a piece of work.", "彼女はかなり面倒な人。")
                 ], ipa: "/ɐ pˈiːs ɒv wˈɜːk/"),
            make("a tough cookie", "a strong, resilient person",
                 "タフな人・芯の強い人",
                 useCases: ["逆境に強い人を表すとき"],
                 examples: [
                    ("She's a tough cookie.", "彼女は芯が強い。"),
                    ("Don't worry, he's a tough cookie.", "心配しないで、彼タフだから。")
                 ], ipa: "/ɐ tˈʌf kˈʊkɪ/"),
            make("the last straw", "the final irritation that causes a reaction",
                 "我慢の限界",
                 useCases: ["もう耐えられないと言うとき"],
                 examples: [
                    ("That was the last straw.", "もう限界。"),
                    ("This is the last straw for me.", "これが最後の堪忍袋の緒だ。")
                 ], ipa: "/ðə lˈɑːst stɹˈɔː/"),
            make("a wild goose chase", "a pointless pursuit",
                 "無駄足・的外れな追跡",
                 useCases: ["徒労に終わった追跡を表すとき"],
                 examples: [
                    ("It was a wild goose chase.", "完全に無駄足だった。"),
                    ("He sent us on a wild goose chase.", "彼に振り回された。")
                 ], ipa: "/ɐ wˈaɪld ɡˈuːs tʃˈeɪs/"),
            make("add fuel to the fire", "make a bad situation worse",
                 "火に油を注ぐ",
                 useCases: ["状況を悪化させる発言や行動"],
                 examples: [
                    ("That just added fuel to the fire.", "それで火に油注いだ。"),
                    ("Don't add fuel to the fire.", "火に油注ぐようなことしないで。")
                 ], ipa: "/ˈæd fjˈuːəl tə ðə fˈaɪə/"),
            make("let bygones be bygones", "let the past be the past",
                 "過去のことは水に流す",
                 useCases: ["仲直りや和解の場面で"],
                 examples: [
                    ("Let's let bygones be bygones.", "過去のことは水に流そう。"),
                    ("Just let bygones be bygones.", "もう昔のことだから。")
                 ], ipa: "/lˈɛt bˈaɪɡɒnz biː bˈaɪɡɒnz/"),
            make("water under the bridge", "something past and forgotten",
                 "過ぎたこと",
                 useCases: ["昔のトラブルを蒸し返さないとき"],
                 examples: [
                    ("It's all water under the bridge.", "全部もう過ぎたことだ。"),
                    ("That's water under the bridge now.", "それはもう昔の話。")
                 ], ipa: "/wˈɔːtɐɹ ˌʌndɐ ðə bɹˈɪdʒ/"),
            make("don't judge a book by its cover", "don't judge by appearance",
                 "見かけで判断するな",
                 useCases: ["第一印象で人を判断しないよう諭すとき"],
                 examples: [
                    ("Don't judge a book by its cover.", "見た目で判断しないで。"),
                    ("Hey, don't judge a book by its cover.", "見かけだけで決めるなよ。")
                 ], ipa: "/dˈəʊnt dʒˈʌdʒ ɐ bˈʊk baɪ ɪts kˈʌvɐ/"),
            make("the apple of my eye", "someone you cherish",
                 "大切な人・宝物",
                 useCases: ["最愛の人を表すとき"],
                 examples: [
                    ("She's the apple of my eye.", "彼女は私の宝物。"),
                    ("He's the apple of his mom's eye.", "彼はお母さんの宝物だ。")
                 ], ipa: "/ðɪ ˈæpəl ɒv maɪ ˈaɪ/"),
            make("break the news", "share important news",
                 "ニュースを伝える",
                 useCases: ["重要な知らせを切り出すとき"],
                 examples: [
                    ("I had to break the news.", "知らせを伝えるしかなかった。"),
                    ("Who's gonna break the news?", "誰が伝える？")
                 ], ipa: "/bɹˈeɪk ðə njˈuːz/"),
            make("caught red-handed", "caught in the act",
                 "現行犯で捕まる",
                 useCases: ["悪いことをしている最中に見つかる場面"],
                 examples: [
                    ("They caught him red-handed.", "彼、現行犯で捕まった。"),
                    ("Caught red-handed!", "現行犯！")
                 ], ipa: "/kˈɔːt ɹˈɛdhˈændɪd/"),
            make("once and for all", "definitively; finally",
                 "きっぱりと・最終的に",
                 useCases: ["はっきり決着をつけるとき"],
                 examples: [
                    ("Let's settle this once and for all.", "これ、はっきり決着つけよう。"),
                    ("Once and for all, no.", "もう最後、ノーだ。")
                 ], ipa: "/wˈʌns ænd fɔːɹ ˈɔːl/"),
            make("out of the woods", "past a difficult phase",
                 "危機を脱した",
                 useCases: ["困難な状況を抜けた話"],
                 examples: [
                    ("We're not out of the woods yet.", "まだ油断はできない。"),
                    ("He's out of the woods.", "彼はもう大丈夫。")
                 ], ipa: "/ˌaʊtəv ðə wˈʊdz/"),
            make("off the hook", "freed from responsibility",
                 "責任を免れた",
                 useCases: ["面倒事から逃れた話"],
                 examples: [
                    ("Looks like I'm off the hook.", "私はお咎めなしみたい。"),
                    ("You're off the hook this time.", "今回は許してあげる。")
                 ], ipa: "/ˈɒf ðə hˈʊk/"),
            make("on thin ice", "in a risky situation",
                 "危険な状況にある",
                 useCases: ["失敗が許されない状況の話"],
                 examples: [
                    ("You're on thin ice.", "君、もう後がないよ。"),
                    ("I'm on thin ice with my boss.", "上司との関係がヤバい。")
                 ], ipa: "/ˌɒn θˈɪn ˈaɪs/"),
            make("in the dark", "uninformed",
                 "知らされていない",
                 useCases: ["情報共有されていないと不満を言うとき"],
                 examples: [
                    ("I'm totally in the dark.", "全然知らされてない。"),
                    ("They kept us in the dark.", "彼らは私たちに知らせなかった。")
                 ], ipa: "/ɪnðə dˈɑːk/"),
            make("walking on eggshells", "being very careful around someone",
                 "慎重に振る舞う・腫れ物に触るよう",
                 useCases: ["気難しい人に気を遣う話"],
                 examples: [
                    ("I'm walking on eggshells around her.", "彼女に気を遣いまくり。"),
                    ("Stop walking on eggshells.", "そんな気を遣わなくていいよ。")
                 ], ipa: "/wˈɔːkɪŋ ˌɒn ˈɛɡʃɛlz/"),
            make("rain check", "a deferred invitation",
                 "また今度・延期",
                 useCases: ["誘いを断りつつ次回に約束するとき"],
                 examples: [
                    ("Can I take a rain check?", "また今度でもいい？"),
                    ("I'll take a rain check.", "また誘って。")
                 ], ipa: "/ɹˈeɪn tʃˈɛk/"),
            make("a long shot", "an unlikely possibility",
                 "望み薄・一か八か",
                 useCases: ["可能性が低いが試す話"],
                 examples: [
                    ("It's a long shot.", "可能性低いけど。"),
                    ("That's a long shot at best.", "一か八かだね。")
                 ], ipa: "/ɐ lˈɒŋ ʃˈɒt/"),
            make("kill two birds with one stone", "achieve two goals at once",
                 "一石二鳥",
                 useCases: ["1つの行動で2つの効果を狙うとき"],
                 examples: [
                    ("Kill two birds with one stone.", "一石二鳥だね。"),
                    ("Let's kill two birds with one stone.", "ついでに済ませよう。")
                 ], ipa: "/kˈɪl tˈuː bˈɜːdz wɪð wˈɒn stˈəʊn/"),
            make("the tip of the iceberg", "a small visible part of a bigger problem",
                 "氷山の一角",
                 useCases: ["問題の一部しか見えていない話"],
                 examples: [
                    ("That's just the tip of the iceberg.", "それは氷山の一角だ。"),
                    ("Tip of the iceberg, honestly.", "正直、氷山の一角。")
                 ], ipa: "/ðə tˈɪp ɒvðɪ ˈaɪsbɜːɡ/"),
            make("a drop in the bucket", "a tiny insignificant amount",
                 "焼け石に水",
                 useCases: ["対策が小さすぎると評するとき"],
                 examples: [
                    ("It's just a drop in the bucket.", "焼け石に水だ。"),
                    ("That's a drop in the bucket.", "そんなの全然足りない。")
                 ], ipa: "/ɐ dɹˈɒp ɪnðə bˈʌkɪt/"),
            make("easier said than done", "talking is easier than doing",
                 "言うは易し",
                 useCases: ["簡単に言うけど実行は難しいと反論するとき"],
                 examples: [
                    ("Easier said than done.", "言うのは簡単だよね。"),
                    ("Yeah, easier said than done.", "うん、それ言うほど簡単じゃない。")
                 ], ipa: "/ˈiːzɪɐ sˈɛd ðɐn dˈʌn/"),
            make("actions speak louder than words", "what you do matters more than what you say",
                 "行動は言葉より雄弁",
                 useCases: ["口だけの人に対して使うとき"],
                 examples: [
                    ("Actions speak louder than words.", "行動が大事だよ。"),
                    ("Remember, actions speak louder than words.", "言葉より行動だよ。")
                 ], ipa: "/ˈækʃənz spˈiːk lˈaʊdɐ ðɐn wˈɜːdz/"),
            make("when pigs fly", "something that will never happen",
                 "そんなことありえない",
                 useCases: ["絶対起こらないと冗談で言うとき"],
                 examples: [
                    ("Yeah, when pigs fly.", "うん、そんなのありえない。"),
                    ("He'll apologize when pigs fly.", "彼が謝るなんて天地がひっくり返ってもない。")
                 ], ipa: "/wˌɛn pˈɪɡz flˈaɪ/")
        ]
    }

    // MARK: - 形容詞・状態表現（追加 20）

    private static var extraAdjectives: [Word] {
        [
            make("fed up", "annoyed and impatient",
                 "うんざりした",
                 useCases: ["我慢の限界に達した話"],
                 examples: [
                    ("I'm fed up with this.", "もうこれにうんざり。"),
                    ("She's fed up with him.", "彼女は彼にうんざり。")
                 ], ipa: "/fˈɛd ˈʌp/"),
            make("worn out", "very tired",
                 "疲れ果てた・くたくた",
                 useCases: ["疲労困憊を表すとき"],
                 examples: [
                    ("I'm worn out.", "もうクタクタ。"),
                    ("Worn out from work.", "仕事で疲れ果てた。")
                 ], ipa: "/wˈɔːn ˈaʊt/"),
            make("stuck up", "arrogant; snobbish",
                 "高慢な・お高くとまった",
                 useCases: ["態度が偉そうな人を批評するとき"],
                 examples: [
                    ("She's so stuck up.", "彼女、すごい上から目線。"),
                    ("Don't be stuck up.", "そんなお高く止まらないで。")
                 ], ipa: "/stˈʌk ˈʌp/"),
            make("laid back", "relaxed; easygoing",
                 "のんびりした",
                 useCases: ["リラックスした性格を表すとき"],
                 examples: [
                    ("He's super laid back.", "彼、めっちゃのんびりしてる。"),
                    ("A laid back vibe.", "のんびりした雰囲気。")
                 ], ipa: "/lˈeɪd bˈæk/"),
            make("uptight", "tense; overly strict",
                 "神経質な・堅苦しい",
                 useCases: ["緊張しすぎた態度を表すとき"],
                 examples: [
                    ("Don't be so uptight.", "そんなに固くならないで。"),
                    ("He's pretty uptight.", "彼ちょっと堅すぎ。")
                 ], ipa: "/ʌptˈaɪt/"),
            make("easygoing", "relaxed and tolerant",
                 "大らかな・気楽な",
                 useCases: ["性格を褒めるとき"],
                 examples: [
                    ("She's so easygoing.", "彼女、すごく大らか。"),
                    ("Easygoing personality.", "気楽な性格だよ。")
                 ], ipa: "/ˈiːzɪɡˌəʊɪŋ/"),
            make("outgoing", "sociable; extroverted",
                 "社交的な",
                 useCases: ["人との交流が好きな性格を表すとき"],
                 examples: [
                    ("She's really outgoing.", "彼女、すごく社交的。"),
                    ("Are you outgoing?", "社交的なほう？")
                 ], ipa: "/aʊtɡˈəʊɪŋ/"),
            make("picky", "very selective",
                 "好き嫌いが激しい・うるさい",
                 useCases: ["食べ物や好みのこだわりを表すとき"],
                 examples: [
                    ("He's a picky eater.", "彼は好き嫌い多い。"),
                    ("Don't be so picky.", "そんなにうるさく言うな。")
                 ], ipa: "/pˈɪkɪ/"),
            make("stubborn", "refusing to change one's mind",
                 "頑固な",
                 useCases: ["意見を曲げない人を表すとき"],
                 examples: [
                    ("He's so stubborn.", "彼、頑固すぎ。"),
                    ("Don't be stubborn.", "頑固にならないで。")
                 ], ipa: "/stˈʌbən/"),
            make("humble", "modest; not arrogant",
                 "謙虚な",
                 useCases: ["控えめな人を褒めるとき"],
                 examples: [
                    ("She's really humble.", "彼女はすごく謙虚。"),
                    ("Stay humble.", "謙虚でいて。")
                 ], ipa: "/hˈʌmbəl/"),
            make("brave", "showing courage",
                 "勇敢な・勇気のある",
                 useCases: ["勇気ある行動を称えるとき"],
                 examples: [
                    ("That was brave of you.", "勇敢だったね。"),
                    ("Be brave.", "勇気出して。")
                 ], ipa: "/bɹˈeɪv/"),
            make("shy", "reserved around others",
                 "内気な・恥ずかしがり",
                 useCases: ["人見知りを表すとき"],
                 examples: [
                    ("I'm a bit shy.", "ちょっと内気なんだ。"),
                    ("Don't be shy.", "恥ずかしがらないで。")
                 ], ipa: "/ʃˈaɪ/"),
            make("awkward", "uncomfortable; clumsy socially",
                 "気まずい・ぎこちない",
                 useCases: ["変な空気を表すとき", "ぎこちない動作を言うとき"],
                 examples: [
                    ("That was so awkward.", "あれ気まずかった。"),
                    ("It feels awkward.", "なんか気まずい。")
                 ], ipa: "/ˈɔːkwəd/"),
            make("clumsy", "awkward in movement",
                 "不器用な・ドジな",
                 useCases: ["失敗が多い人を表すとき"],
                 examples: [
                    ("Sorry, I'm clumsy.", "ごめん、不器用なんだ。"),
                    ("Clumsy me!", "私ったらドジ！")
                 ], ipa: "/klˈʌmzɪ/"),
            make("mature", "developed; grown up",
                 "成熟した・大人びた",
                 useCases: ["精神的に大人な人を表すとき"],
                 examples: [
                    ("She's so mature for her age.", "彼女、年の割に大人びてる。"),
                    ("That's not very mature.", "それ大人げないよ。")
                 ], ipa: "/mətʃˈɔː/"),
            make("selfish", "thinking only of oneself",
                 "利己的な・自分勝手な",
                 useCases: ["自己中心的な行動を批判するとき"],
                 examples: [
                    ("Don't be selfish.", "自分勝手にならないで。"),
                    ("That's selfish of him.", "彼ったら自己中。")
                 ], ipa: "/sˈɛlfɪʃ/"),
            make("generous", "willing to give",
                 "寛大な・気前のいい",
                 useCases: ["気前よくおごってくれる人を褒めるとき"],
                 examples: [
                    ("That's so generous of you.", "本当に気前いいね。"),
                    ("He's a generous guy.", "彼は気前のいい人。")
                 ], ipa: "/dʒˈɛnəɹəs/"),
            make("reliable", "dependable; trustworthy",
                 "信頼できる",
                 useCases: ["頼れる人を表すとき"],
                 examples: [
                    ("He's super reliable.", "彼はめっちゃ頼れる。"),
                    ("A reliable friend.", "信頼できる友達。")
                 ], ipa: "/ɹɪlˈaɪəbəl/"),
            make("stunning", "extremely impressive or beautiful",
                 "見事な・素晴らしい",
                 useCases: ["美しさや出来栄えを褒めるとき"],
                 examples: [
                    ("You look stunning.", "めっちゃきれい。"),
                    ("Stunning view!", "絶景！")
                 ], ipa: "/stˈʌnɪŋ/"),
            make("decent", "satisfactory; respectable",
                 "まともな・きちんとした",
                 useCases: ["最低限十分な質を表すとき"],
                 examples: [
                    ("That's a decent meal.", "まあまあいい食事。"),
                    ("He's a decent guy.", "彼はちゃんとした人だ。")
                 ], ipa: "/dˈiːsənt/")
        ]
    }

    // MARK: - 会話表現・相づち（追加 15）

    private static var conversationFillers: [Word] {
        [
            make("fair enough", "that's reasonable",
                 "まあそうだね・了解",
                 useCases: ["相手の言い分に納得するとき"],
                 examples: [
                    ("Fair enough.", "まあそうだね。"),
                    ("Fair enough, I get it.", "了解、わかった。")
                 ], ipa: "/fˈeəɹ ɪnˈʌf/"),
            make("suit yourself", "do what you want",
                 "好きにすれば",
                 useCases: ["相手の決定に呆れて任せるとき"],
                 examples: [
                    ("Fine, suit yourself.", "好きにしなよ。"),
                    ("Suit yourself, then.", "じゃあ勝手にして。")
                 ], ipa: "/sˈuːt jɔːsˈɛlf/"),
            make("whatever", "I don't care",
                 "どうでもいい・なんでも",
                 useCases: ["興味がないと示すとき"],
                 examples: [
                    ("Whatever, it doesn't matter.", "別にどうでもいい。"),
                    ("Whatever you want.", "君の好きにして。")
                 ], ipa: "/wɒtˈɛvɐ/"),
            make("says who", "who said that?",
                 "誰がそう言った？",
                 useCases: ["主張に反論するとき"],
                 examples: [
                    ("Says who?", "誰がそう言った？"),
                    ("Yeah, says who?", "は？誰がそう言ったの？")
                 ], ipa: "/sˈɛz hˈuː/"),
            make("for real", "seriously; truly",
                 "マジで・本当に",
                 useCases: ["本気か確認するとき", "強調するとき"],
                 examples: [
                    ("Are you for real?", "マジで言ってる？"),
                    ("For real, it was awesome.", "本当に最高だった。")
                 ], ipa: "/fɔː ɹˈiəl/"),
            make("kind of", "somewhat; a little",
                 "ちょっと・なんとなく",
                 useCases: ["はっきり言わずぼかすとき"],
                 examples: [
                    ("Kind of tired.", "ちょっと疲れた。"),
                    ("It's kind of weird.", "なんか変だよ。")
                 ], ipa: "/kˈaɪnd ɒv/"),
            make("sort of", "somewhat; like",
                 "みたいな・ちょっと",
                 useCases: ["曖昧に表現したいとき"],
                 examples: [
                    ("Sort of, yeah.", "まあ、そんな感じ。"),
                    ("It's sort of like a hat.", "帽子みたいなものだ。")
                 ], ipa: "/sˈɔːt ɒv/"),
            make("and stuff", "and other things",
                 "などなど",
                 useCases: ["列挙の最後に省略するとき"],
                 examples: [
                    ("Snacks, drinks, and stuff.", "お菓子とか飲み物とか。"),
                    ("Books and stuff.", "本とかいろいろ。")
                 ], ipa: "/ænd stˈʌf/"),
            make("or something", "or something like that",
                 "か何か",
                 useCases: ["はっきりしない代替を示すとき"],
                 examples: [
                    ("Coffee or something?", "コーヒーか何か？"),
                    ("She's a doctor or something.", "彼女医者か何かだ。")
                 ], ipa: "/ɔː sˈʌmθɪŋ/"),
            make("you know what", "let me tell you",
                 "あのね・ちょっと聞いて",
                 useCases: ["話を切り出すとき"],
                 examples: [
                    ("You know what, forget it.", "ねえ、もういいや。"),
                    ("You know what? I'm done.", "あのさ、もう無理。")
                 ], ipa: "/juː nˈəʊ wˈɒt/"),
            make("guess what", "I have surprising news",
                 "何だと思う？",
                 useCases: ["驚きの話を切り出すとき"],
                 examples: [
                    ("Guess what! I got the job.", "聞いて！採用された！"),
                    ("Guess what happened.", "何が起きたと思う？")
                 ], ipa: "/ɡˈɛs wˈɒt/"),
            make("here we go", "we're about to start",
                 "さあ始めるよ",
                 useCases: ["始まりの合図として"],
                 examples: [
                    ("Here we go!", "さあ行くぞ！"),
                    ("Okay, here we go.", "よし、始めよう。")
                 ], ipa: "/hˈiə wiː ɡˈəʊ/"),
            make("there you go", "exactly; well done",
                 "そうそう・そんな感じ",
                 useCases: ["相手の理解や成功を称えるとき"],
                 examples: [
                    ("There you go!", "そう、それでいい！"),
                    ("There you go, you did it.", "ほら、できたじゃん。")
                 ], ipa: "/ðeə juː ɡˈəʊ/"),
            make("look here", "hey; listen",
                 "おい・ねえ",
                 useCases: ["注意を引きたいとき", "やや強めに呼びかけるとき"],
                 examples: [
                    ("Look here, I told you no.", "おい、ダメって言っただろ。"),
                    ("Look here, listen up.", "ねえ、ちょっと聞いて。")
                 ], ipa: "/lˈʊk hˈiə/"),
            make("how come", "why",
                 "なんで？",
                 useCases: ["カジュアルに理由を聞くとき"],
                 examples: [
                    ("How come you're late?", "なんで遅れたの？"),
                    ("How come?", "なんで？")
                 ], ipa: "/hˌaʊ kˈʌm/")
        ]
    }

    // MARK: - つなぎ表現・談話標識（追加 10）

    private static var connectives: [Word] {
        [
            make("as it stands", "given the current situation",
                 "現状では",
                 useCases: ["今の状況を踏まえて話すとき"],
                 examples: [
                    ("As it stands, we can't move.", "現状では動けない。"),
                    ("As it stands now, no.", "今のところ無理。")
                 ], ipa: "/æz ɪt stˈændz/"),
            make("at the end of the day", "ultimately",
                 "結局のところ",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("At the end of the day, we tried.", "結局のところ、頑張ったよ。"),
                    ("At the end of the day, it's up to you.", "最終的には君次第だ。")
                 ], ipa: "/æt ðɪ ˈɛnd ɒvðə dˈeɪ/"),
            make("when push comes to shove", "when it really matters",
                 "いざという時",
                 useCases: ["最後の局面の話をするとき"],
                 examples: [
                    ("When push comes to shove, he'll help.", "いざという時、彼は助けてくれる。"),
                    ("When push comes to shove, decide quickly.", "いざとなったら即決して。")
                 ], ipa: "/wˌɛn pˈʊʃ kˈʌmz tə ʃˈʌv/"),
            make("come hell or high water", "no matter what happens",
                 "何があっても",
                 useCases: ["強い決意を表すとき"],
                 examples: [
                    ("I'll be there, come hell or high water.", "何があっても行く。"),
                    ("Come hell or high water, we finish.", "何があってもやり遂げる。")
                 ], ipa: "/kˈʌm hˈɛl ɔː hˈaɪ wˈɔːtɐ/"),
            make("be that as it may", "even if that's true",
                 "それはともかく",
                 useCases: ["話題を切り替えつつ前提は認めるとき"],
                 examples: [
                    ("Be that as it may, we have to go.", "そうかもしれないけど、行かないと。"),
                    ("Be that as it may, I disagree.", "それはともかく、私は反対。")
                 ], ipa: "/biː ðæt æz ɪt mˈeɪ/"),
            make("for what it's worth", "I'm not sure if this helps, but...",
                 "役に立つかわからないけど",
                 useCases: ["控えめに意見を伝えるとき"],
                 examples: [
                    ("For what it's worth, I think you're right.", "参考までに、君が正しいと思うよ。"),
                    ("For what it's worth, sorry.", "気休めだけど、ごめん。")
                 ], ipa: "/fɔː wɒt ɪts wˈɜːθ/"),
            make("to put it mildly", "saying it gently",
                 "控えめに言って",
                 useCases: ["強い表現をやわらげるとき"],
                 examples: [
                    ("It was bad, to put it mildly.", "控えめに言ってひどかった。"),
                    ("To put it mildly, awkward.", "控えめに言って気まずい。")
                 ], ipa: "/tə pˌʊt ɪt mˈaɪldlɪ/"),
            make("to put it bluntly", "speaking frankly",
                 "率直に言って",
                 useCases: ["遠慮なく本音を言うとき"],
                 examples: [
                    ("To put it bluntly, you're wrong.", "率直に言って間違ってる。"),
                    ("To put it bluntly, no.", "はっきり言うと、無理。")
                 ], ipa: "/tə pˌʊt ɪt blˈʌntlɪ/"),
            make("needless to say", "obviously",
                 "言うまでもなく",
                 useCases: ["当然のことを強調するとき"],
                 examples: [
                    ("Needless to say, I was happy.", "言うまでもなく嬉しかった。"),
                    ("Needless to say, it works.", "もちろん、ちゃんと動く。")
                 ], ipa: "/nˈiːdləs tə sˈeɪ/"),
            make("mind you", "by the way; just so you know",
                 "言っとくけど・断っておくが",
                 useCases: ["補足や注意を加えるとき"],
                 examples: [
                    ("Mind you, it wasn't easy.", "言っておくけど、簡単じゃなかった。"),
                    ("It was great, mind you.", "ちなみに最高だったよ。")
                 ], ipa: "/mˈaɪnd juː/")
        ]
    }

    // MARK: - 句動詞（追加 30）

    private static var extraPhrasalVerbs2: [Word] {
        [
            make("wear off", "gradually lose effect",
                 "効果が薄れる",
                 useCases: ["薬や麻酔が切れてくる話", "気持ちが薄れていくとき"],
                 examples: [
                    ("The painkiller's wearing off.", "鎮痛剤の効きが薄れてきた。"),
                    ("The excitement wore off.", "興奮も薄れた。")
                 ], ipa: "/wˈeəɹ ˈɒf/"),
            make("wash up", "clean dishes; or be carried ashore",
                 "洗い物をする・漂着する",
                 useCases: ["食後の片付けの話", "海に漂着した物の話"],
                 examples: [
                    ("I'll wash up after dinner.", "夕食後、洗い物するね。"),
                    ("A bottle washed up on the beach.", "瓶が浜辺に漂着した。")
                 ], ipa: "/wˈɒʃ ˈʌp/"),
            make("wake up to", "become aware of something",
                 "〜に気づく・目覚める",
                 useCases: ["問題の重大さに気づくとき"],
                 examples: [
                    ("People are waking up to climate change.", "みんな気候変動に気づき始めてる。"),
                    ("Wake up to reality.", "現実を見ろ。")
                 ], ipa: "/wˈeɪk ˈʌp tuː/"),
            make("turn up", "appear; increase volume",
                 "現れる・音量を上げる",
                 useCases: ["人が突然来た話", "音量を上げる場面"],
                 examples: [
                    ("She turned up late.", "彼女、遅れて現れた。"),
                    ("Turn up the music.", "音楽の音量上げて。")
                 ], ipa: "/tˈɜːn ˈʌp/"),
            make("turn over", "flip; hand over",
                 "ひっくり返す・引き渡す",
                 useCases: ["物を裏返すとき", "鍵などを引き渡す場面"],
                 examples: [
                    ("Turn the page over.", "ページめくって。"),
                    ("He turned over the keys.", "彼は鍵を渡した。")
                 ], ipa: "/tˈɜːn ˈəʊvɐ/"),
            make("turn against", "become hostile to",
                 "敵対する・反発する",
                 useCases: ["味方が敵に回る場面"],
                 examples: [
                    ("They turned against him.", "彼らは彼に反発した。"),
                    ("Don't turn against me.", "敵に回らないで。")
                 ], ipa: "/tˈɜːn ɐɡˈɛnst/"),
            make("stop by", "make a quick visit",
                 "立ち寄る",
                 useCases: ["軽く寄っていく話"],
                 examples: [
                    ("I'll stop by later.", "あとでちょっと寄るね。"),
                    ("Stop by anytime.", "いつでも寄って。")
                 ], ipa: "/stˈɒp bˈaɪ/"),
            make("stick to", "stay loyal to; cling",
                 "固執する・くっつく",
                 useCases: ["決めたことを守る話"],
                 examples: [
                    ("Stick to the plan.", "計画通りに進めて。"),
                    ("Stick to the rules.", "ルールを守って。")
                 ], ipa: "/stˈɪk tuː/"),
            make("stick with", "continue with the same choice",
                 "そのまま続ける",
                 useCases: ["同じものを使い続ける話"],
                 examples: [
                    ("I'll stick with coffee.", "コーヒーのままでいいや。"),
                    ("Just stick with it.", "そのまま続けて。")
                 ], ipa: "/stˈɪk wɪð/"),
            make("stand by", "wait; support",
                 "待機する・支持する",
                 useCases: ["待機する場面", "誰かを支える話"],
                 examples: [
                    ("Stand by for updates.", "更新を待って。"),
                    ("I stand by him.", "彼を支持する。")
                 ], ipa: "/stˈænd bˈaɪ/"),
            make("stand for", "represent; symbolize",
                 "表す・象徴する",
                 useCases: ["略語の意味を聞くとき"],
                 examples: [
                    ("What does NASA stand for?", "NASAって何の略？"),
                    ("It stands for love.", "それは愛を象徴してる。")
                 ], ipa: "/stˈænd fɔː/"),
            make("stand out", "be noticeable",
                 "目立つ",
                 useCases: ["群衆の中で目立つ話"],
                 examples: [
                    ("She really stands out.", "彼女、すごく目立つ。"),
                    ("This one stands out.", "これは目立つね。")
                 ], ipa: "/stˈænd ˈaʊt/"),
            make("slow down", "reduce speed",
                 "速度を落とす・ゆっくりする",
                 useCases: ["急ぎすぎを止めるとき"],
                 examples: [
                    ("Slow down, you're going too fast.", "落ち着いて、速すぎる。"),
                    ("I need to slow down.", "ペース落とさないと。")
                 ], ipa: "/slˈəʊ dˈaʊn/"),
            make("show off", "boast or display proudly",
                 "見せびらかす",
                 useCases: ["自慢する人を表すとき"],
                 examples: [
                    ("He's just showing off.", "彼、自慢してるだけ。"),
                    ("Don't show off.", "見せびらかさないで。")
                 ], ipa: "/ʃˈəʊ ˈɒf/"),
            make("shut down", "close; stop operating",
                 "閉鎖する・停止する",
                 useCases: ["店や工場を閉める話", "PCを切るとき"],
                 examples: [
                    ("They shut down the store.", "店を閉めた。"),
                    ("Shut it down.", "停止して。")
                 ], ipa: "/ʃˈʌt dˈaʊn/"),
            make("shut up", "stop talking",
                 "黙る",
                 useCases: ["強めに黙ってと言うとき"],
                 examples: [
                    ("Shut up!", "黙って！"),
                    ("Just shut up already.", "もういい加減黙って。")
                 ], ipa: "/ʃˈʌt ˈʌp/"),
            make("roll out", "release or launch something",
                 "展開する・発表する",
                 useCases: ["新製品や機能をリリースするとき"],
                 examples: [
                    ("They rolled out the new feature.", "新機能をリリースした。"),
                    ("Rolling out next week.", "来週公開するよ。")
                 ], ipa: "/ɹˈəʊl ˈaʊt/"),
            make("rip up", "tear into pieces",
                 "破り捨てる",
                 useCases: ["紙をビリビリ破る話"],
                 examples: [
                    ("He ripped up the letter.", "彼、手紙を破り捨てた。"),
                    ("Don't rip it up!", "破かないで！")
                 ], ipa: "/ɹˈɪp ˈʌp/"),
            make("rest assured", "be confident about",
                 "安心してください",
                 useCases: ["保証を伝える丁寧な言い方"],
                 examples: [
                    ("Rest assured, it's safe.", "安心して、安全だから。"),
                    ("Rest assured, we'll handle it.", "ご安心を、こちらで対応します。")
                 ], ipa: "/ɹˈɛst əʃˈɔːd/"),
            make("read up on", "study a topic carefully",
                 "〜について詳しく読む",
                 useCases: ["特定のテーマを下調べする話"],
                 examples: [
                    ("I read up on it last night.", "昨晩それについて調べた。"),
                    ("Read up on the topic.", "そのテーマを下調べして。")
                 ], ipa: "/ɹˈiːd ˌʌp ˈɒn/"),
            make("plug in", "connect to a power source",
                 "プラグを差し込む",
                 useCases: ["電源を入れる動作"],
                 examples: [
                    ("Plug in the charger.", "充電器差して。"),
                    ("It's plugged in.", "コンセント刺さってるよ。")
                 ], ipa: "/plˈʌɡ ˈɪn/"),
            make("pile up", "accumulate",
                 "積み重なる・たまる",
                 useCases: ["仕事や書類が溜まる話"],
                 examples: [
                    ("Work is piling up.", "仕事が溜まってる。"),
                    ("Bills are piling up.", "請求書が積み上がってる。")
                 ], ipa: "/pˈaɪl ˈʌp/"),
            make("patch up", "repair; reconcile",
                 "修復する・仲直りする",
                 useCases: ["関係を修復する話"],
                 examples: [
                    ("They patched things up.", "彼ら仲直りした。"),
                    ("Patch up the hole.", "穴を直して。")
                 ], ipa: "/pˈætʃ ˈʌp/"),
            make("opt out", "choose not to participate",
                 "選ばない・脱退する",
                 useCases: ["参加しない選択をする話"],
                 examples: [
                    ("I opted out of the trip.", "旅行は不参加にした。"),
                    ("You can opt out anytime.", "いつでも辞退できる。")
                 ], ipa: "/ˈɒpt ˈaʊt/"),
            make("opt for", "choose something",
                 "〜を選ぶ",
                 useCases: ["選択肢から選ぶ話"],
                 examples: [
                    ("I opted for tea.", "紅茶にした。"),
                    ("She opted for the larger size.", "彼女は大きいサイズを選んだ。")
                 ], ipa: "/ˈɒpt fɔː/"),
            make("mess up", "make a mistake; ruin",
                 "しくじる・台無しにする",
                 useCases: ["失敗を伝えるとき"],
                 examples: [
                    ("I really messed up.", "完全にやらかした。"),
                    ("Don't mess this up.", "これ台無しにしないで。")
                 ], ipa: "/mˈɛs ˈʌp/"),
            make("lighten up", "relax; cheer up",
                 "元気を出す・気楽になる",
                 useCases: ["重い空気を和らげるとき"],
                 examples: [
                    ("Lighten up, it's a joke.", "気楽に、冗談だよ。"),
                    ("Just lighten up.", "リラックスして。")
                 ], ipa: "/lˈaɪtən ˈʌp/"),
            make("let down", "disappoint",
                 "失望させる",
                 useCases: ["期待を裏切られた話"],
                 examples: [
                    ("Don't let me down.", "がっかりさせないで。"),
                    ("He let me down again.", "彼にまた裏切られた。")
                 ], ipa: "/lˈɛt dˈaʊn/"),
            make("lash out", "attack verbally or violently",
                 "激しく非難する・八つ当たりする",
                 useCases: ["怒って人に当たる話"],
                 examples: [
                    ("He lashed out at me.", "彼、私に八つ当たりした。"),
                    ("Don't lash out.", "感情的に当たらないで。")
                 ], ipa: "/lˈæʃ ˈaʊt/"),
            make("iron out", "resolve issues; smooth over",
                 "解決する・調整する",
                 useCases: ["問題点を整える話"],
                 examples: [
                    ("Let's iron out the details.", "細部を詰めよう。"),
                    ("We need to iron out a few things.", "いくつか調整しないと。")
                 ], ipa: "/ˈaɪən ˈaʊt/")
        ]
    }

    // MARK: - 動詞（追加 20）

    private static var extraVerbs: [Word] {
        [
            make("prevent", "stop something from happening",
                 "防ぐ・予防する",
                 useCases: ["事故や問題を未然に防ぐとき"],
                 examples: [
                    ("This will prevent problems.", "これで問題を防げる。"),
                    ("Prevent the spread.", "拡大を防ぐ。")
                 ], ipa: "/pɹɪvˈɛnt/"),
            make("prohibit", "officially forbid",
                 "禁止する",
                 useCases: ["公式に禁止されている事柄"],
                 examples: [
                    ("Smoking is prohibited here.", "ここは禁煙です。"),
                    ("They prohibit pets.", "ペット禁止だ。")
                 ], ipa: "/pɹəhˈɪbɪt/"),
            make("promote", "encourage; raise in rank",
                 "促進する・昇進させる",
                 useCases: ["売り込みや昇進の話"],
                 examples: [
                    ("She got promoted.", "彼女、昇進した。"),
                    ("They promote teamwork.", "チームワークを推進してる。")
                 ], ipa: "/pɹəmˈəʊt/"),
            make("propose", "suggest; ask to marry",
                 "提案する・プロポーズする",
                 useCases: ["案を出すとき", "結婚を申し込む場面"],
                 examples: [
                    ("I propose a toast.", "乾杯を提案するよ。"),
                    ("He proposed last night.", "昨夜彼がプロポーズした。")
                 ], ipa: "/pɹəpˈəʊz/"),
            make("provide", "supply; give what's needed",
                 "提供する",
                 useCases: ["サービスや物を提供するとき"],
                 examples: [
                    ("We provide free Wi-Fi.", "無料Wi-Fiあります。"),
                    ("They provided meals.", "食事を出してくれた。")
                 ], ipa: "/pɹəvˈaɪd/"),
            make("purchase", "buy something",
                 "購入する",
                 useCases: ["フォーマルに買い物の話をするとき"],
                 examples: [
                    ("I purchased a new laptop.", "新しいPCを買った。"),
                    ("Where did you purchase it?", "どこで買ったの？")
                 ], ipa: "/pˈɜːtʃɪs/"),
            make("pursue", "follow or chase after",
                 "追求する・追いかける",
                 useCases: ["夢やキャリアを追う話"],
                 examples: [
                    ("She pursued her dream.", "彼女は夢を追いかけた。"),
                    ("Pursue what you love.", "好きなことを追求して。")
                 ], ipa: "/pəsjˈuː/"),
            make("qualify", "meet requirements",
                 "資格を得る・適合する",
                 useCases: ["条件を満たして資格を得る話"],
                 examples: [
                    ("Do I qualify for this?", "これに該当する？"),
                    ("He qualified for the finals.", "彼は決勝に進出した。")
                 ], ipa: "/kwˈɒlɪfˌaɪ/"),
            make("rebuild", "build again",
                 "再建する",
                 useCases: ["建物や関係を建て直す話"],
                 examples: [
                    ("They rebuilt the house.", "家を建て直した。"),
                    ("Rebuild your confidence.", "自信を取り戻して。")
                 ], ipa: "/ɹɪbˈɪld/"),
            make("refer to", "mention; consult",
                 "言及する・参照する",
                 useCases: ["資料を参照する場面", "話題を指す場面"],
                 examples: [
                    ("Refer to the manual.", "マニュアルを見て。"),
                    ("She referred to the article.", "彼女はその記事に触れた。")
                 ], ipa: "/ɹɪfˈɜː tuː/"),
            make("reflect", "show; think deeply",
                 "反映する・熟考する",
                 useCases: ["鏡や水面に映る話", "じっくり考える話"],
                 examples: [
                    ("It reflects your effort.", "あなたの努力が表れてる。"),
                    ("Take time to reflect.", "じっくり考えて。")
                 ], ipa: "/ɹɪflˈɛkt/"),
            make("regret", "feel sorry for an action",
                 "後悔する",
                 useCases: ["過去の行動を悔やむとき"],
                 examples: [
                    ("I regret saying that.", "あれ言ったの後悔してる。"),
                    ("No regrets.", "後悔はない。")
                 ], ipa: "/ɹɪɡɹˈɛt/"),
            make("rely on", "depend on for support",
                 "頼る・依存する",
                 useCases: ["信頼して任せる話"],
                 examples: [
                    ("You can rely on me.", "私を頼っていいよ。"),
                    ("She relies on her car.", "彼女は車に頼ってる。")
                 ], ipa: "/ɹɪlˈaɪ ˈɒn/"),
            make("remind", "make someone remember",
                 "思い出させる",
                 useCases: ["相手にリマインドする場面"],
                 examples: [
                    ("Remind me later.", "あとで言って。"),
                    ("It reminds me of home.", "家を思い出すよ。")
                 ], ipa: "/ɹɪmˈaɪnd/"),
            make("replace", "put something in another's place",
                 "取り替える・代わりにする",
                 useCases: ["故障した物を交換する話"],
                 examples: [
                    ("Replace the battery.", "電池替えて。"),
                    ("Nothing can replace her.", "彼女の代わりはいない。")
                 ], ipa: "/ɹɪplˈeɪs/"),
            make("represent", "stand for; act on behalf of",
                 "代表する・表す",
                 useCases: ["代表して発言・行動する話"],
                 examples: [
                    ("She represents our team.", "彼女が私たちのチームを代表する。"),
                    ("This logo represents us.", "このロゴが我々を表す。")
                 ], ipa: "/ɹˌɛpɹɪzˈɛnt/"),
            make("request", "ask for formally",
                 "要請する・依頼する",
                 useCases: ["丁寧にお願いするとき"],
                 examples: [
                    ("I'd like to request a meeting.", "会議をお願いしたいです。"),
                    ("Request approved.", "依頼は承認された。")
                 ], ipa: "/ɹɪkwˈɛst/"),
            make("require", "need; demand",
                 "必要とする",
                 useCases: ["条件として必要なものを示すとき"],
                 examples: [
                    ("This requires patience.", "これには忍耐が必要だ。"),
                    ("ID is required.", "身分証必須。")
                 ], ipa: "/ɹɪkwˈaɪə/"),
            make("reveal", "make known; uncover",
                 "明かす・暴露する",
                 useCases: ["秘密を打ち明けるとき"],
                 examples: [
                    ("He revealed the truth.", "彼は真実を明かした。"),
                    ("Don't reveal the ending.", "結末バラさないで。")
                 ], ipa: "/ɹɪvˈiːl/"),
            make("rush", "hurry; charge forward",
                 "急ぐ・突進する",
                 useCases: ["急いでいる場面"],
                 examples: [
                    ("Don't rush.", "急がなくていいよ。"),
                    ("I'm in a rush.", "急いでるんだ。")
                 ], ipa: "/ɹˈʌʃ/")
        ]
    }

    // MARK: - 形容詞（追加 20）

    private static var extraAdjectives2: [Word] {
        [
            make("adequate", "enough; sufficient",
                 "十分な・適切な",
                 useCases: ["最低限満たしていることを伝えるとき"],
                 examples: [
                    ("Adequate for the job.", "仕事に十分。"),
                    ("Not entirely adequate.", "完全には十分じゃない。")
                 ], ipa: "/ˈædɪkwət/"),
            make("apparent", "clearly visible or understood",
                 "明らかな・見たところの",
                 useCases: ["明白な事実を述べるとき"],
                 examples: [
                    ("It's apparent he's lying.", "彼が嘘ついてるのは明らかだ。"),
                    ("No apparent reason.", "明確な理由はない。")
                 ], ipa: "/ɐpˈæɹənt/"),
            make("arrogant", "having too much pride",
                 "傲慢な",
                 useCases: ["態度が偉そうな人を批判するとき"],
                 examples: [
                    ("He's so arrogant.", "彼、めっちゃ傲慢。"),
                    ("Don't be arrogant.", "傲慢にならないで。")
                 ], ipa: "/ˈæɹəɡənt/"),
            make("awful", "very bad",
                 "ひどい・最悪な",
                 useCases: ["強く否定的な評価を伝えるとき"],
                 examples: [
                    ("That's awful.", "それひどい。"),
                    ("The food was awful.", "料理がひどかった。")
                 ], ipa: "/ˈɔːfəl/"),
            make("brilliant", "very smart; outstanding",
                 "素晴らしい・優秀な",
                 useCases: ["賞賛するとき"],
                 examples: [
                    ("Brilliant idea!", "素晴らしいアイデア！"),
                    ("She's brilliant.", "彼女は優秀だ。")
                 ], ipa: "/bɹˈɪliənt/"),
            make("bold", "brave; daring",
                 "大胆な",
                 useCases: ["勇気ある決断や発言を表すとき"],
                 examples: [
                    ("That's a bold move.", "それは大胆な行動だ。"),
                    ("Be bold.", "大胆にいこう。")
                 ], ipa: "/bˈəʊld/"),
            make("cautious", "careful; wary",
                 "慎重な",
                 useCases: ["危険を避けて慎重に動く話"],
                 examples: [
                    ("Be cautious.", "慎重にね。"),
                    ("She's cautious by nature.", "彼女は元々慎重なタイプ。")
                 ], ipa: "/kˈɔːʃəs/"),
            make("chaotic", "very disorganized",
                 "混沌とした",
                 useCases: ["大混乱の状況を表すとき"],
                 examples: [
                    ("The room was chaotic.", "部屋がカオスだった。"),
                    ("It's been chaotic at work.", "仕事がてんやわんや。")
                 ], ipa: "/keɪˈɒtɪk/"),
            make("competitive", "wanting to win",
                 "競争心の強い",
                 useCases: ["勝負好きな性格を表すとき"],
                 examples: [
                    ("He's super competitive.", "彼、すごい負けず嫌い。"),
                    ("It's a competitive market.", "競争の激しい市場だ。")
                 ], ipa: "/kəmpˈɛtɪtˌɪv/"),
            make("complex", "having many parts; not simple",
                 "複雑な",
                 useCases: ["難しい問題やシステムを表すとき"],
                 examples: [
                    ("It's a complex issue.", "複雑な問題だ。"),
                    ("Pretty complex.", "結構複雑。")
                 ], ipa: "/kˈɒmplɛks/"),
            make("confident", "self-assured",
                 "自信のある",
                 useCases: ["自信ある態度を表すとき"],
                 examples: [
                    ("She's so confident.", "彼女、自信に満ちてる。"),
                    ("I'm confident about it.", "自信があるよ。")
                 ], ipa: "/kˈɒnfɪdənt/"),
            make("considerate", "thinking of others",
                 "思いやりのある",
                 useCases: ["他人の立場を考える人を褒めるとき"],
                 examples: [
                    ("That's considerate of you.", "気を遣ってくれてありがとう。"),
                    ("He's very considerate.", "彼はすごく思いやりがある。")
                 ], ipa: "/kənsˈɪdəɹət/"),
            make("convenient", "easy to use; well located",
                 "便利な",
                 useCases: ["都合がいい場所や時間"],
                 examples: [
                    ("Super convenient location.", "立地めっちゃ便利。"),
                    ("Whatever's convenient.", "都合のいい時で。")
                 ], ipa: "/kənvˈiːnɪənt/"),
            make("creative", "showing imagination",
                 "創造的な・クリエイティブな",
                 useCases: ["独創性を褒めるとき"],
                 examples: [
                    ("Very creative idea!", "とても独創的なアイデア！"),
                    ("She's so creative.", "彼女、すごくクリエイティブ。")
                 ], ipa: "/kɹiːˈeɪtɪv/"),
            make("curious", "eager to know",
                 "好奇心旺盛な",
                 useCases: ["興味津々な様子を表すとき"],
                 examples: [
                    ("I'm curious about it.", "気になる。"),
                    ("She's a curious kid.", "彼女、好奇心旺盛な子だ。")
                 ], ipa: "/kjˈɔːɹiəs/"),
            make("delicate", "fragile; subtle",
                 "繊細な・壊れやすい",
                 useCases: ["扱いに注意がいる物や問題"],
                 examples: [
                    ("It's delicate.", "壊れやすいよ。"),
                    ("A delicate situation.", "デリケートな状況。")
                 ], ipa: "/dˈɛlɪkət/"),
            make("dependent", "needing support",
                 "依存している",
                 useCases: ["他者や物に頼っている状態"],
                 examples: [
                    ("He's dependent on coffee.", "彼コーヒー依存だ。"),
                    ("Too dependent on her phone.", "携帯に依存しすぎ。")
                 ], ipa: "/dɪpˈɛndənt/"),
            make("desperate", "having no hope; reckless",
                 "必死の・絶望的な",
                 useCases: ["切羽詰まった状況を表すとき"],
                 examples: [
                    ("I was desperate.", "必死だった。"),
                    ("Desperate times.", "厳しい時代だ。")
                 ], ipa: "/dˈɛspəɹət/"),
            make("diverse", "varied; from many different sources",
                 "多様な",
                 useCases: ["バラエティ豊かな構成を表すとき"],
                 examples: [
                    ("A diverse team.", "多様性のあるチーム。"),
                    ("Tokyo is super diverse.", "東京はすごく多様性がある。")
                 ], ipa: "/daɪvˈɜːs/"),
            make("dynamic", "active; full of energy",
                 "動的な・活発な",
                 useCases: ["勢いがあるものや人を表すとき"],
                 examples: [
                    ("A dynamic speaker.", "エネルギッシュな話し手。"),
                    ("Dynamic environment.", "動きのある職場。")
                 ], ipa: "/daɪnˈæmɪk/")
        ]
    }

    // MARK: - 名詞（追加 15）

    private static var extraNouns: [Word] {
        [
            make("achievement", "something accomplished",
                 "達成・業績",
                 useCases: ["成果を讃えるとき"],
                 examples: [
                    ("That's a huge achievement.", "それは大きな成果だ。"),
                    ("Personal achievement.", "個人的な達成。")
                 ], ipa: "/ɐtʃˈiːvmənt/"),
            make("alternative", "another option",
                 "代替案・別の選択肢",
                 useCases: ["他の選択肢を提案するとき"],
                 examples: [
                    ("Any alternative?", "他の選択肢ある？"),
                    ("A vegan alternative.", "ビーガン用の代替品。")
                 ], ipa: "/ɔːltˈɜːnətˌɪv/"),
            make("approach", "way of doing; come closer",
                 "アプローチ・近づくこと",
                 useCases: ["やり方や戦略を話すとき"],
                 examples: [
                    ("Different approach.", "違うアプローチ。"),
                    ("Try a new approach.", "新しい方法でやってみて。")
                 ], ipa: "/ɐpɹˈəʊtʃ/"),
            make("awareness", "knowledge of something",
                 "意識・認識",
                 useCases: ["問題への注目を高める話"],
                 examples: [
                    ("Raise awareness.", "意識を高める。"),
                    ("Lack of awareness.", "認識不足。")
                 ], ipa: "/ɐwˈeənəs/"),
            make("boundary", "a limit; a line dividing two areas",
                 "境界・限界",
                 useCases: ["人間関係の境界線", "区域の境を話すとき"],
                 examples: [
                    ("Set boundaries.", "線引きしよう。"),
                    ("Cross the boundary.", "境界を越える。")
                 ], ipa: "/bˈaʊndəɹɪ/"),
            make("challenge", "a difficult task; a dare",
                 "挑戦・難題",
                 useCases: ["新しい挑戦に取り組む話"],
                 examples: [
                    ("Big challenge ahead.", "大きな挑戦が待ってる。"),
                    ("I love a challenge.", "挑戦が好きなんだ。")
                 ], ipa: "/tʃˈælɪndʒ/"),
            make("conclusion", "the end or final decision",
                 "結論",
                 useCases: ["話し合いをまとめるとき"],
                 examples: [
                    ("In conclusion, yes.", "結論としてはYES。"),
                    ("Jumped to a conclusion.", "結論を急いだ。")
                 ], ipa: "/kəŋklˈuːʒən/"),
            make("concern", "worry; matter of interest",
                 "心配・関心事",
                 useCases: ["懸念を表明するとき"],
                 examples: [
                    ("That's my concern.", "それが気になってる。"),
                    ("Cause for concern.", "心配の種。")
                 ], ipa: "/kənsˈɜːn/"),
            make("conflict", "a serious disagreement",
                 "対立・衝突",
                 useCases: ["意見や価値観の衝突を表すとき"],
                 examples: [
                    ("There's a conflict.", "対立がある。"),
                    ("Avoid conflict.", "もめるのは避けよう。")
                 ], ipa: "/kˈɒnflɪkt/"),
            make("diversity", "variety; different kinds",
                 "多様性",
                 useCases: ["人や文化の多様性について話すとき"],
                 examples: [
                    ("Diversity matters.", "多様性は大事。"),
                    ("Cultural diversity.", "文化の多様性。")
                 ], ipa: "/daɪvˈɜːsɪtɪ/"),
            make("emergency", "an urgent serious situation",
                 "緊急事態",
                 useCases: ["急ぎの危険な事態の話"],
                 examples: [
                    ("It's an emergency.", "緊急事態だ。"),
                    ("In case of emergency.", "緊急時には。")
                 ], ipa: "/ɪmˈɜːdʒənsɪ/"),
            make("encounter", "an unexpected meeting",
                 "出会い・遭遇",
                 useCases: ["珍しい出会いの話"],
                 examples: [
                    ("A strange encounter.", "奇妙な出会い。"),
                    ("Brief encounter.", "短い出会い。")
                 ], ipa: "/ɪŋkˈaʊntɐ/"),
            make("evidence", "facts that prove something",
                 "証拠",
                 useCases: ["主張の裏付けを話すとき"],
                 examples: [
                    ("No evidence yet.", "まだ証拠がない。"),
                    ("Strong evidence.", "強い証拠だ。")
                 ], ipa: "/ˈɛvɪdəns/"),
            make("experience", "knowledge from doing things",
                 "経験",
                 useCases: ["過去の体験や実績を話すとき"],
                 examples: [
                    ("Great experience.", "いい経験だった。"),
                    ("Years of experience.", "何年もの経験。")
                 ], ipa: "/ɪkspˈiəɹɪəns/"),
            make("exception", "something different from the rule",
                 "例外",
                 useCases: ["ルールから外れた事例を示すとき"],
                 examples: [
                    ("With one exception.", "1つだけ例外あり。"),
                    ("No exceptions.", "例外なし。")
                 ], ipa: "/ɪksˈɛpʃən/")
        ]
    }

    // MARK: - 慣用表現・口語表現（追加 15）

    private static var extraIdioms2: [Word] {
        [
            make("at all costs", "no matter what",
                 "何としても",
                 useCases: ["強い決意を表すとき"],
                 examples: [
                    ("Avoid him at all costs.", "何としても彼を避けて。"),
                    ("I'll finish it at all costs.", "何としてもやり遂げる。")
                 ], ipa: "/æt ˈɔːl kˈɒsts/"),
            make("for the sake of", "for the purpose of",
                 "〜のために",
                 useCases: ["目的を強調するとき"],
                 examples: [
                    ("For the sake of clarity.", "明確にするために。"),
                    ("For the sake of peace.", "平和のために。")
                 ], ipa: "/fəðə sˈeɪk ɒv/"),
            make("at any rate", "in any case; anyway",
                 "とにかく・いずれにせよ",
                 useCases: ["話を前に進めるとき"],
                 examples: [
                    ("At any rate, let's go.", "とにかく行こう。"),
                    ("At any rate, it's done.", "いずれにせよ終わった。")
                 ], ipa: "/æt ˌɛnɪ ɹˈeɪt/"),
            make("in spite of", "despite",
                 "〜にもかかわらず",
                 useCases: ["逆境を踏まえて結果を述べるとき"],
                 examples: [
                    ("In spite of the rain, we went.", "雨にもかかわらず行った。"),
                    ("In spite of everything.", "何があっても。")
                 ], ipa: "/ɪn spˈaɪt ɒv/"),
            make("as opposed to", "in contrast to",
                 "〜とは対照的に",
                 useCases: ["2つの選択肢を対比するとき"],
                 examples: [
                    ("Tea, as opposed to coffee.", "コーヒーじゃなくて紅茶ね。"),
                    ("As opposed to last year.", "去年と対照的に。")
                 ], ipa: "/æz əpˈəʊzd tuː/"),
            make("with respect to", "regarding",
                 "〜に関して",
                 useCases: ["フォーマルに話題を導入するとき"],
                 examples: [
                    ("With respect to your question...", "ご質問に関しては…"),
                    ("With respect to safety.", "安全面に関して。")
                 ], ipa: "/wɪð ɹɪspˈɛkt tuː/"),
            make("in the wake of", "as a result of; just after",
                 "〜の余波で・直後に",
                 useCases: ["出来事の影響を受けた状況を伝えるとき"],
                 examples: [
                    ("In the wake of the crisis.", "危機の余波で。"),
                    ("In the wake of the storm.", "嵐の直後に。")
                 ], ipa: "/ɪnðə wˈeɪk ɒv/"),
            make("at odds with", "in disagreement with",
                 "〜と対立して",
                 useCases: ["意見が衝突している話"],
                 examples: [
                    ("He's at odds with his boss.", "彼、上司ともめてる。"),
                    ("At odds with the rules.", "規則と矛盾してる。")
                 ], ipa: "/æt ˈɒdz wɪð/"),
            make("on behalf of", "as a representative of",
                 "〜を代表して",
                 useCases: ["代表として発言するとき"],
                 examples: [
                    ("On behalf of the team.", "チームを代表して。"),
                    ("On behalf of all of us.", "私たち皆を代表して。")
                 ], ipa: "/ˌɒn bɪhˈɑːf ɒv/"),
            make("in light of", "considering",
                 "〜を考慮して",
                 useCases: ["事情を踏まえて判断するとき"],
                 examples: [
                    ("In light of recent events.", "最近の事件を踏まえて。"),
                    ("In light of the data.", "データを考慮して。")
                 ], ipa: "/ɪn lˈaɪt ɒv/"),
            make("at the expense of", "while sacrificing",
                 "〜を犠牲にして",
                 useCases: ["何かを犠牲にして得る話"],
                 examples: [
                    ("Worked at the expense of sleep.", "睡眠を削って働いた。"),
                    ("At the expense of others.", "他人を犠牲にして。")
                 ], ipa: "/æt ðɪ ɪkspˈɛns ɒv/"),
            make("prior to", "before",
                 "〜の前に",
                 useCases: ["フォーマルに「〜の前に」と言うとき"],
                 examples: [
                    ("Prior to the meeting.", "会議の前に。"),
                    ("Prior to that, I lived in Tokyo.", "それ以前は東京に住んでた。")
                 ], ipa: "/pɹˈaɪɐ tuː/"),
            make("subsequent to", "after; following",
                 "〜の後に",
                 useCases: ["フォーマルに時間順を示すとき"],
                 examples: [
                    ("Subsequent to the launch.", "発売後に。"),
                    ("Subsequent to that event.", "その出来事の後で。")
                 ], ipa: "/sˈʌbsɪkwənt tuː/"),
            make("with the exception of", "except for",
                 "〜を除いて",
                 useCases: ["フォーマルに例外を示すとき"],
                 examples: [
                    ("With the exception of Sunday.", "日曜を除いて。"),
                    ("Open daily, with the exception of Monday.", "月曜以外は毎日営業。")
                 ], ipa: "/wɪððɪ ɪksˈɛpʃən ɒv/"),
            make("in conjunction with", "together with",
                 "〜と連携して・〜と組み合わせて",
                 useCases: ["共同作業や組み合わせを示すとき"],
                 examples: [
                    ("In conjunction with the team.", "チームと連携して。"),
                    ("Use in conjunction with the app.", "アプリと組み合わせて使って。")
                 ], ipa: "/ɪn kəndʒˈʌŋkʃən wɪð/")
        ]
    }

    // MARK: - 句動詞（追加 25）

    private static var extraPhrasalVerbs3: [Word] {
        [
            make("fill in", "complete a form; substitute for",
                 "記入する・代理を務める",
                 useCases: ["書類に記入する話", "誰かの代わりを務める話"],
                 examples: [
                    ("Fill in the form.", "用紙に記入して。"),
                    ("I'll fill in for her.", "彼女の代わりやるよ。")
                 ], ipa: "/fˈɪl ˈɪn/"),
            make("fill up", "make completely full",
                 "満たす・満タンにする",
                 useCases: ["ガソリンを満タンにする話", "容器をいっぱいにするとき"],
                 examples: [
                    ("Fill up the tank.", "満タンにして。"),
                    ("Fill it up, please.", "満タンでお願いします。")
                 ], ipa: "/fˈɪl ˈʌp/"),
            make("fall back on", "rely on as a backup",
                 "頼りにする・最後の手段にする",
                 useCases: ["保険として用意する話"],
                 examples: [
                    ("She fell back on her savings.", "彼女、貯金に頼った。"),
                    ("Something to fall back on.", "もしもの時の備え。")
                 ], ipa: "/fˈɔːl bˈæk ˈɒn/"),
            make("fall for", "be deceived by; fall in love with",
                 "騙される・恋に落ちる",
                 useCases: ["嘘に引っかかる話", "誰かに惚れる話"],
                 examples: [
                    ("Don't fall for it.", "騙されないで。"),
                    ("I'm falling for him.", "彼を好きになりかけてる。")
                 ], ipa: "/fˈɔːl fɔː/"),
            make("fall in love", "develop romantic feelings",
                 "恋に落ちる",
                 useCases: ["恋愛が始まる話"],
                 examples: [
                    ("They fell in love at first sight.", "彼ら一目惚れだった。"),
                    ("I fell in love with this city.", "この街に恋しちゃった。")
                 ], ipa: "/fˈɔːl ɪn lˈʌv/"),
            make("drop by", "make a brief visit",
                 "立ち寄る",
                 useCases: ["軽く寄っていく話"],
                 examples: [
                    ("Drop by anytime.", "いつでも寄って。"),
                    ("I'll drop by later.", "あとで寄るよ。")
                 ], ipa: "/dɹˈɒp bˈaɪ/"),
            make("drop in", "visit unannounced",
                 "ふらっと立ち寄る",
                 useCases: ["予告なしの来訪"],
                 examples: [
                    ("She just dropped in.", "彼女、ふらっと寄ってきた。"),
                    ("Drop in if you're nearby.", "近くまで来たら寄って。")
                 ], ipa: "/dɹˈɒp ˈɪn/"),
            make("drop out", "stop participating; quit school",
                 "中退する・脱落する",
                 useCases: ["学校を辞める話", "コンテストから抜ける話"],
                 examples: [
                    ("He dropped out of college.", "彼は大学中退した。"),
                    ("She dropped out of the race.", "彼女はレースを棄権した。")
                 ], ipa: "/dɹˈɒp ˈaʊt/"),
            make("dawn on", "suddenly become clear",
                 "はっと気づく",
                 useCases: ["突然真意が分かる場面"],
                 examples: [
                    ("It just dawned on me.", "今ふと気づいた。"),
                    ("Then it dawned on her.", "彼女はそこで気づいた。")
                 ], ipa: "/dˈɔːn ˈɒn/"),
            make("dive into", "start eagerly; plunge",
                 "飛び込む・没頭する",
                 useCases: ["新しい仕事や趣味に夢中になる話"],
                 examples: [
                    ("Let's dive into the work.", "仕事に取りかかろう。"),
                    ("She dove into the book.", "彼女は本に没頭した。")
                 ], ipa: "/dˈaɪv ˌɪntʊ/"),
            make("count down", "count toward zero",
                 "カウントダウンする",
                 useCases: ["イベントや年末などの秒読み"],
                 examples: [
                    ("Count down from 10!", "10からカウントダウン！"),
                    ("Counting down to launch.", "発売までカウントダウン中。")
                 ], ipa: "/kˈaʊnt dˈaʊn/"),
            make("clear up", "tidy; become sunny; resolve",
                 "片付ける・晴れる・解決する",
                 useCases: ["天気が晴れる話", "誤解を解く話"],
                 examples: [
                    ("It cleared up by noon.", "昼には晴れた。"),
                    ("Let's clear up the misunderstanding.", "誤解を解こう。")
                 ], ipa: "/klˈiəɹ ˈʌp/"),
            make("clean up", "make tidy",
                 "きれいにする・片付ける",
                 useCases: ["部屋を片付ける話"],
                 examples: [
                    ("Clean up your room.", "部屋片付けて。"),
                    ("Time to clean up.", "片付ける時間だ。")
                 ], ipa: "/klˈiːn ˈʌp/"),
            make("chop up", "cut into small pieces",
                 "細かく切る",
                 useCases: ["料理の下ごしらえ"],
                 examples: [
                    ("Chop up the onions.", "玉ねぎ刻んで。"),
                    ("I chopped them up small.", "細かく切った。")
                 ], ipa: "/tʃˈɒp ˈʌp/"),
            make("buckle up", "fasten a seatbelt",
                 "シートベルトを締める",
                 useCases: ["車に乗り込んだ時"],
                 examples: [
                    ("Buckle up!", "シートベルト締めて！"),
                    ("Everyone buckled up?", "全員ベルトした？")
                 ], ipa: "/bˈʌkəl ˈʌp/"),
            make("bottle up", "suppress emotions",
                 "感情を抑え込む",
                 useCases: ["気持ちをため込む話"],
                 examples: [
                    ("Don't bottle it up.", "ため込まないで。"),
                    ("She bottles up her feelings.", "彼女は感情をため込む。")
                 ], ipa: "/bˈɒtəl ˈʌp/"),
            make("boil down to", "ultimately come down to",
                 "結局〜に行き着く",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("It boils down to money.", "結局お金の問題だ。"),
                    ("Boils down to trust.", "結局は信頼の話。")
                 ], ipa: "/bˈɔɪl dˈaʊn tuː/"),
            make("bear in mind", "keep in mind",
                 "心に留める",
                 useCases: ["注意点を念押しするとき"],
                 examples: [
                    ("Bear in mind it's expensive.", "高いって覚えておいて。"),
                    ("Bear that in mind.", "それを心に留めておいて。")
                 ], ipa: "/bˈeəɹ ɪn mˈaɪnd/"),
            make("beat down", "haggle; defeat",
                 "値切る・打ち倒す",
                 useCases: ["値段を下げてもらう交渉"],
                 examples: [
                    ("She beat down the price.", "彼女、値切った。"),
                    ("Beat the price down.", "値切ってみて。")
                 ], ipa: "/bˈiːt dˈaʊn/"),
            make("back off", "step away; stop being aggressive",
                 "引き下がる・距離を取る",
                 useCases: ["強引な相手から離れる話"],
                 examples: [
                    ("Back off!", "離れて！"),
                    ("Just back off a bit.", "少し下がって。")
                 ], ipa: "/bˈæk ˈɒf/"),
            make("act on", "take action based on",
                 "〜に基づいて行動する",
                 useCases: ["情報やアドバイスを実行に移すとき"],
                 examples: [
                    ("Act on your instincts.", "直感で動いて。"),
                    ("They acted on the tip.", "彼らはその情報を元に動いた。")
                 ], ipa: "/ˈækt ˈɒn/"),
            make("adhere to", "stick to; follow strictly",
                 "守る・固執する",
                 useCases: ["ルールに従う話"],
                 examples: [
                    ("Adhere to the rules.", "ルールを守って。"),
                    ("Adhere to the schedule.", "スケジュール通りに。")
                 ], ipa: "/ɐdhˈiə tuː/"),
            make("abide by", "follow a rule or decision",
                 "従う・遵守する",
                 useCases: ["契約や法律を守る話"],
                 examples: [
                    ("Abide by the law.", "法律を守って。"),
                    ("We abide by the agreement.", "契約に従ってる。")
                 ], ipa: "/ɐbˈaɪd bˈaɪ/"),
            make("account for", "explain; constitute",
                 "説明する・占める",
                 useCases: ["割合を説明するとき", "事情を弁明するとき"],
                 examples: [
                    ("That accounts for 30%.", "それで30%占める。"),
                    ("Can you account for this?", "これ説明できる？")
                 ], ipa: "/ɐkˈaʊnt fɔː/"),
            make("agree on", "reach consensus about",
                 "〜について合意する",
                 useCases: ["全員一致で何かを決める話"],
                 examples: [
                    ("Let's agree on a date.", "日付を決めよう。"),
                    ("We agreed on the plan.", "計画について合意した。")
                 ], ipa: "/ɐɡɹˈiː ˈɒn/")
        ]
    }

    // MARK: - 動詞（追加 25）

    private static var extraVerbs3: [Word] {
        [
            make("adjust", "make small changes; adapt",
                 "調整する・適応する",
                 useCases: ["設定や姿勢を整える話", "新環境に慣れる話"],
                 examples: [
                    ("Adjust the volume.", "音量調整して。"),
                    ("I'm still adjusting.", "まだ慣れてる途中。")
                 ], ipa: "/ɐdʒˈʌst/"),
            make("admit", "confess; allow entry",
                 "認める・入場を許す",
                 useCases: ["事実を白状するとき", "入場や入会を許可するとき"],
                 examples: [
                    ("I admit I was wrong.", "間違ってたって認める。"),
                    ("Children aren't admitted.", "子どもは入場不可です。")
                 ], ipa: "/ɐdmˈɪt/"),
            make("advise", "give advice",
                 "助言する・アドバイスする",
                 useCases: ["人に勧める場面"],
                 examples: [
                    ("I advise you to wait.", "待ったほうがいいよ。"),
                    ("She advised me to apply.", "彼女が応募を勧めてくれた。")
                 ], ipa: "/ɐdvˈaɪz/"),
            make("affect", "have an influence on",
                 "影響する",
                 useCases: ["感情や状況に与える影響を話すとき"],
                 examples: [
                    ("It affects my mood.", "気分に影響する。"),
                    ("The weather affects sales.", "天候が売上に影響する。")
                 ], ipa: "/ɐfˈɛkt/"),
            make("achieve", "successfully reach a goal",
                 "達成する・成し遂げる",
                 useCases: ["目標達成について話すとき"],
                 examples: [
                    ("She achieved her goal.", "彼女は目標を達成した。"),
                    ("Achieve great things.", "素晴らしいことを成し遂げて。")
                 ], ipa: "/ɐtʃˈiːv/"),
            make("announce", "make publicly known",
                 "発表する・告知する",
                 useCases: ["公式に何かを知らせる場面"],
                 examples: [
                    ("They announced the winner.", "勝者が発表された。"),
                    ("Announce it tomorrow.", "明日告知して。")
                 ], ipa: "/ɐnˈaʊns/"),
            make("apologize", "say you're sorry",
                 "謝る",
                 useCases: ["過ちを謝罪する場面"],
                 examples: [
                    ("I apologize for that.", "それについては謝ります。"),
                    ("He apologized to me.", "彼は私に謝った。")
                 ], ipa: "/ɐpˈɒlədʒˌaɪz/"),
            make("appoint", "officially choose for a role",
                 "任命する",
                 useCases: ["人事・役職に就かせる話"],
                 examples: [
                    ("They appointed her CEO.", "彼女がCEOに任命された。"),
                    ("Appointed last week.", "先週任命された。")
                 ], ipa: "/ɐpˈɔɪnt/"),
            make("arrange", "organize; plan",
                 "手配する・並べる",
                 useCases: ["予定や物の配置を整える話"],
                 examples: [
                    ("I'll arrange the meeting.", "会議を手配する。"),
                    ("Arrange the chairs.", "椅子を並べて。")
                 ], ipa: "/ɐɹˈeɪndʒ/"),
            make("assemble", "put together; gather",
                 "組み立てる・集まる",
                 useCases: ["家具の組み立て", "集会"],
                 examples: [
                    ("Assemble the desk.", "机を組み立てて。"),
                    ("Everyone assembled outside.", "みんな外に集まった。")
                 ], ipa: "/ɐsˈɛmbəl/"),
            make("assign", "allocate; give out",
                 "割り当てる",
                 useCases: ["業務や役割を割り振る場面"],
                 examples: [
                    ("They assigned me the task.", "そのタスク任された。"),
                    ("Assign each person a role.", "各自に役割を割り振って。")
                 ], ipa: "/ɐsˈaɪn/"),
            make("attempt", "try to do something",
                 "試みる",
                 useCases: ["挑戦する場面"],
                 examples: [
                    ("Attempt the question.", "問題に挑戦して。"),
                    ("First attempt failed.", "最初の挑戦は失敗。")
                 ], ipa: "/ɐtˈɛmpt/"),
            make("attend", "be present at",
                 "出席する",
                 useCases: ["会議や授業への参加"],
                 examples: [
                    ("Will you attend?", "出席する？"),
                    ("I attended the conference.", "会議に出た。")
                 ], ipa: "/ɐtˈɛnd/"),
            make("avoid", "stay away from",
                 "避ける",
                 useCases: ["危険や問題を回避する話"],
                 examples: [
                    ("Avoid the rush hour.", "ラッシュアワー避けて。"),
                    ("I avoided him all day.", "一日中彼を避けてた。")
                 ], ipa: "/ɐvˈɔɪd/"),
            make("balance", "keep stable; equalize",
                 "バランスを取る",
                 useCases: ["仕事と生活のバランスを話すとき"],
                 examples: [
                    ("Balance work and life.", "仕事と生活のバランス取って。"),
                    ("Hard to balance both.", "両方バランス取るのは大変。")
                 ], ipa: "/bˈæləns/"),
            make("belong", "be a member of; have a place",
                 "属する・所属する",
                 useCases: ["所有や所属を表すとき"],
                 examples: [
                    ("Where do I belong?", "私の居場所はどこ？"),
                    ("This belongs to me.", "これは私のもの。")
                 ], ipa: "/bɪlˈɒŋ/"),
            make("bend", "curve; force into a shape",
                 "曲げる",
                 useCases: ["体や物を曲げる話"],
                 examples: [
                    ("Bend your knees.", "膝を曲げて。"),
                    ("Don't bend it.", "曲げないで。")
                 ], ipa: "/bˈɛnd/"),
            make("blame", "hold responsible",
                 "責める",
                 useCases: ["責任を押し付ける場面"],
                 examples: [
                    ("Don't blame me.", "私のせいにしないで。"),
                    ("She blamed her phone.", "彼女は携帯のせいにした。")
                 ], ipa: "/blˈeɪm/"),
            make("bother", "annoy; take the trouble",
                 "悩ます・わざわざ〜する",
                 useCases: ["邪魔する場面", "面倒を引き受けるとき"],
                 examples: [
                    ("Don't bother her.", "彼女を邪魔しないで。"),
                    ("Don't bother trying.", "わざわざ挑戦しなくていい。")
                 ], ipa: "/bˈɒðɐ/"),
            make("breathe", "take air in and out",
                 "呼吸する",
                 useCases: ["深呼吸を促す場面"],
                 examples: [
                    ("Just breathe.", "深呼吸して。"),
                    ("Breathe deeply.", "深く呼吸して。")
                 ], ipa: "/bɹˈiːð/"),
            make("broadcast", "transmit on TV/radio",
                 "放送する",
                 useCases: ["ニュースなどを伝える話"],
                 examples: [
                    ("It was broadcast live.", "生放送された。"),
                    ("Broadcast the message.", "メッセージを発信して。")
                 ], ipa: "/bɹˈɔːdkɑːst/"),
            make("bury", "place in the ground",
                 "埋める",
                 useCases: ["物を埋める話", "感情を隠す比喩"],
                 examples: [
                    ("They buried the time capsule.", "タイムカプセル埋めた。"),
                    ("Don't bury your feelings.", "気持ちを押し殺さないで。")
                 ], ipa: "/bˈɛɹɪ/"),
            make("calculate", "compute; figure out",
                 "計算する",
                 useCases: ["数字を出す場面"],
                 examples: [
                    ("Calculate the total.", "合計を計算して。"),
                    ("I calculated the cost.", "コストを計算した。")
                 ], ipa: "/kˈælkjʊlˌeɪt/"),
            make("capture", "catch; record",
                 "捕らえる・とらえる",
                 useCases: ["瞬間を写真に収める話", "捕獲する話"],
                 examples: [
                    ("Capture the moment.", "その瞬間を捉えて。"),
                    ("They captured him.", "彼を捕まえた。")
                 ], ipa: "/kˈæptʃɐ/"),
            make("celebrate", "honor or commemorate",
                 "祝う",
                 useCases: ["誕生日や成功を祝う話"],
                 examples: [
                    ("Let's celebrate!", "お祝いしよう！"),
                    ("We celebrated her birthday.", "彼女の誕生日を祝った。")
                 ], ipa: "/sˈɛləbɹˌeɪt/")
        ]
    }

    // MARK: - 形容詞（追加 20）

    private static var extraAdjectives3: [Word] {
        [
            make("eager", "very keen; enthusiastic",
                 "熱心な・切望して",
                 useCases: ["強い意欲を表すとき"],
                 examples: [
                    ("I'm eager to start.", "始めるのが楽しみ。"),
                    ("Eager to learn.", "学ぶのに熱心。")
                 ], ipa: "/ˈiːɡɐ/"),
            make("elegant", "graceful and stylish",
                 "上品な・優雅な",
                 useCases: ["洗練された人や物を表すとき"],
                 examples: [
                    ("That dress is elegant.", "そのドレス上品。"),
                    ("An elegant solution.", "エレガントな解決法。")
                 ], ipa: "/ˈɛlɪɡənt/"),
            make("empty", "containing nothing",
                 "空の",
                 useCases: ["容器や場所が空の話"],
                 examples: [
                    ("The fridge is empty.", "冷蔵庫空っぽ。"),
                    ("Empty room.", "空っぽの部屋。")
                 ], ipa: "/ˈɛmptɪ/"),
            make("enormous", "very large",
                 "巨大な・莫大な",
                 useCases: ["とても大きいものを強調するとき"],
                 examples: [
                    ("Enormous building.", "巨大な建物。"),
                    ("Enormous impact.", "莫大な影響。")
                 ], ipa: "/ɪnˈɔːməs/"),
            make("enthusiastic", "showing great excitement",
                 "熱心な・乗り気な",
                 useCases: ["やる気満々な様子を表すとき"],
                 examples: [
                    ("She's enthusiastic about it.", "彼女、それに乗り気。"),
                    ("Not very enthusiastic.", "あまり乗り気じゃない。")
                 ], ipa: "/ɪnθjˌuːzɪˈæstɪk/"),
            make("exact", "precise; accurate",
                 "正確な",
                 useCases: ["数字や言葉の正確さを強調するとき"],
                 examples: [
                    ("The exact time.", "正確な時間。"),
                    ("Be more exact.", "もっと正確に。")
                 ], ipa: "/ɪɡzˈækt/"),
            make("excellent", "extremely good",
                 "優秀な・素晴らしい",
                 useCases: ["高評価を伝えるとき"],
                 examples: [
                    ("Excellent job!", "素晴らしい仕事！"),
                    ("Excellent service.", "素晴らしいサービス。")
                 ], ipa: "/ˈɛksələnt/"),
            make("exhausted", "extremely tired",
                 "疲れ果てた",
                 useCases: ["極度の疲労を表すとき"],
                 examples: [
                    ("I'm exhausted.", "もうクタクタ。"),
                    ("Exhausted from work.", "仕事で疲れ果ててる。")
                 ], ipa: "/ɛɡzˈɔːstɪd/"),
            make("expensive", "costing a lot",
                 "高価な・高い",
                 useCases: ["値段の高さを話すとき"],
                 examples: [
                    ("Too expensive.", "高すぎ。"),
                    ("That's expensive.", "それ高いね。")
                 ], ipa: "/ɪkspˈɛnsɪv/"),
            make("extreme", "very intense or severe",
                 "極端な",
                 useCases: ["過激な事象や意見を表すとき"],
                 examples: [
                    ("Extreme weather.", "異常気象。"),
                    ("That's a bit extreme.", "それはちょっと極端だ。")
                 ], ipa: "/ɪkstɹˈiːm/"),
            make("fancy", "elaborate; high-end",
                 "凝った・高級な",
                 useCases: ["お洒落で凝った物を表すとき"],
                 examples: [
                    ("Fancy restaurant.", "高級レストラン。"),
                    ("Nothing fancy.", "別に大したもんじゃない。")
                 ], ipa: "/fˈænsɪ/"),
            make("fragile", "easily broken",
                 "壊れやすい・繊細な",
                 useCases: ["注意して扱う物の話"],
                 examples: [
                    ("Handle with care—it's fragile.", "壊れ物注意。"),
                    ("Fragile feelings.", "繊細な気持ち。")
                 ], ipa: "/fɹˈædʒaɪl/"),
            make("frustrated", "feeling annoyed and helpless",
                 "イライラした・もどかしい",
                 useCases: ["うまくいかなくてイライラする話"],
                 examples: [
                    ("I'm so frustrated.", "めっちゃイライラ。"),
                    ("Frustrated with traffic.", "渋滞でイラついた。")
                 ], ipa: "/fɹʌstɹˈeɪtɪd/"),
            make("gentle", "kind; mild",
                 "優しい・穏やかな",
                 useCases: ["柔らかい性格や扱いを表すとき"],
                 examples: [
                    ("Be gentle with him.", "彼に優しくして。"),
                    ("Gentle breeze.", "穏やかな風。")
                 ], ipa: "/dʒˈɛntəl/"),
            make("gorgeous", "very beautiful; stunning",
                 "豪華な・美しい",
                 useCases: ["美しさを強く褒めるとき"],
                 examples: [
                    ("You look gorgeous!", "めっちゃ綺麗！"),
                    ("Gorgeous view.", "絶景。")
                 ], ipa: "/ɡˈɔːdʒəs/"),
            make("grateful", "feeling thankful",
                 "感謝している",
                 useCases: ["丁寧に感謝を伝えるとき"],
                 examples: [
                    ("I'm so grateful.", "本当に感謝してる。"),
                    ("Grateful for your help.", "助けてくれて感謝。")
                 ], ipa: "/ɡɹˈeɪtfəl/"),
            make("guilty", "responsible for wrongdoing; feeling regret",
                 "罪悪感のある・有罪の",
                 useCases: ["後ろめたさを感じるとき", "法的に有罪のとき"],
                 examples: [
                    ("I feel guilty.", "罪悪感ある。"),
                    ("Found guilty.", "有罪と判決された。")
                 ], ipa: "/ɡˈɪltɪ/"),
            make("honest", "truthful; sincere",
                 "正直な",
                 useCases: ["率直な意見を述べる前置き"],
                 examples: [
                    ("To be honest, no.", "正直、無理。"),
                    ("She's an honest person.", "彼女は正直な人だ。")
                 ], ipa: "/ˈɒnɪst/"),
            make("horrible", "very unpleasant",
                 "恐ろしい・ひどい",
                 useCases: ["ひどい状況を表すとき"],
                 examples: [
                    ("It was horrible.", "ひどかった。"),
                    ("Horrible weather.", "最悪の天気。")
                 ], ipa: "/hˈɒɹɪbəl/"),
            make("ideal", "perfect; most suitable",
                 "理想的な",
                 useCases: ["完璧な条件や状態を表すとき"],
                 examples: [
                    ("Ideal weather for a picnic.", "ピクニックに理想的な天気。"),
                    ("Not ideal, but okay.", "理想じゃないけど大丈夫。")
                 ], ipa: "/aɪdˈiəl/")
        ]
    }

    // MARK: - 名詞（追加 15）

    private static var extraNouns3: [Word] {
        [
            make("ability", "capacity to do something",
                 "能力",
                 useCases: ["特定のスキルや能力を語るとき"],
                 examples: [
                    ("She has the ability to lead.", "彼女にはリーダーの素質がある。"),
                    ("Trust your ability.", "自分の能力を信じて。")
                 ], ipa: "/ɐbˈɪlətɪ/"),
            make("advantage", "a beneficial point",
                 "利点・有利な点",
                 useCases: ["メリットを強調するとき"],
                 examples: [
                    ("Big advantage.", "大きなアドバンテージ。"),
                    ("Take advantage of it.", "それを活かして。")
                 ], ipa: "/ɐdvˈɑːntɪdʒ/"),
            make("advice", "an opinion offered as guidance",
                 "助言・アドバイス",
                 useCases: ["人にアドバイスを求める場面"],
                 examples: [
                    ("Any advice?", "なんかアドバイスある？"),
                    ("Good advice.", "いいアドバイスだ。")
                 ], ipa: "/ɐdvˈaɪs/"),
            make("affection", "warm feeling toward someone",
                 "愛情・好意",
                 useCases: ["親しみや愛情を表すとき"],
                 examples: [
                    ("Show some affection.", "もっと愛情表現して。"),
                    ("Deep affection for her.", "彼女への深い愛情。")
                 ], ipa: "/ɐfˈɛkʃən/"),
            make("agreement", "an arrangement; consensus",
                 "合意・契約",
                 useCases: ["双方の同意・契約締結の話"],
                 examples: [
                    ("We have an agreement.", "合意した。"),
                    ("Sign the agreement.", "契約書にサインして。")
                 ], ipa: "/ɐɡɹˈiːmənt/"),
            make("ambition", "strong desire to achieve",
                 "野心・大志",
                 useCases: ["将来の目標を語るとき"],
                 examples: [
                    ("Big ambition.", "大きな野望だ。"),
                    ("She has ambition.", "彼女には野心がある。")
                 ], ipa: "/æmbˈɪʃən/"),
            make("anxiety", "feeling of worry",
                 "不安・心配",
                 useCases: ["不安な気持ちを表すとき"],
                 examples: [
                    ("Social anxiety.", "対人不安。"),
                    ("My anxiety is high.", "不安が強い。")
                 ], ipa: "/æŋzˈaɪətɪ/"),
            make("appearance", "the way someone or something looks",
                 "外見・登場",
                 useCases: ["見た目について話すとき"],
                 examples: [
                    ("Her appearance changed.", "彼女、見た目が変わった。"),
                    ("Make a brief appearance.", "ちょっと顔出して。")
                 ], ipa: "/ɐpˈiəɹəns/"),
            make("argument", "discussion; quarrel",
                 "議論・口論",
                 useCases: ["討論や口論を表すとき"],
                 examples: [
                    ("Big argument last night.", "昨夜大喧嘩した。"),
                    ("Strong argument.", "強い論拠だ。")
                 ], ipa: "/ˈɑːɡjuːmənt/"),
            make("assistance", "help; support",
                 "援助・助力",
                 useCases: ["公式に支援を頼む話"],
                 examples: [
                    ("Need any assistance?", "お手伝いいる？"),
                    ("Thanks for the assistance.", "援助ありがとう。")
                 ], ipa: "/ɐsˈɪstəns/"),
            make("attitude", "a settled way of thinking",
                 "態度・姿勢",
                 useCases: ["人の態度や心構えを話すとき"],
                 examples: [
                    ("Bad attitude.", "態度悪い。"),
                    ("Positive attitude!", "前向きな姿勢で！")
                 ], ipa: "/ˈætɪtjˌuːd/"),
            make("attraction", "something that pulls; appeal",
                 "魅力・引きつけるもの",
                 useCases: ["観光地や人の魅力を話すとき"],
                 examples: [
                    ("Tourist attraction.", "観光名所。"),
                    ("There's an attraction between them.", "二人には惹かれ合うものがある。")
                 ], ipa: "/ɐtɹˈækʃən/"),
            make("audience", "people watching or listening",
                 "観客・聴衆",
                 useCases: ["イベントやプレゼンの聴衆を話すとき"],
                 examples: [
                    ("Big audience tonight.", "今夜は観客多い。"),
                    ("Engage the audience.", "観客を引き込んで。")
                 ], ipa: "/ˈɔːdiəns/"),
            make("authority", "power; an expert",
                 "権威・当局",
                 useCases: ["権限のある立場や専門家を表すとき"],
                 examples: [
                    ("Speak to the authority.", "当局に問い合わせて。"),
                    ("She's an authority on art.", "彼女は美術の権威だ。")
                 ], ipa: "/ɐθˈɒɹɪtɪ/"),
            make("basis", "the foundation of something",
                 "基礎・根拠",
                 useCases: ["論拠や前提を話すとき"],
                 examples: [
                    ("On a daily basis.", "毎日ベースで。"),
                    ("No basis for the claim.", "その主張に根拠はない。")
                 ], ipa: "/bˈeɪsɪs/")
        ]
    }

    // MARK: - 慣用表現・つなぎ表現（追加 15）

    private static var extraConnectives3: [Word] {
        [
            make("for one thing", "as a first reason",
                 "第一に・一つには",
                 useCases: ["理由を列挙するとき"],
                 examples: [
                    ("For one thing, it's expensive.", "まず第一に、高い。"),
                    ("For one thing, I'm tired.", "一つには疲れてる。")
                 ], ipa: "/fɔː wˈɒn θˈɪŋ/"),
            make("for another thing", "as another reason",
                 "もう一つには",
                 useCases: ["追加の理由を出すとき"],
                 examples: [
                    ("For another thing, it's far.", "もう一つには、遠い。"),
                    ("For another thing, it's late.", "それに、もう遅い。")
                 ], ipa: "/fɔːɹ ɐnˈʌðɐ θˈɪŋ/"),
            make("last but not least", "finally and importantly",
                 "最後になるが重要なこととして",
                 useCases: ["締めくくりに大事なことを述べるとき"],
                 examples: [
                    ("Last but not least, thank you.", "最後になりますが、ありがとう。"),
                    ("And last but not least, the budget.", "最後に大事な点、予算ね。")
                 ], ipa: "/lˈɑːst bˌʌt nˌɒt lˈiːst/"),
            make("to begin with", "first of all",
                 "まず初めに",
                 useCases: ["話を始めるとき"],
                 examples: [
                    ("To begin with, hi.", "まずは、ハロー。"),
                    ("To begin with, let's plan.", "まず計画を立てよう。")
                 ], ipa: "/tə bɪɡˈɪn wɪð/"),
            make("to make matters worse", "as a worsening factor",
                 "さらに悪いことに",
                 useCases: ["悪い状況に追加の悪材料を言うとき"],
                 examples: [
                    ("To make matters worse, it rained.", "おまけに雨まで降った。"),
                    ("To make matters worse, he's sick.", "さらに悪いことに、彼が体調不良。")
                 ], ipa: "/tə mˌeɪk mˈætəz wˈɜːs/"),
            make("on top of everything", "in addition to everything",
                 "おまけに・その上",
                 useCases: ["さらに何かが起きたと強調するとき"],
                 examples: [
                    ("On top of everything, I lost my keys.", "おまけに鍵までなくした。"),
                    ("On top of everything else.", "それに加えて。")
                 ], ipa: "/ˌɒn tˈɒp ɒv ˈɛvɹɪθˌɪŋ/"),
            make("in addition to", "as well as",
                 "〜に加えて",
                 useCases: ["要素を追加して話すとき"],
                 examples: [
                    ("In addition to coffee, tea.", "コーヒーに加えて紅茶も。"),
                    ("In addition to that, yes.", "それに加えて、はい。")
                 ], ipa: "/ɪn ɐdˈɪʃən tuː/"),
            make("as well as", "in addition to; and also",
                 "〜だけでなく",
                 useCases: ["並列して述べるとき"],
                 examples: [
                    ("She sings as well as dances.", "彼女、歌も踊りもできる。"),
                    ("Tea as well as coffee.", "コーヒーだけでなく紅茶も。")
                 ], ipa: "/æz wˈɛl æz/"),
            make("rather than", "instead of",
                 "〜よりむしろ",
                 useCases: ["優先する選択肢を伝えるとき"],
                 examples: [
                    ("Tea rather than coffee.", "コーヒーじゃなくて紅茶。"),
                    ("Walk rather than drive.", "車じゃなくて歩こう。")
                 ], ipa: "/ɹˈɑːðɐ ðɐn/"),
            make("instead of", "in place of",
                 "〜の代わりに",
                 useCases: ["代替案を提示するとき"],
                 examples: [
                    ("Instead of pizza, sushi.", "ピザじゃなくて寿司。"),
                    ("Instead of leaving, stay.", "帰らないで残って。")
                 ], ipa: "/ɪnstˈɛd ɒv/"),
            make("provided that", "on the condition that",
                 "〜という条件で",
                 useCases: ["条件付きで合意する場面"],
                 examples: [
                    ("Provided that you agree.", "君が同意する条件で。"),
                    ("Provided that it rains.", "雨が降ったらの話だけど。")
                 ], ipa: "/pɹəvˈaɪdɪd ðˈæt/"),
            make("suppose that", "assuming that",
                 "〜と仮定すれば",
                 useCases: ["仮定で話を進めるとき"],
                 examples: [
                    ("Suppose that he's late.", "彼が遅れたとして。"),
                    ("Suppose that's true.", "それが本当だとしよう。")
                 ], ipa: "/səpˈəʊz ðˈæt/"),
            make("assuming that", "if we accept",
                 "〜と仮定して",
                 useCases: ["前提を立てて議論するとき"],
                 examples: [
                    ("Assuming that's true...", "それが本当だとしたら…"),
                    ("Assuming that we leave now.", "今出発するとして。")
                 ], ipa: "/ɐsjˈuːmɪŋ ðˈæt/"),
            make("given that", "since; considering",
                 "〜を考えると",
                 useCases: ["状況を踏まえて結論する場面"],
                 examples: [
                    ("Given that it's raining...", "雨だから…"),
                    ("Given that you're new.", "新人だから仕方ない。")
                 ], ipa: "/ɡˈɪvən ðˈæt/"),
            make("considering that", "taking into account",
                 "〜であることを考えると",
                 useCases: ["事情を踏まえて評価するとき"],
                 examples: [
                    ("Considering that, well done.", "それを考えれば、よくやった。"),
                    ("Considering that, fair.", "それを踏まえれば妥当。")
                 ], ipa: "/kənsˈɪdəɹɪŋ ðˈæt/")
        ]
    }

    // MARK: - 句動詞・カジュアル（追加 16）

    private static var casualPhrasals: [Word] {
        [
            make("hang in there", "stay strong; keep going",
                 "頑張れ・耐えて",
                 useCases: ["くじけそうな相手を励ますとき"],
                 examples: [
                    ("Hang in there!", "頑張って！"),
                    ("Just hang in there a bit longer.", "もう少し耐えて。")
                 ], ipa: "/hˈæŋ ɪn ðˈeə/"),
            make("freak out", "panic or get very upset",
                 "パニックになる・取り乱す",
                 useCases: ["びっくりしすぎて慌てる話"],
                 examples: [
                    ("Don't freak out.", "パニックにならないで。"),
                    ("She freaked out when she saw it.", "彼女、見てパニックになった。")
                 ], ipa: "/fɹˈiːk ˈaʊt/"),
            make("calm down", "become less upset",
                 "落ち着く",
                 useCases: ["興奮している人をなだめるとき"],
                 examples: [
                    ("Calm down, it's fine.", "落ち着いて、大丈夫だから。"),
                    ("Just calm down for a sec.", "ちょっと落ち着いて。")
                 ], ipa: "/kˈɑːm dˈaʊn/"),
            make("cut it out", "stop doing something annoying",
                 "やめろ",
                 useCases: ["うるさい行為を止めるとき"],
                 examples: [
                    ("Cut it out!", "やめて！"),
                    ("Hey, cut it out.", "おい、やめろよ。")
                 ], ipa: "/kˈʌt ɪt ˈaʊt/"),
            make("get out", "leave; or expression of disbelief",
                 "出て行け・うそでしょ",
                 useCases: ["強く追い出すとき", "信じられない時の感嘆として"],
                 examples: [
                    ("Get out of here.", "出てけ。"),
                    ("Get out! No way!", "うそでしょ！マジで！？")
                 ], ipa: "/ɡɛt ˈaʊt/"),
            make("come on", "hurry up; expression of disbelief",
                 "早く・冗談でしょ",
                 useCases: ["急かすとき", "ありえない反応をするとき"],
                 examples: [
                    ("Come on, let's go!", "ほら、行こう！"),
                    ("Oh come on, really?", "ちょっと、マジで？")
                 ], ipa: "/kˈʌm ˈɒn/"),
            make("hang on", "wait a moment",
                 "待って・ちょっと",
                 useCases: ["相手にちょっと待ってと言うとき"],
                 examples: [
                    ("Hang on a sec.", "ちょっと待って。"),
                    ("Hang on, let me check.", "待って、確認する。")
                 ], ipa: "/hˈæŋ ˈɒn/"),
            make("mess around", "fool around; play",
                 "ふざける・遊ぶ",
                 useCases: ["友達とじゃれてる話", "真面目にやらない話"],
                 examples: [
                    ("Stop messing around.", "ふざけないで。"),
                    ("We were just messing around.", "ただふざけてただけ。")
                 ], ipa: "/mˈɛs ɐɹˈaʊnd/"),
            make("goof off", "slack off; mess around",
                 "サボる・ふざける",
                 useCases: ["仕事や勉強をさぼる話"],
                 examples: [
                    ("Don't goof off in class.", "授業中ふざけるな。"),
                    ("They were goofing off all day.", "彼ら一日中サボってた。")
                 ], ipa: "/ɡˈuːf ˈɒf/"),
            make("chill out", "relax; calm down",
                 "リラックスする",
                 useCases: ["焦ってる相手をなだめるとき"],
                 examples: [
                    ("Just chill out.", "リラックスして。"),
                    ("Let's chill out tonight.", "今夜はゆっくりしよう。")
                 ], ipa: "/tʃˈɪl ˈaʊt/"),
            make("speed up", "go faster",
                 "早めて・スピードを上げる",
                 useCases: ["急ぐよう促すとき"],
                 examples: [
                    ("Speed up, we're late.", "急いで、遅れるよ。"),
                    ("Can you speed it up?", "もっと早くできる？")
                 ], ipa: "/spˈiːd ˈʌp/"),
            make("swing by", "make a quick stop",
                 "ちょっと寄る",
                 useCases: ["軽く立ち寄る予定の話"],
                 examples: [
                    ("I'll swing by later.", "後でちょっと寄るね。"),
                    ("Swing by the store.", "店にちょっと寄って。")
                 ], ipa: "/swˈɪŋ bˈaɪ/"),
            make("head out", "leave; depart",
                 "出る・出発する",
                 useCases: ["そろそろ帰る・出発する話"],
                 examples: [
                    ("I gotta head out.", "そろそろ出るね。"),
                    ("We'll head out around 8.", "8時くらいに出るよ。")
                 ], ipa: "/hˈɛd ˈaʊt/"),
            make("get going", "start moving; depart",
                 "出発する・取りかかる",
                 useCases: ["移動や作業を始める話"],
                 examples: [
                    ("Let's get going.", "そろそろ行こう。"),
                    ("Time to get going.", "もう出発の時間。")
                 ], ipa: "/ɡɛt ɡˈəʊɪŋ/"),
            make("wrap up", "finish; conclude",
                 "終わらせる・まとめる",
                 useCases: ["仕事や会議を締めくくる話"],
                 examples: [
                    ("Let's wrap this up.", "これ終わらせよう。"),
                    ("I'll wrap up by 5.", "5時までに片付ける。")
                 ], ipa: "/ɹˈæp ˈʌp/"),
            make("screw up", "make a serious mistake",
                 "失敗する・ヘマする",
                 useCases: ["大きなミスをした話"],
                 examples: [
                    ("I really screwed up.", "完全にやらかした。"),
                    ("Don't screw it up.", "ミスらないで。")
                 ], ipa: "/skɹˈuː ˈʌp/")
        ]
    }

    // MARK: - カジュアル口語フィラー（追加 10）

    private static var casualFillers: [Word] {
        [
            make("no way", "absolutely not; that's incredible",
                 "ありえない・うそでしょ",
                 useCases: ["強い拒否や驚きを表すとき"],
                 examples: [
                    ("No way!", "ありえない！"),
                    ("No way, really?", "うそ、マジで？")
                 ], ipa: "/nˈəʊ wˈeɪ/"),
            make("so what", "why does that matter?",
                 "だから何？",
                 useCases: ["相手の主張を軽く突き返すとき"],
                 examples: [
                    ("So what?", "だから何？"),
                    ("So what if I do?", "だから何？やってもいいでしょ。")
                 ], ipa: "/sˌəʊ wˈɒt/"),
            make("not really", "not exactly; a soft no",
                 "そうでもない・別に",
                 useCases: ["否定をやんわり伝えるとき"],
                 examples: [
                    ("Not really, no.", "うーん、別に。"),
                    ("Tired? Not really.", "疲れてる？まあそうでもない。")
                 ], ipa: "/nˌɒt ɹˈiəlɪ/"),
            make("kind of like", "somewhat similar to",
                 "みたいな感じ",
                 useCases: ["何かに似ていると説明するとき"],
                 examples: [
                    ("It's kind of like Twitter.", "Twitter みたいな感じ。"),
                    ("Kind of like a hat, but bigger.", "帽子みたいだけど大きい。")
                 ], ipa: "/kˈaɪnd ɒv lˈaɪk/"),
            make("or whatever", "or something similar",
                 "か何か",
                 useCases: ["はっきり指定せずぼかすとき"],
                 examples: [
                    ("Pizza or whatever.", "ピザか何か。"),
                    ("Friday or whatever works.", "金曜とか、都合つく日で。")
                 ], ipa: "/ɔː wɒtˈɛvɐ/"),
            make("pretty much", "almost completely",
                 "ほぼ・大体",
                 useCases: ["ほぼ完了している話を伝えるとき"],
                 examples: [
                    ("Pretty much done.", "ほぼ終わってる。"),
                    ("That's pretty much it.", "まあそんなとこ。")
                 ], ipa: "/pɹˈɪtɪ mˈʌtʃ/"),
            make("more or less", "approximately; roughly",
                 "だいたい・ほぼ",
                 useCases: ["大雑把に言うとき"],
                 examples: [
                    ("More or less, yeah.", "まあだいたいそんな感じ。"),
                    ("More or less the same.", "ほぼ同じ。")
                 ], ipa: "/mˈɔːɹ ɔː lˈɛs/"),
            make("big time", "to a great extent",
                 "超・めっちゃ",
                 useCases: ["強調したいとき"],
                 examples: [
                    ("I owe you big time.", "めっちゃ恩がある。"),
                    ("He messed up big time.", "彼、超やらかした。")
                 ], ipa: "/bˈɪɡ tˈaɪm/"),
            make("for sure", "definitely; absolutely",
                 "確かに・もちろん",
                 useCases: ["強く同意するとき"],
                 examples: [
                    ("For sure!", "もちろん！"),
                    ("That's a yes for sure.", "それは確実にYES。")
                 ], ipa: "/fɔː ʃˈɔː/"),
            make("no doubt", "without question",
                 "間違いない",
                 useCases: ["疑いなく賛同するとき"],
                 examples: [
                    ("No doubt about it.", "間違いない。"),
                    ("She'll win, no doubt.", "彼女が勝つよ、間違いなく。")
                 ], ipa: "/nˈəʊ dˈaʊt/")
        ]
    }

    // MARK: - リアクション・返事（追加 20）

    private static var reactionWords: [Word] {
        [
            make("my bad", "my mistake; sorry",
                 "ごめん・私のミス",
                 useCases: ["軽く謝るとき"],
                 examples: [
                    ("My bad.", "ごめん。"),
                    ("Oh, my bad — didn't see you.", "あ、ごめん、気づかなかった。")
                 ], ipa: "/maɪ bˈæd/"),
            make("no worries", "don't worry; it's fine",
                 "気にしないで",
                 useCases: ["相手の謝罪を軽く受け流すとき"],
                 examples: [
                    ("No worries!", "気にしないで！"),
                    ("No worries, it's fine.", "大丈夫、平気だよ。")
                 ], ipa: "/nˈəʊ wˈʌɹɪz/"),
            make("no problem", "no trouble at all",
                 "問題ない・どういたしまして",
                 useCases: ["お礼に応えるとき"],
                 examples: [
                    ("No problem!", "どういたしまして！"),
                    ("No problem, anytime.", "全然大丈夫、いつでも。")
                 ], ipa: "/nˈəʊ pɹˈɒbləm/"),
            make("no biggie", "not a big deal",
                 "大したことない",
                 useCases: ["軽く済ませるとき"],
                 examples: [
                    ("It's no biggie.", "大したことないよ。"),
                    ("No biggie, forget it.", "気にしないで、忘れて。")
                 ], ipa: "/nˈəʊ bˈɪɡɪ/"),
            make("no sweat", "no problem; easy",
                 "楽勝・問題なし",
                 useCases: ["余裕でできると伝えるとき"],
                 examples: [
                    ("No sweat.", "楽勝。"),
                    ("Yeah, no sweat.", "うん、余裕。")
                 ], ipa: "/nˈəʊ swˈɛt/"),
            make("you bet", "of course; certainly",
                 "もちろん",
                 useCases: ["快く同意するとき"],
                 examples: [
                    ("You bet!", "もちろん！"),
                    ("You bet I will.", "やるに決まってる。")
                 ], ipa: "/juː bˈɛt/"),
            make("you got it", "got it; I'll do it",
                 "任せて・了解",
                 useCases: ["頼みを快く引き受けるとき"],
                 examples: [
                    ("You got it!", "任せて！"),
                    ("You got it, boss.", "了解、ボス。")
                 ], ipa: "/juː ɡˈɒt ɪt/"),
            make("got it", "I understand",
                 "分かった",
                 useCases: ["内容を理解したと伝えるとき"],
                 examples: [
                    ("Got it.", "分かった。"),
                    ("Got it, thanks.", "了解、ありがとう。")
                 ], ipa: "/ɡˈɒt ɪt/"),
            make("gotcha", "I understand; got you",
                 "分かった・捕まえた",
                 useCases: ["カジュアルに「了解」と伝えるとき"],
                 examples: [
                    ("Gotcha.", "了解。"),
                    ("Gotcha, makes sense.", "なるほど、わかる。")
                 ], ipa: "/ɡˈɒtʃɐ/"),
            make("right on", "exactly; cool",
                 "その通り・いいね",
                 useCases: ["賛同や称賛を軽く伝えるとき"],
                 examples: [
                    ("Right on!", "いいね！"),
                    ("Right on, dude.", "その通りだよ。")
                 ], ipa: "/ɹˈaɪt ˈɒn/"),
            make("way to go", "good job",
                 "よくやった",
                 useCases: ["称賛するとき（皮肉でも）"],
                 examples: [
                    ("Way to go!", "やったね！"),
                    ("Hey, way to go!", "よくやった！")
                 ], ipa: "/wˈeɪ tə ɡˈəʊ/"),
            make("good for you", "I'm happy for you",
                 "よかったね",
                 useCases: ["相手の成功を喜ぶとき"],
                 examples: [
                    ("Good for you!", "よかったね！"),
                    ("Aww, good for you.", "わー、よかったじゃん。")
                 ], ipa: "/ɡˈʊd fɔː juː/"),
            make("lucky you", "lucky on your part",
                 "いいなあ・うらやましい",
                 useCases: ["相手をうらやむとき"],
                 examples: [
                    ("Lucky you!", "いいなあ！"),
                    ("Lucky you got the day off.", "休みもらえてラッキーだね。")
                 ], ipa: "/lˈʌkɪ juː/"),
            make("bummer", "that's too bad",
                 "残念",
                 useCases: ["残念な話に共感するとき"],
                 examples: [
                    ("That's a bummer.", "それは残念。"),
                    ("Aw, bummer.", "あー、残念。")
                 ], ipa: "/bˈʌmɐ/"),
            make("shoot", "darn; mild expression of frustration",
                 "しまった",
                 useCases: ["軽く失敗した時の独り言"],
                 examples: [
                    ("Shoot, I forgot.", "しまった、忘れた。"),
                    ("Shoot!", "しまった！")
                 ], ipa: "/ʃˈuːt/"),
            make("dang", "dammit (mild)",
                 "くそ・ちぇっ",
                 useCases: ["軽くがっかりした時の表現"],
                 examples: [
                    ("Dang, that's expensive.", "くそっ、高い。"),
                    ("Dang it.", "ちぇっ。")
                 ], ipa: "/dˈæŋ/"),
            make("darn", "darn; mild expletive",
                 "ちくしょう",
                 useCases: ["軽い悔しさ"],
                 examples: [
                    ("Darn, I missed it.", "ちくしょう、逃した。"),
                    ("Darn it!", "ちぇっ！")
                 ], ipa: "/dˈɑːn/"),
            make("crap", "expression of frustration",
                 "まずい・くそ",
                 useCases: ["失敗・困った時の口語"],
                 examples: [
                    ("Crap, I forgot my keys.", "まずい、鍵忘れた。"),
                    ("Oh crap.", "やばい。")
                 ], ipa: "/kɹˈæp/"),
            make("whoops", "oops; I made a small mistake",
                 "おっと",
                 useCases: ["小さなミスをした時"],
                 examples: [
                    ("Whoops, sorry!", "おっと、ごめん！"),
                    ("Whoops, my bad.", "あ、ごめんごめん。")
                 ], ipa: "/wˈuːps/"),
            make("oops", "oh, a small mistake",
                 "しまった",
                 useCases: ["うっかりミスを伝えるとき"],
                 examples: [
                    ("Oops!", "しまった！"),
                    ("Oops, I dropped it.", "あ、落とした。")
                 ], ipa: "/ˈuːps/")
        ]
    }

    // MARK: - 口語イディオム（追加 12）

    private static var casualIdioms: [Word] {
        [
            make("hit the road", "leave; start a journey",
                 "出発する",
                 useCases: ["そろそろ出ようと言うとき"],
                 examples: [
                    ("Time to hit the road.", "そろそろ出発しよう。"),
                    ("Let's hit the road.", "出発しよう。")
                 ], ipa: "/hˈɪt ðə ɹˈəʊd/"),
            make("call it a night", "end the day; go to sleep",
                 "今夜はもう寝る・お開きにする",
                 useCases: ["夜の集まりを終える話"],
                 examples: [
                    ("Let's call it a night.", "そろそろ寝よう。"),
                    ("I'm calling it a night.", "もう寝るね。")
                 ], ipa: "/kˈɔːl ɪt ɐ nˈaɪt/"),
            make("grab a bite", "eat a quick meal",
                 "軽く食べる",
                 useCases: ["気軽に食事に行く話"],
                 examples: [
                    ("Wanna grab a bite?", "ちょっと食べに行く？"),
                    ("Let's grab a bite.", "軽く食べに行こう。")
                 ], ipa: "/ɡɹˈæb ɐ bˈaɪt/"),
            make("grab coffee", "go for coffee",
                 "コーヒーを飲みに行く",
                 useCases: ["カジュアルにお茶しようと誘うとき"],
                 examples: [
                    ("Wanna grab coffee?", "コーヒー行く？"),
                    ("Let's grab coffee tomorrow.", "明日コーヒーしよう。")
                 ], ipa: "/ɡɹˈæb kˈɒfɪ/"),
            make("catch some Z's", "get some sleep",
                 "ひと眠りする",
                 useCases: ["眠りに行くカジュアルな表現"],
                 examples: [
                    ("Gonna catch some Z's.", "ちょっと寝てくる。"),
                    ("Need to catch some Z's.", "ひと眠りしないと。")
                 ], ipa: "/kˈætʃ sˌʌm zˈɛdz/"),
            make("be beat", "be very tired",
                 "疲れ果てている",
                 useCases: ["疲労を伝える口語表現"],
                 examples: [
                    ("I'm beat.", "もうクタクタ。"),
                    ("She looks beat.", "彼女、疲れて見える。")
                 ], ipa: "/biː bˈiːt/"),
            make("be wiped out", "be exhausted",
                 "クタクタ・へとへと",
                 useCases: ["極度に疲れているとき"],
                 examples: [
                    ("I'm wiped out.", "もうへとへと。"),
                    ("Wiped out from work.", "仕事でクタクタ。")
                 ], ipa: "/biː wˈaɪpt ˈaʊt/"),
            make("butter up", "flatter to gain favor",
                 "おだてる・機嫌を取る",
                 useCases: ["お世辞を言って何か頼む話"],
                 examples: [
                    ("Stop trying to butter me up.", "おだてないで。"),
                    ("He's buttering up the boss.", "彼、上司にゴマすってる。")
                 ], ipa: "/bˈʌtɐɹ ˈʌp/"),
            make("bail on", "back out of plans",
                 "約束をすっぽかす",
                 useCases: ["予定を急にキャンセルする話"],
                 examples: [
                    ("She bailed on me.", "彼女、ドタキャンした。"),
                    ("Don't bail on us!", "ドタキャンしないで！")
                 ], ipa: "/bˈeɪl ˈɒn/"),
            make("flake out", "fail to show up; cancel last minute",
                 "ドタキャンする",
                 useCases: ["人の信用を落とすキャンセル行動"],
                 examples: [
                    ("He flaked out again.", "またドタキャンされた。"),
                    ("Don't flake out on me.", "ドタキャンしないで。")
                 ], ipa: "/flˈeɪk ˈaʊt/"),
            make("chicken out", "lose courage and back away",
                 "ビビる・尻込みする",
                 useCases: ["怖気付いてやめる話"],
                 examples: [
                    ("Don't chicken out!", "ビビるなよ！"),
                    ("I chickened out.", "怖くてやめちゃった。")
                 ], ipa: "/tʃˈɪkɪn ˈaʊt/"),
            make("suck up to", "flatter to gain favor",
                 "ゴマをする",
                 useCases: ["上司に媚びる話"],
                 examples: [
                    ("He always sucks up to the boss.", "彼、いつも上司にゴマすってる。"),
                    ("Stop sucking up.", "ゴマすりやめて。")
                 ], ipa: "/sˈʌk ˈʌp tuː/")
        ]
    }

    // MARK: - 感情・状態（追加 10）

    private static var emotionStates: [Word] {
        [
            make("bummed", "feeling down; disappointed",
                 "落ち込んでる・がっかり",
                 useCases: ["残念な気持ちを伝えるとき"],
                 examples: [
                    ("I'm so bummed.", "めっちゃ落ち込んでる。"),
                    ("Bummed about the trip.", "旅行行けなくてがっかり。")
                 ], ipa: "/bˈʌmd/"),
            make("stressed out", "very stressed",
                 "ストレスでまいってる",
                 useCases: ["ストレス過剰な状態を伝えるとき"],
                 examples: [
                    ("I'm stressed out.", "もうストレスたまってる。"),
                    ("She's super stressed out.", "彼女、めっちゃストレスためてる。")
                 ], ipa: "/stɹˈɛst ˈaʊt/"),
            make("freaked out", "shocked or panicked",
                 "びっくりした・動揺した",
                 useCases: ["びっくりして動揺した話"],
                 examples: [
                    ("I was so freaked out.", "めっちゃびっくりした。"),
                    ("She looked freaked out.", "彼女、動揺してた。")
                 ], ipa: "/fɹˈiːkt ˈaʊt/"),
            make("psyched", "very excited",
                 "ワクワクしてる",
                 useCases: ["楽しみで仕方ない気持ちを伝えるとき"],
                 examples: [
                    ("I'm psyched!", "めっちゃ楽しみ！"),
                    ("Totally psyched for the trip.", "旅行ワクワクしてる。")
                 ], ipa: "/sˈaɪkd/"),
            make("stoked", "extremely excited",
                 "めっちゃ興奮してる",
                 useCases: ["カジュアルに興奮を表すとき"],
                 examples: [
                    ("I'm stoked!", "めっちゃテンション上がってる！"),
                    ("Stoked to see you.", "会えるの楽しみ。")
                 ], ipa: "/stˈəʊkt/"),
            make("pumped", "fired up; energized",
                 "気合入ってる・テンション高い",
                 useCases: ["やる気満々の状態を表すとき"],
                 examples: [
                    ("I'm pumped for this!", "これ、めっちゃテンション上がる！"),
                    ("She's pumped up.", "彼女、気合入ってる。")
                 ], ipa: "/pˈʌmpt/"),
            make("wasted", "drunk; or exhausted",
                 "酔っ払い・疲れ果て",
                 useCases: ["酔っている話", "完全に疲れた話"],
                 examples: [
                    ("He got wasted last night.", "彼、昨夜ベロベロだった。"),
                    ("I'm wasted from work.", "仕事でぐったり。")
                 ], ipa: "/wˈeɪstɪd/"),
            make("jet-lagged", "suffering from jet lag",
                 "時差ボケ",
                 useCases: ["長距離フライト後のだるさ"],
                 examples: [
                    ("I'm so jet-lagged.", "時差ボケがひどい。"),
                    ("Still jet-lagged from Japan.", "日本からの時差ボケが残ってる。")
                 ], ipa: "/dʒˈɛtlˈæɡd/"),
            make("starving", "very hungry",
                 "めっちゃお腹空いた",
                 useCases: ["強い空腹を表すとき"],
                 examples: [
                    ("I'm starving!", "お腹ペコペコ！"),
                    ("Starving — let's eat.", "お腹空いた、食べよう。")
                 ], ipa: "/stˈɑːvɪŋ/"),
            make("full", "no longer hungry",
                 "お腹いっぱい",
                 useCases: ["食事の後で満腹を伝えるとき"],
                 examples: [
                    ("I'm full.", "お腹いっぱい。"),
                    ("So full I can't move.", "満腹で動けない。")
                 ], ipa: "/fˈʊl/")
        ]
    }

    // MARK: - 句動詞（追加 25）

    private static var casualPhrasals4: [Word] {
        [
            make("blow off", "ignore; skip out on",
                 "すっぽかす・無視する",
                 useCases: ["約束を無視する話", "課題を放置する話"],
                 examples: [
                    ("He blew off the meeting.", "彼、会議すっぽかした。"),
                    ("Don't blow it off.", "無視しないで。")
                 ], ipa: "/blˈəʊ ˈɒf/"),
            make("brush off", "dismiss casually",
                 "軽くあしらう・無視する",
                 useCases: ["相手の発言を軽く受け流す話"],
                 examples: [
                    ("She brushed me off.", "彼女、私を軽くあしらった。"),
                    ("Don't brush it off.", "軽くあしらわないで。")
                 ], ipa: "/bɹˈʌʃ ˈɒf/"),
            make("brush up on", "review or refresh skills",
                 "復習する・腕を磨き直す",
                 useCases: ["スキルを再確認する話"],
                 examples: [
                    ("I need to brush up on my Spanish.", "スペイン語復習しないと。"),
                    ("Brush up on the basics.", "基礎を復習して。")
                 ], ipa: "/bɹˈʌʃ ˌʌp ˈɒn/"),
            make("catch on", "understand; become popular",
                 "理解する・流行る",
                 useCases: ["新しい流れに気づく話", "コツを掴む話"],
                 examples: [
                    ("She caught on quickly.", "彼女、すぐに理解した。"),
                    ("This trend is catching on.", "この流行、広がってる。")
                 ], ipa: "/kˈætʃ ˈɒn/"),
            make("come around", "change one's mind; regain consciousness",
                 "考えを変える・意識を取り戻す",
                 useCases: ["相手が納得し始める話", "気絶から意識が戻る話"],
                 examples: [
                    ("He'll come around eventually.", "そのうち彼も納得するよ。"),
                    ("She came around after fainting.", "彼女、気絶から意識が戻った。")
                 ], ipa: "/kˈʌm ɐɹˈaʊnd/"),
            make("cop out", "back out; make excuses",
                 "言い逃れする・逃げる",
                 useCases: ["責任から逃げる話"],
                 examples: [
                    ("Don't cop out.", "逃げないで。"),
                    ("That's a cop-out answer.", "それは逃げの答えだ。")
                 ], ipa: "/kˈɒp ˈaʊt/"),
            make("crack down on", "enforce strictly",
                 "厳しく取り締まる",
                 useCases: ["違反者を厳しく取り締まる話"],
                 examples: [
                    ("They cracked down on speeders.", "スピード違反を取り締まった。"),
                    ("Cops are cracking down.", "警察が取り締まり強化してる。")
                 ], ipa: "/kɹˈæk dˌaʊn ˈɒn/"),
            make("doll up", "dress up nicely",
                 "めかしこむ",
                 useCases: ["きれいに着飾る話"],
                 examples: [
                    ("She dolled up for the party.", "彼女、パーティー用にめかしこんだ。"),
                    ("All dolled up tonight!", "今夜はバッチリ決めてるね！")
                 ], ipa: "/dˈɒl ˈʌp/"),
            make("drag out", "make something take longer",
                 "長引かせる",
                 useCases: ["話や手続きを引き延ばす話"],
                 examples: [
                    ("Don't drag this out.", "長引かせないで。"),
                    ("They dragged out the meeting.", "会議を引き延ばした。")
                 ], ipa: "/dɹˈæɡ ˈaʊt/"),
            make("drum up", "gather; stir up",
                 "かき集める・盛り上げる",
                 useCases: ["興味や支援を集める話"],
                 examples: [
                    ("Drum up some support.", "支持を集めよう。"),
                    ("Trying to drum up business.", "ビジネスを盛り上げようとしてる。")
                 ], ipa: "/dɹˈʌm ˈʌp/"),
            make("gloss over", "treat superficially; cover up",
                 "ごまかす・うわべを取り繕う",
                 useCases: ["重要な点を流して説明する話"],
                 examples: [
                    ("He glossed over the details.", "彼、細かい部分はごまかした。"),
                    ("Don't gloss over it.", "適当にごまかさないで。")
                 ], ipa: "/ɡlˈɒs ˈəʊvɐ/"),
            make("goof around", "fool around; loaf about",
                 "ぶらぶら遊ぶ・だらける",
                 useCases: ["特に目的なく遊ぶ話"],
                 examples: [
                    ("We goofed around all day.", "一日中ダラダラ遊んでた。"),
                    ("Stop goofing around.", "ふざけてないで。")
                 ], ipa: "/ɡˈuːf ɐɹˈaʊnd/"),
            make("harp on", "talk about repeatedly",
                 "くどくどと言う",
                 useCases: ["同じ話を繰り返し蒸し返す話"],
                 examples: [
                    ("Stop harping on about it.", "そのことくどくど言わないで。"),
                    ("She always harps on about money.", "彼女、いつもお金の話ばっかり。")
                 ], ipa: "/hˈɑːp ˈɒn/"),
            make("hash out", "discuss to resolve",
                 "議論して解決する",
                 useCases: ["問題を話し合いで詰める話"],
                 examples: [
                    ("Let's hash it out.", "話し合って決めよう。"),
                    ("We hashed out a plan.", "計画をまとめた。")
                 ], ipa: "/hˈæʃ ˈaʊt/"),
            make("kick back", "relax; chill",
                 "くつろぐ・リラックス",
                 useCases: ["仕事終わりにのんびりする話"],
                 examples: [
                    ("Just kick back and relax.", "ただゆっくりしよう。"),
                    ("Kick back with a beer.", "ビール片手にくつろぐ。")
                 ], ipa: "/kˈɪk bˈæk/"),
            make("knuckle down", "buckle down; work seriously",
                 "真剣に取り組む",
                 useCases: ["気合を入れて作業する話"],
                 examples: [
                    ("Time to knuckle down.", "本気出す時間だ。"),
                    ("Knuckle down and study.", "本気で勉強しよう。")
                 ], ipa: "/nˈʌkəl dˈaʊn/"),
            make("muscle in", "force one's way in",
                 "強引に割り込む",
                 useCases: ["強引に介入する話"],
                 examples: [
                    ("He muscled in on the deal.", "彼、その案件に強引に割り込んだ。"),
                    ("Don't muscle in.", "強引に入ってこないで。")
                 ], ipa: "/mˈʌsəl ˈɪn/"),
            make("nail down", "pin down; finalize",
                 "はっきりさせる・確定する",
                 useCases: ["不確定なことを固める話"],
                 examples: [
                    ("Let's nail down the date.", "日付を確定させよう。"),
                    ("Nail down the details.", "細部を詰めて。")
                 ], ipa: "/nˈeɪl dˈaʊn/"),
            make("own up", "admit; confess",
                 "認める・白状する",
                 useCases: ["悪いことを正直に告白する話"],
                 examples: [
                    ("Own up to it.", "正直に認めて。"),
                    ("He finally owned up.", "彼ついに白状した。")
                 ], ipa: "/ˈəʊn ˈʌp/"),
            make("rope into", "persuade or trick into",
                 "巻き込む・引き込む",
                 useCases: ["気が乗らないことを誘い込む話"],
                 examples: [
                    ("She roped me into helping.", "彼女に手伝いに引き込まれた。"),
                    ("Don't rope me into this.", "これに巻き込まないで。")
                 ], ipa: "/ɹˈəʊp ˌɪntʊ/"),
            make("scrap together", "gather scraps; piece together",
                 "かき集める",
                 useCases: ["少しずつ集めてなんとかする話"],
                 examples: [
                    ("I scraped together some money.", "なんとかお金をかき集めた。"),
                    ("Scrap together a meal.", "なんとか食事を作る。")
                 ], ipa: "/skɹˈæp təɡˈɛðɐ/"),
            make("shrug off", "dismiss; brush aside",
                 "軽く受け流す",
                 useCases: ["気にせず流す話"],
                 examples: [
                    ("She shrugged it off.", "彼女、軽く受け流した。"),
                    ("Just shrug it off.", "気にしないで流して。")
                 ], ipa: "/ʃɹˈʌɡ ˈɒf/"),
            make("size up", "evaluate; assess",
                 "値踏みする・見極める",
                 useCases: ["人や状況を判断する話"],
                 examples: [
                    ("He sized me up.", "彼、私を品定めしてた。"),
                    ("Size up the competition.", "ライバルを見極めて。")
                 ], ipa: "/sˈaɪz ˈʌp/"),
            make("square away", "put in order",
                 "きちんと片付ける",
                 useCases: ["手続きや問題を整理する話"],
                 examples: [
                    ("Get things squared away.", "色々整理してから。"),
                    ("It's all squared away.", "全部片付いた。")
                 ], ipa: "/skwˈeəɹ ɐwˈeɪ/"),
            make("whip out", "pull out quickly",
                 "さっと取り出す",
                 useCases: ["スマホや財布を素早く出す話"],
                 examples: [
                    ("He whipped out his phone.", "彼、サッと携帯出した。"),
                    ("Whip out the camera.", "カメラ取り出して。")
                 ], ipa: "/wˈɪp ˈaʊt/")
        ]
    }

    // MARK: - 動詞（追加 25）

    private static var casualVerbs4: [Word] {
        [
            make("bicker", "argue about petty things",
                 "些細なことで言い争う",
                 useCases: ["ささいな口論を表すとき"],
                 examples: [
                    ("They're always bickering.", "あの二人、いつも言い争ってる。"),
                    ("Stop bickering!", "口喧嘩やめて！")
                 ], ipa: "/bˈɪkɐ/"),
            make("bluff", "pretend; deceive",
                 "はったりをかける",
                 useCases: ["ポーカーや交渉で強がる話"],
                 examples: [
                    ("He's bluffing.", "あいつハッタリだ。"),
                    ("Don't bluff me.", "はったりかけないで。")
                 ], ipa: "/blˈʌf/"),
            make("brag", "boast about oneself",
                 "自慢する",
                 useCases: ["自慢話をする人を表すとき"],
                 examples: [
                    ("Stop bragging.", "自慢やめて。"),
                    ("He brags about everything.", "彼、何でも自慢する。")
                 ], ipa: "/bɹˈæɡ/"),
            make("dodge", "avoid by quick movement",
                 "かわす・避ける",
                 useCases: ["物理的にかわす話", "質問を避ける話"],
                 examples: [
                    ("She dodged the question.", "彼女、質問をかわした。"),
                    ("Dodge the ball!", "ボール避けて！")
                 ], ipa: "/dˈɒdʒ/"),
            make("drift", "move slowly; lose focus",
                 "漂う・話がそれる",
                 useCases: ["注意が散漫になる話", "話題が脱線する話"],
                 examples: [
                    ("My mind drifted.", "気が散ってた。"),
                    ("We drifted off topic.", "話がそれた。")
                 ], ipa: "/dɹˈɪft/"),
            make("fiddle", "play around with absentmindedly",
                 "いじくる・もてあそぶ",
                 useCases: ["手元の物を意味なく触る話"],
                 examples: [
                    ("Stop fiddling with that.", "それいじくらないで。"),
                    ("She fiddled with her ring.", "彼女、指輪をいじってた。")
                 ], ipa: "/fˈɪdəl/"),
            make("fumble", "handle clumsily; struggle",
                 "まごつく・手探りする",
                 useCases: ["うまく扱えなくて慌てる話"],
                 examples: [
                    ("He fumbled with the keys.", "彼、鍵をまごついて出した。"),
                    ("Fumbled the ball.", "ボール落とした。")
                 ], ipa: "/fˈʌmbəl/"),
            make("giggle", "laugh in a silly way",
                 "クスクス笑う",
                 useCases: ["軽い笑い・はにかみ笑い"],
                 examples: [
                    ("She giggled.", "彼女、クスッと笑った。"),
                    ("Stop giggling.", "笑わないで。")
                 ], ipa: "/ɡˈɪɡəl/"),
            make("gobble", "eat quickly and noisily",
                 "がつがつ食べる",
                 useCases: ["勢いよく食べる様子"],
                 examples: [
                    ("He gobbled up the pizza.", "彼、ピザがっついた。"),
                    ("Don't gobble!", "がっつかないで！")
                 ], ipa: "/ɡˈɒbəl/"),
            make("grumble", "complain in a low voice",
                 "ぶつぶつ言う",
                 useCases: ["小声で不満を漏らす話"],
                 examples: [
                    ("He's grumbling about work.", "彼、仕事のことぶつぶつ言ってる。"),
                    ("Stop grumbling.", "ぶつぶつ言わないで。")
                 ], ipa: "/ɡɹˈʌmbəl/"),
            make("hover", "linger; stay close",
                 "うろうろする・近くにいる",
                 useCases: ["近くで様子を伺う話"],
                 examples: [
                    ("Stop hovering!", "うろちょろしないで！"),
                    ("He hovered behind me.", "彼、後ろでうろうろしてた。")
                 ], ipa: "/hˈɒvɐ/"),
            make("lecture", "give a long talk; scold",
                 "説教する",
                 useCases: ["長々と諭す話"],
                 examples: [
                    ("Don't lecture me.", "説教しないで。"),
                    ("She lectured me for an hour.", "1時間も説教された。")
                 ], ipa: "/lˈɛktʃɐ/"),
            make("linger", "stay longer; be slow to leave",
                 "ぐずぐずする・残る",
                 useCases: ["なかなか帰らない様子"],
                 examples: [
                    ("The smell lingered.", "匂いが残ってた。"),
                    ("Don't linger.", "ぐずぐずしないで。")
                 ], ipa: "/lˈɪŋɡɐ/"),
            make("mumble", "speak unclearly",
                 "もごもご言う",
                 useCases: ["口の中で何か言う話"],
                 examples: [
                    ("Stop mumbling.", "はっきり言って。"),
                    ("He mumbled an apology.", "彼、ぼそっと謝った。")
                 ], ipa: "/mˈʌmbəl/"),
            make("nag", "complain or remind repeatedly",
                 "小言を言う・うるさく言う",
                 useCases: ["何度も繰り返し注意する話"],
                 examples: [
                    ("Stop nagging me.", "ガミガミ言わないで。"),
                    ("She nags about everything.", "彼女、何でもうるさく言う。")
                 ], ipa: "/nˈæɡ/"),
            make("peek", "look quickly and secretly",
                 "こっそり覗く",
                 useCases: ["ちらっと盗み見する話"],
                 examples: [
                    ("Don't peek!", "覗かないで！"),
                    ("She peeked at the gift.", "彼女、こっそりプレゼント見た。")
                 ], ipa: "/pˈiːk/"),
            make("ponder", "think deeply about",
                 "じっくり考える",
                 useCases: ["熟考する話"],
                 examples: [
                    ("Let me ponder it.", "ちょっと考えさせて。"),
                    ("He pondered the question.", "彼は質問をじっくり考えた。")
                 ], ipa: "/pˈɒndɐ/"),
            make("rant", "speak angrily at length",
                 "まくし立てる・怒鳴る",
                 useCases: ["怒って長々と話す話"],
                 examples: [
                    ("He's ranting again.", "彼、また熱弁してる。"),
                    ("Don't rant at me.", "私にまくし立てないで。")
                 ], ipa: "/ɹˈɑːnt/"),
            make("scribble", "write hastily",
                 "走り書きする",
                 useCases: ["雑にメモする話"],
                 examples: [
                    ("I scribbled a note.", "メモを走り書きした。"),
                    ("Just scribble it down.", "ささっとメモして。")
                 ], ipa: "/skɹˈɪbəl/"),
            make("sigh", "exhale audibly",
                 "ため息をつく",
                 useCases: ["疲労や落胆のサイン"],
                 examples: [
                    ("She sighed deeply.", "彼女、深いため息をついた。"),
                    ("He sighed in relief.", "彼、ほっとしてため息ついた。")
                 ], ipa: "/sˈaɪ/"),
            make("smirk", "smile smugly or knowingly",
                 "ニヤつく・薄笑いを浮かべる",
                 useCases: ["得意げ・皮肉の笑み"],
                 examples: [
                    ("He smirked at me.", "彼、私にニヤッとした。"),
                    ("Wipe that smirk off your face.", "そのニヤけた顔やめて。")
                 ], ipa: "/smˈɜːk/"),
            make("stammer", "speak with hesitation",
                 "どもる",
                 useCases: ["緊張で言葉が詰まる話"],
                 examples: [
                    ("She stammered an answer.", "彼女、どもりながら答えた。"),
                    ("I stammered through it.", "なんとかどもりながら話した。")
                 ], ipa: "/stˈæmɐ/"),
            make("sulk", "be silently moody",
                 "すねる・むくれる",
                 useCases: ["不機嫌で黙り込む話"],
                 examples: [
                    ("Don't sulk.", "すねないで。"),
                    ("He's sulking in his room.", "彼、部屋でむくれてる。")
                 ], ipa: "/sˈʌlk/"),
            make("vent", "express frustration",
                 "愚痴をこぼす・発散する",
                 useCases: ["不満を吐き出す話"],
                 examples: [
                    ("Let me vent for a sec.", "ちょっと愚痴らせて。"),
                    ("She vented to me.", "彼女、私に愚痴った。")
                 ], ipa: "/vˈɛnt/"),
            make("wander", "move aimlessly; lose focus",
                 "さまよう・気が散る",
                 useCases: ["目的なく歩く話", "注意が散漫になる話"],
                 examples: [
                    ("My mind wandered.", "気が散ってた。"),
                    ("She wandered off.", "彼女、ふらっといなくなった。")
                 ], ipa: "/wˈɒndɐ/")
        ]
    }

    // MARK: - 形容詞（追加 20）

    private static var casualAdjectives4: [Word] {
        [
            make("bossy", "domineering",
                 "威張りたがる・仕切りたがる",
                 useCases: ["仕切りたがる人を表すとき"],
                 examples: [
                    ("Don't be so bossy.", "そんなに仕切らないで。"),
                    ("She's super bossy.", "彼女、めっちゃ仕切るタイプ。")
                 ], ipa: "/bˈɒsɪ/"),
            make("broke", "having no money",
                 "金欠の・無一文",
                 useCases: ["お金がない時の口語"],
                 examples: [
                    ("I'm broke.", "金欠。"),
                    ("Totally broke this month.", "今月マジ金欠。")
                 ], ipa: "/bɹˈəʊk/"),
            make("catchy", "easy to remember; appealing",
                 "耳に残る・キャッチーな",
                 useCases: ["音楽や言い回しが耳に残る話"],
                 examples: [
                    ("Catchy tune!", "耳に残る曲！"),
                    ("That's a catchy slogan.", "キャッチーな標語だ。")
                 ], ipa: "/kˈætʃɪ/"),
            make("cheesy", "tacky; corny",
                 "安っぽい・わざとらしい",
                 useCases: ["くさい演出や台詞を表すとき"],
                 examples: [
                    ("That's so cheesy.", "それくさいなあ。"),
                    ("Cheesy pickup line.", "ベタなナンパ文句。")
                 ], ipa: "/tʃˈiːsɪ/"),
            make("clingy", "overly attached",
                 "まとわりつく・依存的な",
                 useCases: ["距離感の近すぎる人を表すとき"],
                 examples: [
                    ("He's so clingy.", "彼、構ってちゃん。"),
                    ("Don't be clingy.", "依存しすぎないで。")
                 ], ipa: "/klˈɪŋɪ/"),
            make("cocky", "overconfident; arrogant",
                 "生意気な・自惚れた",
                 useCases: ["自信過剰な態度を表すとき"],
                 examples: [
                    ("Don't get cocky.", "調子に乗らないで。"),
                    ("He's a bit cocky.", "彼ちょっと生意気。")
                 ], ipa: "/kˈɒkɪ/"),
            make("corny", "old-fashioned; lame",
                 "古臭い・寒い",
                 useCases: ["くだらないジョークや演出"],
                 examples: [
                    ("That joke is corny.", "そのジョーク寒い。"),
                    ("Corny but cute.", "ベタだけど可愛い。")
                 ], ipa: "/kˈɔːnɪ/"),
            make("creepy", "unsettling; weird",
                 "気味悪い",
                 useCases: ["気味悪い人や場所を表すとき"],
                 examples: [
                    ("That's creepy.", "気持ち悪い。"),
                    ("Creepy vibes.", "ゾッとする雰囲気。")
                 ], ipa: "/kɹˈiːpɪ/"),
            make("fishy", "suspicious; doubtful",
                 "怪しい・うさんくさい",
                 useCases: ["何か怪しいと感じるとき"],
                 examples: [
                    ("Something's fishy.", "なんか怪しい。"),
                    ("That sounds fishy.", "それ怪しい。")
                 ], ipa: "/fˈɪʃɪ/"),
            make("flaky", "unreliable; capricious",
                 "当てにならない・気まぐれ",
                 useCases: ["約束を守らない人を表すとき"],
                 examples: [
                    ("He's so flaky.", "彼、当てにならない。"),
                    ("Don't be flaky.", "ドタキャンとかしないで。")
                 ], ipa: "/flˈeɪkɪ/"),
            make("fussy", "picky; hard to please",
                 "気難しい・うるさい",
                 useCases: ["細かいことにこだわる人を表すとき"],
                 examples: [
                    ("She's a fussy eater.", "彼女、好き嫌い多い。"),
                    ("Don't be fussy.", "うるさく言わないで。")
                 ], ipa: "/fˈʌsɪ/"),
            make("groggy", "dazed; sleepy",
                 "ぼんやりした・寝起きの",
                 useCases: ["寝起きや疲れで頭が回らない話"],
                 examples: [
                    ("I'm still groggy.", "まだ寝ぼけてる。"),
                    ("Feeling groggy this morning.", "今朝はぼーっとしてる。")
                 ], ipa: "/ɡɹˈɒɡɪ/"),
            make("hectic", "chaotic and busy",
                 "めちゃくちゃ忙しい",
                 useCases: ["バタバタしている状況"],
                 examples: [
                    ("It's been hectic.", "バタバタしてた。"),
                    ("Hectic week.", "ヘクティックな週。")
                 ], ipa: "/hˈɛktɪk/"),
            make("iffy", "uncertain; questionable",
                 "微妙・怪しい",
                 useCases: ["不確かな状況を表すとき"],
                 examples: [
                    ("It's a bit iffy.", "ちょっと怪しい。"),
                    ("The weather's iffy.", "天気微妙。")
                 ], ipa: "/ˈɪfɪ/"),
            make("moody", "having unpredictable moods",
                 "気分屋の",
                 useCases: ["気分の浮き沈みが激しい人"],
                 examples: [
                    ("She's so moody today.", "彼女、今日機嫌悪い。"),
                    ("He's a moody guy.", "彼は気分屋。")
                 ], ipa: "/mˈuːdɪ/"),
            make("needy", "overly demanding of attention",
                 "構ってちゃん・依存的",
                 useCases: ["構ってもらいたがる人"],
                 examples: [
                    ("Don't be needy.", "構ってちゃんにならないで。"),
                    ("He's pretty needy.", "彼かなり構ってちゃん。")
                 ], ipa: "/nˈiːdɪ/"),
            make("nosy", "too curious about others' affairs",
                 "詮索好き",
                 useCases: ["プライバシーに踏み込む人"],
                 examples: [
                    ("Don't be nosy.", "詮索しないで。"),
                    ("Nosy neighbors.", "詮索好きな隣人。")
                 ], ipa: "/nˈəʊzɪ/"),
            make("petty", "small-minded; trivial",
                 "細かい・くだらない",
                 useCases: ["どうでもいいことに執着する話"],
                 examples: [
                    ("That's so petty.", "それ細かすぎ。"),
                    ("Don't be petty.", "細かいこと気にしないで。")
                 ], ipa: "/pˈɛtɪ/"),
            make("shady", "suspicious; unreliable",
                 "怪しい・うさんくさい",
                 useCases: ["怪しい人物や取引"],
                 examples: [
                    ("That guy looks shady.", "あいつ怪しい。"),
                    ("Sketchy and shady.", "色々怪しい。")
                 ], ipa: "/ʃˈeɪdɪ/"),
            make("sketchy", "dubious; unclear",
                 "怪しい・あやふや",
                 useCases: ["不審な場所や記憶を表すとき"],
                 examples: [
                    ("That neighborhood is sketchy.", "あそこ治安悪い。"),
                    ("My memory's sketchy.", "記憶が曖昧。")
                 ], ipa: "/skˈɛtʃɪ/")
        ]
    }

    // MARK: - 名詞（追加 13・rant と bummer は既出のため除外）

    private static var casualNouns4: [Word] {
        [
            make("catch", "a hidden drawback",
                 "落とし穴・不利な点",
                 useCases: ["うますぎる話の裏を疑うとき"],
                 examples: [
                    ("What's the catch?", "何か裏あるんでしょ？"),
                    ("There's always a catch.", "必ず落とし穴がある。")
                 ], ipa: "/kˈætʃ/"),
            make("drag", "a boring or tedious thing",
                 "退屈な人/物・面倒",
                 useCases: ["つまらない、面倒なことを言うとき"],
                 examples: [
                    ("What a drag.", "面倒だなー。"),
                    ("This party is a drag.", "このパーティーつまらない。")
                 ], ipa: "/dɹˈæɡ/"),
            make("fluke", "a lucky accident",
                 "まぐれ・偶然",
                 useCases: ["運良くできたことを表すとき"],
                 examples: [
                    ("Pure fluke.", "完全にまぐれ。"),
                    ("It was a fluke.", "ただの偶然だ。")
                 ], ipa: "/flˈuːk/"),
            make("gist", "the main point",
                 "要点・大筋",
                 useCases: ["話の核心を伝えるとき"],
                 examples: [
                    ("Get the gist?", "要点わかる？"),
                    ("Just the gist of it.", "要点だけね。")
                 ], ipa: "/dʒˈɪst/"),
            make("glimpse", "a brief look",
                 "ちらっと見ること",
                 useCases: ["一瞬だけ見る話"],
                 examples: [
                    ("I caught a glimpse.", "ちらっと見えた。"),
                    ("Just a glimpse.", "ちらっとだけ。")
                 ], ipa: "/ɡlˈɪmps/"),
            make("hassle", "annoying trouble",
                 "面倒・厄介事",
                 useCases: ["面倒な手続きや事情"],
                 examples: [
                    ("What a hassle.", "面倒だな。"),
                    ("Too much hassle.", "手間かかりすぎ。")
                 ], ipa: "/hˈæsəl/"),
            make("hunch", "intuitive feeling",
                 "直感・予感",
                 useCases: ["論理ではなく勘で判断する話"],
                 examples: [
                    ("I have a hunch.", "なんとなく予感がする。"),
                    ("Just a hunch.", "ただの勘。")
                 ], ipa: "/hˈʌntʃ/"),
            make("jerk", "a rude or annoying person",
                 "嫌な奴・ろくでなし",
                 useCases: ["失礼な人を表すカジュアル表現"],
                 examples: [
                    ("Don't be a jerk.", "嫌な奴になるな。"),
                    ("What a jerk.", "ひどいやつ。")
                 ], ipa: "/dʒˈɜːk/"),
            make("kicker", "the surprising twist",
                 "落とし所・どんでん返し",
                 useCases: ["話のオチを伝えるとき"],
                 examples: [
                    ("Here's the kicker.", "ここがオチ。"),
                    ("And the kicker is...", "そして驚きなのが…")
                 ], ipa: "/kˈɪkɐ/"),
            make("knack", "a clever talent",
                 "コツ・才能",
                 useCases: ["何かが得意な人を表すとき"],
                 examples: [
                    ("She has a knack for it.", "彼女、それコツ掴んでる。"),
                    ("Got the knack.", "コツ掴んだ。")
                 ], ipa: "/nˈæk/"),
            make("loophole", "a gap in rules",
                 "抜け穴",
                 useCases: ["法律やルールの抜け道を話すとき"],
                 examples: [
                    ("Found a loophole.", "抜け穴見つけた。"),
                    ("Tax loophole.", "税の抜け穴。")
                 ], ipa: "/lˈuːphəʊl/"),
            make("scoop", "the latest news",
                 "内輪話・特ダネ",
                 useCases: ["最新の噂やゴシップ"],
                 examples: [
                    ("What's the scoop?", "最新情報何？"),
                    ("Got the scoop on her.", "彼女のスクープゲットした。")
                 ], ipa: "/skˈuːp/"),
            make("snag", "a small obstacle",
                 "障害・問題",
                 useCases: ["小さなトラブルが起きた話"],
                 examples: [
                    ("Hit a snag.", "ちょっとつまずいた。"),
                    ("Small snag in the plan.", "計画にちょっと問題あり。")
                 ], ipa: "/snˈæɡ/")
        ]
    }

    // MARK: - 慣用表現（追加 5）

    private static var casualIdioms4: [Word] {
        [
            make("a no-brainer", "an obvious choice",
                 "考えるまでもないこと",
                 useCases: ["明らかに正しい選択を表すとき"],
                 examples: [
                    ("It's a no-brainer.", "考えるまでもないでしょ。"),
                    ("That's a no-brainer for sure.", "それは絶対即決だね。")
                 ], ipa: "/ɐ nˈəʊbɹˈeɪnɐ/"),
            make("a deal-breaker", "an unacceptable condition",
                 "譲れない条件・ダメな条件",
                 useCases: ["これがダメなら成立しない要素"],
                 examples: [
                    ("That's a deal-breaker for me.", "それは無理。"),
                    ("Pets are a deal-breaker.", "ペット不可は無理。")
                 ], ipa: "/ɐ dˈiːlbɹˈeɪkɐ/"),
            make("the elephant in the room", "an obvious issue everyone avoids",
                 "みんな気づいてるのに触れない問題",
                 useCases: ["話しにくい話題に切り込むとき"],
                 examples: [
                    ("Let's address the elephant in the room.", "触れにくい話に触れよう。"),
                    ("It's the elephant in the room.", "皆避けてる話題だよね。")
                 ], ipa: "/ðɪ ˈɛlɪfənt ɪnðə ɹˈuːm/"),
            make("a wake-up call", "a warning that prompts change",
                 "目が覚めるような出来事・警告",
                 useCases: ["気付かされる体験を語るとき"],
                 examples: [
                    ("That was a real wake-up call.", "あれは目が覚めた。"),
                    ("It's a wake-up call.", "目を覚まさせる出来事だ。")
                 ], ipa: "/ɐ wˈeɪkˌʌp kˈɔːl/"),
            make("a long story", "complicated to explain",
                 "話せば長い",
                 useCases: ["説明が長くなることを示唆するとき"],
                 examples: [
                    ("It's a long story.", "話せば長くなる。"),
                    ("Long story short, no.", "結論を言うとダメ。")
                 ], ipa: "/ɐ lˈɒŋ stˈɔːɹɪ/")
        ]
    }

    // MARK: - つなぎ表現（追加 3・mind you と for what it's worth は既出）

    private static var casualConnectives4: [Word] {
        [
            make("truth be told", "honestly speaking",
                 "本当のことを言うと",
                 useCases: ["本音を打ち明けるとき"],
                 examples: [
                    ("Truth be told, I forgot.", "正直忘れてた。"),
                    ("Truth be told, I'm tired.", "本音を言うと疲れてる。")
                 ], ipa: "/tɹˈuːθ biː tˈəʊld/"),
            make("come to think of it", "now that I think about it",
                 "そういえば",
                 useCases: ["ふと思い出して話すとき"],
                 examples: [
                    ("Come to think of it, he called.", "そういえば彼から電話あった。"),
                    ("Come to think of it, that's strange.", "考えてみればおかしい。")
                 ], ipa: "/kˈʌm tə θˈɪŋk ɒv ɪt/"),
            make("case in point", "a perfect example",
                 "その良い例・典型",
                 useCases: ["主張の具体例を挙げるとき"],
                 examples: [
                    ("Case in point: yesterday.", "その例が昨日のこと。"),
                    ("Case in point, look at this.", "好例だよ、これ見て。")
                 ], ipa: "/kˈeɪs ɪn pˈɔɪnt/")
        ]
    }

    // MARK: - 文法表現（追加 5）

    private static var grammarPhrases4: [Word] {
        [
            make("might as well", "since there's no better option",
                 "〜してもいいかな・どうせなら",
                 useCases: ["選択肢が他にないから何かをする話"],
                 examples: [
                    ("Might as well stay.", "残ってもいいかな。"),
                    ("Might as well give it a shot.", "どうせならやってみよう。")
                 ], ipa: "/mˌaɪt æz wˈɛl/"),
            make("may as well", "we might as well",
                 "〜してもいいかな（同上）",
                 useCases: ["might as well と同じ意味の少し丁寧め"],
                 examples: [
                    ("May as well try.", "どうせなら試そう。"),
                    ("May as well start now.", "今始めてもいいかな。")
                 ], ipa: "/mˈeɪ æz wˈɛl/"),
            make("would rather", "prefer to do something",
                 "〜したい（の方がまし）",
                 useCases: ["代案の方が良いと伝えるとき"],
                 examples: [
                    ("I'd rather walk.", "歩く方がいい。"),
                    ("I'd rather stay home.", "家にいたい。")
                 ], ipa: "/wʊd ɹˈɑːðɐ/"),
            make("could use", "would benefit from",
                 "〜が欲しい・必要",
                 useCases: ["欲しい物を控えめに伝えるとき"],
                 examples: [
                    ("I could use a coffee.", "コーヒー飲みたい。"),
                    ("Could use some help.", "ちょっと手伝ってほしい。")
                 ], ipa: "/kʊd jˈuːz/"),
            make("better off", "in a better situation",
                 "〜した方がいい・よりまし",
                 useCases: ["別の状態の方が良いと伝えるとき"],
                 examples: [
                    ("You're better off without him.", "彼なしの方がいい。"),
                    ("Better off staying.", "残った方がいい。")
                 ], ipa: "/bˈɛtɐɹ ˈɒf/")
        ]
    }

    // MARK: - 方向・位置表現（追加 10）

    private static var directionPhrases5: [Word] {
        [
            make("straight ahead", "directly in front",
                 "まっすぐ前に",
                 useCases: ["道案内するとき"],
                 examples: [
                    ("Go straight ahead.", "まっすぐ進んで。"),
                    ("It's straight ahead.", "まっすぐ前にあるよ。")
                 ], ipa: "/stɹˈeɪt ɐhˈɛd/"),
            make("right around the corner", "very near; almost here",
                 "すぐそこ・もうすぐ",
                 useCases: ["近い距離・近い時期を伝えるとき"],
                 examples: [
                    ("Summer's right around the corner.", "夏はもうすぐ。"),
                    ("The cafe is right around the corner.", "カフェはすぐそこ。")
                 ], ipa: "/ɹˈaɪt ɐɹˈaʊnd ðə kˈɔːnɐ/"),
            make("all the way", "entirely; the whole way",
                 "ずっと・はるばる",
                 useCases: ["最後までやり通す話", "遠路はるばる"],
                 examples: [
                    ("All the way to Tokyo.", "東京までずっと。"),
                    ("I support you all the way.", "ずっと応援してる。")
                 ], ipa: "/ˈɔːl ðə wˈeɪ/"),
            make("way back", "long ago; far behind",
                 "ずっと昔・かなり後ろ",
                 useCases: ["ずっと昔の話・離れた距離"],
                 examples: [
                    ("Way back in 2010.", "ずっと昔の2010年に。"),
                    ("He's way back there.", "彼はかなり後ろにいる。")
                 ], ipa: "/wˈeɪ bˈæk/"),
            make("up front", "in advance; honestly",
                 "前もって・正直に",
                 useCases: ["事前に伝える話", "率直に話す話"],
                 examples: [
                    ("I'll be up front.", "正直に言うね。"),
                    ("Pay up front.", "前払いで。")
                 ], ipa: "/ˌʌp fɹˈʌnt/"),
            make("all over the place", "everywhere; messy",
                 "そこら中に・めちゃくちゃ",
                 useCases: ["散らかっている様子", "話があちこち飛ぶ話"],
                 examples: [
                    ("Stuff is all over the place.", "物がそこら中に。"),
                    ("My mind is all over the place.", "頭の中ぐちゃぐちゃ。")
                 ], ipa: "/ˈɔːl ˌəʊvɐ ðə plˈeɪs/"),
            make("on and off", "intermittently",
                 "断続的に",
                 useCases: ["途切れ途切れに続く話"],
                 examples: [
                    ("Rain on and off all day.", "一日中雨が降ったり止んだり。"),
                    ("We've dated on and off.", "付き合ったり別れたりしてた。")
                 ], ipa: "/ˌɒn ænd ˈɒf/"),
            make("back and forth", "to and fro",
                 "行ったり来たり",
                 useCases: ["何度も往復する話"],
                 examples: [
                    ("He paced back and forth.", "彼、行ったり来たりしてた。"),
                    ("Emails back and forth.", "メールのやり取り。")
                 ], ipa: "/bˈæk ænd fˈɔːθ/"),
            make("side by side", "next to each other",
                 "並んで",
                 useCases: ["横並びで何かを行う話"],
                 examples: [
                    ("They walked side by side.", "二人並んで歩いた。"),
                    ("Stood side by side.", "横に並んで立った。")
                 ], ipa: "/sˈaɪd baɪ sˈaɪd/"),
            make("upside down", "inverted",
                 "逆さま",
                 useCases: ["物を裏返している話"],
                 examples: [
                    ("The book is upside down.", "本が逆さまだ。"),
                    ("Turn it upside down.", "逆さまにして。")
                 ], ipa: "/ˈʌpsaɪd dˈaʊn/")
        ]
    }

    // MARK: - 「How do you...?」系の質問パターン（追加 5）

    private static var howQuestions5: [Word] {
        [
            make("how do you mean", "what do you mean",
                 "どういう意味？",
                 useCases: ["相手の発言の意図を確認するとき"],
                 examples: [
                    ("How do you mean?", "どういう意味？"),
                    ("Wait, how do you mean exactly?", "ちょっと、具体的にどういう意味？")
                 ], ipa: "/hˌaʊ dˈuː juː mˈiːn/"),
            make("how do you figure", "what makes you think that",
                 "どうしてそう思うの？",
                 useCases: ["相手の推論の根拠を聞くとき"],
                 examples: [
                    ("How do you figure?", "どうしてそう思うの？"),
                    ("Why? How do you figure that?", "なんで？どう考えたの？")
                 ], ipa: "/hˌaʊ dˈuː juː fˈɪɡɐ/"),
            make("how do you like", "what do you think of",
                 "〜はどう？気に入った？",
                 useCases: ["感想を聞くとき"],
                 examples: [
                    ("How do you like the new job?", "新しい仕事どう？"),
                    ("How do you like it here?", "ここどう？")
                 ], ipa: "/hˌaʊ dˈuː juː lˈaɪk/"),
            make("how do you say", "ask for translation or pronunciation",
                 "〜は…語で何と言う？",
                 useCases: ["別言語での言い方を聞くとき"],
                 examples: [
                    ("How do you say it in English?", "英語で何て言う？"),
                    ("How do you say 'thank you' in Japanese?", "thank you は日本語で何？")
                 ], ipa: "/hˌaʊ dˈuː juː sˈeɪ/"),
            make("how would you feel about", "what do you think about",
                 "〜についてどう思う？",
                 useCases: ["提案について意見を聞くとき"],
                 examples: [
                    ("How would you feel about pizza?", "ピザはどう？"),
                    ("How would you feel about leaving early?", "早めに出るのどう思う？")
                 ], ipa: "/hˌaʊ wʊd juː fˈiːl ɐbˈaʊt/")
        ]
    }

    // MARK: - 「What...?」系の質問パターン（追加 10）

    private static var whatQuestions5: [Word] {
        [
            make("what's it like", "what's it look or feel like",
                 "どんな感じ？",
                 useCases: ["体験や場所の感想を聞くとき"],
                 examples: [
                    ("What's it like in Japan?", "日本どんな感じ？"),
                    ("What's it like working there?", "そこで働くのどう？")
                 ], ipa: "/wˌɒts ɪt lˈaɪk/"),
            make("what for", "for what purpose",
                 "何のために？",
                 useCases: ["理由・目的を聞くとき"],
                 examples: [
                    ("What for?", "何のために？"),
                    ("Wait, what for?", "ちょっと、なんで？")
                 ], ipa: "/wˈɒt fɔː/"),
            make("what if", "what would happen if",
                 "もし〜だったら？",
                 useCases: ["仮定の話を切り出すとき"],
                 examples: [
                    ("What if it rains?", "もし雨だったら？"),
                    ("What if he's late?", "彼が遅れたらどうする？")
                 ], ipa: "/wˈɒt ɪf/"),
            make("what's the point", "what's the purpose",
                 "何の意味がある？",
                 useCases: ["やる意義を疑問視するとき"],
                 examples: [
                    ("What's the point?", "意味ある？"),
                    ("What's the point of this?", "これ何のため？")
                 ], ipa: "/wˌɒts ðə pˈɔɪnt/"),
            make("what's wrong with", "what's the issue with",
                 "〜の何がダメ？／どうしたの？",
                 useCases: ["何が問題かを問うとき"],
                 examples: [
                    ("What's wrong with you?", "どうしたの？"),
                    ("What's wrong with this idea?", "このアイデアの何が悪い？")
                 ], ipa: "/wˌɒts ɹˈɒŋ wɪð/"),
            make("what's up with", "what's going on with",
                 "〜どうしたの？",
                 useCases: ["状況を尋ねる口語"],
                 examples: [
                    ("What's up with him?", "彼どうしたの？"),
                    ("What's up with the noise?", "あの音何？")
                 ], ipa: "/wˌɒts ˈʌp wɪð/"),
            make("what's it to you", "why is it your business",
                 "お前に関係ない",
                 useCases: ["余計な詮索に反論するとき"],
                 examples: [
                    ("What's it to you?", "あなたに関係ある？"),
                    ("And what's it to you?", "で、何の関係？")
                 ], ipa: "/wˈɒts ɪt tə juː/"),
            make("what kind of", "what type of",
                 "どんな〜？",
                 useCases: ["種類を尋ねるとき"],
                 examples: [
                    ("What kind of music?", "どんな音楽？"),
                    ("What kind of person is he?", "彼ってどんな人？")
                 ], ipa: "/wˌɒt kˈaɪnd ɒv/"),
            make("what brings you here", "why are you here",
                 "どうしてここに？",
                 useCases: ["来訪の理由を聞くとき"],
                 examples: [
                    ("What brings you here?", "どうしてここに？"),
                    ("Hey! What brings you here?", "ねえ、どうしたの？")
                 ], ipa: "/wˌɒt bɹˈɪŋz juː hˈiə/"),
            make("what do you say", "what's your reaction; how about",
                 "どう？・〜しない？",
                 useCases: ["提案に対する反応を伺うとき"],
                 examples: [
                    ("What do you say?", "どう？"),
                    ("What do you say we go now?", "今行くのどう？")
                 ], ipa: "/wˌɒt dˈuː juː sˈeɪ/")
        ]
    }

    // MARK: - 使役・被害の構文（追加 10）

    private static var causatives5: [Word] {
        [
            make("get something done", "have something done by someone",
                 "〜してもらう・してもらった",
                 useCases: ["人に何かをしてもらった結果を伝えるとき"],
                 examples: [
                    ("I got my hair cut.", "髪切ってもらった。"),
                    ("Got my phone fixed.", "携帯直してもらった。")
                 ], ipa: "/ɡɛt sˈʌmθɪŋ dˈʌn/"),
            make("have something done", "have something done (formal-ish)",
                 "〜してもらう（やや改まった）",
                 useCases: ["業者やプロに作業してもらう話"],
                 examples: [
                    ("I had my car fixed.", "車を直してもらった。"),
                    ("Had the photos printed.", "写真を印刷してもらった。")
                 ], ipa: "/hæv sˈʌmθɪŋ dˈʌn/"),
            make("get someone to do", "persuade someone to do",
                 "人に〜させる・してもらう",
                 useCases: ["説得して動いてもらう話"],
                 examples: [
                    ("I got him to help.", "彼に手伝ってもらった。"),
                    ("Get her to call back.", "彼女から折り返してもらって。")
                 ], ipa: "/ɡɛt sˈʌmwɒn tə dˈuː/"),
            make("have someone do", "ask or order someone to do",
                 "人に〜させる",
                 useCases: ["指示して動かす話"],
                 examples: [
                    ("I had him wait.", "彼に待たせた。"),
                    ("Have her come over.", "彼女に来てもらって。")
                 ], ipa: "/hæv sˈʌmwɒn dˈuː/"),
            make("make someone do", "force someone to do",
                 "人に〜させる（強制）",
                 useCases: ["強制的にやらせる話"],
                 examples: [
                    ("He made me cry.", "彼が私を泣かせた。"),
                    ("Don't make me wait.", "待たせないで。")
                 ], ipa: "/mˌeɪk sˈʌmwɒn dˈuː/"),
            make("let someone do", "allow someone to do",
                 "人に〜させる（許可）",
                 useCases: ["許可を与える話"],
                 examples: [
                    ("Let me know.", "知らせて。"),
                    ("Let him try.", "彼に試させて。")
                 ], ipa: "/lˈɛt sˈʌmwɒn dˈuː/"),
            make("help someone do", "assist someone with doing",
                 "〜するのを手伝う",
                 useCases: ["手伝う場面"],
                 examples: [
                    ("Help me carry this.", "運ぶの手伝って。"),
                    ("She helped me move.", "彼女が引っ越し手伝ってくれた。")
                 ], ipa: "/hˈɛlp sˈʌmwɒn dˈuː/"),
            make("see someone doing", "observe someone in the act",
                 "〜しているのを見る/聞く",
                 useCases: ["途中を目撃する話"],
                 examples: [
                    ("I saw him leaving.", "彼が出ていくところを見た。"),
                    ("I heard her singing.", "彼女が歌うのを聞いた。")
                 ], ipa: "/sˈiː sˈʌmwɒn dˈuːɪŋ/"),
            make("catch someone doing", "discover someone in the act",
                 "〜しているのを目撃する",
                 useCases: ["不意に見つける話"],
                 examples: [
                    ("I caught him lying.", "嘘をついているのを見つけた。"),
                    ("Caught them sneaking out.", "こっそり出るのを見つけた。")
                 ], ipa: "/kˈætʃ sˈʌmwɒn dˈuːɪŋ/"),
            make("find someone doing", "discover someone in a state",
                 "〜だと気づく",
                 useCases: ["ある状態を見つける話"],
                 examples: [
                    ("I found her crying.", "泣いているのを見た。"),
                    ("Found him asleep.", "彼が寝ているのを見つけた。")
                 ], ipa: "/fˈaɪnd sˈʌmwɒn dˈuːɪŋ/")
        ]
    }

    // MARK: - 「come to / get to / used to」系（追加 9・come to think of it と get used to は既出）

    private static var comeGetUsed5: [Word] {
        [
            make("come to find out", "later discover",
                 "後で分かった",
                 useCases: ["後から判明したことを語るとき"],
                 examples: [
                    ("Come to find out, he was lying.", "後でわかったけど、彼嘘ついてた。"),
                    ("Come to find out, it's free.", "あとで分かったけど無料だった。")
                 ], ipa: "/kˈʌm tə fˈaɪnd ˈaʊt/"),
            make("come to realize", "gradually understand",
                 "気づくに至る",
                 useCases: ["徐々に気づく話"],
                 examples: [
                    ("I came to realize the truth.", "真実に気づくに至った。"),
                    ("She came to realize her mistake.", "彼女、自分の過ちに気づいた。")
                 ], ipa: "/kˈʌm tə ɹˈiəlaɪz/"),
            make("get to do", "have the chance to do",
                 "〜できる機会を得る",
                 useCases: ["珍しい機会を得た話"],
                 examples: [
                    ("I got to meet him.", "彼に会えた。"),
                    ("Got to try sushi for the first time.", "初めて寿司食べられた。")
                 ], ipa: "/ɡɛt tə dˈuː/"),
            make("get to a place", "arrive at a place",
                 "〜に着く",
                 useCases: ["目的地に到着する話"],
                 examples: [
                    ("How do I get to the station?", "駅へどう行く？"),
                    ("We got to the hotel late.", "ホテルに遅く着いた。")
                 ], ipa: "/ɡɛt tʊ ɐ plˈeɪs/"),
            make("used to", "did regularly in the past",
                 "かつて〜していた",
                 useCases: ["昔の習慣を語るとき"],
                 examples: [
                    ("I used to smoke.", "昔タバコを吸ってた。"),
                    ("Used to live in NY.", "ニューヨークに住んでた。")
                 ], ipa: "/jˈuːzd tuː/"),
            make("be used to", "be familiar with",
                 "〜に慣れている",
                 useCases: ["既に慣れている状態を表すとき"],
                 examples: [
                    ("I'm used to it.", "慣れてる。"),
                    ("Are you used to the cold?", "寒さに慣れた？")
                 ], ipa: "/biː jˈuːzd tuː/"),
            make("be supposed to", "expected to",
                 "〜することになっている",
                 useCases: ["予定や規則を伝えるとき"],
                 examples: [
                    ("I'm supposed to call her.", "彼女に電話することになってる。"),
                    ("You're not supposed to be here.", "ここにいちゃダメ。")
                 ], ipa: "/biː səpˈəʊzd tuː/"),
            make("be about to", "on the verge of",
                 "今にも〜しようとしている",
                 useCases: ["直前の動作を伝えるとき"],
                 examples: [
                    ("I was about to leave.", "ちょうど出るところだった。"),
                    ("It's about to rain.", "今にも雨が降りそう。")
                 ], ipa: "/biː ɐbˈaʊt tuː/"),
            make("come down to", "ultimately depend on",
                 "結局〜次第になる",
                 useCases: ["最終的に何で決まるかを話すとき"],
                 examples: [
                    ("It comes down to money.", "結局はお金の問題。"),
                    ("Comes down to your choice.", "君の選択次第。")
                 ], ipa: "/kˈʌm dˈaʊn tuː/")
        ]
    }

    // MARK: - 強調構文・倒置（追加 5）

    private static var emphasis5: [Word] {
        [
            make("it is that", "emphasis pattern: it is X that…",
                 "〜なのは…だ（強調）",
                 useCases: ["要素を強調する書き方"],
                 examples: [
                    ("It is you that I love.", "愛しているのはあなた。"),
                    ("It is here that we met.", "出会ったのはここだ。")
                 ], ipa: "/ɪt ɪz ðˈæt/"),
            make("what I want is", "the thing I want is…",
                 "私が〜なのは",
                 useCases: ["欲しいものを強調するとき"],
                 examples: [
                    ("What I want is rest.", "欲しいのは休息。"),
                    ("What I need is time.", "必要なのは時間。")
                 ], ipa: "/wˌɒt aɪ wˈɒnt ɪz/"),
            make("all I want is", "the only thing I want is",
                 "私が〜することは全て",
                 useCases: ["欲しいものを限定して伝えるとき"],
                 examples: [
                    ("All I want is peace.", "欲しいのは平和だけ。"),
                    ("All I need is one chance.", "必要なのは1回のチャンスだけ。")
                 ], ipa: "/ˈɔːl aɪ wˈɒnt ɪz/"),
            make("the thing is", "actually; here's the thing",
                 "実はね",
                 useCases: ["切り出しの前置き"],
                 examples: [
                    ("The thing is, I forgot.", "実は忘れた。"),
                    ("The thing is, it's expensive.", "実はそれ高いんだよ。")
                 ], ipa: "/ðə θˈɪŋ ɪz/"),
            make("the point is", "what matters is",
                 "要点はこうだ",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("The point is, we lost.", "要は負けた。"),
                    ("The point is to try.", "大事なのは挑戦すること。")
                 ], ipa: "/ðə pˈɔɪnt ɪz/")
        ]
    }

    // MARK: - 比較構文（追加 9・rather than は既出）

    private static var comparatives5: [Word] {
        [
            make("the more, the more", "the more X, the more Y",
                 "〜すればするほど…",
                 useCases: ["相関関係を強調するとき"],
                 examples: [
                    ("The more, the better.", "多いほどいい。"),
                    ("The more you practice, the better you get.", "練習するほど上手くなる。")
                 ], ipa: "/ðə mˈɔː ðə mˈɔː/"),
            make("as as possible", "as X as possible",
                 "できるだけ〜",
                 useCases: ["最大限を要求するとき"],
                 examples: [
                    ("As soon as possible.", "できるだけ早く。"),
                    ("As quietly as possible.", "できるだけ静かに。")
                 ], ipa: "/æz æz pˈɒsɪbəl/"),
            make("as as can be", "as X as can be",
                 "この上なく〜",
                 useCases: ["極限の状態を表すとき"],
                 examples: [
                    ("As happy as can be.", "最高に幸せ。"),
                    ("As busy as can be.", "ものすごく忙しい。")
                 ], ipa: "/æz æz kæn bˈiː/"),
            make("no more than", "not exceeding; only",
                 "〜以下・〜だけ",
                 useCases: ["上限や控えめな量を示すとき"],
                 examples: [
                    ("No more than $10.", "10ドル以下。"),
                    ("No more than 5 people.", "5人まで。")
                 ], ipa: "/nˈəʊmˌɔː ðɐn/"),
            make("less than", "fewer than",
                 "〜より少なく",
                 useCases: ["量や程度を比較して少ないと言うとき"],
                 examples: [
                    ("Less than I thought.", "思ったより少ない。"),
                    ("Less than 10 minutes.", "10分以内。")
                 ], ipa: "/lˈɛs ðɐn/"),
            make("better than nothing", "preferable to none",
                 "ないよりまし",
                 useCases: ["少しでもあった方が良いと言うとき"],
                 examples: [
                    ("It's better than nothing.", "ないよりはマシ。"),
                    ("Hey, better than nothing!", "まあ、無いよりはマシ！")
                 ], ipa: "/bˈɛtɐ ðɐn nˈʌθɪŋ/"),
            make("the same as", "identical to",
                 "〜と同じ",
                 useCases: ["同じだと伝えるとき"],
                 examples: [
                    ("Same as before.", "前と同じ。"),
                    ("The same as yours.", "あなたのと同じ。")
                 ], ipa: "/ðə sˈeɪm æz/"),
            make("different from", "not the same as",
                 "〜と違う",
                 useCases: ["違いを伝えるとき"],
                 examples: [
                    ("Different from yesterday.", "昨日と違う。"),
                    ("It's different from what I expected.", "思ったのと違う。")
                 ], ipa: "/dˈɪfɹənt fɹɒm/"),
            make("as good as", "almost; equivalent to",
                 "〜と同じくらい・ほぼ〜",
                 useCases: ["ほぼ同等であることを伝えるとき"],
                 examples: [
                    ("As good as new.", "ほぼ新品。"),
                    ("As good as done.", "ほぼ終わったも同然。")
                 ], ipa: "/æz ɡˈʊd æz/")
        ]
    }

    // MARK: - 仮定法・条件（追加 5）

    private static var conditionals5: [Word] {
        [
            make("if I were you", "if I were in your position",
                 "私があなたなら",
                 useCases: ["助言の前置きとして"],
                 examples: [
                    ("If I were you, I'd go.", "私なら行く。"),
                    ("If I were you, I'd quit.", "私なら辞める。")
                 ], ipa: "/ɪf aɪ wɜː jˈuː/"),
            make("if it weren't for", "if not for",
                 "〜がなかったら",
                 useCases: ["仮定で原因や恩を語るとき"],
                 examples: [
                    ("If it weren't for you, I'd fail.", "君がいなきゃ失敗してた。"),
                    ("If it weren't for the rain.", "雨さえなければね。")
                 ], ipa: "/ɪf ɪt wˈɜːnt fɔː/"),
            make("but for", "if not for (formal)",
                 "〜がなければ",
                 useCases: ["フォーマルに「if it weren't for」と同じ意味で"],
                 examples: [
                    ("But for your help, I'd be lost.", "君の助けがなければ困ってた。"),
                    ("But for that, perfect.", "それさえなければ完璧。")
                 ], ipa: "/bˈʌt fɔː/"),
            make("suppose", "assume; what if",
                 "仮に〜なら",
                 useCases: ["仮定の話を切り出すとき"],
                 examples: [
                    ("Suppose he comes?", "もし彼が来たら？"),
                    ("Supposing it rains, what then?", "もし雨ならどうする？")
                 ], ipa: "/səpˈəʊz/"),
            make("I wish", "I would like it to be (counterfactual)",
                 "〜だったらなあ",
                 useCases: ["叶わない願いを語るとき"],
                 examples: [
                    ("I wish I knew.", "知ってたらなあ。"),
                    ("I wish it were Friday.", "金曜だったらいいのに。")
                 ], ipa: "/aɪ wˈɪʃ/")
        ]
    }

    // MARK: - 「There's...」「It's...」構文（追加 5）

    private static var thereIts5: [Word] {
        [
            make("there's no way", "it's impossible",
                 "〜のはずがない",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("There's no way he'll come.", "彼が来るはずない。"),
                    ("No way I can do that.", "そんなのできるわけない。")
                 ], ipa: "/ðeəz nˈəʊ wˈeɪ/"),
            make("there's no need to", "it's not necessary to",
                 "〜する必要はない",
                 useCases: ["不要だと伝えるとき"],
                 examples: [
                    ("There's no need to worry.", "心配いらない。"),
                    ("No need to apologize.", "謝らなくていいよ。")
                 ], ipa: "/ðeəz nˈəʊ nˈiːd tuː/"),
            make("there's a chance", "there's a possibility",
                 "可能性がある",
                 useCases: ["ありえると伝えるとき"],
                 examples: [
                    ("There's a chance it'll rain.", "雨の可能性がある。"),
                    ("There's a chance, sure.", "可能性はあるね。")
                 ], ipa: "/ðeəz ɐ tʃˈɑːns/"),
            make("it takes to", "it requires X to do",
                 "〜するのに…かかる",
                 useCases: ["所要時間や努力を表すとき"],
                 examples: [
                    ("It takes time to learn.", "学ぶには時間がかかる。"),
                    ("It takes courage to speak.", "話すには勇気がいる。")
                 ], ipa: "/ɪt tˈeɪks tuː/"),
            make("it occurs to me", "a thought comes to mind",
                 "ふと思いつく",
                 useCases: ["突然思いつく場面"],
                 examples: [
                    ("It occurred to me.", "ふと思った。"),
                    ("It just occurred to me, why don't we go?", "ふと思ったんだけど、行かない？")
                 ], ipa: "/ɪt əkˈɜːz tə mˌiː/")
        ]
    }

    // MARK: - 命令・依頼パターン（追加 5）

    private static var requestPatterns5: [Word] {
        [
            make("how about", "what do you think of",
                 "〜するのはどう？",
                 useCases: ["提案するとき"],
                 examples: [
                    ("How about going?", "行くのはどう？"),
                    ("How about pizza?", "ピザはどう？")
                 ], ipa: "/hˌaʊ ɐbˈaʊt/"),
            make("why don't you", "why not do; suggestion",
                 "〜したら？",
                 useCases: ["軽く提案するとき"],
                 examples: [
                    ("Why don't we eat?", "食べない？"),
                    ("Why don't you call her?", "彼女に電話したら？")
                 ], ipa: "/wˌaɪ dˈəʊnt juː/"),
            make("what do you say we", "shall we; how about we",
                 "〜するのどう？",
                 useCases: ["共同行動を提案するとき"],
                 examples: [
                    ("What do you say we leave?", "出るのどう？"),
                    ("What do you say we grab lunch?", "ランチ食べに行かない？")
                 ], ipa: "/wˌɒt dˈuː juː sˈeɪ wiː/"),
            make("let's not", "I suggest we don't",
                 "〜するのやめよう",
                 useCases: ["何かをしないように提案するとき"],
                 examples: [
                    ("Let's not fight.", "喧嘩やめよう。"),
                    ("Let's not be late.", "遅れないようにしよう。")
                 ], ipa: "/lˈɛts nˈɒt/"),
            make("don't bother", "don't trouble yourself",
                 "わざわざ〜しないで",
                 useCases: ["面倒を引き受けなくていいと伝えるとき"],
                 examples: [
                    ("Don't bother calling.", "わざわざ電話しなくていい。"),
                    ("Don't bother explaining.", "説明しなくていいよ。")
                 ], ipa: "/dˈəʊnt bˈɒðɐ/")
        ]
    }

    // MARK: - 「too / enough / so」構文（追加 5）

    private static var tooEnoughSo5: [Word] {
        [
            make("too to", "too X to do",
                 "〜するには…すぎる",
                 useCases: ["できないほど〜であると伝えるとき"],
                 examples: [
                    ("Too tired to walk.", "歩くには疲れすぎ。"),
                    ("Too late to call.", "電話するには遅すぎ。")
                 ], ipa: "/tˈuː tuː/"),
            make("enough to", "X enough to do",
                 "〜するのに十分",
                 useCases: ["十分な程度を伝えるとき"],
                 examples: [
                    ("Old enough to vote.", "投票するのに十分な年齢。"),
                    ("Strong enough to lift it.", "持ち上げられるくらい強い。")
                 ], ipa: "/ɪnˈʌf tuː/"),
            make("so that", "so X that Y",
                 "とても…なので〜",
                 useCases: ["原因と結果を結びつけるとき"],
                 examples: [
                    ("So tired that I slept.", "疲れすぎて寝た。"),
                    ("So hot that we melted.", "暑すぎて溶けそう。")
                 ], ipa: "/sˌəʊ ðˈæt/"),
            make("such that", "such X that Y",
                 "それほどの…なので〜",
                 useCases: ["名詞を強調する形での原因結果"],
                 examples: [
                    ("Such a long day that I'm done.", "長い一日でクタクタ。"),
                    ("Such a mess that I gave up.", "あまりにめちゃくちゃで諦めた。")
                 ], ipa: "/sˈʌtʃ ðˈæt/"),
            make("not so much as", "not so much X as Y",
                 "〜というよりむしろ",
                 useCases: ["ニュアンスを訂正するとき"],
                 examples: [
                    ("Not so much tired as bored.", "疲れたというより退屈。"),
                    ("Not so much angry as confused.", "怒ってるというより混乱してる。")
                 ], ipa: "/nˌɒt sˈəʊ mˌʌtʃ æz/")
        ]
    }

    // MARK: - 動名詞・不定詞のパターン（追加 9・feel like は seemAppear5 に集約）

    private static var gerundPatterns5: [Word] {
        [
            make("end up doing", "wind up doing in the end",
                 "結局〜することになる",
                 useCases: ["予定と違う結末を伝えるとき"],
                 examples: [
                    ("End up staying home.", "結局家にいた。"),
                    ("Ended up walking.", "結局歩くことになった。")
                 ], ipa: "/ˈɛnd ˌʌp dˈuːɪŋ/"),
            make("wind up doing", "end up doing",
                 "結局〜になる",
                 useCases: ["end up と同じ意味で使うとき"],
                 examples: [
                    ("We wound up paying.", "結局払うはめになった。"),
                    ("Wound up missing the train.", "結局電車逃した。")
                 ], ipa: "/wˈaɪnd ˈʌp dˈuːɪŋ/"),
            make("can't help doing", "can't stop doing involuntarily",
                 "〜せずにいられない",
                 useCases: ["抑えられない反応を伝えるとき"],
                 examples: [
                    ("Can't help laughing.", "笑わずにいられない。"),
                    ("Can't help worrying.", "心配せずにいられない。")
                 ], ipa: "/kˈɑːnt hˈɛlp dˈuːɪŋ/"),
            make("can't stand doing", "can't tolerate doing",
                 "〜が我慢できない",
                 useCases: ["強い嫌悪を表すとき"],
                 examples: [
                    ("Can't stand waiting.", "待つのが耐えられない。"),
                    ("Can't stand his attitude.", "彼の態度が我慢できない。")
                 ], ipa: "/kˈɑːnt stˈænd dˈuːɪŋ/"),
            make("worth doing", "worthwhile to do",
                 "〜する価値がある",
                 useCases: ["価値があると勧めるとき"],
                 examples: [
                    ("Worth trying.", "試す価値あり。"),
                    ("This place is worth visiting.", "ここは行く価値ある。")
                 ], ipa: "/wˈɜːθ dˈuːɪŋ/"),
            make("have a hard time doing", "find it difficult to do",
                 "〜するのに苦労する",
                 useCases: ["難しさを訴えるとき"],
                 examples: [
                    ("Have a hard time sleeping.", "寝るのが大変。"),
                    ("Hard time understanding.", "理解するのが難しい。")
                 ], ipa: "/hæv ɐ hˈɑːd tˈaɪm dˈuːɪŋ/"),
            make("have trouble doing", "have difficulty doing",
                 "〜するのに苦労する",
                 useCases: ["問題を抱えていることを伝えるとき"],
                 examples: [
                    ("Have trouble focusing.", "集中するのが大変。"),
                    ("Trouble logging in.", "ログインするのに苦労してる。")
                 ], ipa: "/hæv tɹˈʌbəl dˈuːɪŋ/"),
            make("spend time doing", "use time doing",
                 "〜して時間を過ごす",
                 useCases: ["時間の使い方を伝えるとき"],
                 examples: [
                    ("Spend time reading.", "読書で時間を過ごす。"),
                    ("Spent the afternoon studying.", "午後は勉強して過ごした。")
                 ], ipa: "/spˈɛnd tˈaɪm dˈuːɪŋ/"),
            make("busy doing", "occupied doing",
                 "〜するのに忙しい",
                 useCases: ["何かに追われていると伝えるとき"],
                 examples: [
                    ("Busy working.", "仕事で忙しい。"),
                    ("She's busy cooking.", "彼女は料理で忙しい。")
                 ], ipa: "/bˈɪzɪ dˈuːɪŋ/")
        ]
    }

    // MARK: - 「seem / appear / look」構文（追加 5）

    private static var seemAppear5: [Word] {
        [
            make("seem to", "appear to",
                 "〜するように見える",
                 useCases: ["他者の状態を推測するとき"],
                 examples: [
                    ("You seem tired.", "疲れて見える。"),
                    ("She seems happy.", "彼女、楽しそう。")
                 ], ipa: "/sˈiːm tuː/"),
            make("it seems", "it appears that",
                 "〜のようだ",
                 useCases: ["やや距離を置いて推測するとき"],
                 examples: [
                    ("It seems he left.", "彼は出たようだ。"),
                    ("Seems he forgot.", "忘れたみたい。")
                 ], ipa: "/ɪt sˈiːmz/"),
            make("look like", "appear similar to",
                 "〜のようだ・〜に似てる",
                 useCases: ["見た目から推測するとき"],
                 examples: [
                    ("Looks like rain.", "雨が降りそう。"),
                    ("You look like your mom.", "お母さんに似てるね。")
                 ], ipa: "/lˈʊk lˈaɪk/"),
            make("sound like", "seem like (auditory)",
                 "〜のように聞こえる",
                 useCases: ["話の内容や音から推測するとき"],
                 examples: [
                    ("Sounds like fun.", "楽しそう。"),
                    ("Sounds like a plan.", "いい計画みたい。")
                 ], ipa: "/sˈaʊnd lˈaɪk/"),
            make("feel like", "seem like; have the urge to",
                 "〜のような感じ・〜したい気分",
                 useCases: ["雰囲気を伝えるとき", "気分を伝えるとき"],
                 examples: [
                    ("Feels like Monday.", "月曜みたい。"),
                    ("Feel like pizza tonight.", "今夜はピザ食べたい気分。")
                 ], ipa: "/fˈiːl lˈaɪk/")
        ]
    }

    // MARK: - よくあるカジュアル構文（追加 5）

    private static var casualConstructions5: [Word] {
        [
            make("you'd better", "you should",
                 "〜した方がいい",
                 useCases: ["強めに勧めるとき"],
                 examples: [
                    ("You'd better go.", "行った方がいい。"),
                    ("You'd better hurry.", "急いだ方がいい。")
                 ], ipa: "/juːd bˈɛtɐ/"),
            make("I'd say", "I'd estimate; my guess",
                 "〜と思う・言うなら",
                 useCases: ["控えめに意見を述べるとき"],
                 examples: [
                    ("I'd say it's fine.", "大丈夫だと思う。"),
                    ("I'd say about 5 minutes.", "5分くらいかな。")
                 ], ipa: "/aɪd sˈeɪ/"),
            make("I bet", "I'm sure",
                 "〜に違いない・きっと",
                 useCases: ["強い確信を伝えるとき"],
                 examples: [
                    ("I bet he's late.", "きっと遅刻。"),
                    ("I bet you're tired.", "絶対疲れてるでしょ。")
                 ], ipa: "/aɪ bˈɛt/"),
            make("I take it", "I assume; I gather",
                 "〜ということだね",
                 useCases: ["相手の意図を確認するとき"],
                 examples: [
                    ("I take it you agree.", "賛成ってことね。"),
                    ("I take it you've heard.", "もう聞いたんでしょ。")
                 ], ipa: "/aɪ tˈeɪk ɪt/"),
            make("as far as I know", "to my knowledge",
                 "私の知る限り",
                 useCases: ["自分の知識の範囲で答えるとき"],
                 examples: [
                    ("As far as I know, yes.", "知る限りはイエス。"),
                    ("As far as I know, it's open.", "私の知る限りオープンしてる。")
                 ], ipa: "/æz fˈɑːɹ æz aɪ nˈəʊ/")
        ]
    }

    // MARK: - 予定・意向（追加 5）

    private static var plansAndIntentions6: [Word] {
        [
            make("I'm thinking of", "considering",
                 "〜しようかと思って",
                 useCases: ["検討中の予定を伝えるとき"],
                 examples: [
                    ("I'm thinking of moving.", "引っ越そうかな。"),
                    ("Thinking of trying yoga.", "ヨガ始めようかな。")
                 ], ipa: "/aɪm θˈɪŋkɪŋ ɒv/"),
            make("I'm planning to", "intending to",
                 "〜する予定",
                 useCases: ["予定を伝えるとき"],
                 examples: [
                    ("I'm planning to go.", "行く予定。"),
                    ("Planning to leave at 8.", "8時に出る予定。")
                 ], ipa: "/aɪm plˈænɪŋ tuː/"),
            make("I'm hoping to", "hoping to",
                 "〜できればと思って",
                 useCases: ["希望を控えめに伝えるとき"],
                 examples: [
                    ("I'm hoping to finish today.", "今日終わらせたい。"),
                    ("Hoping to see you soon.", "そのうち会えるといいな。")
                 ], ipa: "/aɪm hˈəʊpɪŋ tuː/"),
            make("I'm looking to", "thinking about doing",
                 "〜したいと思っている",
                 useCases: ["やや具体的な意向を伝えるとき"],
                 examples: [
                    ("I'm looking to buy a car.", "車を買おうと思って。"),
                    ("Looking to move out soon.", "近いうちに引っ越したい。")
                 ], ipa: "/aɪm lˈʊkɪŋ tuː/"),
            make("I'm trying to", "attempting to",
                 "〜しようとしている",
                 useCases: ["努力中だと伝えるとき"],
                 examples: [
                    ("I'm trying to focus.", "集中しようとしてる。"),
                    ("Trying to lose weight.", "痩せようとしてる。")
                 ], ipa: "/aɪm tɹˈaɪɪŋ tuː/")
        ]
    }

    // MARK: - 過去の話を切り出す（追加 4・the other day は既出）

    private static var pastNarratives6: [Word] {
        [
            make("so I was", "so I was doing X (story opener)",
                 "〜してたらね",
                 useCases: ["過去のエピソードを語り始めるとき"],
                 examples: [
                    ("So I was walking and...", "歩いてたらね…"),
                    ("So I was at the cafe.", "カフェにいたら。")
                 ], ipa: "/sˈəʊ aɪ wɒz/"),
            make("back in the day", "long ago",
                 "昔は",
                 useCases: ["昔話の前置き"],
                 examples: [
                    ("Back in the day, we walked.", "昔は歩いて行った。"),
                    ("Back in the day, I was thin.", "昔はやせてたんだよ。")
                 ], ipa: "/bˈæk ɪnðə dˈeɪ/"),
            make("I remember when", "I recall the time when",
                 "〜だった時を覚えてる",
                 useCases: ["懐かしむときの口語"],
                 examples: [
                    ("I remember when we met.", "出会った時を覚えてる。"),
                    ("I remember when this was empty.", "ここがガラガラだった頃覚えてる。")
                 ], ipa: "/aɪ ɹɪmˈɛmbɐ wˈɛn/"),
            make("there was this time", "there was a time when",
                 "こんなことがあって",
                 useCases: ["昔の小話を切り出すとき"],
                 examples: [
                    ("There was this time I...", "こんなことがあってさ…"),
                    ("There was this time we got lost.", "迷子になったことがあって。")
                 ], ipa: "/ðeəwˌɒz ðɪs tˈaɪm/")
        ]
    }

    // MARK: - I + 動詞 + (that) 文（追加 3・I bet と I'd say は既出）

    private static var iVerbThat6: [Word] {
        [
            make("I think", "I believe; in my opinion",
                 "〜だと思う",
                 useCases: ["意見を述べるとき"],
                 examples: [
                    ("I think he's right.", "彼は正しいと思う。"),
                    ("I think we should go.", "行くべきだと思う。")
                 ], ipa: "/aɪ θˈɪŋk/"),
            make("I guess", "I suppose; probably",
                 "〜じゃないかな",
                 useCases: ["やや自信なく推測するとき"],
                 examples: [
                    ("I guess so.", "そうかも。"),
                    ("I guess he forgot.", "忘れたんじゃないかな。")
                 ], ipa: "/aɪ ɡˈɛs/"),
            make("I figure", "I assume",
                 "〜だろう",
                 useCases: ["推測を伝えるとき"],
                 examples: [
                    ("I figure he forgot.", "忘れたんだろう。"),
                    ("I figure it's around 9.", "9時くらいだろう。")
                 ], ipa: "/aɪ fˈɪɡɐ/")
        ]
    }

    // MARK: - 相手に確認（追加 5）

    private static var youCheckPatterns6: [Word] {
        [
            make("you mean", "do you mean",
                 "〜ってこと？",
                 useCases: ["相手の真意を確認するとき"],
                 examples: [
                    ("You mean now?", "今ってこと？"),
                    ("You mean me?", "私のこと？")
                 ], ipa: "/juː mˈiːn/"),
            make("you said", "you previously said",
                 "〜って言ったよね",
                 useCases: ["過去の発言を蒸し返すとき"],
                 examples: [
                    ("You said you'd come.", "来るって言ったよね。"),
                    ("You said it was free.", "無料って言ったじゃん。")
                 ], ipa: "/juː sˈɛd/"),
            make("you know", "as you're aware (filler)",
                 "〜じゃん・ねえ",
                 useCases: ["軽く同意を求める前置き"],
                 examples: [
                    ("You know he's nice.", "彼って優しいじゃん。"),
                    ("You know what I mean?", "言いたいこと分かるよね？")
                 ], ipa: "/juː nˈəʊ/"),
            make("you'd think", "one would expect",
                 "普通〜だと思うよね",
                 useCases: ["常識を呆れて持ち出すとき"],
                 examples: [
                    ("You'd think he'd call.", "普通電話するよね。"),
                    ("You'd think they'd know.", "普通知ってるはずでしょ。")
                 ], ipa: "/juːd θˈɪŋk/"),
            make("you'd be surprised", "it would surprise you",
                 "びっくりするよ",
                 useCases: ["意外な事実を切り出すとき"],
                 examples: [
                    ("You'd be surprised how easy.", "びっくりするほど簡単。"),
                    ("You'd be surprised what he said.", "彼が言ったこと聞いたらびっくりするよ。")
                 ], ipa: "/juːd biː səpɹˈaɪzd/")
        ]
    }

    // MARK: - the way 〜 の様子（追加 5）

    private static var theWayPatterns6: [Word] {
        [
            make("the way", "the manner in which",
                 "〜の様子・〜のしかた",
                 useCases: ["人や物の様子を述べるとき"],
                 examples: [
                    ("The way he talks.", "彼の話し方。"),
                    ("I love the way she smiles.", "彼女の笑い方が好き。")
                 ], ipa: "/ðə wˈeɪ/"),
            make("the way I see it", "in my opinion",
                 "私の見方では",
                 useCases: ["主観の意見を切り出すとき"],
                 examples: [
                    ("The way I see it, no.", "私の見方ではノー。"),
                    ("The way I see it, we lost.", "私から見れば負けた。")
                 ], ipa: "/ðə wˈeɪ aɪ sˈiː ɪt/"),
            make("the way things are going", "given how things are progressing",
                 "今の流れだと",
                 useCases: ["今の状況から将来を予測するとき"],
                 examples: [
                    ("The way things are going, fail.", "この流れだと失敗。"),
                    ("The way things are going, no chance.", "この調子じゃ無理。")
                 ], ipa: "/ðə wˈeɪ θˈɪŋz ɑː ɡˈəʊɪŋ/"),
            make("judging by the way", "based on the manner",
                 "〜の様子からして",
                 useCases: ["様子から判断するとき"],
                 examples: [
                    ("Judging by the way he looks, tired.", "様子からして疲れてる。"),
                    ("Judging by the way she walks, hurt.", "歩き方からして怪我してる。")
                 ], ipa: "/dʒˈʌdʒɪŋ baɪ ðə wˈeɪ/"),
            make("that's just the way", "that's how it is",
                 "そういうものだ",
                 useCases: ["諦めの境地で物事を受け入れるとき"],
                 examples: [
                    ("That's just the way it is.", "そういうものだよ。"),
                    ("That's just the way she is.", "彼女ってそういう人。")
                 ], ipa: "/ðæts dʒˈʌst ðə wˈeɪ/")
        ]
    }

    // MARK: - 提案・申し出（追加 4・how about you は既出）

    private static var proposalSuggest6: [Word] {
        [
            make("why not", "why don't you (suggestion)",
                 "〜したら？",
                 useCases: ["軽くやってみたらと勧めるとき"],
                 examples: [
                    ("Why not try?", "試したら？"),
                    ("Why not go for it?", "やってみたら？")
                 ], ipa: "/wˌaɪ nˈɒt/"),
            make("want me to", "do you want me to",
                 "〜しようか？",
                 useCases: ["手伝いを申し出るとき"],
                 examples: [
                    ("Want me to help?", "手伝おうか？"),
                    ("Want me to drive?", "運転しようか？")
                 ], ipa: "/wˈɒnt mˌiː tuː/"),
            make("shall I", "should I",
                 "〜しましょうか？",
                 useCases: ["丁寧に申し出るとき"],
                 examples: [
                    ("Shall I open it?", "開けましょうか？"),
                    ("Shall I bring more?", "もう少しお持ちしましょうか？")
                 ], ipa: "/ʃˌæl ˈaɪ/"),
            make("mind if I", "do you mind if I",
                 "〜してもいい？",
                 useCases: ["許可を求めるとき"],
                 examples: [
                    ("Mind if I sit here?", "座ってもいい？"),
                    ("Mind if I borrow this?", "これ借りてもいい？")
                 ], ipa: "/mˈaɪnd ɪf ˈaɪ/")
        ]
    }

    // MARK: - 〜ing で文を始めるパターン（追加 2・considering / given / assuming は既出）

    private static var ingPatterns6: [Word] {
        [
            make("speaking of which", "since you mentioned that",
                 "そういえば",
                 useCases: ["前の話題と関連した話を振るとき"],
                 examples: [
                    ("Speaking of which, where's John?", "そういえばジョンは？"),
                    ("Speaking of which, did you eat?", "そういえばご飯食べた？")
                 ], ipa: "/spˈiːkɪŋ ɒvwˈɪtʃ/"),
            make("judging from", "based on",
                 "〜から判断すると",
                 useCases: ["手がかりから判断するとき"],
                 examples: [
                    ("Judging from his face.", "顔つきから察するに。"),
                    ("Judging from the smell, burnt.", "匂いからして焦げてる。")
                 ], ipa: "/dʒˈʌdʒɪŋ fɹɒm/")
        ]
    }

    // MARK: - 「let me 〜」のバリエーション（追加 5）

    private static var letMeVariations6: [Word] {
        [
            make("let me see", "let me think; show me",
                 "えーと・見せて",
                 useCases: ["即答できないときの繋ぎ", "見せてと頼むとき"],
                 examples: [
                    ("Let me see.", "えーと。"),
                    ("Let me see your phone.", "携帯見せて。")
                 ], ipa: "/lˈɛt mˌiː sˈiː/"),
            make("let me think", "give me a moment to think",
                 "考えさせて",
                 useCases: ["即答できない場面"],
                 examples: [
                    ("Let me think.", "考えさせて。"),
                    ("Let me think about it.", "ちょっと考えさせて。")
                 ], ipa: "/lˈɛt mˌiː θˈɪŋk/"),
            make("let me get this straight", "let me make sure I understand",
                 "整理させて",
                 useCases: ["相手の話を確認しなおすとき"],
                 examples: [
                    ("Let me get this straight.", "整理させてね。"),
                    ("Wait, let me get this straight.", "ちょっと、確認させて。")
                 ], ipa: "/lˈɛt mˌiː ɡɛt ðɪs stɹˈeɪt/"),
            make("let me put it this way", "let me phrase it like this",
                 "こう言おうか",
                 useCases: ["別の角度で説明するとき"],
                 examples: [
                    ("Let me put it this way.", "こう言わせて。"),
                    ("Let me put it this way: it's tough.", "言い換えると、厳しい。")
                 ], ipa: "/lˈɛt mˌiː pˌʊt ɪt ðɪs wˈeɪ/"),
            make("let's just say", "let me put it this way; suggest",
                 "まあ〜とだけ言っておく",
                 useCases: ["詳細をぼかして伝えるとき"],
                 examples: [
                    ("Let's just say I know.", "知ってるとだけ言っておく。"),
                    ("Let's just say it didn't go well.", "うまくいかなかったとだけ。")
                 ], ipa: "/lˈɛts dʒˈʌst sˈeɪ/")
        ]
    }

    // MARK: - I'd + 動詞（追加 5）

    private static var idVerbPatterns6: [Word] {
        [
            make("I'd love to", "I'd really like to",
                 "喜んで",
                 useCases: ["快諾するとき"],
                 examples: [
                    ("I'd love to come.", "喜んで行く。"),
                    ("I'd love to help.", "ぜひ手伝いたい。")
                 ], ipa: "/aɪd lˈʌv tuː/"),
            make("I'd hate to", "I really wouldn't want to",
                 "〜したくない",
                 useCases: ["気が進まないと丁寧に伝えるとき"],
                 examples: [
                    ("I'd hate to bother you.", "邪魔したくない。"),
                    ("I'd hate to miss it.", "見逃したくない。")
                 ], ipa: "/aɪd hˈeɪt tuː/"),
            make("I'd appreciate it if", "I'd be grateful if",
                 "〜してもらえると助かる",
                 useCases: ["丁寧に頼むとき"],
                 examples: [
                    ("I'd appreciate it if you'd call.", "電話くれると嬉しい。"),
                    ("I'd appreciate it if you helped.", "手伝ってくれると助かる。")
                 ], ipa: "/aɪd ɐpɹˈiːʃɪˌeɪt ɪt ɪf/"),
            make("I'd rather not", "I would prefer not to",
                 "遠慮したい",
                 useCases: ["丁重に断るとき"],
                 examples: [
                    ("I'd rather not say.", "言いたくない。"),
                    ("I'd rather not go.", "行きたくない。")
                 ], ipa: "/aɪd ɹˈɑːðɐ nˈɒt/"),
            make("I'd better", "I should",
                 "〜した方がいい",
                 useCases: ["自分が動くべきだと示すとき"],
                 examples: [
                    ("I'd better go.", "行った方がいい。"),
                    ("I'd better get started.", "始めないと。")
                 ], ipa: "/aɪd bˈɛtɐ/")
        ]
    }

    // MARK: - tend to / happen to 系（追加 5）

    private static var tendToHappenTo6: [Word] {
        [
            make("tend to", "have a habit of",
                 "〜する傾向がある",
                 useCases: ["性格や習慣を語るとき"],
                 examples: [
                    ("I tend to forget.", "忘れがち。"),
                    ("She tends to overthink.", "彼女、考えすぎる傾向ある。")
                 ], ipa: "/tˈɛnd tuː/"),
            make("happen to", "by chance",
                 "たまたま〜する",
                 useCases: ["偶然性を強調するとき"],
                 examples: [
                    ("Happen to know?", "たまたま知ってる？"),
                    ("I happen to like it.", "たまたまそれ好きなんだ。")
                 ], ipa: "/hˈæpən tuː/"),
            make("turn out to", "end up being",
                 "結果〜だった",
                 useCases: ["後から判明する話"],
                 examples: [
                    ("Turned out to be wrong.", "間違っていた。"),
                    ("Turned out to be cheaper.", "結果的に安くついた。")
                 ], ipa: "/tˈɜːn ˈaʊt tuː/"),
            make("manage to", "succeed in doing",
                 "どうにか〜する",
                 useCases: ["努力して成功する話"],
                 examples: [
                    ("Managed to finish.", "どうにか終えた。"),
                    ("Managed to catch the train.", "なんとか電車に間に合った。")
                 ], ipa: "/mˈænɪdʒ tuː/"),
            make("fail to", "not succeed in doing",
                 "〜できない",
                 useCases: ["やり損ねた話"],
                 examples: [
                    ("Failed to call.", "電話しそびれた。"),
                    ("She failed to mention it.", "彼女それに触れなかった。")
                 ], ipa: "/fˈeɪl tuː/")
        ]
    }

    // MARK: - 強調・反応（追加 5）

    private static var emphasisExclaim6: [Word] {
        [
            make("what a", "what a (noun)",
                 "なんて〜",
                 useCases: ["強い感情を込めるとき"],
                 examples: [
                    ("What a day!", "なんて日！"),
                    ("What a mess!", "なんて散らかり！")
                 ], ipa: "/wˌɒt ˈeɪ/"),
            make("how (adjective)", "how + adj",
                 "なんて〜",
                 useCases: ["驚きや称賛を表すとき"],
                 examples: [
                    ("How nice!", "なんて素敵！"),
                    ("How sweet!", "なんて優しい！")
                 ], ipa: "/hˌaʊ ˈædʒɪktˌɪv/"),
            make("such a", "such a (adj noun)",
                 "そんなに〜な",
                 useCases: ["強調しつつ感想を述べるとき"],
                 examples: [
                    ("Such a long day.", "なんて長い一日。"),
                    ("Such a kind person.", "本当に優しい人。")
                 ], ipa: "/sˈʌtʃ ˈeɪ/"),
            make("so (adjective)", "very + adj",
                 "とても〜",
                 useCases: ["感情を強調するとき"],
                 examples: [
                    ("So tired.", "めっちゃ疲れた。"),
                    ("So happy for you.", "とても嬉しいよ。")
                 ], ipa: "/sˌəʊ ˈædʒɪktˌɪv/"),
            make("way (adjective)", "way + adj (super)",
                 "めちゃくちゃ〜",
                 useCases: ["カジュアルに強調するとき"],
                 examples: [
                    ("Way better.", "めっちゃいい。"),
                    ("Way faster than expected.", "想像よりめっちゃ速い。")
                 ], ipa: "/wˈeɪ ˈædʒɪktˌɪv/")
        ]
    }

    // MARK: - 婉曲・控えめ（追加 3・kind of, sort of は既出）

    private static var hedgingPatterns6: [Word] {
        [
            make("a bit", "a little",
                 "少し〜",
                 useCases: ["軽い程度を伝えるとき"],
                 examples: [
                    ("A bit cold.", "ちょっと寒い。"),
                    ("I'm a bit busy.", "ちょっと忙しい。")
                 ], ipa: "/ɐ bˈɪt/"),
            make("a little", "slightly",
                 "少し〜",
                 useCases: ["やわらかく程度を伝えるとき"],
                 examples: [
                    ("A little nervous.", "ちょっと緊張。"),
                    ("A little late, sorry.", "少し遅れた、ごめん。")
                 ], ipa: "/ɐ lˈɪtəl/"),
            make("somewhat", "to some extent",
                 "いくらか〜",
                 useCases: ["やや控えめな評価をするとき"],
                 examples: [
                    ("Somewhat surprised.", "いくらか驚いた。"),
                    ("Somewhat better.", "幾分かまし。")
                 ], ipa: "/sˈʌmwɒt/")
        ]
    }

    // MARK: - end up / wind up / turn up 系（追加 2・end up, wind up, turn out は既出）

    private static var endUpVariations6: [Word] {
        [
            make("work out", "result in success; exercise",
                 "結果うまくいく・運動する",
                 useCases: ["物事が良い結果になる話", "ジムで運動する話"],
                 examples: [
                    ("It'll work out.", "なんとかなるよ。"),
                    ("Worked out great!", "うまくいった！")
                 ], ipa: "/wˈɜːk ˈaʊt/"),
            make("come out", "be revealed; turn out",
                 "〜と分かる・明らかになる",
                 useCases: ["結果が判明する話"],
                 examples: [
                    ("Come out clean.", "潔白だと分かる。"),
                    ("It came out fine.", "うまく出来上がった。")
                 ], ipa: "/kˈʌm ˈaʊt/")
        ]
    }

    // MARK: - supposed to のバリエーション（追加 4・be supposed to は既出）

    private static var supposedToForms6: [Word] {
        [
            make("was supposed to", "had been expected to",
                 "〜のはずだった",
                 useCases: ["予定が叶わなかった話"],
                 examples: [
                    ("Was supposed to come.", "来るはずだった。"),
                    ("I was supposed to call.", "電話するはずだった。")
                 ], ipa: "/wɒz səpˈəʊzd tuː/"),
            make("not supposed to", "shouldn't",
                 "〜してはいけない",
                 useCases: ["禁止されている話"],
                 examples: [
                    ("Not supposed to talk.", "話してはダメ。"),
                    ("You're not supposed to be here.", "ここにいちゃダメ。")
                 ], ipa: "/nˌɒt səpˈəʊzd tuː/"),
            make("what's that supposed to mean", "what do you mean by that",
                 "それどういう意味？",
                 useCases: ["失礼な発言に問い返すとき"],
                 examples: [
                    ("What's that supposed to mean?", "それどういう意味？"),
                    ("Hey, what's that supposed to mean?", "ねえ、それどういう意味？")
                 ], ipa: "/wˌɒts ðæt səpˈəʊzd tə mˈiːn/"),
            make("as it's supposed to", "the way it should",
                 "本来あるべき姿で",
                 useCases: ["正しく動いている話"],
                 examples: [
                    ("As it's supposed to be.", "あるべき姿で。"),
                    ("Working as it's supposed to.", "正しく動いてる。")
                 ], ipa: "/æz ɪts səpˈəʊzd tuː/")
        ]
    }

    // MARK: - 経験・予測（追加 5）

    private static var predictions6: [Word] {
        [
            make("it wouldn't surprise me if", "I'd expect that",
                 "〜でも驚かない",
                 useCases: ["想定の範囲内の出来事を語るとき"],
                 examples: [
                    ("Wouldn't surprise me if he quits.", "辞めても驚かない。"),
                    ("Wouldn't surprise me if it rains.", "雨でも驚かない。")
                 ], ipa: "/ɪt wˈʊdənt səpɹˈaɪz mˌiː ɪf/"),
            make("chances are", "probably",
                 "おそらく",
                 useCases: ["確率高く起きる予測を伝えるとき"],
                 examples: [
                    ("Chances are he's late.", "おそらく遅れる。"),
                    ("Chances are she'll say yes.", "彼女はOKと言うだろう。")
                 ], ipa: "/tʃˈɑːnsɪz ɑː/"),
            make("odds are", "it's likely",
                 "多分",
                 useCases: ["カジュアルな予測"],
                 examples: [
                    ("Odds are it'll rain.", "多分雨。"),
                    ("Odds are he forgot.", "彼、忘れたんだろうな。")
                 ], ipa: "/ˈɒdz ɑː/"),
            make("it's no wonder", "no surprise that",
                 "〜なのも当然",
                 useCases: ["納得の理由を述べるとき"],
                 examples: [
                    ("No wonder he's tired.", "疲れて当然。"),
                    ("No wonder it broke.", "壊れて当然。")
                 ], ipa: "/ɪts nˈəʊ wˈʌndɐ/"),
            make("it makes sense that", "it's logical that",
                 "〜なのも納得",
                 useCases: ["納得感を伝えるとき"],
                 examples: [
                    ("Makes sense that he left.", "出るのも納得。"),
                    ("Makes sense it's expensive.", "高いのも納得。")
                 ], ipa: "/ɪt mˌeɪks sˈɛns ðˈæt/")
        ]
    }

    // MARK: - whatever / whoever / whichever（追加 4・no matter what は既出）

    private static var wheneverPatterns6: [Word] {
        [
            make("whatever you do", "no matter what you do",
                 "何があっても",
                 useCases: ["強い忠告をするとき"],
                 examples: [
                    ("Whatever you do, don't lie.", "嘘だけはダメ。"),
                    ("Whatever you do, stay calm.", "何があっても落ち着いて。")
                 ], ipa: "/wɒtˈɛvɐ juː dˈuː/"),
            make("whatever it takes", "no matter what's needed",
                 "どんな手を使っても",
                 useCases: ["強い決意を表すとき"],
                 examples: [
                    ("Whatever it takes to win.", "勝つためなら何でも。"),
                    ("I'll do whatever it takes.", "何でもやる。")
                 ], ipa: "/wɒtˈɛvɐɹ ɪt tˈeɪks/"),
            make("whoever", "any person who",
                 "〜する誰でも",
                 useCases: ["人を限定せずに伝えるとき"],
                 examples: [
                    ("Whoever wins gets it.", "勝った人がもらう。"),
                    ("Whoever called, hang up.", "誰がかけてきても切って。")
                 ], ipa: "/huːˈɛvɐ/"),
            make("whichever", "any of the choices",
                 "どちらでも",
                 useCases: ["選択を相手に任せるとき"],
                 examples: [
                    ("Whichever you like.", "お好きな方を。"),
                    ("Whichever works for you.", "君に合う方で。")
                 ], ipa: "/wɪtʃˈɛvɐ/")
        ]
    }

    // MARK: - 二重否定・反語（追加 4・not really は既出）

    private static var negativePatterns6: [Word] {
        [
            make("not that I know of", "not as far as I'm aware",
                 "私の知る限りでは違う",
                 useCases: ["知らないと曖昧に答えるとき"],
                 examples: [
                    ("Not that I know of.", "知る限りないね。"),
                    ("Hmm, not that I know of.", "うーん、私の知る限りないね。")
                 ], ipa: "/nˌɒt ðæt aɪ nˈəʊ ɒv/"),
            make("not necessarily", "not always; not certainly",
                 "そうとは限らない",
                 useCases: ["相手の決めつけをやんわり否定するとき"],
                 examples: [
                    ("Not necessarily true.", "必ずしも本当じゃない。"),
                    ("Not necessarily, no.", "必ずしもそうとは限らない。")
                 ], ipa: "/nˌɒt nˌɛsɪsˈɛɹɪlɪ/"),
            make("not exactly", "not quite; not really",
                 "まさにそうではない",
                 useCases: ["微妙に違うとやんわり言うとき"],
                 examples: [
                    ("Not exactly fun.", "そんなに楽しくはない。"),
                    ("Not exactly cheap.", "別に安くはない。")
                 ], ipa: "/nˌɒt ɪɡzˈæktlɪ/"),
            make("not at all", "absolutely not",
                 "全然違う",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("Not at all what I wanted.", "全然欲しかったのと違う。"),
                    ("Not at all!", "全然！")
                 ], ipa: "/nˌɒt æt ˈɔːl/")
        ]
    }

    // MARK: - the X is（追加 4・the thing is は既出）

    private static var theXIs6: [Word] {
        [
            make("the fact is", "in reality",
                 "事実はこうだ",
                 useCases: ["事実を強く伝えるとき"],
                 examples: [
                    ("The fact is, he lied.", "事実は彼が嘘ついた。"),
                    ("The fact is, we lost.", "事実、負けた。")
                 ], ipa: "/ðə fˈækt ɪz/"),
            make("the truth is", "honestly",
                 "本当のところ",
                 useCases: ["本音を打ち明けるとき"],
                 examples: [
                    ("The truth is, I don't know.", "本当は分からない。"),
                    ("The truth is, I'm scared.", "正直、怖い。")
                 ], ipa: "/ðə tɹˈuːθ ɪz/"),
            make("the trouble is", "the problem is",
                 "問題はね",
                 useCases: ["難点を切り出すとき"],
                 examples: [
                    ("The trouble is, no time.", "問題は時間がない。"),
                    ("The trouble is, it costs too much.", "問題はコスト。")
                 ], ipa: "/ðə tɹˈʌbəl ɪz/"),
            make("the question is", "what we need to ask is",
                 "問題は・問うべきは",
                 useCases: ["核心の問いを切り出すとき"],
                 examples: [
                    ("The question is why.", "問題はなぜか。"),
                    ("The question is, can we afford it?", "問題は払えるかだ。")
                 ], ipa: "/ðə kwˈɛstʃən ɪz/")
        ]
    }

    // MARK: - come / go + 動詞 並列（追加 5）

    private static var comeGoVerb6: [Word] {
        [
            make("come see", "come and see",
                 "見に来て",
                 useCases: ["気軽に誘うとき"],
                 examples: [
                    ("Come see me.", "会いに来て。"),
                    ("Come see this!", "これ見に来て！")
                 ], ipa: "/kˈʌm sˈiː/"),
            make("go get", "go and get",
                 "取りに行く",
                 useCases: ["何かを取って来てと頼むとき"],
                 examples: [
                    ("Go get it.", "取って来て。"),
                    ("Go get the keys.", "鍵取って来て。")
                 ], ipa: "/ɡˌəʊ ɡˈɛt/"),
            make("come help", "come and help",
                 "手伝いに来て",
                 useCases: ["手助けを呼ぶとき"],
                 examples: [
                    ("Come help me.", "助けに来て。"),
                    ("Come help us out.", "手伝いに来て。")
                 ], ipa: "/kˈʌm hˈɛlp/"),
            make("go grab", "go and grab",
                 "取って来る",
                 useCases: ["軽くつかみに行く話"],
                 examples: [
                    ("Go grab a coffee.", "コーヒー取ってくる。"),
                    ("Go grab your jacket.", "ジャケット取って来て。")
                 ], ipa: "/ɡˌəʊ ɡɹˈæb/"),
            make("come check out", "come and look at",
                 "見に来てよ",
                 useCases: ["新しいものを見せたいとき"],
                 examples: [
                    ("Come check it out.", "見に来てよ。"),
                    ("Come check out my place.", "うち見に来てよ。")
                 ], ipa: "/kˈʌm tʃˈɛk ˈaʊt/")
        ]
    }

    // MARK: - 文末ニュアンス（追加 4・or something は既出）

    private static var sentenceEnders6: [Word] {
        [
            make("or so", "approximately",
                 "〜くらい",
                 useCases: ["数値を概算で伝えるとき"],
                 examples: [
                    ("Ten or so.", "10くらい。"),
                    ("A week or so.", "1週間くらい。")
                 ], ipa: "/ɔː sˈəʊ/"),
            make("or what", "isn't it; right",
                 "〜じゃない？",
                 useCases: ["強く同意を求めるとき"],
                 examples: [
                    ("Cool or what?", "かっこよくない？"),
                    ("Crazy or what?", "やばくない？")
                 ], ipa: "/ɔː wˈɒt/"),
            make("or not", "yes or no",
                 "〜かどうか",
                 useCases: ["二択を迫るとき"],
                 examples: [
                    ("Coming or not?", "来るの来ないの？"),
                    ("True or not?", "本当か嘘か？")
                 ], ipa: "/ɔː nˈɒt/"),
            make("right?", "isn't that so",
                 "〜だよね？",
                 useCases: ["軽く同意を求めるとき"],
                 examples: [
                    ("You agree, right?", "賛成だよね？"),
                    ("It's hot, right?", "暑いよね？")
                 ], ipa: "/ɹˈaɪt/")
        ]
    }

    // MARK: - 英国英語: 挨拶・呼びかけ（追加 8）

    private static var britishGreetings7: [Word] {
        [
            make("cheers", "thanks; cheers (toast); see you",
                 "ありがとう／乾杯／じゃあね（万能）",
                 useCases: ["軽くお礼を言うとき", "別れ際", "乾杯"],
                 examples: [
                    ("Cheers, mate!", "どうも！"),
                    ("Cheers!", "ありがとう！")
                 ], ipa: "/tʃˈiəz/"),
            make("mate", "friend; pal (UK/AUS)",
                 "友よ・お前（男性同士）",
                 useCases: ["イギリスやオーストラリアでの呼びかけ"],
                 examples: [
                    ("Alright, mate?", "元気か？"),
                    ("Thanks, mate.", "ありがとう、相棒。")
                 ], ipa: "/mˈeɪt/"),
            make("love", "term of endearment to a customer or friend",
                 "あなた（お店の人がお客に）",
                 useCases: ["カフェや店員が客に呼びかけるとき"],
                 examples: [
                    ("That'll be £5, love.", "5ポンドだよ。"),
                    ("Here you go, love.", "はいどうぞ。")
                 ], ipa: "/lˈʌv/"),
            make("alright?", "are you well? (UK greeting)",
                 "元気？・どうも？",
                 useCases: ["イギリスでの挨拶"],
                 examples: [
                    ("Alright?", "どうも？"),
                    ("Alright! Long time no see.", "おう！久しぶり。")
                 ], ipa: "/ɔːlɹˈaɪt/"),
            make("you alright?", "are you okay? (UK greeting)",
                 "大丈夫？・元気？",
                 useCases: ["相手の様子を確認するとき"],
                 examples: [
                    ("You alright, mate?", "元気か？"),
                    ("You alright? You look tired.", "大丈夫？疲れて見える。")
                 ], ipa: "/juː ɔːlɹˈaɪt/"),
            make("how's it going?", "how are things",
                 "調子どう？",
                 useCases: ["気軽な挨拶として"],
                 examples: [
                    ("How's it going?", "元気？"),
                    ("Hey, how's it going?", "やあ、調子どう？")
                 ], ipa: "/hˌaʊz ɪt ɡˈəʊɪŋ/"),
            make("ta", "thanks (very casual UK)",
                 "ありがとう（超カジュアル）",
                 useCases: ["イギリスで軽くお礼を言うとき"],
                 examples: [
                    ("Ta!", "どうも！"),
                    ("Ta very much.", "どうもありがとう。")
                 ], ipa: "/tˈɑː/"),
            make("see you later", "see you later",
                 "じゃあね・またね",
                 useCases: ["別れ際の決まり文句"],
                 examples: [
                    ("See you later.", "またね。"),
                    ("See you later, alligator.", "じゃあね。")
                 ], ipa: "/sˈiː juː lˈeɪtɐ/")
        ]
    }

    // MARK: - 英国英語: 感想・反応（追加 9・brilliant は既出）

    private static var britishReactions7: [Word] {
        [
            make("lovely", "delightful; nice",
                 "素敵・いいね（万能）",
                 useCases: ["人や物・天気などを褒める万能語"],
                 examples: [
                    ("Lovely day!", "いい天気だね。"),
                    ("That's lovely, thanks.", "素敵、ありがとう。")
                 ], ipa: "/lˈʌvlɪ/"),
            make("mental", "crazy; amazing (UK slang)",
                 "狂ってる・すごい",
                 useCases: ["驚きや興奮を表すとき"],
                 examples: [
                    ("That's mental!", "マジでヤバい。"),
                    ("It was absolutely mental.", "完全にイカれてた。")
                 ], ipa: "/mˈɛntəl/"),
            make("chuffed", "very pleased",
                 "嬉しい・満足",
                 useCases: ["イギリスで嬉しさを表現するとき"],
                 examples: [
                    ("Well chuffed!", "超嬉しい。"),
                    ("Chuffed to bits.", "めっちゃ嬉しい。")
                 ], ipa: "/tʃˈʌft/"),
            make("gutted", "really disappointed",
                 "がっかり・凹む",
                 useCases: ["落胆を強く伝えるとき"],
                 examples: [
                    ("I'm gutted.", "めっちゃ凹む。"),
                    ("Absolutely gutted!", "完全に落ち込んでる。")
                 ], ipa: "/ɡˈʌtɪd/"),
            make("knackered", "exhausted (UK)",
                 "クタクタ・疲れ果てた",
                 useCases: ["強い疲労を表すとき"],
                 examples: [
                    ("I'm knackered.", "もうへとへと。"),
                    ("Knackered after work.", "仕事でクタクタ。")
                 ], ipa: "/nˈækəd/"),
            make("shattered", "exhausted",
                 "疲れ切った",
                 useCases: ["疲労困憊を表すとき"],
                 examples: [
                    ("Absolutely shattered.", "マジで疲れた。"),
                    ("I'm shattered, going to bed.", "クタクタ、寝るね。")
                 ], ipa: "/ʃˈætəd/"),
            make("sorted", "settled; taken care of",
                 "解決済み・OK",
                 useCases: ["問題が片付いた話"],
                 examples: [
                    ("It's sorted.", "もう片付いた。"),
                    ("All sorted, no worries.", "全部解決、心配ないよ。")
                 ], ipa: "/sˈɔːtɪd/"),
            make("dodgy", "dubious; iffy (UK)",
                 "怪しい・うさんくさい",
                 useCases: ["信用できない物事"],
                 examples: [
                    ("That's dodgy.", "それ怪しい。"),
                    ("Dodgy neighborhood.", "治安悪い地区。")
                 ], ipa: "/dˈɒdʒɪ/"),
            make("cheeky", "saucy; impudent in a charming way",
                 "生意気な・ずる賢い",
                 useCases: ["軽くからかう・かわいげのあるイタズラ"],
                 examples: [
                    ("Cheeky little thing.", "生意気な奴だな。"),
                    ("A cheeky pint.", "ちょっと一杯。")
                 ], ipa: "/tʃˈiːkɪ/")
        ]
    }

    // MARK: - 英国英語: 程度（追加 5）

    private static var britishDegree7: [Word] {
        [
            make("quite", "fairly; very (UK)",
                 "かなり",
                 useCases: ["イギリスでよく使う程度副詞"],
                 examples: [
                    ("Quite good.", "かなりいい。"),
                    ("Quite a lot.", "結構たくさん。")
                 ], ipa: "/kwˈaɪt/"),
            make("rather", "fairly; somewhat",
                 "かなり・むしろ",
                 useCases: ["やや控えめな評価のとき"],
                 examples: [
                    ("Rather expensive.", "けっこう高い。"),
                    ("Rather nice, actually.", "実は結構良い。")
                 ], ipa: "/ɹˈɑːðɐ/"),
            make("proper", "real; genuine; thorough (UK)",
                 "本物の・ちゃんとした",
                 useCases: ["きちんとしている、本物だと強調するとき"],
                 examples: [
                    ("A proper meal.", "ちゃんとした食事。"),
                    ("Proper job!", "よくやった！")
                 ], ipa: "/pɹˈɒpɐ/"),
            make("dead", "very (UK slang)",
                 "めっちゃ〜",
                 useCases: ["強調副詞として"],
                 examples: [
                    ("Dead tired.", "めっちゃ疲れた。"),
                    ("Dead easy.", "超簡単。")
                 ], ipa: "/dˈɛd/"),
            make("bloody", "damn (UK intensifier)",
                 "めっちゃ・くそ",
                 useCases: ["強い感情を込めるとき"],
                 examples: [
                    ("Bloody brilliant!", "マジで最高！"),
                    ("Bloody hell!", "なんてこった！")
                 ], ipa: "/blˈʌdɪ/")
        ]
    }

    // MARK: - 英国英語: 食事・飲み物（追加 5）

    private static var britishFood7: [Word] {
        [
            make("pint", "a pint of beer",
                 "パイント（ビール一杯）",
                 useCases: ["パブでビールを誘うとき"],
                 examples: [
                    ("Fancy a pint?", "一杯どう？"),
                    ("Two pints, please.", "ビール2杯ください。")
                 ], ipa: "/pˈaɪnt/"),
            make("brew", "tea; sometimes coffee",
                 "お茶（紅茶）",
                 useCases: ["ティータイムを誘うとき"],
                 examples: [
                    ("Cup of brew?", "お茶どう？"),
                    ("Make us a brew.", "お茶入れて。")
                 ], ipa: "/bɹˈuː/"),
            make("cuppa", "a cup of tea",
                 "一杯のお茶",
                 useCases: ["ティーを誘うイギリス的表現"],
                 examples: [
                    ("Fancy a cuppa?", "お茶飲む？"),
                    ("I'll put the cuppa on.", "お茶用意するね。")
                 ], ipa: "/kˈʌpɐ/"),
            make("takeaway", "takeout food (UK)",
                 "持ち帰り",
                 useCases: ["持ち帰り注文するとき"],
                 examples: [
                    ("Order a takeaway.", "持ち帰り頼もう。"),
                    ("Indian takeaway tonight?", "今夜インド料理のテイク？")
                 ], ipa: "/tˈeɪkəwˌeɪ/"),
            make("chippy", "fish and chips shop",
                 "フィッシュ&チップス店",
                 useCases: ["イギリスのチップ屋を指すとき"],
                 examples: [
                    ("Off to the chippy.", "チッピーに行く。"),
                    ("Local chippy is great.", "近所のチッピー美味しい。")
                 ], ipa: "/tʃˈɪpɪ/")
        ]
    }

    // MARK: - 英国英語: 提案・誘い（追加 4・fancy は既出）

    private static var britishSuggestions7: [Word] {
        [
            make("fancy that!", "what a surprise",
                 "まさか！・なんと！",
                 useCases: ["驚きを表す感嘆として"],
                 examples: [
                    ("Fancy that!", "そりゃ驚き！"),
                    ("Well, fancy that!", "へえ、驚いた！")
                 ], ipa: "/fˈænsɪ ðˈæt/"),
            make("shall we", "shall we go (let's)",
                 "〜しましょうか",
                 useCases: ["丁寧に誘うとき"],
                 examples: [
                    ("Shall we go?", "行きましょうか？"),
                    ("Shall we, then?", "じゃあ、行こうか？")
                 ], ipa: "/ʃˈæl wiː/"),
            make("how about a cuppa", "how about tea",
                 "お茶でもどう？",
                 useCases: ["お茶に誘う定番フレーズ"],
                 examples: [
                    ("How about a cuppa?", "お茶でも？"),
                    ("How about a cuppa and a chat?", "お茶しながら話す？")
                 ], ipa: "/hˌaʊ ɐbˌaʊt ɐ kˈʌpɐ/"),
            make("let's pop out", "let's step out briefly",
                 "ちょっと出よう",
                 useCases: ["ちょっと外に出ようと誘うとき"],
                 examples: [
                    ("Let's pop out for lunch.", "昼ごはんに出よう。"),
                    ("Let's pop out to the shop.", "店に行こう。")
                 ], ipa: "/lˈɛts pˈɒp ˈaʊt/")
        ]
    }

    // MARK: - 英国英語: 動詞・行動（追加 10）

    private static var britishVerbs7: [Word] {
        [
            make("pop in", "drop by briefly",
                 "ちょっと寄る",
                 useCases: ["軽く立ち寄る話"],
                 examples: [
                    ("Pop in later.", "後で寄る。"),
                    ("I'll pop in to say hi.", "顔出しに寄る。")
                 ], ipa: "/pˈɒp ˈɪn/"),
            make("pop round", "drop by",
                 "立ち寄る",
                 useCases: ["カジュアルに訪問するとき"],
                 examples: [
                    ("Pop round tomorrow.", "明日寄るね。"),
                    ("Pop round for tea?", "お茶に寄る？")
                 ], ipa: "/pˈɒp ɹˈaʊnd/"),
            make("nip out", "step out briefly",
                 "ちょっと出る",
                 useCases: ["短時間外出する話"],
                 examples: [
                    ("Nip out for milk.", "牛乳買いに出る。"),
                    ("I'll just nip out.", "ちょっと出てくる。")
                 ], ipa: "/nˈɪp ˈaʊt/"),
            make("queue", "line up (UK)",
                 "並ぶ",
                 useCases: ["イギリスで列を作るとき"],
                 examples: [
                    ("Queue here.", "ここで並んで。"),
                    ("Queue's long.", "列が長い。")
                 ], ipa: "/kjˈuː/"),
            make("post", "mail something (UK)",
                 "投函する",
                 useCases: ["手紙や荷物を出す話"],
                 examples: [
                    ("Post the letter.", "手紙を出す。"),
                    ("I'll post it tomorrow.", "明日出すね。")
                 ], ipa: "/pˈəʊst/"),
            make("ring", "call on the phone (UK)",
                 "電話する",
                 useCases: ["電話の連絡を取るとき"],
                 examples: [
                    ("I'll ring you.", "電話するよ。"),
                    ("Give me a ring.", "電話して。")
                 ], ipa: "/ɹˈɪŋ/"),
            make("fortnight", "two weeks",
                 "2週間",
                 useCases: ["2週間の期間を表すとき"],
                 examples: [
                    ("In a fortnight.", "2週間後に。"),
                    ("Once a fortnight.", "2週間に1回。")
                 ], ipa: "/fˈɔːtnaɪt/"),
            make("wee", "small (Scottish/UK)",
                 "小さい・ちょっと",
                 useCases: ["小ささや少量を表すとき"],
                 examples: [
                    ("A wee bit.", "ちょっとだけ。"),
                    ("Just a wee minute.", "ちょっと待って。")
                 ], ipa: "/wˈiː/"),
            make("nick", "steal; arrest (UK)",
                 "盗む・捕まえる",
                 useCases: ["盗難の話", "警察に捕まる話"],
                 examples: [
                    ("Someone nicked it.", "誰かに盗まれた。"),
                    ("Got nicked!", "捕まった！")
                 ], ipa: "/nˈɪk/"),
            make("reckon", "think; suppose (UK/AUS)",
                 "〜だと思う",
                 useCases: ["カジュアルに意見を述べるとき"],
                 examples: [
                    ("I reckon so.", "そう思う。"),
                    ("Reckon he'll come?", "彼来ると思う？")
                 ], ipa: "/ɹˈɛkən/")
        ]
    }

    // MARK: - 英国英語: 不満・がっかり（追加 3・fed up は既出）

    private static var britishComplaints7: [Word] {
        [
            make("bloody hell", "damn it; oh my god (UK)",
                 "くそ・なんてこった",
                 useCases: ["驚きや怒りを強く表すとき"],
                 examples: [
                    ("Bloody hell!", "マジかよ！"),
                    ("Bloody hell, that's expensive.", "高すぎだろ！")
                 ], ipa: "/blˈʌdɪ hˈɛl/"),
            make("bollocks", "nonsense; rubbish (UK vulgar)",
                 "でたらめ・くそ",
                 useCases: ["強く否定する場面"],
                 examples: [
                    ("That's bollocks.", "でたらめだ。"),
                    ("Bollocks!", "くそっ！")
                 ], ipa: "/bˈɒləks/"),
            make("rubbish", "nonsense; trash",
                 "くだらない・ゴミ",
                 useCases: ["価値がないと否定するとき"],
                 examples: [
                    ("That's rubbish.", "くだらない。"),
                    ("Take out the rubbish.", "ゴミ出して。")
                 ], ipa: "/ɹˈʌbɪʃ/")
        ]
    }

    // MARK: - 英国英語: 同意・理解（追加 3）

    private static var britishAgreement7: [Word] {
        [
            make("innit?", "isn't it (UK contraction)",
                 "〜だよね？",
                 useCases: ["イギリス英語のタグクエスチョン"],
                 examples: [
                    ("It's hot, innit?", "暑いよね？"),
                    ("Wicked, innit?", "ヤバい、だろ？")
                 ], ipa: "/ɪnnˈɪt/"),
            make("right", "okay; that's correct",
                 "そうだよね・了解",
                 useCases: ["相づち", "話を進めるための合いの手"],
                 examples: [
                    ("Right, let's go.", "よし、行こう。"),
                    ("Right, got it.", "了解、わかった。")
                 ], ipa: "/ɹˈaɪt/"),
            make("spot on", "exactly right",
                 "その通り・ピッタリ",
                 useCases: ["完璧な答えに賛同するとき"],
                 examples: [
                    ("Spot on!", "その通り！"),
                    ("That's spot on.", "ぴったり。")
                 ], ipa: "/spˈɒt ˈɒn/")
        ]
    }

    // MARK: - エレガント: 知的な切り出し（追加 7）

    private static var elegantOpeners8: [Word] {
        [
            make("I would argue that", "I would maintain that",
                 "〜だと主張したい・〜と考える",
                 useCases: ["論理的な意見を控えめに切り出すとき"],
                 examples: [
                    ("I would argue that quality matters more.", "質の方が大事だと考える。"),
                    ("I would argue that timing is everything.", "タイミングが全てだと言いたい。")
                 ], ipa: "/aɪ wʊd ˈɑːɡjuː ðˈæt/"),
            make("It strikes me as", "it appears to me as",
                 "〜のように感じる",
                 useCases: ["自分の印象を知的に伝えるとき"],
                 examples: [
                    ("It strikes me as odd.", "なんか奇妙に感じる。"),
                    ("It strikes me as a bit risky.", "少しリスキーに感じる。")
                 ], ipa: "/ɪt stɹˈaɪks mˌiː æz/"),
            make("It seems to me that", "in my view it seems",
                 "〜のように思える",
                 useCases: ["押し付けがましくなく意見を伝えるとき"],
                 examples: [
                    ("It seems to me that we agree.", "私たちは同意してるように思える。"),
                    ("It seems to me that this works.", "これでうまくいくように思う。")
                 ], ipa: "/ɪt sˈiːmz tə mˌiː ðˈæt/"),
            make("From my perspective", "from my point of view",
                 "私の視点では",
                 useCases: ["立場を明確にしつつ意見を述べるとき"],
                 examples: [
                    ("From my perspective, it works.", "私の視点ではうまくいく。"),
                    ("From my perspective, it's worth it.", "私から見れば価値がある。")
                 ], ipa: "/fɹɒm maɪ pəspˈɛktɪv/"),
            make("As far as I can tell", "from what I can see",
                 "私の見る限り",
                 useCases: ["限定的な確信を控えめに伝えるとき"],
                 examples: [
                    ("As far as I can tell, fine.", "見る限り問題なし。"),
                    ("As far as I can tell, no issues.", "私が見る限り問題ない。")
                 ], ipa: "/æz fˈɑːɹ æz aɪ kæn tˈɛl/"),
            make("If I may", "if you'll allow me",
                 "もしよろしければ",
                 useCases: ["丁寧に発言の許可を求めるとき"],
                 examples: [
                    ("If I may, I'd suggest…", "よろしければご提案を…"),
                    ("If I may, one more thing.", "もしよければ、もう一つ。")
                 ], ipa: "/ɪf aɪ mˈeɪ/"),
            make("Allow me to", "let me",
                 "〜させてください",
                 useCases: ["フォーマルな前置きとして"],
                 examples: [
                    ("Allow me to explain.", "説明させてください。"),
                    ("Allow me to introduce myself.", "自己紹介させてください。")
                 ], ipa: "/ɐlˈaʊ mˌiː tuː/")
        ]
    }

    // MARK: - エレガント: 同意・部分同意（追加 5）

    private static var elegantAgreement8: [Word] {
        [
            make("I take your point", "I understand your argument",
                 "おっしゃることは分かります",
                 useCases: ["相手を尊重しつつ反論する大人の表現"],
                 examples: [
                    ("I take your point, but…", "おっしゃることは分かりますが…"),
                    ("I take your point on cost.", "コストの件は理解します。")
                 ], ipa: "/aɪ tˈeɪk jɔː pˈɔɪnt/"),
            make("That's a fair point", "that's a valid point",
                 "それは妥当な指摘ですね",
                 useCases: ["建設的な議論で知的に同意するとき"],
                 examples: [
                    ("That's a fair point.", "それは妥当な指摘。"),
                    ("Hmm, that's a fair point.", "うん、もっともだ。")
                 ], ipa: "/ðæts ɐ fˈeə pˈɔɪnt/"),
            make("I see where you're coming from", "I understand your position",
                 "あなたの立場は理解できる",
                 useCases: ["意見が違っても相手を尊重するとき"],
                 examples: [
                    ("I see where you're coming from.", "言いたいことは分かる。"),
                    ("I see where you're coming from, but…", "立場は分かるけど…")
                 ], ipa: "/aɪ sˈiː wˌeə jɔː kˈʌmɪŋ fɹɒm/"),
            make("there's something to that", "there's some truth in that",
                 "一理ある",
                 useCases: ["完全には同意しないが認めるとき"],
                 examples: [
                    ("There's something to that.", "一理あるね。"),
                    ("Actually, there's something to that.", "確かに、一理ある。")
                 ], ipa: "/ðeəz sˈʌmθɪŋ tə ðˈæt/"),
            make("to a certain extent", "to some degree",
                 "ある程度は",
                 useCases: ["部分的同意を知的に表現するとき"],
                 examples: [
                    ("To a certain extent, yes.", "ある程度はそうだね。"),
                    ("Agree, to a certain extent.", "ある程度は同意。")
                 ], ipa: "/tʊ ɐ sˈɜːtən ɪkstˈɛnt/")
        ]
    }

    // MARK: - エレガント: 反対・異論（追加 5）

    private static var elegantDisagreement8: [Word] {
        [
            make("I beg to differ", "I respectfully disagree",
                 "失礼ながら異論があります",
                 useCases: ["丁寧に反対する英国的なエレガンス"],
                 examples: [
                    ("I beg to differ on that.", "その点は異論があります。"),
                    ("I beg to differ.", "失礼ながら違うと思います。")
                 ], ipa: "/aɪ bˈɛɡ tə dˈɪfɐ/"),
            make("With all due respect", "while respecting you",
                 "失礼ながら",
                 useCases: ["強い反対を礼儀正しく言う定番"],
                 examples: [
                    ("With all due respect, I disagree.", "失礼ながら反対です。"),
                    ("With all due respect, that's wrong.", "失礼ですが間違っています。")
                 ], ipa: "/wɪð ˈɔːl djˈuː ɹɪspˈɛkt/"),
            make("I'm not entirely convinced", "I have doubts",
                 "完全には納得していない",
                 useCases: ["強くは否定せず疑問を投げかけるとき"],
                 examples: [
                    ("I'm not entirely convinced.", "完全には納得していない。"),
                    ("I'm not entirely convinced of the plan.", "計画に完全には納得していない。")
                 ], ipa: "/aɪm nˌɒt ɛntˈaɪəlɪ kənvˈɪnst/"),
            make("I would argue otherwise", "I'd say the opposite",
                 "私はそうは思いません",
                 useCases: ["知的に異論を提示するとき"],
                 examples: [
                    ("I would argue otherwise.", "私はそうは思いません。"),
                    ("Actually, I would argue otherwise.", "実は逆だと思う。")
                 ], ipa: "/aɪ wʊd ˈɑːɡjuː ˈʌðəwˌaɪz/"),
            make("That's debatable", "that's open to debate",
                 "それは議論の余地があるね",
                 useCases: ["賛成も反対もしないクールな立場"],
                 examples: [
                    ("That's debatable.", "それは議論の余地あり。"),
                    ("Hmm, that's debatable.", "それはちょっと議論の余地あるね。")
                 ], ipa: "/ðæts dɪbˈeɪtəbəl/")
        ]
    }

    // MARK: - エレガント: 婉曲・控えめ（追加 2・rather, quite, somewhat は既出）

    private static var elegantHedging8: [Word] {
        [
            make("a tad", "slightly; a bit (charming)",
                 "ちょっと〜",
                 useCases: ["かわいらしく婉曲に程度を言うとき"],
                 examples: [
                    ("A tad expensive.", "ちょっと高い。"),
                    ("A tad too sweet.", "少し甘すぎる。")
                 ], ipa: "/ɐ tˈæd/"),
            make("slightly", "to a small degree",
                 "少し〜",
                 useCases: ["直接的な批判を避ける決まり文句"],
                 examples: [
                    ("Slightly disappointing.", "少しがっかり。"),
                    ("Slightly off.", "少しずれてる。")
                 ], ipa: "/slˈaɪtlɪ/")
        ]
    }

    // MARK: - エレガント: 議論の構造（追加 4・be that as it may は既出）

    private static var elegantStructure8: [Word] {
        [
            make("on the one hand", "on one side of the argument",
                 "一方では〜",
                 useCases: ["論理的な対比を構築するとき"],
                 examples: [
                    ("On the one hand, fast. On the other, costly.", "一方で速い。他方で高い。"),
                    ("On the one hand, it's cheap.", "一方では安い。")
                 ], ipa: "/ɒnðə wˈɒn hˈænd/"),
            make("that being said", "having said that",
                 "とはいえ",
                 useCases: ["前言を踏まえて展開する大人の表現"],
                 examples: [
                    ("That being said, I agree.", "とはいえ、賛成。"),
                    ("That being said, we should try.", "そうは言っても、やってみるべき。")
                 ], ipa: "/ðæt bˌiːɪŋ sˈɛd/"),
            make("having said that", "that being said",
                 "そうは言っても",
                 useCases: ["前提を認めつつ別の見方を出すとき"],
                 examples: [
                    ("Having said that, let's try.", "そうは言ってもやってみよう。"),
                    ("Having said that, it's risky.", "とはいえリスクはある。")
                 ], ipa: "/hˌævɪŋ sˈɛd ðˈæt/"),
            make("in any event", "anyway; in any case",
                 "いずれにせよ",
                 useCases: ["anyway より洗練された印象で結論に進むとき"],
                 examples: [
                    ("In any event, thank you.", "いずれにせよ、ありがとう。"),
                    ("In any event, we move on.", "いずれにせよ、先に進もう。")
                 ], ipa: "/ɪn ˌɛnɪ ɪvˈɛnt/")
        ]
    }

    // MARK: - エレガント: 提案・気遣い（追加 5）

    private static var elegantSuggestions8: [Word] {
        [
            make("Might I suggest", "may I suggest (very polite)",
                 "〜してはいかがでしょう",
                 useCases: ["上品でプロフェッショナルな提案"],
                 examples: [
                    ("Might I suggest a coffee?", "コーヒーはいかがですか？"),
                    ("Might I suggest a different approach?", "別のアプローチはいかがでしょう？")
                 ], ipa: "/mˌaɪt aɪ sədʒˈɛst/"),
            make("Perhaps we could", "maybe we could",
                 "おそらく〜できるかも",
                 useCases: ["押し付けがましくない提案"],
                 examples: [
                    ("Perhaps we could meet later.", "後で会えるといいかも。"),
                    ("Perhaps we could try this.", "これを試してみても。")
                 ], ipa: "/pəhˈæps wiː kˈʊd/"),
            make("I was wondering if", "I'd like to ask if",
                 "〜してもらえたらと",
                 useCases: ["丁寧な依頼の定番"],
                 examples: [
                    ("I was wondering if you could help.", "手伝ってもらえないかと思って。"),
                    ("I was wondering if we could meet.", "お会いできないかと思って。")
                 ], ipa: "/aɪ wɒz wˈʌndəɹɪŋ ɪf/"),
            make("Would you mind", "do you mind if (polite)",
                 "〜していただけませんか",
                 useCases: ["丁寧な依頼で必須"],
                 examples: [
                    ("Would you mind waiting?", "少々お待ちいただけますか？"),
                    ("Would you mind closing the door?", "ドアを閉めていただけますか？")
                 ], ipa: "/wʊd juː mˈaɪnd/"),
            make("It would be lovely if", "it would be wonderful if",
                 "〜していただけたら嬉しいです",
                 useCases: ["lovely を使う英国的優雅さ"],
                 examples: [
                    ("It would be lovely if you could come.", "来ていただけたら嬉しいです。"),
                    ("It would be lovely if we met soon.", "近いうちに会えたら素敵。")
                 ], ipa: "/ɪt wʊd biː lˈʌvlɪ ɪf/")
        ]
    }

    // MARK: - エレガント: 感想・評価（追加 5）

    private static var elegantEvaluations8: [Word] {
        [
            make("Quite remarkable", "really impressive (UK)",
                 "なかなか素晴らしい",
                 useCases: ["「すごい」を上品に表現するとき"],
                 examples: [
                    ("Quite remarkable, isn't it?", "なかなかすごいよね。"),
                    ("Quite remarkable indeed.", "実に素晴らしい。")
                 ], ipa: "/kwˈaɪt ɹɪmˈɑːkəbəl/"),
            make("Rather impressive", "fairly impressive",
                 "かなり印象的",
                 useCases: ["抑制された褒め言葉"],
                 examples: [
                    ("Rather impressive work.", "なかなか印象的な仕事。"),
                    ("Rather impressive, I must say.", "正直、かなり印象的。")
                 ], ipa: "/ɹˈɑːðɐɹ ɪmpɹˈɛsɪv/"),
            make("Most enjoyable", "very enjoyable (UK elegant)",
                 "とても楽しい",
                 useCases: ["very より most を使う英国的優雅さ"],
                 examples: [
                    ("It was most enjoyable.", "とても楽しかったです。"),
                    ("Most enjoyable evening.", "とても楽しい夜でした。")
                 ], ipa: "/mˈəʊst ɪndʒˈɔɪəbəl/"),
            make("Genuinely", "really; truly (intelligent)",
                 "心から〜・本当に〜",
                 useCases: ["「really」の知的バージョン"],
                 examples: [
                    ("Genuinely surprised.", "心から驚いた。"),
                    ("Genuinely impressed.", "本当に感心した。")
                 ], ipa: "/dʒˈɛnjuːɪnlɪ/"),
            make("Frankly speaking", "to be frank (refined)",
                 "率直に言うと",
                 useCases: ["honestly より洗練された前置き"],
                 examples: [
                    ("Frankly speaking, no.", "率直に言って、ノー。"),
                    ("Frankly speaking, I'm worried.", "正直なところ、心配だ。")
                 ], ipa: "/fɹˈæŋklɪ spˈiːkɪŋ/")
        ]
    }

    // MARK: - エレガント: 接続表現（追加 2）

    private static var elegantConnectives8: [Word] {
        [
            make("As such", "therefore; consequently",
                 "そのため・それゆえに",
                 useCases: ["so より知的に結論を導くとき"],
                 examples: [
                    ("As such, we declined.", "そのため辞退しました。"),
                    ("As such, the meeting was postponed.", "それゆえ会議は延期。")
                 ], ipa: "/æz sˈʌtʃ/"),
            make("In which case", "if that's the case",
                 "その場合は",
                 useCases: ["条件付き返答を上品に作るとき"],
                 examples: [
                    ("In which case, we'll go.", "その場合は行きます。"),
                    ("In which case, let me check.", "その場合は確認させて。")
                 ], ipa: "/ɪnwˌɪtʃ kˈeɪs/")
        ]
    }

    // MARK: - 雑多な追加（11）

    private static var miscBatch9: [Word] {
        [
            make("boycott", "refuse to buy or use as protest",
                 "ボイコットする・不買する",
                 useCases: ["不満から購入や参加を拒否する話"],
                 examples: [
                    ("They boycotted the brand.", "そのブランドをボイコットした。"),
                    ("We're boycotting the meeting.", "会議に出ない。")
                 ], ipa: "/bˈɔɪkɒt/"),
            make("fuss over", "pay excessive attention to",
                 "大げさに気を遣う・かまいすぎる",
                 useCases: ["過剰に世話を焼く話"],
                 examples: [
                    ("Don't fuss over me.", "そんなに気を遣わないで。"),
                    ("She fussed over the kids.", "彼女、子どもたちにかまいすぎてた。")
                 ], ipa: "/fˈʌs ˈəʊvɐ/"),
            make("moan", "complain in a whiny tone",
                 "ぐちぐち言う・うめく",
                 useCases: ["不満を漏らす話"],
                 examples: [
                    ("Stop moaning.", "ぐちぐち言わないで。"),
                    ("He's always moaning.", "彼、いつもブーブー言ってる。")
                 ], ipa: "/mˈəʊn/"),
            make("pop over", "drop by quickly",
                 "ちょっと立ち寄る",
                 useCases: ["近所の家にふらっと行く話"],
                 examples: [
                    ("Pop over for a tea.", "お茶しに来てよ。"),
                    ("I'll pop over later.", "後で寄るね。")
                 ], ipa: "/pˈɒp ˈəʊvɐ/"),
            make("buzzing", "very excited; energetic",
                 "ワクワクしてる・盛り上がってる",
                 useCases: ["興奮や活気を表すとき"],
                 examples: [
                    ("I'm buzzing!", "テンション上がってる！"),
                    ("The crowd was buzzing.", "観客が盛り上がってた。")
                 ], ipa: "/bˈʌzɪŋ/"),
            make("wreck", "ruin; a person who's a mess",
                 "台無しにする・ボロボロの人",
                 useCases: ["何かを壊す話", "疲労困憊した人を表すとき"],
                 examples: [
                    ("That wrecked my plan.", "それで計画が台無し。"),
                    ("I'm a wreck today.", "今日ボロボロ。")
                 ], ipa: "/ɹˈɛk/"),
            make("maniac", "crazy or fanatical person",
                 "狂人・〜マニア",
                 useCases: ["危ない人や熱狂的なファンを表すとき"],
                 examples: [
                    ("He drives like a maniac.", "彼、運転が荒い。"),
                    ("A coffee maniac.", "コーヒーマニア。")
                 ], ipa: "/mˈeɪnɪˌæk/"),
            make("have a go", "give it a try (UK)",
                 "挑戦してみる・やってみる",
                 useCases: ["試しにやってみるとき"],
                 examples: [
                    ("Have a go.", "やってみて。"),
                    ("I'll have a go at it.", "ちょっと試してみる。")
                 ], ipa: "/hæv ɐ ɡˈəʊ/"),
            make("if you ask me", "in my opinion",
                 "私に言わせれば",
                 useCases: ["率直な意見を切り出すとき"],
                 examples: [
                    ("If you ask me, it's silly.", "私に言わせればバカげてる。"),
                    ("If you ask me, he's right.", "言わせてもらえれば、彼は正しい。")
                 ], ipa: "/ɪf juː ˈɑːsk mˌiː/"),
            make("good on you", "good for you (UK/AUS)",
                 "よくやったね・偉い",
                 useCases: ["相手の頑張りを称えるとき"],
                 examples: [
                    ("Good on you!", "よくやった！"),
                    ("Good on you for trying.", "挑戦して偉い。")
                 ], ipa: "/ɡˈʊd ˈɒn juː/"),
            make("don't you think", "wouldn't you agree",
                 "〜だと思わない？",
                 useCases: ["相手の同意を促すとき"],
                 examples: [
                    ("It's hot, don't you think?", "暑いと思わない？"),
                    ("That's strange, don't you think?", "それ変だと思わない？")
                 ], ipa: "/dˈəʊnt juː θˈɪŋk/")
        ]
    }

    // MARK: - 動作・行動の動詞（追加 18・rush, drag は既出）

    private static var actionVerbs10: [Word] {
        [
            make("dash", "go quickly; run",
                 "急いで行く・走る",
                 useCases: ["急いで移動する話"],
                 examples: [
                    ("I gotta dash.", "急いで行かなきゃ。"),
                    ("Dash to the store.", "急いで店に行く。")
                 ], ipa: "/dˈæʃ/"),
            make("hurry up", "be quick",
                 "急ぐ",
                 useCases: ["相手を急かすとき"],
                 examples: [
                    ("Hurry up!", "早く！"),
                    ("Hurry up, we're late.", "急いで、遅れる。")
                 ], ipa: "/hˈʌɹɪ ˈʌp/"),
            make("slip", "slide; sneak something in",
                 "滑る・こっそり入れる",
                 useCases: ["転倒する話", "そっと挟み込む話"],
                 examples: [
                    ("I slipped on ice.", "氷で滑った。"),
                    ("She slipped a note in.", "メモをこっそり挟んだ。")
                 ], ipa: "/slˈɪp/"),
            make("trip", "stumble",
                 "つまずく",
                 useCases: ["足を引っ掛けて転びかける話"],
                 examples: [
                    ("I tripped on the rug.", "敷物でつまずいた。"),
                    ("Don't trip!", "転ばないで！")
                 ], ipa: "/tɹˈɪp/"),
            make("bump into", "collide; meet by chance",
                 "ぶつかる・偶然会う",
                 useCases: ["人にバッタリ会う話"],
                 examples: [
                    ("Bumped into John.", "ジョンに偶然会った。"),
                    ("Sorry, bumped into you.", "ごめん、ぶつかっちゃった。")
                 ], ipa: "/bˈʌmp ˌɪntʊ/"),
            make("crash into", "smash into",
                 "激突する",
                 useCases: ["車などが何かにぶつかる話"],
                 examples: [
                    ("Crashed into a wall.", "壁にぶつかった。"),
                    ("The car crashed into a tree.", "車が木に激突した。")
                 ], ipa: "/kɹˈæʃ ˌɪntʊ/"),
            make("grab", "take quickly",
                 "つかむ・素早く取る",
                 useCases: ["素早く何かを取る話"],
                 examples: [
                    ("Grab a coffee.", "コーヒーを買う。"),
                    ("Grab my hand!", "手を掴んで！")
                 ], ipa: "/ɡɹˈæb/"),
            make("toss", "throw lightly",
                 "投げる・放る",
                 useCases: ["軽く投げる話"],
                 examples: [
                    ("Toss it over.", "こっちに投げて。"),
                    ("Toss it in the bin.", "ゴミ箱に放って。")
                 ], ipa: "/tˈɒs/"),
            make("shove", "push roughly",
                 "押しのける・突っ込む",
                 useCases: ["強く押す話"],
                 examples: [
                    ("Don't shove me!", "押さないで！"),
                    ("He shoved past me.", "彼、押しのけて通った。")
                 ], ipa: "/ʃˈʌv/"),
            make("squeeze", "press; force through",
                 "押し込む・絞る",
                 useCases: ["人混みを通り抜ける話", "果汁を絞る話"],
                 examples: [
                    ("Squeeze through the crowd.", "人混みを押し分ける。"),
                    ("Squeeze the lemon.", "レモンを絞って。")
                 ], ipa: "/skwˈiːz/"),
            make("stretch", "extend; do stretches",
                 "伸ばす・ストレッチする",
                 useCases: ["体を伸ばす話"],
                 examples: [
                    ("Stretch your legs.", "足を伸ばして。"),
                    ("Time to stretch.", "ストレッチの時間。")
                 ], ipa: "/stɹˈɛtʃ/"),
            make("bend over", "lean down",
                 "かがむ",
                 useCases: ["前かがみになる話"],
                 examples: [
                    ("Bend over to pick it up.", "かがんで拾う。"),
                    ("Don't bend over too far.", "前にかがみすぎないで。")
                 ], ipa: "/bˈɛnd ˈəʊvɐ/"),
            make("lean on", "rest against; depend on",
                 "もたれかかる・頼る",
                 useCases: ["物理的に寄りかかる話", "誰かを頼る話"],
                 examples: [
                    ("Lean on me.", "頼ってね。"),
                    ("Lean on the wall.", "壁にもたれて。")
                 ], ipa: "/lˈiːn ˈɒn/"),
            make("knock", "tap; rap on a door",
                 "ノックする・叩く",
                 useCases: ["ドアを叩く話"],
                 examples: [
                    ("Knock before entering.", "入る前にノック。"),
                    ("Someone's knocking.", "誰かノックしてる。")
                 ], ipa: "/nˈɒk/"),
            make("kick", "strike with foot; start",
                 "蹴る・始める",
                 useCases: ["ボールを蹴る話", "活動を始める話"],
                 examples: [
                    ("Kick the ball.", "ボールを蹴る。"),
                    ("Kick off the meeting.", "会議を始める。")
                 ], ipa: "/kˈɪk/"),
            make("swing", "sway; rotate around",
                 "揺れる・振る",
                 useCases: ["バットを振る話", "揺れる話"],
                 examples: [
                    ("Swing the bat.", "バットを振る。"),
                    ("The door swung open.", "ドアが開いた。")
                 ], ipa: "/swˈɪŋ/"),
            make("flip", "turn over; switch quickly",
                 "ひっくり返す・パッと変える",
                 useCases: ["パンケーキを返す話", "状態を切り替える話"],
                 examples: [
                    ("Flip the pancake.", "パンケーキを返す。"),
                    ("Flip the switch.", "スイッチを入れて。")
                 ], ipa: "/flˈɪp/"),
            make("wave", "move hand; sway",
                 "手を振る・揺れる",
                 useCases: ["別れの手を振る話"],
                 examples: [
                    ("Wave goodbye.", "バイバイを振る。"),
                    ("She waved at me.", "彼女が手を振ってくれた。")
                 ], ipa: "/wˈeɪv/")
        ]
    }

    // MARK: - 思考・感情の動詞（追加 9・assume, bear in mind, come up with, dawn on, freak out, stress out は既出）

    private static var thinkingVerbs10: [Word] {
        [
            make("suspect", "have a hunch; doubt someone",
                 "疑う・〜だと思う",
                 useCases: ["怪しむ・推測する話"],
                 examples: [
                    ("I suspect he lied.", "彼が嘘ついたと思う。"),
                    ("Suspect foul play.", "不正を疑う。")
                 ], ipa: "/sˈʌspɛkt/"),
            make("wonder", "be curious; ponder",
                 "不思議に思う・〜かなと思う",
                 useCases: ["疑問を投げかけるとき"],
                 examples: [
                    ("I wonder why.", "なぜだろう。"),
                    ("Just wondering.", "ちょっと気になっただけ。")
                 ], ipa: "/wˈʌndɐ/"),
            make("figure", "think; assume",
                 "〜だろうと思う",
                 useCases: ["推測を述べるとき"],
                 examples: [
                    ("I figure he's late.", "彼は遅刻だろう。"),
                    ("Figure it'll work.", "うまくいくだろう。")
                 ], ipa: "/fˈɪɡɐ/"),
            make("realize", "become aware",
                 "はっと気づく",
                 useCases: ["後から気づく話"],
                 examples: [
                    ("I realized too late.", "遅く気づいた。"),
                    ("Realize the truth.", "真実に気づく。")
                 ], ipa: "/ɹˈiəlaɪz/"),
            make("recall", "remember",
                 "思い出す",
                 useCases: ["記憶を辿る話"],
                 examples: [
                    ("I can't recall.", "思い出せない。"),
                    ("Do you recall the meeting?", "あの会議覚えてる？")
                 ], ipa: "/ɹˈiːkɔːl/"),
            make("picture", "visualize; imagine",
                 "想像する・思い浮かべる",
                 useCases: ["イメージしてもらうとき"],
                 examples: [
                    ("Picture this.", "想像してみて。"),
                    ("Picture a beach.", "ビーチを思い浮かべて。")
                 ], ipa: "/pˈɪktʃɐ/"),
            make("strike", "occur to suddenly",
                 "急に思い浮かぶ",
                 useCases: ["ふと印象を受ける話"],
                 examples: [
                    ("It struck me as odd.", "変だなと思った。"),
                    ("It struck me suddenly.", "突然思いついた。")
                 ], ipa: "/stɹˈaɪk/"),
            make("occur to", "come to mind",
                 "ふと思いつく",
                 useCases: ["突然思いつく話"],
                 examples: [
                    ("It occurred to me.", "ふと思った。"),
                    ("It just occurred to me.", "今ふと気づいた。")
                 ], ipa: "/əkˈɜː tuː/"),
            make("chill", "relax",
                 "リラックスする",
                 useCases: ["カジュアルにくつろぐ話"],
                 examples: [
                    ("Just chill.", "落ち着いて。"),
                    ("Chill at home.", "家でゆっくりする。")
                 ], ipa: "/tʃˈɪl/")
        ]
    }

    // MARK: - コミュニケーションの動詞（追加 6・bring up, whisper, mumble は既出）

    private static var communicationVerbs10: [Word] {
        [
            make("chime in", "join in a conversation",
                 "口を挟む・意見を言う",
                 useCases: ["会話に参加する話"],
                 examples: [
                    ("Chime in anytime.", "いつでも口を挟んで。"),
                    ("She chimed in with a joke.", "彼女、冗談で参加してきた。")
                 ], ipa: "/tʃˈaɪm ˈɪn/"),
            make("butt in", "interrupt rudely",
                 "割り込む",
                 useCases: ["失礼に話に割り込む話"],
                 examples: [
                    ("Don't butt in!", "割り込まないで！"),
                    ("He butted in.", "彼、口を挟んできた。")
                 ], ipa: "/bˈʌt ˈɪn/"),
            make("cut off", "interrupt; disconnect",
                 "話を遮る・切断する",
                 useCases: ["話を遮る話", "電話が切れる話"],
                 examples: [
                    ("Don't cut me off.", "話を遮らないで。"),
                    ("The call got cut off.", "電話が切れた。")
                 ], ipa: "/kˈʌt ˈɒf/"),
            make("shout out", "call out loudly; mention",
                 "大声で呼ぶ・触れる",
                 useCases: ["呼びかける話", "誰かに言及する話"],
                 examples: [
                    ("Shout out if you need help.", "助けが要れば叫んで。"),
                    ("Shout out to my team.", "うちのチームに感謝。")
                 ], ipa: "/ʃˈaʊt ˈaʊt/"),
            make("yell", "shout loudly",
                 "怒鳴る・大声で叫ぶ",
                 useCases: ["怒って叫ぶ話"],
                 examples: [
                    ("Don't yell at me.", "怒鳴らないで。"),
                    ("She yelled across the room.", "彼女、部屋越しに叫んだ。")
                 ], ipa: "/jˈɛl/"),
            make("drop a hint", "give a subtle suggestion",
                 "ほのめかす",
                 useCases: ["遠回しに伝える話"],
                 examples: [
                    ("She dropped a hint.", "彼女がほのめかした。"),
                    ("Drop a hint about it.", "それとなく言って。")
                 ], ipa: "/dɹˈɒp ɐ hˈɪnt/")
        ]
    }

    // MARK: - 状態変化・進展（追加 7・wear off, catch on, wear out は既出）

    private static var stateChangeVerbs10: [Word] {
        [
            make("turn into", "transform into",
                 "〜に変わる",
                 useCases: ["変化を伝える話"],
                 examples: [
                    ("Rain turned into snow.", "雨が雪になった。"),
                    ("It turned into a mess.", "混乱に変わった。")
                 ], ipa: "/tˈɜːn ˌɪntʊ/"),
            make("grow into", "develop to fit",
                 "成長して〜になる",
                 useCases: ["役割や服装に馴染む話"],
                 examples: [
                    ("Grow into the role.", "役割に馴染む。"),
                    ("She'll grow into the dress.", "そのドレス、いずれ着られるよ。")
                 ], ipa: "/ɡɹˈəʊ ˌɪntʊ/"),
            make("build up", "accumulate gradually",
                 "蓄積する・徐々に増える",
                 useCases: ["疲れやストレスが溜まる話"],
                 examples: [
                    ("Stress builds up.", "ストレスが溜まる。"),
                    ("Tension's building up.", "緊張感が高まってる。")
                 ], ipa: "/bˈɪld ˈʌp/"),
            make("die down", "subside; calm",
                 "静まる・収まる",
                 useCases: ["騒ぎや風が収まる話"],
                 examples: [
                    ("The wind died down.", "風が収まった。"),
                    ("Things died down.", "騒ぎが収まった。")
                 ], ipa: "/dˈaɪ dˈaʊn/"),
            make("fade away", "gradually disappear",
                 "消えていく",
                 useCases: ["記憶や音が薄れる話"],
                 examples: [
                    ("Memories fade away.", "記憶は薄れる。"),
                    ("The pain faded away.", "痛みが消えた。")
                 ], ipa: "/fˈeɪd ɐwˈeɪ/"),
            make("kick in", "start to take effect",
                 "効き始める・始動する",
                 useCases: ["薬や効果が出始める話"],
                 examples: [
                    ("The medicine kicked in.", "薬が効いてきた。"),
                    ("Adrenaline kicked in.", "アドレナリンが出てきた。")
                 ], ipa: "/kˈɪk ˈɪn/"),
            make("break out", "suddenly start; escape",
                 "急に発生する・脱出する",
                 useCases: ["災害や戦争が起きる話", "脱獄の話"],
                 examples: [
                    ("A fire broke out.", "火事が発生。"),
                    ("They broke out of jail.", "彼ら、脱獄した。")
                 ], ipa: "/bɹˈeɪk ˈaʊt/")
        ]
    }

    // MARK: - 取り扱い・処理（追加 5）

    private static var handlingVerbs10: [Word] {
        [
            make("handle", "deal with",
                 "扱う・対処する",
                 useCases: ["問題を任される話"],
                 examples: [
                    ("I'll handle it.", "私が対処する。"),
                    ("Can you handle this?", "これ任せていい？")
                 ], ipa: "/hˈændəl/"),
            make("deal with", "handle; manage",
                 "対処する",
                 useCases: ["問題に向き合う話"],
                 examples: [
                    ("Deal with the problem.", "問題に対処。"),
                    ("I'll deal with him.", "彼の対応は俺がやる。")
                 ], ipa: "/dˈiːl wɪð/"),
            make("tackle", "address; confront",
                 "取り組む・立ち向かう",
                 useCases: ["難題に挑む話"],
                 examples: [
                    ("Tackle the issue.", "問題に取り組む。"),
                    ("Tackle it head-on.", "正面から立ち向かう。")
                 ], ipa: "/tˈækəl/"),
            make("manage", "manage; cope",
                 "なんとかする・管理する",
                 useCases: ["何とか乗り切る話"],
                 examples: [
                    ("I'll manage.", "なんとかする。"),
                    ("Manage the team.", "チームを管理する。")
                 ], ipa: "/mˈænɪdʒ/"),
            make("cope with", "deal with; endure",
                 "対処する・乗り越える",
                 useCases: ["ストレスや困難に対応する話"],
                 examples: [
                    ("Cope with stress.", "ストレスに対処。"),
                    ("How do you cope?", "どう乗り越えてる？")
                 ], ipa: "/kˈəʊp wɪð/")
        ]
    }

    // MARK: - I + 動詞（追加 1・I bet, I figure, I take it, I'd hate to は既出）

    private static var iVerbSimple10: [Word] {
        [
            make("I doubt", "I don't think",
                 "〜とは思えない",
                 useCases: ["懐疑的な意見を伝えるとき"],
                 examples: [
                    ("I doubt it'll work.", "うまく行くとは思えない。"),
                    ("I doubt that.", "それは疑わしい。")
                 ], ipa: "/aɪ dˈaʊt/")
        ]
    }

    // MARK: - You + 動詞（追加 4・you'd better は既出）

    private static var youVerbCheck10: [Word] {
        [
            make("you'll see", "you'll find out",
                 "分かるよ・見てな",
                 useCases: ["後で分かると伝えるとき"],
                 examples: [
                    ("You'll see why.", "理由が分かるよ。"),
                    ("Just wait, you'll see.", "待って、見てな。")
                 ], ipa: "/juːl sˈiː/"),
            make("you can tell", "it's obvious",
                 "分かるよね",
                 useCases: ["明白だと伝えるとき"],
                 examples: [
                    ("You can tell he's lying.", "嘘ついてるって分かる。"),
                    ("You can tell she's tired.", "疲れてるの分かるよ。")
                 ], ipa: "/juː kæn tˈɛl/"),
            make("you wouldn't believe", "you'd be amazed",
                 "信じられないよ",
                 useCases: ["驚きの話を切り出すとき"],
                 examples: [
                    ("You wouldn't believe what happened.", "何があったか信じられない。"),
                    ("You wouldn't believe the price.", "値段、信じられないよ。")
                 ], ipa: "/juː wˈʊdənt bɪlˈiːv/"),
            make("you might want to", "you should consider",
                 "〜した方がいいかも",
                 useCases: ["やんわり提案するとき"],
                 examples: [
                    ("You might want to leave.", "出た方がいいかも。"),
                    ("You might want to check.", "確認した方がいいかも。")
                 ], ipa: "/juː mˌaɪt wˈɒnt tuː/")
        ]
    }

    // MARK: - That's + 名詞/形容詞 反応（追加 5）

    private static var thatsReactions10: [Word] {
        [
            make("that's a relief", "I'm relieved",
                 "ほっとした",
                 useCases: ["心配が解けた瞬間"],
                 examples: [
                    ("That's a relief!", "よかった！"),
                    ("Phew, that's a relief.", "ふー、ほっとした。")
                 ], ipa: "/ðæts ɐ ɹɪlˈiːf/"),
            make("that's a shame", "what a pity",
                 "残念",
                 useCases: ["残念な話に共感するとき"],
                 examples: [
                    ("That's a shame.", "残念だね。"),
                    ("Oh, that's a real shame.", "あー、本当に残念。")
                 ], ipa: "/ðæts ɐ ʃˈeɪm/"),
            make("that's the spirit", "good attitude",
                 "その意気だ",
                 useCases: ["前向きな姿勢を称えるとき"],
                 examples: [
                    ("That's the spirit!", "その調子！"),
                    ("Yes, that's the spirit.", "うん、その意気だ。")
                 ], ipa: "/ðæts ðə spˈɪɹɪt/"),
            make("that's the way", "that's how",
                 "そう、それでいい",
                 useCases: ["上手くやれている時"],
                 examples: [
                    ("That's the way!", "その調子！"),
                    ("That's the way, keep it up.", "それそれ、続けて。")
                 ], ipa: "/ðæts ðə wˈeɪ/"),
            make("that's enough", "stop now",
                 "もう十分・やめろ",
                 useCases: ["やめさせるとき"],
                 examples: [
                    ("That's enough!", "もうやめて！"),
                    ("That's enough for today.", "今日はここまで。")
                 ], ipa: "/ðæts ɪnˈʌf/")
        ]
    }

    // MARK: - How + 動詞 質問・感嘆（追加 3・how come, how about は既出）

    private static var howVerbQuestions10: [Word] {
        [
            make("how dare you", "expression of indignation",
                 "よくも〜できるな",
                 useCases: ["強い怒りを表すとき"],
                 examples: [
                    ("How dare you say that!", "よくもそんなこと！"),
                    ("How dare you!", "よくも！")
                 ], ipa: "/hˌaʊ dˈeə juː/"),
            make("how nice", "how kind / lovely",
                 "なんて素敵",
                 useCases: ["相手の優しさを称えるとき"],
                 examples: [
                    ("How nice of you!", "親切だね！"),
                    ("How nice!", "素敵！")
                 ], ipa: "/hˌaʊ nˈaɪs/"),
            make("how on earth", "in what way (incredulous)",
                 "一体どうやって〜？",
                 useCases: ["驚きと疑問を強く表すとき"],
                 examples: [
                    ("How on earth did you?", "一体どうやって？"),
                    ("How on earth did you find this?", "どうやってこれ見つけた？")
                 ], ipa: "/hˌaʊ ˌɒn ˈɜːθ/")
        ]
    }

    // MARK: - 動詞 + 動名詞（追加 5）

    private static var verbGerund10: [Word] {
        [
            make("mind doing", "be willing / would you",
                 "〜してもいい？",
                 useCases: ["丁寧にお願いするとき"],
                 examples: [
                    ("Mind opening the door?", "ドア開けてもらえる？"),
                    ("Mind helping me?", "手伝ってくれる？")
                 ], ipa: "/mˈaɪnd dˈuːɪŋ/"),
            make("finish doing", "complete the action",
                 "〜し終える",
                 useCases: ["作業を終える話"],
                 examples: [
                    ("Finish reading.", "読み終える。"),
                    ("Finish eating first.", "まずは食べ終わって。")
                 ], ipa: "/fˈɪnɪʃ dˈuːɪŋ/"),
            make("enjoy doing", "have fun doing",
                 "〜を楽しむ",
                 useCases: ["趣味や活動を楽しむ話"],
                 examples: [
                    ("Enjoy cooking.", "料理を楽しむ。"),
                    ("I enjoy reading.", "読書が好き。")
                 ], ipa: "/ɪndʒˈɔɪ dˈuːɪŋ/"),
            make("avoid doing", "stay away from doing",
                 "〜を避ける",
                 useCases: ["やらないように気をつける話"],
                 examples: [
                    ("Avoid going late.", "遅く行くのを避ける。"),
                    ("Avoid eating sweets.", "甘いものを避ける。")
                 ], ipa: "/ɐvˈɔɪd dˈuːɪŋ/"),
            make("keep doing", "continue doing",
                 "〜し続ける",
                 useCases: ["継続して何かをする話"],
                 examples: [
                    ("Keep trying.", "試し続けて。"),
                    ("Keep walking.", "歩き続けて。")
                 ], ipa: "/kˈiːp dˈuːɪŋ/")
        ]
    }

    // MARK: - 動詞 + 不定詞（追加 5）

    private static var verbInfinitive10: [Word] {
        [
            make("decide to", "choose to do",
                 "〜することに決める",
                 useCases: ["決定したと伝えるとき"],
                 examples: [
                    ("Decided to leave.", "出ることにした。"),
                    ("She decided to stay.", "彼女は残ることにした。")
                 ], ipa: "/dɪsˈaɪd tuː/"),
            make("promise to", "commit to do",
                 "〜すると約束",
                 useCases: ["約束を伝えるとき"],
                 examples: [
                    ("Promise to call.", "電話すると約束。"),
                    ("Promise to be on time.", "時間通りに来ると約束する。")
                 ], ipa: "/pɹˈɒmɪs tuː/"),
            make("refuse to", "decline to do",
                 "〜を拒む",
                 useCases: ["強く断る話"],
                 examples: [
                    ("Refused to come.", "来るのを拒んだ。"),
                    ("She refused to listen.", "彼女、聞こうとしなかった。")
                 ], ipa: "/ɹɪfjˈuːz tuː/"),
            make("agree to", "consent to do",
                 "〜に同意",
                 useCases: ["合意して何かをすると伝えるとき"],
                 examples: [
                    ("Agreed to help.", "手伝うと同意。"),
                    ("They agreed to meet.", "会うことに同意した。")
                 ], ipa: "/ɐɡɹˈiː tuː/"),
            make("offer to", "volunteer to do",
                 "〜しようと申し出る",
                 useCases: ["親切で申し出る話"],
                 examples: [
                    ("Offered to drive.", "運転を申し出た。"),
                    ("She offered to help.", "彼女、手伝うと申し出た。")
                 ], ipa: "/ˈɒfɐ tuː/")
        ]
    }

    // MARK: - to be + 形容詞（追加 4・to be honest は既出）

    private static var toBeAdj10: [Word] {
        [
            make("to be fair", "in fairness",
                 "公平に言うと",
                 useCases: ["相手にも一理あると認めるとき"],
                 examples: [
                    ("To be fair, he tried.", "公平に言うと頑張った。"),
                    ("To be fair, it's hard.", "公平に言って難しい。")
                 ], ipa: "/təbɪ fˈeə/"),
            make("to be precise", "more accurately",
                 "正確には",
                 useCases: ["数字や時間を正確に伝えるとき"],
                 examples: [
                    ("5pm, to be precise.", "正確には5時。"),
                    ("Three years, to be precise.", "正確に言うと3年。")
                 ], ipa: "/təbɪ pɹɪsˈaɪs/"),
            make("to be frank", "honestly speaking",
                 "率直に",
                 useCases: ["遠慮なく本音を言うとき"],
                 examples: [
                    ("To be frank, no.", "率直に言ってノー。"),
                    ("To be frank, I disagree.", "率直に言うと反対。")
                 ], ipa: "/təbɪ fɹˈæŋk/"),
            make("to be safe", "as a precaution",
                 "念のため",
                 useCases: ["保険として何かをするとき"],
                 examples: [
                    ("To be safe, take an umbrella.", "念のため傘を。"),
                    ("To be safe, double-check.", "念のため再確認して。")
                 ], ipa: "/təbɪ sˈeɪf/")
        ]
    }

    // MARK: - 文末・つなぎ（追加 4・believe it or not は既出）

    private static var sentenceEnders10: [Word] {
        [
            make("if you know what I mean", "you get the idea",
                 "〜分かるでしょ",
                 useCases: ["遠回しな表現の後に意味を補足するとき"],
                 examples: [
                    ("It's complicated, if you know what I mean.", "複雑なんだよ、分かるでしょ。"),
                    ("He's a piece of work, if you know what I mean.", "彼ってアレな人、分かるでしょ。")
                 ], ipa: "/ɪf juː nˈəʊ wɒt aɪ mˈiːn/"),
            make("or so they say", "or so the saying goes",
                 "〜らしい",
                 useCases: ["伝聞情報を伝えるとき"],
                 examples: [
                    ("It's true, or so they say.", "本当らしい。"),
                    ("Money buys happiness, or so they say.", "金は幸せを買えるらしい。")
                 ], ipa: "/ɔː sˌəʊ ðeɪ sˈeɪ/"),
            make("and that's that", "and that's final",
                 "それで終わり",
                 useCases: ["議論を打ち切るとき"],
                 examples: [
                    ("No, and that's that.", "ノー、以上。"),
                    ("I said no, and that's that.", "ダメと言ったら終わり。")
                 ], ipa: "/ænd ðæts ðˈæt/"),
            make("whether you like it or not", "regardless of preference",
                 "好むと好まざるとに関わらず",
                 useCases: ["強制力を伝えるとき"],
                 examples: [
                    ("You're going, whether you like it or not.", "嫌でも行くんだよ。"),
                    ("It's happening, whether you like it or not.", "好き嫌い関係なくこうなる。")
                 ], ipa: "/wˈɛðɐ juː lˈaɪk ɪt ɔː nˈɒt/")
        ]
    }

    // MARK: - How + 形容詞/副詞 感嘆（追加 5）

    private static var howReactions11: [Word] {
        [
            make("How time flies", "time passes quickly",
                 "時が経つのは早い",
                 useCases: ["久しぶりに何かを思い出したとき"],
                 examples: [
                    ("How time flies!", "時が経つのは早い！"),
                    ("How time flies — already a year.", "早いね、もう一年。")
                 ], ipa: "/hˌaʊ tˈaɪm flˈaɪz/"),
            make("How sweet of you", "what a kind gesture",
                 "なんて優しい",
                 useCases: ["相手の気遣いに感謝するとき"],
                 examples: [
                    ("How sweet of you!", "優しいね！"),
                    ("How sweet of you to remember.", "覚えててくれて優しい。")
                 ], ipa: "/hˌaʊ swˈiːt ɒv juː/"),
            make("How thoughtful", "very considerate",
                 "気が利くね",
                 useCases: ["細やかな気配りを褒めるとき"],
                 examples: [
                    ("How thoughtful!", "気が利くね！"),
                    ("How thoughtful of him.", "彼って気が利く。")
                 ], ipa: "/hˌaʊ θˈɔːtfəl/"),
            make("How embarrassing", "very awkward",
                 "恥ずかしい",
                 useCases: ["気まずい状況を表すとき"],
                 examples: [
                    ("How embarrassing!", "恥ずかしい！"),
                    ("How embarrassing for him.", "彼にとって気まずいね。")
                 ], ipa: "/hˌaʊ ɪmbˈæɹəsɪŋ/"),
            make("How disappointing", "what a letdown",
                 "がっかりだ",
                 useCases: ["期待外れの結果に失望したとき"],
                 examples: [
                    ("How disappointing.", "がっかり。"),
                    ("How disappointing the result was.", "結果はがっかりだった。")
                 ], ipa: "/hˌaʊ dˌɪsɐpˈɔɪntɪŋ/")
        ]
    }

    // MARK: - If + 主語 条件パターン（追加 5）

    private static var ifPatterns11: [Word] {
        [
            make("if only", "I wish that",
                 "〜さえあれば",
                 useCases: ["叶わない願望を語るとき"],
                 examples: [
                    ("If only I knew.", "知ってたら。"),
                    ("If only it were true.", "本当ならいいのに。")
                 ], ipa: "/ɪf ˈəʊnlɪ/"),
            make("if anything", "rather; on the contrary",
                 "むしろ・どちらかと言えば",
                 useCases: ["むしろ反対のことを示唆するとき"],
                 examples: [
                    ("If anything, it's better.", "むしろ良くなった。"),
                    ("If anything, he's nicer.", "どちらかと言えば彼の方が優しい。")
                 ], ipa: "/ɪf ˈɛnɪθˌɪŋ/"),
            make("if need be", "if necessary",
                 "必要なら",
                 useCases: ["条件付きで対応を申し出るとき"],
                 examples: [
                    ("If need be, I'll go.", "必要なら行く。"),
                    ("Call me if need be.", "必要なら電話して。")
                 ], ipa: "/ɪf nˈiːd bˈiː/"),
            make("if you must know", "since you insist on asking",
                 "そんなに知りたいなら",
                 useCases: ["しつこく聞かれて渋々答えるとき"],
                 examples: [
                    ("If you must know, I left.", "どうしてもなら、帰った。"),
                    ("If you must know, I said no.", "そんなに知りたいなら、断った。")
                 ], ipa: "/ɪf juː mˈʌst nˈəʊ/"),
            make("if push comes to shove", "if the situation becomes critical",
                 "いざとなれば",
                 useCases: ["最悪の場合の対応を述べるとき"],
                 examples: [
                    ("If push comes to shove, fight.", "いざとなれば戦う。"),
                    ("If push comes to shove, we'll cancel.", "いざとなれば中止する。")
                 ], ipa: "/ɪf pˈʊʃ kˈʌmz tə ʃˈʌv/")
        ]
    }

    // MARK: - There's + 名詞 構文（追加 5）

    private static var theresPatterns11: [Word] {
        [
            make("there's no way", "it's impossible",
                 "〜のはずがない",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("There's no way!", "ありえない！"),
                    ("There's no way he did it.", "彼がやったはずがない。")
                 ], ipa: "/ðeəz nˈəʊ wˈeɪ/"),
            make("there's no point", "it's pointless",
                 "意味がない",
                 useCases: ["やっても無駄だと伝えるとき"],
                 examples: [
                    ("There's no point arguing.", "議論しても無駄。"),
                    ("There's no point waiting.", "待っても意味ない。")
                 ], ipa: "/ðeəz nˈəʊ pˈɔɪnt/"),
            make("there's no telling", "it's impossible to know",
                 "分からない",
                 useCases: ["予測不可能なことを表すとき"],
                 examples: [
                    ("There's no telling what'll happen.", "何が起こるか分からない。"),
                    ("There's no telling when he'll come.", "いつ来るか分からない。")
                 ], ipa: "/ðeəz nˈəʊ tˈɛlɪŋ/"),
            make("there's no rush", "no need to hurry",
                 "急がなくていい",
                 useCases: ["相手を急がせないように伝えるとき"],
                 examples: [
                    ("There's no rush.", "ゆっくりでいい。"),
                    ("Take your time, there's no rush.", "ゆっくりどうぞ、急がなくていい。")
                 ], ipa: "/ðeəz nˈəʊ ɹˈʌʃ/"),
            make("there's something about", "there is a certain quality in",
                 "どこか〜なところがある",
                 useCases: ["言葉にできない印象を語るとき"],
                 examples: [
                    ("There's something about him.", "彼にはどこか〜なところがある。"),
                    ("There's something about this place.", "この場所には何かある。")
                 ], ipa: "/ðeəz sˈʌmθɪŋ ɐbˈaʊt/")
        ]
    }

    // MARK: - It's + 名詞/形容詞 反応（追加 5）

    private static var itsPatterns11: [Word] {
        [
            make("it's about time", "finally; long overdue",
                 "そろそろだ・やっとだ",
                 useCases: ["待っていたことが起きたとき"],
                 examples: [
                    ("It's about time!", "やっとだ！"),
                    ("It's about time you called.", "やっと電話してきた。")
                 ], ipa: "/ɪts ɐbˌaʊt tˈaɪm/"),
            make("it's no use", "it's pointless",
                 "無駄だ",
                 useCases: ["諦めを表すとき"],
                 examples: [
                    ("It's no use crying.", "泣いても無駄。"),
                    ("It's no use trying.", "やっても無駄。")
                 ], ipa: "/ɪts nˈəʊ jˈuːs/"),
            make("it's worth it", "it has value",
                 "価値がある",
                 useCases: ["努力や出費に見合うと伝えるとき"],
                 examples: [
                    ("It's worth it.", "その価値ある。"),
                    ("Trust me, it's worth it.", "信じて、価値ある。")
                 ], ipa: "/ɪts wˈɜːθ ɪt/"),
            make("it's beyond me", "I can't understand it",
                 "私には理解できない",
                 useCases: ["理解不能なことに対するとき"],
                 examples: [
                    ("It's beyond me.", "理解不能。"),
                    ("Why he did it is beyond me.", "なぜやったか分からない。")
                 ], ipa: "/ɪts bɪjˈɒnd mˌiː/"),
            make("it's up to you", "your decision",
                 "あなた次第",
                 useCases: ["相手に判断を委ねるとき"],
                 examples: [
                    ("It's up to you.", "あなた次第。"),
                    ("Either way, it's up to you.", "どっちでもあなた次第。")
                 ], ipa: "/ɪts ˈʌp tə juː/")
        ]
    }

    // MARK: - Make / Have 使役・依頼（追加 3・get/have someone do は既出）

    private static var causativePatterns11: [Word] {
        [
            make("make sure", "ensure; be certain",
                 "必ず〜する",
                 useCases: ["相手に確実な行動を依頼するとき"],
                 examples: [
                    ("Make sure to call.", "必ず電話して。"),
                    ("Make sure the door is locked.", "ドアの鍵を必ず確認して。")
                 ], ipa: "/mˌeɪk ʃˈɔː/"),
            make("make do with", "manage with what is available",
                 "〜で間に合わせる",
                 useCases: ["足りないものでやりくりするとき"],
                 examples: [
                    ("Make do with this.", "これで我慢。"),
                    ("We'll make do with what we have.", "あるもので何とかする。")
                 ], ipa: "/mˌeɪk dˈuː wɪð/"),
            make("have a go at", "give it a try",
                 "試してみる",
                 useCases: ["挑戦してみるよう促すとき"],
                 examples: [
                    ("Have a go at it.", "試してみて。"),
                    ("I'll have a go at fixing it.", "直すのを試してみる。")
                 ], ipa: "/hæv ɐ ɡˈəʊ æt/")
        ]
    }

    // MARK: - What + 主語 構文（追加 5）

    private static var whatPatterns11: [Word] {
        [
            make("what gets me is", "what bothers me is",
                 "気になるのは",
                 useCases: ["不満や引っかかる点を伝えるとき"],
                 examples: [
                    ("What gets me is his attitude.", "気になるのは彼の態度。"),
                    ("What gets me is the timing.", "気になるのはタイミング。")
                 ], ipa: "/wˌɒt ɡˈɛts mˌiː ɪz/"),
            make("what I mean is", "in other words",
                 "つまり",
                 useCases: ["言い直して説明するとき"],
                 examples: [
                    ("What I mean is, no.", "つまりノー。"),
                    ("What I mean is, it's complicated.", "つまり複雑なんだ。")
                 ], ipa: "/wˌɒt aɪ mˈiːn ɪz/"),
            make("what I'm saying is", "the point I'm making is",
                 "言いたいのは",
                 useCases: ["要点を強調して伝えるとき"],
                 examples: [
                    ("What I'm saying is, careful.", "言いたいのは、注意してと。"),
                    ("What I'm saying is, we should wait.", "言いたいのは待つべきってこと。")
                 ], ipa: "/wˌɒt aɪm sˈeɪɪŋ ɪz/"),
            make("what's wrong with", "what is the problem with",
                 "〜の何が悪い？",
                 useCases: ["反論や弁護として使うとき"],
                 examples: [
                    ("What's wrong with that?", "それの何が悪い？"),
                    ("What's wrong with trying?", "試して何が悪い？")
                 ], ipa: "/wˌɒts ɹˈɒŋ wɪð/"),
            make("what's the matter", "what is the problem",
                 "どうしたの？",
                 useCases: ["相手の様子を心配して尋ねるとき"],
                 examples: [
                    ("What's the matter?", "どうした？"),
                    ("What's the matter with you?", "どうしたの、君？")
                 ], ipa: "/wˌɒts ðə mˈætɐ/")
        ]
    }

    // MARK: - 動詞 + 副詞 パターン（追加 5）

    private static var adverbPatterns11: [Word] {
        [
            make("right away", "immediately",
                 "すぐに",
                 useCases: ["即座に行動することを伝えるとき"],
                 examples: [
                    ("I'll do it right away.", "すぐやる。"),
                    ("Send it right away.", "すぐ送って。")
                 ], ipa: "/ɹˈaɪt ɐwˈeɪ/"),
            make("right now", "at this moment",
                 "今すぐ",
                 useCases: ["即時の対応を求めるとき"],
                 examples: [
                    ("Right now, please.", "今すぐお願い。"),
                    ("I need it right now.", "今すぐ必要。")
                 ], ipa: "/ɹˈaɪt nˈaʊ/"),
            make("just about", "almost; nearly",
                 "ほぼ・もう少しで",
                 useCases: ["完了直前を表すとき"],
                 examples: [
                    ("Just about done.", "ほぼ終わり。"),
                    ("I'm just about ready.", "もう少しで準備完了。")
                 ], ipa: "/dʒˈʌst ɐbˈaʊt/"),
            make("just barely", "by a very small margin",
                 "ぎりぎり",
                 useCases: ["かろうじて成功したとき"],
                 examples: [
                    ("Just barely made it.", "ぎりぎり間に合った。"),
                    ("Just barely passed.", "ぎりぎり合格。")
                 ], ipa: "/dʒˈʌst bˈeəlɪ/"),
            make("way off", "completely wrong; far from correct",
                 "大間違い・大ハズレ",
                 useCases: ["予想や答えが大きく外れているとき"],
                 examples: [
                    ("Way off the mark.", "大ハズレ。"),
                    ("Your guess is way off.", "予想は大外れ。")
                 ], ipa: "/wˈeɪ ˈɒf/")
        ]
    }

    // MARK: - 文末で意味を加える（追加 4・in a row は既出）

    private static var endingPatterns11: [Word] {
        [
            make("for once", "this one time",
                 "一度くらいは",
                 useCases: ["普段と違う行動を促すとき"],
                 examples: [
                    ("Be quiet for once.", "一度くらい静かに。"),
                    ("Listen for once.", "たまには聞いて。")
                 ], ipa: "/fɔː wˈʌns/"),
            make("by far", "by a large margin",
                 "圧倒的に",
                 useCases: ["群を抜いていることを強調するとき"],
                 examples: [
                    ("Best by far.", "断然最高。"),
                    ("By far the easiest.", "圧倒的に一番楽。")
                 ], ipa: "/baɪ fˈɑː/"),
            make("in a heartbeat", "instantly; without hesitation",
                 "即座に",
                 useCases: ["迷いなく行動する意志を示すとき"],
                 examples: [
                    ("I'd go in a heartbeat.", "即行く。"),
                    ("She'd say yes in a heartbeat.", "彼女なら即イエス。")
                 ], ipa: "/ɪn ɐ hˈɑːtbiːt/"),
            make("for the life of me", "no matter how hard I try",
                 "どうしても〜できない",
                 useCases: ["何かを思い出せない・できない強調"],
                 examples: [
                    ("Can't remember for the life of me.", "どうしても思い出せない。"),
                    ("For the life of me, I can't find it.", "どうしても見つからない。")
                 ], ipa: "/fəðə lˈaɪf ɒv mˌiː/")
        ]
    }

    // MARK: - 失敗・成功の動詞（追加 10・screw up は既出）

    private static var failureSuccessVerbs11: [Word] {
        [
            make("doze off", "fall asleep unintentionally",
                 "うたた寝する",
                 useCases: ["授業や会議でうとうとしてしまうとき"],
                 examples: [
                    ("I dozed off in class.", "授業中うたた寝した。"),
                    ("Don't doze off!", "寝落ちしないで！")
                 ], ipa: "/dˈəʊz ˈɒf/"),
            make("rip off", "cheat by overcharging",
                 "ぼったくる",
                 useCases: ["不当に高く請求されたとき"],
                 examples: [
                    ("They ripped me off.", "ぼったくられた。"),
                    ("That's a rip-off.", "それぼったくり。")
                 ], ipa: "/ɹˈɪp ˈɒf/"),
            make("save up", "accumulate money over time",
                 "貯金する",
                 useCases: ["何かのために少しずつ貯めるとき"],
                 examples: [
                    ("I'm saving up for a car.", "車のため貯金中。"),
                    ("Save up for a rainy day.", "万が一に備えて貯めて。")
                 ], ipa: "/sˈeɪv ˈʌp/"),
            make("bomb", "fail badly",
                 "大失敗する",
                 useCases: ["プレゼンや試験で大コケしたとき"],
                 examples: [
                    ("I bombed the test.", "テスト大失敗。"),
                    ("The show bombed.", "ショーは大コケ。")
                 ], ipa: "/bˈɒm/"),
            make("fall flat", "fail to achieve the intended effect",
                 "ウケない・失敗する",
                 useCases: ["冗談やアイデアが受けなかったとき"],
                 examples: [
                    ("My joke fell flat.", "冗談が滑った。"),
                    ("The plan fell flat.", "計画は失敗。")
                 ], ipa: "/fˈɔːl flˈæt/"),
            make("flunk", "fail an exam or course",
                 "落第する",
                 useCases: ["試験や授業で落ちたとき"],
                 examples: [
                    ("I flunked math.", "数学落とした。"),
                    ("Don't flunk the test.", "テスト落ちないで。")
                 ], ipa: "/flˈʌŋk/"),
            make("blow it", "miss an opportunity by failing",
                 "しくじる・台無しにする",
                 useCases: ["大事な場面で失敗したとき"],
                 examples: [
                    ("I blew it.", "しくじった。"),
                    ("Don't blow it now.", "今しくじらないで。")
                 ], ipa: "/blˈəʊ ɪt/"),
            make("ace", "do extremely well",
                 "完璧にこなす",
                 useCases: ["試験や面接で抜群の成果を出したとき"],
                 examples: [
                    ("I aced the test.", "テスト満点。"),
                    ("She aced the interview.", "面接バッチリ。")
                 ], ipa: "/ˈeɪs/"),
            make("nail it", "do something perfectly",
                 "見事に決める",
                 useCases: ["パフォーマンスや作業を完璧にこなしたとき"],
                 examples: [
                    ("You nailed it!", "完璧！"),
                    ("She nailed the speech.", "スピーチ完璧だった。")
                 ], ipa: "/nˈeɪl ɪt/"),
            make("pull out", "withdraw from an event or commitment",
                 "撤退する・手を引く",
                 useCases: ["参加を取りやめるとき"],
                 examples: [
                    ("He pulled out of the deal.", "取引から手を引いた。"),
                    ("I had to pull out.", "降りざるを得なかった。")
                 ], ipa: "/pˈʊl ˈaʊt/")
        ]
    }

    // MARK: - 人間関係の動詞（追加 10）

    private static var relationshipVerbs11: [Word] {
        [
            make("get back together", "resume a relationship",
                 "よりを戻す",
                 useCases: ["別れたカップルが再び付き合うとき"],
                 examples: [
                    ("They got back together.", "彼らはよりを戻した。"),
                    ("Will you two get back together?", "二人またヨリ戻す？")
                 ], ipa: "/ɡɛt bˈæk təɡˈɛðɐ/"),
            make("pull myself together", "regain composure",
                 "気を取り直す",
                 useCases: ["落ち込みから立ち直るとき"],
                 examples: [
                    ("I need to pull myself together.", "気を取り直さなきゃ。"),
                    ("Pull yourself together!", "しっかりしろ！")
                 ], ipa: "/pˈʊl maɪsˈɛlf təɡˈɛðɐ/"),
            make("side with", "support one party in a dispute",
                 "〜の味方をする",
                 useCases: ["争いで誰かを支持するとき"],
                 examples: [
                    ("She sided with me.", "彼女は私の味方をした。"),
                    ("Don't side with him.", "彼の肩を持たないで。")
                 ], ipa: "/sˈaɪd wɪð/"),
            make("be behind", "support; be the cause of",
                 "支持する・〜の裏にいる",
                 useCases: ["背後で誰かを支えている、または黒幕であるとき"],
                 examples: [
                    ("I'm behind you.", "応援してる。"),
                    ("Who's behind this?", "誰の仕業？")
                 ], ipa: "/biː bɪhˈaɪnd/"),
            make("break up", "end a romantic relationship",
                 "別れる",
                 useCases: ["カップルが関係を終えるとき"],
                 examples: [
                    ("We broke up.", "別れた。"),
                    ("They broke up last week.", "先週別れた。")
                 ], ipa: "/bɹˈeɪk ˈʌp/"),
            make("drift apart", "gradually become less close",
                 "疎遠になる",
                 useCases: ["友人や恋人と自然に距離ができたとき"],
                 examples: [
                    ("We drifted apart.", "疎遠になった。"),
                    ("Old friends sometimes drift apart.", "旧友は疎遠になることもある。")
                 ], ipa: "/dɹˈɪft ɐpˈɑːt/"),
            make("hit it off", "get along well immediately",
                 "意気投合する",
                 useCases: ["初対面で仲良くなれたとき"],
                 examples: [
                    ("We hit it off right away.", "すぐ意気投合した。"),
                    ("They really hit it off.", "彼らは本当に気が合った。")
                 ], ipa: "/hˈɪt ɪt ˈɒf/"),
            make("hit on", "make a romantic advance toward",
                 "口説く・ナンパする",
                 useCases: ["恋愛的にアプローチするとき"],
                 examples: [
                    ("He hit on her at the bar.", "バーで彼女を口説いた。"),
                    ("Are you hitting on me?", "口説いてる？")
                 ], ipa: "/hˈɪt ˈɒn/"),
            make("make up with", "reconcile after a fight",
                 "仲直りする",
                 useCases: ["喧嘩を終えて関係を修復するとき"],
                 examples: [
                    ("I made up with him.", "彼と仲直りした。"),
                    ("Did you make up with her?", "彼女と仲直りした？")
                 ], ipa: "/mˌeɪk ˈʌp wɪð/"),
            make("fall out with", "have a quarrel and stop being friends",
                 "仲違いする",
                 useCases: ["喧嘩して関係が悪化したとき"],
                 examples: [
                    ("I fell out with him.", "彼と仲違いした。"),
                    ("They fell out over money.", "金で仲違いした。")
                 ], ipa: "/fˈɔːl ˈaʊt wɪð/")
        ]
    }

    // MARK: - 思考・発言・心境変化（追加 10）

    private static var mindChangeVerbs11: [Word] {
        [
            make("toy with", "consider casually; play with",
                 "もてあそぶ・軽く考える",
                 useCases: ["アイデアや感情を軽く検討するとき"],
                 examples: [
                    ("I'm toying with the idea.", "そのアイデアを検討中。"),
                    ("Don't toy with my feelings.", "気持ちをもてあそばないで。")
                 ], ipa: "/tˈɔɪ wɪð/"),
            make("determine", "decide firmly; ascertain",
                 "決定する・突き止める",
                 useCases: ["事実を確定したり決断したりするとき"],
                 examples: [
                    ("We need to determine the cause.", "原因を突き止める必要がある。"),
                    ("She determined to leave.", "彼女は去る決意をした。")
                 ], ipa: "/dɪtˈɜːmɪn/"),
            make("have second thoughts", "begin to doubt a decision",
                 "考え直す・迷い始める",
                 useCases: ["決断後に迷いが生じたとき"],
                 examples: [
                    ("I'm having second thoughts.", "考え直してる。"),
                    ("She had second thoughts about it.", "彼女はそれを迷い始めた。")
                 ], ipa: "/hæv sˈɛkənd θˈɔːts/"),
            make("give it a second thought", "reconsider it",
                 "考え直す",
                 useCases: ["再考を促す、または再考するとき"],
                 examples: [
                    ("Don't give it a second thought.", "気にしないで。"),
                    ("I gave it a second thought.", "考え直した。")
                 ], ipa: "/ɡˈɪv ɪt ɐ sˈɛkənd θˈɔːt/"),
            make("brush aside", "dismiss without consideration",
                 "軽く受け流す",
                 useCases: ["意見や懸念を無視するとき"],
                 examples: [
                    ("He brushed aside my concerns.", "私の懸念を流した。"),
                    ("Don't brush it aside.", "軽く流さないで。")
                 ], ipa: "/bɹˈʌʃ ɐsˈaɪd/"),
            make("change my mind", "decide differently",
                 "気が変わる",
                 useCases: ["決めたことを変更するとき"],
                 examples: [
                    ("I changed my mind.", "気が変わった。"),
                    ("Don't change your mind now.", "今さら変えないで。")
                 ], ipa: "/tʃˈeɪndʒ maɪ mˈaɪnd/"),
            make("spit out", "say something quickly or reluctantly",
                 "吐き出す・早く言う",
                 useCases: ["言いにくいことを促すとき、口から出すとき"],
                 examples: [
                    ("Spit it out!", "早く言って！"),
                    ("He spat out the food.", "食べ物を吐き出した。")
                 ], ipa: "/spˈɪt ˈaʊt/"),
            make("let slip", "reveal accidentally",
                 "うっかり漏らす",
                 useCases: ["秘密を不意に話してしまったとき"],
                 examples: [
                    ("I let slip the secret.", "秘密をうっかり漏らした。"),
                    ("She let it slip.", "彼女がうっかり言った。")
                 ], ipa: "/lˈɛt slˈɪp/"),
            make("gossip about", "talk maliciously about others",
                 "〜について噂話をする",
                 useCases: ["他人の私生活を話題にするとき"],
                 examples: [
                    ("They gossip about everyone.", "みんなの噂話してる。"),
                    ("Don't gossip about her.", "彼女のこと噂しないで。")
                 ], ipa: "/ɡˈɒsɪp ɐbˈaʊt/"),
            make("joking apart", "speaking seriously now",
                 "冗談はさておき",
                 useCases: ["軽口の後で本題に戻すとき"],
                 examples: [
                    ("Joking apart, we need to act.", "冗談はさておき、動く必要がある。"),
                    ("Joking apart, I'm worried.", "冗談抜きで心配。")
                 ], ipa: "/dʒˈəʊkɪŋ ɐpˈɑːt/")
        ]
    }

    // MARK: - 観察・確認の動詞（追加 5・point out は既出）

    private static var observationVerbs11: [Word] {
        [
            make("eye", "look at carefully; observe",
                 "じっと見る",
                 useCases: ["値踏みするように観察するとき"],
                 examples: [
                    ("He eyed me suspiciously.", "彼は私を疑い深く見た。"),
                    ("She eyed the cake.", "彼女はケーキをじっと見た。")
                 ], ipa: "/ˈaɪ/"),
            make("scan", "look over quickly; examine systematically",
                 "ざっと見る・走査する",
                 useCases: ["ざっと目を通す、機械で読み取るとき"],
                 examples: [
                    ("I scanned the article.", "記事をざっと読んだ。"),
                    ("Scan the document.", "書類をスキャンして。")
                 ], ipa: "/skˈæn/"),
            make("stare at", "look fixedly",
                 "じっと見つめる",
                 useCases: ["凝視するとき"],
                 examples: [
                    ("Don't stare at me.", "じろじろ見ないで。"),
                    ("She stared at the screen.", "画面を凝視した。")
                 ], ipa: "/stˈeəɹ æt/"),
            make("spot check", "carry out a brief inspection",
                 "抜き打ち検査",
                 useCases: ["抜き打ちで確認するとき"],
                 examples: [
                    ("They did a spot check.", "抜き打ち検査をした。"),
                    ("Random spot checks happen daily.", "抜き打ち検査が毎日ある。")
                 ], ipa: "/spˈɒt tʃˈɛk/"),
            make("sector", "a distinct part or division",
                 "部門・区域",
                 useCases: ["業界や領域を分類して語るとき"],
                 examples: [
                    ("The tech sector is growing.", "テック業界は成長中。"),
                    ("The private sector hires more.", "民間部門の方が雇う。")
                 ], ipa: "/sˈɛktɐ/")
        ]
    }

    // MARK: - 接続表現（追加 2）

    private static var prepositionalConnectors11: [Word] {
        [
            make("aside from", "apart from; except for",
                 "〜は別として",
                 useCases: ["例外を述べるとき"],
                 examples: [
                    ("Aside from that, it's fine.", "それは別として大丈夫。"),
                    ("Aside from him, no one came.", "彼以外誰も来なかった。")
                 ], ipa: "/ɐsˈaɪd fɹɒm/"),
            make("together with", "along with; in addition to",
                 "〜と一緒に",
                 useCases: ["伴うものを述べるとき"],
                 examples: [
                    ("Together with him, we went.", "彼と一緒に行った。"),
                    ("Send the form together with the fee.", "用紙と費用を一緒に送って。")
                 ], ipa: "/təɡˈɛðɐ wɪð/")
        ]
    }

    // MARK: - 日常生活の名詞（追加 10）

    private static var dailyNouns12: [Word] {
        [
            make("errand", "a short trip to do a small task",
                 "用事・お使い",
                 useCases: ["買い物や用事を済ませるとき"],
                 examples: [
                    ("Run errands.", "用事を済ます。"),
                    ("I have errands to do.", "用事がある。")
                 ], ipa: "/ˈɛɹənd/"),
            make("chore", "a routine domestic task",
                 "雑用・家事",
                 useCases: ["家事や雑用を表すとき"],
                 examples: [
                    ("Daily chores.", "日常の家事。"),
                    ("Doing the chores.", "家事をしている。")
                 ], ipa: "/tʃˈɔː/"),
            make("routine", "a regular sequence of actions",
                 "日課・お決まり",
                 useCases: ["毎日の決まった習慣を語るとき"],
                 examples: [
                    ("Morning routine.", "朝の日課。"),
                    ("Stick to the routine.", "ルーチンを守る。")
                 ], ipa: "/ɹuːtˈiːn/"),
            make("schedule", "a plan of times for events",
                 "予定・スケジュール",
                 useCases: ["予定や時間割を話すとき"],
                 examples: [
                    ("Tight schedule.", "きついスケジュール。"),
                    ("Check the schedule.", "予定を確認して。")
                 ], ipa: "/ʃˈɛdjuːl/"),
            make("break", "a short rest from work",
                 "休憩・休み",
                 useCases: ["休憩を取るとき"],
                 examples: [
                    ("Take a break.", "休憩する。"),
                    ("A 10-minute break.", "10分休憩。")
                 ], ipa: "/bɹˈeɪk/"),
            make("work shift", "scheduled work period",
                 "交代・勤務時間",
                 useCases: ["シフト勤務について話すとき"],
                 examples: [
                    ("Night shift.", "夜勤。"),
                    ("My shift starts at 9.", "シフトは9時から。")
                 ], ipa: "/wˈɜːk ʃˈɪft/"),
            make("commute", "travel between home and work",
                 "通勤・通学",
                 useCases: ["通勤事情を話すとき"],
                 examples: [
                    ("Long commute.", "長い通勤。"),
                    ("My commute is 1 hour.", "通勤に1時間。")
                 ], ipa: "/kəmjˈuːt/"),
            make("leftovers", "remaining food from a meal",
                 "残り物",
                 useCases: ["食べ残しを話題にするとき"],
                 examples: [
                    ("Eat the leftovers.", "残りを食べる。"),
                    ("Leftovers for lunch.", "昼は残り物。")
                 ], ipa: "/lˈɛftəʊvəz/"),
            make("stuff", "things in general",
                 "物・こと",
                 useCases: ["漠然と物事を指すとき"],
                 examples: [
                    ("Got stuff to do.", "やることがある。"),
                    ("Pack your stuff.", "荷物まとめて。")
                 ], ipa: "/stˈʌf/"),
            make("junk", "useless or worthless items",
                 "がらくた・くだらない物",
                 useCases: ["不要な物を表すとき"],
                 examples: [
                    ("Throw out the junk.", "がらくたを捨てる。"),
                    ("Full of junk.", "ガラクタだらけ。")
                 ], ipa: "/dʒˈʌŋk/")
        ]
    }

    // MARK: - 人を表す名詞（追加 10）

    private static var personNouns12: [Word] {
        [
            make("stranger", "a person you don't know",
                 "知らない人",
                 useCases: ["見知らぬ人について話すとき"],
                 examples: [
                    ("Don't talk to strangers.", "知らない人と話さないで。"),
                    ("A complete stranger.", "全くの他人。")
                 ], ipa: "/stɹˈeɪndʒɐ/"),
            make("acquaintance", "a person known slightly",
                 "知り合い",
                 useCases: ["友達ではない知人について話すとき"],
                 examples: [
                    ("Just an acquaintance.", "ただの知り合い。"),
                    ("An old acquaintance.", "昔の知人。")
                 ], ipa: "/ɐkwˈeɪntəns/"),
            make("roommate", "a person sharing a room",
                 "ルームメイト",
                 useCases: ["同居人について話すとき"],
                 examples: [
                    ("My roommate snores.", "ルームメイトがいびきをかく。"),
                    ("Looking for a roommate.", "ルームメイト募集中。")
                 ], ipa: "/ɹˈuːmeɪt/"),
            make("classmate", "a person in the same class",
                 "クラスメート",
                 useCases: ["同級生を話題にするとき"],
                 examples: [
                    ("Old classmate.", "昔のクラスメート。"),
                    ("Met a classmate.", "クラスメートに会った。")
                 ], ipa: "/klˈɑːsmeɪt/"),
            make("boss", "the person in charge",
                 "上司・ボス",
                 useCases: ["上司について話すとき"],
                 examples: [
                    ("My boss is nice.", "上司は親切。"),
                    ("Tell the boss.", "上司に言って。")
                 ], ipa: "/bˈɒs/"),
            make("rival", "a competitor",
                 "ライバル",
                 useCases: ["競争相手を表すとき"],
                 examples: [
                    ("Long-time rival.", "長年のライバル。"),
                    ("Bitter rivals.", "ガチのライバル。")
                 ], ipa: "/ɹˈaɪvəl/"),
            make("fan", "an enthusiastic admirer",
                 "ファン",
                 useCases: ["熱烈な支持者であることを伝えるとき"],
                 examples: [
                    ("Big fan of yours.", "大ファン。"),
                    ("A huge fan.", "ガチファン。")
                 ], ipa: "/fˈæn/"),
            make("expert", "a person with deep knowledge",
                 "専門家",
                 useCases: ["特定分野の専門家を指すとき"],
                 examples: [
                    ("An expert in law.", "法律の専門家。"),
                    ("Ask an expert.", "専門家に聞いて。")
                 ], ipa: "/ˈɛkspɜːt/"),
            make("rookie", "a beginner; a newcomer",
                 "新人",
                 useCases: ["未経験者を表すとき"],
                 examples: [
                    ("A complete rookie.", "まったくの新人。"),
                    ("Rookie mistake.", "新人ミス。")
                 ], ipa: "/ɹˈʊkɪ/"),
            make("fool", "a silly or foolish person",
                 "馬鹿・愚か者",
                 useCases: ["愚かな行動を非難するとき"],
                 examples: [
                    ("Don't be a fool.", "馬鹿なまねするな。"),
                    ("What a fool.", "なんて馬鹿。")
                 ], ipa: "/fˈuːl/")
        ]
    }

    // MARK: - 感情・状態の名詞（追加 4・regret は既出）

    private static var emotionNouns12: [Word] {
        [
            make("guilt", "feeling of having done wrong",
                 "罪悪感",
                 useCases: ["後ろめたい気持ちを表すとき"],
                 examples: [
                    ("Feel guilt.", "罪悪感を感じる。"),
                    ("Heavy with guilt.", "罪悪感で重い。")
                 ], ipa: "/ɡˈɪlt/"),
            make("relief", "easing of distress",
                 "安堵",
                 useCases: ["心配が解消されたとき"],
                 examples: [
                    ("What a relief!", "ほっとした！"),
                    ("A sense of relief.", "安堵感。")
                 ], ipa: "/ɹɪlˈiːf/"),
            make("excitement", "a feeling of eager enthusiasm",
                 "興奮",
                 useCases: ["わくわく感を伝えるとき"],
                 examples: [
                    ("Full of excitement.", "興奮でいっぱい。"),
                    ("With excitement.", "ワクワクして。")
                 ], ipa: "/ɪksˈaɪtmənt/"),
            make("boredom", "the state of being bored",
                 "退屈",
                 useCases: ["何もすることがないとき"],
                 examples: [
                    ("Pure boredom.", "完全に退屈。"),
                    ("Out of boredom.", "退屈しのぎに。")
                 ], ipa: "/bˈɔːdəm/")
        ]
    }

    // MARK: - 物事・状況の名詞（追加 8・hassle, bother は既出）

    private static var situationNouns12: [Word] {
        [
            make("mess", "a dirty or untidy state; chaos",
                 "ぐちゃぐちゃ・混乱",
                 useCases: ["散らかった状況や混乱を表すとき"],
                 examples: [
                    ("What a mess!", "ひどい状態！"),
                    ("Clean up the mess.", "散らかりを片付けて。")
                 ], ipa: "/mˈɛs/"),
            make("fuss", "excessive commotion or excitement",
                 "大騒ぎ",
                 useCases: ["些細なことで騒ぐ場面"],
                 examples: [
                    ("Don't make a fuss.", "騒がないで。"),
                    ("What's all the fuss?", "何の騒ぎ？")
                 ], ipa: "/fˈʌs/"),
            make("drama", "exaggerated trouble or commotion",
                 "もめごと・大げさな騒ぎ",
                 useCases: ["人間関係の揉め事を語るとき"],
                 examples: [
                    ("Too much drama.", "騒ぎすぎ。"),
                    ("I hate drama.", "揉め事は嫌。")
                 ], ipa: "/dɹˈɑːmɐ/"),
            make("headache", "a troublesome problem",
                 "頭痛・頭の痛い問題",
                 useCases: ["厄介な問題を表すとき"],
                 examples: [
                    ("That's a headache.", "頭の痛い話だ。"),
                    ("A real headache.", "本当に厄介。")
                 ], ipa: "/hˈɛdeɪk/"),
            make("nightmare", "a very bad experience",
                 "悪夢・最悪な経験",
                 useCases: ["最悪の体験を語るとき"],
                 examples: [
                    ("It was a nightmare.", "最悪だった。"),
                    ("A logistical nightmare.", "ロジ面で悪夢。")
                 ], ipa: "/nˈaɪtmeə/"),
            make("pain", "something annoying; distress",
                 "苦痛・面倒",
                 useCases: ["厄介な人や物事に対して"],
                 examples: [
                    ("Such a pain.", "マジで面倒。"),
                    ("He's a pain.", "彼って面倒。")
                 ], ipa: "/pˈeɪn/"),
            make("trick", "a clever method or technique",
                 "手品・コツ",
                 useCases: ["うまくやるコツを伝えるとき"],
                 examples: [
                    ("The trick is to relax.", "コツはリラックス。"),
                    ("Learn the trick.", "コツを覚える。")
                 ], ipa: "/tɹˈɪk/"),
            make("point", "the main idea or purpose",
                 "要点・意義",
                 useCases: ["話の要点や意味を問うとき"],
                 examples: [
                    ("What's the point?", "何の意味？"),
                    ("Get to the point.", "要点を言って。")
                 ], ipa: "/pˈɔɪnt/")
        ]
    }

    // MARK: - 対応・反応の動詞（追加 9・dodge は既出）

    private static var reactionVerbs12: [Word] {
        [
            make("react", "respond to a stimulus",
                 "反応する",
                 useCases: ["相手の反応を尋ねるとき"],
                 examples: [
                    ("How did he react?", "どう反応した？"),
                    ("She reacted calmly.", "彼女は冷静に反応した。")
                 ], ipa: "/ɹɪˈækt/"),
            make("respond", "reply or react",
                 "応える",
                 useCases: ["返答や反応をするとき"],
                 examples: [
                    ("Respond quickly.", "すぐに応える。"),
                    ("He didn't respond.", "返事しなかった。")
                 ], ipa: "/ɹɪspˈɒnd/"),
            make("freeze", "become motionless from shock",
                 "凍る・固まる",
                 useCases: ["驚きで動けなくなったとき"],
                 examples: [
                    ("I froze in shock.", "ショックで固まった。"),
                    ("Freeze!", "動くな！")
                 ], ipa: "/fɹˈiːz/"),
            make("panic", "feel sudden uncontrollable fear",
                 "慌てる",
                 useCases: ["焦らないよう声を掛けるとき"],
                 examples: [
                    ("Don't panic!", "慌てないで！"),
                    ("She panicked.", "彼女は慌てた。")
                 ], ipa: "/pˈænɪk/"),
            make("flinch", "make a quick involuntary movement",
                 "びくっとする",
                 useCases: ["驚いて身を縮めるとき"],
                 examples: [
                    ("I flinched.", "びくっとした。"),
                    ("He didn't flinch.", "彼はびくともしなかった。")
                 ], ipa: "/flˈɪntʃ/"),
            make("brace", "prepare for something difficult",
                 "身構える",
                 useCases: ["心の準備をするとき"],
                 examples: [
                    ("Brace yourself.", "覚悟して。"),
                    ("Brace for impact.", "衝撃に備えて。")
                 ], ipa: "/bɹˈeɪs/"),
            make("endure", "bear hardship patiently",
                 "耐える",
                 useCases: ["苦痛や困難に耐えるとき"],
                 examples: [
                    ("Endure the pain.", "痛みに耐える。"),
                    ("Hard to endure.", "耐え難い。")
                 ], ipa: "/ɛndjˈɔː/"),
            make("resist", "withstand or oppose",
                 "抵抗する",
                 useCases: ["誘惑や圧力に逆らうとき"],
                 examples: [
                    ("Hard to resist.", "我慢しにくい。"),
                    ("Resist the urge.", "衝動に抗う。")
                 ], ipa: "/ɹɪzˈɪst/"),
            make("yield", "give way; submit",
                 "譲る・屈する",
                 useCases: ["圧力に屈する、道を譲るとき"],
                 examples: [
                    ("Yield to pressure.", "プレッシャーに屈する。"),
                    ("Yield the right of way.", "道を譲る。")
                 ], ipa: "/jˈiːld/")
        ]
    }

    // MARK: - 変化・進化の動詞（追加 9・adjust は既出）

    private static var changeVerbs12: [Word] {
        [
            make("adapt", "adjust to new conditions",
                 "適応する",
                 useCases: ["環境変化に対応するとき"],
                 examples: [
                    ("Adapt quickly.", "すぐ適応する。"),
                    ("Adapt to change.", "変化に適応。")
                 ], ipa: "/ɐdˈæpt/"),
            make("shift", "move; change position or focus",
                 "移す・変える",
                 useCases: ["焦点や立場を変えるとき"],
                 examples: [
                    ("Shift focus.", "焦点を移す。"),
                    ("Shift gears.", "ギアを変える。")
                 ], ipa: "/ʃˈɪft/"),
            make("transform", "change form completely",
                 "変身する・大きく変わる",
                 useCases: ["劇的な変化を表すとき"],
                 examples: [
                    ("Transform overnight.", "一夜にして変わる。"),
                    ("Transformed by experience.", "経験で変わった。")
                 ], ipa: "/tɹænsfˈɔːm/"),
            make("evolve", "develop gradually",
                 "進化する",
                 useCases: ["徐々に発展していく様を表すとき"],
                 examples: [
                    ("The plan evolved.", "計画は進化した。"),
                    ("Tastes evolve.", "好みは変わる。")
                 ], ipa: "/ɪvˈɒlv/"),
            make("switch", "change from one to another",
                 "切り替える",
                 useCases: ["別のものに替えるとき"],
                 examples: [
                    ("Switch jobs.", "仕事を変える。"),
                    ("Switch off.", "電源を切る。")
                 ], ipa: "/swˈɪtʃ/"),
            make("convert", "change in form or function",
                 "変換する・改宗する",
                 useCases: ["数値や信仰などを切り替えるとき"],
                 examples: [
                    ("Convert dollars to yen.", "ドルを円に。"),
                    ("Convert the file.", "ファイルを変換。")
                 ], ipa: "/kənvˈɜːt/"),
            make("swap", "exchange one thing for another",
                 "交換する",
                 useCases: ["物や場所を交換するとき"],
                 examples: [
                    ("Let's swap seats.", "席を交換しよう。"),
                    ("Swap stories.", "話を交換する。")
                 ], ipa: "/swˈɒp/"),
            make("trade", "exchange; engage in commerce",
                 "交換する・取引する",
                 useCases: ["物の取引や交換をするとき"],
                 examples: [
                    ("Trade cards.", "カードを交換。"),
                    ("Trade stocks.", "株を取引。")
                 ], ipa: "/tɹˈeɪd/"),
            make("alter", "make different; modify",
                 "変える・改める",
                 useCases: ["服や計画を変更するとき"],
                 examples: [
                    ("Alter the dress.", "服を直す。"),
                    ("Alter the plan.", "計画を変更。")
                 ], ipa: "/ˈɒltɐ/")
        ]
    }

    // MARK: - 楽しむ・経験の動詞（追加 5）

    private static var enjoyVerbs12: [Word] {
        [
            make("enjoy", "take pleasure in",
                 "楽しむ",
                 useCases: ["相手に楽しんで欲しいとき"],
                 examples: [
                    ("Enjoy yourself!", "楽しんで！"),
                    ("Enjoy the meal.", "食事を楽しんで。")
                 ], ipa: "/ɪndʒˈɔɪ/"),
            make("savor", "taste and enjoy fully",
                 "味わう",
                 useCases: ["じっくり味わうことを表すとき"],
                 examples: [
                    ("Savor every bite.", "一口ずつ味わう。"),
                    ("Savor the moment.", "瞬間を味わう。")
                 ], ipa: "/sˈeɪvɐ/"),
            make("cherish", "hold dear; treasure",
                 "大切にする",
                 useCases: ["思い出や人を大切にするとき"],
                 examples: [
                    ("Cherish memories.", "思い出を大切に。"),
                    ("Cherish your family.", "家族を大切に。")
                 ], ipa: "/tʃˈɛɹɪʃ/"),
            make("embrace", "accept willingly; hug",
                 "受け入れる・抱きしめる",
                 useCases: ["変化や考えを受け入れるとき"],
                 examples: [
                    ("Embrace change.", "変化を受け入れる。"),
                    ("Embrace the challenge.", "挑戦を受け入れる。")
                 ], ipa: "/ɪmbɹˈeɪs/"),
            make("explore", "investigate; travel through",
                 "探検する・探る",
                 useCases: ["選択肢や場所を探るとき"],
                 examples: [
                    ("Explore options.", "選択肢を探る。"),
                    ("Explore the city.", "街を探検する。")
                 ], ipa: "/ɪksplˈɔː/")
        ]
    }

    // MARK: - 破壊・問題の動詞（追加 4・wreck は既出）

    private static var destructionVerbs12: [Word] {
        [
            make("break", "cause to come apart; violate",
                 "壊す・破る",
                 useCases: ["物を壊す、ルールを破るとき"],
                 examples: [
                    ("Break the rules.", "ルールを破る。"),
                    ("Don't break it.", "壊さないで。")
                 ], ipa: "/bɹˈeɪk/"),
            make("damage", "cause harm to",
                 "ダメージを与える",
                 useCases: ["損傷や悪影響を伝えるとき"],
                 examples: [
                    ("Damaged beyond repair.", "修復不能。"),
                    ("It damaged the wall.", "壁を傷つけた。")
                 ], ipa: "/dˈæmɪdʒ/"),
            make("ruin", "spoil completely",
                 "台無しにする",
                 useCases: ["楽しみを台無しにするとき"],
                 examples: [
                    ("Ruin the day.", "一日を台無し。"),
                    ("Don't ruin it.", "台無しにしないで。")
                 ], ipa: "/ɹˈuːɪn/"),
            make("destroy", "put an end to; demolish",
                 "破壊する",
                 useCases: ["物理的・抽象的に破壊するとき"],
                 examples: [
                    ("Destroy the evidence.", "証拠を破壊。"),
                    ("Destroyed by fire.", "火で焼失。")
                 ], ipa: "/dɪstɹˈɔɪ/")
        ]
    }

    // MARK: - 協力・支援の動詞（追加 5）

    private static var supportVerbs12: [Word] {
        [
            make("assist", "help; give support",
                 "助ける・補助する",
                 useCases: ["業務上の支援をするとき"],
                 examples: [
                    ("Assist the team.", "チームを支援。"),
                    ("Can I assist you?", "お手伝いしましょうか？")
                 ], ipa: "/ɐsˈɪst/"),
            make("support", "give backing to",
                 "支える",
                 useCases: ["精神的・経済的に支えるとき"],
                 examples: [
                    ("Support each other.", "助け合う。"),
                    ("I support you.", "応援してる。")
                 ], ipa: "/səpˈɔːt/"),
            make("aid", "provide assistance",
                 "援助する",
                 useCases: ["人道支援などを表すとき"],
                 examples: [
                    ("Aid the victims.", "被害者を支援。"),
                    ("Foreign aid.", "海外援助。")
                 ], ipa: "/ˈeɪd/"),
            make("defend", "protect from attack; argue for",
                 "守る・擁護する",
                 useCases: ["守るまたは弁護するとき"],
                 examples: [
                    ("Defend yourself.", "自分を守って。"),
                    ("Defend the title.", "タイトルを守る。")
                 ], ipa: "/dɪfˈɛnd/"),
            make("protect", "keep safe from harm",
                 "守る",
                 useCases: ["危険から守るとき"],
                 examples: [
                    ("Protect the environment.", "環境を守る。"),
                    ("Protect your eyes.", "目を守って。")
                 ], ipa: "/pɹətˈɛkt/")
        ]
    }

    // MARK: - 気持ち・感想を伝えるフレーズ（追加 10）

    private static var feelingPhrases12: [Word] {
        [
            make("my heart goes out to", "I deeply sympathize with",
                 "心から同情する",
                 useCases: ["悲しみに寄り添うとき"],
                 examples: [
                    ("My heart goes out to you.", "心からお悔やみ申し上げます。"),
                    ("My heart goes out to the family.", "ご家族に心から同情。")
                 ], ipa: "/maɪ hˈɑːt ɡəʊz ˈaʊt tuː/"),
            make("it breaks my heart", "it makes me very sad",
                 "胸が痛む",
                 useCases: ["辛い場面に立ち会ったとき"],
                 examples: [
                    ("It breaks my heart to see this.", "見ていて辛い。"),
                    ("It breaks my heart to say no.", "断るのが辛い。")
                 ], ipa: "/ɪt bɹˈeɪks maɪ hˈɑːt/"),
            make("it warms my heart", "it makes me feel happy and touched",
                 "心が温まる",
                 useCases: ["心温まる出来事に対して"],
                 examples: [
                    ("It warms my heart to hear that.", "聞いて温かくなる。"),
                    ("It warms my heart.", "心が温まる。")
                 ], ipa: "/ɪt wˈɔːmz maɪ hˈɑːt/"),
            make("it blew my mind", "it astonished me",
                 "衝撃を受けた",
                 useCases: ["強い驚きを表すとき"],
                 examples: [
                    ("It blew my mind!", "衝撃だった！"),
                    ("That movie blew my mind.", "あの映画は衝撃。")
                 ], ipa: "/ɪt blˈuː maɪ mˈaɪnd/"),
            make("it cracks me up", "it makes me laugh hard",
                 "大笑いさせる",
                 useCases: ["大ウケしたとき"],
                 examples: [
                    ("That cracks me up.", "笑える。"),
                    ("He cracks me up.", "彼マジ笑わせる。")
                 ], ipa: "/ɪt kɹˈæks mˌiː ˈʌp/"),
            make("it drives me up the wall", "it irritates me intensely",
                 "めっちゃイライラする",
                 useCases: ["強い苛立ちを表すとき"],
                 examples: [
                    ("It drives me up the wall.", "めっちゃイライラ。"),
                    ("That noise drives me up the wall.", "あの音マジ無理。")
                 ], ipa: "/ɪt dɹˈaɪvz mˌiː ˌʌp ðə wˈɔːl/"),
            make("it tickles me pink", "it delights me greatly",
                 "めっちゃ嬉しい",
                 useCases: ["大喜びを表すとき"],
                 examples: [
                    ("It tickled me pink.", "大喜びだった。"),
                    ("That tickles me pink.", "めっちゃ嬉しい。")
                 ], ipa: "/ɪt tˈɪkəlz mˌiː pˈɪŋk/"),
            make("I can't get over it", "I can't stop thinking about it",
                 "信じられない・忘れられない",
                 useCases: ["強い驚きが残るとき"],
                 examples: [
                    ("I can't get over it.", "信じられない。"),
                    ("I still can't get over it.", "まだ忘れられない。")
                 ], ipa: "/aɪ kˈɑːnt ɡɛt ˈəʊvɐɹ ɪt/"),
            make("it rings a bell", "it sounds vaguely familiar",
                 "心当たりがある",
                 useCases: ["うっすら覚えがあるとき"],
                 examples: [
                    ("The name rings a bell.", "名前に聞き覚え。"),
                    ("That rings a bell.", "聞き覚えある。")
                 ], ipa: "/ɪt ɹˈɪŋz ɐ bˈɛl/"),
            make("it hits home", "it deeply affects me personally",
                 "心に響く・身にしみる",
                 useCases: ["自分事として響いたとき"],
                 examples: [
                    ("That really hit home.", "本当に響いた。"),
                    ("Those words hit home.", "あの言葉、身にしみた。")
                 ], ipa: "/ɪt hˈɪts hˈəʊm/")
        ]
    }

    // MARK: - 決まり文句のフレーズ（追加 10）

    private static var sayingPhrases12: [Word] {
        [
            make("the calm before the storm", "a quiet period before trouble",
                 "嵐の前の静けさ",
                 useCases: ["騒ぎの直前の静けさを表すとき"],
                 examples: [
                    ("It's the calm before the storm.", "嵐の前の静けさ。"),
                    ("This is the calm before the storm.", "今は嵐の前。")
                 ], ipa: "/ðə kˈɑːm bɪfˌɔː ðə stˈɔːm/"),
            make("a perfect storm", "a rare combination of bad events",
                 "最悪の事態の重なり",
                 useCases: ["悪条件が重なった状況を表すとき"],
                 examples: [
                    ("A perfect storm of problems.", "問題が重なった。"),
                    ("It was a perfect storm.", "最悪の重なりだった。")
                 ], ipa: "/ɐ pˈɜːfɛkt stˈɔːm/"),
            make("a dark horse", "an unknown competitor with hidden ability",
                 "隠れた実力者",
                 useCases: ["予想外の有力者を表すとき"],
                 examples: [
                    ("He's a dark horse.", "彼は穴馬。"),
                    ("She turned out to be a dark horse.", "彼女が伏兵だった。")
                 ], ipa: "/ɐ dˈɑːk hˈɔːs/"),
            make("a wild card", "an unpredictable factor",
                 "予測できない要素",
                 useCases: ["読めない要素・人を表すとき"],
                 examples: [
                    ("He's the wild card.", "彼が予測不能要素。"),
                    ("Weather is a wild card.", "天気が読めない。")
                 ], ipa: "/ɐ wˈaɪld kˈɑːd/"),
            make("a backup plan", "a secondary plan",
                 "バックアップの計画",
                 useCases: ["予備案を持つよう促すとき"],
                 examples: [
                    ("Have a backup plan.", "予備の計画を持って。"),
                    ("We need a backup plan.", "バックアップが必要。")
                 ], ipa: "/ɐ bˈækʌp plˈæn/"),
            make("a game changer", "something that drastically alters things",
                 "状況を一変させるもの",
                 useCases: ["画期的な変化を伝えるとき"],
                 examples: [
                    ("This is a game changer.", "これは画期的。"),
                    ("AI is a game changer.", "AIはゲームチェンジャー。")
                 ], ipa: "/ɐ ɡˈeɪm tʃˈeɪndʒɐ/"),
            make("a no-show", "someone who fails to appear",
                 "約束をすっぽかす人",
                 useCases: ["来なかった人を話すとき"],
                 examples: [
                    ("He was a no-show.", "すっぽかされた。"),
                    ("Three no-shows today.", "今日3人来なかった。")
                 ], ipa: "/ɐ nˈəʊʃˈəʊ/"),
            make("a heads-up", "an advance warning",
                 "事前の知らせ",
                 useCases: ["前もって知らせてもらったお礼"],
                 examples: [
                    ("Thanks for the heads-up.", "知らせてくれてありがとう。"),
                    ("Just a heads-up.", "一応お知らせ。")
                 ], ipa: "/ɐ hˈɛdzˈʌp/"),
            make("a stretch", "an exaggeration; far-fetched",
                 "無理がある・大げさ",
                 useCases: ["論理に飛躍があるとき"],
                 examples: [
                    ("That's a stretch.", "それはちょっと無理。"),
                    ("Bit of a stretch.", "ちょっと無理ある。")
                 ], ipa: "/ɐ stɹˈɛtʃ/"),
            make("a long shot", "something with little chance of success",
                 "望み薄",
                 useCases: ["成功確率が低いことを表すとき"],
                 examples: [
                    ("It's a long shot.", "望み薄だ。"),
                    ("A long shot, but worth trying.", "望み薄だがやる価値はある。")
                 ], ipa: "/ɐ lˈɒŋ ʃˈɒt/")
        ]
    }

    // MARK: - 会話の流れを作るフレーズ（追加 10）

    private static var conversationFlow12: [Word] {
        [
            make("speaking of which", "on that topic",
                 "そういえば",
                 useCases: ["関連する話題に移るとき"],
                 examples: [
                    ("Speaking of which, where's John?", "そういえばジョンは？"),
                    ("Speaking of which, did you call?", "そういえば電話した？")
                 ], ipa: "/spˈiːkɪŋ ɒvwˈɪtʃ/"),
            make("now that you mention it", "thinking about what you said",
                 "言われてみれば",
                 useCases: ["相手の指摘で気付いたとき"],
                 examples: [
                    ("Now that you mention it, true.", "言われてみればそう。"),
                    ("Now that you mention it, I forgot.", "言われてみれば忘れてた。")
                 ], ipa: "/nˈaʊ ðæt juː mˈɛnʃən ɪt/"),
            make("that reminds me", "that makes me think of",
                 "それで思い出した",
                 useCases: ["話題から連想して思い出したとき"],
                 examples: [
                    ("That reminds me, I called.", "それで思い出した、電話したんだ。"),
                    ("That reminds me of something.", "それで思い出した。")
                 ], ipa: "/ðæt ɹɪmˈaɪndz mˌiː/"),
            make("as I was saying", "to continue what I was saying",
                 "さっき言ったように",
                 useCases: ["遮られた話を再開するとき"],
                 examples: [
                    ("As I was saying, no.", "さっきも言ったがノー。"),
                    ("As I was saying, we should leave.", "さっき言った通り出るべき。")
                 ], ipa: "/æz aɪ wɒz sˈeɪɪŋ/"),
            make("where was I", "where did I leave off",
                 "どこまで話したっけ？",
                 useCases: ["話を中断後再開するとき"],
                 examples: [
                    ("Anyway, where was I?", "どこまで話したっけ？"),
                    ("Sorry, where was I?", "ごめん、どこまで話したっけ？")
                 ], ipa: "/wˌeə wɒz ˈaɪ/"),
            make("long story short", "to summarize briefly",
                 "手短に言うと",
                 useCases: ["話を短くまとめて伝えるとき"],
                 examples: [
                    ("Long story short, we won.", "手短に言うと勝った。"),
                    ("Long story short, it failed.", "要するに失敗。")
                 ], ipa: "/lˈɒŋ stˈɔːɹɪ ʃˈɔːt/"),
            make("in any case", "regardless; anyway",
                 "いずれにしても",
                 useCases: ["結論を述べるとき"],
                 examples: [
                    ("In any case, thanks.", "いずれにせよ感謝。"),
                    ("In any case, we'll go.", "いずれにせよ行く。")
                 ], ipa: "/ɪn ˌɛnɪ kˈeɪs/"),
            make("at any rate", "anyway; in any event",
                 "とにかく",
                 useCases: ["話をまとめるとき"],
                 examples: [
                    ("At any rate, decided.", "とにかく決めた。"),
                    ("At any rate, let's start.", "とにかく始めよう。")
                 ], ipa: "/æt ˌɛnɪ ɹˈeɪt/"),
            make("for starters", "to begin with",
                 "まず手始めに",
                 useCases: ["列挙の最初を述べるとき"],
                 examples: [
                    ("For starters, hello.", "まずこんにちは。"),
                    ("For starters, it's expensive.", "まず高い。")
                 ], ipa: "/fɔː stˈɑːtəz/"),
            make("off the top of my head", "without careful thought",
                 "パッと思いつく",
                 useCases: ["即興で思い付きを言うとき"],
                 examples: [
                    ("Off the top of my head, three.", "パッと3つ思いつく。"),
                    ("Off the top of my head, no idea.", "パッとは分からない。")
                 ], ipa: "/ˈɒf ðə tˈɒp ɒv maɪ hˈɛd/")
        ]
    }

    // MARK: - 感情・心理(追加 7・guilt, relief, regret は既出)

    private static var emotionWords13: [Word] {
        [
            make("mood", "a state of mind or feeling",
                 "気分",
                 useCases: ["今の気持ちを表すとき"],
                 examples: [
                    ("I'm in a good mood.", "気分いいよ。"),
                    ("Not in the mood today.", "今日はそんな気分じゃない。")
                 ], ipa: "/mˈuːd/"),
            make("vibe", "a feeling or atmosphere",
                 "雰囲気・空気感",
                 useCases: ["場や人の雰囲気を表すとき"],
                 examples: [
                    ("Good vibes only.", "良い雰囲気だけで。"),
                    ("I get weird vibes from him.", "彼から変な空気を感じる。")
                 ], ipa: "/vˈaɪb/"),
            make("gut feeling", "an instinctive belief",
                 "直感・第六感",
                 useCases: ["理屈ではなく直感で判断するとき"],
                 examples: [
                    ("My gut feeling says no.", "直感的にダメ。"),
                    ("Trust your gut feeling.", "直感を信じて。")
                 ], ipa: "/ɡˈʌt fˈiːlɪŋ/"),
            make("crush", "an intense but brief infatuation",
                 "夢中・片思い",
                 useCases: ["誰かに一時的に夢中になっているとき"],
                 examples: [
                    ("I have a crush on her.", "彼女に夢中なんだ。"),
                    ("It's just a crush.", "ただの片思い。")
                 ], ipa: "/kɹˈʌʃ/"),
            make("burnout", "exhaustion from prolonged stress",
                 "燃え尽き症候群",
                 useCases: ["仕事や勉強で疲弊しきった状態を表すとき"],
                 examples: [
                    ("I'm close to burnout.", "燃え尽きそう。"),
                    ("Burnout is real.", "燃え尽きは本当にある。")
                 ], ipa: "/bˈɜːnaʊt/"),
            make("baggage", "emotional burdens from the past",
                 "心の重荷・過去の傷",
                 useCases: ["過去のトラウマや感情的負担を表すとき"],
                 examples: [
                    ("He has a lot of baggage.", "彼は心の重荷が多い。"),
                    ("Emotional baggage.", "心の傷。")
                 ], ipa: "/bˈæɡɪdʒ/"),
            make("closure", "a sense of resolution",
                 "気持ちの区切り",
                 useCases: ["終わったことに対する心の整理を表すとき"],
                 examples: [
                    ("I need closure.", "気持ちの区切りが欲しい。"),
                    ("She found closure.", "彼女は区切りをつけた。")
                 ], ipa: "/klˈəʊʒɐ/")
        ]
    }

    // MARK: - 会話・人間関係(追加 6・argument, drama, gossip(about), a heads-up は既出)

    private static var communicationWords13: [Word] {
        [
            make("small talk", "polite casual conversation",
                 "世間話",
                 useCases: ["挨拶程度の軽い会話を表すとき"],
                 examples: [
                    ("I hate small talk.", "世間話が苦手。"),
                    ("Just making small talk.", "世間話してるだけ。")
                 ], ipa: "/smˈɔːl tˈɔːk/"),
            make("favor", "a kind act done for someone",
                 "頼みごと・親切",
                 useCases: ["人に何かをお願いするとき"],
                 examples: [
                    ("Can I ask a favor?", "お願いしていい?"),
                    ("Do me a favor.", "頼みごと聞いて。")
                 ], ipa: "/fˈeɪvɐ/"),
            make("excuse", "an explanation for a fault",
                 "言い訳・口実",
                 useCases: ["失敗や遅刻の理由を述べるとき"],
                 examples: [
                    ("No more excuses.", "もう言い訳しないで。"),
                    ("That's a lame excuse.", "ひどい言い訳。")
                 ], ipa: "/ɪkskjˈuːs/"),
            make("apology", "an expression of regret",
                 "謝罪",
                 useCases: ["謝罪の言葉や行為を表すとき"],
                 examples: [
                    ("I owe you an apology.", "謝らないと。"),
                    ("Accept my apology.", "私の謝罪を受け入れて。")
                 ], ipa: "/ɐpˈɒlədʒɪ/"),
            make("compliment", "an expression of praise",
                 "褒め言葉",
                 useCases: ["相手を褒めるとき"],
                 examples: [
                    ("Thanks for the compliment.", "褒めてくれてありがとう。"),
                    ("Take it as a compliment.", "褒め言葉として受け取って。")
                 ], ipa: "/kˈɒmplɪmənt/"),
            make("misunderstanding", "a failure to understand correctly",
                 "誤解",
                 useCases: ["話が食い違ったとき"],
                 examples: [
                    ("It was a misunderstanding.", "誤解だった。"),
                    ("Clear up the misunderstanding.", "誤解を解こう。")
                 ], ipa: "/mɪsˌʌndəstˈændɪŋ/")
        ]
    }

    // MARK: - 仕事・お金(追加 7・deadline, shift, overtime は既出)

    private static var workWords13: [Word] {
        [
            make("raise", "an increase in salary",
                 "昇給",
                 useCases: ["給料アップを話題にするとき"],
                 examples: [
                    ("I got a raise!", "昇給した!"),
                    ("Asking for a raise.", "昇給を頼む。")
                 ], ipa: "/ɹˈeɪz/"),
            make("paycheck", "a check for an employee's wages",
                 "給料・給料の小切手",
                 useCases: ["給料日や手取りの話をするとき"],
                 examples: [
                    ("Live paycheck to paycheck.", "ギリギリの生活。"),
                    ("Got my paycheck today.", "今日給料日だった。")
                 ], ipa: "/pˈeɪtʃɛk/"),
            make("bonus", "an extra payment or perk",
                 "ボーナス・特典",
                 useCases: ["臨時収入や特典について話すとき"],
                 examples: [
                    ("Year-end bonus.", "年末ボーナス。"),
                    ("That's a nice bonus.", "それは嬉しい特典。")
                 ], ipa: "/bˈəʊnəs/"),
            make("interview", "a formal meeting for evaluation",
                 "面接",
                 useCases: ["仕事や入学の面接について話すとき"],
                 examples: [
                    ("Job interview tomorrow.", "明日面接。"),
                    ("Nail the interview.", "面接決めて。")
                 ], ipa: "/ˈɪntəvjˌuː/"),
            make("resume", "a summary of one's work history",
                 "履歴書",
                 useCases: ["就職活動の書類について話すとき"],
                 examples: [
                    ("Send your resume.", "履歴書を送って。"),
                    ("Update my resume.", "履歴書を更新する。")
                 ], ipa: "/ɹɪzjˈuːm/"),
            make("promotion", "advancement in rank",
                 "昇進",
                 useCases: ["仕事上の出世について話すとき"],
                 examples: [
                    ("Got a promotion.", "昇進した。"),
                    ("In line for promotion.", "昇進候補。")
                 ], ipa: "/pɹəmˈəʊʃən/"),
            make("budget", "an amount of money planned",
                 "予算",
                 useCases: ["お金の使い道を計画するとき"],
                 examples: [
                    ("On a tight budget.", "予算がきつい。"),
                    ("Stay within budget.", "予算内に収める。")
                 ], ipa: "/bˈʌdʒɪt/")
        ]
    }

    // MARK: - 日常生活(追加 4・errand, chore, routine, leftovers, commute, appointment は既出)

    private static var dailyWords13: [Word] {
        [
            make("checkup", "a routine medical examination",
                 "健康診断",
                 useCases: ["定期検診について話すとき"],
                 examples: [
                    ("Annual checkup.", "年に一度の検診。"),
                    ("Time for a checkup.", "検診の時期だ。")
                 ], ipa: "/tʃˈɛkʌp/"),
            make("groceries", "food and household supplies",
                 "食料品",
                 useCases: ["スーパーで買う日用品を表すとき"],
                 examples: [
                    ("Going to buy groceries.", "食料品買いに行く。"),
                    ("Carry the groceries.", "食料品運んで。")
                 ], ipa: "/ɡɹˈəʊsəɹɪz/"),
            make("rent", "regular payment for a place to live",
                 "家賃",
                 useCases: ["家賃の話をするとき"],
                 examples: [
                    ("Pay the rent.", "家賃を払う。"),
                    ("Rent is going up.", "家賃が上がる。")
                 ], ipa: "/ɹˈɛnt/"),
            make("utilities", "essential household services",
                 "光熱費・公共料金",
                 useCases: ["電気・ガス・水道代を話題にするとき"],
                 examples: [
                    ("Utilities are expensive.", "光熱費が高い。"),
                    ("Rent includes utilities.", "家賃に光熱費込み。")
                 ], ipa: "/juːtˈɪlɪtɪz/")
        ]
    }

    // MARK: - 問題・トラブル(追加 6・mess, hassle, nightmare, emergency は既出)

    private static var troubleWords13: [Word] {
        [
            make("issue", "a problem or matter of concern",
                 "問題・課題",
                 useCases: ["問題点を提起するとき"],
                 examples: [
                    ("There's an issue with the app.", "アプリに問題がある。"),
                    ("That's a big issue.", "それは大きな問題。")
                 ], ipa: "/ˈɪʃuː/"),
            make("trouble", "difficulty or problems",
                 "面倒・トラブル",
                 useCases: ["厄介な状況を表すとき"],
                 examples: [
                    ("In big trouble.", "大ピンチ。"),
                    ("Save you the trouble.", "面倒を省くため。")
                 ], ipa: "/tɹˈʌbəl/"),
            make("disaster", "a complete failure or calamity",
                 "大失敗・大惨事",
                 useCases: ["最悪の結果や災難について話すとき"],
                 examples: [
                    ("It was a total disaster.", "完全な大失敗。"),
                    ("Disaster waiting to happen.", "災難が起きそう。")
                 ], ipa: "/dɪzˈɑːstɐ/"),
            make("setback", "a reversal or check in progress",
                 "後退・つまずき",
                 useCases: ["計画や進捗が妨げられたとき"],
                 examples: [
                    ("A minor setback.", "ちょっとした後退。"),
                    ("Recover from a setback.", "つまずきから立ち直る。")
                 ], ipa: "/sˈɛtbæk/"),
            make("red flag", "a warning sign",
                 "危険信号",
                 useCases: ["問題の兆候や警戒すべきサインを表すとき"],
                 examples: [
                    ("That's a red flag.", "それは危険信号。"),
                    ("Red flags everywhere.", "あちこちに危険信号。")
                 ], ipa: "/ɹˈɛd flˈæɡ/"),
            make("dealbreaker", "an issue that ends a negotiation or relationship",
                 "致命的な条件・決定打",
                 useCases: ["交渉や関係を終わらせる決定的な要素を話すとき"],
                 examples: [
                    ("That's a dealbreaker.", "それは決定打。"),
                    ("Lateness is a dealbreaker.", "遅刻は致命的。")
                 ], ipa: "/dˈiːlbɹeɪkɐ/")
        ]
    }

    // MARK: - 評価・判断(追加 6・point, priority は既出)

    private static var evaluationWords13: [Word] {
        [
            make("deal", "a transaction or bargain",
                 "取引・お買い得",
                 useCases: ["商談やお得な買い物について話すとき"],
                 examples: [
                    ("What a great deal!", "すごくお得!"),
                    ("It's a deal.", "決まり。")
                 ], ipa: "/dˈiːl/"),
            make("perk", "an extra benefit or advantage",
                 "特典・福利厚生",
                 useCases: ["仕事や会員サービスの特典を話すとき"],
                 examples: [
                    ("Job perks are great.", "仕事の特典がいい。"),
                    ("That's a nice perk.", "それは嬉しい特典。")
                 ], ipa: "/pˈɜːk/"),
            make("downside", "a disadvantage or drawback",
                 "欠点・マイナス面",
                 useCases: ["物事の悪い面を述べるとき"],
                 examples: [
                    ("The only downside is the price.", "唯一の欠点は値段。"),
                    ("Every job has downsides.", "どんな仕事にも欠点がある。")
                 ], ipa: "/dˈaʊnsaɪd/"),
            make("upside", "an advantage or positive aspect",
                 "利点・プラス面",
                 useCases: ["物事の良い面を述べるとき"],
                 examples: [
                    ("The upside is the flexibility.", "利点は柔軟さ。"),
                    ("Look on the upside.", "良い面を見て。")
                 ], ipa: "/ˈʌpsaɪd/"),
            make("option", "a choice or alternative",
                 "選択肢",
                 useCases: ["可能な選択を話すとき"],
                 examples: [
                    ("Weigh your options.", "選択肢を検討して。"),
                    ("Not an option.", "選択肢にない。")
                 ], ipa: "/ˈɒpʃən/"),
            make("effort", "vigorous attempt or work",
                 "努力",
                 useCases: ["頑張りや手間について話すとき"],
                 examples: [
                    ("Put in the effort.", "努力する。"),
                    ("Worth the effort.", "努力する価値あり。")
                 ], ipa: "/ˈɛfət/")
        ]
    }

    // MARK: - 口語のリアクション・つなぎ(追加 4・no way, my bad, fair enough, long story short, to be fair, for what it's worth は既出)

    private static var casualWords13: [Word] {
        [
            make("good point", "an insightful observation",
                 "いい指摘",
                 useCases: ["相手の意見に納得して同意するとき"],
                 examples: [
                    ("Good point.", "いい指摘。"),
                    ("That's a good point.", "それいい視点だ。")
                 ], ipa: "/ɡˈʊd pˈɔɪnt/"),
            make("no offense", "without intending to insult",
                 "悪気はないけど",
                 useCases: ["失礼な発言の前に断りを入れるとき"],
                 examples: [
                    ("No offense, but ~", "悪気はないけど〜"),
                    ("None taken.", "気にしてないよ。")
                 ], ipa: "/nˈəʊ əfˈɛns/"),
            make("just saying", "merely stating an opinion",
                 "言ってみただけ",
                 useCases: ["主張をやわらげる時の捨て台詞"],
                 examples: [
                    ("Just saying.", "言ってみただけ。"),
                    ("I'm just saying, ~", "ただ言いたいのは〜")
                 ], ipa: "/dʒˈʌst sˈeɪɪŋ/"),
            make("don't get me wrong", "don't misunderstand",
                 "誤解しないで",
                 useCases: ["否定的なことを言う前に弁解するとき"],
                 examples: [
                    ("Don't get me wrong, I like him.", "誤解しないで、彼好きだよ。"),
                    ("Don't get me wrong, but ~", "誤解しないでほしいけど〜")
                 ], ipa: "/dˈəʊnt ɡɛt mˌiː ɹˈɒŋ/")
        ]
    }

    // MARK: - 道・性質・動作の混合(追加 9)

    private static var pathAndOthers14: [Word] {
        [
            make("simple", "easy to understand or do; plain",
                 "簡単な・単純な",
                 useCases: ["難しくないことを表すとき"],
                 examples: [
                    ("Keep it simple.", "シンプルに。"),
                    ("That's a simple question.", "簡単な質問だ。")
                 ], ipa: "/sˈɪmpəl/"),
            make("broken", "damaged and no longer working",
                 "壊れた・故障した",
                 useCases: ["物や心の状態が壊れていることを表すとき"],
                 examples: [
                    ("The phone is broken.", "電話が壊れてる。"),
                    ("Broken promises.", "破られた約束。")
                 ], ipa: "/bɹˈəʊkən/"),
            make("blur", "make unclear or indistinct",
                 "ぼかす・かすませる",
                 useCases: ["輪郭や境界をはっきりさせなくするとき"],
                 examples: [
                    ("Blur the background.", "背景をぼかす。"),
                    ("Tears blurred my vision.", "涙で視界がぼやけた。")
                 ], ipa: "/blˈɜː/"),
            make("path", "a way or track for walking",
                 "小道・進路",
                 useCases: ["歩く道や人生の進路を表すとき"],
                 examples: [
                    ("Follow the path.", "道に沿って進んで。"),
                    ("A different path in life.", "別の人生の道。")
                 ], ipa: "/pˈɑːθ/"),
            make("skypath", "an elevated pedestrian walkway",
                 "高架の歩道・スカイパス",
                 useCases: ["建物間を結ぶ高架の通路を表すとき"],
                 examples: [
                    ("Use the skypath to cross.", "スカイパスで渡って。"),
                    ("The skypath connects two buildings.", "スカイパスが二棟をつなぐ。")
                 ], ipa: "/skˈaɪpɑːθ/"),
            make("sidewalk", "a paved path for pedestrians beside a road",
                 "歩道",
                 useCases: ["車道の脇の歩く道を表すとき"],
                 examples: [
                    ("Walk on the sidewalk.", "歩道を歩いて。"),
                    ("Cracks in the sidewalk.", "歩道のひび。")
                 ], ipa: "/sˈaɪdwɔːk/"),
            make("footpath", "a narrow path for walking",
                 "小道・歩道",
                 useCases: ["公園や郊外などの細い歩道を表すとき"],
                 examples: [
                    ("A scenic footpath.", "景色のいい小道。"),
                    ("The footpath leads to the lake.", "小道は湖に通じる。")
                 ], ipa: "/fˈʊtpɑːθ/"),
            make("deserved", "earned because of one's actions",
                 "当然の・ふさわしい",
                 useCases: ["努力や行いに見合った結果を表すとき"],
                 examples: [
                    ("A well-deserved break.", "当然の休息。"),
                    ("Deserved recognition.", "ふさわしい評価。")
                 ], ipa: "/dɪzˈɜːvd/"),
            make("pave", "cover a road or path with a hard surface",
                 "舗装する",
                 useCases: ["道路を整備するとき、または土台を作る比喩"],
                 examples: [
                    ("They paved the road.", "道路を舗装した。"),
                    ("Pave the way for change.", "変化への道を開く。")
                 ], ipa: "/pˈeɪv/")
        ]
    }

    // MARK: - 人物関係(追加 6)

    private static var peopleWords15: [Word] {
        [
            make("sibling", "a brother or sister",
                 "きょうだい",
                 useCases: ["兄弟姉妹をまとめて表すとき"],
                 examples: [
                    ("Do you have siblings?", "兄弟いる?"),
                    ("My younger sibling.", "下のきょうだい。")
                 ], ipa: "/sˈɪblɪŋ/"),
            make("in-laws", "relatives by marriage",
                 "義理の家族",
                 useCases: ["配偶者の家族について話すとき"],
                 examples: [
                    ("Meet my in-laws.", "義理の家族に会う。"),
                    ("Dinner with the in-laws.", "義理の家族と夕食。")
                 ], ipa: "/ɪnlˈɔːz/"),
            make("bff", "best friend forever",
                 "親友",
                 useCases: ["特別な親友を表すカジュアル略語"],
                 examples: [
                    ("She's my BFF.", "彼女は親友。"),
                    ("My BFF since high school.", "高校からの親友。")
                 ], ipa: "/bˌiːˌɛfˈɛf/"),
            make("frenemy", "a person who is both friend and rival",
                 "友達のような敵",
                 useCases: ["仲良くも対立もある複雑な関係を表すとき"],
                 examples: [
                    ("She's my frenemy.", "彼女は友敵。"),
                    ("Classic frenemy behavior.", "典型的な友敵的振る舞い。")
                 ], ipa: "/fɹˈɛnəmɪ/"),
            make("newbie", "a newcomer or beginner",
                 "新人・初心者",
                 useCases: ["初心者であることを軽く表すとき"],
                 examples: [
                    ("I'm a newbie here.", "ここでは新人。"),
                    ("Total newbie at coding.", "コードは完全初心者。")
                 ], ipa: "/njˈuːbɪ/"),
            make("local", "a person who lives in a particular area",
                 "地元の人",
                 useCases: ["観光客と対比して地元住民を表すとき"],
                 examples: [
                    ("Ask the locals.", "地元の人に聞いて。"),
                    ("This is a local spot.", "これは地元の店。")
                 ], ipa: "/lˈəʊkəl/")
        ]
    }

    // MARK: - 感情・心理(追加 6)

    private static var emotionWords15: [Word] {
        [
            make("grudge", "persistent resentment",
                 "恨み",
                 useCases: ["過去のことを根に持っていることを表すとき"],
                 examples: [
                    ("Hold a grudge.", "恨みを抱く。"),
                    ("Don't hold grudges.", "恨みを引きずらないで。")
                 ], ipa: "/ɡɹˈʌdʒ/"),
            make("comfort zone", "a place or situation where one feels secure",
                 "居心地のいい範囲",
                 useCases: ["挑戦と対比して安全圏を表すとき"],
                 examples: [
                    ("Step out of your comfort zone.", "コンフォートゾーンから出て。"),
                    ("Staying in my comfort zone.", "安全圏にとどまってる。")
                 ], ipa: "/kˈʌmfət zˈəʊn/"),
            make("peace of mind", "freedom from worry",
                 "心の安らぎ",
                 useCases: ["安心感を保証するとき"],
                 examples: [
                    ("For peace of mind.", "安心のため。"),
                    ("Brings me peace of mind.", "私を安心させる。")
                 ], ipa: "/pˈiːs ɒv mˈaɪnd/"),
            make("pet peeve", "a particular annoyance",
                 "特に気に障ること",
                 useCases: ["細かいけど自分には特に嫌なことを表すとき"],
                 examples: [
                    ("That's my pet peeve.", "それが私のツボにハマる嫌さ。"),
                    ("My biggest pet peeve.", "一番のイラポイント。")
                 ], ipa: "/pˈɛt pˈiːv/"),
            make("wake-up call", "an event that prompts reflection",
                 "目を覚まさせる出来事",
                 useCases: ["気付かせてくれる出来事を表すとき"],
                 examples: [
                    ("It was a wake-up call.", "目を覚まされた。"),
                    ("Took it as a wake-up call.", "戒めとして受け止めた。")
                 ], ipa: "/wˈeɪkˌʌp kˈɔːl/"),
            make("soft spot", "a fond feeling for something",
                 "弱み・好きなもの",
                 useCases: ["特定の人や物に弱いことを表すとき"],
                 examples: [
                    ("I have a soft spot for cats.", "猫には弱い。"),
                    ("She has a soft spot for him.", "彼女は彼に弱い。")
                 ], ipa: "/sˈɒft spˈɒt/")
        ]
    }

    // MARK: - 会話・人間関係(追加 6)

    private static var relationshipWords15: [Word] {
        [
            make("icebreaker", "something that eases initial tension",
                 "場を和ませるもの",
                 useCases: ["緊張をほぐすきっかけを表すとき"],
                 examples: [
                    ("A good icebreaker question.", "良いアイスブレイクの質問。"),
                    ("Use a joke as an icebreaker.", "冗談でアイスブレイク。")
                 ], ipa: "/ˈaɪsbɹeɪkɐ/"),
            make("inside joke", "a joke understood only by a particular group",
                 "内輪のジョーク",
                 useCases: ["仲間内だけで分かる冗談を表すとき"],
                 examples: [
                    ("It's an inside joke.", "内輪ネタなんだ。"),
                    ("We have lots of inside jokes.", "内輪ジョークがたくさん。")
                 ], ipa: "/ɪnsˈaɪd dʒˈəʊk/"),
            make("cold shoulder", "a deliberately unfriendly attitude",
                 "冷たい態度",
                 useCases: ["わざと無視するような対応を表すとき"],
                 examples: [
                    ("Give the cold shoulder.", "冷たい態度を取る。"),
                    ("Got the cold shoulder.", "冷たくあしらわれた。")
                 ], ipa: "/kˈəʊld ʃˈəʊldɐ/"),
            make("silent treatment", "ignoring someone deliberately",
                 "無視する態度",
                 useCases: ["怒って口をきかない態度を表すとき"],
                 examples: [
                    ("She's giving me the silent treatment.", "彼女に無視されてる。"),
                    ("Stop the silent treatment.", "無視するのやめて。")
                 ], ipa: "/sˈaɪlənt tɹˈiːtmənt/"),
            make("shoutout", "a public acknowledgment or greeting",
                 "言及・称賛",
                 useCases: ["特定の人を公の場で称えるとき"],
                 examples: [
                    ("Shoutout to my mom!", "母にシャウトアウト!"),
                    ("Big shoutout to the team.", "チームに大いに感謝。")
                 ], ipa: "/ʃˈaʊtaʊt/"),
            make("throwback", "something from the past brought up again",
                 "懐かしいもの・回想",
                 useCases: ["昔の写真や思い出を共有するとき"],
                 examples: [
                    ("Throwback Thursday.", "懐かしの木曜(SNS用語)。"),
                    ("What a throwback!", "懐かしい!")
                 ], ipa: "/θɹˈəʊbæk/")
        ]
    }

    // MARK: - 仕事・お金(追加 6・workload は既出)

    private static var workWords15: [Word] {
        [
            make("coworking", "shared workspace arrangement",
                 "コワーキング・共同作業",
                 useCases: ["共有オフィスや協働を表すとき"],
                 examples: [
                    ("A coworking space.", "コワーキングスペース。"),
                    ("I work at a coworking spot.", "コワーキングで働いてる。")
                 ], ipa: "/kˈaʊɜːkɪŋ/"),
            make("side hustle", "a secondary job for extra income",
                 "副業",
                 useCases: ["本業以外の収入源を表すとき"],
                 examples: [
                    ("My side hustle is freelancing.", "副業はフリーランス。"),
                    ("Start a side hustle.", "副業を始める。")
                 ], ipa: "/sˈaɪd hˈʌsəl/"),
            make("layoff", "dismissal from employment",
                 "解雇・人員削減",
                 useCases: ["会社都合での解雇を表すとき"],
                 examples: [
                    ("Mass layoffs.", "大量解雇。"),
                    ("Survived the layoff.", "解雇を免れた。")
                 ], ipa: "/lˈeɪɒf/"),
            make("perks", "benefits provided to employees",
                 "福利厚生・特典",
                 useCases: ["仕事の付加価値を話すとき"],
                 examples: [
                    ("Great perks at this job.", "ここは福利厚生がいい。"),
                    ("Free coffee is one of the perks.", "コーヒー無料は特典の一つ。")
                 ], ipa: "/pˈɜːks/"),
            make("red tape", "excessive bureaucratic procedures",
                 "お役所仕事・煩雑な手続き",
                 useCases: ["手続きの煩雑さに不満を述べるとき"],
                 examples: [
                    ("Too much red tape.", "手続きが多すぎる。"),
                    ("Cut through the red tape.", "面倒な手続きを省く。")
                 ], ipa: "/ɹˈɛd tˈeɪp/"),
            make("networking", "building professional connections",
                 "人脈作り",
                 useCases: ["仕事関連の人間関係を広げるとき"],
                 examples: [
                    ("Networking events.", "人脈作りのイベント。"),
                    ("Good at networking.", "人脈作りが得意。")
                 ], ipa: "/nˈɛtwɜːkɪŋ/")
        ]
    }

    // MARK: - 日常生活(追加 6)

    private static var dailyWords15: [Word] {
        [
            make("takeout", "food prepared to be eaten elsewhere",
                 "持ち帰り料理",
                 useCases: ["店から持ち帰る食事を表すとき"],
                 examples: [
                    ("Let's order takeout.", "テイクアウト頼もう。"),
                    ("Chinese takeout tonight.", "今夜は中華のテイクアウト。")
                 ], ipa: "/tˈeɪkaʊt/"),
            make("hangover", "the unpleasant after-effects of drinking",
                 "二日酔い",
                 useCases: ["飲み過ぎの翌日の体調を表すとき"],
                 examples: [
                    ("I have a hangover.", "二日酔いだ。"),
                    ("Bad hangover today.", "今日はひどい二日酔い。")
                 ], ipa: "/hˈæŋɡəʊvɐ/"),
            make("jet lag", "fatigue after long-distance travel",
                 "時差ぼけ",
                 useCases: ["長距離フライト後の疲れを表すとき"],
                 examples: [
                    ("Still have jet lag.", "まだ時差ぼけ。"),
                    ("Jet lag is killing me.", "時差ぼけがつらい。")
                 ], ipa: "/dʒˈɛt lˈæɡ/"),
            make("cabin fever", "irritability from being confined indoors",
                 "引きこもりによる退屈・イライラ",
                 useCases: ["長く家にいて落ち着かない状態を表すとき"],
                 examples: [
                    ("Getting cabin fever.", "引きこもりでイライラ。"),
                    ("Cabin fever is setting in.", "閉じ込められたストレスがきた。")
                 ], ipa: "/kˈæbɪn fˈiːvɐ/"),
            make("spring cleaning", "thorough cleaning of a home",
                 "大掃除",
                 useCases: ["家を徹底的に掃除する作業を表すとき"],
                 examples: [
                    ("Time for spring cleaning.", "大掃除の時期。"),
                    ("Spring cleaning the closet.", "クローゼットを大掃除。")
                 ], ipa: "/spɹˈɪŋ klˈiːnɪŋ/"),
            make("lifesaver", "something or someone extremely helpful",
                 "救いの神・とても助かるもの",
                 useCases: ["困っているところを助けてくれた人や物を表すとき"],
                 examples: [
                    ("You're a lifesaver!", "命の恩人!"),
                    ("This app is a lifesaver.", "このアプリ救世主。")
                 ], ipa: "/lˈaɪfseɪvɐ/")
        ]
    }

    // MARK: - 問題・トラブル(追加 5・loophole は既出)

    private static var troubleWords15: [Word] {
        [
            make("glitch", "a minor malfunction or error",
                 "不具合・故障",
                 useCases: ["技術的な小トラブルを表すとき"],
                 examples: [
                    ("A small glitch.", "ちょっとした不具合。"),
                    ("System glitch.", "システムの不具合。")
                 ], ipa: "/ɡlˈɪtʃ/"),
            make("mishap", "an unlucky accident",
                 "ちょっとした事故・不運",
                 useCases: ["些細なトラブルを表すとき"],
                 examples: [
                    ("A minor mishap.", "ちょっとしたトラブル。"),
                    ("Despite a few mishaps.", "いくつかの不運にもかかわらず。")
                 ], ipa: "/mˈɪshæp/"),
            make("blind spot", "an area where vision or judgment is limited",
                 "死角・見落とし",
                 useCases: ["気づきにくい弱点や見えない部分を表すとき"],
                 examples: [
                    ("That's my blind spot.", "そこが私の死角。"),
                    ("Check your blind spot.", "死角を確認して。")
                 ], ipa: "/blˈaɪnd spˈɒt/"),
            make("ripple effect", "a spreading consequence",
                 "波及効果",
                 useCases: ["一つの出来事が広く影響を及ぼすとき"],
                 examples: [
                    ("A ripple effect on the market.", "市場への波及効果。"),
                    ("Created a ripple effect.", "波及効果を生んだ。")
                 ], ipa: "/ɹˈɪpəl ɪfˈɛkt/"),
            make("last straw", "the final cause of frustration",
                 "我慢の限界",
                 useCases: ["最後の決定打となった出来事を表すとき"],
                 examples: [
                    ("That was the last straw.", "それが限界だった。"),
                    ("The last straw for me.", "私にとっての最後の一押し。")
                 ], ipa: "/lˈɑːst stɹˈɔː/")
        ]
    }

    // MARK: - 評価・判断(追加 4・game changer, gist は既出)

    private static var evaluationWords15: [Word] {
        [
            make("no-brainer", "a decision requiring little thought",
                 "考えるまでもないこと",
                 useCases: ["明らかな選択を表すとき"],
                 examples: [
                    ("It's a no-brainer.", "迷うまでもない。"),
                    ("Saying yes was a no-brainer.", "イエスは即決。")
                 ], ipa: "/nˈəʊbɹˈeɪnɐ/"),
            make("trade-off", "a balance between competing factors",
                 "一長一短・引き換え",
                 useCases: ["何かを得るために何かを犠牲にする状況を表すとき"],
                 examples: [
                    ("A classic trade-off.", "典型的なトレードオフ。"),
                    ("Time-money trade-off.", "時間と金のトレードオフ。")
                 ], ipa: "/tɹˈeɪdˈɒf/"),
            make("bottom line", "the essential point",
                 "結論・肝心な点",
                 useCases: ["話の核心や最終的な結論を述べるとき"],
                 examples: [
                    ("The bottom line is, we need more time.", "結論として、時間が必要だ。"),
                    ("What's the bottom line?", "結論は?")
                 ], ipa: "/bˈɒtəm lˈaɪn/"),
            make("ballpark", "an approximate range or figure",
                 "おおよその数字",
                 useCases: ["大体の見積もりを話すとき"],
                 examples: [
                    ("Give me a ballpark figure.", "おおよその数字をちょうだい。"),
                    ("In the right ballpark.", "ほぼ合ってる範囲。")
                 ], ipa: "/bˈɔːlpɑːk/")
        ]
    }

    // MARK: - 状況・出来事(追加 6・milestone は既出)

    private static var situationWords15: [Word] {
        [
            make("turning point", "a moment of significant change",
                 "転換点",
                 useCases: ["人生や歴史の節目を表すとき"],
                 examples: [
                    ("A turning point in my life.", "人生の転換点。"),
                    ("This is the turning point.", "ここが転換点。")
                 ], ipa: "/tˈɜːnɪŋ pˈɔɪnt/"),
            make("close call", "a narrow escape from danger",
                 "危機一髪",
                 useCases: ["危険を辛うじて回避したとき"],
                 examples: [
                    ("That was a close call!", "あぶなかった!"),
                    ("Too close a call.", "ぎりぎりすぎた。")
                 ], ipa: "/klˈəʊs kˈɔːl/"),
            make("fresh start", "a new beginning",
                 "新たな出発",
                 useCases: ["心機一転して新しく始めるとき"],
                 examples: [
                    ("Time for a fresh start.", "心機一転の時。"),
                    ("Need a fresh start.", "新たな出発が必要。")
                 ], ipa: "/fɹˈɛʃ stˈɑːt/"),
            make("blessing in disguise", "an apparent misfortune that turns out for the best",
                 "災い転じて福となす",
                 useCases: ["悪く見えた出来事が結果的に良かったとき"],
                 examples: [
                    ("It was a blessing in disguise.", "結果的には幸運だった。"),
                    ("Sometimes setbacks are blessings in disguise.", "後退も実は幸運のことがある。")
                 ], ipa: "/blˈɛsɪŋ ɪn dɪsɡˈaɪz/"),
            make("silver lining", "a positive aspect of a difficult situation",
                 "不幸中の幸い",
                 useCases: ["悪い状況の中の明るい面を見つけるとき"],
                 examples: [
                    ("Find the silver lining.", "明るい面を見つけて。"),
                    ("Every cloud has a silver lining.", "どんな暗雲にも光がある(諺)。")
                 ], ipa: "/sˈɪlvɐ lˈaɪnɪŋ/"),
            make("coincidence", "a remarkable concurrence of events",
                 "偶然",
                 useCases: ["驚くほどタイミングよく起きたことを表すとき"],
                 examples: [
                    ("What a coincidence!", "なんて偶然!"),
                    ("By coincidence.", "偶然にも。")
                 ], ipa: "/kəʊˈɪnsɪdəns/")
        ]
    }

    // MARK: - スラング/口語 行動 (追加 10)

    private static var slangActions16: [Word] {
        [
            make("hang out", "spend time casually",
                 "(友達と)遊ぶ・ぶらぶらする",
                 useCases: ["友達と気楽に過ごすとき"],
                 examples: [
                    ("Wanna hang out tonight?", "今夜遊ばない?"),
                    ("Let's hang out this weekend.", "週末ぶらぶらしよう。")
                 ], ipa: "/hˈæŋ ˈaʊt/"),
            make("hit me up", "contact me",
                 "連絡して",
                 useCases: ["カジュアルに連絡を促すとき(略 HMU)"],
                 examples: [
                    ("Hit me up later.", "あとで連絡してね。"),
                    ("Just HMU when you're free.", "暇な時連絡してね。")
                 ], ipa: "/hˈɪt mˌiː ˈʌp/"),
            make("ditch", "abandon plans or someone",
                 "ドタキャン・サボる",
                 useCases: ["予定や人を放棄するとき"],
                 examples: [
                    ("Don't ditch me!", "ドタキャンしないで!"),
                    ("Let's ditch class.", "授業サボろう。")
                 ], ipa: "/dˈɪtʃ/"),
            make("flake", "someone who flakes out on plans",
                 "ドタキャンする人",
                 useCases: ["約束をよく破る人を表すとき"],
                 examples: [
                    ("She's such a flake.", "彼女マジでドタキャン女王。"),
                    ("Don't be a flake.", "ドタキャンするなよ。")
                 ], ipa: "/flˈeɪk/"),
            make("muck up", "make a mess of",
                 "失敗する・めちゃくちゃにする",
                 useCases: ["やらかして台無しにしたとき(英国寄り)"],
                 examples: [
                    ("I mucked it up.", "やらかした。"),
                    ("Don't muck this up.", "失敗するな。")
                 ], ipa: "/mˈʌk ˈʌp/"),
            make("ghost", "cut off contact suddenly",
                 "音信不通になる・バックレる",
                 useCases: ["既読スルーや突然連絡を絶つこと"],
                 examples: [
                    ("He ghosted me.", "彼にバックれられた。"),
                    ("Don't ghost me!", "音信不通にしないで!")
                 ], ipa: "/ɡˈəʊst/"),
            make("dump", "end a romantic relationship",
                 "(恋人を)振る",
                 useCases: ["別れを切り出すとき"],
                 examples: [
                    ("She dumped him.", "彼女が彼を振った。"),
                    ("I got dumped.", "振られた。")
                 ], ipa: "/dˈʌmp/"),
            make("keep in touch", "stay in contact",
                 "連絡を取り合おう",
                 useCases: ["別れ際の挨拶として"],
                 examples: [
                    ("Let's keep in touch!", "連絡取り合おうね!"),
                    ("Keep in touch, OK?", "連絡してね?")
                 ], ipa: "/kˈiːp ɪn tˈʌtʃ/"),
            make("loop in", "include someone in communication",
                 "話の輪に入れる",
                 useCases: ["メールやチャットに人を加えるとき"],
                 examples: [
                    ("Loop me in.", "私も入れて。"),
                    ("I'll loop you in.", "話の輪に入れるね。")
                 ], ipa: "/lˈuːp ˈɪn/"),
            make("binge-watch", "watch many episodes in a row",
                 "(配信などを)一気見する",
                 useCases: ["シリーズドラマを連続で見るとき"],
                 examples: [
                    ("I binge-watched the whole season.", "1シーズン一気見した。"),
                    ("Perfect binge-watching weather.", "一気見日和。")
                 ], ipa: "/bˈɪndʒwˈɒtʃ/")
        ]
    }

    // MARK: - スラング/口語 感情・状態 (追加 10)

    private static var slangFeelings16: [Word] {
        [
            make("screwed", "in serious trouble",
                 "終わった・詰んだ",
                 useCases: ["困った状況を表すカジュアルな表現"],
                 examples: [
                    ("We're screwed.", "詰んだ。"),
                    ("I'm so screwed.", "マジで終わった。")
                 ], ipa: "/skɹˈuːd/"),
            make("pissed off", "very angry",
                 "めちゃくちゃ怒っている",
                 useCases: ["強い不満や怒りを表すとき"],
                 examples: [
                    ("I'm so pissed off.", "マジでムカつく。"),
                    ("That pissed me off.", "それイラっとした。")
                 ], ipa: "/pˈɪst ˈɒf/"),
            make("busted", "caught doing something wrong",
                 "バレた・見つかった",
                 useCases: ["悪事や秘密がバレたとき"],
                 examples: [
                    ("Busted!", "バレた!"),
                    ("We got busted.", "見つかっちゃった。")
                 ], ipa: "/bˈʌstɪd/"),
            make("cringe", "feel embarrassed for others",
                 "ドン引きする・痛々しい",
                 useCases: ["見ていて気まずくなるとき"],
                 examples: [
                    ("That's so cringe.", "それマジで痛い。"),
                    ("I cringed so hard.", "ドン引きした。")
                 ], ipa: "/kɹˈɪndʒ/"),
            make("craving", "a strong desire for food",
                 "無性に食べたい気持ち",
                 useCases: ["特定の食べ物が欲しくてたまらないとき"],
                 examples: [
                    ("I have a craving for ramen.", "ラーメン食べたい。"),
                    ("Pizza craving!", "ピザ食べたい!")
                 ], ipa: "/kɹˈeɪvɪŋ/"),
            make("hungover", "suffering from a hangover",
                 "二日酔いの",
                 useCases: ["昨夜の飲み過ぎで体調が悪いとき(形容詞)"],
                 examples: [
                    ("I'm so hungover.", "二日酔いがひどい。"),
                    ("Are you hungover?", "二日酔い?")
                 ], ipa: "/hʌŋɡˈəʊvɐ/"),
            make("black out", "lose consciousness or memory",
                 "(飲み過ぎで)記憶をなくす",
                 useCases: ["お酒や疲労で意識・記憶が飛ぶとき"],
                 examples: [
                    ("I blacked out last night.", "昨夜記憶ない。"),
                    ("Don't black out!", "気を失うな!")
                 ], ipa: "/blˈæk ˈaʊt/"),
            make("I'm dead", "find something hilarious",
                 "笑い死ぬ・面白すぎる",
                 useCases: ["大爆笑して動けない時の口語"],
                 examples: [
                    ("LOL, I'm dead!", "草、笑い死ぬ!"),
                    ("That's so funny, I'm dead.", "面白すぎ、死んだ。")
                 ], ipa: "/aɪm dˈɛd/"),
            make("hype", "intense excitement or buzz",
                 "期待・大騒ぎ",
                 useCases: ["盛り上がりや過剰な期待を表すとき"],
                 examples: [
                    ("Don't believe the hype.", "期待しすぎるな。"),
                    ("So much hype around it.", "盛り上がりがすごい。")
                 ], ipa: "/hˈaɪp/"),
            make("freaking", "darn (mild intensifier)",
                 "めちゃくちゃ(強調)",
                 useCases: ["カジュアルに強調する very の代わり"],
                 examples: [
                    ("That's freaking cool!", "マジでかっこいい!"),
                    ("It's freaking cold.", "めちゃ寒い。")
                 ], ipa: "/fɹˈiːkɪŋ/")
        ]
    }

    // MARK: - スラング/口語 称賛 (追加 10)

    private static var slangPraise16: [Word] {
        [
            make("props", "respect or credit",
                 "敬意・称賛",
                 useCases: ["相手の功績を認めるとき"],
                 examples: [
                    ("Props to you!", "お見事!"),
                    ("Big props for that.", "それは称賛物。")
                 ], ipa: "/pɹˈɒps/"),
            make("savage", "ruthlessly cool or brutal",
                 "容赦ない・尖ってる",
                 useCases: ["辛口な発言や行動に対する褒め言葉"],
                 examples: [
                    ("That comment was savage.", "そのコメント、容赦ない。"),
                    ("She's so savage!", "彼女マジで尖ってる!")
                 ], ipa: "/sˈævɪdʒ/"),
            make("epic", "amazing on a grand scale",
                 "最高・ヤバい",
                 useCases: ["スケールの大きな素晴らしさを表すとき"],
                 examples: [
                    ("That was epic!", "あれは最高だった!"),
                    ("Epic fail.", "大失敗。")
                 ], ipa: "/ˈɛpɪk/"),
            make("slay", "do something exceptionally well",
                 "最高にキマってる",
                 useCases: ["完璧なパフォーマンスを褒めるとき"],
                 examples: [
                    ("You slayed!", "完璧だったよ!"),
                    ("Slay, queen!", "最高!")
                 ], ipa: "/slˈeɪ/"),
            make("GOAT", "Greatest Of All Time",
                 "史上最高・神",
                 useCases: ["最高峰の人物を称えるとき"],
                 examples: [
                    ("He's the GOAT.", "彼は史上最高。"),
                    ("Messi is the GOAT.", "メッシは神。")
                 ], ipa: "/ɡˈəʊt/"),
            make("on point", "perfect or just right",
                 "バッチリ・完璧",
                 useCases: ["ピタッと決まっている状態を褒めるとき"],
                 examples: [
                    ("Your outfit is on point!", "コーデバッチリ!"),
                    ("Right on point.", "完璧。")
                 ], ipa: "/ˌɒn pˈɔɪnt/"),
            make("sharp", "precisely on time",
                 "(時間が)きっちり",
                 useCases: ["時刻をぴったり指定するとき"],
                 examples: [
                    ("Be there at 7 sharp.", "7時きっかりに来て。"),
                    ("Meeting at 9 sharp.", "9時ぴったり会議。")
                 ], ipa: "/ʃˈɑːp/"),
            make("legit", "genuine; really impressive",
                 "ガチ・本物",
                 useCases: ["本物であることを強調するとき(legitimateの略)"],
                 examples: [
                    ("That's legit.", "ガチだね。"),
                    ("Legit good!", "マジで良い!")
                 ], ipa: "/lədʒˈɪt/"),
            make("sweet", "great or nice",
                 "いいね・最高",
                 useCases: ["何かを褒めるカジュアルな反応"],
                 examples: [
                    ("Sweet!", "いいね!"),
                    ("That's a sweet car.", "いい車。")
                 ], ipa: "/swˈiːt/"),
            make("sick", "extremely cool",
                 "ヤバい・かっこいい",
                 useCases: ["スラングで「すごい」を表すとき"],
                 examples: [
                    ("That's sick!", "ヤバい!"),
                    ("Sick moves.", "かっこいい動き。")
                 ], ipa: "/sˈɪk/")
        ]
    }

    // MARK: - スラング/口語 反応・返事 (追加 10)

    private static var slangReactions16: [Word] {
        [
            make("totally", "completely; absolutely",
                 "完全に同意・それな",
                 useCases: ["強い同意を表すとき"],
                 examples: [
                    ("Totally!", "それな!"),
                    ("I totally agree.", "完全同意。")
                 ], ipa: "/tˈəʊtəlɪ/"),
            make("same here", "I feel the same way",
                 "私も同じ",
                 useCases: ["相手の発言に共感するとき"],
                 examples: [
                    ("Same here.", "私も。"),
                    ("A: I'm tired. B: Same here.", "「疲れた」「私も」")
                 ], ipa: "/sˈeɪm hˈiə/"),
            make("ditto", "the same",
                 "同上・私も同じく",
                 useCases: ["相手の発言に同意するカジュアル表現"],
                 examples: [
                    ("Ditto!", "同感!"),
                    ("Ditto on that.", "それな。")
                 ], ipa: "/dˈɪtəʊ/"),
            make("bet", "agreement or affirmation",
                 "了解・それな",
                 useCases: ["カジュアルに同意・了承を伝えるとき"],
                 examples: [
                    ("Bet!", "了解!"),
                    ("You wanna bet?", "賭ける?")
                 ], ipa: "/bˈɛt/"),
            make("what's up?", "how are things?",
                 "最近どう?・よぉ",
                 useCases: ["カジュアルな挨拶"],
                 examples: [
                    ("Hey, what's up?", "よぉ、どう?"),
                    ("What's up, dude?", "おう、調子は?")
                 ], ipa: "/wˌɒts ˈʌp/"),
            make("not much", "nothing in particular",
                 "別に何も",
                 useCases: ["「最近どう?」への定番の返し"],
                 examples: [
                    ("Not much, you?", "別に、君は?"),
                    ("Not much, just chilling.", "別にダラダラしてる。")
                 ], ipa: "/nˌɒt mˈʌtʃ/"),
            make("my treat", "I'll pay for this",
                 "私のおごり",
                 useCases: ["相手の支払いを引き受けるとき"],
                 examples: [
                    ("It's my treat tonight.", "今夜は私のおごり。"),
                    ("My treat!", "おごるよ!")
                 ], ipa: "/maɪ tɹˈiːt/"),
            make("go Dutch", "split the bill",
                 "割り勘にする",
                 useCases: ["それぞれが自分の分を払うとき"],
                 examples: [
                    ("Let's go Dutch.", "割り勘にしよう。"),
                    ("We always go Dutch.", "私たちはいつも割り勘。")
                 ], ipa: "/ɡˌəʊ dˈʌtʃ/"),
            make("no hard feelings", "no resentment",
                 "恨みっこなしね",
                 useCases: ["対立後にわだかまりを残さないとき"],
                 examples: [
                    ("No hard feelings, right?", "恨みっこなしだよね?"),
                    ("OK, no hard feelings.", "うん、悪気はないから。")
                 ], ipa: "/nˈəʊ hˈɑːd fˈiːlɪŋz/"),
            make("that's it", "that's all",
                 "以上・それだけ",
                 useCases: ["話や指示を締めくくるとき"],
                 examples: [
                    ("That's it!", "それだけ!"),
                    ("That's it for today.", "今日はここまで。")
                 ], ipa: "/ðætsˈɪt/")
        ]
    }

    // MARK: - スラング/口語 略語・俗語 (追加 10)

    private static var slangAbbreviations16: [Word] {
        [
            make("vibe check", "checking the mood of a place",
                 "雰囲気チェック",
                 useCases: ["その場の空気や相手のノリを確かめるとき"],
                 examples: [
                    ("Vibe check!", "雰囲気チェック!"),
                    ("Failed the vibe check.", "ノリが合わなかった。")
                 ], ipa: "/vˈaɪb tʃˈɛk/"),
            make("NBD", "no big deal",
                 "大したことじゃない",
                 useCases: ["軽く流すとき(Not a Big Deal の略)"],
                 examples: [
                    ("NBD, really.", "マジで気にしないで。"),
                    ("It's NBD.", "大したことない。")
                 ], ipa: "/ˌɛnbˌiːdˈiː/"),
            make("TGIF", "Thank God It's Friday",
                 "やっと金曜だ",
                 useCases: ["週末の解放感を表すとき"],
                 examples: [
                    ("TGIF!", "やっと金曜!"),
                    ("Finally, TGIF.", "ついに金曜。")
                 ], ipa: "/tˈiːdʒˈɪf/"),
            make("TMI", "too much information",
                 "情報多すぎ",
                 useCases: ["聞きたくないことを言われたとき"],
                 examples: [
                    ("TMI, dude.", "それは言わなくていい。"),
                    ("Whoa, TMI!", "ちょ、TMI!")
                 ], ipa: "/tˌiːˌɛmˈaɪ/"),
            make("IMO", "in my opinion",
                 "私の意見では",
                 useCases: ["チャットで意見を述べる略語"],
                 examples: [
                    ("IMO, it's overrated.", "個人的には過大評価。"),
                    ("IMO, you should go.", "個人的には行くべき。")
                 ], ipa: "/ˌaɪˌɛmˈəʊ/"),
            make("BYOB", "Bring Your Own Beer/Beverage",
                 "飲み物は各自持参で",
                 useCases: ["パーティーの招待で飲み物持参を伝えるとき"],
                 examples: [
                    ("It's a BYOB party.", "飲み物持参パーティー。"),
                    ("BYOB tonight.", "今夜は飲み物持参で。")
                 ], ipa: "/bˈaɪɒb/"),
            make("ASAP", "as soon as possible",
                 "できるだけ早く",
                 useCases: ["急ぎの対応を頼むとき"],
                 examples: [
                    ("Send it ASAP.", "至急送って。"),
                    ("I need it ASAP.", "急ぎで欲しい。")
                 ], ipa: "/ˌeɪˌɛsˌeɪpˈiː/"),
            make("sus", "suspicious",
                 "怪しい",
                 useCases: ["ゲームAmong Us から流行ったスラング"],
                 examples: [
                    ("That's sus.", "それ怪しい。"),
                    ("He's acting sus.", "彼の動き怪しい。")
                 ], ipa: "/sˈʌs/"),
            make("no cap", "no lie; for real",
                 "嘘偽りなし・マジで",
                 useCases: ["強調・本気度を表すZ世代スラング"],
                 examples: [
                    ("No cap, it's the best.", "マジで最高。"),
                    ("That's true, no cap.", "ガチで本当。")
                 ], ipa: "/nˈəʊ kˈæp/"),
            make("period", "and that's final",
                 "以上・以下なし",
                 useCases: ["議論の余地なしと締めくくるとき"],
                 examples: [
                    ("She's the best, period.", "彼女が最高、以上。"),
                    ("That's the answer, period.", "それが答え、以上。")
                 ], ipa: "/pˈiəɹɪəd/")
        ]
    }

    // MARK: - スラング/口語 人物・物・お金 (追加 10)

    private static var slangPeopleAndMoney16: [Word] {
        [
            make("wheels", "a car",
                 "車",
                 useCases: ["車を口語的に表すとき"],
                 examples: [
                    ("Nice wheels!", "いい車じゃん!"),
                    ("New wheels?", "新車?")
                 ], ipa: "/wˈiːlz/"),
            make("bucks", "dollars",
                 "ドル",
                 useCases: ["カジュアルに金額を表すとき"],
                 examples: [
                    ("It's 5 bucks.", "5ドルだよ。"),
                    ("Got a few bucks?", "何ドルか持ってる?")
                 ], ipa: "/bˈʌks/"),
            make("grand", "one thousand dollars",
                 "1,000ドル",
                 useCases: ["1000ドル単位で話すとき"],
                 examples: [
                    ("It cost two grand.", "2,000ドルした。"),
                    ("A grand a month.", "月1000ドル。")
                 ], ipa: "/ɡɹˈænd/"),
            make("chicken", "a coward",
                 "臆病者・チキン",
                 useCases: ["勇気のない人をからかうとき(名詞)"],
                 examples: [
                    ("Don't be a chicken.", "ビビるなよ。"),
                    ("You're such a chicken!", "ほんとチキンだな!")
                 ], ipa: "/tʃˈɪkɪn/"),
            make("couch potato", "a lazy TV watcher",
                 "ソファでゴロゴロしてる人",
                 useCases: ["怠惰なテレビ漬けの人を表すとき"],
                 examples: [
                    ("Total couch potato.", "完全なゴロ寝族。"),
                    ("Don't be a couch potato.", "ソファ漬けやめて。")
                 ], ipa: "/kˈaʊtʃ pətˈeɪtəʊ/"),
            make("rip-off", "an overpriced product",
                 "ぼったくり",
                 useCases: ["価格が不当に高いと感じたとき"],
                 examples: [
                    ("What a rip-off!", "ぼったくり!"),
                    ("Total rip-off.", "完全にぼったくり。")
                 ], ipa: "/ɹˈɪpˈɒf/"),
            make("dumpster fire", "a complete disaster",
                 "大惨事・めちゃくちゃな状況",
                 useCases: ["手のつけられない状況を表すとき"],
                 examples: [
                    ("This project is a dumpster fire.", "このプロジェクトは大惨事。"),
                    ("Total dumpster fire.", "完全カオス。")
                 ], ipa: "/dˈʌmpstɐ fˈaɪə/"),
            make("kudos", "praise; well done",
                 "称賛・よくやった",
                 useCases: ["相手の功績を称えるとき"],
                 examples: [
                    ("Kudos to you!", "お見事!"),
                    ("Kudos for finishing.", "完走お見事。")
                 ], ipa: "/kjˈuːdəʊz/"),
            make("I'm down", "I'm in / I'll join",
                 "乗った・行く行く",
                 useCases: ["誘いに快諾するとき"],
                 examples: [
                    ("I'm down for pizza.", "ピザ乗った。"),
                    ("I'm down!", "行く!")
                 ], ipa: "/aɪm dˈaʊn/"),
            make("it sucks", "it's terrible",
                 "最悪・がっかり",
                 useCases: ["不満や失望を表すとき"],
                 examples: [
                    ("This sucks.", "最悪。"),
                    ("It sucks, but oh well.", "残念だけど仕方ない。")
                 ], ipa: "/ɪt sˈʌks/")
        ]
    }

    // MARK: - スラング/口語 状態・その他 (追加 11)

    private static var slangStateAndOthers16: [Word] {
        [
            make("low-key", "subtly; secretly",
                 "密かに・ぶっちゃけ",
                 useCases: ["控えめに気持ちを表すとき"],
                 examples: [
                    ("I low-key love it.", "ぶっちゃけ好き。"),
                    ("Low-key tired.", "地味に疲れた。")
                 ], ipa: "/lˈəʊkˈiː/"),
            make("high-key", "openly; obviously",
                 "明らかに・堂々と",
                 useCases: ["低キーの反対、はっきり表すとき"],
                 examples: [
                    ("High-key obsessed.", "明らかにハマってる。"),
                    ("I high-key want this.", "ガチで欲しい。")
                 ], ipa: "/hˈaɪkˈiː/"),
            make("flex", "show off",
                 "自慢する・見せびらかす",
                 useCases: ["自分の物や能力を誇示するとき"],
                 examples: [
                    ("Stop flexing.", "自慢やめて。"),
                    ("Weird flex but OK.", "変な自慢だけどまあいいや。")
                 ], ipa: "/flˈɛks/"),
            make("chillax", "chill out and relax",
                 "落ち着いてリラックスする",
                 useCases: ["chill と relax の混成語、肩の力を抜くとき"],
                 examples: [
                    ("Just chillax!", "落ち着いて!"),
                    ("Chillax, dude.", "リラックスしろよ。")
                 ], ipa: "/tʃˈɪlæks/"),
            make("get a life", "find better things to do",
                 "自分の心配しなよ",
                 useCases: ["余計なお世話への返しなどに使う皮肉"],
                 examples: [
                    ("Get a life!", "大きなお世話!"),
                    ("Seriously, get a life.", "マジで自分の心配しろ。")
                 ], ipa: "/ɡɛt ɐ lˈaɪf/"),
            make("shrug", "raise the shoulders to show indifference",
                 "肩をすくめる",
                 useCases: ["「さあね」のジェスチャーや無関心を表すとき"],
                 examples: [
                    ("He just shrugged.", "彼は肩をすくめただけ。"),
                    ("Shrug. Whatever.", "肩すくめ。まあいいや。")
                 ], ipa: "/ʃɹˈʌɡ/"),
            make("Zzz", "sleeping; sleepy",
                 "眠い・寝ている",
                 useCases: ["眠気や退屈を表す絵文字的表現"],
                 examples: [
                    ("Zzz...", "眠い…"),
                    ("This class is so Zzz.", "この授業眠すぎ。")
                 ], ipa: "/zˌɛdzˌɛdzˈɛd/"),
            make("hit the gym", "go to the gym",
                 "ジムに行く",
                 useCases: ["運動の予定を伝えるカジュアル表現"],
                 examples: [
                    ("Time to hit the gym.", "ジムの時間。"),
                    ("Let's hit the gym.", "ジム行こう。")
                 ], ipa: "/hˈɪt ðə dʒˈɪm/"),
            make("grab a coffee", "go to get a coffee together",
                 "コーヒー飲みに行く",
                 useCases: ["軽い会合や息抜きを誘うとき"],
                 examples: [
                    ("Wanna grab a coffee?", "コーヒーでもどう?"),
                    ("Let's grab a coffee.", "コーヒー行こう。")
                 ], ipa: "/ɡɹˈæb ɐ kˈɒfɪ/"),
            make("rip", "rest in peace; over",
                 "ご冥福を・終わった",
                 useCases: ["カジュアルに「終わった・残念」を表すとき(R.I.P.)"],
                 examples: [
                    ("RIP my phone battery.", "スマホ電池終了。"),
                    ("Rip, that's sad.", "うわ、残念。")
                 ], ipa: "/ɹˈɪp/"),
            make("out of nowhere", "suddenly without warning",
                 "突然・どこからともなく",
                 useCases: ["予期せぬ出来事の登場を表すとき"],
                 examples: [
                    ("He appeared out of nowhere.", "彼が突然現れた。"),
                    ("Came out of nowhere.", "どこからともなく来た。")
                 ], ipa: "/ˌaʊtəv nˈəʊweə/")
        ]
    }

    // MARK: - 仕事・コミュニケーション (追加 10)

    private static var workComms17: [Word] {
        [
            make("touch base", "briefly make contact",
                 "軽く連絡を取る・確認する",
                 useCases: ["状況確認のため短く連絡するとき"],
                 examples: [
                    ("Let's touch base next week.", "来週軽く連絡取り合おう。"),
                    ("Just touching base.", "確認まで連絡。")
                 ], ipa: "/tˈʌtʃ bˈeɪs/"),
            make("behind the scenes", "out of public view",
                 "舞台裏で・水面下で",
                 useCases: ["表に出ない部分や裏の動きを表すとき"],
                 examples: [
                    ("A lot happens behind the scenes.", "舞台裏で色々起きてる。"),
                    ("Behind-the-scenes footage.", "舞台裏映像。")
                 ], ipa: "/bɪhˌaɪnd ðə sˈiːnz/"),
            make("in parallel", "simultaneously",
                 "並行して・同時に",
                 useCases: ["複数の作業を同時進行させるとき"],
                 examples: [
                    ("Run two tasks in parallel.", "2つを並行して実行。"),
                    ("Working in parallel.", "並行作業中。")
                 ], ipa: "/ɪn pˈæɹəlˌɛl/"),
            make("deep dive", "thorough investigation",
                 "深掘り・徹底調査",
                 useCases: ["特定のテーマを詳しく掘り下げるとき"],
                 examples: [
                    ("Let's do a deep dive.", "深掘りしよう。"),
                    ("A deep dive into the data.", "データの徹底分析。")
                 ], ipa: "/dˈiːp dˈaɪv/"),
            make("take action", "act on something",
                 "行動を起こす",
                 useCases: ["決意して行動に移すよう促すとき"],
                 examples: [
                    ("Time to take action.", "行動の時。"),
                    ("Take action now.", "今行動しよう。")
                 ], ipa: "/tˈeɪk ˈækʃən/"),
            make("stay tuned", "wait for more information",
                 "乞うご期待・続報を待て",
                 useCases: ["後で続報があると伝えるとき"],
                 examples: [
                    ("Stay tuned for updates.", "続報をお待ちください。"),
                    ("More to come — stay tuned!", "続きあり、お楽しみに!")
                 ], ipa: "/stˈeɪ tjˈuːnd/"),
            make("keep in the loop", "keep someone informed",
                 "(話の輪に)入れておく",
                 useCases: ["情報共有を続けるよう頼むとき"],
                 examples: [
                    ("Keep me in the loop.", "私にも共有して。"),
                    ("Always keeping us in the loop.", "いつも輪に入れてくれる。")
                 ], ipa: "/kˈiːp ɪnðə lˈuːp/"),
            make("loop", "communication chain",
                 "話の輪・連絡網",
                 useCases: ["情報共有のチェーンや繰り返しを表すとき"],
                 examples: [
                    ("Out of the loop.", "話に入れていない。"),
                    ("Stuck in a loop.", "ループにハマってる。")
                 ], ipa: "/lˈuːp/"),
            make("ship it", "release a product",
                 "(商品を)世に出す・リリースする",
                 useCases: ["開発したものを公開するとき(IT・スタートアップ用語)"],
                 examples: [
                    ("Let's ship it!", "リリースしよう!"),
                    ("Ship it Friday.", "金曜リリース。")
                 ], ipa: "/ʃˈɪp ɪt/"),
            make("next level", "a much higher standard",
                 "ワンランク上・次元が違う",
                 useCases: ["飛び抜けた品質や性能を表すとき"],
                 examples: [
                    ("That's next level.", "別次元。"),
                    ("Take it to the next level.", "次のレベルへ。")
                 ], ipa: "/nˈɛkst lˈɛvəl/")
        ]
    }

    // MARK: - 批判・ネットスラング (追加 10)

    private static var critiqueWords17: [Word] {
        [
            make("meltdown", "an emotional collapse",
                 "感情的に取り乱すこと",
                 useCases: ["パニックや怒りで自制を失ったとき"],
                 examples: [
                    ("She had a meltdown.", "彼女ブチ切れた。"),
                    ("A complete meltdown.", "完全な取り乱し。")
                 ], ipa: "/mˈɛltdaʊn/"),
            make("cry more", "stop complaining",
                 "もっと泣け(嘲り)",
                 useCases: ["不満を訴える相手を皮肉るネットスラング"],
                 examples: [
                    ("Cry more, noob.", "もっと泣け、雑魚。"),
                    ("Lol, cry more.", "草、もっと泣け。")
                 ], ipa: "/kɹˈaɪ mˈɔː/"),
            make("clown", "a foolish person",
                 "道化・バカ",
                 useCases: ["愚かな行動をした人を皮肉るとき"],
                 examples: [
                    ("Don't be a clown.", "バカやるな。"),
                    ("Total clown.", "完全な道化。")
                 ], ipa: "/klˈaʊn/"),
            make("shitposting", "deliberately low-quality online posting",
                 "煽り・ふざけた投稿(俗)",
                 useCases: ["わざとくだらない投稿をすること"],
                 examples: [
                    ("Stop shitposting.", "煽り投稿やめろ。"),
                    ("Pure shitposting.", "完全に煽り。")
                 ], ipa: "/ʃˈɪtpəʊstɪŋ/"),
            make("troll", "online provocateur",
                 "荒らし・煽る人",
                 useCases: ["ネットで挑発する人を表すとき"],
                 examples: [
                    ("Don't feed the trolls.", "荒らしに餌を与えるな。"),
                    ("He's just trolling.", "ただ煽ってるだけ。")
                 ], ipa: "/tɹˈəʊl/"),
            make("hardcore", "extremely intense or devoted",
                 "ガチ・本格派",
                 useCases: ["熱中度や強度が高いものを表すとき"],
                 examples: [
                    ("Hardcore fan.", "ガチファン。"),
                    ("That's hardcore.", "ガチだな。")
                 ], ipa: "/hˈɑːdkɔː/"),
            make("corrupt", "morally depraved or dishonest",
                 "腐敗した・汚職にまみれた",
                 useCases: ["政治家や組織の不正を批判するとき"],
                 examples: [
                    ("Corrupt politicians.", "腐敗政治家。"),
                    ("A corrupt system.", "腐敗したシステム。")
                 ], ipa: "/kəɹˈʌpt/"),
            make("hypocrisy", "claiming morals one doesn't have",
                 "偽善",
                 useCases: ["言行不一致を批判するとき"],
                 examples: [
                    ("That's pure hypocrisy.", "完全に偽善。"),
                    ("Call out the hypocrisy.", "偽善を指摘する。")
                 ], ipa: "/hɪpˈɒkɹəsɪ/"),
            make("double standard", "applying different rules unfairly",
                 "二重基準・ダブスタ",
                 useCases: ["相手と自分で基準を変えていることを批判するとき"],
                 examples: [
                    ("That's a double standard.", "それダブスタ。"),
                    ("Stop the double standard.", "二重基準やめて。")
                 ], ipa: "/dˈʌbəl stˈændəd/"),
            make("propaganda", "biased information for influence",
                 "プロパガンダ・世論誘導",
                 useCases: ["政府や組織の意図的な宣伝を批判するとき"],
                 examples: [
                    ("Pure propaganda.", "ただのプロパガンダ。"),
                    ("Spreading propaganda.", "プロパガンダを広める。")
                 ], ipa: "/pɹˌɒpɐɡˈændɐ/")
        ]
    }

    // MARK: - 結果・状況 (追加 10)

    private static var outcomeWords17: [Word] {
        [
            make("undefeated", "never been beaten",
                 "無敗の",
                 useCases: ["連勝記録や負け知らずの状態を表すとき"],
                 examples: [
                    ("Undefeated champion.", "無敗の王者。"),
                    ("Still undefeated.", "まだ負けなし。")
                 ], ipa: "/ˌʌndɪfˈiːtɪd/"),
            make("endgame", "final stage",
                 "最終局面・大詰め",
                 useCases: ["勝負や計画の最終段階を表すとき"],
                 examples: [
                    ("This is the endgame.", "ここが大詰め。"),
                    ("What's the endgame?", "最終目標は?")
                 ], ipa: "/ɛndɡˈeɪm/"),
            make("game over", "it's all done",
                 "終わりだ・詰んだ",
                 useCases: ["勝ち目がない状況を宣言するとき"],
                 examples: [
                    ("Game over, man.", "もう詰みだよ。"),
                    ("If they find out, game over.", "バレたら終わり。")
                 ], ipa: "/ɡˈeɪm ˈəʊvɐ/"),
            make("zero chance", "no possibility at all",
                 "可能性ゼロ",
                 useCases: ["完全否定や絶望的状況を強調するとき"],
                 examples: [
                    ("Zero chance of winning.", "勝ち目ゼロ。"),
                    ("Zero chance, period.", "可能性ゼロ、以上。")
                 ], ipa: "/zˈiəɹəʊ tʃˈɑːns/"),
            make("exponential", "growing at increasing rate",
                 "指数関数的な",
                 useCases: ["急成長を表すとき(AIや技術)"],
                 examples: [
                    ("Exponential growth.", "指数関数的成長。"),
                    ("AI is improving exponentially.", "AIは指数関数的に進化中。")
                 ], ipa: "/ˌɛkspənˈɛnʃəl/"),
            make("taxpayer", "a person who pays taxes",
                 "納税者",
                 useCases: ["税金で運営されることや市民の負担を語るとき"],
                 examples: [
                    ("Taxpayer money.", "税金。"),
                    ("Hardworking taxpayers.", "勤勉な納税者。")
                 ], ipa: "/tˈækspeɪɐ/"),
            make("in the red", "operating at a loss",
                 "赤字で",
                 useCases: ["経営や家計の赤字を表すとき"],
                 examples: [
                    ("We're in the red.", "うちは赤字。"),
                    ("The company is in the red.", "会社は赤字。")
                 ], ipa: "/ɪnðə ɹˈɛd/"),
            make("deficit", "a shortfall in revenue or amount",
                 "不足・赤字",
                 useCases: ["経済や予算の赤字、不足を表すとき"],
                 examples: [
                    ("Budget deficit.", "予算赤字。"),
                    ("Calorie deficit.", "カロリー不足(ダイエット用語)。")
                 ], ipa: "/dˈɛfɪsˌɪt/"),
            make("margin", "the edge or profit difference",
                 "利益率・余白",
                 useCases: ["利益・余地・差を表すとき"],
                 examples: [
                    ("Profit margin.", "利益率。"),
                    ("Won by a small margin.", "僅差で勝利。")
                 ], ipa: "/mˈɑːdʒɪn/"),
            make("lucrative", "highly profitable",
                 "儲かる・割のいい",
                 useCases: ["事業・契約が大きな利益をもたらすとき"],
                 examples: [
                    ("A lucrative business.", "儲かるビジネス。"),
                    ("Lucrative deal.", "おいしい契約。")
                 ], ipa: "/lˈuːkɹətˌɪv/")
        ]
    }

    // MARK: - 形容詞・性質 (追加 11)

    private static var adjectiveWords17: [Word] {
        [
            make("density", "the degree of compactness",
                 "密度",
                 useCases: ["物の詰まり具合や人口密度を表すとき"],
                 examples: [
                    ("Population density.", "人口密度。"),
                    ("High density area.", "高密度地域。")
                 ], ipa: "/dˈɛnsɪtɪ/"),
            make("concerning", "worrying; troubling",
                 "気がかりな・懸念される",
                 useCases: ["心配すべき状況を表すとき"],
                 examples: [
                    ("That's concerning.", "それは気がかり。"),
                    ("Deeply concerning data.", "深刻なデータ。")
                 ], ipa: "/kənsˈɜːnɪŋ/"),
            make("principle", "a fundamental rule or belief",
                 "原則・信念",
                 useCases: ["基本ルールや信条を表すとき"],
                 examples: [
                    ("On principle.", "原則として。"),
                    ("It's a matter of principle.", "信念の問題。")
                 ], ipa: "/pɹˈɪnsɪpəl/"),
            make("subtle", "delicately complex; not obvious",
                 "微妙な・繊細な",
                 useCases: ["はっきりせず気づきにくい違いを表すとき"],
                 examples: [
                    ("Subtle difference.", "微妙な違い。"),
                    ("A subtle hint.", "それとなくほのめかす。")
                 ], ipa: "/sˈʌtəl/"),
            make("compelling", "evoking strong interest",
                 "説得力のある・引き込まれる",
                 useCases: ["強く引きつけられる議論や物語を表すとき"],
                 examples: [
                    ("A compelling argument.", "説得力のある主張。"),
                    ("Compelling evidence.", "有力な証拠。")
                 ], ipa: "/kəmpˈɛlɪŋ/"),
            make("resilient", "able to recover quickly",
                 "回復力のある・しなやかな",
                 useCases: ["困難に強い人や組織を表すとき"],
                 examples: [
                    ("She's so resilient.", "彼女は本当にタフ。"),
                    ("A resilient economy.", "強靭な経済。")
                 ], ipa: "/ɹɪsˈɪliənt/"),
            make("ridiculous", "absurd; unreasonable",
                 "ばかげた・あり得ない",
                 useCases: ["呆れた状況や物事を批判するとき"],
                 examples: [
                    ("That's ridiculous.", "あり得ない。"),
                    ("Ridiculously expensive.", "バカ高い。")
                 ], ipa: "/ɹɪdˈɪkjʊləs/"),
            make("inevitable", "unavoidable",
                 "避けられない・必然の",
                 useCases: ["どうしても起こることを表すとき"],
                 examples: [
                    ("Change is inevitable.", "変化は必然。"),
                    ("It was inevitable.", "避けられなかった。")
                 ], ipa: "/ɪnˈɛvɪtəbəl/"),
            make("candid", "truthful and straightforward",
                 "率直な・包み隠さない",
                 useCases: ["遠慮せず本音で話すことを表すとき"],
                 examples: [
                    ("Be candid with me.", "正直に言って。"),
                    ("A candid conversation.", "率直な対話。")
                 ], ipa: "/kˈændɪd/"),
            make("frank", "open and sincere",
                 "率直な・遠慮のない",
                 useCases: ["遠回しでない直接的な発言を表すとき"],
                 examples: [
                    ("To be frank, ~", "率直に言うと〜"),
                    ("Frank discussion.", "率直な議論。")
                 ], ipa: "/fɹˈæŋk/"),
            make("eccentric", "unconventional and strange",
                 "風変わりな・型破りな",
                 useCases: ["変わった性格や行動を表すとき"],
                 examples: [
                    ("An eccentric artist.", "型破りな芸術家。"),
                    ("Quite eccentric.", "かなり風変わり。")
                 ], ipa: "/ɪksˈɛntɹɪk/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var verbWords17: [Word] {
        [
            make("obsess", "be preoccupied with",
                 "執着する・とらわれる",
                 useCases: ["何かに過度にこだわるとき"],
                 examples: [
                    ("Don't obsess over it.", "こだわりすぎないで。"),
                    ("I'm obsessed!", "ハマってる!")
                 ], ipa: "/ɒbsˈɛs/"),
            make("stumble upon", "find by chance",
                 "偶然見つける",
                 useCases: ["探していなかったものを偶然発見するとき"],
                 examples: [
                    ("I stumbled upon a great book.", "良い本に偶然出会った。"),
                    ("Stumbled upon the truth.", "真実に偶然たどり着いた。")
                 ], ipa: "/stˈʌmbəl əpˌɒn/"),
            make("pass through", "go through a place briefly",
                 "通過する・通り抜ける",
                 useCases: ["短時間だけ立ち寄る・通るとき"],
                 examples: [
                    ("Just passing through.", "通り過ぎるだけ。"),
                    ("Pass through customs.", "税関を通過。")
                 ], ipa: "/pˈɑːs θɹˈuː/"),
            make("migrate", "move from one place to another",
                 "移住する・(データを)移行する",
                 useCases: ["人・動物・データの移動を表すとき"],
                 examples: [
                    ("Birds migrate south.", "鳥が南へ渡る。"),
                    ("Migrate to a new system.", "新システムへ移行。")
                 ], ipa: "/maɪɡɹˈeɪt/"),
            make("advocate", "publicly support a cause",
                 "提唱する・支持する",
                 useCases: ["主義主張を擁護・推進するとき"],
                 examples: [
                    ("Advocate for change.", "変化を提唱する。"),
                    ("A strong advocate.", "強力な支持者。")
                 ], ipa: "/ˈædvəkˌeɪt/"),
            make("turn a blind eye", "ignore wrongdoing deliberately",
                 "見て見ぬふりをする",
                 useCases: ["不正を意図的に無視するとき"],
                 examples: [
                    ("Turn a blind eye to it.", "見て見ぬふりする。"),
                    ("Don't turn a blind eye.", "見過ごさないで。")
                 ], ipa: "/tˈɜːn ɐ blˈaɪnd ˈaɪ/"),
            make("pave the way", "make progress possible",
                 "道を開く",
                 useCases: ["後続のために土台を作るとき"],
                 examples: [
                    ("Pave the way for reform.", "改革への道を開く。"),
                    ("She paved the way.", "彼女が道を切り開いた。")
                 ], ipa: "/pˈeɪv ðə wˈeɪ/"),
            make("bite your tongue", "stop yourself from speaking",
                 "言葉を飲み込む",
                 useCases: ["言いたいことを我慢するとき"],
                 examples: [
                    ("Bite your tongue!", "言葉を慎め!"),
                    ("Had to bite my tongue.", "言いたいの我慢した。")
                 ], ipa: "/bˈaɪt jɔː tˈʌŋ/"),
            make("sit tight", "wait patiently",
                 "じっと待つ",
                 useCases: ["動かずに様子を見るよう促すとき"],
                 examples: [
                    ("Just sit tight.", "じっとしてて。"),
                    ("Sit tight, help is coming.", "待ってて、助けが来る。")
                 ], ipa: "/sˈɪt tˈaɪt/"),
            make("hit the nail on the head", "be exactly right",
                 "核心を突く",
                 useCases: ["まさにその通りのことを言い当てたとき"],
                 examples: [
                    ("You hit the nail on the head.", "まさにその通り。"),
                    ("That hits the nail on the head.", "図星。")
                 ], ipa: "/hˈɪt ðə nˈeɪl ɒnðə hˈɛd/")
        ]
    }

    // MARK: - 慣用句・その他 (追加 12)

    private static var idiomWords17: [Word] {
        [
            make("odds", "probability of happening",
                 "確率・見込み",
                 useCases: ["可能性の高低を表すとき"],
                 examples: [
                    ("The odds are high.", "確率が高い。"),
                    ("What are the odds?", "確率は?")
                 ], ipa: "/ˈɒdz/"),
            make("injury", "physical damage to the body",
                 "けが",
                 useCases: ["身体的な負傷を表すとき"],
                 examples: [
                    ("A serious injury.", "重傷。"),
                    ("Recovering from an injury.", "けがから回復中。")
                 ], ipa: "/ˈɪndʒəɹɪ/"),
            make("skeleton", "the bony frame; a skeleton crew",
                 "骸骨・骨組み・最小限",
                 useCases: ["骨組みや最小限の構成を表すとき"],
                 examples: [
                    ("A skeleton crew.", "最小限のスタッフ。"),
                    ("Skeleton in the closet.", "隠された秘密(慣用)。")
                 ], ipa: "/skˈɛlɪtən/"),
            make("once in a blue moon", "very rarely",
                 "ごくまれに・めったに〜ない",
                 useCases: ["非常に珍しい出来事を表すとき"],
                 examples: [
                    ("I see him once in a blue moon.", "めったに会わない。"),
                    ("Once in a blue moon, ~", "ごくまれに〜")
                 ], ipa: "/wˈʌns ɪn ɐ blˈuː mˈuːn/"),
            make("stagnant", "not flowing or changing",
                 "停滞した・よどんだ",
                 useCases: ["経済や水などが動かない状態を表すとき"],
                 examples: [
                    ("Stagnant economy.", "停滞する経済。"),
                    ("Stagnant water.", "よどんだ水。")
                 ], ipa: "/stˈæɡnənt/"),
            make("touch and go", "uncertain; risky",
                 "予断を許さない",
                 useCases: ["どちらに転ぶか分からない緊迫した状況"],
                 examples: [
                    ("It's touch and go.", "予断を許さない。"),
                    ("Things were touch and go.", "ギリギリの状態だった。")
                 ], ipa: "/tˈʌtʃ ænd ɡˈəʊ/"),
            make("pull strings", "use influence behind the scenes",
                 "コネを使う・裏で動く",
                 useCases: ["影響力を使って物事を動かすとき"],
                 examples: [
                    ("He pulled some strings.", "彼がコネを使った。"),
                    ("Pull strings to get in.", "コネで入る。")
                 ], ipa: "/pˈʊl stɹˈɪŋz/"),
            make("volatile", "liable to change rapidly",
                 "不安定な・変動の激しい",
                 useCases: ["市場や感情が荒れやすい状態を表すとき"],
                 examples: [
                    ("A volatile market.", "不安定な市場。"),
                    ("Volatile temper.", "短気。")
                 ], ipa: "/vˈɒlɐtˌaɪl/"),
            make("spill", "let liquid fall out; reveal a secret",
                 "こぼす・(秘密を)漏らす",
                 useCases: ["液体をこぼす、または情報を漏らすとき"],
                 examples: [
                    ("Don't spill the coffee.", "コーヒーこぼさないで。"),
                    ("Spill the tea.", "秘密を漏らせ(俗)。")
                 ], ipa: "/spˈɪl/"),
            make("spoilage", "the process of going bad",
                 "腐敗・劣化",
                 useCases: ["食品などが傷んで使えなくなることを表すとき"],
                 examples: [
                    ("Food spoilage.", "食品の腐敗。"),
                    ("Reduce spoilage.", "劣化を減らす。")
                 ], ipa: "/spˈɔɪlɪdʒ/"),
            make("plausible", "seeming reasonable or probable",
                 "もっともらしい・あり得る",
                 useCases: ["説明や説が筋が通っていることを表すとき"],
                 examples: [
                    ("A plausible explanation.", "もっともらしい説明。"),
                    ("Sounds plausible.", "あり得そう。")
                 ], ipa: "/plˈɔːzɪbəl/"),
            make("unprecedented", "never done or seen before",
                 "前例のない・空前の",
                 useCases: ["史上初の出来事や規模を表すとき"],
                 examples: [
                    ("Unprecedented growth.", "空前の成長。"),
                    ("An unprecedented event.", "前例のない事態。")
                 ], ipa: "/ʌnpɹˈɛsɪdəntɪd/")
        ]
    }

    // MARK: - 業務・思考表現 (追加 10)

    private static var thinkingPhrases18: [Word] {
        [
            make("get sth wrong", "misunderstand or misinterpret",
                 "(何かを)誤解する・間違える",
                 useCases: ["事実や意図を取り違えたとき"],
                 examples: [
                    ("I got the date wrong.", "日付を間違えた。"),
                    ("Don't get this wrong.", "これを誤解しないで。")
                 ], ipa: "/ɡɛt sˈʌmθɪŋ ɹˈɒŋ/"),
            make("get sth right", "do or understand correctly",
                 "正しく行う・正しく理解する",
                 useCases: ["正しい結果や認識にたどり着くとき"],
                 examples: [
                    ("Let me get this right.", "確認させて。"),
                    ("Got it right the first time.", "一発で正解。")
                 ], ipa: "/ɡɛt sˈʌmθɪŋ ɹˈaɪt/"),
            make("at the end of", "by the end of a period",
                 "〜の終わりに",
                 useCases: ["期間や場所の終点を表すとき"],
                 examples: [
                    ("At the end of the day.", "結局のところ(慣用)。"),
                    ("At the end of the street.", "通りの突き当たり。")
                 ], ipa: "/æt ðɪ ˈɛnd ɒv/"),
            make("at the age of", "when one was a certain age",
                 "〜歳のときに",
                 useCases: ["年齢を指定して出来事を語るとき"],
                 examples: [
                    ("At the age of 18.", "18歳のときに。"),
                    ("Started college at the age of 20.", "20歳で大学を始めた。")
                 ], ipa: "/æt ðɪ ˈeɪdʒ ɒv/"),
            make("for the most part", "mostly; generally",
                 "大部分は・概ね",
                 useCases: ["大筋を述べるときの控えめな断り"],
                 examples: [
                    ("For the most part, it works.", "大体は機能する。"),
                    ("True for the most part.", "概ねその通り。")
                 ], ipa: "/fəðə mˈəʊst pˈɑːt/"),
            make("slip my mind", "be forgotten",
                 "うっかり忘れる",
                 useCases: ["うっかり忘れたことを謝罪・説明するとき"],
                 examples: [
                    ("It slipped my mind.", "うっかり忘れてた。"),
                    ("Sorry, it just slipped my mind.", "ごめん、つい忘れた。")
                 ], ipa: "/slˈɪp maɪ mˈaɪnd/"),
            make("dwell on", "think about something for too long",
                 "くよくよ考える・こだわる",
                 useCases: ["過去の失敗などを引きずるとき"],
                 examples: [
                    ("Don't dwell on it.", "くよくよしないで。"),
                    ("Stop dwelling on the past.", "過去にこだわるな。")
                 ], ipa: "/dwˈɛl ˈɒn/"),
            make("second-guess", "doubt or reconsider a decision",
                 "あとから疑う・推測し直す",
                 useCases: ["決断を後から疑うとき"],
                 examples: [
                    ("Don't second-guess yourself.", "自分を疑わないで。"),
                    ("I keep second-guessing my choices.", "選択を疑い続けてる。")
                 ], ipa: "/sˈɛkəndɡˈɛs/"),
            make("go the extra mile", "make a special effort",
                 "ひと手間かける・特別に頑張る",
                 useCases: ["求められた以上の努力をするとき"],
                 examples: [
                    ("She always goes the extra mile.", "彼女はいつも余計に頑張る。"),
                    ("Go the extra mile for clients.", "顧客のために一歩踏み込む。")
                 ], ipa: "/ɡˌəʊ ðɪ ˈɛkstɹɐ mˈaɪl/"),
            make("play it by ear", "decide as the situation develops",
                 "臨機応変にやる",
                 useCases: ["計画を立てず状況に合わせて判断するとき"],
                 examples: [
                    ("Let's play it by ear.", "成り行きでいこう。"),
                    ("We'll play it by ear.", "臨機応変にする。")
                 ], ipa: "/plˈeɪ ɪt baɪ ˈiə/")
        ]
    }

    // MARK: - ビジネス動詞・出力 (追加 9)

    private static var businessVerbs18: [Word] {
        [
            make("keep tabs on", "monitor closely",
                 "目を光らせる・動向を把握する",
                 useCases: ["人や状況を継続的に観察するとき"],
                 examples: [
                    ("Keep tabs on the budget.", "予算に目を光らせて。"),
                    ("She keeps tabs on the team.", "彼女はチームの動向を把握している。")
                 ], ipa: "/kˈiːp tˈæbz ˈɒn/"),
            make("leverage", "use to maximum advantage",
                 "活用する・てこ入れする",
                 useCases: ["持っている資源を有効活用するとき"],
                 examples: [
                    ("Leverage your skills.", "スキルを活用して。"),
                    ("Leverage social media.", "SNSを活用する。")
                 ], ipa: "/lˈiːvəɹɪdʒ/"),
            make("optimize", "make as effective as possible",
                 "最適化する",
                 useCases: ["効率や性能を最大化するとき"],
                 examples: [
                    ("Optimize for speed.", "スピードを最適化。"),
                    ("Optimize the process.", "プロセスを最適化する。")
                 ], ipa: "/ˈɒptɪmˌaɪz/"),
            make("elaborate", "explain in more detail",
                 "詳しく説明する",
                 useCases: ["相手にもっと詳細を求めるとき"],
                 examples: [
                    ("Could you elaborate?", "詳しく説明してくれる?"),
                    ("Let me elaborate.", "もう少し詳しく言うと。")
                 ], ipa: "/ɪlˈæbəɹˌeɪt/"),
            make("implement", "put into effect",
                 "実施する・導入する",
                 useCases: ["計画や方針を実行に移すとき"],
                 examples: [
                    ("Implement the new policy.", "新方針を導入する。"),
                    ("Fully implemented.", "完全に実装済み。")
                 ], ipa: "/ˈɪmplɪmənt/"),
            make("facilitate", "make easier to do",
                 "促進する・容易にする",
                 useCases: ["プロセスや議論をスムーズにするとき"],
                 examples: [
                    ("Facilitate the discussion.", "議論を促進する。"),
                    ("Tools that facilitate learning.", "学習を促進するツール。")
                 ], ipa: "/fəsˈɪlɪtˌeɪt/"),
            make("see eye to eye", "agree completely",
                 "意見が完全に一致する",
                 useCases: ["主に否定形で意見の食い違いを表現するとき"],
                 examples: [
                    ("We don't see eye to eye.", "意見が合わない。"),
                    ("We see eye to eye on this.", "この件は意見が一致。")
                 ], ipa: "/sˈiː ˈaɪ tʊ ˈaɪ/"),
            make("output", "the amount produced",
                 "生産量・出力",
                 useCases: ["生産・処理の結果を表すとき"],
                 examples: [
                    ("Increase output.", "生産量を上げる。"),
                    ("High-quality output.", "高品質な出力。")
                 ], ipa: "/ˈaʊtpʊt/"),
            make("consistency", "the quality of being stable",
                 "一貫性・継続性",
                 useCases: ["習慣やブランドの安定感を語るとき"],
                 examples: [
                    ("Consistency is key.", "一貫性が鍵。"),
                    ("Lack of consistency.", "一貫性の欠如。")
                 ], ipa: "/kənsˈɪstənsɪ/")
        ]
    }

    // MARK: - 学習・人格・慣用句 (追加 9)

    private static var learningWords18: [Word] {
        [
            make("immersion", "deep involvement in a language or activity",
                 "没頭・浸ること",
                 useCases: ["言語学習などに集中的に取り組むとき"],
                 examples: [
                    ("Language immersion.", "言語への没頭。"),
                    ("Total immersion learning.", "完全没入学習。")
                 ], ipa: "/ɪmˈɜːʃən/"),
            make("mindset", "a person's mental attitude",
                 "心構え・物の見方",
                 useCases: ["考え方や姿勢を表すとき"],
                 examples: [
                    ("Growth mindset.", "成長マインドセット。"),
                    ("Change your mindset.", "考え方を変えて。")
                 ], ipa: "/mˈaɪndsɛt/"),
            make("discipline", "self-control; a field of study",
                 "規律・自己鍛錬・専門分野",
                 useCases: ["継続的な努力や学問領域を表すとき"],
                 examples: [
                    ("Self-discipline is key.", "自己鍛錬が鍵。"),
                    ("A different discipline.", "別の分野。")
                 ], ipa: "/dˈɪsɪplˌɪn/"),
            make("by memory", "without notes or aid",
                 "記憶で・暗記で",
                 useCases: ["何も見ずに思い出して言うとき"],
                 examples: [
                    ("I know it by memory.", "暗記してる。"),
                    ("Recite by memory.", "暗唱する。")
                 ], ipa: "/baɪ mˈɛməɹɪ/"),
            make("take it for granted", "assume without appreciation",
                 "当たり前と思う",
                 useCases: ["感謝を忘れて当然視するとき"],
                 examples: [
                    ("Don't take it for granted.", "当たり前と思わないで。"),
                    ("We take freedom for granted.", "自由を当然視してる。")
                 ], ipa: "/tˈeɪk ɪt fɔː ɡɹˈɑːntɪd/"),
            make("grant", "give formally; allow",
                 "授ける・与える・認める",
                 useCases: ["公式に許可・助成・付与するとき"],
                 examples: [
                    ("Grant permission.", "許可を与える。"),
                    ("Research grant.", "研究助成金。")
                 ], ipa: "/ɡɹˈɑːnt/"),
            make("cut corners", "do something cheaply or quickly",
                 "手抜きする・近道する",
                 useCases: ["手間や費用を省いて雑にやるとき"],
                 examples: [
                    ("Don't cut corners.", "手抜きしないで。"),
                    ("They cut corners on safety.", "安全面で手を抜いた。")
                 ], ipa: "/kˈʌt kˈɔːnəz/"),
            make("under the weather", "feeling slightly ill",
                 "体調が悪い",
                 useCases: ["軽い不調を婉曲的に伝えるとき"],
                 examples: [
                    ("I'm feeling under the weather.", "ちょっと体調が悪い。"),
                    ("A bit under the weather today.", "今日は少し調子が悪い。")
                 ], ipa: "/ˌʌndɐ ðə wˈɛðɐ/"),
            make("read between the lines", "find hidden meaning",
                 "行間を読む",
                 useCases: ["言外の意味を察するとき"],
                 examples: [
                    ("Read between the lines.", "行間を読んで。"),
                    ("If you read between the lines, ~", "行間を読めば〜")
                 ], ipa: "/ɹˈiːd bɪtwˌiːn ðə lˈaɪnz/")
        ]
    }

    // MARK: - 議論・意見表明 (追加 10)

    private static var discussionPhrases19: [Word] {
        [
            make("if I'm wrong", "in case I am mistaken",
                 "もし私が間違っていたら",
                 useCases: ["訂正を促す前置きとして"],
                 examples: [
                    ("Correct me if I'm wrong.", "間違ってたら教えて。"),
                    ("If I'm wrong, let me know.", "間違ってたら教えてね。")
                 ], ipa: "/ɪf aɪm ɹˈɒŋ/"),
            make("correct", "right; free from error",
                 "正しい・訂正する",
                 useCases: ["事実や答えが合っていることを表すとき"],
                 examples: [
                    ("That's correct.", "正解。"),
                    ("Please correct me.", "訂正してください。")
                 ], ipa: "/kəɹˈɛkt/"),
            make("as a matter of fact", "in actuality",
                 "実は・実際のところ",
                 useCases: ["相手の予想に反する情報を伝えるとき"],
                 examples: [
                    ("As a matter of fact, I do know him.", "実は彼を知ってる。"),
                    ("As a matter of fact, you're right.", "実際、君は正しい。")
                 ], ipa: "/æz ɐ mˈætɐɹ ɒv fˈækt/"),
            make("in that sense", "from that perspective",
                 "その意味では",
                 useCases: ["特定の観点に絞って述べるとき"],
                 examples: [
                    ("In that sense, yes.", "その意味ではイエス。"),
                    ("In that sense, we agree.", "その意味では一致。")
                 ], ipa: "/ɪn ðæt sˈɛns/"),
            make("for instance", "for example",
                 "例えば",
                 useCases: ["具体例を挙げるとき"],
                 examples: [
                    ("For instance, take Japan.", "例えば日本を考えてみよう。"),
                    ("Many cities, for instance Tokyo.", "多くの都市、例えば東京。")
                 ], ipa: "/fɔːɹ ˈɪnstəns/"),
            make("technically", "strictly according to facts",
                 "厳密には・テクニカルに言うと",
                 useCases: ["細かい事実関係を強調するとき"],
                 examples: [
                    ("Technically, that's true.", "厳密にはそれは正しい。"),
                    ("Technically, you're right.", "技術的には合ってる。")
                 ], ipa: "/tˈɛknɪklɪ/"),
            make("literally", "in a literal sense; actually",
                 "文字通り・マジで",
                 useCases: ["強調する時の口語(本来の意味と俗な強調の両方)"],
                 examples: [
                    ("I literally cried.", "マジで泣いた。"),
                    ("Literally everyone.", "文字通り全員。")
                 ], ipa: "/lˈɪtəɹəlɪ/"),
            make("my understanding is that", "I believe / I assume that",
                 "私の理解では〜だ",
                 useCases: ["自分の理解を慎重に提示するとき"],
                 examples: [
                    ("My understanding is that we agreed.", "私の理解では合意したと。"),
                    ("My understanding is that it starts at 9.", "9時開始と理解している。")
                 ], ipa: "/maɪ ˌʌndəstˈændɪŋ ɪz ðˈæt/"),
            make("good to know", "thanks for the information",
                 "知れてよかった・参考になる",
                 useCases: ["情報を受け取ったときのリアクション"],
                 examples: [
                    ("Good to know!", "それはいい情報。"),
                    ("Good to know, thanks!", "知れてよかった、ありがとう!")
                 ], ipa: "/ɡˈʊd tə nˈəʊ/"),
            make("how does that sound", "what do you think of that",
                 "それでどうかな・どう思う?",
                 useCases: ["提案の感触を尋ねるとき"],
                 examples: [
                    ("Friday at 3 — how does that sound?", "金曜3時、どう?"),
                    ("How does that sound to you?", "それで君はどう思う?")
                 ], ipa: "/hˌaʊ dˈʌz ðæt sˈaʊnd/")
        ]
    }

    // MARK: - 動詞・性質 (追加 8)

    private static var actionAdjectives19: [Word] {
        [
            make("streamline", "make more efficient",
                 "(プロセスを)効率化する",
                 useCases: ["手順や組織を簡素化・効率化するとき"],
                 examples: [
                    ("Streamline the workflow.", "業務フローを効率化。"),
                    ("We need to streamline operations.", "業務を簡素化する必要がある。")
                 ], ipa: "/stɹˈiːmlaɪn/"),
            make("prioritize", "treat as more important",
                 "優先する",
                 useCases: ["何かを他より優先順位を上げるとき"],
                 examples: [
                    ("Prioritize your health.", "健康を優先して。"),
                    ("Let's prioritize this task.", "このタスクを優先しよう。")
                 ], ipa: "/pɹaɪˈɒɹɪtˌaɪz/"),
            make("up to", "depending on; until; capable of",
                 "〜次第・〜まで・〜にかかっている",
                 useCases: ["責任・限度・進行中の活動を表すとき"],
                 examples: [
                    ("It's up to you.", "あなた次第。"),
                    ("What are you up to?", "何してるの?")
                 ], ipa: "/ˈʌp tuː/"),
            make("demanding", "requiring much effort",
                 "要求の多い・大変な",
                 useCases: ["仕事や人が手のかかる状態を表すとき"],
                 examples: [
                    ("A demanding job.", "厳しい仕事。"),
                    ("She's very demanding.", "彼女は要求が多い。")
                 ], ipa: "/dɪmˈɑːndɪŋ/"),
            make("solid", "reliable; well-built; impressive",
                 "しっかりした・確かな・最高の",
                 useCases: ["信頼性や完成度を称えるとき"],
                 examples: [
                    ("A solid plan.", "しっかりした計画。"),
                    ("Solid work!", "いい仕事!")
                 ], ipa: "/sˈɒlɪd/"),
            make("sustainable", "able to be maintained",
                 "持続可能な",
                 useCases: ["環境・経営・習慣が長続きすることを表すとき"],
                 examples: [
                    ("Sustainable energy.", "持続可能なエネルギー。"),
                    ("Not sustainable.", "持続できない。")
                 ], ipa: "/səstˈeɪnəbəl/"),
            make("let sth go", "stop holding on to",
                 "(物事を)手放す・忘れる",
                 useCases: ["執着を手放したり許したりするとき"],
                 examples: [
                    ("Let it go.", "もう忘れて。"),
                    ("Hard to let it go.", "手放すのが難しい。")
                 ], ipa: "/lˈɛt sˈʌmθɪŋ ɡˈəʊ/"),
            make("native", "born in a place; one's first language",
                 "ネイティブの・生まれつきの",
                 useCases: ["出身や母語を表すとき"],
                 examples: [
                    ("Native speaker.", "ネイティブスピーカー。"),
                    ("Native to Japan.", "日本原産。")
                 ], ipa: "/nˈeɪtɪv/")
        ]
    }

    // MARK: - 概念・慣用句 (追加 5)

    private static var conceptPhrases19: [Word] {
        [
            make("nuance", "a subtle difference or shade of meaning",
                 "ニュアンス・微妙な違い",
                 useCases: ["細かい言葉や態度の差を表すとき"],
                 examples: [
                    ("Subtle nuance.", "微妙なニュアンス。"),
                    ("Lost in translation — nuances.", "翻訳で失われる微妙な差。")
                 ], ipa: "/njˈuːəns/"),
            make("interchangeable", "able to be used in place of each other",
                 "交換可能な・互いに置き換えられる",
                 useCases: ["2つの語や物が同じように使えるとき"],
                 examples: [
                    ("These words are interchangeable.", "これらの語は置き換え可能。"),
                    ("Interchangeable parts.", "互換性のある部品。")
                 ], ipa: "/ˌɪntətʃˈeɪndʒəbəl/"),
            make("pros and cons", "arguments for and against",
                 "長所と短所",
                 useCases: ["判断のため両面を比較するとき"],
                 examples: [
                    ("Weigh the pros and cons.", "長所と短所を比較する。"),
                    ("List the pros and cons.", "メリットとデメリットを列挙。")
                 ], ipa: "/pɹˈəʊz ænd kˈɒnz/"),
            make("make a difference", "have a significant effect",
                 "違いを生む・影響を与える",
                 useCases: ["行動が結果に影響することを強調するとき"],
                 examples: [
                    ("You can make a difference.", "あなたが変えられる。"),
                    ("It really made a difference.", "本当に違いを生んだ。")
                 ], ipa: "/mˌeɪk ɐ dˈɪfɹəns/"),
            make("haven't thought about", "haven't considered",
                 "考えてもみなかった",
                 useCases: ["想定外の話題について考えたことがないと答えるとき"],
                 examples: [
                    ("I haven't thought about it.", "考えたことなかった。"),
                    ("Haven't thought about that yet.", "まだ考えてない。")
                 ], ipa: "/hˈævənt θˈɔːt ɐbˈaʊt/")
        ]
    }

    // MARK: - 反応・特性 (追加 8)

    private static var reactionWords20: [Word] {
        [
            make("call out", "publicly criticize or point out",
                 "公然と指摘する・呼びかける",
                 useCases: ["誰かの問題行動を名指しで批判するとき"],
                 examples: [
                    ("Call out the hypocrisy.", "偽善を指摘する。"),
                    ("She called him out on it.", "彼女がそれを指摘した。")
                 ], ipa: "/kˈɔːl ˈaʊt/"),
            make("green flag", "a positive sign in a relationship",
                 "好材料・好印象のサイン",
                 useCases: ["red flag(危険信号)の反対、良い兆候を表すとき"],
                 examples: [
                    ("Big green flag!", "完全に好印象!"),
                    ("That's a green flag.", "それは良いサイン。")
                 ], ipa: "/ɡɹˈiːn flˈæɡ/"),
            make("goosebumps", "raised bumps on skin from emotion",
                 "鳥肌",
                 useCases: ["感動や恐怖などで肌が反応した時"],
                 examples: [
                    ("I got goosebumps.", "鳥肌立った。"),
                    ("Pure goosebumps moment.", "完全に鳥肌もの。")
                 ], ipa: "/ɡˈuːsbʌmps/"),
            make("ick", "a sudden feeling of repulsion",
                 "急に冷める感じ・キモい瞬間",
                 useCases: ["デート相手などに急に幻滅したときのZ世代スラング"],
                 examples: [
                    ("That gave me the ick.", "それで一気に冷めた。"),
                    ("Major ick.", "完全にキモい。")
                 ], ipa: "/ˈaɪk/"),
            make("soulmate", "a perfectly compatible partner",
                 "ソウルメイト・運命の人",
                 useCases: ["心から通じ合える相手を表すとき"],
                 examples: [
                    ("She's my soulmate.", "彼女は運命の人。"),
                    ("Looking for a soulmate.", "ソウルメイトを探してる。")
                 ], ipa: "/sˈəʊlmeɪt/"),
            make("brainrot", "low-quality content that dulls thinking",
                 "脳を腐らせるコンテンツ",
                 useCases: ["中毒性の低俗ネットコンテンツを表すZ世代用語"],
                 examples: [
                    ("Pure brainrot.", "完全に脳が腐る。"),
                    ("Stop watching brainrot.", "脳腐りコンテンツを見るのやめて。")
                 ], ipa: "/bɹˈeɪnɹɒt/"),
            make("nerd", "an enthusiast or studious person",
                 "オタク・勉強好き",
                 useCases: ["特定分野に熱中する人を表すとき(時に親愛・時に揶揄)"],
                 examples: [
                    ("Total nerd.", "完全にオタク。"),
                    ("Math nerd.", "数学オタク。")
                 ], ipa: "/nˈɜːd/"),
            make("point of view", "a particular perspective",
                 "視点・観点",
                 useCases: ["意見や見方の角度を述べるとき"],
                 examples: [
                    ("From my point of view, ~", "私の視点では〜"),
                    ("Different point of view.", "別の視点。")
                 ], ipa: "/pˈɔɪnt ɒv vjˈuː/")
        ]
    }

    // MARK: - メディア・市場・その他 (追加 8)

    private static var mediaAndOthers20: [Word] {
        [
            make("bull market", "a rising market",
                 "上昇相場・強気市場",
                 useCases: ["株価などが上がり続けている市況を表すとき"],
                 examples: [
                    ("We're in a bull market.", "強気相場だ。"),
                    ("Bull market rally.", "上昇相場のラリー。")
                 ], ipa: "/bˈʊl mˈɑːkɪt/"),
            make("dip", "a small drop in price or quantity",
                 "値下がり・浸ける",
                 useCases: ["株価や数値の一時的低下、または食べ物を浸す動作"],
                 examples: [
                    ("Buy the dip.", "値下がりで買え(投資用語)。"),
                    ("Dip it in sauce.", "ソースに浸して。")
                 ], ipa: "/dˈɪp/"),
            make("legacy media", "traditional news outlets",
                 "既存大手メディア",
                 useCases: ["新興ネットメディアと対比して旧来のテレビ・新聞を指すとき"],
                 examples: [
                    ("Don't trust legacy media.", "既存メディアを信じるな。"),
                    ("Legacy media is dying.", "オールドメディアは終わりつつある。")
                 ], ipa: "/lˈɛɡəsɪ mˈiːdiːɐ/"),
            make("free speech", "freedom of expression",
                 "言論の自由",
                 useCases: ["表現や発言の自由を語るとき"],
                 examples: [
                    ("Defend free speech.", "言論の自由を守れ。"),
                    ("Free speech matters.", "言論の自由は大事。")
                 ], ipa: "/fɹˈiː spˈiːtʃ/"),
            make("whip", "a fast strike or stir vigorously",
                 "鞭打つ・素早く混ぜる・(政党の)党鞭",
                 useCases: ["強く叩く・かき混ぜる動作、また政治の党議拘束役"],
                 examples: [
                    ("Whip the cream.", "クリームを泡立てる。"),
                    ("Party whip.", "党の党鞭(議員)。")
                 ], ipa: "/wˈɪp/"),
            make("blind", "unable to see; lacking perception",
                 "盲目の・見えない",
                 useCases: ["視覚障害、または比喩で偏った見方を表すとき"],
                 examples: [
                    ("Color blind.", "色盲。"),
                    ("Blind to the truth.", "真実に対して盲目。")
                 ], ipa: "/blˈaɪnd/"),
            make("spotlight", "intense focus or attention",
                 "脚光・スポットライト",
                 useCases: ["注目を浴びている状態を表すとき"],
                 examples: [
                    ("In the spotlight.", "脚光を浴びて。"),
                    ("Shine a spotlight on the issue.", "問題に光を当てる。")
                 ], ipa: "/spˈɒtlaɪt/"),
            make("insulate", "protect from heat, cold, or impact",
                 "断熱する・隔離する",
                 useCases: ["熱・寒さ・影響などから守るとき"],
                 examples: [
                    ("Insulate the house.", "家を断熱する。"),
                    ("Insulated from criticism.", "批判から守られている。")
                 ], ipa: "/ˈɪnsjuːlˌeɪt/")
        ]
    }

    // MARK: - 意見・反応 (追加 10)

    private static var opinionPhrases21: [Word] {
        [
            make("my point is that", "what I'm trying to say is",
                 "私が言いたいのは〜だ",
                 useCases: ["要点を改めて伝えるとき"],
                 examples: [
                    ("My point is that we need more time.", "私が言いたいのは時間が必要ってこと。"),
                    ("My point is, it's complicated.", "要するに複雑なんだ。")
                 ], ipa: "/maɪ pˈɔɪnt ɪz ðˈæt/"),
            make("a big fan of", "really enjoy or admire",
                 "〜の大ファン",
                 useCases: ["強い好みや支持を表すとき"],
                 examples: [
                    ("I'm a big fan of jazz.", "ジャズの大ファン。"),
                    ("Not a big fan of horror.", "ホラーはあまり好きじゃない。")
                 ], ipa: "/ɐ bˈɪɡ fˈæn ɒv/"),
            make("strongly believe", "have a firm conviction",
                 "強く信じる",
                 useCases: ["意見や信念を断固として表明するとき"],
                 examples: [
                    ("I strongly believe in this.", "これを強く信じている。"),
                    ("We strongly believe it works.", "うまくいくと強く信じている。")
                 ], ipa: "/stɹˈɒŋlɪ bɪlˈiːv/"),
            make("couldn't agree more", "completely agree",
                 "全く同感",
                 useCases: ["相手の意見に100%賛同するとき"],
                 examples: [
                    ("I couldn't agree more.", "全く同感。"),
                    ("Couldn't agree more on that.", "それは完全に同意。")
                 ], ipa: "/kˌʊdənt ɐɡɹˈiː mˈɔː/"),
            make("valid", "well-founded; reasonable",
                 "妥当な・正当な",
                 useCases: ["意見や懸念がもっともだと認めるとき"],
                 examples: [
                    ("That's a valid point.", "それは妥当な意見。"),
                    ("Your feelings are valid.", "君の気持ちは正当。")
                 ], ipa: "/vˈælɪd/"),
            make("be with you on sth", "agree with you about",
                 "(その件で)君に同意する",
                 useCases: ["相手の意見に共感を示すとき"],
                 examples: [
                    ("I'm with you on that.", "それに関しては同意。"),
                    ("Totally with you on this.", "それなら完全に賛成。")
                 ], ipa: "/biː wɪð juː ˌɒn sˈʌmθɪŋ/"),
            make("that figures", "that makes sense",
                 "やっぱりね・そうだろうな",
                 useCases: ["予想通りの結果に対する反応"],
                 examples: [
                    ("That figures!", "やっぱりね!"),
                    ("Late again? That figures.", "また遅刻?だろうね。")
                 ], ipa: "/ðæt fˈɪɡəz/"),
            make("can relate to", "be able to identify with",
                 "共感できる・同じ経験がある",
                 useCases: ["他人の状況や気持ちに共感するとき"],
                 examples: [
                    ("I can relate to that.", "それ分かるわ。"),
                    ("Can totally relate.", "めっちゃ共感。")
                 ], ipa: "/kæn ɹɪlˈeɪt tuː/"),
            make("moving forward", "from now on",
                 "今後は・これから",
                 useCases: ["今後の方針を述べる時のビジネス表現"],
                 examples: [
                    ("Moving forward, we'll be more careful.", "今後は気をつけます。"),
                    ("Moving forward with the plan.", "計画を進めていく。")
                 ], ipa: "/mˈuːvɪŋ fˈɔːwəd/"),
            make("before I forget", "while it's still on my mind",
                 "忘れないうちに",
                 useCases: ["重要なことを思い出して伝えるとき"],
                 examples: [
                    ("Before I forget, you owe me $10.", "忘れないうちに、10ドル貸してる。"),
                    ("Oh, before I forget, ~", "忘れないうちに〜")
                 ], ipa: "/bɪfˌɔːɹ aɪ fəɡˈɛt/")
        ]
    }

    // MARK: - 学習・分析 (追加 10)

    private static var learningPhrases21: [Word] {
        [
            make("slang", "informal language",
                 "スラング・俗語",
                 useCases: ["カジュアルな言い回しを話題にするとき"],
                 examples: [
                    ("Teen slang.", "若者スラング。"),
                    ("Internet slang.", "ネットスラング。")
                 ], ipa: "/slˈæŋ/"),
            make("term", "a word or expression for something specific",
                 "用語・言葉",
                 useCases: ["特定の言葉を話題にするとき"],
                 examples: [
                    ("Technical term.", "専門用語。"),
                    ("In simple terms, ~", "簡単に言うと〜")
                 ], ipa: "/tˈɜːm/"),
            make("literally means", "the literal meaning is",
                 "文字通りの意味は〜",
                 useCases: ["語源や直訳を説明するとき"],
                 examples: [
                    ("'Karoshi' literally means death from overwork.", "「過労死」は文字通り働きすぎによる死を意味する。"),
                    ("It literally means 'cherry blossom'.", "文字通り「桜」を意味する。")
                 ], ipa: "/lˈɪtəɹəlɪ mˈiːnz/"),
            make("master", "become highly skilled at",
                 "習得する・極める",
                 useCases: ["スキルや言語を完全に身につけるとき"],
                 examples: [
                    ("Master a new language.", "新しい言語を習得する。"),
                    ("Master the basics first.", "まず基礎を極めて。")
                 ], ipa: "/mˈɑːstɐ/"),
            make("differentiate", "distinguish between things",
                 "区別する・差別化する",
                 useCases: ["違いを明確にするとき"],
                 examples: [
                    ("Differentiate the two.", "2つを区別する。"),
                    ("Differentiate your brand.", "ブランドを差別化する。")
                 ], ipa: "/dˌɪfəɹˈɛnʃɪˌeɪt/"),
            make("tell apart", "distinguish between similar things",
                 "見分ける",
                 useCases: ["似たものの違いを見抜くとき"],
                 examples: [
                    ("I can't tell them apart.", "見分けがつかない。"),
                    ("Hard to tell apart.", "区別が難しい。")
                 ], ipa: "/tˈɛl ɐpˈɑːt/"),
            make("incorporate", "include as part of a whole",
                 "取り入れる・組み込む",
                 useCases: ["要素を全体に組み入れるとき"],
                 examples: [
                    ("Incorporate feedback.", "フィードバックを取り入れる。"),
                    ("Incorporate exercise into your day.", "日常に運動を組み込む。")
                 ], ipa: "/ɪŋkˈɔːpəɹˌeɪt/"),
            make("focus", "concentrate attention",
                 "集中する・焦点",
                 useCases: ["注意を集中するときや、ある一点を強調するとき"],
                 examples: [
                    ("Focus on the goal.", "目標に集中。"),
                    ("My main focus is health.", "私の最大の焦点は健康。")
                 ], ipa: "/fˈəʊkəs/"),
            make("track sth", "monitor or follow progress",
                 "追跡する・記録する",
                 useCases: ["進捗や数値を継続的に管理するとき"],
                 examples: [
                    ("Track your spending.", "支出を記録する。"),
                    ("Track the package.", "荷物を追跡する。")
                 ], ipa: "/tɹˈæk sˈʌmθɪŋ/"),
            make("progress", "forward movement; improvement",
                 "進捗・進歩",
                 useCases: ["前進や成長を表すとき"],
                 examples: [
                    ("Making progress.", "進展してる。"),
                    ("Track your progress.", "進捗を記録する。")
                 ], ipa: "/pɹˈəʊɡɹɛs/")
        ]
    }

    // MARK: - 動作・状態 (追加 11)

    private static var actionPhrases21: [Word] {
        [
            make("obstacle", "something that blocks progress",
                 "障害・障害物",
                 useCases: ["前進を妨げるものを表すとき"],
                 examples: [
                    ("Overcome obstacles.", "障害を乗り越える。"),
                    ("Major obstacle.", "大きな障害。")
                 ], ipa: "/ˈɒbstəkəl/"),
            make("step out", "leave briefly",
                 "ちょっと外す・出る",
                 useCases: ["短時間だけ場を離れるとき"],
                 examples: [
                    ("I need to step out for a sec.", "ちょっと席を外すね。"),
                    ("She stepped out for lunch.", "彼女は昼食に出てる。")
                 ], ipa: "/stˈɛp ˈaʊt/"),
            make("set sth", "place or arrange something",
                 "設置する・設定する",
                 useCases: ["物を置く、設定する動作を表すとき"],
                 examples: [
                    ("Set the table.", "テーブルセッティング。"),
                    ("Set a goal.", "目標を設定。")
                 ], ipa: "/sˈɛt sˈʌmθɪŋ/"),
            make("recharge", "restore energy or power",
                 "充電する・元気を取り戻す",
                 useCases: ["電子機器の充電や、人がリフレッシュするとき"],
                 examples: [
                    ("Recharge my phone.", "スマホを充電する。"),
                    ("I need to recharge.", "リフレッシュが必要。")
                 ], ipa: "/ɹɪtʃˈɑːdʒ/"),
            make("come across as", "give the impression of being",
                 "〜の印象を与える・〜のように見える",
                 useCases: ["人の振る舞いがどう映るかを語るとき"],
                 examples: [
                    ("He comes across as arrogant.", "彼は傲慢に見える。"),
                    ("She came across as friendly.", "彼女は親しみやすく見えた。")
                 ], ipa: "/kˈʌm əkɹˈɒs æz/"),
            make("keep up", "maintain the pace or continue",
                 "ついていく・続ける",
                 useCases: ["相手や状況に遅れずに進むとき"],
                 examples: [
                    ("Keep up the good work!", "その調子で頑張って!"),
                    ("Can't keep up.", "ついていけない。")
                 ], ipa: "/kˈiːp ˈʌp/"),
            make("move on to", "shift to the next thing",
                 "(次の話題などに)進む",
                 useCases: ["別の話題やタスクに移るとき"],
                 examples: [
                    ("Let's move on to the next topic.", "次の話題に移ろう。"),
                    ("Moving on to step 2.", "ステップ2に進む。")
                 ], ipa: "/mˈuːv ˈɒn tuː/"),
            make("vibrant", "full of energy and color",
                 "活気のある・鮮やかな",
                 useCases: ["街・色・雰囲気が生き生きしていることを表すとき"],
                 examples: [
                    ("A vibrant city.", "活気ある街。"),
                    ("Vibrant colors.", "鮮やかな色。")
                 ], ipa: "/vˈaɪbɹənt/"),
            make("sophisticated", "refined; complex",
                 "洗練された・高度な",
                 useCases: ["品の良さや高度さを表すとき"],
                 examples: [
                    ("A sophisticated design.", "洗練されたデザイン。"),
                    ("Sophisticated taste.", "洗練された趣味。")
                 ], ipa: "/səfˈɪstɪkˌeɪtɪd/"),
            make("break the ice", "ease initial awkwardness",
                 "場の緊張をほぐす",
                 useCases: ["初対面や気まずい場面で会話のきっかけを作るとき"],
                 examples: [
                    ("Break the ice with a joke.", "冗談で場を和ませる。"),
                    ("Who's going to break the ice?", "誰が口火を切る?")
                 ], ipa: "/bɹˈeɪk ðɪ ˈaɪs/"),
            make("blink", "open and shut eyes quickly",
                 "まばたきする",
                 useCases: ["目をパチパチさせる動作、または瞬く間の比喩"],
                 examples: [
                    ("Don't blink.", "瞬きしないで。"),
                    ("In the blink of an eye.", "あっという間に。")
                 ], ipa: "/blˈɪŋk/")
        ]
    }

    // MARK: - 経済・社会 (追加 10)

    private static var economySocial22: [Word] {
        [
            make("transit", "the act of being conveyed",
                 "輸送・通過・移動",
                 useCases: ["公共交通や物の運搬を表すとき"],
                 examples: [
                    ("Public transit.", "公共交通機関。"),
                    ("In transit.", "輸送中。")
                 ], ipa: "/tɹˈænsɪt/"),
            make("vicious cycle", "self-reinforcing harmful pattern",
                 "悪循環",
                 useCases: ["悪い状況が悪化を呼ぶ繰り返しを表すとき"],
                 examples: [
                    ("Break the vicious cycle.", "悪循環を断ち切る。"),
                    ("Stuck in a vicious cycle.", "悪循環から抜け出せない。")
                 ], ipa: "/vˈɪʃəs sˈaɪkəl/"),
            make("tipping point", "a critical moment of change",
                 "転換点・臨界点",
                 useCases: ["大きな変化が始まる瞬間を表すとき"],
                 examples: [
                    ("Reached the tipping point.", "臨界点に達した。"),
                    ("This is the tipping point.", "ここが転換点。")
                 ], ipa: "/tˈɪpɪŋ pˈɔɪnt/"),
            make("safety net", "a system that protects against loss",
                 "安全網・セーフティネット",
                 useCases: ["社会保障や保険のように万一に備える仕組み"],
                 examples: [
                    ("Social safety net.", "社会的セーフティネット。"),
                    ("A financial safety net.", "経済的な安全網。")
                 ], ipa: "/sˈeɪftɪ nˈɛt/"),
            make("disposable", "intended to be thrown away",
                 "使い捨ての・処分可能な",
                 useCases: ["一度使って捨てる物や、自由に使える資源を表すとき"],
                 examples: [
                    ("Disposable cups.", "使い捨てコップ。"),
                    ("Disposable income.", "可処分所得。")
                 ], ipa: "/dɪspˈəʊzəbəl/"),
            make("income", "money received from work or investments",
                 "収入・所得",
                 useCases: ["お金の受け取りを表すとき"],
                 examples: [
                    ("Monthly income.", "月収。"),
                    ("Increase your income.", "収入を増やす。")
                 ], ipa: "/ˈɪŋkʌm/"),
            make("gap", "an opening or disparity",
                 "隙間・格差・空白",
                 useCases: ["物理的な隙間や能力・収入の差を表すとき"],
                 examples: [
                    ("Income gap.", "所得格差。"),
                    ("Mind the gap.", "隙間にご注意(駅放送)。")
                 ], ipa: "/ɡˈæp/"),
            make("brain drain", "loss of talented people to other places",
                 "頭脳流出",
                 useCases: ["優秀人材が国外や別組織へ流れる現象を表すとき"],
                 examples: [
                    ("The brain drain to Silicon Valley.", "シリコンバレーへの頭脳流出。"),
                    ("Reverse the brain drain.", "頭脳流出を逆転させる。")
                 ], ipa: "/bɹˈeɪn dɹˈeɪn/"),
            make("burden", "a heavy load or responsibility",
                 "重荷・負担",
                 useCases: ["重い責任や心理的負担を表すとき"],
                 examples: [
                    ("A heavy burden.", "重い負担。"),
                    ("Don't burden yourself.", "自分を追い詰めないで。")
                 ], ipa: "/bˈɜːdən/"),
            make("gray area", "an unclear or ambiguous situation",
                 "グレーゾーン・曖昧な領域",
                 useCases: ["善悪や合法違法の境界が不明確な状況"],
                 examples: [
                    ("That's a gray area.", "それはグレーゾーン。"),
                    ("A legal gray area.", "法的なグレーゾーン。")
                 ], ipa: "/ɡɹˈeɪ ˈeəɹiə/")
        ]
    }

    // MARK: - ビジネス・取引用語 (追加 10)

    private static var businessTerms22: [Word] {
        [
            make("win-win", "beneficial for both sides",
                 "双方が得をする・ウィンウィン",
                 useCases: ["全員にとって有利な状況を表すとき"],
                 examples: [
                    ("A win-win situation.", "ウィンウィンの状況。"),
                    ("Let's make it win-win.", "双方が得する形にしよう。")
                 ], ipa: "/wˈɪnwˈɪn/"),
            make("gem", "something or someone of great value",
                 "宝石・隠れた逸品",
                 useCases: ["素晴らしい人や物、隠れた名作を表すとき"],
                 examples: [
                    ("A hidden gem.", "隠れた名所。"),
                    ("She's a real gem.", "彼女は本当に素晴らしい人。")
                 ], ipa: "/dʒˈɛm/"),
            make("gray out", "become temporarily disabled or faded",
                 "(画面が)グレーアウトする・一時的に意識が遠のく",
                 useCases: ["UIで無効化される、または立ちくらみの状態"],
                 examples: [
                    ("The button is grayed out.", "ボタンがグレーアウトしてる。"),
                    ("I grayed out for a moment.", "一瞬意識が遠のいた。")
                 ], ipa: "/ɡɹˈeɪ ˈaʊt/"),
            make("party", "a person or group in an agreement",
                 "当事者・関係者",
                 useCases: ["契約や訴訟の関係者を表すとき(法的・ビジネス用語)"],
                 examples: [
                    ("Third party.", "第三者。"),
                    ("Both parties agreed.", "両当事者が合意した。")
                 ], ipa: "/pˈɑːtɪ/"),
            make("out of pocket", "paying with one's own money",
                 "自腹で・連絡が取れない",
                 useCases: ["自費負担、または連絡不能な状態を表すとき"],
                 examples: [
                    ("Paid out of pocket.", "自腹で払った。"),
                    ("I'll be out of pocket today.", "今日は連絡取れない。")
                 ], ipa: "/ˌaʊtəv pˈɒkɪt/"),
            make("benchmark", "a standard to compare against",
                 "基準・指標・ベンチマーク",
                 useCases: ["比較のための標準を設定するとき"],
                 examples: [
                    ("Industry benchmark.", "業界基準。"),
                    ("Set a benchmark.", "基準を設定する。")
                 ], ipa: "/bˈɛntʃmɑːk/"),
            make("record", "a documented account or fastest result",
                 "記録・録音",
                 useCases: ["記録を保管・更新するとき、または録音するとき"],
                 examples: [
                    ("Break the record.", "記録を破る。"),
                    ("On the record.", "公式に。")
                 ], ipa: "/ɹˈɛkɔːd/"),
            make("incentive", "something that motivates action",
                 "誘因・インセンティブ",
                 useCases: ["動機付けや報酬を表すとき"],
                 examples: [
                    ("Financial incentive.", "金銭的インセンティブ。"),
                    ("Provide an incentive.", "誘因を提供する。")
                 ], ipa: "/ɪnsˈɛntɪv/"),
            make("asset", "a valuable thing or quality",
                 "資産・財産・強み",
                 useCases: ["お金や能力など価値のあるものを表すとき"],
                 examples: [
                    ("A valuable asset.", "貴重な資産。"),
                    ("She's an asset to the team.", "彼女はチームの財産。")
                 ], ipa: "/ˈæsɛt/"),
            make("liability", "a debt or burden",
                 "負債・厄介者",
                 useCases: ["金銭的負債や、足を引っ張る存在を表すとき"],
                 examples: [
                    ("Assets and liabilities.", "資産と負債。"),
                    ("He's a liability.", "彼はお荷物。")
                 ], ipa: "/lˌaɪəbˈɪlɪtɪ/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var actionVerbs22: [Word] {
        [
            make("lever", "use as leverage",
                 "てこ・梃子のように使う",
                 useCases: ["物理的なてこや影響力としての梃子を表すとき"],
                 examples: [
                    ("Pull the lever.", "レバーを引く。"),
                    ("Use it as a lever.", "梃子として使う。")
                 ], ipa: "/lˈiːvɐ/"),
            make("sweeten", "make more attractive",
                 "甘くする・(取引を)魅力的にする",
                 useCases: ["飲食物を甘くする、または取引条件を良くするとき"],
                 examples: [
                    ("Sweeten the deal.", "取引条件を良くする。"),
                    ("Sweeten my coffee.", "コーヒーを甘くする。")
                 ], ipa: "/swˈiːtən/"),
            make("string", "a series; a thin cord",
                 "ひも・連続・条件",
                 useCases: ["紐の意味、連続するもの、または「条件付き」の比喩"],
                 examples: [
                    ("A string of wins.", "連勝。"),
                    ("No strings attached.", "条件なし。")
                 ], ipa: "/stɹˈɪŋ/"),
            make("swindle", "cheat someone out of money",
                 "騙し取る・詐取する",
                 useCases: ["詐欺で金銭をだまし取るとき"],
                 examples: [
                    ("She was swindled.", "彼女は騙された。"),
                    ("A swindle of millions.", "数百万の詐欺。")
                 ], ipa: "/swˈɪndəl/"),
            make("balance sth", "keep in equilibrium",
                 "〜のバランスを取る",
                 useCases: ["時間・お金・物理的な釣り合いを保つとき"],
                 examples: [
                    ("Balance work and life.", "仕事と生活を両立。"),
                    ("Balance the books.", "帳簿を均衡させる。")
                 ], ipa: "/bˈæləns sˈʌmθɪŋ/"),
            make("conclude", "bring to an end; reach a decision",
                 "結論を出す・終結する",
                 useCases: ["話や調査を締めくくり、判断を下すとき"],
                 examples: [
                    ("Conclude the meeting.", "会議を締めくくる。"),
                    ("I conclude that ~", "〜と結論する。")
                 ], ipa: "/kəŋklˈuːd/"),
            make("compromise", "settle by mutual concession",
                 "妥協する・妥協案",
                 useCases: ["双方が譲り合って合意するとき"],
                 examples: [
                    ("Reach a compromise.", "妥協に達する。"),
                    ("Don't compromise on quality.", "品質では妥協するな。")
                 ], ipa: "/kˈɒmpɹəmˌaɪz/"),
            make("resort to", "use as a last option",
                 "(最後の手段として)頼る",
                 useCases: ["望ましくない手段に頼らざるを得ないとき"],
                 examples: [
                    ("Resort to violence.", "暴力に訴える。"),
                    ("Had to resort to begging.", "懇願に頼るしかなかった。")
                 ], ipa: "/ɹɪzˈɔːt tuː/"),
            make("plate", "a flat dish; a license plate",
                 "皿・ナンバープレート",
                 useCases: ["食器や車のナンバー、責任の量の比喩"],
                 examples: [
                    ("Clean your plate.", "皿をきれいに食べて。"),
                    ("A lot on my plate.", "やることが山積み。")
                 ], ipa: "/plˈeɪt/"),
            make("tag", "label or mark; identify in a post",
                 "タグ・(SNSで)タグ付けする",
                 useCases: ["値札やラベル、またはSNSで誰かを言及するとき"],
                 examples: [
                    ("Price tag.", "値札。"),
                    ("Tag me in the photo.", "写真にタグ付けして。")
                 ], ipa: "/tˈæɡ/")
        ]
    }

    // MARK: - 性格・状態・物 (追加 10)

    private static var characterStates22: [Word] {
        [
            make("nasty", "unpleasant; mean",
                 "不快な・意地悪な",
                 useCases: ["人や状況の嫌な性質を表すとき"],
                 examples: [
                    ("Nasty weather.", "嫌な天気。"),
                    ("Don't be nasty.", "意地悪しないで。")
                 ], ipa: "/nˈɑːstɪ/"),
            make("naughty", "mischievous; misbehaving",
                 "いたずらな・行儀の悪い",
                 useCases: ["子供のいたずら、または大人のいかがわしさを表すとき"],
                 examples: [
                    ("Naughty kids.", "いたずらっ子。"),
                    ("Naughty boy!", "悪い子!")
                 ], ipa: "/nˈɔːtɪ/"),
            make("gut", "the intestines; instinct",
                 "腸・本能・直感",
                 useCases: ["内臓を指す、または本能・度胸の比喩"],
                 examples: [
                    ("Trust your gut.", "直感を信じて。"),
                    ("Takes guts.", "度胸が要る。")
                 ], ipa: "/ɡˈʌt/"),
            make("thumb", "the short thick finger",
                 "親指",
                 useCases: ["親指、または「経験則」のような比喩"],
                 examples: [
                    ("Thumbs up!", "親指立てて(いいね)!"),
                    ("Rule of thumb.", "経験則。")
                 ], ipa: "/θˈʌm/"),
            make("comfort food", "food that gives emotional comfort",
                 "心が落ち着く食べ物",
                 useCases: ["懐かしくて気持ちが安らぐ料理を表すとき"],
                 examples: [
                    ("Ramen is my comfort food.", "ラーメンは私のソウルフード。"),
                    ("Need some comfort food.", "癒し系の食事が欲しい。")
                 ], ipa: "/kˈʌmfət fˈuːd/"),
            make("work in progress", "something still being developed",
                 "進行中・未完成",
                 useCases: ["完成していない作業や自己改善を表すとき"],
                 examples: [
                    ("It's a work in progress.", "まだ作業中。"),
                    ("I'm a work in progress.", "私は成長途中。")
                 ], ipa: "/wˈɜːk ɪn pɹˈəʊɡɹɛs/"),
            make("uphill", "going up a slope; difficult",
                 "上り坂の・困難な",
                 useCases: ["物理的な上り坂や、苦戦している状況を表すとき"],
                 examples: [
                    ("An uphill battle.", "苦戦・困難な戦い。"),
                    ("Uphill climb.", "上り坂。")
                 ], ipa: "/ʌphˈɪl/"),
            make("battle", "a fight or struggle",
                 "戦い・闘争",
                 useCases: ["物理的な戦闘や、困難との奮闘を表すとき"],
                 examples: [
                    ("Battle for survival.", "生存をかけた戦い。"),
                    ("An uphill battle.", "困難な戦い。")
                 ], ipa: "/bˈætəl/"),
            make("cushion", "a soft pad; to soften impact",
                 "クッション・衝撃を和らげる",
                 useCases: ["物理的クッション、または衝撃緩和の比喩"],
                 examples: [
                    ("Sit on the cushion.", "クッションに座って。"),
                    ("Cushion the blow.", "衝撃を和らげる。")
                 ], ipa: "/kˈʊʃən/"),
            make("wheel", "a circular object that turns",
                 "車輪・ハンドル",
                 useCases: ["車輪や運転席のハンドルを表すとき"],
                 examples: [
                    ("Behind the wheel.", "ハンドルを握って。"),
                    ("Reinvent the wheel.", "車輪の再発明をする(無駄な努力)。")
                 ], ipa: "/wˈiːl/")
        ]
    }

    // MARK: - 評価・メディア・その他 (追加 10)

    private static var evaluationMedia22: [Word] {
        [
            make("masterpiece", "an outstanding work of art",
                 "傑作",
                 useCases: ["最高峰の作品を称えるとき"],
                 examples: [
                    ("A literary masterpiece.", "文学の傑作。"),
                    ("This film is a masterpiece.", "この映画は傑作。")
                 ], ipa: "/mˈɑːstəpˌiːs/"),
            make("page turner", "a very engaging book",
                 "読みだしたら止まらない本",
                 useCases: ["夢中になって読んでしまう小説などを表すとき"],
                 examples: [
                    ("A real page turner.", "本当のページターナー。"),
                    ("This novel is a page turner.", "この小説は止まらない。")
                 ], ipa: "/pˈeɪdʒ tˈɜːnɐ/"),
            make("flop", "a complete failure",
                 "大失敗・コケる",
                 useCases: ["映画や商品が興行・売上で失敗したとき"],
                 examples: [
                    ("Box office flop.", "興行的大コケ。"),
                    ("The launch was a flop.", "ローンチは失敗。")
                 ], ipa: "/flˈɒp/"),
            make("overrated", "rated more highly than deserved",
                 "過大評価された",
                 useCases: ["評判ほど良くないと感じるものを表すとき"],
                 examples: [
                    ("Overrated movie.", "過大評価の映画。"),
                    ("Honestly, overrated.", "正直、過大評価。")
                 ], ipa: "/ˌəʊvəɹˈeɪtɪd/"),
            make("cult", "a small devoted following",
                 "カルト的な・熱狂的支持",
                 useCases: ["熱狂的なファンの少ない集団を表すとき"],
                 examples: [
                    ("Cult classic.", "カルト的名作。"),
                    ("Has a cult following.", "熱狂的ファンを持つ。")
                 ], ipa: "/kˈʌlt/"),
            make("classic", "a timeless example of excellence",
                 "古典・定番・典型的な",
                 useCases: ["時代を超えて愛される作品や物を表すとき"],
                 examples: [
                    ("A classic film.", "定番映画。"),
                    ("Classic mistake.", "典型的なミス。")
                 ], ipa: "/klˈæsɪk/"),
            make("discrepancy", "an inconsistency",
                 "食い違い・不一致",
                 useCases: ["データや証言の不整合を表すとき"],
                 examples: [
                    ("A discrepancy in the data.", "データの不一致。"),
                    ("Explain the discrepancy.", "食い違いを説明して。")
                 ], ipa: "/dɪskɹˈɛpənsɪ/"),
            make("prerequisite", "something required beforehand",
                 "前提条件・必須要件",
                 useCases: ["何かを始める前に必要な条件を表すとき"],
                 examples: [
                    ("Math is a prerequisite.", "数学が必須。"),
                    ("Meet the prerequisites.", "前提条件を満たす。")
                 ], ipa: "/pɹˌiːɹˈɛkwɪsˌɪt/"),
            make("last resort", "a final option",
                 "最後の手段",
                 useCases: ["他の選択肢が尽きた時の最後の選択肢"],
                 examples: [
                    ("As a last resort.", "最後の手段として。"),
                    ("Surgery is the last resort.", "手術は最終手段。")
                 ], ipa: "/lˈɑːst ɹɪzˈɔːt/"),
            make("catalyst", "something that triggers change",
                 "触媒・きっかけ",
                 useCases: ["変化や事件のきっかけを表すとき"],
                 examples: [
                    ("A catalyst for change.", "変化のきっかけ。"),
                    ("The event was the catalyst.", "あの出来事が触媒となった。")
                 ], ipa: "/kˈætɐlˌɪst/")
        ]
    }

    // MARK: - 性格・タイプ (追加 9)

    private static var personalityTypes23: [Word] {
        [
            make("warm heart", "a kind and caring nature",
                 "温かい心",
                 useCases: ["優しく思いやりのある性格を表すとき"],
                 examples: [
                    ("She has a warm heart.", "彼女は温かい心の持ち主。"),
                    ("A warm-hearted person.", "心の温かい人。")
                 ], ipa: "/wˈɔːm hˈɑːt/"),
            make("early bird", "a person who gets up early",
                 "早起きの人",
                 useCases: ["朝型の人を表すとき"],
                 examples: [
                    ("I'm an early bird.", "私は朝型。"),
                    ("Early bird catches the worm.", "早起きは三文の徳。")
                 ], ipa: "/ˈɜːlɪ bˈɜːd/"),
            make("night owl", "a person who stays up late",
                 "夜型の人",
                 useCases: ["夜遅くまで起きている人を表すとき"],
                 examples: [
                    ("I'm a night owl.", "私は夜型。"),
                    ("Night owls work better at night.", "夜型は夜に冴える。")
                 ], ipa: "/nˈaɪt ˈaʊl/"),
            make("homebody", "a person who prefers being at home",
                 "インドア派",
                 useCases: ["外出より家にいるのが好きな人を表すとき"],
                 examples: [
                    ("I'm a total homebody.", "完全なインドア派。"),
                    ("She's a homebody.", "彼女は家にいるのが好き。")
                 ], ipa: "/hˈəʊmbɒdɪ/"),
            make("backseat", "a non-driver who tells the driver what to do",
                 "後部座席・口出しする人",
                 useCases: ["物理的な後ろの席や、口出しばかりする態度"],
                 examples: [
                    ("Sit in the backseat.", "後部座席に座って。"),
                    ("Don't be a backseat driver.", "口出しドライバーやめて。")
                 ], ipa: "/bˈæksiːt/"),
            make("overthink", "think about too much",
                 "考えすぎる",
                 useCases: ["些細なことを延々と考えてしまうとき"],
                 examples: [
                    ("Don't overthink it.", "考えすぎないで。"),
                    ("I tend to overthink.", "考えすぎる癖がある。")
                 ], ipa: "/ˌəʊvəθˈɪŋk/"),
            make("copycat", "a person who imitates others",
                 "真似ばかりする人",
                 useCases: ["他人の真似をする人を批判するとき"],
                 examples: [
                    ("Stop being a copycat.", "真似ばかりしないで。"),
                    ("That's a copycat product.", "それは模倣品。")
                 ], ipa: "/kˈɒpɪkˌæt/"),
            make("blood", "the red liquid; family lineage",
                 "血・血筋",
                 useCases: ["身体の血液、または家系・気質の比喩"],
                 examples: [
                    ("It's in my blood.", "血に流れてる。"),
                    ("Blood is thicker than water.", "血は水よりも濃い。")
                 ], ipa: "/blˈʌd/"),
            make("alien", "a foreigner; from another planet",
                 "外国人・宇宙人・異質な",
                 useCases: ["異質なものや宇宙人を表すとき"],
                 examples: [
                    ("Alien concept.", "馴染みのない概念。"),
                    ("Resident alien.", "在留外国人(法律用語)。")
                 ], ipa: "/ˈeɪliən/")
        ]
    }

    // MARK: - 計画・思考 (追加 9)

    private static var planningThoughts23: [Word] {
        [
            make("game plan", "a strategy for achieving a goal",
                 "作戦・戦略",
                 useCases: ["目標達成のための計画を話すとき"],
                 examples: [
                    ("What's the game plan?", "作戦は?"),
                    ("Stick to the game plan.", "計画通りに行こう。")
                 ], ipa: "/ɡˈeɪm plˈæn/"),
            make("backlog", "a build-up of unfinished work",
                 "未処理の山・バックログ",
                 useCases: ["溜まった仕事やタスクを表すとき"],
                 examples: [
                    ("Clear the backlog.", "未処理を片付ける。"),
                    ("Big backlog of emails.", "メールが大量に未処理。")
                 ], ipa: "/bˈæklɒɡ/"),
            make("second opinion", "another expert's view",
                 "別の専門家の意見",
                 useCases: ["医療やビジネスで別の見解を求めるとき"],
                 examples: [
                    ("Get a second opinion.", "セカンドオピニオンをもらう。"),
                    ("I'd like a second opinion.", "別の意見も聞きたい。")
                 ], ipa: "/sˈɛkənd əpˈɪniən/"),
            make("afterthought", "an idea added later",
                 "後付け・思い付き",
                 useCases: ["主な計画の後で付け加えたものを表すとき"],
                 examples: [
                    ("Just an afterthought.", "単なる後付け。"),
                    ("Added as an afterthought.", "思い付きで追加。")
                 ], ipa: "/ˈɑːftəθˌɔːt/"),
            make("brainwave", "a sudden bright idea",
                 "ひらめき・名案",
                 useCases: ["突然いいアイデアが浮かんだとき"],
                 examples: [
                    ("I had a brainwave!", "ひらめいた!"),
                    ("Great brainwave.", "素晴らしい名案。")
                 ], ipa: "/bɹˈeɪnweɪv/"),
            make("paralysis", "inability to act or decide",
                 "麻痺・決断不能",
                 useCases: ["身体や思考が動けない状態を表すとき"],
                 examples: [
                    ("Analysis paralysis.", "分析しすぎて動けない状態。"),
                    ("Temporary paralysis.", "一時的な麻痺。")
                 ], ipa: "/pəɹˈæləsˌɪs/"),
            make("brain fog", "mental cloudiness",
                 "頭がぼーっとする・思考の靄",
                 useCases: ["集中できない・考えがまとまらない状態"],
                 examples: [
                    ("Bad brain fog today.", "今日は頭がぼーっとする。"),
                    ("Brain fog from lack of sleep.", "睡眠不足で思考が霧。")
                 ], ipa: "/bɹˈeɪn fˈɒɡ/"),
            make("mental block", "inability to think or remember",
                 "思考停止・思い出せない状態",
                 useCases: ["何も思い浮かばない状態を表すとき"],
                 examples: [
                    ("I have a mental block.", "頭が真っ白。"),
                    ("Hit a mental block.", "思考停止に陥った。")
                 ], ipa: "/mˈɛntəl blˈɒk/"),
            make("sort out", "organize or resolve",
                 "整理する・解決する",
                 useCases: ["物事を整理したり問題を片付けるとき"],
                 examples: [
                    ("Sort out the papers.", "書類を整理する。"),
                    ("Let's sort this out.", "これを解決しよう。")
                 ], ipa: "/sˈɔːt ˈaʊt/")
        ]
    }

    // MARK: - 動詞・物 (追加 9)

    private static var actionObjects23: [Word] {
        [
            make("hidden", "concealed; not visible",
                 "隠された",
                 useCases: ["見えないところにあるものを表すとき"],
                 examples: [
                    ("Hidden gem.", "隠れた逸品。"),
                    ("Hidden meaning.", "隠された意味。")
                 ], ipa: "/hˈɪdən/"),
            make("hide", "conceal from view",
                 "隠す・隠れる",
                 useCases: ["物理的または感情的に隠す動作"],
                 examples: [
                    ("Hide and seek.", "かくれんぼ。"),
                    ("Don't hide your feelings.", "気持ちを隠さないで。")
                 ], ipa: "/hˈaɪd/"),
            make("steal", "take without permission",
                 "盗む・こっそり取る",
                 useCases: ["物理的な窃盗、または比喩的な「奪う」"],
                 examples: [
                    ("Don't steal!", "盗むな!"),
                    ("Steal the show.", "場をさらう。")
                 ], ipa: "/stˈiːl/"),
            make("flush", "redden; clean with water",
                 "(顔が)赤くなる・水で流す",
                 useCases: ["顔が紅潮する、またはトイレを流すなど"],
                 examples: [
                    ("Flush the toilet.", "トイレを流して。"),
                    ("Flush with embarrassment.", "恥ずかしさで赤面。")
                 ], ipa: "/flˈʌʃ/"),
            make("sock", "a foot covering",
                 "靴下",
                 useCases: ["足を保護する衣類を表すとき"],
                 examples: [
                    ("Put on your socks.", "靴下を履いて。"),
                    ("A pair of socks.", "靴下一足。")
                 ], ipa: "/sˈɒk/"),
            make("spray", "a fine mist of liquid",
                 "スプレー・噴霧する",
                 useCases: ["液体を細かく噴き出すとき"],
                 examples: [
                    ("Spray bottle.", "スプレーボトル。"),
                    ("Spray the plants.", "植物に水を吹きかけて。")
                 ], ipa: "/spɹˈeɪ/"),
            make("shortcoming", "a weakness or fault",
                 "欠点・短所",
                 useCases: ["人や物の弱点を表すとき"],
                 examples: [
                    ("Admit your shortcomings.", "短所を認めて。"),
                    ("Despite his shortcomings.", "彼の欠点にもかかわらず。")
                 ], ipa: "/ʃˈɔːtkʌmɪŋ/"),
            make("oppression", "prolonged cruel treatment",
                 "抑圧・圧政",
                 useCases: ["権力による不当な支配を表すとき"],
                 examples: [
                    ("Fight oppression.", "抑圧と戦う。"),
                    ("Under oppression.", "圧政下で。")
                 ], ipa: "/əpɹˈɛʃən/"),
            make("nest egg", "savings set aside for the future",
                 "蓄え・へそくり",
                 useCases: ["将来のために貯めたお金を表すとき"],
                 examples: [
                    ("Build a nest egg.", "蓄えを作る。"),
                    ("My retirement nest egg.", "老後の資金。")
                 ], ipa: "/nˈɛst ˈɛɡ/")
        ]
    }

    // MARK: - 概念・状態 (追加 9)

    private static var conceptsStates23: [Word] {
        [
            make("please", "make happy; (polite request)",
                 "喜ばせる・どうぞ",
                 useCases: ["相手を喜ばせる動詞、または丁寧な依頼の副詞"],
                 examples: [
                    ("Please help me.", "助けてください。"),
                    ("Eager to please.", "喜ばせたい一心で。")
                 ], ipa: "/plˈiːz/"),
            make("pleasure", "a feeling of happy satisfaction",
                 "喜び・楽しみ",
                 useCases: ["楽しみや満足感を表すとき"],
                 examples: [
                    ("My pleasure!", "どういたしまして!"),
                    ("Pure pleasure.", "純粋な喜び。")
                 ], ipa: "/plˈɛʒɐ/"),
            make("communal", "shared by a community",
                 "共同の・共有の",
                 useCases: ["共同体やシェアの状態を表すとき"],
                 examples: [
                    ("Communal kitchen.", "共有キッチン。"),
                    ("Communal living.", "共同生活。")
                 ], ipa: "/kəmjˈuːnəl/"),
            make("ending", "the final part",
                 "結末・エンディング",
                 useCases: ["話や物事の終わりを表すとき"],
                 examples: [
                    ("Happy ending.", "ハッピーエンド。"),
                    ("The ending was sad.", "結末は悲しかった。")
                 ], ipa: "/ˈɛndɪŋ/"),
            make("entertain", "amuse; consider an idea",
                 "楽しませる・(案を)検討する",
                 useCases: ["人を楽しませる、または考えを巡らすとき"],
                 examples: [
                    ("Entertain the guests.", "客をもてなす。"),
                    ("Entertain the idea.", "アイデアを検討する。")
                 ], ipa: "/ˌɛntətˈeɪn/"),
            make("under control", "being managed properly",
                 "管理下にある・コントロールできている",
                 useCases: ["状況が制御されていることを伝えるとき"],
                 examples: [
                    ("Everything's under control.", "全部コントロール内。"),
                    ("Keep it under control.", "制御を保って。")
                 ], ipa: "/ˌʌndɐ kəntɹˈəʊl/"),
            make("aside", "to one side; apart from",
                 "脇に・別として",
                 useCases: ["脇へ寄せる、または「冗談はさておき」のように"],
                 examples: [
                    ("Step aside.", "脇に寄って。"),
                    ("Joking aside, ~", "冗談はさておき〜")
                 ], ipa: "/ɐsˈaɪd/"),
            make("gratitude", "a feeling of thankfulness",
                 "感謝の気持ち",
                 useCases: ["心からの感謝を表すとき"],
                 examples: [
                    ("Express gratitude.", "感謝を表す。"),
                    ("Deep gratitude.", "深い感謝。")
                 ], ipa: "/ɡɹˈætɪtjˌuːd/"),
            make("hint", "a slight indication",
                 "ヒント・ほのめかし",
                 useCases: ["微妙に示唆する、または手がかりを与えるとき"],
                 examples: [
                    ("Give me a hint.", "ヒントちょうだい。"),
                    ("A subtle hint.", "それとなくほのめかす。")
                 ], ipa: "/hˈɪnt/")
        ]
    }

    // MARK: - 法律・社会 (追加 10)

    private static var legalSocial24: [Word] {
        [
            make("compensation", "payment for loss or damages",
                 "補償・賠償金",
                 useCases: ["損害や努力に対する金銭的見返りを表すとき"],
                 examples: [
                    ("Compensation package.", "報酬パッケージ。"),
                    ("Demand compensation.", "賠償を求める。")
                 ], ipa: "/kˌɒmpənsˈeɪʃən/"),
            make("lock down", "restrict movement strictly",
                 "封鎖する・ロックダウン",
                 useCases: ["施設や地域への出入り制限を表すとき"],
                 examples: [
                    ("The city is on lock down.", "街はロックダウン中。"),
                    ("Lock down the building.", "建物を封鎖する。")
                 ], ipa: "/lˈɒk dˈaʊn/"),
            make("deport", "expel from a country",
                 "国外追放する",
                 useCases: ["不法移民や違反者を国外退去させるとき"],
                 examples: [
                    ("Deport illegal immigrants.", "不法移民を国外退去。"),
                    ("Risk of being deported.", "国外追放のリスク。")
                 ], ipa: "/dɪpˈɔːt/"),
            make("citizen", "a legally recognized national",
                 "市民・国民",
                 useCases: ["国家の構成員を表すとき"],
                 examples: [
                    ("Japanese citizen.", "日本国民。"),
                    ("Citizens' rights.", "市民の権利。")
                 ], ipa: "/sˈɪtɪzən/"),
            make("discrimination", "unfair treatment based on category",
                 "差別",
                 useCases: ["性別・人種などによる不当な扱いを表すとき"],
                 examples: [
                    ("Racial discrimination.", "人種差別。"),
                    ("Fight discrimination.", "差別と戦う。")
                 ], ipa: "/dɪskɹˌɪmɪnˈeɪʃən/"),
            make("agency", "an organization or office",
                 "代理店・機関",
                 useCases: ["特定の業務を担う組織を表すとき"],
                 examples: [
                    ("Travel agency.", "旅行代理店。"),
                    ("Government agency.", "政府機関。")
                 ], ipa: "/ˈeɪdʒənsɪ/"),
            make("confirm", "verify or make certain",
                 "確認する・確定する",
                 useCases: ["情報や予約の正しさを確かめるとき"],
                 examples: [
                    ("Please confirm your reservation.", "予約をご確認ください。"),
                    ("Confirmed!", "確認済み!")
                 ], ipa: "/kənfˈɜːm/"),
            make("enemy", "a hostile opponent",
                 "敵",
                 useCases: ["敵対する相手を表すとき"],
                 examples: [
                    ("Make an enemy.", "敵を作る。"),
                    ("Public enemy.", "公敵。")
                 ], ipa: "/ˈɛnəmɪ/"),
            make("dismantle", "take apart or abolish",
                 "解体する・廃止する",
                 useCases: ["機械や組織を分解・廃止するとき"],
                 examples: [
                    ("Dismantle the system.", "システムを解体する。"),
                    ("Dismantle the machine.", "機械を分解する。")
                 ], ipa: "/dɪsmˈɑːntəl/"),
            make("adopt sth", "take up or formally accept",
                 "(方針などを)採用する・養子にする",
                 useCases: ["方針・習慣・子供などを正式に受け入れるとき"],
                 examples: [
                    ("Adopt a new policy.", "新方針を採用。"),
                    ("Adopt a child.", "子供を養子にする。")
                 ], ipa: "/ɐdˈɒpt sˈʌmθɪŋ/")
        ]
    }

    // MARK: - 性質・動詞 (追加 10)

    private static var qualityVerbs24: [Word] {
        [
            make("stupid", "lacking intelligence; foolish",
                 "馬鹿な・愚かな",
                 useCases: ["賢くない行動や判断を批判するとき(やや強い)"],
                 examples: [
                    ("That's stupid.", "それは馬鹿げてる。"),
                    ("Stupid idea.", "バカな案。")
                 ], ipa: "/stjˈuːpɪd/"),
            make("pointless", "having no purpose",
                 "無意味な",
                 useCases: ["無駄な努力や議論を表すとき"],
                 examples: [
                    ("It's pointless.", "意味がない。"),
                    ("A pointless argument.", "無意味な議論。")
                 ], ipa: "/pˈɔɪntləs/"),
            make("profession", "a paid occupation requiring training",
                 "職業・専門職",
                 useCases: ["専門知識を要する仕事を表すとき"],
                 examples: [
                    ("What's your profession?", "ご職業は?"),
                    ("Teaching profession.", "教職。")
                 ], ipa: "/pɹəfˈɛʃən/"),
            make("intention", "an aim or plan",
                 "意図・目的",
                 useCases: ["何かをするつもりを表すとき"],
                 examples: [
                    ("Good intentions.", "良い意図。"),
                    ("I have no intention of leaving.", "辞める気はない。")
                 ], ipa: "/ɪntˈɛnʃən/"),
            make("disappear", "stop being visible",
                 "消える・姿を消す",
                 useCases: ["物や人がいなくなるとき"],
                 examples: [
                    ("It disappeared!", "消えた!"),
                    ("She just disappeared.", "彼女は突然いなくなった。")
                 ], ipa: "/dˌɪsɐpˈiə/"),
            make("cosmetic", "relating to appearance; superficial",
                 "化粧の・表面的な",
                 useCases: ["美容関連、または見せかけだけの変更を表すとき"],
                 examples: [
                    ("Cosmetic surgery.", "美容整形。"),
                    ("Just cosmetic changes.", "表面的な変更のみ。")
                 ], ipa: "/kɒzmˈɛtɪk/"),
            make("remarkably", "in a striking way",
                 "驚くほど・目立って",
                 useCases: ["際立った特徴を強調するとき"],
                 examples: [
                    ("Remarkably similar.", "驚くほど似てる。"),
                    ("Remarkably well.", "目覚ましく上手。")
                 ], ipa: "/ɹɪmˈɑːkəblɪ/"),
            make("rise", "go up; increase",
                 "上がる・上昇",
                 useCases: ["価格・温度・人気などが上がるとき、または日の出"],
                 examples: [
                    ("Prices rise.", "値段が上がる。"),
                    ("The sun rises.", "日が昇る。")
                 ], ipa: "/ɹˈaɪz/"),
            make("charming", "delightfully attractive",
                 "魅力的な",
                 useCases: ["人や場所の魅力を褒めるとき"],
                 examples: [
                    ("A charming village.", "魅力的な村。"),
                    ("He's so charming.", "彼は魅力的。")
                 ], ipa: "/tʃˈɑːmɪŋ/"),
            make("stalk", "follow secretly; pursue obsessively",
                 "つけ回す・ストーキングする",
                 useCases: ["人をひそかに追跡する不健全な行動"],
                 examples: [
                    ("Stop stalking me.", "つけ回さないで。"),
                    ("She felt stalked.", "つけ回されていると感じた。")
                 ], ipa: "/stˈɔːk/")
        ]
    }

    // MARK: - 感情・心境 (追加 9)

    private static var emotionMood25: [Word] {
        [
            make("cozy", "warm and comfortable",
                 "居心地のいい・ぬくぬくした",
                 useCases: ["温かくくつろげる雰囲気を表すとき"],
                 examples: [
                    ("A cozy cafe.", "居心地のいいカフェ。"),
                    ("Get cozy.", "ゆっくりくつろいで。")
                 ], ipa: "/kˈəʊzɪ/"),
            make("nostalgia", "sentimental longing for the past",
                 "ノスタルジア・懐かしさ",
                 useCases: ["昔を思い出す感傷的な気持ちを表すとき"],
                 examples: [
                    ("A wave of nostalgia.", "懐かしさの波。"),
                    ("Pure nostalgia.", "純粋な郷愁。")
                 ], ipa: "/nəstˈældʒɐ/"),
            make("in tears", "crying",
                 "泣いている",
                 useCases: ["涙を流している状態を表すとき"],
                 examples: [
                    ("She was in tears.", "彼女は泣いていた。"),
                    ("Left them in tears.", "彼らを泣かせた。")
                 ], ipa: "/ɪn tˈiəz/"),
            make("magical", "wonderfully enchanting",
                 "魔法のような・素晴らしい",
                 useCases: ["うっとりするほど素敵な瞬間を表すとき"],
                 examples: [
                    ("A magical moment.", "魔法のような瞬間。"),
                    ("It felt magical.", "魔法のようだった。")
                 ], ipa: "/mˈædʒɪkəl/"),
            make("thankful", "grateful",
                 "感謝している",
                 useCases: ["感謝の気持ちを表すとき"],
                 examples: [
                    ("I'm thankful for you.", "君に感謝してる。"),
                    ("Be thankful.", "感謝の気持ちを忘れずに。")
                 ], ipa: "/θˈæŋkfəl/"),
            make("mentally", "in terms of the mind",
                 "精神的に",
                 useCases: ["心の状態や準備について話すとき"],
                 examples: [
                    ("Mentally exhausted.", "精神的に疲れた。"),
                    ("Mentally prepared.", "心の準備ができている。")
                 ], ipa: "/mˈɛntəlɪ/"),
            make("prepared", "ready in advance",
                 "準備された",
                 useCases: ["事前準備ができている状態を表すとき"],
                 examples: [
                    ("Always be prepared.", "常に備えあれ。"),
                    ("I'm well prepared.", "しっかり準備できてる。")
                 ], ipa: "/pɹɪpˈeəd/"),
            make("good old days", "the past remembered fondly",
                 "懐かしい古き良き時代",
                 useCases: ["楽しかった昔を懐かしむとき"],
                 examples: [
                    ("The good old days.", "古き良き時代。"),
                    ("Miss the good old days.", "あの頃が懐かしい。")
                 ], ipa: "/ɡˈʊd ˈəʊld dˈeɪz/"),
            make("bless my ears", "what a wonderful sound to hear",
                 "耳に心地いい・なんと嬉しい言葉",
                 useCases: ["心地よい音や嬉しい言葉に感動するとき"],
                 examples: [
                    ("Bless my ears!", "なんと嬉しい音!"),
                    ("That voice blesses my ears.", "あの声が耳に心地いい。")
                 ], ipa: "/blˈɛs maɪ ˈiəz/")
        ]
    }

    // MARK: - 動詞・動作 (追加 9)

    private static var actionMotion25: [Word] {
        [
            make("calm sb", "make someone less anxious",
                 "〜を落ち着かせる",
                 useCases: ["興奮や不安を鎮めるとき"],
                 examples: [
                    ("Calm her down.", "彼女を落ち着かせて。"),
                    ("Try to calm me.", "私を落ち着かせようとして。")
                 ], ipa: "/kˈɑːm sˈʌmbɒdɪ/"),
            make("break into pieces", "shatter into fragments",
                 "粉々に砕ける・壊れる",
                 useCases: ["物理的にも比喩的にも粉々に砕ける状況"],
                 examples: [
                    ("It broke into pieces.", "粉々になった。"),
                    ("My heart broke into pieces.", "心がバラバラになった。")
                 ], ipa: "/bɹˈeɪk ˌɪntʊ pˈiːsɪz/"),
            make("tear down", "demolish",
                 "取り壊す・打ち砕く",
                 useCases: ["建物や信念を破壊するとき"],
                 examples: [
                    ("Tear down the wall.", "壁を取り壊す。"),
                    ("Tear down barriers.", "壁を打ち壊す。")
                 ], ipa: "/tˈiə dˈaʊn/"),
            make("all-nighter", "stay up all night",
                 "徹夜",
                 useCases: ["一晩中起きて勉強や仕事をしたとき"],
                 examples: [
                    ("Pulled an all-nighter.", "徹夜した。"),
                    ("Need an all-nighter.", "徹夜が必要。")
                 ], ipa: "/ˈɔːlnˈaɪtɐ/"),
            make("relieve", "ease pain or stress",
                 "和らげる・軽減する",
                 useCases: ["痛み・ストレス・負担を減らすとき"],
                 examples: [
                    ("Relieve stress.", "ストレスを和らげる。"),
                    ("Relieve the pressure.", "プレッシャーを軽減。")
                 ], ipa: "/ɹɪlˈiːv/"),
            make("trigger", "cause a reaction",
                 "引き金になる・誘発する",
                 useCases: ["反応・感情・記憶などを引き起こすとき"],
                 examples: [
                    ("Trigger memories.", "記憶を呼び起こす。"),
                    ("Pull the trigger.", "引き金を引く。")
                 ], ipa: "/tɹˈɪɡɐ/"),
            make("die at peace", "pass away peacefully",
                 "安らかに死ぬ",
                 useCases: ["穏やかな最期を表すとき"],
                 examples: [
                    ("She died at peace.", "彼女は安らかに亡くなった。"),
                    ("May he die at peace.", "彼が安らかに逝けますように。")
                 ], ipa: "/dˈaɪ æt pˈiːs/"),
            make("reminder", "something that helps you remember",
                 "リマインダー・思い出させるもの",
                 useCases: ["忘れないように促す通知や品物を表すとき"],
                 examples: [
                    ("Set a reminder.", "リマインダーを設定。"),
                    ("Friendly reminder.", "親切なお知らせ。")
                 ], ipa: "/ɹɪmˈaɪndɐ/"),
            make("journey", "a long trip or process",
                 "旅・道のり",
                 useCases: ["物理的な旅や人生の歩みを表すとき"],
                 examples: [
                    ("A long journey.", "長い旅。"),
                    ("Life is a journey.", "人生は旅。")
                 ], ipa: "/dʒˈɜːnɪ/")
        ]
    }

    // MARK: - 形容詞・物 (追加 9)

    private static var adjectiveObjects25: [Word] {
        [
            make("intentional", "done on purpose",
                 "意図的な",
                 useCases: ["わざと行ったことを表すとき"],
                 examples: [
                    ("It was intentional.", "わざとだった。"),
                    ("Intentional design.", "意図的なデザイン。")
                 ], ipa: "/ɪntˈɛnʃənəl/"),
            make("remote", "far away; controlled from a distance",
                 "遠隔の・人里離れた",
                 useCases: ["距離が遠い場所、またはリモートワークなど"],
                 examples: [
                    ("Remote work.", "リモートワーク。"),
                    ("A remote village.", "辺鄙な村。")
                 ], ipa: "/ɹɪmˈəʊt/"),
            make("pixel art", "digital art made of pixels",
                 "ピクセルアート",
                 useCases: ["ドット絵の作品やレトロゲーム風グラフィックを表すとき"],
                 examples: [
                    ("Love pixel art.", "ピクセルアート大好き。"),
                    ("Pixel art game.", "ドット絵ゲーム。")
                 ], ipa: "/pˈɪksəl ˈɑːt/"),
            make("well done", "cooked thoroughly; nicely accomplished",
                 "ウェルダン・お見事",
                 useCases: ["肉の焼き加減や仕事の褒め言葉として"],
                 examples: [
                    ("Steak well done, please.", "ステーキはウェルダンで。"),
                    ("Well done!", "お見事!")
                 ], ipa: "/wˈɛl dˈʌn/"),
            make("soundtrack", "music for a film or show",
                 "サウンドトラック",
                 useCases: ["映画やゲームの音楽を表すとき"],
                 examples: [
                    ("Movie soundtrack.", "映画のサントラ。"),
                    ("Great soundtrack.", "サントラが素晴らしい。")
                 ], ipa: "/sˈaʊndtɹæk/"),
            make("for a sec", "for a short moment",
                 "ちょっとだけ・一瞬",
                 useCases: ["短い時間を表すカジュアル口語(for a second の略)"],
                 examples: [
                    ("Wait for a sec.", "ちょっと待って。"),
                    ("Step out for a sec.", "ちょっと外す。")
                 ], ipa: "/fəɹɐ sˈɛk/"),
            make("personal", "relating to one individual privately",
                 "個人的な",
                 useCases: ["プライベートで重要なことを表すとき"],
                 examples: [
                    ("Don't take it personal.", "個人攻撃と受け取らないで。"),
                    ("Personal experience.", "個人的な経験。")
                 ], ipa: "/pˈɜːsənəl/"),
            make("uncontrollable", "impossible to control",
                 "制御不能な",
                 useCases: ["抑えきれない感情や行動を表すとき"],
                 examples: [
                    ("Uncontrollable laughter.", "止まらない笑い。"),
                    ("It became uncontrollable.", "手に負えなくなった。")
                 ], ipa: "/ʌŋkəntɹˈəʊləbəl/"),
            make("tunnel", "an underground passage",
                 "トンネル",
                 useCases: ["地下や山を貫く通路、または比喩的な道のり"],
                 examples: [
                    ("Through the tunnel.", "トンネルを通って。"),
                    ("Light at the end of the tunnel.", "トンネルの先の光(希望の比喩)。")
                 ], ipa: "/tˈʌnəl/")
        ]
    }

    // MARK: - 感情・状態 (追加 8)

    private static var emotionStates26: [Word] {
        [
            make("best kind of pain", "a pain that feels worth it",
                 "最高の痛み・心地よい痛み",
                 useCases: ["懐かしさや努力の充実感など、悪くない痛みを表すとき"],
                 examples: [
                    ("Nostalgia is the best kind of pain.", "ノスタルジアは最高の痛み。"),
                    ("That workout was the best kind of pain.", "あの運動は心地いい痛みだった。")
                 ], ipa: "/bˈɛst kˈaɪnd ɒv pˈeɪn/"),
            make("coziness", "a feeling of warm comfort",
                 "ぬくもり・居心地のよさ",
                 useCases: ["温かくくつろげる雰囲気そのものを名詞で表すとき"],
                 examples: [
                    ("The coziness of home.", "家のぬくもり。"),
                    ("Pure coziness.", "純粋な居心地のよさ。")
                 ], ipa: "/kˈəʊzɪnəs/"),
            make("immense", "extremely large; vast",
                 "計り知れない・莫大な",
                 useCases: ["規模や感情が極めて大きいことを表すとき"],
                 examples: [
                    ("Immense pressure.", "計り知れないプレッシャー。"),
                    ("An immense ocean.", "果てしない海。")
                 ], ipa: "/ɪmˈɛns/"),
            make("overwhelming", "very strong or intense",
                 "圧倒的な・押し寄せる",
                 useCases: ["感情や物量に圧倒される様子を表すとき"],
                 examples: [
                    ("Overwhelming support.", "圧倒的な支持。"),
                    ("Feeling overwhelmed.", "押しつぶされそう。")
                 ], ipa: "/ˌəʊvəwˈɛlmɪŋ/"),
            make("melancholic", "feeling pensive sadness",
                 "もの悲しい・憂愁の",
                 useCases: ["静かで深い悲しみを表すとき"],
                 examples: [
                    ("A melancholic mood.", "もの悲しい気分。"),
                    ("Melancholic music.", "憂いのある音楽。")
                 ], ipa: "/mˌɛləŋkˈɒlɪk/"),
            make("sadness", "the feeling of being sad",
                 "悲しみ",
                 useCases: ["悲しい気持ちそのものを表すとき"],
                 examples: [
                    ("A wave of sadness.", "悲しみの波。"),
                    ("Pure sadness.", "純粋な悲しみ。")
                 ], ipa: "/sˈædnəs/"),
            make("hold it together", "stay composed under stress",
                 "気をしっかり保つ",
                 useCases: ["崩れそうな感情をなんとか抑えるとき"],
                 examples: [
                    ("Try to hold it together.", "踏ん張って。"),
                    ("I can barely hold it together.", "ギリギリ持ちこたえてる。")
                 ], ipa: "/hˈəʊld ɪt təɡˈɛðɐ/"),
            make("sob", "cry noisily",
                 "むせび泣く",
                 useCases: ["激しく泣くときに"],
                 examples: [
                    ("She sobbed quietly.", "彼女は静かに泣いた。"),
                    ("Burst into sobs.", "泣き崩れた。")
                 ], ipa: "/sˈɒb/")
        ]
    }

    // MARK: - 性質・形容詞 (追加 8)

    private static var qualityAdjectives26: [Word] {
        [
            make("secure", "safe; firmly fixed",
                 "安全な・確保された",
                 useCases: ["安全性や安定した状態、または「確保する」動詞"],
                 examples: [
                    ("A secure job.", "安定した仕事。"),
                    ("Secure the lock.", "鍵をしっかり閉めて。")
                 ], ipa: "/sɪkjˈɔː/"),
            make("unmatched", "having no equal",
                 "比類のない・並ぶものがない",
                 useCases: ["他を寄せ付けない優れた品質を表すとき"],
                 examples: [
                    ("Unmatched quality.", "比類なき品質。"),
                    ("Her skill is unmatched.", "彼女の腕は他にいない。")
                 ], ipa: "/ʌnmˈætʃt/"),
            make("nonstop", "without stopping",
                 "ノンストップの・休みなしの",
                 useCases: ["途切れず続く動作や直行便を表すとき"],
                 examples: [
                    ("Nonstop flight.", "直行便。"),
                    ("Working nonstop.", "ぶっ通しで働く。")
                 ], ipa: "/nˌɒnstˈɒp/"),
            make("oddly", "in a strange way",
                 "奇妙にも・不思議と",
                 useCases: ["普通とは違った印象や感覚を表すとき"],
                 examples: [
                    ("Oddly satisfying.", "妙に気持ちいい。"),
                    ("Oddly enough, ~", "奇妙なことに〜")
                 ], ipa: "/ˈɒdlɪ/"),
            make("profound", "very great or deep",
                 "深い・深遠な",
                 useCases: ["感動や影響が深いことを表すとき"],
                 examples: [
                    ("Profound impact.", "深い影響。"),
                    ("Profound silence.", "深い沈黙。")
                 ], ipa: "/pɹəfˈaʊnd/"),
            make("shiny", "reflecting light brightly",
                 "ピカピカの・光沢のある",
                 useCases: ["光を反射して輝いている物を表すとき"],
                 examples: [
                    ("Shiny new car.", "ピカピカの新車。"),
                    ("Shiny hair.", "ツヤツヤの髪。")
                 ], ipa: "/ʃˈaɪnɪ/"),
            make("intact", "undamaged; complete",
                 "無傷の・そのままの",
                 useCases: ["元の状態で保たれているものを表すとき"],
                 examples: [
                    ("Still intact.", "まだ無傷。"),
                    ("Reputation intact.", "評判は守られた。")
                 ], ipa: "/ɪntˈækt/"),
            make("simpler", "easier or more straightforward",
                 "よりシンプルな・もっと簡単な",
                 useCases: ["より単純化した表現を提案するとき(simpleの比較級)"],
                 examples: [
                    ("Make it simpler.", "もっとシンプルにして。"),
                    ("Life was simpler then.", "あの頃はもっとシンプルだった。")
                 ], ipa: "/sˈɪmplɐ/")
        ]
    }

    // MARK: - 動詞・名詞 (追加 7)

    private static var verbNouns26: [Word] {
        [
            make("exposure", "being subjected to something",
                 "露出・経験・暴露",
                 useCases: ["紫外線や情報、経験にさらされることを表すとき"],
                 examples: [
                    ("Sun exposure.", "日光に当たること。"),
                    ("Gained exposure.", "知名度を得た。")
                 ], ipa: "/ɪkspˈəʊʒɐ/"),
            make("stay up", "remain awake",
                 "夜更かしする・起きている",
                 useCases: ["遅くまで寝ないでいることを表すとき"],
                 examples: [
                    ("Stay up late.", "夜更かしする。"),
                    ("Stayed up till 3am.", "3時まで起きてた。")
                 ], ipa: "/stˈeɪ ˈʌp/"),
            make("instantly", "immediately",
                 "瞬時に・即座に",
                 useCases: ["時間をかけず即座に起きる動作を表すとき"],
                 examples: [
                    ("Reply instantly.", "即返事して。"),
                    ("Instantly fell asleep.", "瞬時に眠った。")
                 ], ipa: "/ˈɪnstəntlɪ/"),
            make("hunt", "search for or pursue",
                 "狩りをする・探し回る",
                 useCases: ["獲物や物を必死に探すときの動詞・名詞"],
                 examples: [
                    ("Job hunt.", "就活。"),
                    ("Hunt for clues.", "手がかりを探す。")
                 ], ipa: "/hˈʌnt/"),
            make("simultaneously", "at the same time",
                 "同時に",
                 useCases: ["複数のことが平行して起きるとき(フォーマル)"],
                 examples: [
                    ("Happen simultaneously.", "同時に起きる。"),
                    ("Work on two things simultaneously.", "2つを同時に進める。")
                 ], ipa: "/sˌɪməltˈeɪniəslɪ/"),
            make("responsibility", "the state of being accountable",
                 "責任",
                 useCases: ["役割や義務を表すとき"],
                 examples: [
                    ("Take responsibility.", "責任を取る。"),
                    ("Heavy responsibility.", "重い責任。")
                 ], ipa: "/ɹɪspˌɒnsəbˈɪlɪtɪ/"),
            make("bangs", "hair cut to hang over the forehead",
                 "前髪",
                 useCases: ["額にかかる前髪のヘアスタイルを表すとき(米)"],
                 examples: [
                    ("Cut my bangs.", "前髪を切る。"),
                    ("I love your bangs.", "前髪かわいい。")
                 ], ipa: "/bˈæŋz/")
        ]
    }

    // MARK: - 印象・感情 (追加 8)

    private static var impressionEmotion27: [Word] {
        [
            make("iconic", "widely recognized and admired",
                 "象徴的な・アイコン的な",
                 useCases: ["時代や文化を象徴する人・物を表すとき"],
                 examples: [
                    ("Iconic movie.", "象徴的な映画。"),
                    ("She's an iconic figure.", "彼女はアイコン的存在。")
                 ], ipa: "/aɪkˈɒnɪk/"),
            make("icon", "a symbol or famous figure",
                 "象徴・偶像・アイコン",
                 useCases: ["時代を代表する有名人や象徴的な物を表すとき"],
                 examples: [
                    ("Style icon.", "ファッションアイコン。"),
                    ("Cultural icon.", "文化的象徴。")
                 ], ipa: "/ˈaɪkɒn/"),
            make("hit me in the feels", "deeply move emotionally",
                 "心にグサッとくる",
                 useCases: ["強く感情を揺さぶられたときの口語表現"],
                 examples: [
                    ("That song hit me in the feels.", "あの曲、心にグッときた。"),
                    ("Hit me right in the feels.", "もろ心に来た。")
                 ], ipa: "/hˈɪt mˌiː ɪnðə fˈiːlz/"),
            make("sunshine", "bright sunlight; a cheerful person",
                 "日差し・元気の源",
                 useCases: ["太陽の光、または明るい人を比喩で表すとき"],
                 examples: [
                    ("Lots of sunshine today.", "今日は日差したっぷり。"),
                    ("You're my sunshine.", "君は私の元気の源。")
                 ], ipa: "/sˈʌnʃaɪn/"),
            make("lasting", "continuing to exist or be effective",
                 "長続きする・永続的な",
                 useCases: ["影響や効果が長く続くものを表すとき"],
                 examples: [
                    ("Lasting impression.", "強い印象。"),
                    ("Lasting friendship.", "長続きする友情。")
                 ], ipa: "/lˈɑːstɪŋ/"),
            make("era", "a long period of historical time",
                 "時代",
                 useCases: ["歴史区分や個人の人生段階を表すとき"],
                 examples: [
                    ("The end of an era.", "ある時代の終わり。"),
                    ("My college era.", "大学時代。")
                 ], ipa: "/ˈiəɹɐ/"),
            make("chuckle", "laugh softly",
                 "クスクス笑う",
                 useCases: ["静かに笑うときの動詞・名詞"],
                 examples: [
                    ("He chuckled to himself.", "彼は一人クスッと笑った。"),
                    ("A soft chuckle.", "静かな笑い。")
                 ], ipa: "/tʃˈʌkəl/"),
            make("preoccupy", "occupy someone's thoughts",
                 "頭から離れない・心を奪う",
                 useCases: ["何かに気を取られている状態を表すとき"],
                 examples: [
                    ("Preoccupied with work.", "仕事で頭がいっぱい。"),
                    ("Don't let it preoccupy you.", "それに気を取られないで。")
                 ], ipa: "/pɹɪˈɒkjʊpˌaɪ/")
        ]
    }

    // MARK: - 状態・場所 (追加 8)

    private static var stateLocation27: [Word] {
        [
            make("all to myself", "entirely for me",
                 "独り占め",
                 useCases: ["他人がおらず自分だけで楽しめる状況"],
                 examples: [
                    ("The beach was all to myself.", "ビーチを独り占め。"),
                    ("A whole pizza all to myself.", "ピザ一枚独り占め。")
                 ], ipa: "/ˈɔːl tə maɪsˈɛlf/"),
            make("on demand", "available when wanted",
                 "オンデマンドで・要求に応じて",
                 useCases: ["必要な時にすぐ利用できることを表すとき"],
                 examples: [
                    ("Video on demand.", "オンデマンド動画。"),
                    ("Available on demand.", "要望に応じて利用可。")
                 ], ipa: "/ˌɒn dɪmˈɑːnd/"),
            make("in working condition", "still functioning",
                 "稼働状態で・使える状態で",
                 useCases: ["機械や物がまだ正常に動くことを表すとき"],
                 examples: [
                    ("Still in working condition.", "まだ動く状態。"),
                    ("Keep it in working condition.", "使える状態で保って。")
                 ], ipa: "/ɪn wˈɜːkɪŋ kəndˈɪʃən/"),
            make("bit by bit", "little by little",
                 "少しずつ",
                 useCases: ["徐々に進む様子を表すとき"],
                 examples: [
                    ("Bit by bit, it improved.", "少しずつ良くなった。"),
                    ("Learn bit by bit.", "少しずつ学ぶ。")
                 ], ipa: "/bˈɪt baɪ bˈɪt/"),
            make("footage", "filmed video material",
                 "映像・フッテージ",
                 useCases: ["記録映像やビデオ素材を表すとき"],
                 examples: [
                    ("Security footage.", "防犯カメラ映像。"),
                    ("Behind-the-scenes footage.", "舞台裏映像。")
                 ], ipa: "/fˈʊtɪdʒ/"),
            make("background", "a person's history or visual back area",
                 "背景・経歴",
                 useCases: ["人の経歴、または画像・場面の背景を表すとき"],
                 examples: [
                    ("Cultural background.", "文化的背景。"),
                    ("Blurry background.", "ぼやけた背景。")
                 ], ipa: "/bˈækɡɹaʊnd/"),
            make("rural", "characteristic of the countryside",
                 "田舎の・地方の",
                 useCases: ["都会の対比で田舎を表すとき"],
                 examples: [
                    ("Rural area.", "地方・田舎。"),
                    ("Rural life.", "田舎暮らし。")
                 ], ipa: "/ɹˈɔːɹəl/"),
            make("as I mentioned earlier", "as previously stated",
                 "先ほど述べたように",
                 useCases: ["プレゼンや会議で前述を再度参照するとき"],
                 examples: [
                    ("As I mentioned earlier, ~", "先ほどお伝えしたように〜"),
                    ("As I mentioned earlier in the report.", "報告で先述したように。")
                 ], ipa: "/æz aɪ mˈɛnʃənd ˈɜːlɪɐ/")
        ]
    }

    // MARK: - 動詞・流れ・状態 (追加 7)

    private static var verbFlow27: [Word] {
        [
            make("streak", "a continuous series; a stripe",
                 "連続・縞模様",
                 useCases: ["連勝や記録の連続、または線状の色違いを表すとき"],
                 examples: [
                    ("Winning streak.", "連勝記録。"),
                    ("A streak of bad luck.", "不運の連続。")
                 ], ipa: "/stɹˈiːk/"),
            make("strand", "a single thread; leave stranded",
                 "(髪などの)一筋・取り残す",
                 useCases: ["髪や糸の一本、または身動き取れない状態を表すとき"],
                 examples: [
                    ("A strand of hair.", "髪の一筋。"),
                    ("Stranded at the airport.", "空港で足止め。")
                 ], ipa: "/stɹˈænd/"),
            make("flood", "an overflow of water; overwhelm",
                 "洪水・殺到",
                 useCases: ["水の氾濫、または情報や感情が押し寄せるとき"],
                 examples: [
                    ("Flash flood.", "鉄砲水。"),
                    ("Flood of messages.", "メッセージが殺到。")
                 ], ipa: "/flˈʌd/"),
            make("flow", "move steadily; the steady movement",
                 "流れる・流れ",
                 useCases: ["液体・人・情報の継続的な動きを表すとき"],
                 examples: [
                    ("Cash flow.", "キャッシュフロー。"),
                    ("Go with the flow.", "流れに身を任せて。")
                 ], ipa: "/flˈəʊ/"),
            make("foster", "encourage development of; bring up as one's own",
                 "育む・里親になる",
                 useCases: ["考え・関係・文化を促進する、または里親として育てる"],
                 examples: [
                    ("Foster creativity.", "創造性を育む。"),
                    ("Foster a child.", "里子を育てる。")
                 ], ipa: "/fˈɒstɐ/"),
            make("touch down", "land on a surface",
                 "着陸する・タッチダウン",
                 useCases: ["飛行機が着陸する、またはアメフトの得点を表すとき"],
                 examples: [
                    ("The plane touched down.", "飛行機が着陸した。"),
                    ("Score a touchdown.", "タッチダウンを決める。")
                 ], ipa: "/tˈʌtʃ dˈaʊn/"),
            make("patrol", "guard or move around an area regularly",
                 "巡回する・パトロール",
                 useCases: ["警官や警備員が見回るとき"],
                 examples: [
                    ("Police patrol.", "警察のパトロール。"),
                    ("On patrol.", "巡回中。")
                 ], ipa: "/pɐtɹˈəʊl/")
        ]
    }

    // MARK: - 感情・記憶・印象 (追加 9)

    private static var emotionMemory28: [Word] {
        [
            make("hit me hard", "affect deeply emotionally",
                 "心にグサッと来た",
                 useCases: ["ニュースや言葉に強く打ちのめされたとき"],
                 examples: [
                    ("The news hit me hard.", "そのニュースが心に響いた。"),
                    ("That hit me hard.", "それはきつかった。")
                 ], ipa: "/hˈɪt mˌiː hˈɑːd/"),
            make("on repeat", "playing repeatedly",
                 "リピート再生で・何度も",
                 useCases: ["同じ曲や動画を繰り返し再生するとき"],
                 examples: [
                    ("Song on repeat.", "リピート再生。"),
                    ("Watching it on repeat.", "何度も観てる。")
                 ], ipa: "/ˌɒn ɹɪpˈiːt/"),
            make("time has flown by", "time has passed very quickly",
                 "時が飛ぶように過ぎた",
                 useCases: ["振り返って早かったと感じるとき"],
                 examples: [
                    ("Wow, time has flown by!", "わぁ、もうこんなに経った!"),
                    ("Time has flown by since then.", "あれから時間があっという間。")
                 ], ipa: "/tˈaɪm hɐz flˈəʊn bˈaɪ/"),
            make("warmth", "the quality of being warm",
                 "温かさ・ぬくもり",
                 useCases: ["物理的・感情的な温もりを表すとき"],
                 examples: [
                    ("Feel the warmth.", "温かさを感じる。"),
                    ("Warmth of family.", "家族のぬくもり。")
                 ], ipa: "/wˈɔːmθ/"),
            make("sentiment", "a thought or feeling",
                 "感情・心情",
                 useCases: ["心からの気持ちや世論を表すとき"],
                 examples: [
                    ("Public sentiment.", "世論・国民感情。"),
                    ("Nice sentiment.", "素敵な気持ちだね。")
                 ], ipa: "/sˈɛntɪmənt/"),
            make("take a moment", "pause briefly",
                 "ちょっと時間を取る",
                 useCases: ["立ち止まって考える・気持ちを落ち着けるとき"],
                 examples: [
                    ("Take a moment to relax.", "ちょっと一息ついて。"),
                    ("Let's take a moment.", "少し時間を取ろう。")
                 ], ipa: "/tˈeɪk ɐ mˈəʊmənt/"),
            make("leave an impression", "be memorable",
                 "印象を残す",
                 useCases: ["人や物が記憶に残るとき"],
                 examples: [
                    ("Leave a lasting impression.", "強い印象を残す。"),
                    ("She left an impression on me.", "彼女が私に印象を残した。")
                 ], ipa: "/lˈiːv ɐn ɪmpɹˈɛʃən/"),
            make("until my last breath", "until I die",
                 "最後の息まで・死ぬまで",
                 useCases: ["生涯にわたる強い決意や愛情を表すとき"],
                 examples: [
                    ("I'll fight until my last breath.", "息絶えるまで戦う。"),
                    ("Love you until my last breath.", "死ぬまで愛してる。")
                 ], ipa: "/ʌntˈɪl maɪ lˈɑːst bɹˈɛθ/"),
            make("go back in time", "return to the past",
                 "過去に戻る",
                 useCases: ["過去をやり直したい願望や懐古を表すとき"],
                 examples: [
                    ("I wish I could go back in time.", "過去に戻れたらいいのに。"),
                    ("Go back in time and ~", "時を戻して〜")
                 ], ipa: "/ɡˌəʊ bˈæk ɪn tˈaɪm/")
        ]
    }

    // MARK: - 動詞・行動 (追加 9)

    private static var actionVerbs28: [Word] {
        [
            make("fix sth", "repair or arrange",
                 "(物を)直す・解決する",
                 useCases: ["壊れた物や問題を修理・解決するとき"],
                 examples: [
                    ("Fix the bug.", "バグを直す。"),
                    ("Fix the problem.", "問題を解決する。")
                 ], ipa: "/fˈɪks sˈʌmθɪŋ/"),
            make("fix on", "focus attention on",
                 "〜に注目する・固定する",
                 useCases: ["視線や考えをそこに据えるとき"],
                 examples: [
                    ("Her eyes were fixed on him.", "彼女の視線は彼に釘付け。"),
                    ("Fix on a goal.", "目標を見据える。")
                 ], ipa: "/fˈɪks ˈɒn/"),
            make("fool around", "behave playfully or waste time",
                 "ふざける・遊び回る",
                 useCases: ["真面目にせず遊んでいるとき"],
                 examples: [
                    ("Stop fooling around.", "ふざけるのやめて。"),
                    ("We fooled around all day.", "一日中遊び回った。")
                 ], ipa: "/fˈuːl ɐɹˈaʊnd/"),
            make("go and move on", "leave and move forward",
                 "去って前進する・忘れて進む",
                 useCases: ["過去を断ち切って次へ進むとき"],
                 examples: [
                    ("Time to go and move on.", "去って前へ進む時。"),
                    ("Just go and move on.", "もう忘れて進もう。")
                 ], ipa: "/ɡˌəʊ ænd mˈuːv ˈɒn/"),
            make("unknowingly", "without being aware",
                 "知らずに・無自覚に",
                 useCases: ["気づかないうちに何かをしたとき"],
                 examples: [
                    ("Unknowingly broke the rule.", "知らずに規則を破った。"),
                    ("Unknowingly helped them.", "知らぬ間に助けていた。")
                 ], ipa: "/ʌnnˈəʊɪŋlɪ/"),
            make("spiral", "wind in a curve; deteriorate",
                 "螺旋・悪化する",
                 useCases: ["渦巻き状の動きや、状況が悪化するとき"],
                 examples: [
                    ("Downward spiral.", "悪循環。"),
                    ("Spiral out of control.", "制御不能になる。")
                 ], ipa: "/spˈaɪəɹəl/"),
            make("stump", "confuse or baffle",
                 "困らせる・行き詰まらせる",
                 useCases: ["難問で困惑させるとき"],
                 examples: [
                    ("That stumped me.", "それで詰まった。"),
                    ("Don't get stumped.", "つまずかないで。")
                 ], ipa: "/stˈʌmp/"),
            make("distort", "twist out of shape; misrepresent",
                 "歪める・捻じ曲げる",
                 useCases: ["形や事実を歪曲するとき"],
                 examples: [
                    ("Distort the truth.", "真実を捻じ曲げる。"),
                    ("Distorted image.", "歪んだイメージ。")
                 ], ipa: "/dɪstˈɔːt/"),
            make("fracture", "break or crack",
                 "骨折する・ひびが入る",
                 useCases: ["骨折や物・関係のひびを表すとき"],
                 examples: [
                    ("Fracture a bone.", "骨折する。"),
                    ("A fractured relationship.", "ひびの入った関係。")
                 ], ipa: "/fɹˈæktʃɐ/")
        ]
    }

    // MARK: - 名詞・形容詞 (追加 9)

    private static var nounAdjective28: [Word] {
        [
            make("spoonful", "an amount a spoon can hold",
                 "スプーン一杯",
                 useCases: ["料理や薬の分量を表すとき"],
                 examples: [
                    ("A spoonful of sugar.", "スプーン一杯の砂糖。"),
                    ("Two spoonfuls.", "スプーン2杯。")
                 ], ipa: "/spˈuːnfəl/"),
            make("membrane", "a thin layer of tissue",
                 "膜",
                 useCases: ["細胞膜や薄い層を表すとき"],
                 examples: [
                    ("Cell membrane.", "細胞膜。"),
                    ("Mucous membrane.", "粘膜。")
                 ], ipa: "/mˈɛmbɹeɪn/"),
            make("backdrop", "the scenery behind",
                 "背景・舞台幕",
                 useCases: ["舞台や写真、出来事の背景を表すとき"],
                 examples: [
                    ("Mountain backdrop.", "山を背景に。"),
                    ("Against this backdrop.", "この背景の中で。")
                 ], ipa: "/bˈækdɹɒp/"),
            make("fluorescent", "emitting glowing light",
                 "蛍光の・蛍光灯の",
                 useCases: ["蛍光ペンや蛍光灯など発光するものを表すとき"],
                 examples: [
                    ("Fluorescent light.", "蛍光灯。"),
                    ("Fluorescent yellow.", "蛍光イエロー。")
                 ], ipa: "/flɔːɹˈɛsənt/"),
            make("now that", "given the fact that",
                 "〜である今は・〜したからには",
                 useCases: ["新しい状況を踏まえて結論を述べるとき"],
                 examples: [
                    ("Now that I think about it, ~", "考えてみれば〜"),
                    ("Now that you're here, let's start.", "君が来たから始めよう。")
                 ], ipa: "/nˈaʊ ðˈæt/"),
            make("flawless", "without any flaw",
                 "完璧な・欠点のない",
                 useCases: ["申し分のない品質や見た目を表すとき"],
                 examples: [
                    ("Flawless performance.", "完璧なパフォーマンス。"),
                    ("Flawless skin.", "完璧な肌。")
                 ], ipa: "/flˈɔːləs/"),
            make("blanket", "a thick cover; covering broadly",
                 "毛布・全体的な",
                 useCases: ["寝具の毛布、または広範囲をカバーする比喩"],
                 examples: [
                    ("Warm blanket.", "暖かい毛布。"),
                    ("Blanket statement.", "ひとくくりの発言。")
                 ], ipa: "/blˈæŋkɪt/"),
            make("cooked", "prepared by heat; (slang) done for",
                 "調理された・(俗)終わった",
                 useCases: ["料理の状態、またはスラングで「終わった・ヤバい」"],
                 examples: [
                    ("Cooked rice.", "炊いたお米。"),
                    ("I'm cooked!", "もう終わった!")
                 ], ipa: "/kˈʊkt/"),
            make("fishing", "the activity of catching fish",
                 "釣り・釣りをすること",
                 useCases: ["趣味としての釣りや「探りを入れる」比喩"],
                 examples: [
                    ("Go fishing.", "釣りに行く。"),
                    ("Fishing for compliments.", "褒められたがる。")
                 ], ipa: "/fˈɪʃɪŋ/")
        ]
    }

    // MARK: - 動詞・状態 (追加 7)

    private static var actionStates29: [Word] {
        [
            make("extract", "remove or pull out",
                 "抽出する・取り出す",
                 useCases: ["情報・成分・物を取り出すとき"],
                 examples: [
                    ("Extract the data.", "データを抽出する。"),
                    ("Tooth extraction.", "歯の抜歯。")
                 ], ipa: "/ˈɛkstɹækt/"),
            make("live up to", "fulfill or match expectations",
                 "(期待に)応える",
                 useCases: ["評判や期待に見合うものを表すとき"],
                 examples: [
                    ("Live up to the hype.", "前評判に応える。"),
                    ("Live up to expectations.", "期待に応える。")
                 ], ipa: "/lˈaɪv ˈʌp tuː/"),
            make("add up", "make sense; total to",
                 "辻褄が合う・合計する",
                 useCases: ["話の筋が通る、または数字の合計を表すとき"],
                 examples: [
                    ("That doesn't add up.", "辻褄が合わない。"),
                    ("It all adds up.", "全部つながる。")
                 ], ipa: "/ˈæd ˈʌp/"),
            make("filter", "remove unwanted parts; selectively pass",
                 "ろ過する・フィルター",
                 useCases: ["物理的な濾過、または情報を選別するとき"],
                 examples: [
                    ("Filter the water.", "水を濾す。"),
                    ("Apply a photo filter.", "写真にフィルターをかける。")
                 ], ipa: "/fˈɪltɐ/"),
            make("score", "earn points; get something good",
                 "得点する・うまく手に入れる",
                 useCases: ["試合の得点、または「ゲット」のスラング"],
                 examples: [
                    ("Score a goal.", "ゴールを決める。"),
                    ("Scored tickets!", "チケット手に入れた!")
                 ], ipa: "/skˈɔː/"),
            make("peak", "the highest point",
                 "頂点・最盛期",
                 useCases: ["物事の最高点や絶頂期を表すとき"],
                 examples: [
                    ("Peak performance.", "ピークパフォーマンス。"),
                    ("Reach the peak.", "頂点に達する。")
                 ], ipa: "/pˈiːk/"),
            make("ever told", "have ever said to someone",
                 "今までに〜と言われた",
                 useCases: ["過去に誰かから言われた経験を尋ねるとき"],
                 examples: [
                    ("Best advice I've ever told.", "私が言った中で最高の助言。"),
                    ("Have I ever told you ~?", "今までに〜って話したっけ?")
                 ], ipa: "/ˈɛvɐ tˈəʊld/")
        ]
    }

    // MARK: - 性質・概念 (追加 7)

    private static var qualityConcepts29: [Word] {
        [
            make("simply", "in a simple way; just",
                 "ただ単に・シンプルに",
                 useCases: ["余計なものなしで言いたいことを伝えるとき"],
                 examples: [
                    ("Simply put, ~", "簡単に言うと〜"),
                    ("Simply amazing.", "ただただ素晴らしい。")
                 ], ipa: "/sˈɪmplɪ/"),
            make("greatest", "the most outstanding",
                 "最も偉大な・最高の",
                 useCases: ["史上最高や最も優れたものを表すとき"],
                 examples: [
                    ("The greatest of all time.", "史上最高。"),
                    ("My greatest love.", "私の最愛。")
                 ], ipa: "/ɡɹˈeɪtɪst/"),
            make("heartfelt", "deeply sincere",
                 "心からの",
                 useCases: ["感情がこもった言葉や行動を表すとき"],
                 examples: [
                    ("Heartfelt apology.", "心からの謝罪。"),
                    ("Heartfelt thanks.", "心からの感謝。")
                 ], ipa: "/hˈɑːtfɛlt/"),
            make("as light", "as a lightly as; light as ~",
                 "〜と同じくらい軽い",
                 useCases: ["軽さを比較するとき(as light as a feather など)"],
                 examples: [
                    ("As light as a feather.", "羽根のように軽い。"),
                    ("As light as air.", "空気のように軽やか。")
                 ], ipa: "/æz lˈaɪt/"),
            make("youth", "the period of being young",
                 "若さ・青春",
                 useCases: ["若い時期や若者を表すとき"],
                 examples: [
                    ("In my youth.", "若い頃に。"),
                    ("The youth of today.", "今の若者。")
                 ], ipa: "/jˈuːθ/"),
            make("adolescence", "the transitional stage to adulthood",
                 "思春期・青年期",
                 useCases: ["子供から大人への移行期を表すとき"],
                 examples: [
                    ("Adolescence is tough.", "思春期は大変。"),
                    ("Late adolescence.", "青年期後半。")
                 ], ipa: "/ˌædəlˈɛsəns/"),
            make("kindness", "the quality of being kind",
                 "優しさ・親切",
                 useCases: ["他人への思いやりや親切な行為を表すとき"],
                 examples: [
                    ("Act of kindness.", "親切な行為。"),
                    ("Kindness goes a long way.", "優しさは大きな力を持つ。")
                 ], ipa: "/kˈaɪndnəs/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var actionVerbs30: [Word] {
        [
            make("lag behind", "fall behind in progress",
                 "遅れを取る・後れる",
                 useCases: ["他に比べて進行が遅いことを表すとき"],
                 examples: [
                    ("Don't lag behind.", "遅れないで。"),
                    ("Lagging behind competitors.", "競合に後れを取っている。")
                 ], ipa: "/lˈæɡ bɪhˈaɪnd/"),
            make("be done with", "have finished or had enough",
                 "〜を終える・〜にうんざり",
                 useCases: ["完了、または見限るとき"],
                 examples: [
                    ("I'm done with homework.", "宿題終わった。"),
                    ("Done with this drama.", "この騒ぎはもう終わり。")
                 ], ipa: "/biː dˈʌn wɪð/"),
            make("design", "create a plan or pattern",
                 "デザインする・設計する",
                 useCases: ["見た目や仕組みを計画的に作るとき"],
                 examples: [
                    ("Design a logo.", "ロゴをデザインする。"),
                    ("Designed by ~", "〜が設計。")
                 ], ipa: "/dɪzˈaɪn/"),
            make("remake", "make again or anew",
                 "作り直す・リメイク",
                 useCases: ["映画やゲームなどを新しく作り直すとき"],
                 examples: [
                    ("Remake of the classic.", "名作のリメイク。"),
                    ("Let's remake it.", "作り直そう。")
                 ], ipa: "/ɹɪmˈeɪk/"),
            make("remembering", "calling to mind",
                 "思い出すこと",
                 useCases: ["記憶を呼び起こす行為そのものを表すとき"],
                 examples: [
                    ("Remembering the past.", "過去を思い出すこと。"),
                    ("Just remembering you.", "君を思い出しているだけ。")
                 ], ipa: "/ɹɪmˈɛmbəɹɪŋ/"),
            make("adore", "love deeply",
                 "とても愛する・崇拝する",
                 useCases: ["強い愛情や敬愛を表すとき"],
                 examples: [
                    ("I adore her.", "彼女が大好き。"),
                    ("Adored by fans.", "ファンに愛されている。")
                 ], ipa: "/ɐdˈɔː/"),
            make("injure", "cause physical harm",
                 "怪我をさせる",
                 useCases: ["人や動物に身体的損傷を与えるとき(動詞)"],
                 examples: [
                    ("Injured in the accident.", "事故で負傷。"),
                    ("Don't injure yourself.", "怪我しないで。")
                 ], ipa: "/ˈɪndʒɐ/"),
            make("feature", "highlight as a special attribute",
                 "特徴・取り上げる",
                 useCases: ["特徴の名詞や、何かを目立たせる動詞として"],
                 examples: [
                    ("Key feature.", "重要な特徴。"),
                    ("Featuring a special guest.", "特別ゲストを迎えて。")
                 ], ipa: "/fˈiːtʃɐ/"),
            make("sprinkle", "scatter in small amounts",
                 "振りかける・少しまく",
                 useCases: ["塩や砂糖を散らす、または雨が小降りなとき"],
                 examples: [
                    ("Sprinkle salt.", "塩を振る。"),
                    ("A light sprinkle of rain.", "小雨。")
                 ], ipa: "/spɹˈɪŋkəl/"),
            make("plus", "in addition; positive aspect",
                 "プラス・しかも",
                 useCases: ["追加の利点や情報を述べるとき"],
                 examples: [
                    ("Plus, it's free!", "しかも無料!"),
                    ("A definite plus.", "明らかなプラス。")
                 ], ipa: "/plˈʌs/")
        ]
    }

    // MARK: - 性質・表現 (追加 10)

    private static var qualityExpression30: [Word] {
        [
            make("unfortunate", "having or marked by bad luck",
                 "不運な・残念な",
                 useCases: ["残念な状況や運の悪さを表すとき"],
                 examples: [
                    ("An unfortunate event.", "不運な出来事。"),
                    ("How unfortunate.", "なんて残念。")
                 ], ipa: "/ʌnfˈɔːtʃənət/"),
            make("recipe", "instructions for preparing food",
                 "レシピ・処方",
                 useCases: ["料理の手順や成功の秘訣を表すとき"],
                 examples: [
                    ("Family recipe.", "家伝のレシピ。"),
                    ("Recipe for disaster.", "失敗の元(慣用)。")
                 ], ipa: "/ɹˈɛsɪpˌiː/"),
            make("fun fact", "an interesting bit of trivia",
                 "ちょっとした豆知識",
                 useCases: ["雑学やトリビアを紹介するとき"],
                 examples: [
                    ("Fun fact: ~", "豆知識: 〜"),
                    ("Here's a fun fact.", "ちょっとした豆知識。")
                 ], ipa: "/fˈʌn fˈækt/"),
            make("unreal", "amazing; not real",
                 "信じられない・非現実的な",
                 useCases: ["驚くほど素晴らしい、または非現実的なものを表すとき"],
                 examples: [
                    ("That's unreal!", "信じられない!"),
                    ("Unreal beauty.", "現実離れした美しさ。")
                 ], ipa: "/ʌnɹˈiəl/"),
            make("every single", "absolutely every one",
                 "〜の一つ一つ全て",
                 useCases: ["漏れなく全部であることを強調するとき"],
                 examples: [
                    ("Every single day.", "毎日欠かさず。"),
                    ("Every single one.", "一つ残らず。")
                 ], ipa: "/ˈɛvɹɪ sˈɪŋɡəl/"),
            make("permanent", "lasting indefinitely",
                 "永続的な",
                 useCases: ["変わらず長く続くものを表すとき"],
                 examples: [
                    ("Permanent job.", "正社員。"),
                    ("Permanent change.", "永続的な変化。")
                 ], ipa: "/pˈɜːmənənt/"),
            make("next up", "the next thing to come",
                 "次は・お次は",
                 useCases: ["順番が来た次の人や物を紹介するとき"],
                 examples: [
                    ("Next up: dessert.", "お次はデザート。"),
                    ("Next up on the list.", "リストの次。")
                 ], ipa: "/nˈɛkst ˈʌp/"),
            make("badge", "an emblem or mark of achievement",
                 "バッジ・記章",
                 useCases: ["所属や達成を示すバッジを表すとき"],
                 examples: [
                    ("Wear the badge.", "バッジを着ける。"),
                    ("Badge of honor.", "名誉のバッジ。")
                 ], ipa: "/bˈædʒ/"),
            make("from the beginning", "from the start",
                 "最初から",
                 useCases: ["ある時点を起点に説明するとき"],
                 examples: [
                    ("Tell me from the beginning.", "最初から話して。"),
                    ("Knew it from the beginning.", "最初から知ってた。")
                 ], ipa: "/fɹʌmðə bɪɡˈɪnɪŋ/"),
            make("worth", "having value; deserving of",
                 "〜の価値がある・値する",
                 useCases: ["価値や見合った価値があることを表すとき"],
                 examples: [
                    ("Worth a try.", "試す価値あり。"),
                    ("Net worth.", "純資産。")
                 ], ipa: "/wˈɜːθ/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var actionVerbs31: [Word] {
        [
            make("carry over", "transfer to another period",
                 "持ち越す・繰り越す",
                 useCases: ["残った分や有給を次の期間に持ち越すとき"],
                 examples: [
                    ("Carry over to next year.", "来年に繰り越す。"),
                    ("Vacation days carry over.", "有給は持ち越せる。")
                 ], ipa: "/kˈæɹɪ ˈəʊvɐ/"),
            make("change up", "alter or vary",
                 "変える・刷新する",
                 useCases: ["日常やルーティンを変えるとき"],
                 examples: [
                    ("Change up the routine.", "ルーティンを変える。"),
                    ("Let's change it up.", "刷新しよう。")
                 ], ipa: "/tʃˈeɪndʒ ˈʌp/"),
            make("obtain", "acquire or get",
                 "得る・入手する",
                 useCases: ["努力や手続きで何かを手に入れるとき"],
                 examples: [
                    ("Obtain a permit.", "許可を取得する。"),
                    ("Information was obtained.", "情報を入手した。")
                 ], ipa: "/ɒbtˈeɪn/"),
            make("reward", "give in recognition of effort",
                 "報酬・報いる",
                 useCases: ["努力や貢献に対する見返りを表すとき"],
                 examples: [
                    ("Hard work has its rewards.", "努力は報われる。"),
                    ("Reward yourself.", "自分にご褒美を。")
                 ], ipa: "/ɹɪwˈɔːd/"),
            make("glorify", "give praise or higher honor",
                 "美化する・賛美する",
                 useCases: ["過度に持ち上げる、または神聖視するとき"],
                 examples: [
                    ("Glorify violence.", "暴力を美化する。"),
                    ("Glorified version.", "美化された姿。")
                 ], ipa: "/ɡlˈɔːɹɪfˌaɪ/"),
            make("trash sth", "throw away; criticize harshly",
                 "捨てる・酷評する",
                 useCases: ["物を捨てる、または激しく批判するとき"],
                 examples: [
                    ("Trash the old papers.", "古い書類を捨てる。"),
                    ("Critics trashed the movie.", "批評家が映画を酷評した。")
                 ], ipa: "/tɹˈæʃ sˈʌmθɪŋ/"),
            make("start all over", "begin again from scratch",
                 "最初からやり直す",
                 useCases: ["完全にゼロから再スタートするとき"],
                 examples: [
                    ("Let's start all over.", "最初からやり直そう。"),
                    ("Start all over again.", "もう一度ゼロから。")
                 ], ipa: "/stˈɑːt ˈɔːl ˈəʊvɐ/"),
            make("be cool with", "be okay with",
                 "〜で大丈夫・〜に異論ない",
                 useCases: ["何かを了承する・受け入れるカジュアル表現"],
                 examples: [
                    ("I'm cool with that.", "それでいいよ。"),
                    ("Are you cool with this plan?", "この案で大丈夫?")
                 ], ipa: "/biː kˈuːl wɪð/"),
            make("you gotta", "you have to",
                 "君は〜しなきゃ",
                 useCases: ["くだけた口語で「〜すべき」を伝えるとき"],
                 examples: [
                    ("You gotta try this.", "これは試さなきゃ。"),
                    ("You gotta be kidding.", "冗談だろう。")
                 ], ipa: "/juː ɡˈɒtɐ/"),
            make("saved", "rescued; stored",
                 "救われた・保存された",
                 useCases: ["助けられた、または記録として保存された状態"],
                 examples: [
                    ("You saved me!", "助かった!"),
                    ("Files are saved.", "ファイルは保存済み。")
                 ], ipa: "/sˈeɪvd/")
        ]
    }

    // MARK: - 性質・形容詞 (追加 10)

    private static var qualityAdjectives31: [Word] {
        [
            make("otherwise", "in different circumstances",
                 "そうでなければ・他の点では",
                 useCases: ["条件付きや別の見方を加えるとき"],
                 examples: [
                    ("Hurry up, otherwise we'll be late.", "急いで、じゃないと遅れる。"),
                    ("Otherwise fine.", "他の点では大丈夫。")
                 ], ipa: "/ˈʌðəwˌaɪz/"),
            make("unnecessarily", "in a way that is not needed",
                 "不必要に",
                 useCases: ["余計にしている度合いを表すとき"],
                 examples: [
                    ("Unnecessarily complicated.", "無駄に複雑。"),
                    ("Don't worry unnecessarily.", "余計に心配しないで。")
                 ], ipa: "/ʌnnˌɛsɪsˈɛɹɪlɪ/"),
            make("consuming", "using up; taking time/attention",
                 "消費する・時間/注意を奪う",
                 useCases: ["時間や精神を多く費やすことを表すとき"],
                 examples: [
                    ("Time-consuming.", "時間がかかる。"),
                    ("All-consuming passion.", "全てを注ぐ情熱。")
                 ], ipa: "/kənsjˈuːmɪŋ/"),
            make("that would be", "that is going to be / that's likely",
                 "それは〜だね・〜になる",
                 useCases: ["想定や答えを述べるとき"],
                 examples: [
                    ("That would be great!", "それいいね!"),
                    ("That would be a mistake.", "それは間違いになる。")
                 ], ipa: "/ðæt wʊd bˈiː/"),
            make("great", "excellent; very good",
                 "素晴らしい・偉大な",
                 useCases: ["賛辞や量の多さを表すとき"],
                 examples: [
                    ("That's great!", "素晴らしい!"),
                    ("Great achievement.", "偉大な功績。")
                 ], ipa: "/ɡɹˈeɪt/"),
            make("effect", "a change produced by action",
                 "効果・影響",
                 useCases: ["原因の結果として生じる変化を表すとき"],
                 examples: [
                    ("Side effect.", "副作用。"),
                    ("Take effect.", "効力を発する。")
                 ], ipa: "/ɪfˈɛkt/"),
            make("dumb", "stupid; unable to speak",
                 "馬鹿げた・口がきけない",
                 useCases: ["愚かさを表すスラング、または無言を表すとき"],
                 examples: [
                    ("That's so dumb.", "それマジで馬鹿げてる。"),
                    ("Dumbfounded.", "唖然とした。")
                 ], ipa: "/dˈʌm/"),
            make("brutal", "savage; harsh",
                 "残忍な・容赦のない",
                 useCases: ["過酷さや厳しさを表すとき"],
                 examples: [
                    ("Brutal workout.", "ハードなトレーニング。"),
                    ("Brutal honesty.", "残酷な正直さ。")
                 ], ipa: "/bɹˈuːtəl/"),
            make("as a whole", "considered all together",
                 "全体として",
                 useCases: ["全体を一つの単位として捉えるとき"],
                 examples: [
                    ("Society as a whole.", "社会全体として。"),
                    ("Looking at it as a whole.", "全体として見ると。")
                 ], ipa: "/æz ɐ hˈəʊl/"),
            make("mutant", "an organism with a mutation",
                 "突然変異体・ミュータント",
                 useCases: ["生物学的な変異体、またはフィクションの変身者"],
                 examples: [
                    ("Mutant virus.", "変異ウイルス。"),
                    ("X-Men are mutants.", "X-メンは変異体。")
                 ], ipa: "/mjˈuːtənt/")
        ]
    }

    // MARK: - 会話表現 (追加 5・at the end of は既出)

    private static var conversationalPhrases32: [Word] {
        [
            make("for quite a long time", "for a considerably long period",
                 "かなり長い間",
                 useCases: ["長い期間続いたことを強調するとき"],
                 examples: [
                    ("I've known him for quite a long time.", "彼とはかなり長い付き合い。"),
                    ("Lived here for quite a long time.", "ここにかなり長く住んでる。")
                 ], ipa: "/fɔː kwˈaɪt ɐ lˈɒŋ tˈaɪm/"),
            make("I guess it depends on sth", "it varies depending on",
                 "それは〜次第かな",
                 useCases: ["条件次第で答えが変わるとき"],
                 examples: [
                    ("I guess it depends on the price.", "値段次第かな。"),
                    ("It depends on the weather.", "天気次第。")
                 ], ipa: "/aɪ ɡˈɛs ɪt dɪpˈɛndz ˌɒn sˈʌmθɪŋ/"),
            make("I have a body / brain", "I also need physical/mental care",
                 "私にも体/脳がある(同じ人間だ)",
                 useCases: ["自分も人間として扱われたい・休みたいと訴えるとき"],
                 examples: [
                    ("I have a body too — let me rest.", "私だって体があるんだ、休ませて。"),
                    ("I have a brain — let me think.", "私にも頭があるんだから考えさせて。")
                 ], ipa: "/aɪ hæv ɐ bˈɒdɪ slˈæʃ bɹˈeɪn/"),
            make("not as easy as it looks", "harder than it appears",
                 "見た目ほど簡単じゃない",
                 useCases: ["簡単そうに見えるが実は難しいことを言うとき"],
                 examples: [
                    ("It's not as easy as it looks.", "見た目ほど簡単じゃない。"),
                    ("Trust me, not as easy as it looks.", "本当に、見かけほど楽じゃない。")
                 ], ipa: "/nˌɒt æz ˈiːzɪ æz ɪt lˈʊks/"),
            make("I can't function without sth", "I rely heavily on something",
                 "〜なしじゃやっていけない",
                 useCases: ["何かが生活や仕事に不可欠だと強調するとき"],
                 examples: [
                    ("I can't function without coffee.", "コーヒーなしじゃ動けない。"),
                    ("Can't function without my phone.", "スマホなしじゃ生きられない。")
                 ], ipa: "/aɪ kˈɑːnt fˈʌŋkʃən wɪðˌaʊt sˈʌmθɪŋ/")
        ]
    }

    // MARK: - 動詞・行動 (追加 8)

    private static var actionVerbs33: [Word] {
        [
            make("hook up", "connect; meet up (casually)",
                 "(機器を)接続する・(人と)落ち合う",
                 useCases: ["物を繋ぐ、または非公式に人と会うとき"],
                 examples: [
                    ("Hook up the TV.", "テレビを繋ぐ。"),
                    ("Let's hook up later.", "あとで会おう。")
                 ], ipa: "/hˈʊk ˈʌp/"),
            make("confess", "admit something privately",
                 "告白する・白状する",
                 useCases: ["秘密や罪を打ち明けるとき"],
                 examples: [
                    ("He confessed his love.", "彼は愛を告白した。"),
                    ("Confess your sins.", "罪を告白して。")
                 ], ipa: "/kənfˈɛs/"),
            make("flirt", "behave amorously without serious intent",
                 "イチャつく・気を引く",
                 useCases: ["恋愛感情を匂わせる振る舞いを表すとき"],
                 examples: [
                    ("Stop flirting!", "ナンパやめて!"),
                    ("She's flirting with him.", "彼女、彼と楽しそうに話してる。")
                 ], ipa: "/flˈɜːt/"),
            make("take opportunity", "use a chance",
                 "機会を利用する",
                 useCases: ["訪れた好機を活かすとき"],
                 examples: [
                    ("Take this opportunity to ~", "この機会に〜"),
                    ("She took the opportunity.", "彼女はチャンスをものにした。")
                 ], ipa: "/tˈeɪk ɒpətjˈuːnɪtɪ/"),
            make("climb", "go up by gripping or stepping",
                 "登る・上昇する",
                 useCases: ["物理的に登る、または順位・価値が上がるとき"],
                 examples: [
                    ("Climb the mountain.", "山を登る。"),
                    ("Climb the ranks.", "出世の階段を登る。")
                 ], ipa: "/klˈaɪm/"),
            make("thrust", "push with force",
                 "強く押す・突き出す",
                 useCases: ["物理的に強く押す、または比喩的に立場を押し付けるとき"],
                 examples: [
                    ("Thrust the door open.", "ドアを押し開ける。"),
                    ("Thrust into the spotlight.", "脚光を浴びさせられる。")
                 ], ipa: "/θɹˈʌst/"),
            make("come down", "descend; fall (price, rain etc.)",
                 "降りる・下がる",
                 useCases: ["物理的に降りる、価格が下がる、雨が降るときなど"],
                 examples: [
                    ("Come down from there.", "そこから降りて。"),
                    ("Prices are coming down.", "値段が下がってる。")
                 ], ipa: "/kˈʌm dˈaʊn/"),
            make("wear sth", "have on the body",
                 "(衣服などを)身につける",
                 useCases: ["服や装飾品を着用するとき"],
                 examples: [
                    ("Wear a mask.", "マスクをして。"),
                    ("She wears glasses.", "彼女はメガネをかけている。")
                 ], ipa: "/wˈeə sˈʌmθɪŋ/")
        ]
    }

    // MARK: - 状況・感情 (追加 8)

    private static var emotionStates33: [Word] {
        [
            make("grow up", "become an adult; mature",
                 "成長する・大人になる",
                 useCases: ["子供から大人になる、または精神的に成熟するとき"],
                 examples: [
                    ("Grow up!", "大人になれよ!"),
                    ("Where did you grow up?", "どこで育った?")
                 ], ipa: "/ɡɹˈəʊ ˈʌp/"),
            make("grounded", "well-balanced; punished by staying home",
                 "地に足のついた・外出禁止",
                 useCases: ["安定した性格、または外出禁止のお仕置きを表すとき"],
                 examples: [
                    ("She's so grounded.", "彼女は地に足が着いてる。"),
                    ("You're grounded!", "外出禁止だよ!")
                 ], ipa: "/ɡɹˈaʊndɪd/"),
            make("getting adjective", "becoming (adj) - going through a change",
                 "〜になりつつある(get + 形容詞)",
                 useCases: ["状態がだんだん変わっていくときの構文(getting tired等)"],
                 examples: [
                    ("Getting tired.", "疲れてきた。"),
                    ("It's getting cold.", "寒くなってきた。")
                 ], ipa: "/ɡˌɛtɪŋ ˈædʒɪktˌɪv/"),
            make("guilt-trip", "make someone feel guilty",
                 "罪悪感を抱かせる",
                 useCases: ["相手を遠回しに責めて罪の意識を持たせるとき"],
                 examples: [
                    ("Stop guilt-tripping me.", "罪悪感を植え付けないで。"),
                    ("Classic guilt trip.", "典型的な罪悪感攻撃。")
                 ], ipa: "/ɡˈɪlttɹˈɪp/"),
            make("tipsy", "slightly drunk",
                 "ほろ酔いの",
                 useCases: ["軽くお酒が入った気持ちのいい状態を表すとき"],
                 examples: [
                    ("Feeling tipsy.", "ほろ酔い気分。"),
                    ("A bit tipsy.", "ちょっと酔ってる。")
                 ], ipa: "/tˈɪpsɪ/"),
            make("random", "happening without pattern",
                 "ランダムな・脈絡のない",
                 useCases: ["脈絡なく起こることや、知らない人を指すとき"],
                 examples: [
                    ("That's so random!", "脈絡なさすぎ!"),
                    ("Some random guy.", "知らない男性。")
                 ], ipa: "/ɹˈændəm/"),
            make("obviously", "clearly; evidently",
                 "明らかに・当然",
                 useCases: ["明白なことを強調するとき"],
                 examples: [
                    ("Obviously, yes.", "当然イエス。"),
                    ("Obviously upset.", "明らかに怒ってる。")
                 ], ipa: "/ˈɒbviəslɪ/"),
            make("all good", "everything is fine",
                 "全部大丈夫・問題ない",
                 useCases: ["「気にしないで」「全然OK」のカジュアル返答"],
                 examples: [
                    ("It's all good.", "全部OK。"),
                    ("All good, no worries.", "大丈夫、気にしないで。")
                 ], ipa: "/ˈɔːl ɡˈʊd/")
        ]
    }

    // MARK: - 表現・つなぎ (追加 8)

    private static var expressionFillers33: [Word] {
        [
            make("what was I doing", "what was I in the middle of",
                 "何してたんだっけ?",
                 useCases: ["うっかり中断して思い出せないとき"],
                 examples: [
                    ("Wait, what was I doing?", "あれ、何してたんだっけ?"),
                    ("What was I doing again?", "私何してたっけ?")
                 ], ipa: "/wˌɒt wɒz aɪ dˈuːɪŋ/"),
            make("I was like", "I sort of said/thought",
                 "私は〜って感じだった",
                 useCases: ["自分の発言や反応を再現するカジュアル表現"],
                 examples: [
                    ("I was like, no way!", "私『嘘でしょ!』って感じ。"),
                    ("She was like, whatever.", "彼女『どうでもいい』って感じ。")
                 ], ipa: "/aɪ wɒz lˈaɪk/"),
            make("in my dream", "in my imagination only",
                 "私の夢の中で・空想で",
                 useCases: ["夢で起きたこと、または願望を表すとき"],
                 examples: [
                    ("In my dream, I could fly.", "夢の中で空を飛べた。"),
                    ("Only in my dream.", "夢の中だけの話。")
                 ], ipa: "/ɪn maɪ dɹˈiːm/"),
            make("all this", "everything happening here",
                 "これ全部・このすべて",
                 useCases: ["目の前の状況や物事をひとくくりに指すとき"],
                 examples: [
                    ("After all this, you quit?", "ここまで来て辞めるの?"),
                    ("All this is for you.", "これ全部君のため。")
                 ], ipa: "/ˈɔːl ðˈɪs/"),
            make("I have not", "I haven't (formal)",
                 "私はまだ〜していない",
                 useCases: ["I haven't のフォーマル/強調形"],
                 examples: [
                    ("I have not decided yet.", "まだ決めていません。"),
                    ("No, I have not.", "いいえ、していません。")
                 ], ipa: "/aɪ hɐvnˈɒt/"),
            make("if you ever need", "should you ever require",
                 "もし必要があれば",
                 useCases: ["将来の援助を申し出るとき"],
                 examples: [
                    ("If you ever need help, call me.", "助けが必要なら電話して。"),
                    ("If you ever need anything ~", "何かあったら〜")
                 ], ipa: "/ɪf juː ˈɛvɐ nˈiːd/"),
            make("as you can see", "as is visible",
                 "ご覧の通り",
                 useCases: ["プレゼンや説明で見えている内容を指すとき"],
                 examples: [
                    ("As you can see, sales are up.", "ご覧の通り売上が上昇。"),
                    ("As you can see in the chart, ~", "図の通り〜")
                 ], ipa: "/æz juː kæn sˈiː/"),
            make("this is how you do it", "here's the method",
                 "こうやってやるんだよ",
                 useCases: ["やり方を実演しながら教えるとき"],
                 examples: [
                    ("Watch — this is how you do it.", "見て、こうやるんだ。"),
                    ("This is how you do it properly.", "正しいやり方はこう。")
                 ], ipa: "/ðɪs ɪz hˌaʊ juː dˈuː ɪt/")
        ]
    }

    // MARK: - 名詞・概念 (追加 7)

    private static var nounConcepts33: [Word] {
        [
            make("bastard", "an offensive insult; an illegitimate person",
                 "嫌な奴・私生児(差別的)",
                 useCases: ["強い侮辱語、または法律上の用語(やや古風)"],
                 examples: [
                    ("That bastard!", "あのクソ野郎!"),
                    ("Lucky bastard.", "羨ましい奴(カジュアル)。")
                 ], ipa: "/bˈɑːstəd/"),
            make("apartment", "a self-contained housing unit",
                 "アパート・マンション(米)",
                 useCases: ["集合住宅の一区画を表すとき"],
                 examples: [
                    ("My apartment is small.", "うちのアパートは狭い。"),
                    ("Apartment hunting.", "物件探し中。")
                 ], ipa: "/ɐpˈɑːtmənt/"),
            make("rest of", "the remaining part",
                 "残りの〜",
                 useCases: ["全体から一部を除いた残りを表すとき"],
                 examples: [
                    ("The rest of the day.", "残りの一日。"),
                    ("Rest of the world.", "世界の他の地域。")
                 ], ipa: "/ɹˈɛst ɒv/"),
            make("farm", "land for growing crops or raising animals",
                 "農場・農業",
                 useCases: ["農地や動物を育てる場所を表すとき"],
                 examples: [
                    ("On the farm.", "農場で。"),
                    ("Farm to table.", "農場から食卓へ。")
                 ], ipa: "/fˈɑːm/"),
            make("spare time", "free time",
                 "暇な時間・自由時間",
                 useCases: ["仕事や義務の合間に空いた時間を表すとき"],
                 examples: [
                    ("In my spare time, I read.", "暇な時は本を読む。"),
                    ("Got any spare time?", "暇ある?")
                 ], ipa: "/spˈeə tˈaɪm/"),
            make("apparently", "seemingly; it appears that",
                 "どうやら・聞くところによると",
                 useCases: ["伝聞や見た目から判断するとき"],
                 examples: [
                    ("Apparently, he's coming.", "どうやら彼は来る。"),
                    ("Apparently not.", "違うらしい。")
                 ], ipa: "/ɐpˈæɹəntlɪ/"),
            make("everything is clear", "all is understood",
                 "全部はっきりしている・了解",
                 useCases: ["状況・指示が完全に分かったときに返事として"],
                 examples: [
                    ("Everything is clear, thanks.", "全部分かりました、ありがとう。"),
                    ("Now everything is clear.", "もう全部はっきりした。")
                 ], ipa: "/ˈɛvɹɪθˌɪŋ ɪz klˈiə/")
        ]
    }

    // MARK: - ビジネス・商業 (追加 8)

    private static var businessCommerce34: [Word] {
        [
            make("retail", "sale of goods to the public",
                 "小売・小売の",
                 useCases: ["卸売りと対比して、消費者への直販を表すとき"],
                 examples: [
                    ("Retail store.", "小売店。"),
                    ("Retail therapy.", "ショッピング療法。")
                 ], ipa: "/ɹˈiːteɪl/"),
            make("contain", "include or hold within",
                 "含む・抑える",
                 useCases: ["要素が含まれている、または感情・拡散を抑え込むとき"],
                 examples: [
                    ("This contains nuts.", "ナッツが入ってる。"),
                    ("Contain the spread.", "拡散を抑える。")
                 ], ipa: "/kəntˈeɪn/"),
            make("buyout", "purchase of a company or stake",
                 "買収・買い取り",
                 useCases: ["企業や株主の持ち分を全て買い取るとき"],
                 examples: [
                    ("Management buyout.", "MBO・経営陣による買収。"),
                    ("A buyout offer.", "買収提案。")
                 ], ipa: "/bˈaɪaʊt/"),
            make("enterprise", "a business or initiative",
                 "企業・事業",
                 useCases: ["大規模なビジネスや組織を表すとき"],
                 examples: [
                    ("Free enterprise.", "自由企業制。"),
                    ("Enterprise software.", "企業向けソフト。")
                 ], ipa: "/ˈɛntəpɹˌaɪz/"),
            make("institute", "an organization for promoting a cause",
                 "機関・協会・(制度を)導入する",
                 useCases: ["研究機関や、制度の導入を表すとき"],
                 examples: [
                    ("Research institute.", "研究機関。"),
                    ("Institute a new policy.", "新方針を導入。")
                 ], ipa: "/ˈɪnstɪtjˌuːt/"),
            make("estate", "extensive land or real property",
                 "地所・遺産",
                 useCases: ["不動産や遺された財産を表すとき"],
                 examples: [
                    ("Real estate.", "不動産。"),
                    ("Family estate.", "一族の所有地・遺産。")
                 ], ipa: "/ɪstˈeɪt/"),
            make("section", "a distinct part",
                 "区画・部門",
                 useCases: ["文書・建物・組織の一部を表すとき"],
                 examples: [
                    ("Section 5.", "第5節。"),
                    ("Sports section.", "スポーツ欄。")
                 ], ipa: "/sˈɛkʃən/"),
            make("team up", "join forces with",
                 "チームを組む・協力する",
                 useCases: ["共通の目的のために協力するとき"],
                 examples: [
                    ("Team up with him.", "彼と組もう。"),
                    ("Let's team up!", "協力しよう!")
                 ], ipa: "/tˈiːm ˈʌp/")
        ]
    }

    // MARK: - 動詞・行動 (追加 7)

    private static var actionVerbs34: [Word] {
        [
            make("insist on", "demand firmly",
                 "〜を主張する・〜と譲らない",
                 useCases: ["強く主張して譲らないとき"],
                 examples: [
                    ("He insisted on paying.", "彼は支払うと譲らなかった。"),
                    ("I insist on quality.", "品質には妥協しない。")
                 ], ipa: "/ɪnsˈɪst ˈɒn/"),
            make("provoke", "stimulate or anger",
                 "挑発する・引き起こす",
                 useCases: ["反応や怒りを引き起こすとき"],
                 examples: [
                    ("Don't provoke him.", "彼を挑発するな。"),
                    ("Provoke a response.", "反応を引き出す。")
                 ], ipa: "/pɹəvˈəʊk/"),
            make("select", "carefully choose",
                 "選ぶ・選抜する",
                 useCases: ["候補から慎重に選び抜くとき"],
                 examples: [
                    ("Select an option.", "選択肢を選んで。"),
                    ("Selected for the team.", "チームに選抜された。")
                 ], ipa: "/sɪlˈɛkt/"),
            make("buy into", "accept as true; invest in",
                 "(考えを)信じる・投資する",
                 useCases: ["人の意見や計画を受け入れるとき"],
                 examples: [
                    ("I don't buy into that.", "それは信じない。"),
                    ("Buy into the company.", "会社に出資する。")
                 ], ipa: "/bˈaɪ ˌɪntʊ/"),
            make("be into V-ing", "be enthusiastic about doing",
                 "〜することにハマっている",
                 useCases: ["何かの活動に夢中であることを表すとき"],
                 examples: [
                    ("I'm into running these days.", "最近ランニングにハマってる。"),
                    ("She's into baking.", "彼女はお菓子作りにハマってる。")
                 ], ipa: "/biː ˌɪntʊ vˈiːˈɪŋ/"),
            make("go out of one's way", "make a special effort",
                 "わざわざ〜する",
                 useCases: ["普段の範囲を超えて努力するとき"],
                 examples: [
                    ("He went out of his way to help.", "彼はわざわざ助けてくれた。"),
                    ("Don't go out of your way.", "無理しないで。")
                 ], ipa: "/ɡˌəʊ ˌaʊtəv wˈɒnz wˈeɪ/"),
            make("destine", "intend or set apart for a purpose",
                 "運命づける・予定する",
                 useCases: ["運命や予定として何かが定められているとき"],
                 examples: [
                    ("Destined for greatness.", "偉大なる運命。"),
                    ("Destined to fail.", "失敗の運命。")
                 ], ipa: "/dˈɛstɪn/")
        ]
    }

    // MARK: - イディオム・諺 (追加 8)

    private static var idiomsProverbs35: [Word] {
        [
            make("chatterbox", "a person who talks a lot",
                 "おしゃべりな人",
                 useCases: ["よく喋る人を表すカジュアル名詞"],
                 examples: [
                    ("She's such a chatterbox.", "彼女、本当におしゃべり。"),
                    ("Total chatterbox!", "完全におしゃべり!")
                 ], ipa: "/tʃˈætəbˌɒks/"),
            make("speak of the devil", "the person being talked about appears",
                 "うわさをすれば",
                 useCases: ["話題にしていた人が現れた瞬間に使う決まり文句"],
                 examples: [
                    ("Speak of the devil!", "うわさをすれば!"),
                    ("Well, speak of the devil — there he is.", "うわさをすれば本人登場。")
                 ], ipa: "/spˈiːk ɒvðə dˈɛvəl/"),
            make("get something out of my system", "release pent-up urges",
                 "(欲求などを)発散する・スッキリさせる",
                 useCases: ["やりたいことや言いたいことを一旦やって気を済ますとき"],
                 examples: [
                    ("I had to get it out of my system.", "発散しなきゃ気が済まなかった。"),
                    ("Get the anger out of your system.", "怒りを発散して。")
                 ], ipa: "/ɡɛt sˈʌmθɪŋ ˌaʊtəv maɪ sˈɪstəm/"),
            make("when it rains it pours", "troubles come all at once",
                 "降れば土砂降り(悪いことは重なる)",
                 useCases: ["不運が立て続けに起こる状況を表すとき"],
                 examples: [
                    ("Lost my keys, then my wallet — when it rains, it pours.", "鍵失くした、財布も。本当に重なる時は重なる。"),
                    ("When it rains, it pours.", "悪いことは続くもの。")
                 ], ipa: "/wˌɛn ɪt ɹˈeɪnz ɪt pˈɔːz/"),
            make("pick your brain", "ask someone for their ideas",
                 "(知恵を)拝借する・意見を聞く",
                 useCases: ["相手の専門知識やアイデアを聞きたいとき"],
                 examples: [
                    ("Can I pick your brain?", "ちょっと知恵を貸してくれる?"),
                    ("Let me pick your brain about ~", "〜について意見を聞かせて。")
                 ], ipa: "/pˈɪk jɔː bɹˈeɪn/"),
            make("go the whole nine yards", "do everything possible",
                 "とことんやる・完全にやり遂げる",
                 useCases: ["全力で取り組むことを表すとき"],
                 examples: [
                    ("She went the whole nine yards.", "彼女は徹底的にやり切った。"),
                    ("Let's go the whole nine yards.", "とことんやろう。")
                 ], ipa: "/ɡˌəʊ ðə hˈəʊl nˈaɪn jˈɑːdz/"),
            make("never mind", "forget it; don't worry",
                 "気にしないで・なんでもない",
                 useCases: ["前言を撤回したり相手を安心させたりするとき"],
                 examples: [
                    ("Never mind, it's fine.", "気にしないで、大丈夫。"),
                    ("Never mind what I said.", "今のは忘れて。")
                 ], ipa: "/nˈɛvɐ mˈaɪnd/"),
            make("kidding", "joking",
                 "冗談を言っている",
                 useCases: ["冗談だと伝えるとき"],
                 examples: [
                    ("Just kidding!", "冗談だよ!"),
                    ("Are you kidding me?", "冗談だろ?")
                 ], ipa: "/kˈɪdɪŋ/")
        ]
    }

    // MARK: - 名詞・表現 (追加 8)

    private static var nounExpressions35: [Word] {
        [
            make("mighty", "having great power; very",
                 "強力な・非常に",
                 useCases: ["力強さや程度を強調するとき(やや古風)"],
                 examples: [
                    ("A mighty warrior.", "強力な戦士。"),
                    ("Mighty fine!", "実にいい!")
                 ], ipa: "/mˈaɪtɪ/"),
            make("right back", "returning very soon",
                 "すぐ戻る・すぐにそちらへ",
                 useCases: ["短時間で戻ることを伝えるとき"],
                 examples: [
                    ("I'll be right back.", "すぐ戻る。"),
                    ("Right back at you!", "そっちこそ!")
                 ], ipa: "/ɹˈaɪt bˈæk/"),
            make("in real life", "in actual reality (not online)",
                 "現実世界では・リアルでは",
                 useCases: ["ネット・ゲームの中と対比して実世界を指すとき(IRL)"],
                 examples: [
                    ("Meet in real life.", "リアルで会う。"),
                    ("He's nice in real life.", "彼、実生活ではいい人。")
                 ], ipa: "/ɪn ɹˈiəl lˈaɪf/"),
            make("for your information", "just so you know (FYI)",
                 "ご参考までに・念のため",
                 useCases: ["情報を提供する前置き、または軽い反論として"],
                 examples: [
                    ("For your information, I was busy.", "念のため、忙しかったんだ。"),
                    ("FYI, the meeting moved.", "ご参考まで、会議が移動。")
                 ], ipa: "/fɔː jɔːɹ ˌɪnfəmˈeɪʃən/"),
            make("reference", "a source or mention",
                 "参考・言及・推薦",
                 useCases: ["資料・推薦状・話題の参照を表すとき"],
                 examples: [
                    ("For reference.", "参考までに。"),
                    ("Cultural reference.", "文化的な言及。")
                 ], ipa: "/ɹˈɛfɹəns/"),
            make("insomnia", "inability to sleep",
                 "不眠症",
                 useCases: ["眠れない症状を表すとき"],
                 examples: [
                    ("Suffer from insomnia.", "不眠症に悩む。"),
                    ("Bad case of insomnia.", "ひどい不眠。")
                 ], ipa: "/ɪnsˈɒmnɪɐ/"),
            make("imagination", "the faculty of forming ideas",
                 "想像力",
                 useCases: ["創造的に思い描く力を表すとき"],
                 examples: [
                    ("Use your imagination.", "想像力を使って。"),
                    ("Wild imagination.", "豊かな想像力。")
                 ], ipa: "/ɪmˌædʒɪnˈeɪʃən/"),
            make("intuition", "instinctive understanding",
                 "直感",
                 useCases: ["理屈ではなく感覚で理解する能力を表すとき"],
                 examples: [
                    ("Trust your intuition.", "直感を信じて。"),
                    ("Woman's intuition.", "女の直感。")
                 ], ipa: "/ɪntjuːˈɪʃən/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var actionVerbs36: [Word] {
        [
            make("sensor sth", "detect with a sensor (informal)",
                 "センサーで感知する",
                 useCases: ["センサーで検知する動作を表すとき(口語)"],
                 examples: [
                    ("The door sensors movement.", "ドアが動きを感知。"),
                    ("Sensors the temperature.", "温度を感知する。")
                 ], ipa: "/sˈɛnsɐ sˈʌmθɪŋ/"),
            make("aim for", "set as a goal",
                 "〜を目指す",
                 useCases: ["目標を定めて努力するとき"],
                 examples: [
                    ("Aim for the top.", "頂上を目指せ。"),
                    ("Aim for excellence.", "卓越を目指す。")
                 ], ipa: "/ˈeɪm fɔː/"),
            make("examine", "inspect closely",
                 "詳しく調べる・診察する",
                 useCases: ["医療や調査で精査するとき"],
                 examples: [
                    ("Examine the evidence.", "証拠を精査する。"),
                    ("Doctor examined me.", "医者に診てもらった。")
                 ], ipa: "/ɪɡzˈæmɪn/"),
            make("halt", "bring to an abrupt stop",
                 "停止する・中止する",
                 useCases: ["動きや活動を急に止めるとき"],
                 examples: [
                    ("Halt the production.", "生産を停止する。"),
                    ("Come to a halt.", "停止する。")
                 ], ipa: "/hˈɒlt/"),
            make("suspend", "stop temporarily; hang",
                 "一時停止する・吊るす",
                 useCases: ["業務や決定を一時保留する、または物を吊るすとき"],
                 examples: [
                    ("Suspend the meeting.", "会議を中断する。"),
                    ("Suspended from school.", "停学処分。")
                 ], ipa: "/səspˈɛnd/"),
            make("amplify", "increase the volume or effect",
                 "増幅する・強化する",
                 useCases: ["音や影響を大きくするとき"],
                 examples: [
                    ("Amplify the sound.", "音を大きくする。"),
                    ("Amplify the message.", "メッセージを広める。")
                 ], ipa: "/ˈæmplɪfˌaɪ/"),
            make("boil", "heat to bubbling point",
                 "沸騰させる・茹でる",
                 useCases: ["水や液体を沸かす、または感情の比喩"],
                 examples: [
                    ("Boil the water.", "お湯を沸かす。"),
                    ("Blood was boiling.", "血が煮えくり返った。")
                 ], ipa: "/bˈɔɪl/"),
            make("polish", "make shiny by rubbing; refine",
                 "磨く・洗練させる",
                 useCases: ["物を磨く、または文章・技術を洗練するとき"],
                 examples: [
                    ("Polish the shoes.", "靴を磨く。"),
                    ("Polish your speech.", "スピーチを洗練させる。")
                 ], ipa: "/pˈɒlɪʃ/"),
            make("hike", "a long walk; to raise sharply",
                 "ハイキング・(価格を)引き上げる",
                 useCases: ["長距離の散歩や、料金の値上げを表すとき"],
                 examples: [
                    ("Go on a hike.", "ハイキングに行く。"),
                    ("Price hike.", "値上げ。")
                 ], ipa: "/hˈaɪk/"),
            make("photograph", "an image; to take a picture",
                 "写真・写真を撮る",
                 useCases: ["記念や記録の写真を表すとき"],
                 examples: [
                    ("Family photograph.", "家族写真。"),
                    ("Photograph the scenery.", "景色を撮影。")
                 ], ipa: "/fˈəʊtəɡɹˌɑːf/")
        ]
    }

    // MARK: - 形容詞・性質 (追加 10)

    private static var qualityAdjectives36: [Word] {
        [
            make("awesome", "extremely impressive",
                 "最高・すごい",
                 useCases: ["カジュアルに称賛するとき"],
                 examples: [
                    ("Awesome!", "最高!"),
                    ("That's awesome.", "それすごい。")
                 ], ipa: "/ˈɔːsʌm/"),
            make("brand new", "completely new",
                 "新品の・真新しい",
                 useCases: ["買ったばかり、または完全に新しいものを表すとき"],
                 examples: [
                    ("Brand new car.", "新車。"),
                    ("Brand new feature.", "新機能。")
                 ], ipa: "/bɹˈænd njˈuː/"),
            make("chilly", "moderately cold",
                 "肌寒い",
                 useCases: ["寒すぎず少し涼しい気温を表すとき"],
                 examples: [
                    ("A chilly morning.", "肌寒い朝。"),
                    ("It's chilly outside.", "外は肌寒い。")
                 ], ipa: "/tʃˈɪlɪ/"),
            make("freezing", "extremely cold",
                 "凍えるほど寒い",
                 useCases: ["極めて寒い気温を表すとき"],
                 examples: [
                    ("It's freezing!", "凍えるほど寒い!"),
                    ("Freezing temperatures.", "氷点下の気温。")
                 ], ipa: "/fɹˈiːzɪŋ/"),
            make("dim", "not bright",
                 "薄暗い・薄い",
                 useCases: ["光が弱い、または認識が薄いことを表すとき"],
                 examples: [
                    ("Dim lights.", "薄暗い照明。"),
                    ("A dim memory.", "おぼろげな記憶。")
                 ], ipa: "/dˈɪm/"),
            make("squishy", "soft and easily squashed",
                 "ぐにゃぐにゃの・ぷにぷにの",
                 useCases: ["柔らかくて押し潰せる感触を表すとき"],
                 examples: [
                    ("Squishy toy.", "ぷにぷにのおもちゃ。"),
                    ("Squishy texture.", "ぷにぷにした感触。")
                 ], ipa: "/skwˈɪʃɪ/"),
            make("rock hard", "extremely hard",
                 "石のように硬い",
                 useCases: ["非常に硬い物の質感を表すとき"],
                 examples: [
                    ("Rock hard muscles.", "石のような筋肉。"),
                    ("Rock hard bread.", "カチカチのパン。")
                 ], ipa: "/ɹˈɒk hˈɑːd/"),
            make("striking", "very noticeable; impressive",
                 "印象的な・目を引く",
                 useCases: ["際立つ美しさや特徴を表すとき"],
                 examples: [
                    ("Striking beauty.", "目を引く美しさ。"),
                    ("Striking similarity.", "驚くほど似てる。")
                 ], ipa: "/stɹˈaɪkɪŋ/"),
            make("graceful", "moving with elegance",
                 "優雅な",
                 useCases: ["上品で美しい動きや態度を表すとき"],
                 examples: [
                    ("Graceful dancer.", "優雅なダンサー。"),
                    ("Graceful movement.", "優美な動き。")
                 ], ipa: "/ɡɹˈeɪsfəl/"),
            make("terrible", "extremely bad",
                 "ひどい・最悪な",
                 useCases: ["強い不快感や悪さを表すとき"],
                 examples: [
                    ("Terrible weather.", "最悪な天気。"),
                    ("I feel terrible.", "気分が最悪。")
                 ], ipa: "/tˈɛɹɪbəl/")
        ]
    }

    // MARK: - 名詞・物 (追加 10)

    private static var objectsItems36: [Word] {
        [
            make("box office", "movie ticket sales counter",
                 "(映画の)興行収入・チケット窓口",
                 useCases: ["映画の売上や劇場のチケット販売を表すとき"],
                 examples: [
                    ("Box office hit.", "興行的大ヒット。"),
                    ("Box office flop.", "興行的失敗。")
                 ], ipa: "/bˈɒks ˈɒfɪs/"),
            make("apron", "a protective garment worn over clothes",
                 "エプロン",
                 useCases: ["料理や作業時に衣服を守る前掛けを表すとき"],
                 examples: [
                    ("Wear an apron.", "エプロンを着けて。"),
                    ("Chef's apron.", "シェフのエプロン。")
                 ], ipa: "/ˈeɪpɹən/"),
            make("can opener", "a tool for opening cans",
                 "缶切り",
                 useCases: ["缶詰を開ける道具"],
                 examples: [
                    ("Use the can opener.", "缶切りを使って。"),
                    ("Electric can opener.", "電動缶切り。")
                 ], ipa: "/kæn ˈəʊpənɐ/"),
            make("buff", "polish; a fan or muscular person",
                 "磨く・愛好家・筋肉質の",
                 useCases: ["磨く動作、ファン、または鍛えられた体を表すとき"],
                 examples: [
                    ("Buff the floor.", "床を磨く。"),
                    ("History buff.", "歴史愛好家。")
                 ], ipa: "/bˈʌf/"),
            make("dehumidifier", "a device that removes moisture from air",
                 "除湿機",
                 useCases: ["湿度を下げる家電を表すとき"],
                 examples: [
                    ("Run the dehumidifier.", "除湿機を稼働。"),
                    ("Need a dehumidifier.", "除湿機が必要。")
                 ], ipa: "/dˌiːhjˈuːmɪdˌɪfaɪə/"),
            make("outlet", "an electrical socket; a means of release",
                 "コンセント・はけ口",
                 useCases: ["電源差込口、または感情の発散先を表すとき"],
                 examples: [
                    ("Plug into the outlet.", "コンセントに差して。"),
                    ("Creative outlet.", "創造的なはけ口。")
                 ], ipa: "/ˈaʊtlɛt/"),
            make("square", "a four-sided shape with equal sides",
                 "正方形・四角",
                 useCases: ["幾何学的な形や町の広場を表すとき"],
                 examples: [
                    ("Town square.", "町の広場。"),
                    ("Draw a square.", "正方形を描いて。")
                 ], ipa: "/skwˈeə/"),
            make("triangle", "a three-sided shape",
                 "三角形",
                 useCases: ["三辺の図形や三角関係を表すとき"],
                 examples: [
                    ("Draw a triangle.", "三角形を描いて。"),
                    ("Love triangle.", "三角関係。")
                 ], ipa: "/tɹˈaɪæŋɡəl/"),
            make("cube", "a six-sided 3D shape",
                 "立方体・キューブ",
                 useCases: ["立体的な六面体を表すとき"],
                 examples: [
                    ("Ice cube.", "氷のキューブ。"),
                    ("Rubik's cube.", "ルービックキューブ。")
                 ], ipa: "/kjˈuːb/"),
            make("cubicle", "a small partitioned space",
                 "間仕切りの個室・キュービクル",
                 useCases: ["オフィスの仕切られた個人スペースを表すとき"],
                 examples: [
                    ("Office cubicle.", "オフィスのキュービクル。"),
                    ("Stuck in a cubicle.", "個室作業漬け。")
                 ], ipa: "/kjˈuːbɪkəl/")
        ]
    }

    // MARK: - 食べ物・動物 (追加 5)

    private static var foodAndAnimals36: [Word] {
        [
            make("stir fry", "cook quickly in oil while stirring",
                 "炒め物・炒める",
                 useCases: ["中華風の炒め料理を表すとき"],
                 examples: [
                    ("Stir fry vegetables.", "野菜を炒める。"),
                    ("Beef stir fry.", "牛肉の炒め物。")
                 ], ipa: "/stˈɜː fɹˈaɪ/"),
            make("saute", "fry briefly over high heat",
                 "ソテーする",
                 useCases: ["フライパンで短時間に炒める調理"],
                 examples: [
                    ("Saute the onions.", "玉ねぎをソテー。"),
                    ("Saute in butter.", "バターでソテー。")
                 ], ipa: "/sˈɔːteɪ/"),
            make("crayfish", "a freshwater crustacean",
                 "ザリガニ",
                 useCases: ["淡水に住む甲殻類を表すとき"],
                 examples: [
                    ("Catch crayfish.", "ザリガニを獲る。"),
                    ("Crayfish boil.", "ザリガニ茹で(料理)。")
                 ], ipa: "/kɹˈeɪfɪʃ/"),
            make("parrot", "a colorful talking bird",
                 "オウム",
                 useCases: ["話す鳥、または「人の言葉を繰り返す」比喩"],
                 examples: [
                    ("Talking parrot.", "おしゃべりオウム。"),
                    ("Don't parrot me.", "オウム返しするな。")
                 ], ipa: "/pˈæɹət/"),
            make("equal", "the same in quantity or status",
                 "等しい・平等な",
                 useCases: ["量や立場が同じであることを表すとき"],
                 examples: [
                    ("Equal rights.", "平等な権利。"),
                    ("All men are equal.", "人は皆平等。")
                 ], ipa: "/ˈiːkwəl/")
        ]
    }

    // MARK: - 概念・状態 (追加 6)

    private static var conceptStates36: [Word] {
        [
            make("speedily", "rapidly",
                 "速やかに・急いで",
                 useCases: ["迅速に行うことを表す副詞"],
                 examples: [
                    ("Speedily resolved.", "速やかに解決。"),
                    ("Reply speedily.", "速やかに返信。")
                 ], ipa: "/spˈiːdɪlɪ/"),
            make("infamous", "well-known for a bad reason",
                 "悪名高い",
                 useCases: ["悪い意味で有名なものを表すとき"],
                 examples: [
                    ("Infamous criminal.", "悪名高い犯罪者。"),
                    ("Infamous for ~", "〜で悪名高い。")
                 ], ipa: "/ˈɪnfəməs/"),
            make("epidemic", "a widespread outbreak of disease",
                 "(病気の)流行・蔓延",
                 useCases: ["特定地域で病気が広がる状況を表すとき"],
                 examples: [
                    ("Flu epidemic.", "インフル流行。"),
                    ("An epidemic of obesity.", "肥満の蔓延。")
                 ], ipa: "/ˌɛpɪdˈɛmɪk/"),
            make("career", "a chosen occupation",
                 "キャリア・職業",
                 useCases: ["長期的な職業人生を表すとき"],
                 examples: [
                    ("Career path.", "キャリアパス。"),
                    ("Career change.", "転職。")
                 ], ipa: "/kəɹˈiə/"),
            make("height", "the measurement from base to top",
                 "高さ・身長",
                 useCases: ["人の身長や物の高さを表すとき"],
                 examples: [
                    ("What's your height?", "身長は?"),
                    ("Height of the building.", "建物の高さ。")
                 ], ipa: "/hˈaɪt/"),
            make("indigenous", "originating naturally in a region",
                 "先住の・原産の",
                 useCases: ["先住民や原産の動植物を表すとき"],
                 examples: [
                    ("Indigenous people.", "先住民。"),
                    ("Indigenous to Japan.", "日本原産の。")
                 ], ipa: "/ɪndˈɪdʒənəs/")
        ]
    }

    // MARK: - 仮定・推測 (追加 9)

    private static var assumptionPhrases37: [Word] {
        [
            make("feel like V-ing", "be in the mood to",
                 "〜したい気分",
                 useCases: ["今の気分や欲求を表すとき"],
                 examples: [
                    ("Feel like eating pizza.", "ピザ食べたい気分。"),
                    ("Don't feel like working.", "働く気がしない。")
                 ], ipa: "/fˈiːl lˈaɪk vˈiːˈɪŋ/"),
            make("there is no way", "it's impossible that",
                 "〜のはずがない・ありえない",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("There is no way I'd do that.", "そんなことするわけない。"),
                    ("There's no way!", "ありえない!")
                 ], ipa: "/ðeəɹ ɪz nˈəʊ wˈeɪ/"),
            make("I wonder if", "I'm not sure whether",
                 "〜かしら・〜だろうか",
                 useCases: ["控えめに疑問や推測を表すとき"],
                 examples: [
                    ("I wonder if it'll rain.", "雨かなぁ。"),
                    ("I wonder if she's home.", "彼女家にいるかな。")
                 ], ipa: "/aɪ wˈʌndɐɹ ɪf/"),
            make("out of curiosity", "because I'm curious",
                 "好奇心から・ちょっと興味で",
                 useCases: ["余計な質問を控えめにする前置き"],
                 examples: [
                    ("Out of curiosity, how old are you?", "ちょっと興味なんだけど、何歳?"),
                    ("Just out of curiosity, ~", "好奇心からだけど〜")
                 ], ipa: "/ˌaʊtəv kjˌɔːɹɪˈɒsɪtɪ/"),
            make("if that makes sense", "if that's clear",
                 "意味通じてれば・分かるかな",
                 useCases: ["説明後に相手の理解を確認するとき"],
                 examples: [
                    ("It's complicated, if that makes sense.", "複雑だけど、伝わるかな。"),
                    ("If that makes sense at all.", "もし通じてれば。")
                 ], ipa: "/ɪf ðæt mˌeɪks sˈɛns/"),
            make("If I were to do", "if I happened to do",
                 "もし仮に〜するとしたら",
                 useCases: ["可能性の低い仮定をするとき"],
                 examples: [
                    ("If I were to quit, ~", "仮に辞めるとしたら〜"),
                    ("If I were to choose, ~", "選ぶとしたら〜")
                 ], ipa: "/ɪf aɪ wɜː tə dˈuː/"),
            make("it's said that", "people say that",
                 "〜と言われている",
                 useCases: ["伝聞・通説を伝えるとき"],
                 examples: [
                    ("It's said that he's rich.", "彼は金持ちと言われている。"),
                    ("It's said that ~", "〜と言われている。")
                 ], ipa: "/ɪts sˈɛd ðˈæt/"),
            make("let's say", "suppose; for example",
                 "例えば・仮に",
                 useCases: ["仮定や例示の前置きとして"],
                 examples: [
                    ("Let's say it costs $100.", "例えば100ドルとすると。"),
                    ("Let's say you're right.", "仮に君が正しいとして。")
                 ], ipa: "/lˈɛts sˈeɪ/"),
            make("more like", "actually more accurately",
                 "どちらかというと・むしろ",
                 useCases: ["相手の発言を訂正したり言い直したりするとき"],
                 examples: [
                    ("Tired? More like exhausted.", "疲れた?いや、ヘトヘトだよ。"),
                    ("It's more like blue than green.", "緑というよりは青。")
                 ], ipa: "/mˈɔː lˈaɪk/")
        ]
    }

    // MARK: - 構文・関係 (追加 8)

    private static var sentencePatterns37: [Word] {
        [
            make("at the stage where", "at a point at which",
                 "〜という段階で",
                 useCases: ["進行段階や成長フェーズを表すとき"],
                 examples: [
                    ("At the stage where decisions matter.", "決断が大事な段階で。"),
                    ("We're at the stage where ~", "我々は〜の段階。")
                 ], ipa: "/æt ðə stˈeɪdʒ wˈeə/"),
            make("is worth V-ing", "deserves doing",
                 "〜する価値がある",
                 useCases: ["何かが価値のあることを表すとき"],
                 examples: [
                    ("This book is worth reading.", "この本は読む価値あり。"),
                    ("Worth trying.", "試す価値あり。")
                 ], ipa: "/ɪz wˈɜːθ vˈiːˈɪŋ/"),
            make("without V-ing", "not doing",
                 "〜せずに",
                 useCases: ["動作なしの状態を表すとき"],
                 examples: [
                    ("Without asking.", "尋ねずに。"),
                    ("Without saying a word.", "一言も言わずに。")
                 ], ipa: "/wɪðˌaʊt vˈiːˈɪŋ/"),
            make("with sth C", "with object + complement",
                 "〜を…の状態で(付帯状況)",
                 useCases: ["with + 目的語 + 補語の付帯状況構文"],
                 examples: [
                    ("With his eyes closed.", "目を閉じたまま。"),
                    ("With dinner ready.", "夕食ができた状態で。")
                 ], ipa: "/wɪð sˈʌmθɪŋ sˈiː/"),
            make("What I like about sth", "the thing I appreciate is",
                 "〜について好きなのは",
                 useCases: ["人や物の好きな点を強調するとき"],
                 examples: [
                    ("What I like about him is his honesty.", "彼の好きなところは正直さ。"),
                    ("What I like about this place is the view.", "この場所の良さは景色。")
                 ], ipa: "/wˌɒt aɪ lˈaɪk ɐbˌaʊt sˈʌmθɪŋ/"),
            make("when it comes to", "regarding; concerning",
                 "〜のこととなると",
                 useCases: ["特定の話題に焦点を絞るとき"],
                 examples: [
                    ("When it comes to cooking, she's the best.", "料理となると彼女が一番。"),
                    ("When it comes to money, ~", "お金のこととなると〜")
                 ], ipa: "/wˌɛn ɪt kˈʌmz tuː/"),
            make("be going to have to do", "will need to do",
                 "〜しなければならなくなる",
                 useCases: ["将来必要になるであろう行動を予測するとき"],
                 examples: [
                    ("You're going to have to leave.", "出なきゃならなくなるよ。"),
                    ("We're going to have to decide soon.", "そろそろ決めなきゃ。")
                 ], ipa: "/biː ɡˌəʊɪŋ tə hæv tə dˈuː/"),
            make("the reason V-ing", "the cause of doing",
                 "〜する理由",
                 useCases: ["動名詞の前に置いて理由を表す構文"],
                 examples: [
                    ("The reason for crying.", "泣いている理由。"),
                    ("The reason for asking.", "尋ねる理由。")
                 ], ipa: "/ðə ɹˈiːzən vˈiːˈɪŋ/")
        ]
    }

    // MARK: - 表現・返事 (追加 8)

    private static var responsePhrases37: [Word] {
        [
            make("I know, right", "exactly; I agree",
                 "それな・分かる",
                 useCases: ["相手の意見に強く共感するとき"],
                 examples: [
                    ("I know, right?", "それな?"),
                    ("So annoying! — I know, right.", "イラつくよね — それな。")
                 ], ipa: "/aɪ nˈəʊ ɹˈaɪt/"),
            make("what is called", "the thing referred to as",
                 "いわゆる〜",
                 useCases: ["俗に呼ばれる名称を紹介するとき"],
                 examples: [
                    ("This is what is called a vibe.", "これがいわゆる「雰囲気」。"),
                    ("It's what is called a classic.", "いわゆる定番。")
                 ], ipa: "/wˌɒt ɪz kˈɔːld/"),
            make("fair point", "a reasonable argument",
                 "それは一理ある",
                 useCases: ["相手の意見を認めるとき"],
                 examples: [
                    ("Fair point.", "なるほど。"),
                    ("That's a fair point.", "一理ある。")
                 ], ipa: "/fˈeə pˈɔɪnt/"),
            make("more about", "additional information about",
                 "〜についてもっと",
                 useCases: ["話題の詳細を求める/提供するとき"],
                 examples: [
                    ("Tell me more about it.", "もっと教えて。"),
                    ("More about that later.", "詳しくは後ほど。")
                 ], ipa: "/mˈɔːɹ ɐbˈaʊt/"),
            make("in general", "broadly speaking",
                 "一般的に・概して",
                 useCases: ["広く一般論を述べるとき"],
                 examples: [
                    ("In general, this is true.", "一般的に言って真実。"),
                    ("People in general.", "一般的な人々。")
                 ], ipa: "/ɪn dʒˈɛnəɹəl/"),
            make("process", "a series of actions; treat formally",
                 "プロセス・処理する",
                 useCases: ["手順や情報・感情を処理することを表すとき"],
                 examples: [
                    ("Long process.", "長いプロセス。"),
                    ("Process the data.", "データを処理する。")
                 ], ipa: "/pɹˈəʊsɛs/"),
            make("instead", "in place of that",
                 "代わりに",
                 useCases: ["別の選択肢を提示するとき"],
                 examples: [
                    ("Tea instead of coffee.", "コーヒーじゃなくお茶を。"),
                    ("Go home instead.", "代わりに帰る。")
                 ], ipa: "/ɪnstˈɛd/"),
            make("if that works for you", "if it suits you",
                 "それで都合よければ",
                 useCases: ["提案を控えめに伝えるとき"],
                 examples: [
                    ("Friday at 3, if that works for you.", "金曜3時で都合よければ。"),
                    ("If that works for you, let me know.", "都合よければ教えて。")
                 ], ipa: "/ɪf ðæt wˈɜːks fɔː juː/")
        ]
    }

    // MARK: - ビジネス会話 (追加 10)

    private static var businessComms38: [Word] {
        [
            make("inbox", "where incoming messages are stored",
                 "受信トレイ",
                 useCases: ["メールやメッセージの受信箱を表すとき"],
                 examples: [
                    ("Check your inbox.", "受信トレイ確認して。"),
                    ("Inbox is full.", "受信箱がいっぱい。")
                 ], ipa: "/ˈɪnbɒks/"),
            make("go through sth", "examine or experience",
                 "〜に目を通す・〜を経験する",
                 useCases: ["書類などを精査するとき、または辛い経験"],
                 examples: [
                    ("Go through the report.", "報告書を読み込む。"),
                    ("Go through tough times.", "辛い時期を経験する。")
                 ], ipa: "/ɡˌəʊ θɹuː sˈʌmθɪŋ/"),
            make("clarify sth", "make clearer",
                 "〜を明確にする",
                 useCases: ["曖昧な点をはっきりさせるとき"],
                 examples: [
                    ("Clarify the point.", "要点を明確にする。"),
                    ("Let me clarify.", "明確にさせて。")
                 ], ipa: "/klˈæɹɪfˌaɪ sˈʌmθɪŋ/"),
            make("just to confirm", "to verify briefly",
                 "念のため確認すると",
                 useCases: ["情報を再確認する前置きとして"],
                 examples: [
                    ("Just to confirm, 3 PM?", "念のため、3時で?"),
                    ("Just to confirm the schedule.", "予定の確認まで。")
                 ], ipa: "/dʒˈʌst tə kənfˈɜːm/"),
            make("due", "expected by a certain time",
                 "期日の・〜の予定",
                 useCases: ["締切や予定日を表すとき"],
                 examples: [
                    ("Report due Friday.", "金曜が期日の報告書。"),
                    ("Due in May.", "5月予定。")
                 ], ipa: "/djˈuː/"),
            make("meet up", "gather together",
                 "会う・集まる",
                 useCases: ["友人や同僚と落ち合うとき"],
                 examples: [
                    ("Let's meet up tomorrow.", "明日会おう。"),
                    ("Meet up at 5.", "5時に集合。")
                 ], ipa: "/mˈiːt ˈʌp/"),
            make("have a conflict", "have a scheduling clash",
                 "(予定が)かぶる",
                 useCases: ["既に他の予定があり都合がつかないとき"],
                 examples: [
                    ("I have a conflict that day.", "その日は予定がかぶる。"),
                    ("Sorry, have a conflict.", "ごめん、予定が重なってる。")
                 ], ipa: "/hæv ɐ kˈɒnflɪkt/"),
            make("assist sb with", "help someone with",
                 "〜を手伝う",
                 useCases: ["何かを手伝う依頼や申し出をするとき"],
                 examples: [
                    ("Can you assist me with this?", "これ手伝ってくれる?"),
                    ("Happy to assist you with anything.", "何でも喜んでお手伝い。")
                 ], ipa: "/ɐsˈɪst sˈʌmbɒdɪ wɪð/"),
            make("collaborate", "work jointly on",
                 "共同で取り組む",
                 useCases: ["協力してプロジェクトを進めるとき"],
                 examples: [
                    ("Collaborate on a project.", "プロジェクトで協力する。"),
                    ("Let's collaborate.", "一緒にやろう。")
                 ], ipa: "/kəlˈæbəɹˌeɪt/"),
            make("my part", "the portion belonging to me",
                 "私の分担・私の部分",
                 useCases: ["責任や役割の自分の分を指すとき"],
                 examples: [
                    ("I did my part.", "自分の分はやった。"),
                    ("That's my part of the job.", "それが私の仕事分。")
                 ], ipa: "/maɪ pˈɑːt/")
        ]
    }

    // MARK: - 動詞・状況 (追加 10)

    private static var actionResponses38: [Word] {
        [
            make("have a weekend", "spend a weekend (often with adj)",
                 "週末を過ごす",
                 useCases: ["週末について話すとき(Have a good weekend など)"],
                 examples: [
                    ("Have a good weekend!", "よい週末を!"),
                    ("Had a great weekend.", "いい週末だった。")
                 ], ipa: "/hæv ɐ wiːkˈɛnd/"),
            make("talk to sb about sth", "discuss with someone",
                 "(人)と(物事)について話す",
                 useCases: ["特定の話題について誰かと話すとき"],
                 examples: [
                    ("Talk to him about it.", "彼にそのこと話して。"),
                    ("Need to talk to you about something.", "ちょっと話があるんだ。")
                 ], ipa: "/tˈɔːk tə sˈʌmbɒdɪ ɐbˌaʊt sˈʌmθɪŋ/"),
            make("bother sb", "trouble or annoy someone",
                 "〜の邪魔をする・困らせる",
                 useCases: ["相手の手間や時間を取らせるとき"],
                 examples: [
                    ("Sorry to bother you.", "邪魔してごめん。"),
                    ("Don't bother him.", "彼を邪魔しないで。")
                 ], ipa: "/bˈɒðɐ sˈʌmbɒdɪ/"),
            make("interrupt", "break the continuity of",
                 "中断する・口を挟む",
                 useCases: ["会話や作業を遮るとき"],
                 examples: [
                    ("Sorry to interrupt.", "話の腰折ってごめん。"),
                    ("Don't interrupt me.", "邪魔しないで。")
                 ], ipa: "/ˈɪntəɹˌʌpt/"),
            make("see your point", "understand your view",
                 "言いたいこと分かる",
                 useCases: ["相手の論理を理解したと示すとき"],
                 examples: [
                    ("I see your point.", "なるほど。"),
                    ("I see your point, but ~", "言いたいことは分かるけど〜")
                 ], ipa: "/sˈiː jɔː pˈɔɪnt/"),
            make("before we end", "before we wrap up",
                 "終わる前に",
                 useCases: ["会議や通話を締めくくる前に話を残すとき"],
                 examples: [
                    ("Before we end, any questions?", "終わる前に質問は?"),
                    ("One last thing before we end.", "終わる前に最後に一つ。")
                 ], ipa: "/bɪfˌɔː wiː ˈɛnd/"),
            make("later", "at some time afterward",
                 "後で・じゃあね",
                 useCases: ["時間的に後、または別れの挨拶"],
                 examples: [
                    ("Talk later.", "また後で。"),
                    ("See you later!", "じゃあね!")
                 ], ipa: "/lˈeɪtɐ/"),
            make("swamped", "overwhelmed with work",
                 "仕事に追われている",
                 useCases: ["業務でいっぱいいっぱいの状態を表すとき"],
                 examples: [
                    ("I'm swamped right now.", "今めっちゃ忙しい。"),
                    ("Totally swamped this week.", "今週は完全に手一杯。")
                 ], ipa: "/swˈɒmpt/"),
            make("can it", "stop talking; (also: container)",
                 "黙れ・止めて",
                 useCases: ["うるさい人を黙らせる強めの口語、または「缶詰にする」"],
                 examples: [
                    ("Can it!", "黙れ!"),
                    ("Just can it, please.", "もう静かにして。")
                 ], ipa: "/kˈæn ɪt/"),
            make("run behind", "be late or delayed",
                 "予定より遅れている",
                 useCases: ["スケジュールが押しているとき"],
                 examples: [
                    ("Running behind today.", "今日は予定が押してる。"),
                    ("We're running behind schedule.", "予定より遅れてる。")
                 ], ipa: "/ɹˈʌn bɪhˈaɪnd/")
        ]
    }

    // MARK: - カジュアル反応 (追加 9)

    private static var casualReactions39: [Word] {
        [
            make("catch sb", "find or meet someone",
                 "(人を)捕まえる・つかまえる",
                 useCases: ["遭遇する、または時間を取らせるとき"],
                 examples: [
                    ("Catch you later!", "また後でね!"),
                    ("Caught me at a bad time.", "悪い時に捕まった。")
                 ], ipa: "/kˈætʃ sˈʌmbɒdɪ/"),
            make("do well", "perform successfully",
                 "うまくやる・成績がいい",
                 useCases: ["仕事や試験で成果を出すとき"],
                 examples: [
                    ("He's doing well.", "彼は順調。"),
                    ("Hope you do well!", "うまくいくといいね!")
                 ], ipa: "/dˈuː wˈɛl/"),
            make("it's time to do", "the moment has come to",
                 "そろそろ〜する時間だ",
                 useCases: ["行動を開始する時を促すとき"],
                 examples: [
                    ("It's time to go.", "もう行く時間。"),
                    ("It's time to make a change.", "変える時。")
                 ], ipa: "/ɪts tˈaɪm tə dˈuː/"),
            make("guess", "estimate or suppose",
                 "推測する・たぶん",
                 useCases: ["確信なく予想するとき"],
                 examples: [
                    ("I guess so.", "たぶんね。"),
                    ("Guess what!", "聞いて!")
                 ], ipa: "/ɡˈɛs/"),
            make("sounds like a plan", "that's a good plan",
                 "それでいこう・いい案",
                 useCases: ["相手の提案に賛同するとき"],
                 examples: [
                    ("Sounds like a plan!", "それでいこう!"),
                    ("Yeah, sounds like a plan.", "うん、それいいね。")
                 ], ipa: "/sˈaʊndz lˈaɪk ɐ plˈæn/"),
            make("tied up", "busy with something",
                 "手が離せない・予定が詰まっている",
                 useCases: ["忙しくて対応できないことを伝えるとき"],
                 examples: [
                    ("I'm tied up at the moment.", "今手が離せない。"),
                    ("Tied up all day.", "一日中忙しい。")
                 ], ipa: "/tˈaɪd ˈʌp/"),
            make("call it a day", "stop working for the day",
                 "今日はここまでにする",
                 useCases: ["作業や仕事を切り上げるとき"],
                 examples: [
                    ("Let's call it a day.", "今日はここまでにしよう。"),
                    ("I'm calling it a day.", "もう切り上げる。")
                 ], ipa: "/kˈɔːl ɪt ɐ dˈeɪ/"),
            make("my thing", "what I personally enjoy or do",
                 "私の得意・好きな分野",
                 useCases: ["自分の得意分野や好みを表すとき"],
                 examples: [
                    ("Not really my thing.", "あんまり私の好みじゃない。"),
                    ("That's my thing.", "それ私の得意分野。")
                 ], ipa: "/maɪ θˈɪŋ/"),
            make("fingers crossed", "hoping for good luck",
                 "うまくいきますように・幸運を祈って",
                 useCases: ["願掛けや幸運を祈るときの口語表現"],
                 examples: [
                    ("Fingers crossed!", "うまくいきますように!"),
                    ("Keep your fingers crossed for me.", "祈ってて。")
                 ], ipa: "/fˈɪŋɡəz kɹˈɒst/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var verbsActions40: [Word] {
        [
            make("pray", "speak to a deity; hope strongly",
                 "祈る",
                 useCases: ["宗教的に祈る、または強く願うとき"],
                 examples: [
                    ("Pray for peace.", "平和を祈る。"),
                    ("I'm praying for you.", "あなたのために祈ってる。")
                 ], ipa: "/pɹˈeɪ/"),
            make("play", "engage in activity for enjoyment",
                 "遊ぶ・演奏する・(役を)演じる",
                 useCases: ["遊び、演奏、演技などを表すとき"],
                 examples: [
                    ("Play the piano.", "ピアノを弾く。"),
                    ("Kids play outside.", "子供たちは外で遊ぶ。")
                 ], ipa: "/plˈeɪ/"),
            make("cheat", "act dishonestly; be unfaithful",
                 "ズルする・カンニングする・浮気する",
                 useCases: ["不正行為や裏切りを表すとき"],
                 examples: [
                    ("Don't cheat.", "ズルしないで。"),
                    ("He cheated on her.", "彼が彼女を裏切った。")
                 ], ipa: "/tʃˈiːt/"),
            make("involved", "actively engaged in",
                 "関わっている・複雑な",
                 useCases: ["何かに巻き込まれている、または込み入っている状態"],
                 examples: [
                    ("Get involved.", "関わる。"),
                    ("It's complicated and involved.", "複雑で込み入ってる。")
                 ], ipa: "/ɪnvˈɒlvd/"),
            make("beat", "defeat; hit rhythmically",
                 "打ち負かす・拍子・脈動",
                 useCases: ["勝つこと、または音や心臓のリズムを表すとき"],
                 examples: [
                    ("Beat the record.", "記録を破る。"),
                    ("Heart beat.", "心臓の鼓動。")
                 ], ipa: "/bˈiːt/"),
            make("juggle", "balance multiple tasks; toss objects",
                 "ジャグリング・複数を同時にこなす",
                 useCases: ["仕事や責任を複数同時に処理するとき"],
                 examples: [
                    ("Juggle work and family.", "仕事と家庭を両立。"),
                    ("Juggle three balls.", "ボール3つでジャグリング。")
                 ], ipa: "/dʒˈʌɡəl/"),
            make("tingle", "feel a slight prickling sensation",
                 "ピリピリする・ゾクゾクする",
                 useCases: ["皮膚がピリピリしたり期待で興奮する感覚"],
                 examples: [
                    ("Tingling sensation.", "ピリピリ感。"),
                    ("Tingled with excitement.", "ゾクゾクするほどワクワクした。")
                 ], ipa: "/tˈɪŋɡəl/"),
            make("toggle", "switch between two states",
                 "切り替える・トグル",
                 useCases: ["設定やスイッチをON/OFF切り替えるとき"],
                 examples: [
                    ("Toggle the switch.", "スイッチを切り替える。"),
                    ("Toggle between modes.", "モードを切り替える。")
                 ], ipa: "/tˈɒɡəl/"),
            make("trust", "believe in reliability",
                 "信頼する・信頼",
                 useCases: ["人や情報を信用するとき"],
                 examples: [
                    ("Trust me.", "信じて。"),
                    ("Build trust.", "信頼を築く。")
                 ], ipa: "/tɹˈʌst/"),
            make("have access", "be able to use or enter",
                 "アクセスできる・利用できる",
                 useCases: ["情報・施設・サービスを使える権限を表すとき"],
                 examples: [
                    ("Have access to the data.", "データにアクセスできる。"),
                    ("No access to the building.", "建物に入れない。")
                 ], ipa: "/hæv ˈæksɛs/")
        ]
    }

    // MARK: - 形容詞・名詞 (追加 9)

    private static var adjectiveNouns40: [Word] {
        [
            make("legitimate", "valid; lawful",
                 "正当な・合法な",
                 useCases: ["合法・正当性のあるものを表すとき"],
                 examples: [
                    ("Legitimate business.", "合法的なビジネス。"),
                    ("A legitimate concern.", "正当な懸念。")
                 ], ipa: "/lədʒˈɪtɪmət/"),
            make("method", "a way of doing something",
                 "方法・手段",
                 useCases: ["特定のやり方や手順を表すとき"],
                 examples: [
                    ("Best method.", "最良の方法。"),
                    ("Scientific method.", "科学的手法。")
                 ], ipa: "/mˈɛθəd/"),
            make("mostly", "for the most part",
                 "ほとんど・大体は",
                 useCases: ["大部分を占めることを表すとき"],
                 examples: [
                    ("Mostly true.", "ほぼ本当。"),
                    ("Mostly sunny.", "おおむね晴れ。")
                 ], ipa: "/mˈəʊstlɪ/"),
            make("talent", "natural skill or ability",
                 "才能",
                 useCases: ["生まれつきの能力や、才能ある人を表すとき"],
                 examples: [
                    ("Hidden talent.", "隠れた才能。"),
                    ("Show your talent.", "才能を見せて。")
                 ], ipa: "/tˈælənt/"),
            make("at that time", "in that period of the past",
                 "その当時・あの頃",
                 useCases: ["過去の特定の時期を指すとき"],
                 examples: [
                    ("At that time, we were young.", "あの頃は若かった。"),
                    ("At that time, no one knew.", "当時は誰も知らなかった。")
                 ], ipa: "/æt ðæt tˈaɪm/"),
            make("controversy", "disagreement or dispute",
                 "論争・物議",
                 useCases: ["意見が激しく対立する問題を表すとき"],
                 examples: [
                    ("Cause controversy.", "物議を醸す。"),
                    ("Major controversy.", "大きな論争。")
                 ], ipa: "/kˈɒntɹəvˌɜːsɪ/"),
            make("conservative", "averse to change; cautious",
                 "保守的な・控えめな",
                 useCases: ["伝統や慎重さを重んじる姿勢を表すとき"],
                 examples: [
                    ("Conservative estimate.", "控えめな見積もり。"),
                    ("Conservative views.", "保守的な考え。")
                 ], ipa: "/kənsˈɜːvətˌɪv/"),
            make("elite", "the most powerful or skilled group",
                 "エリート・選ばれた層",
                 useCases: ["上流階級や精鋭層を表すとき"],
                 examples: [
                    ("The elite few.", "選ばれし少数。"),
                    ("Elite athletes.", "一流選手。")
                 ], ipa: "/ɪlˈiːt/"),
            make("shadow", "a dark shape from blocked light",
                 "影",
                 useCases: ["物が光を遮ってできる影、または影のように付き添うこと"],
                 examples: [
                    ("Cast a shadow.", "影を落とす。"),
                    ("Shadow of doubt.", "疑いの影。")
                 ], ipa: "/ʃˈædəʊ/")
        ]
    }

    // MARK: - 会話の前置き (追加 5)

    private static var conversationOpeners41: [Word] {
        [
            make("I was just wondering", "I was thinking to ask",
                 "ちょっと聞きたかったんだけど",
                 useCases: ["相手に質問する際の控えめな前置き"],
                 examples: [
                    ("I was just wondering if you're free.", "ちょっと空いてるか聞きたくて。"),
                    ("Just wondering, ~", "ふと思ったんだけど〜")
                 ], ipa: "/aɪ wɒz dʒˈʌst wˈʌndəɹɪŋ/"),
            make("this is something that", "this is a thing which",
                 "これは〜なものだ",
                 useCases: ["重要な内容を切り出すときの前置き"],
                 examples: [
                    ("This is something that matters.", "これは重要なこと。"),
                    ("This is something that needs attention.", "これは注目すべき事柄。")
                 ], ipa: "/ðɪs ɪz sˈʌmθɪŋ ðˈæt/"),
            make("I might be, but", "I could be (something), but",
                 "(自信なく)〜かもしれないけど",
                 useCases: ["控えめに意見を表明するときの前置き"],
                 examples: [
                    ("I might be wrong, but ~", "間違ってるかもしれないけど〜"),
                    ("I might be biased, but I think so.", "偏ってるかもしれないけど、そう思う。")
                 ], ipa: "/aɪ mˌaɪt bˈiː bˈʌt/"),
            make("all about sth", "centered on something",
                 "〜が全て・〜こそが重要",
                 useCases: ["何かを最重要視する強調表現"],
                 examples: [
                    ("Life is all about choices.", "人生は選択が全て。"),
                    ("It's all about timing.", "タイミングが全て。")
                 ], ipa: "/ˈɔːl ɐbˌaʊt sˈʌmθɪŋ/"),
            make("standpoint", "a particular point of view",
                 "観点・立場",
                 useCases: ["特定の視点から議論するとき"],
                 examples: [
                    ("From my standpoint, ~", "私の観点では〜"),
                    ("Different standpoint.", "別の視点。")
                 ], ipa: "/stˈændpɔɪnt/")
        ]
    }

    // MARK: - イディオム・物 (追加 6)

    private static var idiomsObjects42: [Word] {
        [
            make("through thick and thin", "in good times and bad",
                 "どんな時も・苦楽を共に",
                 useCases: ["変わらぬ忠誠や友情を表すとき"],
                 examples: [
                    ("Friends through thick and thin.", "苦楽を共にする友。"),
                    ("Stuck with him through thick and thin.", "どんな時も彼を支えた。")
                 ], ipa: "/θɹuː θˈɪk ænd θˈɪn/"),
            make("on the fence", "undecided",
                 "決めかねている・どっちつかず",
                 useCases: ["2つの選択肢の間で迷っている状態"],
                 examples: [
                    ("I'm on the fence about it.", "それについては迷ってる。"),
                    ("Still on the fence.", "まだ決められない。")
                 ], ipa: "/ɒnðə fˈɛns/"),
            make("in your court", "your turn to act",
                 "あなたの番・判断はそちら次第",
                 useCases: ["決断や行動を相手に委ねるとき(the ball is in your court)"],
                 examples: [
                    ("The ball's in your court.", "君次第だよ。"),
                    ("It's in your court now.", "もうそっちの番。")
                 ], ipa: "/ɪn jɔː kˈɔːt/"),
            make("shell", "the hard outer covering; a casing",
                 "殻・外殻",
                 useCases: ["卵や貝、または感情的な殻を表すとき"],
                 examples: [
                    ("Crack the shell.", "殻を割る。"),
                    ("Come out of your shell.", "殻を破って。")
                 ], ipa: "/ʃˈɛl/"),
            make("shelter", "a place of safety",
                 "避難所・保護施設",
                 useCases: ["雨風・危険から守る場所、または動物保護施設"],
                 examples: [
                    ("Take shelter.", "避難する。"),
                    ("Animal shelter.", "動物保護施設。")
                 ], ipa: "/ʃˈɛltɐ/"),
            make("parade", "a public procession",
                 "パレード・行進",
                 useCases: ["祝祭などで行われる行進、または比喩で並べ立てる"],
                 examples: [
                    ("Watch the parade.", "パレードを見る。"),
                    ("Don't rain on my parade.", "私の楽しみを台無しにしないで。")
                 ], ipa: "/pəɹˈeɪd/")
        ]
    }

    // MARK: - サイズ・性質 (追加 8)

    private static var sizeQualities43: [Word] {
        [
            make("load", "a heavy weight; a quantity carried",
                 "荷物・負担・読み込む",
                 useCases: ["物理的な荷物、または読み込みやデータの量"],
                 examples: [
                    ("Heavy load.", "重い荷物。"),
                    ("Load the page.", "ページを読み込む。")
                 ], ipa: "/lˈəʊd/"),
            make("intelligent", "having mental ability",
                 "知的な・頭のいい",
                 useCases: ["賢さや判断力を表すとき"],
                 examples: [
                    ("Intelligent person.", "頭のいい人。"),
                    ("Intelligent decision.", "賢明な判断。")
                 ], ipa: "/ɪntˈɛlɪdʒənt/"),
            make("grave", "serious; a burial site",
                 "深刻な・墓",
                 useCases: ["重大な状況、または埋葬場所を表すとき"],
                 examples: [
                    ("A grave situation.", "深刻な状況。"),
                    ("Visit the grave.", "お墓参り。")
                 ], ipa: "/ɡɹˈeɪv/"),
            make("massive", "very large and heavy",
                 "巨大な・大規模な",
                 useCases: ["とても大きいものや規模の大きさを表すとき"],
                 examples: [
                    ("Massive building.", "巨大な建物。"),
                    ("Massive impact.", "甚大な影響。")
                 ], ipa: "/mˈæsɪv/"),
            make("huge", "extremely large",
                 "巨大な・とても大きな",
                 useCases: ["大きさや重要度の高さを表すとき"],
                 examples: [
                    ("Huge difference.", "大きな違い。"),
                    ("Huge fan.", "大ファン。")
                 ], ipa: "/hjˈuːdʒ/"),
            make("narrow", "small in width",
                 "狭い・細い",
                 useCases: ["幅が狭い物理的状態や限定された範囲を表すとき"],
                 examples: [
                    ("Narrow street.", "狭い道。"),
                    ("Narrow escape.", "間一髪の脱出。")
                 ], ipa: "/nˈæɹəʊ/"),
            make("pointy", "having a sharp point",
                 "とがった",
                 useCases: ["先が尖った物や顔立ちを表すとき"],
                 examples: [
                    ("Pointy shoes.", "先のとがった靴。"),
                    ("Pointy ears.", "とがった耳。")
                 ], ipa: "/pˈɔɪntɪ/"),
            make("lame", "unimpressive; (literally) limping",
                 "つまらない・(俗)ダサい",
                 useCases: ["面白くない・残念な、または身体的な不自由を表すとき"],
                 examples: [
                    ("That's so lame.", "ダサい。"),
                    ("A lame excuse.", "ひどい言い訳。")
                 ], ipa: "/lˈeɪm/")
        ]
    }

    // MARK: - 口語表現 (追加 8)

    private static var casualExpressions44: [Word] {
        [
            make("offend", "cause to feel hurt or insulted",
                 "気分を害する・侮辱する",
                 useCases: ["相手を不快にさせるとき"],
                 examples: [
                    ("Didn't mean to offend.", "気分を害するつもりはなかった。"),
                    ("Easily offended.", "怒りっぽい。")
                 ], ipa: "/əfˈɛnd/"),
            make("leave it to", "rely on someone to handle it",
                 "〜に任せる",
                 useCases: ["特定の人なら絶対やってくれると信頼するとき"],
                 examples: [
                    ("Leave it to me.", "任せて。"),
                    ("Leave it to her.", "彼女に任せて。")
                 ], ipa: "/lˈiːv ɪt tuː/"),
            make("be on sth", "be using or taking",
                 "〜を服用中・〜中",
                 useCases: ["薬・ダイエット・職務などに従事中であるとき"],
                 examples: [
                    ("She's on medication.", "彼女は薬を飲んでいる。"),
                    ("I'm on a diet.", "ダイエット中。")
                 ], ipa: "/biː ˌɒn sˈʌmθɪŋ/"),
            make("it is what it is", "accept the situation as it stands",
                 "そういうもんだ・仕方ない",
                 useCases: ["変えられない現実を受け入れる諦め交じりの表現"],
                 examples: [
                    ("It is what it is.", "そういうもんだ。"),
                    ("Well, it is what it is.", "まあ、仕方ない。")
                 ], ipa: "/ɪt ɪz wɒt ɪt ˈɪz/"),
            make("agree to disagree", "accept difference of opinion",
                 "意見の相違を認める",
                 useCases: ["議論を平和的に終える方法"],
                 examples: [
                    ("Let's agree to disagree.", "意見の相違として終わりにしよう。"),
                    ("We agreed to disagree.", "意見が合わないと受け入れた。")
                 ], ipa: "/ɐɡɹˈiː tə dˌɪsɐɡɹˈiː/"),
            make("big deal", "an important matter",
                 "大した事・大事",
                 useCases: ["重要さを強調、または逆に皮肉で「大したことない」"],
                 examples: [
                    ("Big deal!", "大したことない!(皮肉)"),
                    ("It's a big deal.", "重要なことだ。")
                 ], ipa: "/bˈɪɡ dˈiːl/"),
            make("keep sb pp", "keep someone in a state (past participle)",
                 "(人)を〜のままにしておく",
                 useCases: ["keep + 人 + 過去分詞 の構文(keep me posted など)"],
                 examples: [
                    ("Keep me posted.", "進捗教えて。"),
                    ("Keep me informed.", "情報をください。")
                 ], ipa: "/kˈiːp sˈʌmbɒdɪ pˌiːpˈiː/"),
            make("you never know", "something unexpected may happen",
                 "何が起きるかわからない",
                 useCases: ["将来の不確実性を示すとき"],
                 examples: [
                    ("You never know.", "何が起こるか分からない。"),
                    ("You never know what'll happen.", "何が起きるか分からないよ。")
                 ], ipa: "/juː nˈɛvɐ nˈəʊ/")
        ]
    }

    // MARK: - 挨拶・反応 (追加 7)

    private static var greetingsReactions45: [Word] {
        [
            make("how have you been", "how have things been for you",
                 "元気だった?",
                 useCases: ["久しぶりに会った人への挨拶"],
                 examples: [
                    ("How have you been?", "元気だった?"),
                    ("Hey! How have you been?", "やあ!最近どう?")
                 ], ipa: "/hˌaʊ hˈæv juː bˌiːn/"),
            make("give me a break", "stop bothering me; be reasonable",
                 "いい加減にして・勘弁してよ",
                 useCases: ["相手のしつこさや無理な要求に対する不満"],
                 examples: [
                    ("Oh give me a break!", "もう勘弁して!"),
                    ("Give me a break, will you?", "ちょっと許してよ。")
                 ], ipa: "/ɡˈɪv mˌiː ɐ bɹˈeɪk/"),
            make("sure thing", "of course; no problem",
                 "もちろん・了解",
                 useCases: ["快諾するときのカジュアル表現"],
                 examples: [
                    ("Sure thing!", "もちろん!"),
                    ("Sure thing, I got it.", "了解、任せて。")
                 ], ipa: "/ʃˈɔː θˈɪŋ/"),
            make("take care of yourself", "look after your wellbeing",
                 "体に気をつけて",
                 useCases: ["別れ際に相手の健康を気遣うとき"],
                 examples: [
                    ("Take care of yourself!", "体に気をつけて!"),
                    ("Take care of yourself, OK?", "お大事にね。")
                 ], ipa: "/tˈeɪk kˈeəɹ ɒv jɔːsˈɛlf/"),
            make("watch out", "be careful; beware",
                 "気をつけて・注意",
                 useCases: ["危険を警告するとき"],
                 examples: [
                    ("Watch out!", "危ない!"),
                    ("Watch out for the car!", "車に気をつけて!")
                 ], ipa: "/wˈɒtʃ ˈaʊt/"),
            make("second to none", "unsurpassed; the best",
                 "誰にも劣らない",
                 useCases: ["最高峰の品質や能力を称えるとき"],
                 examples: [
                    ("Their service is second to none.", "サービスは他に並ぶものなし。"),
                    ("Second to none in quality.", "品質では誰にも負けない。")
                 ], ipa: "/sˈɛkənd tə nˈɒn/"),
            make("have a look", "take a quick glance",
                 "見てみる・チェックする",
                 useCases: ["軽く何かを確認するとき(英国寄り)"],
                 examples: [
                    ("Have a look at this.", "これ見てみて。"),
                    ("I'll have a look.", "ちょっと見てみる。")
                 ], ipa: "/hæv ɐ lˈʊk/")
        ]
    }

    // MARK: - 状態・動詞 (追加 7)

    private static var verbStates45: [Word] {
        [
            make("coffee break", "a short break for coffee",
                 "コーヒー休憩",
                 useCases: ["仕事中の短い休憩を表すとき"],
                 examples: [
                    ("Take a coffee break.", "コーヒー休憩しよう。"),
                    ("Quick coffee break.", "サッとコーヒー休憩。")
                 ], ipa: "/kˈɒfɪ bɹˈeɪk/"),
            make("be sure", "be certain or confident",
                 "確かである・必ず〜する",
                 useCases: ["確信を伝える、または念を押すとき"],
                 examples: [
                    ("Be sure to call.", "必ず電話して。"),
                    ("Are you sure?", "本当に?")
                 ], ipa: "/biː ʃˈɔː/"),
            make("be sick of", "be tired of; fed up with",
                 "〜にうんざりしている",
                 useCases: ["何かに飽き飽きしているとき"],
                 examples: [
                    ("I'm sick of this.", "もうこれにうんざり。"),
                    ("Sick of waiting.", "待つのにうんざり。")
                 ], ipa: "/biː sˈɪk ɒv/"),
            make("can live with", "be able to accept",
                 "我慢できる・受け入れられる",
                 useCases: ["不満はあるが許容できることを表すとき"],
                 examples: [
                    ("I can live with that.", "それでよし。"),
                    ("Something I can live with.", "受け入れられること。")
                 ], ipa: "/kæn lˈɪv wɪð/"),
            make("take sth as", "interpret as; regard as",
                 "〜と受け取る・とらえる",
                 useCases: ["相手の発言や行動を特定の意味で解釈するとき"],
                 examples: [
                    ("Take it as a compliment.", "褒め言葉として受け取って。"),
                    ("Take that as a yes.", "それはイエスと受け取る。")
                 ], ipa: "/tˈeɪk sˈʌmθɪŋ æz/"),
            make("confused", "unable to think clearly",
                 "混乱した・困惑した",
                 useCases: ["状況や説明が分からないとき"],
                 examples: [
                    ("I'm confused.", "よく分からない。"),
                    ("Confused look.", "困惑した表情。")
                 ], ipa: "/kənfjˈuːzd/"),
            make("tricky", "difficult to deal with",
                 "扱いが難しい・厄介な",
                 useCases: ["微妙で慎重を要する事柄を表すとき"],
                 examples: [
                    ("Tricky question.", "厄介な質問。"),
                    ("A tricky situation.", "難しい状況。")
                 ], ipa: "/tɹˈɪkɪ/")
        ]
    }

    // MARK: - 概念・名詞 (追加 11)

    private static var conceptsNouns46: [Word] {
        [
            make("laughter", "the sound of laughing",
                 "笑い・笑い声",
                 useCases: ["人が笑う音や行為を表すとき"],
                 examples: [
                    ("Laughter is the best medicine.", "笑いは最良の薬。"),
                    ("Filled with laughter.", "笑いに満ちて。")
                 ], ipa: "/lˈɑːftɐ/"),
            make("unity", "the state of being united",
                 "団結・一体感",
                 useCases: ["人々や集団がまとまっている状態を表すとき"],
                 examples: [
                    ("Strength in unity.", "団結に力あり。"),
                    ("National unity.", "国民の団結。")
                 ], ipa: "/jˈuːnɪtɪ/"),
            make("care", "serious attention; concern",
                 "ケア・気遣い",
                 useCases: ["世話や注意を払うこと、または気にかけることを表すとき"],
                 examples: [
                    ("Take care.", "気をつけて。"),
                    ("Health care.", "医療。")
                 ], ipa: "/kˈeə/"),
            make("care for", "look after; like",
                 "〜の世話をする・〜が好き",
                 useCases: ["人や物の世話、または好み(やや改まった)を表すとき"],
                 examples: [
                    ("Care for the elderly.", "高齢者の世話をする。"),
                    ("Would you care for some tea?", "お茶はいかが?")
                 ], ipa: "/kˈeə fɔː/"),
            make("modernize", "make more modern",
                 "近代化する・現代風にする",
                 useCases: ["設備や考えを最新化するとき"],
                 examples: [
                    ("Modernize the system.", "システムを近代化する。"),
                    ("Modernize the kitchen.", "キッチンをリフォーム。")
                 ], ipa: "/mˈɒdənˌaɪz/"),
            make("thrive", "prosper; flourish",
                 "繁栄する・うまく育つ",
                 useCases: ["事業や生物が良好に成長するとき"],
                 examples: [
                    ("Business is thriving.", "ビジネスが繁盛している。"),
                    ("Children thrive on love.", "子供は愛で育つ。")
                 ], ipa: "/θɹˈaɪv/"),
            make("it has never been", "it has not previously been",
                 "今までこれほど〜だったことはない",
                 useCases: ["過去にない状態を強調する構文(It has never been + 形容詞)"],
                 examples: [
                    ("It has never been easier.", "今ほど簡単な時はない。"),
                    ("It has never been more important.", "今ほど重要な時はない。")
                 ], ipa: "/ɪt hɐz nˈɛvɐ bˌiːn/"),
            make("border", "a line separating areas",
                 "国境・境界",
                 useCases: ["国や地域、または抽象的な境目を表すとき"],
                 examples: [
                    ("Cross the border.", "国境を越える。"),
                    ("Border between countries.", "国の境。")
                 ], ipa: "/bˈɔːdɐ/"),
            make("borderline", "on the boundary; ambiguous",
                 "境界線・どっちつかずの",
                 useCases: ["明確な区分の境目や、ぎりぎりの状態を表すとき"],
                 examples: [
                    ("Borderline case.", "境界線上のケース。"),
                    ("Borderline acceptable.", "ぎりぎり許容範囲。")
                 ], ipa: "/bˈɔːdəlˌaɪn/"),
            make("in the history of", "at any time in the history",
                 "〜の歴史の中で",
                 useCases: ["史上初・史上最高などを強調するとき"],
                 examples: [
                    ("Best in the history of the team.", "チーム史上最高。"),
                    ("First time in the history of Japan.", "日本史上初。")
                 ], ipa: "/ɪnðə hˈɪstəɹɪ ɒv/"),
            make("privilege", "a special right or advantage",
                 "特権・名誉",
                 useCases: ["特別な権利や恵まれた立場を表すとき"],
                 examples: [
                    ("It's a privilege.", "光栄です。"),
                    ("Check your privilege.", "自分の特権を自覚しろ(現代的批判)。")
                 ], ipa: "/pɹˈɪvɪlɪdʒ/")
        ]
    }

    // MARK: - テクノロジー・概念 (追加 12)

    private static var techConcepts47: [Word] {
        [
            make("engineering", "the discipline of designing systems",
                 "工学・エンジニアリング",
                 useCases: ["設計や技術分野を表すとき"],
                 examples: [
                    ("Software engineering.", "ソフトウェア工学。"),
                    ("Civil engineering.", "土木工学。")
                 ], ipa: "/ˌɛndʒɪnˈiəɹɪŋ/"),
            make("scale up", "increase in size or scope",
                 "規模を拡大する",
                 useCases: ["事業や生産を大きくするとき"],
                 examples: [
                    ("Scale up the production.", "生産規模を拡大。"),
                    ("Time to scale up.", "拡大の時。")
                 ], ipa: "/skˈeɪl ˈʌp/"),
            make("scale", "size; weighing instrument; climb",
                 "規模・尺度・体重計",
                 useCases: ["大きさの度合い、または測定器・登る動作"],
                 examples: [
                    ("Large scale project.", "大規模プロジェクト。"),
                    ("Step on the scale.", "体重計に乗って。")
                 ], ipa: "/skˈeɪl/"),
            make("dialogue", "a conversation between two or more",
                 "対話・会話",
                 useCases: ["建設的な意見交換や脚本のセリフを表すとき"],
                 examples: [
                    ("Open dialogue.", "開かれた対話。"),
                    ("Dialogue between cultures.", "文化間の対話。")
                 ], ipa: "/dˈaɪəlɒɡ/"),
            make("overall", "in general; in total",
                 "全体として・全般的に",
                 useCases: ["総合的な評価や全体像を述べるとき"],
                 examples: [
                    ("Overall, it's good.", "全体的に良い。"),
                    ("Overall winner.", "総合優勝。")
                 ], ipa: "/ˌəʊvəɹˈɔːl/"),
            make("consciousness", "awareness; state of being awake",
                 "意識・自覚",
                 useCases: ["意識ある状態や問題意識を表すとき"],
                 examples: [
                    ("Lose consciousness.", "意識を失う。"),
                    ("Social consciousness.", "社会意識。")
                 ], ipa: "/kˈɒnʃəsnəs/"),
            make("earth", "the planet; soil",
                 "地球・土",
                 useCases: ["惑星としての地球、または土壌を表すとき"],
                 examples: [
                    ("Save the earth.", "地球を救え。"),
                    ("Down to earth.", "地に足が着いた。")
                 ], ipa: "/ˈɜːθ/"),
            make("advancing", "moving forward; progressing",
                 "前進している・進歩している",
                 useCases: ["技術や軍が前進している様子を表すとき"],
                 examples: [
                    ("Advancing technology.", "進歩する技術。"),
                    ("Advancing age.", "老いていく年齢。")
                 ], ipa: "/ɐdvˈænsɪŋ/"),
            make("man-made", "created by humans, not natural",
                 "人工の・人造の",
                 useCases: ["自然ではなく人間が作ったものを表すとき"],
                 examples: [
                    ("Man-made lake.", "人工湖。"),
                    ("Man-made disaster.", "人災。")
                 ], ipa: "/mˈænmˈeɪd/"),
            make("humanoid", "having a human form",
                 "ヒューマノイド・人型",
                 useCases: ["人間に似たロボットやキャラクターを表すとき"],
                 examples: [
                    ("Humanoid robot.", "人型ロボット。"),
                    ("Humanoid alien.", "人型エイリアン。")
                 ], ipa: "/hjˈuːmɐnˌɔɪd/"),
            make("optimistic", "hopeful about the future",
                 "楽観的な",
                 useCases: ["明るい未来を信じる姿勢を表すとき"],
                 examples: [
                    ("Optimistic outlook.", "楽観的な見通し。"),
                    ("Stay optimistic.", "楽観的でいよう。")
                 ], ipa: "/ˌɒptɪmˈɪstɪk/"),
            make("humanity", "human beings as a whole; kindness",
                 "人類・人間性",
                 useCases: ["人類全体や人間らしさを表すとき"],
                 examples: [
                    ("All of humanity.", "全人類。"),
                    ("Show humanity.", "人間性を見せて。")
                 ], ipa: "/hjuːmˈænɪtɪ/")
        ]
    }

    // MARK: - 政治・行動 (追加 13)

    private static var politicsActions48: [Word] {
        [
            make("risk sth", "expose to danger or loss",
                 "〜を危険にさらす",
                 useCases: ["何かを失うリスクを取るとき"],
                 examples: [
                    ("Risk your life.", "命を懸ける。"),
                    ("Risk it all.", "全てを賭ける。")
                 ], ipa: "/ɹˈɪsk sˈʌmθɪŋ/"),
            make("associate", "connect mentally; a colleague",
                 "関連付ける・仲間・連想する",
                 useCases: ["物事を結びつける、または同僚を表すとき"],
                 examples: [
                    ("Associate with success.", "成功と結びつける。"),
                    ("Business associate.", "ビジネス仲間。")
                 ], ipa: "/ɐsˈəʊsɪˌeɪt/"),
            make("artificial", "made by humans; not natural",
                 "人工の・人為的な",
                 useCases: ["自然ではなく人間が作った物を表すとき"],
                 examples: [
                    ("Artificial intelligence.", "人工知能。"),
                    ("Artificial flavors.", "人工香料。")
                 ], ipa: "/ˌɑːtɪfˈɪʃəl/"),
            make("getaway", "an escape; a holiday",
                 "逃走・休暇",
                 useCases: ["逃げる手段、または短い旅行を表すとき"],
                 examples: [
                    ("Weekend getaway.", "週末の小旅行。"),
                    ("Quick getaway.", "素早い逃走。")
                 ], ipa: "/ɡˈɛtəwˌeɪ/"),
            make("warn", "give notice of danger",
                 "警告する・注意する",
                 useCases: ["危険や問題を事前に知らせるとき"],
                 examples: [
                    ("Warn the public.", "市民に警告する。"),
                    ("I warned you.", "言ったでしょ。")
                 ], ipa: "/wˈɔːn/"),
            make("counterpart", "someone equivalent in role",
                 "対応する人・相手",
                 useCases: ["他国・他組織で同じ役割を持つ人を表すとき"],
                 examples: [
                    ("Japanese counterpart.", "日本側の担当者。"),
                    ("Meet his counterpart.", "対応する役職者と会う。")
                 ], ipa: "/kˈaʊntəpˌɑːt/"),
            make("manipulate", "control or influence skillfully",
                 "操作する・(人を)操る",
                 useCases: ["物理的に動かす、または不正に影響を及ぼすとき"],
                 examples: [
                    ("Manipulate the data.", "データを操作する。"),
                    ("Manipulate people.", "人を操る。")
                 ], ipa: "/mənˈɪpjʊlˌeɪt/"),
            make("persuade", "cause to believe or act",
                 "説得する",
                 useCases: ["相手に行動や考えを変えさせるとき"],
                 examples: [
                    ("Persuade him to come.", "彼を説得して来させる。"),
                    ("Hard to persuade.", "説得しにくい。")
                 ], ipa: "/pəswˈeɪd/"),
            make("capacity", "the ability to hold or do",
                 "容量・能力",
                 useCases: ["収容量や処理能力、または役割を表すとき"],
                 examples: [
                    ("Full capacity.", "満員・最大容量。"),
                    ("In what capacity?", "どんな立場で?")
                 ], ipa: "/kəpˈæsɪtɪ/"),
            make("specifically", "in a precise manner",
                 "具体的に・特に",
                 useCases: ["対象を限定して述べるとき"],
                 examples: [
                    ("Specifically designed for ~", "〜のために特別設計。"),
                    ("Specifically, I mean ~", "具体的には〜")
                 ], ipa: "/spəsˈɪfɪklɪ/"),
            make("point to", "indicate; suggest",
                 "〜を指し示す・示唆する",
                 useCases: ["証拠が結論を指し示すような場面で使う"],
                 examples: [
                    ("Evidence points to him.", "証拠が彼を指している。"),
                    ("Point to the door.", "ドアを指さして。")
                 ], ipa: "/pˈɔɪnt tuː/"),
            make("influence", "the capacity to affect",
                 "影響・影響を与える",
                 useCases: ["他者や状況を変える力を表すとき"],
                 examples: [
                    ("Under the influence.", "影響下で・酒気帯び。"),
                    ("Influence the outcome.", "結果に影響する。")
                 ], ipa: "/ˈɪnfluːəns/"),
            make("election", "the process of voting",
                 "選挙",
                 useCases: ["政治家や代表を選ぶ投票を表すとき"],
                 examples: [
                    ("Presidential election.", "大統領選挙。"),
                    ("Win the election.", "選挙に勝つ。")
                 ], ipa: "/ɪlˈɛkʃən/")
        ]
    }

    // MARK: - 景観・概念 (追加 7)

    private static var landscapeConcepts49: [Word] {
        [
            make("landscape", "all the features of a land area",
                 "風景・地形・状況",
                 useCases: ["景色や、業界・分野の全体像を表すとき"],
                 examples: [
                    ("Beautiful landscape.", "美しい風景。"),
                    ("Political landscape.", "政治情勢。")
                 ], ipa: "/lˈændskeɪp/"),
            make("scenery", "the natural features of a landscape",
                 "景色・風景",
                 useCases: ["旅行先や場面の美しい景色を表すとき"],
                 examples: [
                    ("Mountain scenery.", "山の景色。"),
                    ("Enjoy the scenery.", "景色を楽しむ。")
                 ], ipa: "/sˈiːnəɹɪ/"),
            make("insight", "a deep understanding",
                 "洞察・気づき",
                 useCases: ["物事の本質を見抜く力や鋭い視点を表すとき"],
                 examples: [
                    ("Valuable insight.", "貴重な洞察。"),
                    ("Gain insight.", "洞察を得る。")
                 ], ipa: "/ˈɪnsaɪt/"),
            make("critical", "extremely important; analytical",
                 "極めて重要な・批判的な",
                 useCases: ["決定的な重要性や厳しい分析を表すとき"],
                 examples: [
                    ("Critical situation.", "深刻な状況。"),
                    ("Critical thinking.", "批判的思考。")
                 ], ipa: "/kɹˈɪtɪkəl/"),
            make("formidable", "inspiring respect through size or skill",
                 "手強い・恐ろしい",
                 useCases: ["相手や課題が大きく圧倒的なとき"],
                 examples: [
                    ("A formidable opponent.", "手強い相手。"),
                    ("Formidable challenge.", "難題。")
                 ], ipa: "/fɔːmˈɪdəbəl/"),
            make("infrastructure", "basic systems supporting society",
                 "インフラ・基盤",
                 useCases: ["道路・電力・通信などの社会基盤を表すとき"],
                 examples: [
                    ("Public infrastructure.", "公共インフラ。"),
                    ("Build infrastructure.", "基盤を構築。")
                 ], ipa: "/ˈɪnfɹəstɹˌʌktʃɐ/"),
            make("transition", "the process of changing",
                 "移行・変化",
                 useCases: ["ある状態から別の状態へ移るとき"],
                 examples: [
                    ("Smooth transition.", "スムーズな移行。"),
                    ("In transition.", "移行期にある。")
                 ], ipa: "/tɹænsˈɪʃən/")
        ]
    }

    // MARK: - 動詞・状態 (追加 7)

    private static var verbStates49: [Word] {
        [
            make("double sth", "make twice as much",
                 "〜を2倍にする",
                 useCases: ["量・サイズ・価値を2倍にするとき"],
                 examples: [
                    ("Double the recipe.", "レシピを2倍に。"),
                    ("Double down.", "倍賭けする・固執する。")
                 ], ipa: "/dˈʌbəl sˈʌmθɪŋ/"),
            make("flat", "level; without slope; (also) apartment",
                 "平らな・平坦な・アパート(英)",
                 useCases: ["平らな表面、または英国式の集合住宅"],
                 examples: [
                    ("Flat surface.", "平らな面。"),
                    ("Rent a flat.", "アパートを借りる(英)。")
                 ], ipa: "/flˈæt/"),
            make("match", "be equal to; pair up; a contest",
                 "合う・試合・マッチ",
                 useCases: ["何かが釣り合う、または試合を表すとき"],
                 examples: [
                    ("Perfect match.", "ぴったり。"),
                    ("Tennis match.", "テニスの試合。")
                 ], ipa: "/mˈætʃ/"),
            make("fit", "be the right size; in shape",
                 "合う・体型が良い",
                 useCases: ["サイズが合う、または健康で引き締まっている状態"],
                 examples: [
                    ("These shoes fit.", "この靴ぴったり。"),
                    ("Stay fit.", "健康を保って。")
                 ], ipa: "/fˈɪt/"),
            make("ban sth", "officially prohibit",
                 "〜を禁止する",
                 useCases: ["政府や組織が公式に禁止するとき"],
                 examples: [
                    ("Ban smoking.", "喫煙を禁止する。"),
                    ("Banned from the site.", "サイトから締め出された。")
                 ], ipa: "/bˈæn sˈʌmθɪŋ/"),
            make("stack", "a neat pile; to arrange in piles",
                 "積み重ねる・山",
                 useCases: ["物を積み上げる、または比喩で「山積み」"],
                 examples: [
                    ("Stack of books.", "本の山。"),
                    ("Stack up against ~", "〜と比較する。")
                 ], ipa: "/stˈæk/"),
            make("dilute", "make weaker by adding water",
                 "薄める・希釈する",
                 useCases: ["液体や効果を薄めるとき"],
                 examples: [
                    ("Dilute the juice.", "ジュースを薄める。"),
                    ("Diluted message.", "薄まったメッセージ。")
                 ], ipa: "/daɪlˈuːt/")
        ]
    }

    // MARK: - 性質・抽象 (追加 7)

    private static var abstractTraits49: [Word] {
        [
            make("rapid", "happening quickly",
                 "急速な・速い",
                 useCases: ["変化や成長が早いことを表すとき(類: fast)"],
                 examples: [
                    ("Rapid growth.", "急成長。"),
                    ("Rapid response.", "迅速な対応。")
                 ], ipa: "/ɹˈæpɪd/"),
            make("adoption", "the act of taking up an idea or child",
                 "採用・養子縁組",
                 useCases: ["方針や子供を正式に受け入れるとき"],
                 examples: [
                    ("Adoption of new technology.", "新技術の採用。"),
                    ("Pet adoption.", "ペットの里親。")
                 ], ipa: "/ɐdˈɒpʃən/"),
            make("for good", "permanently",
                 "永久に・これっきり",
                 useCases: ["変化や別れが続くことを強調するとき"],
                 examples: [
                    ("Gone for good.", "永久に去った。"),
                    ("Quit for good.", "きっぱり辞める。")
                 ], ipa: "/fɔː ɡˈʊd/"),
            make("application", "the act of applying; a request",
                 "応用・申請・アプリ",
                 useCases: ["活用、申込、ソフトウェアなどを表すとき"],
                 examples: [
                    ("Job application.", "求職申請。"),
                    ("Practical application.", "実用的な応用。")
                 ], ipa: "/ˌæplɪkˈeɪʃən/"),
            make("diffusion", "the spreading of something",
                 "拡散・浸透",
                 useCases: ["物質・情報・文化などが広がるとき"],
                 examples: [
                    ("Diffusion of innovation.", "イノベーションの普及。"),
                    ("Gas diffusion.", "気体の拡散。")
                 ], ipa: "/dɪfjˈuːʒən/"),
            make("eventually", "in the end",
                 "結局・最終的に",
                 useCases: ["時間を経て最終的に何かが起こるとき"],
                 examples: [
                    ("Eventually, things worked out.", "最終的にうまくいった。"),
                    ("He'll come around eventually.", "そのうち彼も納得する。")
                 ], ipa: "/ɪvˈɛntʃuːəlɪ/"),
            make("mere", "nothing more than",
                 "ただの・ほんの",
                 useCases: ["量や重要度が少ないことを強調するとき"],
                 examples: [
                    ("A mere coincidence.", "ただの偶然。"),
                    ("Mere seconds away.", "ほんの数秒先。")
                 ], ipa: "/mˈiə/")
        ]
    }

    // MARK: - 動詞 (追加 7)

    private static var actionVerbs50: [Word] {
        [
            make("maximize", "make as great as possible",
                 "最大化する",
                 useCases: ["効果や利益を最大限にするとき"],
                 examples: [
                    ("Maximize profits.", "利益を最大化する。"),
                    ("Maximize the window.", "ウィンドウを最大化。")
                 ], ipa: "/mˈæksɪmˌaɪz/"),
            make("survive", "continue to live or exist",
                 "生き延びる・乗り切る",
                 useCases: ["危機や困難を切り抜けるとき"],
                 examples: [
                    ("Survive the storm.", "嵐を生き延びる。"),
                    ("Hard to survive.", "生き残るのが難しい。")
                 ], ipa: "/səvˈaɪv/"),
            make("express", "convey thoughts; rapid",
                 "表現する・急行の",
                 useCases: ["気持ちや考えを伝える、または急行列車を表すとき"],
                 examples: [
                    ("Express your feelings.", "気持ちを表現して。"),
                    ("Express train.", "急行列車。")
                 ], ipa: "/ɪkspɹˈɛs/"),
            make("terminate", "bring to an end",
                 "終了する・解雇する",
                 useCases: ["契約・雇用・プロセスを終わらせるとき"],
                 examples: [
                    ("Terminate the contract.", "契約を解除する。"),
                    ("Employment was terminated.", "雇用が終了した。")
                 ], ipa: "/tˈɜːmɪnˌeɪt/"),
            make("abandon", "give up completely",
                 "放棄する・見捨てる",
                 useCases: ["人や物を見捨てたり計画を放棄するとき"],
                 examples: [
                    ("Abandon ship!", "船を放棄しろ!"),
                    ("Don't abandon hope.", "希望を捨てないで。")
                 ], ipa: "/ɐbˈændən/"),
            make("choke", "block the airway; struggle to breathe",
                 "窒息する・喉を詰まらせる",
                 useCases: ["呼吸困難になる、または感情で喉が詰まるとき"],
                 examples: [
                    ("Choke on food.", "食べ物で詰まる。"),
                    ("Choke up.", "感極まる。")
                 ], ipa: "/tʃˈəʊk/"),
            make("lodge", "stay temporarily; file a complaint",
                 "宿泊する・(苦情を)申し立てる",
                 useCases: ["臨時の宿泊、または公的に苦情を提出するとき"],
                 examples: [
                    ("Lodge a complaint.", "苦情を申し立てる。"),
                    ("Lodge for the night.", "一晩宿泊する。")
                 ], ipa: "/lˈɒdʒ/")
        ]
    }

    // MARK: - 名詞・形容詞 (追加 7)

    private static var nounAdjectives50: [Word] {
        [
            make("civilization", "an advanced state of human society",
                 "文明",
                 useCases: ["人類の文化的・技術的発展段階を表すとき"],
                 examples: [
                    ("Ancient civilization.", "古代文明。"),
                    ("Modern civilization.", "現代文明。")
                 ], ipa: "/sˌɪvɪlaɪzˈeɪʃən/"),
            make("darkness", "the absence of light",
                 "暗闇・暗さ",
                 useCases: ["物理的な暗さや心の闇を表すとき"],
                 examples: [
                    ("In darkness.", "暗闇の中で。"),
                    ("Darkness of the soul.", "魂の闇。")
                 ], ipa: "/dˈɑːknəs/"),
            make("ubiquitous", "present everywhere",
                 "至るところにある・遍在する",
                 useCases: ["どこにでも見られる物事を表すとき"],
                 examples: [
                    ("Ubiquitous smartphones.", "スマホはどこにでも。"),
                    ("Ubiquitous in modern life.", "現代生活で偏在的。")
                 ], ipa: "/juːbˈɪkwɪtəs/"),
            make("universal", "applicable to all cases",
                 "普遍的な・万国の",
                 useCases: ["どこでも誰にでも当てはまるものを表すとき"],
                 examples: [
                    ("Universal truth.", "普遍的な真実。"),
                    ("Universal remote.", "汎用リモコン。")
                 ], ipa: "/jˌuːnɪvˈɜːsəl/"),
            make("view", "what can be seen; an opinion",
                 "眺め・見解",
                 useCases: ["景色や意見を表すとき"],
                 examples: [
                    ("Great view.", "素晴らしい眺め。"),
                    ("In my view, ~", "私の見解では〜")
                 ], ipa: "/vjˈuː/"),
            make("explosion", "a violent burst",
                 "爆発",
                 useCases: ["物理的な爆発や急増を表すとき"],
                 examples: [
                    ("Loud explosion.", "大きな爆発音。"),
                    ("Explosion of growth.", "爆発的成長。")
                 ], ipa: "/ɪksplˈəʊʒən/"),
            make("tiny", "very small",
                 "とても小さい",
                 useCases: ["非常に小さいものを表すとき"],
                 examples: [
                    ("Tiny insect.", "小さな虫。"),
                    ("Tiny detail.", "細かな詳細。")
                 ], ipa: "/tˈaɪnɪ/")
        ]
    }

    // MARK: - スキル・ライフスタイル (追加 7)

    private static var skillsAndStyle51: [Word] {
        [
            make("proficient", "competent or skilled",
                 "熟達した・堪能な",
                 useCases: ["特定の技能に長けていることを表すとき"],
                 examples: [
                    ("Proficient in English.", "英語に堪能。"),
                    ("Highly proficient.", "非常に熟達している。")
                 ], ipa: "/pɹəfˈɪʃənt/"),
            make("highlight", "draw attention to; the best part",
                 "強調する・ハイライト",
                 useCases: ["重要部分を目立たせる、または最高の瞬間を表すとき"],
                 examples: [
                    ("Highlight the key points.", "要点を強調する。"),
                    ("Highlight of the trip.", "旅のハイライト。")
                 ], ipa: "/hˈaɪlaɪt/"),
            make("shake", "move quickly back and forth",
                 "振る・揺れる・握手する",
                 useCases: ["物理的な揺れや、握手・震えを表すとき"],
                 examples: [
                    ("Shake hands.", "握手する。"),
                    ("The earth shakes.", "地面が揺れる。")
                 ], ipa: "/ʃˈeɪk/"),
            make("listen to", "pay attention to sound or advice",
                 "〜を聴く・〜の話を聞く",
                 useCases: ["音楽や人の意見に耳を傾けるとき"],
                 examples: [
                    ("Listen to music.", "音楽を聴く。"),
                    ("Listen to your heart.", "心の声を聴いて。")
                 ], ipa: "/lˈɪsən tuː/"),
            make("approach sth", "come near; tackle",
                 "〜に近づく・〜に取り組む",
                 useCases: ["物理的に近づく、または問題に取り掛かるとき"],
                 examples: [
                    ("Approach the problem.", "問題に取り組む。"),
                    ("Approach with care.", "慎重に近づく。")
                 ], ipa: "/ɐpɹˈəʊtʃ sˈʌmθɪŋ/"),
            make("be viewed as", "be regarded as",
                 "〜と見なされる",
                 useCases: ["世間や他者からの評価・見方を述べるとき"],
                 examples: [
                    ("Viewed as a leader.", "リーダーと見なされる。"),
                    ("Often viewed as ~", "〜と見なされがち。")
                 ], ipa: "/biː vjˈuːd æz/"),
            make("lifestyle", "a way of living",
                 "ライフスタイル・生活様式",
                 useCases: ["人々の暮らし方や習慣を表すとき"],
                 examples: [
                    ("Healthy lifestyle.", "健康的なライフスタイル。"),
                    ("Lifestyle changes.", "生活スタイルの変化。")
                 ], ipa: "/lˈaɪfstaɪl/")
        ]
    }

    // MARK: - ビジネス・分析 (追加 10)

    private static var businessAnalysis52: [Word] {
        [
            make("case study", "an in-depth analysis of a single subject",
                 "事例研究・ケーススタディ",
                 useCases: ["特定事例を詳細に分析する研究を表すとき"],
                 examples: [
                    ("A case study of success.", "成功事例の研究。"),
                    ("Present a case study.", "ケーススタディを発表。")
                 ], ipa: "/kˈeɪs stˈʌdɪ/"),
            make("tip", "a piece of advice; small reward; pointed end",
                 "ヒント・チップ・先端",
                 useCases: ["助言、サービスへの心づけ、または物の先を表すとき"],
                 examples: [
                    ("Helpful tip.", "役立つコツ。"),
                    ("Leave a tip.", "チップを置いて。")
                 ], ipa: "/tˈɪp/"),
            make("import sth", "bring goods from abroad",
                 "〜を輸入する",
                 useCases: ["外国から商品や文化を取り入れるとき"],
                 examples: [
                    ("Import wine.", "ワインを輸入する。"),
                    ("Imported from Japan.", "日本から輸入。")
                 ], ipa: "/ɪmpˈɔːt sˈʌmθɪŋ/"),
            make("compatible", "able to exist or work together",
                 "互換性のある・気の合う",
                 useCases: ["機器同士、または人同士の相性を表すとき"],
                 examples: [
                    ("Compatible with iPhone.", "iPhone対応。"),
                    ("Compatible personalities.", "気の合う性格。")
                 ], ipa: "/kəmpˈætɪbəl/"),
            make("practical", "concerned with actual use",
                 "実用的な・現実的な",
                 useCases: ["机上の理論ではなく実際に役立つことを表すとき"],
                 examples: [
                    ("Practical advice.", "実用的な助言。"),
                    ("Practical approach.", "現実的なアプローチ。")
                 ], ipa: "/pɹˈæktɪkəl/"),
            make("engaging", "charming and attractive",
                 "魅力的な・引き込まれる",
                 useCases: ["興味を引きつけ続ける内容や人物を表すとき"],
                 examples: [
                    ("Engaging story.", "引き込まれる物語。"),
                    ("Engaging speaker.", "魅力的な話し手。")
                 ], ipa: "/ɪŋɡˈeɪdʒɪŋ/"),
            make("ongoing", "continuing to happen",
                 "進行中の・継続中の",
                 useCases: ["進行している作業や状況を表すとき"],
                 examples: [
                    ("Ongoing project.", "進行中のプロジェクト。"),
                    ("Ongoing issue.", "継続中の問題。")
                 ], ipa: "/ˈɒŋɡəʊɪŋ/"),
            make("hospitality", "friendly reception of guests",
                 "おもてなし・接客",
                 useCases: ["温かい迎え入れや接客業界を表すとき"],
                 examples: [
                    ("Japanese hospitality.", "日本のおもてなし。"),
                    ("Hospitality industry.", "ホスピタリティ産業。")
                 ], ipa: "/hˌɒspɪtˈælɪtɪ/"),
            make("gesture", "a motion of the hands or body",
                 "ジェスチャー・身振り",
                 useCases: ["手振りや好意の表れを表すとき"],
                 examples: [
                    ("Hand gesture.", "手のジェスチャー。"),
                    ("Nice gesture.", "気の利いた配慮。")
                 ], ipa: "/dʒˈɛstʃɐ/"),
            make("recap", "summarize the main points",
                 "要約・おさらい",
                 useCases: ["前回の内容を簡潔にまとめるとき"],
                 examples: [
                    ("Quick recap.", "サッと振り返り。"),
                    ("Let me recap.", "おさらいさせて。")
                 ], ipa: "/ɹɪkˈæp/")
        ]
    }

    // MARK: - 動詞・関係 (追加 9)

    private static var verbsAndRelations52: [Word] {
        [
            make("establish", "set up firmly",
                 "確立する・設立する",
                 useCases: ["制度や組織、信頼を築くとき"],
                 examples: [
                    ("Establish a company.", "会社を設立する。"),
                    ("Establish trust.", "信頼を築く。")
                 ], ipa: "/ɪstˈæblɪʃ/"),
            make("detach", "separate from",
                 "切り離す・取り外す",
                 useCases: ["物理的に離す、または感情的に距離を置くとき"],
                 examples: [
                    ("Detach the cable.", "ケーブルを外す。"),
                    ("Detach emotionally.", "感情的に距離を置く。")
                 ], ipa: "/dɪtˈætʃ/"),
            make("inject", "introduce a fluid; add an element",
                 "注射する・注入する",
                 useCases: ["液体を体内に入れる、または要素を加えるとき"],
                 examples: [
                    ("Inject the medicine.", "薬を注射する。"),
                    ("Inject energy.", "活力を吹き込む。")
                 ], ipa: "/ɪndʒˈɛkt/"),
            make("factual", "based on facts",
                 "事実に基づく",
                 useCases: ["客観的な事実であることを強調するとき"],
                 examples: [
                    ("Factual report.", "事実に基づく報告。"),
                    ("Factual error.", "事実誤認。")
                 ], ipa: "/fˈæktʃuːəl/"),
            make("factor in", "include as a consideration",
                 "考慮に入れる",
                 useCases: ["計算や判断に要素を加えるとき"],
                 examples: [
                    ("Factor in shipping.", "送料を考慮に入れる。"),
                    ("Factor in fatigue.", "疲労を計算に入れる。")
                 ], ipa: "/fˈæktɐɹ ˈɪn/"),
            make("keep sth flowing", "maintain continuous movement",
                 "〜を流し続ける",
                 useCases: ["会話・物資・お金などが滞らないようにするとき"],
                 examples: [
                    ("Keep the conversation flowing.", "会話を続ける。"),
                    ("Keep cash flowing.", "現金の流れを保つ。")
                 ], ipa: "/kˈiːp sˈʌmθɪŋ flˈəʊɪŋ/"),
            make("generate", "produce or create",
                 "生み出す・発生させる",
                 useCases: ["電力や収入、アイデアを生み出すとき"],
                 examples: [
                    ("Generate electricity.", "電力を発電。"),
                    ("Generate ideas.", "アイデアを生む。")
                 ], ipa: "/dʒˈɛnəɹˌeɪt/"),
            make("by extension", "as a logical consequence",
                 "延長線上で・つまり",
                 useCases: ["論理的に派生する結論や対象を示すとき"],
                 examples: [
                    ("And by extension, his family.", "ひいては彼の家族も。"),
                    ("By extension, we benefit.", "結果として我々も恩恵を受ける。")
                 ], ipa: "/baɪ ɪkstˈɛnʃən/"),
            make("encourage", "give support and confidence",
                 "励ます・促進する",
                 useCases: ["人を励ましたり、行動を後押しするとき"],
                 examples: [
                    ("Encourage creativity.", "創造性を促進。"),
                    ("Encourage your team.", "チームを励まして。")
                 ], ipa: "/ɪŋkˈʌɹɪdʒ/")
        ]
    }

    // MARK: - その他名詞 (追加 3)

    private static var miscNouns53: [Word] {
        [
            make("idol", "a person greatly admired; an icon",
                 "アイドル・偶像",
                 useCases: ["憧れの人物や崇拝対象を表すとき"],
                 examples: [
                    ("Childhood idol.", "子供の頃の憧れ。"),
                    ("Pop idol.", "ポップアイドル。")
                 ], ipa: "/ˈaɪdəl/"),
            make("quotation", "a passage cited from someone",
                 "引用・見積もり",
                 useCases: ["有名な引用句、または価格の見積もりを表すとき"],
                 examples: [
                    ("Famous quotation.", "有名な引用句。"),
                    ("Request a quotation.", "見積もりを依頼する。")
                 ], ipa: "/kwəʊtˈeɪʃən/"),
            make("status", "the position or condition of something",
                 "地位・状態・ステータス",
                 useCases: ["社会的立場や物事の現状を表すとき"],
                 examples: [
                    ("Social status.", "社会的地位。"),
                    ("Status update.", "近況・更新情報。")
                 ], ipa: "/stˈeɪtəs/")
        ]
    }

    // MARK: - 状態・判断 (追加 12)

    private static var statesAndJudgments54: [Word] {
        [
            make("as things stand", "given the current situation",
                 "今のところは・現状では",
                 useCases: ["現状を踏まえて判断や予測をするとき"],
                 examples: [
                    ("As things stand, we'll lose.", "今の状況では負ける。"),
                    ("As things stand, no changes.", "現状では変更なし。")
                 ], ipa: "/æz θˈɪŋz stˈænd/"),
            make("all things considered", "taking everything into account",
                 "全てを考慮すると",
                 useCases: ["全体的な評価を述べるとき"],
                 examples: [
                    ("All things considered, it went well.", "総合的に見てうまくいった。"),
                    ("All things considered, we did our best.", "全てを考えると最善を尽くした。")
                 ], ipa: "/ˈɔːl θˈɪŋz kənsˈɪdəd/"),
            make("without a doubt", "with absolute certainty",
                 "間違いなく",
                 useCases: ["確信を強く伝えるとき"],
                 examples: [
                    ("Without a doubt, the best.", "間違いなく最高。"),
                    ("Without a doubt, he'll come.", "間違いなく彼は来る。")
                 ], ipa: "/wɪðˌaʊt ɐ dˈaʊt/"),
            make("mood swing", "an abrupt change in emotion",
                 "気分の浮き沈み・感情の波",
                 useCases: ["感情が急変することを表すとき"],
                 examples: [
                    ("Bad mood swing.", "気分の落ち込み。"),
                    ("Hormonal mood swings.", "ホルモンによる気分の波。")
                 ], ipa: "/mˈuːd swˈɪŋ/"),
            make("gut check", "a moment of honest self-evaluation",
                 "自問自答・覚悟の確認",
                 useCases: ["自分の決意や本気度を確かめるとき"],
                 examples: [
                    ("Time for a gut check.", "自問自答の時。"),
                    ("Gut check moment.", "決意を試される瞬間。")
                 ], ipa: "/ɡˈʌt tʃˈɛk/"),
            make("ego", "a person's sense of self-importance",
                 "エゴ・自尊心",
                 useCases: ["自我や自己評価について話すとき"],
                 examples: [
                    ("Big ego.", "プライドが高い。"),
                    ("Bruise the ego.", "プライドを傷つける。")
                 ], ipa: "/ˈiːɡəʊ/"),
            make("bottleneck", "a point of congestion or obstruction",
                 "ボトルネック・障害",
                 useCases: ["処理速度や進捗を遅らせている要因を表すとき"],
                 examples: [
                    ("Identify the bottleneck.", "ボトルネックを特定する。"),
                    ("Major bottleneck.", "大きな障害。")
                 ], ipa: "/bˈɒtəlnˌɛk/"),
            make("track record", "the past performance of someone",
                 "実績・経歴",
                 useCases: ["これまでの成果や信頼性を語るとき"],
                 examples: [
                    ("Solid track record.", "確かな実績。"),
                    ("Proven track record.", "証明済みの実績。")
                 ], ipa: "/tɹˈæk ɹˈɛkɔːd/"),
            make("microscope", "an instrument for viewing tiny things",
                 "顕微鏡",
                 useCases: ["細かな観察や徹底的な精査の比喩にも使う"],
                 examples: [
                    ("Under a microscope.", "顕微鏡で観察・徹底調査されて。"),
                    ("Through a microscope.", "顕微鏡を通して。")
                 ], ipa: "/mˈaɪkɹəskˌəʊp/"),
            make("micromanagement", "controlling every small detail",
                 "マイクロマネジメント・細かい管理",
                 useCases: ["上司が細部まで口出しする管理スタイルを批判するとき"],
                 examples: [
                    ("Stop the micromanagement.", "細かく口出しするのやめて。"),
                    ("Hate micromanagement.", "細かい管理が嫌い。")
                 ], ipa: "/mˌaɪkɹəʊmˈænɪdʒmənt/"),
            make("redundant", "no longer needed; excessive",
                 "余分な・冗長な・解雇された(英)",
                 useCases: ["不要な要素、または英国で「解雇」を意味するとき"],
                 examples: [
                    ("Redundant information.", "余分な情報。"),
                    ("Made redundant.", "解雇された(英)。")
                 ], ipa: "/ɹɪdˈʌndənt/"),
            make("commonplace", "ordinary; widespread",
                 "ありふれた・日常的な",
                 useCases: ["特別ではなく一般的なことを表すとき"],
                 examples: [
                    ("Commonplace issue.", "ありふれた問題。"),
                    ("Now commonplace.", "今や日常的。")
                 ], ipa: "/kˈɒmənplˌeɪs/")
        ]
    }

    // MARK: - 動詞・行動 (追加 10)

    private static var actionVerbs55: [Word] {
        [
            make("socialize", "interact with others socially",
                 "社交する・人付き合いする",
                 useCases: ["パーティーや人付き合いをすることを表すとき"],
                 examples: [
                    ("I don't socialize much.", "あまり社交的じゃない。"),
                    ("Socialize with coworkers.", "同僚と交流する。")
                 ], ipa: "/ˈsəʊʃəlaɪz/"),
            make("get stuck", "become unable to move forward",
                 "行き詰まる・はまる",
                 useCases: ["物理的・精神的に進めない状況"],
                 examples: [
                    ("I got stuck in traffic.", "渋滞にはまった。"),
                    ("Stuck on a problem.", "問題で詰まってる。")
                 ], ipa: "/ɡɛt stʌk/"),
            make("branch out", "expand into new areas",
                 "新分野に乗り出す・枝分かれする",
                 useCases: ["新たな試みや分野に挑戦するとき"],
                 examples: [
                    ("Branch out into design.", "デザイン分野に進出。"),
                    ("Time to branch out.", "新分野へ進む時。")
                 ], ipa: "/brɑːntʃ aʊt/"),
            make("hold back", "restrain; withhold",
                 "抑える・控える",
                 useCases: ["感情や情報を抑えるとき"],
                 examples: [
                    ("Don't hold back.", "遠慮しないで。"),
                    ("Hold back tears.", "涙をこらえる。")
                 ], ipa: "/həʊld bæk/"),
            make("keep sth going", "maintain momentum",
                 "〜を続ける・勢いを保つ",
                 useCases: ["何かを止めずに継続させたいとき"],
                 examples: [
                    ("Keep the conversation going.", "会話を続けよう。"),
                    ("Keep it going!", "その調子!")
                 ], ipa: "/kiːp ˈsʌmθɪŋ ˈɡəʊɪŋ/"),
            make("try out", "test or audition",
                 "試してみる・オーディションを受ける",
                 useCases: ["新しい物や活動を試すとき"],
                 examples: [
                    ("Try out a new recipe.", "新レシピを試す。"),
                    ("Try out for the team.", "チームのトライアウトを受ける。")
                 ], ipa: "/traɪ aʊt/"),
            make("pull sth out of", "extract from",
                 "〜から〜を引き出す",
                 useCases: ["物理的に取り出す、または比喩的に引き出すとき"],
                 examples: [
                    ("Pull a rabbit out of a hat.", "帽子からウサギを出す。"),
                    ("Pull yourself out of bed.", "ベッドから自分を引きずり出す。")
                 ], ipa: "/pʊl ˈsʌmθɪŋ aʊt ɒv/"),
            make("putting sth aside", "setting something to one side",
                 "〜を脇に置く・保留する",
                 useCases: ["他のことを後回しにして集中するとき"],
                 examples: [
                    ("Putting that aside, ~", "それは脇に置いておいて〜"),
                    ("Putting differences aside.", "意見の相違を脇に置いて。")
                 ], ipa: "/ˈpʊtɪŋ ˈsʌmθɪŋ əˈsaɪd/"),
            make("boil down", "be reduced to the essence",
                 "煮詰める・要するに〜になる",
                 useCases: ["複雑な話を本質に絞るとき"],
                 examples: [
                    ("It boils down to money.", "結局は金の問題。"),
                    ("Boil down the data.", "データを集約する。")
                 ], ipa: "/bɔɪl daʊn/"),
            make("transition into", "move into a new state",
                 "〜へ移行する",
                 useCases: ["状態やキャリアが切り替わるとき"],
                 examples: [
                    ("Transition into a new role.", "新しい役割に移る。"),
                    ("Transition into adulthood.", "大人へ移行する。")
                 ], ipa: "/trænˈzɪʃən ˈɪntuː/")
        ]
    }

    // MARK: - 名詞・概念 (追加 10)

    private static var nounConcepts55: [Word] {
        [
            make("social", "relating to society",
                 "社交的な・社会的な",
                 useCases: ["人付き合いや社会に関することを表すとき"],
                 examples: [
                    ("Social media.", "SNS。"),
                    ("Social event.", "社交イベント。")
                 ], ipa: "/ˈsəʊʃəl/"),
            make("choice", "an act of selecting; an option",
                 "選択・選択肢",
                 useCases: ["決断や複数ある選択肢を表すとき"],
                 examples: [
                    ("Tough choice.", "難しい選択。"),
                    ("Your choice.", "君の選択次第。")
                 ], ipa: "/tʃɔɪs/"),
            make("ultimate", "the best or most extreme",
                 "究極の・最終的な",
                 useCases: ["最高峰や最終形を表すとき"],
                 examples: [
                    ("Ultimate goal.", "究極の目標。"),
                    ("Ultimate experience.", "究極の体験。")
                 ], ipa: "/ˈʌltɪmət/"),
            make("tier", "a level in a hierarchy",
                 "層・段階",
                 useCases: ["料金プランやランクの区分を表すとき"],
                 examples: [
                    ("Top tier.", "トップクラス。"),
                    ("Three-tier system.", "三段階のシステム。")
                 ], ipa: "/tɪə/"),
            make("material", "matter; relevant content",
                 "材料・素材・資料",
                 useCases: ["物質や教材、議論の素材を表すとき"],
                 examples: [
                    ("Raw material.", "原材料。"),
                    ("Reading material.", "読み物。")
                 ], ipa: "/məˈtɪəriəl/"),
            make("a pass", "permission or skip; an attempt",
                 "パス・見送り",
                 useCases: ["許可証、または「今回は遠慮する」というスラング"],
                 examples: [
                    ("I'll take a pass.", "今回は遠慮しとく。"),
                    ("A free pass.", "免除パス。")
                 ], ipa: "/ə pɑːs/"),
            make("dead-end", "no possibility of progress",
                 "行き止まり・将来性のない",
                 useCases: ["袋小路の道や、見込みのない仕事を表すとき"],
                 examples: [
                    ("Dead-end street.", "行き止まりの道。"),
                    ("Dead-end job.", "将来性のない仕事。")
                 ], ipa: "/ˌdɛdˈɛnd/"),
            make("reaction", "a response to something",
                 "反応",
                 useCases: ["出来事や言葉に対する人の反応を表すとき"],
                 examples: [
                    ("Strong reaction.", "強い反応。"),
                    ("Reaction time.", "反応時間。")
                 ], ipa: "/riˈækʃən/"),
            make("mirror", "a reflective surface; reflect",
                 "鏡・反映する",
                 useCases: ["鏡像、または比喩的に反映する状態を表すとき"],
                 examples: [
                    ("Look in the mirror.", "鏡を見て。"),
                    ("Mirror the trend.", "傾向を映し出す。")
                 ], ipa: "/ˈmɪrə/"),
            make("magic", "the use of supernatural power",
                 "魔法・マジック",
                 useCases: ["奇跡的な力や見事な技を表すとき"],
                 examples: [
                    ("Like magic.", "まるで魔法のよう。"),
                    ("Magic trick.", "手品。")
                 ], ipa: "/ˈmædʒɪk/")
        ]
    }

    // MARK: - 状態・表現 (追加 9)

    private static var statesExpressions55: [Word] {
        [
            make("showtime", "the start of a performance",
                 "ショータイム・本番",
                 useCases: ["パフォーマンスや大事な瞬間が始まるとき"],
                 examples: [
                    ("It's showtime!", "いよいよ本番!"),
                    ("Showtime is at 7.", "ショーは7時から。")
                 ], ipa: "/ˈʃəʊtaɪm/"),
            make("the very next day", "the day immediately after",
                 "翌日すぐ・その翌日",
                 useCases: ["何かが起きた直後の日を強調するとき"],
                 examples: [
                    ("The very next day, he called.", "翌日にすぐ彼は電話してきた。"),
                    ("The very next day, everything changed.", "翌日にはすべてが変わった。")
                 ], ipa: "/ðə ˈvɛri nɛkst deɪ/"),
            make("this stuff", "this kind of thing",
                 "こういうもの・このもの",
                 useCases: ["目の前の物事や状況を漠然と指すとき"],
                 examples: [
                    ("Don't drink this stuff.", "このやつ飲むなよ。"),
                    ("This stuff is amazing!", "これすごい!")
                 ], ipa: "/ðɪs stʌf/"),
            make("can literally feel", "physically perceive (intensified)",
                 "本当に感じることができる",
                 useCases: ["強い感覚や感情を強調するとき"],
                 examples: [
                    ("I can literally feel my heart racing.", "心臓のドキドキを本当に感じる。"),
                    ("Can literally feel the cold.", "寒さがリアルに伝わる。")
                 ], ipa: "/kən ˈlɪtərəli fiːl/"),
            make("depressed", "feeling severe sadness",
                 "落ち込んだ・抑うつの",
                 useCases: ["悲しみや無気力な状態を表すとき"],
                 examples: [
                    ("Feeling depressed.", "落ち込んでる。"),
                    ("Clinically depressed.", "うつ病の。")
                 ], ipa: "/dɪˈprɛst/"),
            make("for free", "without payment",
                 "無料で",
                 useCases: ["お金を払わずに何かを得るとき"],
                 examples: [
                    ("Got it for free.", "無料で手に入れた。"),
                    ("For free!", "無料で!")
                 ], ipa: "/fɔː friː/"),
            make("bio", "a short biography",
                 "経歴・プロフィール",
                 useCases: ["SNSやプロフィール欄の自己紹介文を表すとき"],
                 examples: [
                    ("Check my bio.", "プロフィール見て。"),
                    ("Short bio.", "簡単な経歴。")
                 ], ipa: "/ˈbaɪəʊ/"),
            make("premise", "a basis for argument or work",
                 "前提・原則",
                 useCases: ["議論や物語の出発点を表すとき"],
                 examples: [
                    ("Movie premise.", "映画の前提設定。"),
                    ("Faulty premise.", "誤った前提。")
                 ], ipa: "/ˈprɛmɪs/"),
            make("silence", "the absence of sound",
                 "沈黙・静けさ",
                 useCases: ["無音や口を閉ざした状態を表すとき"],
                 examples: [
                    ("Awkward silence.", "気まずい沈黙。"),
                    ("Silence is golden.", "沈黙は金。")
                 ], ipa: "/ˈsaɪləns/")
        ]
    }

    private static var businessNouns56: [Word] {
        [
            make("revenue",
                 "Income generated from business activities, especially sales.",
                 "収益、売上",
                 useCases: ["business reports", "earnings calls", "startup pitches"],
                 examples: [
                    ("The company's revenue grew 30% year over year.", "その会社の収益は前年比30%増加した。"),
                    ("Most of our revenue comes from subscriptions.", "売上の大半はサブスクリプションから来ている。")
                 ], ipa: "/ˈrɛvənjuː/"),
            make("breakthrough",
                 "A sudden, important discovery or development.",
                 "ブレークスルー、突破口",
                 useCases: ["research", "innovation talks", "product launches"],
                 examples: [
                    ("The team made a major breakthrough in AI research.", "チームはAI研究で大きなブレークスルーを果たした。"),
                    ("This product is a breakthrough in the industry.", "この製品は業界における画期的なものだ。")
                 ], ipa: "/ˈbreɪkθruː/"),
            make("returns",
                 "Profit gained from an investment; also: items sent back.",
                 "リターン、収益、返品",
                 useCases: ["investing", "e-commerce", "finance"],
                 examples: [
                    ("Investors expect higher returns from this fund.", "投資家はこのファンドにより高いリターンを期待している。"),
                    ("Returns are accepted within 30 days.", "返品は30日以内に受け付けます。")
                 ], ipa: "/rɪˈtɜːnz/"),
            make("consultant",
                 "An expert who gives professional advice to organizations.",
                 "コンサルタント",
                 useCases: ["business meetings", "résumés", "professional services"],
                 examples: [
                    ("We hired a consultant to improve our processes.", "業務改善のためにコンサルタントを雇った。"),
                    ("She works as a marketing consultant.", "彼女はマーケティングコンサルタントとして働いている。")
                 ], ipa: "/kənˈsʌltənt/"),
            make("rate",
                 "A measured amount, speed, or price per unit; or to evaluate.",
                 "率、レート、評価する",
                 useCases: ["finance", "reviews", "metrics"],
                 examples: [
                    ("The interest rate has gone up again.", "金利がまた上がった。"),
                    ("How would you rate this product?", "この商品をどう評価しますか？")
                 ], ipa: "/reɪt/")
        ]
    }

    private static var verbsActions56: [Word] {
        [
            make("experiment",
                 "To try something new to see what happens or learn from it.",
                 "実験する、試してみる",
                 useCases: ["science", "product design", "personal growth"],
                 examples: [
                    ("We're experimenting with a new pricing model.", "新しい価格モデルを試している。"),
                    ("Don't be afraid to experiment with different styles.", "色々なスタイルを試すことを恐れないで。")
                 ], ipa: "/ɪkˈspɛrɪmənt/"),
            make("trial sth",
                 "To test something on a limited basis before fully adopting it.",
                 "～を試験的に導入する、試行する",
                 useCases: ["product testing", "workplace pilots", "software rollouts"],
                 examples: [
                    ("We're trialing the new tool with a small team first.", "まずは小さなチームで新しいツールを試行している。"),
                    ("They trialed the feature for two weeks.", "彼らはその機能を2週間試験運用した。")
                 ], ipa: "/ˈtraɪəl ˈsʌmθɪŋ/"),
            make("bring in",
                 "To introduce someone or something, or to earn (money).",
                 "～を導入する、連れてくる、稼ぐ",
                 useCases: ["business", "hiring", "revenue"],
                 examples: [
                    ("Let's bring in an expert to help us out.", "専門家を呼んで助けてもらおう。"),
                    ("The store brings in millions each year.", "その店は毎年何百万も稼いでいる。")
                 ], ipa: "/brɪŋ ɪn/"),
            make("relate",
                 "To connect with or understand someone's feelings or experience.",
                 "共感する、関連付ける",
                 useCases: ["conversations", "empathy", "presentations"],
                 examples: [
                    ("I can totally relate to what you're going through.", "あなたの状況にすごく共感できる。"),
                    ("How does this relate to our main goal?", "これは私たちの主な目標とどう関係しているの？")
                 ], ipa: "/rɪˈleɪt/")
        ]
    }

    private static var adjectivesTraits56: [Word] {
        [
            make("reusable",
                 "Able to be used more than once.",
                 "再利用可能な",
                 useCases: ["sustainability", "engineering", "everyday products"],
                 examples: [
                    ("I always carry a reusable water bottle.", "いつも再利用できる水筒を持ち歩いている。"),
                    ("These components are designed to be reusable.", "これらの部品は再利用できるように設計されている。")
                 ], ipa: "/riˈjuːzəbəl/"),
            make("misplaced",
                 "Lost temporarily; or directed at the wrong target (e.g., trust).",
                 "置き忘れた、見当違いの",
                 useCases: ["daily life", "criticism", "trust issues"],
                 examples: [
                    ("I've misplaced my keys again.", "また鍵をどこかに置き忘れてしまった。"),
                    ("His trust in them turned out to be misplaced.", "彼が彼らを信頼したのは見当違いだった。")
                 ], ipa: "/ˌmɪsˈpleɪst/"),
            make("autonomous",
                 "Acting independently or having the freedom to govern itself.",
                 "自律的な、自治の",
                 useCases: ["tech", "management", "robotics"],
                 examples: [
                    ("They're building an autonomous driving system.", "彼らは自動運転システムを開発している。"),
                    ("The team operates as an autonomous unit.", "そのチームは自律的に動く単位として機能している。")
                 ], ipa: "/ɔːˈtɒnəməs/"),
            make("anonymous",
                 "Not identified by name; unknown.",
                 "匿名の",
                 useCases: ["surveys", "donations", "online forums"],
                 examples: [
                    ("Feedback can be submitted anonymously.", "フィードバックは匿名で提出できる。"),
                    ("An anonymous donor gave a large gift.", "匿名の寄付者が多額の寄付をした。")
                 ], ipa: "/əˈnɒnɪməs/"),
            make("capable",
                 "Having the ability or qualities to do something well.",
                 "有能な、～できる",
                 useCases: ["hiring", "compliments", "self-assessment"],
                 examples: [
                    ("She's more than capable of handling this project.", "彼女はこのプロジェクトを十分にこなせる。"),
                    ("This laptop is capable of running heavy software.", "このノートPCは重いソフトも動かせる性能がある。")
                 ], ipa: "/ˈkeɪpəbəl/")
        ]
    }

    private static var phrasesAndExpressions57: [Word] {
        [
            make("that sounds like",
                 "Used to react to something just heard, often making a guess or comparison.",
                 "それは～みたい、～のように聞こえる",
                 useCases: ["casual conversation", "reactions", "empathy"],
                 examples: [
                    ("That sounds like a great idea.", "それはいい考えだね。"),
                    ("That sounds like a lot of work.", "それは大変な作業のように聞こえる。")
                 ], ipa: "/ðæt saʊndz laɪk/"),
            make("enjoy sth",
                 "To take pleasure in something or have a good time doing it.",
                 "～を楽しむ",
                 useCases: ["small talk", "recommendations", "feedback"],
                 examples: [
                    ("I really enjoy reading before bed.", "寝る前の読書がすごく楽しい。"),
                    ("Did you enjoy the movie?", "映画は楽しかった？")
                 ], ipa: "/ɪnˈdʒɔɪ ˈsʌmθɪŋ/"),
            make("don't be",
                 "Used to tell someone not to feel or act a certain way.",
                 "～にならないで、～しないで",
                 useCases: ["reassurance", "advice", "casual conversation"],
                 examples: [
                    ("Don't be shy — come and join us.", "恥ずかしがらないで、こっちに来て一緒にやろう。"),
                    ("Don't be too hard on yourself.", "自分に厳しくしすぎないで。")
                 ], ipa: "/dəʊnt biː/"),
            make("think of",
                 "To bring something to mind; to have an opinion about something.",
                 "～を思いつく、～について考える",
                 useCases: ["brainstorming", "opinions", "memory"],
                 examples: [
                    ("I can't think of his name right now.", "彼の名前が今ちょっと出てこない。"),
                    ("What do you think of the new design?", "新しいデザインはどう思う？")
                 ], ipa: "/θɪŋk ɒv/"),
            make("big ask",
                 "A request that is difficult or demanding to fulfill.",
                 "大きなお願い、無理な頼み",
                 useCases: ["workplace requests", "favors", "negotiation"],
                 examples: [
                    ("I know it's a big ask, but could you finish it by tomorrow?", "無理なお願いなのは分かってるけど、明日までに仕上げてもらえる？"),
                    ("Quitting your job to start over is a big ask.", "仕事を辞めて一からやり直すというのは大きな決断だ。")
                 ], ipa: "/bɪɡ ɑːsk/")
        ]
    }

    // MARK: - ビジネス・法律 (追加 58)

    private static var businessLegal58: [Word] {
        [
            make("entity", "a thing that exists as a single, separate unit",
                 "事業体・組織・存在",
                 useCases: ["会社や組織を法的・正式に指すとき"],
                 examples: [
                    ("A separate legal entity.", "独立した法人。"),
                    ("The company is one entity.", "その会社は一つの事業体だ。")
                 ], ipa: "/ˈɛntɪtɪ/"),
            make("legal", "relating to or allowed by the law",
                 "法律の・合法の",
                 useCases: ["法律や合法性に関することを表すとき"],
                 examples: [
                    ("Legal advice.", "法的助言。"),
                    ("Is it legal?", "それは合法なの？")
                 ], ipa: "/lˈiːɡəl/"),
            make("undertake", "commit to and begin a task",
                 "引き受ける・着手する",
                 useCases: ["責任を持って業務や仕事を始めるとき"],
                 examples: [
                    ("Undertake a project.", "プロジェクトを引き受ける。"),
                    ("We undertake to deliver on time.", "期日通りの納品をお約束します。")
                 ], ipa: "/ˌʌndətˈeɪk/"),
            make("feasibility", "the possibility of being done successfully",
                 "実現可能性",
                 useCases: ["計画が実行可能かを検討するとき"],
                 examples: [
                    ("Feasibility study.", "実現可能性調査。"),
                    ("Check the feasibility.", "実現性を確認する。")
                 ], ipa: "/fˌiːzɪbˈɪlɪtɪ/"),
            make("capital", "money or assets for investing; a main city",
                 "資本・首都",
                 useCases: ["事業の資金や国の首都を表すとき"],
                 examples: [
                    ("Raise capital.", "資本を調達する。"),
                    ("The capital city.", "首都。")
                 ], ipa: "/kˈæpɪtəl/"),
            make("minimum", "the smallest amount possible",
                 "最小限・最低の",
                 useCases: ["許される一番小さい量や下限を表すとき"],
                 examples: [
                    ("Minimum wage.", "最低賃金。"),
                    ("A minimum of two.", "最低でも2つ。")
                 ], ipa: "/mˈɪnɪməm/"),
            make("requirement", "something needed or demanded",
                 "要件・必要条件",
                 useCases: ["満たすべき条件や必要なものを表すとき"],
                 examples: [
                    ("Meet the requirements.", "要件を満たす。"),
                    ("A legal requirement.", "法的要件。")
                 ], ipa: "/ɹɪkwˈaɪəmənt/"),
            make("cooperate", "work together toward a goal",
                 "協力する",
                 useCases: ["他者と力を合わせて取り組むとき"],
                 examples: [
                    ("Please cooperate with us.", "ご協力をお願いします。"),
                    ("They refused to cooperate.", "彼らは協力を拒んだ。")
                 ], ipa: "/kəʊˈɒpəɹˌeɪt/"),
            make("permit", "officially allow; an official document",
                 "許可する・許可証",
                 useCases: ["許可を出すとき、または許可証を表すとき"],
                 examples: [
                    ("Work permit.", "就労許可証。"),
                    ("Weather permitting.", "天気が許せば。")
                 ], ipa: "/pˈɜːmɪt/"),
            make("wholesale", "selling goods in large quantities to retailers",
                 "卸売り",
                 useCases: ["小売ではなく大量に業者へ売ることを表すとき"],
                 examples: [
                    ("Wholesale price.", "卸値。"),
                    ("Buy wholesale.", "卸で買う。")
                 ], ipa: "/hˈəʊlseɪl/"),
            make("impose", "force a rule, tax, or burden on someone",
                 "課す・押し付ける",
                 useCases: ["税やルール、負担を強制するとき"],
                 examples: [
                    ("Impose a tax.", "税を課す。"),
                    ("Don't impose on others.", "他人に押し付けないで。")
                 ], ipa: "/ɪmpˈəʊz/"),
            make("stringent", "strict and rigorously enforced",
                 "厳格な・厳しい",
                 useCases: ["規則や基準が非常に厳しいことを表すとき"],
                 examples: [
                    ("Stringent rules.", "厳格な規則。"),
                    ("Stringent controls.", "厳しい管理。")
                 ], ipa: "/stɹˈɪndʒənt/"),
            make("imprisonment", "the state of being kept in prison",
                 "投獄・禁錮",
                 useCases: ["刑罰として収監されることを表すとき"],
                 examples: [
                    ("Life imprisonment.", "終身刑。"),
                    ("Face imprisonment.", "投獄に直面する。")
                 ], ipa: "/ɪmpɹˈɪzənmənt/"),
            make("foreign owned", "owned by people or companies from abroad",
                 "外資の・外国資本の",
                 useCases: ["海外資本が所有する企業を表すとき"],
                 examples: [
                    ("A foreign owned firm.", "外資系企業。"),
                    ("Foreign owned land.", "外国資本所有の土地。")
                 ], ipa: "/fˈɒɹən ˈəʊnd/"),
            make("organic", "produced without chemicals; natural",
                 "有機の・オーガニックの",
                 useCases: ["農薬を使わない食品や自然な成長を表すとき"],
                 examples: [
                    ("Organic food.", "有機食品。"),
                    ("Organic growth.", "自然な成長。")
                 ], ipa: "/ɔːɡˈænɪk/"),
            make("factory", "a building where goods are manufactured",
                 "工場",
                 useCases: ["製品を製造する施設を表すとき"],
                 examples: [
                    ("A car factory.", "自動車工場。"),
                    ("Work in a factory.", "工場で働く。")
                 ], ipa: "/fˈæktəɹɪ/"),
            make("operation", "an organized activity; a surgical procedure",
                 "操業・運営・手術",
                 useCases: ["事業の運営や医療の手術を表すとき"],
                 examples: [
                    ("Business operations.", "事業運営。"),
                    ("Have an operation.", "手術を受ける。")
                 ], ipa: "/ˌɒpəɹˈeɪʃən/"),
            make("funding", "money provided for a purpose",
                 "資金・資金提供",
                 useCases: ["事業やプロジェクトの財源を表すとき"],
                 examples: [
                    ("Secure funding.", "資金を確保する。"),
                    ("Government funding.", "政府の助成金。")
                 ], ipa: "/fˈʌndɪŋ/"),
            make("license", "official permission; a permit document",
                 "免許・ライセンス",
                 useCases: ["公式な許可や免許を表すとき"],
                 examples: [
                    ("Driver's license.", "運転免許証。"),
                    ("A business license.", "営業許可。")
                 ], ipa: "/lˈaɪsəns/"),
            make("transfer", "move from one place or person to another",
                 "移す・移動・送金",
                 useCases: ["お金やデータ、人を別の場所へ移すとき"],
                 examples: [
                    ("Bank transfer.", "銀行振込。"),
                    ("Transfer to another office.", "別のオフィスへ異動する。")
                 ], ipa: "/tɹˈænsfɜː/"),
            make("consist", "be made up of; comprise",
                 "〜から成る・構成される",
                 useCases: ["何が含まれているかを説明するとき"],
                 examples: [
                    ("Consist of three parts.", "3つの部分から成る。"),
                    ("The team consists of five.", "チームは5人で構成される。")
                 ], ipa: "/kənsˈɪst/"),
            make("subordinate", "lower in rank; a junior staff member",
                 "部下・下位の",
                 useCases: ["地位が下の人や従属的な関係を表すとき"],
                 examples: [
                    ("My subordinate.", "私の部下。"),
                    ("A subordinate role.", "従属的な役割。")
                 ], ipa: "/sʌbˈɔːdɪnət/"),
            make("leading", "most important or successful",
                 "主導的な・一流の",
                 useCases: ["業界のトップや先頭に立つものを表すとき"],
                 examples: [
                    ("A leading company.", "一流企業。"),
                    ("Leading the way.", "先頭を行く。")
                 ], ipa: "/lˈiːdɪŋ/"),
            make("delegate", "assign a task to someone else; a representative",
                 "委任する・代表者",
                 useCases: ["仕事を人に任せるとき、または代表を表すとき"],
                 examples: [
                    ("Delegate tasks.", "業務を委任する。"),
                    ("A conference delegate.", "会議の代表者。")
                 ], ipa: "/dˈɛlɪɡˌeɪt/"),
            make("candidate", "a person applying or being considered",
                 "候補者・志願者",
                 useCases: ["選挙や採用で検討される人を表すとき"],
                 examples: [
                    ("A strong candidate.", "有力な候補者。"),
                    ("Job candidate.", "求職者。")
                 ], ipa: "/kˈændɪdˌeɪt/"),
            make("department", "a division of a large organization",
                 "部署・学部",
                 useCases: ["会社や大学の部門を表すとき"],
                 examples: [
                    ("Sales department.", "営業部。"),
                    ("HR department.", "人事部。")
                 ], ipa: "/dɪpˈɑːtmənt/"),
            make("direction", "the course along which something moves; guidance",
                 "方向・指示",
                 useCases: ["進む向きや指導を表すとき"],
                 examples: [
                    ("In the right direction.", "正しい方向へ。"),
                    ("Follow the directions.", "指示に従う。")
                 ], ipa: "/daɪɹˈɛkʃən/")
        ]
    }

    // MARK: - 健康・体 (追加 58)

    private static var healthBody58: [Word] {
        [
            make("mental health", "a person's emotional and psychological well-being",
                 "メンタルヘルス・心の健康",
                 useCases: ["心の状態や精神的な健康を表すとき"],
                 examples: [
                    ("Look after your mental health.", "心の健康を大切に。"),
                    ("Mental health issues.", "メンタルヘルスの問題。")
                 ], ipa: "/mˈɛntəl hˈɛlθ/"),
            make("phobia", "an extreme or irrational fear",
                 "恐怖症",
                 useCases: ["特定の物事への強い恐怖を表すとき"],
                 examples: [
                    ("A phobia of spiders.", "クモ恐怖症。"),
                    ("Social phobia.", "社交恐怖症。")
                 ], ipa: "/fˈəʊbɪɐ/"),
            make("rehabilitation", "restoring health or normal life after illness",
                 "リハビリ・社会復帰",
                 useCases: ["病気やけが、依存からの回復を表すとき"],
                 examples: [
                    ("Drug rehabilitation.", "薬物依存の更生。"),
                    ("Rehabilitation center.", "リハビリ施設。")
                 ], ipa: "/ɹɪhˌæbɪlɪtˈeɪʃən/"),
            make("autism", "a developmental condition affecting communication",
                 "自閉症",
                 useCases: ["発達特性としての自閉スペクトラムを表すとき"],
                 examples: [
                    ("A child with autism.", "自閉症の子ども。"),
                    ("Autism awareness.", "自閉症への理解。")
                 ], ipa: "/ˈɔːtɪzəm/"),
            make("inflammation", "redness and swelling as a reaction in the body",
                 "炎症",
                 useCases: ["体の炎症反応を表すとき"],
                 examples: [
                    ("Reduce inflammation.", "炎症を抑える。"),
                    ("Chronic inflammation.", "慢性炎症。")
                 ], ipa: "/ɪnflæmˈeɪʃən/"),
            make("cardiovascular", "relating to the heart and blood vessels",
                 "心臓血管の",
                 useCases: ["心臓や血管の健康・運動を表すとき"],
                 examples: [
                    ("Cardiovascular disease.", "心血管疾患。"),
                    ("Cardiovascular exercise.", "有酸素運動。")
                 ], ipa: "/kˌɑːdɪəʊvˈæskjʊlɐ/"),
            make("clot", "a thick lump formed when blood coagulates",
                 "血栓・固まり",
                 useCases: ["血が固まってできる塊を表すとき"],
                 examples: [
                    ("A blood clot.", "血栓。"),
                    ("The blood clotted.", "血が固まった。")
                 ], ipa: "/klˈɒt/"),
            make("hygiene", "practices that maintain health and cleanliness",
                 "衛生",
                 useCases: ["清潔さや健康を保つ習慣を表すとき"],
                 examples: [
                    ("Personal hygiene.", "個人衛生。"),
                    ("Good hygiene.", "良い衛生習慣。")
                 ], ipa: "/hˈaɪdʒiːn/"),
            make("dose", "a measured amount of medicine",
                 "服用量・一回分",
                 useCases: ["薬の量を表すとき"],
                 examples: [
                    ("A daily dose.", "一日の服用量。"),
                    ("Take the right dose.", "適量を飲む。")
                 ], ipa: "/dˈəʊs/"),
            make("toxin", "a poisonous substance",
                 "毒素",
                 useCases: ["体に有害な物質を表すとき"],
                 examples: [
                    ("Remove toxins.", "毒素を排出する。"),
                    ("A harmful toxin.", "有害な毒素。")
                 ], ipa: "/tˈɒksɪn/"),
            make("sensitive", "easily affected or hurt; reacting quickly",
                 "敏感な・繊細な",
                 useCases: ["肌や感情、機器が反応しやすいことを表すとき"],
                 examples: [
                    ("Sensitive skin.", "敏感肌。"),
                    ("A sensitive topic.", "デリケートな話題。")
                 ], ipa: "/sˈɛnsɪtˌɪv/"),
            make("habit", "a regular, often unconscious behavior",
                 "習慣・癖",
                 useCases: ["繰り返し行う行動や癖を表すとき"],
                 examples: [
                    ("A bad habit.", "悪い癖。"),
                    ("Break the habit.", "習慣を断つ。")
                 ], ipa: "/hˈæbɪt/"),
            make("hip", "the part of the body where the leg joins the torso",
                 "腰・ヒップ",
                 useCases: ["体の腰回りの部位を表すとき"],
                 examples: [
                    ("Hip pain.", "腰の痛み。"),
                    ("Hands on hips.", "腰に手を当てる。")
                 ], ipa: "/hˈɪp/"),
            make("waist", "the narrow part of the body above the hips",
                 "ウエスト・腰のくびれ",
                 useCases: ["胴のくびれた部分を表すとき"],
                 examples: [
                    ("A slim waist.", "細いウエスト。"),
                    ("Waist size.", "ウエストサイズ。")
                 ], ipa: "/wˈeɪst/"),
            make("shoulder", "the joint connecting the arm to the body",
                 "肩",
                 useCases: ["体の肩の部位を表すとき"],
                 examples: [
                    ("Shoulder pain.", "肩の痛み。"),
                    ("Shrug your shoulders.", "肩をすくめる。")
                 ], ipa: "/ʃˈəʊldɐ/"),
            make("toe", "one of the digits on the foot",
                 "つま先・足の指",
                 useCases: ["足の指を表すとき"],
                 examples: [
                    ("Stub your toe.", "つま先をぶつける。"),
                    ("On your toes.", "油断せずに。")
                 ], ipa: "/tˈəʊ/"),
            make("middle", "the central point or part",
                 "真ん中・中央",
                 useCases: ["中心や途中を表すとき"],
                 examples: [
                    ("In the middle.", "真ん中に。"),
                    ("Middle of the night.", "真夜中。")
                 ], ipa: "/mˈɪdəl/"),
            make("finger", "one of the digits on the hand",
                 "指",
                 useCases: ["手の指を表すとき"],
                 examples: [
                    ("Point your finger.", "指をさす。"),
                    ("Cross your fingers.", "幸運を祈る。")
                 ], ipa: "/fˈɪŋɡɐ/"),
            make("hair", "the strands growing from the skin, esp. the head",
                 "髪・毛",
                 useCases: ["髪や体毛を表すとき"],
                 examples: [
                    ("Long hair.", "長い髪。"),
                    ("Cut my hair.", "髪を切る。")
                 ], ipa: "/hˈeə/"),
            make("skull", "the bony framework of the head",
                 "頭蓋骨",
                 useCases: ["頭の骨を表すとき"],
                 examples: [
                    ("A human skull.", "人間の頭蓋骨。"),
                    ("Skull fracture.", "頭蓋骨骨折。")
                 ], ipa: "/skˈʌl/")
        ]
    }

    // MARK: - 動詞・行動 (追加 58)

    private static var verbsActions58: [Word] {
        [
            make("intend to do", "plan or mean to do something",
                 "〜するつもりだ",
                 useCases: ["これからの意図や計画を表すとき"],
                 examples: [
                    ("I intend to apply.", "応募するつもりだ。"),
                    ("We intend to expand.", "事業を拡大する予定だ。")
                 ], ipa: "/ɪntˈɛnd tə dˈuː/"),
            make("map out", "plan something in detail",
                 "綿密に計画する・図示する",
                 useCases: ["計画や道筋を具体的に立てるとき"],
                 examples: [
                    ("Map out a plan.", "計画を練る。"),
                    ("Map out your week.", "1週間の予定を立てる。")
                 ], ipa: "/mˈæp ˈaʊt/"),
            make("search for", "look carefully to find something",
                 "〜を探す",
                 useCases: ["何かを見つけようと探すとき"],
                 examples: [
                    ("Search for answers.", "答えを探す。"),
                    ("Search for a job.", "仕事を探す。")
                 ], ipa: "/sˈɜːtʃ fɔː/"),
            make("look ahead to", "anticipate a future event",
                 "〜を楽しみに待つ・先を見据える",
                 useCases: ["将来の予定や展望を見据えるとき"],
                 examples: [
                    ("Look ahead to next year.", "来年を見据える。"),
                    ("Looking ahead to the future.", "未来を見据えて。")
                 ], ipa: "/lˈʊk ɐhˈɛd tuː/"),
            make("restore", "bring back to a former condition",
                 "回復する・復元する",
                 useCases: ["元の状態に戻すとき"],
                 examples: [
                    ("Restore the data.", "データを復元する。"),
                    ("Restore trust.", "信頼を取り戻す。")
                 ], ipa: "/ɹɪstˈɔː/"),
            make("irritate", "annoy; make slightly angry or sore",
                 "イライラさせる・刺激する",
                 useCases: ["人を苛立たせる、または肌などを刺激するとき"],
                 examples: [
                    ("It irritates me.", "それにイライラする。"),
                    ("Irritate the skin.", "肌を刺激する。")
                 ], ipa: "/ˈɪɹɪtˌeɪt/"),
            make("imitate", "copy someone's behavior or speech",
                 "真似る・模倣する",
                 useCases: ["他人の動作や声をまねるとき"],
                 examples: [
                    ("Imitate the accent.", "なまりを真似る。"),
                    ("Kids imitate adults.", "子どもは大人を真似る。")
                 ], ipa: "/ˈɪmɪtˌeɪt/"),
            make("inspect", "examine carefully and officially",
                 "検査する・点検する",
                 useCases: ["物事を念入りに調べるとき"],
                 examples: [
                    ("Inspect the goods.", "商品を検査する。"),
                    ("Inspect the site.", "現場を点検する。")
                 ], ipa: "/ɪnspˈɛkt/"),
            make("doubt sth", "feel uncertain about something",
                 "〜を疑う",
                 useCases: ["確信が持てないときや信じられないとき"],
                 examples: [
                    ("I doubt it.", "それはどうかな。"),
                    ("Doubt his story.", "彼の話を疑う。")
                 ], ipa: "/dˈaʊt sˈʌmθɪŋ/"),
            make("twist sth", "turn or bend something forcefully",
                 "〜をひねる・ねじる",
                 useCases: ["物をねじったり曲げたりするとき"],
                 examples: [
                    ("Twist the cap.", "キャップをひねる。"),
                    ("Twist my ankle.", "足首をひねる。")
                 ], ipa: "/twˈɪst sˈʌmθɪŋ/"),
            make("style sth", "design or arrange something's appearance",
                 "〜をスタイリングする・整える",
                 useCases: ["髪や見た目を整えるとき"],
                 examples: [
                    ("Style your hair.", "髪をセットする。"),
                    ("Style the room.", "部屋をおしゃれに整える。")
                 ], ipa: "/stˈaɪl sˈʌmθɪŋ/"),
            make("shake sth", "move something quickly back and forth",
                 "〜を振る・揺らす",
                 useCases: ["物を振ったり揺さぶったりするとき"],
                 examples: [
                    ("Shake the bottle.", "ボトルを振る。"),
                    ("Shake hands.", "握手する。")
                 ], ipa: "/ʃˈeɪk sˈʌmθɪŋ/"),
            make("recycle", "convert waste into reusable material",
                 "リサイクルする・再利用する",
                 useCases: ["ごみを再利用するとき"],
                 examples: [
                    ("Recycle plastic.", "プラスチックをリサイクルする。"),
                    ("Please recycle.", "リサイクルにご協力を。")
                 ], ipa: "/ɹɪsˈaɪkəl/"),
            make("pour sth", "make a liquid flow from a container",
                 "〜を注ぐ",
                 useCases: ["液体を注ぐとき"],
                 examples: [
                    ("Pour some water.", "水を注いで。"),
                    ("Pour the coffee.", "コーヒーを注ぐ。")
                 ], ipa: "/pˈɔː sˈʌmθɪŋ/"),
            make("print out", "produce a paper copy from a computer",
                 "印刷する・プリントアウトする",
                 useCases: ["データを紙に出力するとき"],
                 examples: [
                    ("Print out the file.", "ファイルを印刷する。"),
                    ("Print it out for me.", "それ印刷して。")
                 ], ipa: "/pɹˈɪnt ˈaʊt/"),
            make("sail", "travel on water by boat; operate a sailboat",
                 "航海する・帆走する",
                 useCases: ["船で海を進むことを表すとき"],
                 examples: [
                    ("Sail across the sea.", "海を渡る。"),
                    ("Set sail.", "出航する。")
                 ], ipa: "/sˈeɪl/"),
            make("rinse sth", "wash with clean water",
                 "〜をすすぐ",
                 useCases: ["水で洗い流すとき"],
                 examples: [
                    ("Rinse the dishes.", "皿をすすぐ。"),
                    ("Rinse your mouth.", "口をゆすぐ。")
                 ], ipa: "/ɹˈɪns sˈʌmθɪŋ/"),
            make("compose sth", "create or write a piece; make up a whole",
                 "〜を作る・構成する・作曲する",
                 useCases: ["音楽や文章を作る、構成を成すとき"],
                 examples: [
                    ("Compose a song.", "曲を作る。"),
                    ("Compose an email.", "メールを書く。")
                 ], ipa: "/kəmpˈəʊz sˈʌmθɪŋ/"),
            make("propel", "drive or push forward",
                 "推進する・前進させる",
                 useCases: ["前へ押し進める力を表すとき"],
                 examples: [
                    ("Propel the boat.", "船を前進させる。"),
                    ("Propel his career.", "彼のキャリアを後押しする。")
                 ], ipa: "/pɹəpˈɛl/"),
            make("slot in", "fit into an available space or time",
                 "(隙間に)入れる・予定に組み込む",
                 useCases: ["空いた所や予定に何かを差し込むとき"],
                 examples: [
                    ("Slot in a meeting.", "会議を予定に入れる。"),
                    ("Slot it in here.", "ここに差し込んで。")
                 ], ipa: "/slˈɒt ˈɪn/"),
            make("root for", "support and hope for someone's success",
                 "〜を応援する",
                 useCases: ["誰かの成功を願って応援するとき"],
                 examples: [
                    ("I'm rooting for you.", "君を応援してるよ。"),
                    ("Root for the team.", "チームを応援する。")
                 ], ipa: "/ɹˈuːt fɔː/"),
            make("disclose", "make secret information known",
                 "開示する・明かす",
                 useCases: ["秘密や情報を公開するとき"],
                 examples: [
                    ("Disclose the details.", "詳細を開示する。"),
                    ("Failure to disclose.", "開示しないこと。")
                 ], ipa: "/dɪsklˈəʊz/"),
            make("fly", "move through the air; travel by plane",
                 "飛ぶ・飛行機で行く",
                 useCases: ["空を飛ぶ、飛行機で移動するとき"],
                 examples: [
                    ("Fly to London.", "ロンドンへ飛ぶ。"),
                    ("Birds fly.", "鳥が飛ぶ。")
                 ], ipa: "/flˈaɪ/"),
            make("convey", "communicate or express; transport",
                 "伝える・運ぶ",
                 useCases: ["気持ちや情報を伝えるとき"],
                 examples: [
                    ("Convey a message.", "メッセージを伝える。"),
                    ("Convey my thanks.", "私の感謝を伝えて。")
                 ], ipa: "/kənvˈeɪ/"),
            make("deserve", "be worthy of something",
                 "〜に値する・ふさわしい",
                 useCases: ["報酬や扱いを受けるに足ることを表すとき"],
                 examples: [
                    ("You deserve it.", "君にはその価値がある。"),
                    ("Deserve a break.", "休む価値がある。")
                 ], ipa: "/dɪzˈɜːv/"),
            make("perish", "die or be destroyed; spoil",
                 "死ぬ・滅びる・傷む",
                 useCases: ["命や物が失われる、食品が傷むとき"],
                 examples: [
                    ("Plants perish in frost.", "植物は霜で枯れる。"),
                    ("Perishable goods.", "傷みやすい商品。")
                 ], ipa: "/pˈɛɹɪʃ/"),
            make("cook sth", "prepare food using heat",
                 "〜を料理する",
                 useCases: ["食べ物を調理するとき"],
                 examples: [
                    ("Cook dinner.", "夕食を作る。"),
                    ("Cook some rice.", "ご飯を炊く。")
                 ], ipa: "/kˈʊk sˈʌmθɪŋ/"),
            make("keep down", "prevent from rising; hold at a low level",
                 "抑える・低く保つ",
                 useCases: ["音量やコスト、感情を抑えるとき"],
                 examples: [
                    ("Keep your voice down.", "声を抑えて。"),
                    ("Keep costs down.", "コストを抑える。")
                 ], ipa: "/kˈiːp dˈaʊn/"),
            make("define", "state the exact meaning; set boundaries",
                 "定義する・明確にする",
                 useCases: ["意味や範囲をはっきりさせるとき"],
                 examples: [
                    ("Define the term.", "用語を定義する。"),
                    ("Define your goals.", "目標を明確にする。")
                 ], ipa: "/dɪfˈaɪn/"),
            make("journal sth", "write something down in a journal",
                 "〜を日記に書く・記録する",
                 useCases: ["思考や出来事を書き留めるとき"],
                 examples: [
                    ("Journal your thoughts.", "考えを書き留める。"),
                    ("I journal every night.", "毎晩日記をつける。")
                 ], ipa: "/dʒˈɜːnəl sˈʌmθɪŋ/"),
            make("pass sth", "hand over; go by; succeed in",
                 "〜を渡す・通過する・合格する",
                 useCases: ["物を手渡す、試験に通る、通り過ぎるとき"],
                 examples: [
                    ("Pass the salt.", "塩を取って。"),
                    ("Pass the exam.", "試験に合格する。")
                 ], ipa: "/pˈɑːs sˈʌmθɪŋ/"),
            make("adapt to", "adjust to new conditions",
                 "〜に適応する",
                 useCases: ["新しい環境や状況に慣れるとき"],
                 examples: [
                    ("Adapt to change.", "変化に適応する。"),
                    ("Adapt to the climate.", "気候に順応する。")
                 ], ipa: "/ɐdˈæpt tuː/"),
            make("move out", "leave a place where you lived",
                 "引っ越して出る・退去する",
                 useCases: ["住んでいた場所から出ていくとき"],
                 examples: [
                    ("Move out next month.", "来月引っ越す。"),
                    ("Move out of my parents' house.", "実家を出る。")
                 ], ipa: "/mˈuːv ˈaʊt/")
        ]
    }

    // MARK: - 名詞・物事 (追加 58)

    private static var nounsObjects58: [Word] {
        [
            make("crocodile", "a large predatory reptile",
                 "ワニ",
                 useCases: ["水辺にすむ大型の爬虫類を表すとき"],
                 examples: [
                    ("A crocodile in the river.", "川にいるワニ。"),
                    ("Crocodile tears.", "うそ泣き。")
                 ], ipa: "/kɹˈɒkədˌaɪl/"),
            make("response", "a reaction or reply",
                 "返答・反応",
                 useCases: ["問いや出来事への応答を表すとき"],
                 examples: [
                    ("A quick response.", "迅速な返答。"),
                    ("In response to your email.", "メールへの返信として。")
                 ], ipa: "/ɹɪspˈɒns/"),
            make("counter", "a flat surface for service; oppose",
                 "カウンター・反論する",
                 useCases: ["店の台、または反対・対抗するとき"],
                 examples: [
                    ("At the counter.", "カウンターで。"),
                    ("Counter the argument.", "主張に反論する。")
                 ], ipa: "/kˈaʊntɐ/"),
            make("surveillance", "close watch over a person or place",
                 "監視",
                 useCases: ["人や場所を見張ることを表すとき"],
                 examples: [
                    ("Under surveillance.", "監視下に。"),
                    ("Surveillance camera.", "監視カメラ。")
                 ], ipa: "/səvˈeɪləns/"),
            make("notebook", "a book of blank pages for writing",
                 "ノート",
                 useCases: ["書き込むための冊子を表すとき"],
                 examples: [
                    ("Write in a notebook.", "ノートに書く。"),
                    ("A new notebook.", "新しいノート。")
                 ], ipa: "/nˈəʊtbʊk/"),
            make("oven", "an enclosed compartment for heating food",
                 "オーブン",
                 useCases: ["食品を焼く調理器具を表すとき"],
                 examples: [
                    ("Bake in the oven.", "オーブンで焼く。"),
                    ("Preheat the oven.", "オーブンを予熱する。")
                 ], ipa: "/ˈʌvən/"),
            make("basin", "a bowl for water; a region drained by a river",
                 "洗面器・流域",
                 useCases: ["水をためる器や、川の流域を表すとき"],
                 examples: [
                    ("A wash basin.", "洗面台。"),
                    ("River basin.", "河川流域。")
                 ], ipa: "/bˈeɪsən/"),
            make("sensor", "a device that detects changes or signals",
                 "センサー",
                 useCases: ["光や動き、温度などを検知する装置を表すとき"],
                 examples: [
                    ("Motion sensor.", "動体センサー。"),
                    ("The sensor detects heat.", "センサーが熱を感知する。")
                 ], ipa: "/sˈɛnsɐ/"),
            make("sky", "the space above the earth",
                 "空",
                 useCases: ["頭上に広がる空を表すとき"],
                 examples: [
                    ("Blue sky.", "青空。"),
                    ("Stars in the sky.", "空の星。")
                 ], ipa: "/skˈaɪ/"),
            make("hat", "a covering for the head",
                 "帽子",
                 useCases: ["頭にかぶる帽子を表すとき"],
                 examples: [
                    ("Wear a hat.", "帽子をかぶる。"),
                    ("Take off your hat.", "帽子を脱いで。")
                 ], ipa: "/hˈæt/"),
            make("dust", "fine dry particles of matter",
                 "ほこり・ちり",
                 useCases: ["表面に積もる細かい粒を表すとき"],
                 examples: [
                    ("Wipe the dust.", "ほこりを拭く。"),
                    ("Covered in dust.", "ほこりまみれ。")
                 ], ipa: "/dˈʌst/"),
            make("valley", "low land between hills or mountains",
                 "谷",
                 useCases: ["山に挟まれた低地を表すとき"],
                 examples: [
                    ("A green valley.", "緑の谷。"),
                    ("Down in the valley.", "谷の下に。")
                 ], ipa: "/vˈælɪ/"),
            make("spectrum", "a full range of related qualities or ideas",
                 "範囲・スペクトラム",
                 useCases: ["連続した幅や種類の広がりを表すとき"],
                 examples: [
                    ("A broad spectrum.", "幅広い範囲。"),
                    ("The autism spectrum.", "自閉スペクトラム。")
                 ], ipa: "/spˈɛktɹəm/"),
            make("range", "the extent or limits between which things vary",
                 "範囲・幅",
                 useCases: ["数値や種類の幅を表すとき"],
                 examples: [
                    ("A wide range.", "広い範囲。"),
                    ("Price range.", "価格帯。")
                 ], ipa: "/ɹˈeɪndʒ/"),
            make("comeback", "a return to success or popularity",
                 "返り咲き・カムバック",
                 useCases: ["再び成功や人気を取り戻すことを表すとき"],
                 examples: [
                    ("Make a comeback.", "復活を遂げる。"),
                    ("A strong comeback.", "見事な返り咲き。")
                 ], ipa: "/kˈʌmbæk/"),
            make("entrance", "a way in; the act of entering",
                 "入口・入場",
                 useCases: ["建物の入口や入ることを表すとき"],
                 examples: [
                    ("The main entrance.", "正面入口。"),
                    ("Make an entrance.", "華々しく登場する。")
                 ], ipa: "/ˈɛntɹəns/"),
            make("loser", "a person who loses; an unsuccessful person",
                 "敗者・負け犬",
                 useCases: ["勝負に負けた人やダメな人を指すとき"],
                 examples: [
                    ("A sore loser.", "負けず嫌い。"),
                    ("Don't be a loser.", "ダメなやつになるな。")
                 ], ipa: "/lˈuːzɐ/"),
            make("patriot", "a person who loves their country",
                 "愛国者",
                 useCases: ["国を愛し尽くす人を表すとき"],
                 examples: [
                    ("A true patriot.", "真の愛国者。"),
                    ("Patriots defend the nation.", "愛国者は国を守る。")
                 ], ipa: "/pˈætɹɪət/"),
            make("removal", "the act of taking something away",
                 "除去・撤去・引っ越し",
                 useCases: ["物を取り除く、移動させることを表すとき"],
                 examples: [
                    ("Stain removal.", "シミ取り。"),
                    ("Removal of the tree.", "木の撤去。")
                 ], ipa: "/ɹɪmˈuːvəl/"),
            make("festival", "a day or period of celebration",
                 "祭り・フェスティバル",
                 useCases: ["祝祭や催しを表すとき"],
                 examples: [
                    ("A music festival.", "音楽フェス。"),
                    ("The summer festival.", "夏祭り。")
                 ], ipa: "/fˈɛstɪvəl/"),
            make("thanksgiving", "an autumn US holiday of giving thanks",
                 "感謝祭(サンクスギビング)",
                 useCases: ["アメリカの感謝祭を表すとき"],
                 examples: [
                    ("Thanksgiving dinner.", "感謝祭のごちそう。"),
                    ("Happy Thanksgiving!", "良い感謝祭を!")
                 ], ipa: "/θˈæŋksɡɪvɪŋ/"),
            make("traffic", "vehicles moving on roads",
                 "交通・渋滞",
                 useCases: ["道路を行き交う車の流れを表すとき"],
                 examples: [
                    ("Heavy traffic.", "ひどい渋滞。"),
                    ("Stuck in traffic.", "渋滞にはまった。")
                 ], ipa: "/tɹˈæfɪk/"),
            make("rush hour", "the busiest travel time of day",
                 "ラッシュアワー",
                 useCases: ["通勤通学で混雑する時間帯を表すとき"],
                 examples: [
                    ("Morning rush hour.", "朝のラッシュ。"),
                    ("Avoid rush hour.", "ラッシュを避ける。")
                 ], ipa: "/ɹˈʌʃ ˈaʊɐ/"),
            make("snow drift", "a bank of snow piled by the wind",
                 "吹きだまりの雪",
                 useCases: ["風で積もった雪の山を表すとき"],
                 examples: [
                    ("A deep snow drift.", "深い雪の吹きだまり。"),
                    ("Buried in a snow drift.", "雪の吹きだまりに埋もれる。")
                 ], ipa: "/snˈəʊ dɹˈɪft/"),
            make("mobile data", "internet access through a phone network",
                 "モバイルデータ通信",
                 useCases: ["スマホの携帯回線でのネット通信を表すとき"],
                 examples: [
                    ("Turn on mobile data.", "モバイルデータをオンにする。"),
                    ("I'm out of mobile data.", "データ通信量を使い切った。")
                 ], ipa: "/mˈəʊbaɪl dˈeɪtɐ/"),
            make("bonus", "an extra payment or benefit",
                 "ボーナス・特典",
                 useCases: ["追加の報酬やおまけを表すとき"],
                 examples: [
                    ("A year-end bonus.", "年末ボーナス。"),
                    ("As a bonus.", "おまけとして。")
                 ], ipa: "/bˈəʊnəs/"),
            make("distraction", "something that takes attention away",
                 "気を散らすもの・注意散漫",
                 useCases: ["集中を妨げるものを表すとき"],
                 examples: [
                    ("Avoid distractions.", "気を散らすものを避ける。"),
                    ("A welcome distraction.", "良い気晴らし。")
                 ], ipa: "/dɪstɹˈækʃən/"),
            make("etiquette", "the rules of polite behavior",
                 "エチケット・礼儀作法",
                 useCases: ["場にふさわしい振る舞いを表すとき"],
                 examples: [
                    ("Business etiquette.", "ビジネスマナー。"),
                    ("Poor etiquette.", "礼儀に欠ける態度。")
                 ], ipa: "/ˈɛtɪkˌɛt/"),
            make("shot", "an attempt; a photo; an injection",
                 "一撃・一枚・注射・挑戦",
                 useCases: ["試み、撮影、注射などを表すとき"],
                 examples: [
                    ("Give it a shot.", "やってみよう。"),
                    ("A great shot.", "見事な一枚(一発)。")
                 ], ipa: "/ʃˈɒt/")
        ]
    }

    // MARK: - 形容詞・性質 (追加 58)

    private static var adjectives58: [Word] {
        [
            make("fabulous", "extremely good; wonderful",
                 "素晴らしい・最高の",
                 useCases: ["とても良いものを称賛するとき"],
                 examples: [
                    ("You look fabulous.", "すごく素敵だよ。"),
                    ("A fabulous time.", "最高の時間。")
                 ], ipa: "/fˈæbjʊləs/"),
            make("versatile", "able to adapt to many functions or activities",
                 "多用途の・万能の",
                 useCases: ["色々な用途や場面に対応できることを表すとき"],
                 examples: [
                    ("A versatile tool.", "万能な道具。"),
                    ("A versatile player.", "何でもこなす選手。")
                 ], ipa: "/vˈɜːsətˌaɪl/"),
            make("tentative", "not certain; provisional",
                 "暫定的な・ためらいがちな",
                 useCases: ["まだ確定していない予定や態度を表すとき"],
                 examples: [
                    ("A tentative plan.", "暫定的な計画。"),
                    ("A tentative smile.", "ためらいがちな笑み。")
                 ], ipa: "/tˈɛntətˌɪv/"),
            make("pessimistic", "expecting the worst",
                 "悲観的な",
                 useCases: ["物事を悪く考える傾向を表すとき"],
                 examples: [
                    ("Don't be so pessimistic.", "そんなに悲観的にならないで。"),
                    ("A pessimistic view.", "悲観的な見方。")
                 ], ipa: "/pˌɛsɪmˈɪstɪk/"),
            make("hopeful", "feeling or showing optimism",
                 "希望に満ちた・期待している",
                 useCases: ["良い結果を期待するとき"],
                 examples: [
                    ("I'm hopeful.", "期待しているよ。"),
                    ("A hopeful sign.", "希望が持てる兆し。")
                 ], ipa: "/hˈəʊpfəl/"),
            make("furious", "extremely angry",
                 "激怒した",
                 useCases: ["強い怒りを表すとき"],
                 examples: [
                    ("She was furious.", "彼女は激怒していた。"),
                    ("Furious about the delay.", "遅延に激怒している。")
                 ], ipa: "/fjˈɔːɹiəs/"),
            make("hilarious", "extremely funny",
                 "とても面白い・爆笑ものの",
                 useCases: ["大笑いするほど面白いことを表すとき"],
                 examples: [
                    ("That's hilarious!", "それ超ウケる!"),
                    ("A hilarious joke.", "爆笑のジョーク。")
                 ], ipa: "/hɪlˈeəɹiəs/"),
            make("hazy", "unclear; misty or vague",
                 "かすんだ・ぼんやりした",
                 useCases: ["景色や記憶がはっきりしないことを表すとき"],
                 examples: [
                    ("A hazy memory.", "ぼんやりした記憶。"),
                    ("Hazy weather.", "かすんだ天気。")
                 ], ipa: "/hˈeɪzɪ/"),
            make("mindful", "conscious and aware; careful",
                 "意識している・注意深い",
                 useCases: ["何かに気を配り意識を向けるとき"],
                 examples: [
                    ("Be mindful of others.", "周りに気を配って。"),
                    ("Mindful eating.", "意識的な食事。")
                 ], ipa: "/mˈaɪndfəl/"),
            make("sporty", "fond of or good at sport; athletic in style",
                 "スポーツ好きの・スポーティな",
                 useCases: ["運動好きな人や活動的な見た目を表すとき"],
                 examples: [
                    ("A sporty type.", "スポーツマンタイプ。"),
                    ("A sporty look.", "スポーティな装い。")
                 ], ipa: "/spˈɔːtɪ/"),
            make("shaky", "trembling; not firm or reliable",
                 "震える・不安定な",
                 useCases: ["手や声、状況が不安定なことを表すとき"],
                 examples: [
                    ("Shaky hands.", "震える手。"),
                    ("A shaky start.", "不安定な滑り出し。")
                 ], ipa: "/ʃˈeɪkɪ/"),
            make("rightful", "having a just or legal claim",
                 "正当な・合法的な",
                 useCases: ["正当な権利や持ち主を表すとき"],
                 examples: [
                    ("The rightful owner.", "正当な持ち主。"),
                    ("My rightful place.", "私のあるべき場所。")
                 ], ipa: "/ɹˈaɪtfəl/"),
            make("joyful", "full of happiness",
                 "喜びに満ちた",
                 useCases: ["強い幸福感を表すとき"],
                 examples: [
                    ("A joyful occasion.", "喜ばしい場面。"),
                    ("Joyful tears.", "うれし涙。")
                 ], ipa: "/dʒˈɔɪfəl/"),
            make("supportive", "providing encouragement or help",
                 "支えになる・協力的な",
                 useCases: ["人を励まし支える態度を表すとき"],
                 examples: [
                    ("Supportive friends.", "支えてくれる友人。"),
                    ("A supportive boss.", "理解のある上司。")
                 ], ipa: "/səpˈɔːtɪv/"),
            make("standalone", "able to operate independently",
                 "単独で機能する・独立した",
                 useCases: ["他に頼らず単体で動くものを表すとき"],
                 examples: [
                    ("A standalone app.", "単独で動くアプリ。"),
                    ("A standalone unit.", "独立した装置。")
                 ], ipa: "/stˈændɐlˌəʊn/"),
            make("unstable", "not steady; likely to change or fail",
                 "不安定な",
                 useCases: ["状態や構造が安定しないことを表すとき"],
                 examples: [
                    ("An unstable connection.", "不安定な接続。"),
                    ("Emotionally unstable.", "情緒不安定。")
                 ], ipa: "/ʌnstˈeɪbəl/"),
            make("destined", "certain to happen or be by fate",
                 "運命づけられた",
                 useCases: ["前もって定められた運命を表すとき"],
                 examples: [
                    ("Destined to win.", "勝つ運命にある。"),
                    ("We were destined to meet.", "出会う運命だった。")
                 ], ipa: "/dˈɛstɪnd/"),
            make("top notch", "of the highest quality",
                 "一流の・最高級の",
                 useCases: ["最高水準の品質を表すとき"],
                 examples: [
                    ("Top notch service.", "一流のサービス。"),
                    ("A top notch team.", "最高のチーム。")
                 ], ipa: "/tˈɒp nˈɒtʃ/")
        ]
    }

    // MARK: - 表現・フレーズ (追加 58)

    private static var expressions58: [Word] {
        [
            make("a while away", "some distance off in time or space",
                 "まだ先・少し離れて",
                 useCases: ["時間や距離がまだ少しあることを表すとき"],
                 examples: [
                    ("Summer is still a while away.", "夏はまだ先だ。"),
                    ("The station is a while away.", "駅は少し離れている。")
                 ], ipa: "/ɐ wˈaɪl ɐwˈeɪ/"),
            make("when the time comes", "at the appropriate future moment",
                 "その時が来たら",
                 useCases: ["将来適切な時期になったらと言うとき"],
                 examples: [
                    ("We'll decide when the time comes.", "その時が来たら決めよう。"),
                    ("You'll know when the time comes.", "時が来れば分かるよ。")
                 ], ipa: "/wˌɛn ðə tˈaɪm kˈʌmz/"),
            make("I'm starting to", "I am beginning to (feel/do)",
                 "〜し始めている",
                 useCases: ["徐々に感じ始めた変化を述べるとき"],
                 examples: [
                    ("I'm starting to like it.", "だんだん好きになってきた。"),
                    ("I'm starting to understand.", "分かり始めてきた。")
                 ], ipa: "/aɪm stˈɑːtɪŋ tuː/"),
            make("by whom", "by which person (formal question)",
                 "誰によって",
                 useCases: ["行為者を尋ねる丁寧・文語的な言い方"],
                 examples: [
                    ("By whom was it written?", "それは誰によって書かれたの？"),
                    ("Decided by whom?", "誰が決めたの？")
                 ], ipa: "/baɪ hˈuːm/"),
            make("if I ask", "in the case that I request",
                 "私が頼んだら",
                 useCases: ["仮に依頼した場合を述べるとき"],
                 examples: [
                    ("Will you help if I ask?", "頼んだら手伝ってくれる？"),
                    ("If I ask nicely.", "丁寧に頼めばね。")
                 ], ipa: "/ɪf aɪ ˈɑːsk/"),
            make("name it", "say any example you can think of",
                 "何でも言って・何でもある",
                 useCases: ["「何でも揃ってる」と例を促すとき"],
                 examples: [
                    ("We have it all — you name it.", "何でもあるよ、言ってみて。"),
                    ("Pizza, sushi, you name it.", "ピザ、寿司、何でもね。")
                 ], ipa: "/nˈeɪm ɪt/"),
            make("could you advise if", "please tell me whether (polite)",
                 "〜かどうか教えていただけますか",
                 useCases: ["ビジネスメールで丁寧に確認を求めるとき"],
                 examples: [
                    ("Could you advise if this is available?", "これが在庫ありかお知らせいただけますか。"),
                    ("Could you advise if I'm eligible?", "対象か教えていただけますか。")
                 ], ipa: "/kʊd juː ɐdvˈaɪz ɪf/"),
            make("be worried", "feel anxious or concerned",
                 "心配している",
                 useCases: ["不安や懸念を表すとき"],
                 examples: [
                    ("Don't be worried.", "心配しないで。"),
                    ("I'm worried about you.", "あなたが心配だ。")
                 ], ipa: "/biː wˈʌɹɪd/"),
            make("I owe you", "I am in your debt; thanks (informal)",
                 "借りができた・恩に着る",
                 useCases: ["助けてもらってお礼や借りを表すとき"],
                 examples: [
                    ("I owe you one.", "一つ借りができたね。"),
                    ("I owe you big time.", "本当に恩に着るよ。")
                 ], ipa: "/aɪ ˈəʊ juː/"),
            make("I would like to either", "I want to do one of two options",
                 "どちらかにしたいのですが",
                 useCases: ["二択の希望を丁寧に切り出すとき"],
                 examples: [
                    ("I would like to either refund or exchange.", "返金か交換のどちらかにしたいです。"),
                    ("I would like to either stay or leave.", "残るか出るかどちらかにしたい。")
                 ], ipa: "/aɪ wʊd lˈaɪk tʊ ˈaɪðɐ/"),
            make("sth is secured", "something is safely obtained or fixed",
                 "〜が確保された",
                 useCases: ["資金や席などが確保されたことを表すとき"],
                 examples: [
                    ("The funding is secured.", "資金は確保された。"),
                    ("Your spot is secured.", "あなたの席は確保済みです。")
                 ], ipa: "/sˈʌmθɪŋ ɪz sɪkjˈɔːd/"),
            make("hat off", "an expression of respect or admiration",
                 "脱帽・敬意を表す",
                 useCases: ["相手を称賛し敬意を示すとき"],
                 examples: [
                    ("Hats off to you.", "君には脱帽だ。"),
                    ("Hat off to the team.", "チームに敬意を。")
                 ], ipa: "/hˈæt ˈɒf/"),
            make("at the last minute", "at the latest possible time",
                 "土壇場で・直前に",
                 useCases: ["締め切り間際になってからを表すとき"],
                 examples: [
                    ("He canceled at the last minute.", "彼は直前にキャンセルした。"),
                    ("Done at the last minute.", "ぎりぎりで終えた。")
                 ], ipa: "/æt ðə lˈɑːst mˈɪnɪt/"),
            make("last minute", "the latest possible moment before a deadline",
                 "直前・ぎりぎり",
                 useCases: ["締め切り間際を形容するとき"],
                 examples: [
                    ("Last minute changes.", "直前の変更。"),
                    ("A last minute deal.", "直前の特価。")
                 ], ipa: "/lˈɑːst mˈɪnɪt/"),
            make("the good news is", "used to introduce a positive point",
                 "良い知らせは〜・幸いなことに",
                 useCases: ["前向きな点を切り出すとき"],
                 examples: [
                    ("The good news is we're on time.", "良い知らせは、予定通りということだ。"),
                    ("The good news is it's fixed.", "幸い、直ったよ。")
                 ], ipa: "/ðə ɡˈʊd njˈuːz ɪz/"),
            make("have you gotten better", "have you recovered or improved",
                 "良くなった？・回復した？",
                 useCases: ["体調や上達を尋ねるとき"],
                 examples: [
                    ("Have you gotten better?", "体調は良くなった？"),
                    ("Have you gotten better at it?", "それ上達した？")
                 ], ipa: "/hæv juː ɡˈɒtən bˈɛtɐ/"),
            make("nothing can be done without", "X is essential for everything",
                 "〜なしでは何もできない",
                 useCases: ["何かが不可欠だと強調するとき"],
                 examples: [
                    ("Nothing can be done without money.", "金なしでは何もできない。"),
                    ("Nothing can be done without trust.", "信頼なしには何も成り立たない。")
                 ], ipa: "/nˈʌθɪŋ kæn biː dˈʌn wɪðˈaʊt/"),
            make("common interest", "a shared concern or hobby",
                 "共通の関心・利害",
                 useCases: ["お互いが共有する興味や利益を表すとき"],
                 examples: [
                    ("We share a common interest.", "私たちは共通の関心を持つ。"),
                    ("A common interest in music.", "音楽という共通の趣味。")
                 ], ipa: "/kˈɒmən ˈɪntɹɛst/"),
            make("a sense of", "a feeling or awareness of something",
                 "〜の感覚・〜感",
                 useCases: ["ある感覚や雰囲気を表すとき"],
                 examples: [
                    ("A sense of humor.", "ユーモアのセンス。"),
                    ("A sense of belonging.", "帰属感。")
                 ], ipa: "/ɐ sˈɛns ɒv/"),
            make("sth is done for", "something is ruined or finished",
                 "〜はもうおしまいだ",
                 useCases: ["望みがなく終わった状態を表すとき"],
                 examples: [
                    ("The car is done for.", "その車はもうダメだ。"),
                    ("If they find out, I'm done for.", "バレたら俺はおしまいだ。")
                 ], ipa: "/sˈʌmθɪŋ ɪz dˈʌn fɔː/"),
            make("what I'm trying to do", "the goal I am attempting",
                 "私がしようとしているのは",
                 useCases: ["自分の意図を説明するとき"],
                 examples: [
                    ("What I'm trying to do is help.", "私がしようとしてるのは助けることだ。"),
                    ("That's what I'm trying to do.", "それが私のやろうとしてることだ。")
                 ], ipa: "/wˌɒt aɪm tɹˈaɪɪŋ tə dˈuː/"),
            make("all the", "emphasizing the whole amount or extent",
                 "あらゆる・その分だけ",
                 useCases: ["全部や程度を強調するとき"],
                 examples: [
                    ("All the more reason.", "なおさらの理由だ。"),
                    ("All the best.", "ご多幸を。")
                 ], ipa: "/ˈɔːl ðə/"),
            make("100% better", "completely or greatly improved",
                 "格段に良い・完全に良くなった",
                 useCases: ["大幅な改善を口語で強調するとき"],
                 examples: [
                    ("I feel 100% better.", "すっかり良くなった。"),
                    ("This is 100% better.", "これは断然良い。")
                 ], ipa: "/wˈɒnhˈʌndɹɪd pəsˈɛnt bˈɛtɐ/"),
            make("leave my mind drift", "let my thoughts wander",
                 "考えをさまよわせる",
                 useCases: ["集中せず思考が漂うのに任せるとき"],
                 examples: [
                    ("I let my mind drift.", "ぼんやり考えを巡らせた。"),
                    ("Don't leave your mind drift.", "気を散らさないで。")
                 ], ipa: "/lˈiːv maɪ mˈaɪnd dɹˈɪft/"),
            make("the best sth I've used so far", "the best one used until now",
                 "今まで使った中で一番の〜",
                 useCases: ["これまでの経験で最高だと評価するとき"],
                 examples: [
                    ("The best app I've used so far.", "今まで使った中で一番のアプリ。"),
                    ("The best tool I've used so far.", "これまでで最高の道具。")
                 ], ipa: "/ðə bˈɛst sˈʌmθɪŋ aɪv jˈuːzd sˈəʊ fˌɑː/"),
            make("I'm done for", "I'm in serious trouble; finished",
                 "もうダメだ・おしまいだ",
                 useCases: ["絶望的な状況を口語で表すとき"],
                 examples: [
                    ("If I fail this, I'm done for.", "これに落ちたらおしまいだ。"),
                    ("I'm done for if she finds out.", "彼女にバレたら終わりだ。")
                 ], ipa: "/aɪm dˈʌn fɔː/"),
            make("as early as", "no later than the surprisingly early time of",
                 "早くも〜には",
                 useCases: ["想像より早い時期を強調するとき"],
                 examples: [
                    ("As early as next week.", "早ければ来週にも。"),
                    ("As early as age five.", "わずか5歳で。")
                 ], ipa: "/æz ˈɜːlɪ æz/"),
            make("how bad does sth get", "to what extent does it worsen",
                 "どれくらいひどくなるのか",
                 useCases: ["悪化の程度を尋ねるとき"],
                 examples: [
                    ("How bad does the pain get?", "痛みはどれくらいひどくなる？"),
                    ("How bad does it get in winter?", "冬はどれほど悪くなる？")
                 ], ipa: "/hˌaʊ bˈæd dˈʌz sˈʌmθɪŋ ɡˈɛt/"),
            make("where you live", "the place of your residence",
                 "あなたが住んでいる所",
                 useCases: ["居住地を話題にするとき"],
                 examples: [
                    ("Where you live matters.", "どこに住むかは重要だ。"),
                    ("Is it cold where you live?", "あなたの所は寒い？")
                 ], ipa: "/wˌeə juː lˈɪv/"),
            make("thoughts on", "an opinion about something",
                 "〜についての意見・考え",
                 useCases: ["相手の意見を尋ねるとき"],
                 examples: [
                    ("Thoughts on this plan?", "この案についてどう思う？"),
                    ("Any thoughts on it?", "それについて何か意見ある？")
                 ], ipa: "/θˈɔːts ˈɒn/"),
            make("the possibility of", "the chance that something may happen",
                 "〜の可能性",
                 useCases: ["何かが起こりうることを述べるとき"],
                 examples: [
                    ("The possibility of rain.", "雨の可能性。"),
                    ("The possibility of failure.", "失敗の可能性。")
                 ], ipa: "/ðə pˌɒsəbˈɪlɪtɪ ɒv/"),
            make("I seem to be ing", "I appear to be doing something",
                 "どうやら〜しているようだ",
                 useCases: ["自分の状態を控えめに述べるとき"],
                 examples: [
                    ("I seem to be improving.", "どうやら上達しているようだ。"),
                    ("I seem to be lost.", "道に迷っているみたいだ。")
                 ], ipa: "/aɪ sˈiːm təbɪ ˈɪŋ/"),
            make("have trouble", "experience difficulty doing something",
                 "〜に苦労する・手こずる",
                 useCases: ["何かがうまくいかず困っているとき"],
                 examples: [
                    ("I have trouble sleeping.", "寝つきが悪い。"),
                    ("Have trouble with English.", "英語に苦労する。")
                 ], ipa: "/hæv tɹˈʌbəl/"),
            make("a degree", "a level or amount; an academic qualification",
                 "ある程度・学位",
                 useCases: ["程度を表す、または大学の学位を表すとき"],
                 examples: [
                    ("To a degree.", "ある程度はね。"),
                    ("A college degree.", "大学の学位。")
                 ], ipa: "/ɐ dɪɡɹˈiː/"),
            make("have a problem with", "object to or dislike something",
                 "〜に不満がある・問題視する",
                 useCases: ["何かに異議や不満があるとき"],
                 examples: [
                    ("I have a problem with that.", "それには異議がある。"),
                    ("Do you have a problem with me?", "私に何か文句でも？")
                 ], ipa: "/hæv ɐ pɹˈɒbləm wɪð/"),
            make("suit sth best", "be the most appropriate for something",
                 "〜に一番合う",
                 useCases: ["最も適した選択を述べるとき"],
                 examples: [
                    ("Which plan suits you best?", "どのプランが一番合う？"),
                    ("This suits the job best.", "これが仕事に一番合う。")
                 ], ipa: "/sˈuːt sˈʌmθɪŋ bˈɛst/"),
            make("the issue is that", "the main problem is that",
                 "問題は〜ということだ",
                 useCases: ["核心の問題点を切り出すとき"],
                 examples: [
                    ("The issue is that it's too slow.", "問題は遅すぎることだ。"),
                    ("The issue is that nobody knows.", "問題は誰も知らないことだ。")
                 ], ipa: "/ðɪ ˈɪʃuː ɪz ðˈæt/"),
            make("sth has been", "something has existed or continued",
                 "〜はずっと〜だ・〜されてきた",
                 useCases: ["継続や完了の状態を述べるとき"],
                 examples: [
                    ("It has been a long day.", "長い一日だった。"),
                    ("The app has been updated.", "アプリは更新された。")
                 ], ipa: "/sˈʌmθɪŋ hˈæzbiːn/"),
            make("I'll just use", "I'll simply make use of (a choice)",
                 "とりあえず〜を使うよ",
                 useCases: ["手軽な選択を述べるとき"],
                 examples: [
                    ("I'll just use my phone.", "とりあえずスマホを使うよ。"),
                    ("I'll just use the free one.", "無料のやつでいいや。")
                 ], ipa: "/aɪl dʒˈʌst jˈuːz/"),
            make("vertically", "in an up-and-down direction",
                 "垂直に・縦方向に",
                 useCases: ["上下方向の向きを表すとき"],
                 examples: [
                    ("Scroll vertically.", "縦にスクロールする。"),
                    ("Stacked vertically.", "縦に積まれている。")
                 ], ipa: "/vˈɜːtɪklɪ/"),
            make("horizontally", "in a side-to-side direction",
                 "水平に・横方向に",
                 useCases: ["左右方向の向きを表すとき"],
                 examples: [
                    ("Rotate horizontally.", "横に回転させる。"),
                    ("Lined up horizontally.", "横一列に並ぶ。")
                 ], ipa: "/hˌɒɹɪzˈɒntəlɪ/"),
            make("minute walk away", "reachable in a short walk",
                 "歩いて〜分の所",
                 useCases: ["徒歩でかかる時間を表すとき"],
                 examples: [
                    ("It's a five minute walk away.", "歩いて5分の所だ。"),
                    ("Just a minute walk away.", "ほんの数分歩くだけ。")
                 ], ipa: "/mˈɪnɪt wˈɔːk ɐwˈeɪ/"),
            make("specially", "for a particular purpose; especially",
                 "特別に・わざわざ",
                 useCases: ["特定の目的のために行うことを表すとき"],
                 examples: [
                    ("Made specially for you.", "君のために特別に作った。"),
                    ("Specially designed.", "特別に設計された。")
                 ], ipa: "/spˈɛʃəlɪ/"),
            make("flash sth", "show something briefly; shine quickly",
                 "〜をちらっと見せる・光らせる",
                 useCases: ["一瞬見せたり光らせたりするとき"],
                 examples: [
                    ("Flash your badge.", "バッジをさっと見せて。"),
                    ("Flash a smile.", "にっこり笑いかける。")
                 ], ipa: "/flˈæʃ sˈʌmθɪŋ/"),
            make("sth alone", "something by itself; without help",
                 "〜だけで・単独で",
                 useCases: ["それ単体で、他の助けなしにを表すとき"],
                 examples: [
                    ("The price alone is huge.", "値段だけでも莫大だ。"),
                    ("Do it alone.", "一人でやる。")
                 ], ipa: "/sˈʌmθɪŋ ɐlˈəʊn/"),
            make("nope", "no (informal)",
                 "いや・違うよ(くだけた言い方)",
                 useCases: ["カジュアルに否定するとき"],
                 examples: [
                    ("Nope, not me.", "いや、僕じゃないよ。"),
                    ("Nope, never been there.", "いや、行ったことない。")
                 ], ipa: "/nˈəʊp/")
        ]
    }

    // MARK: - 教育・その他 (追加 58)

    private static var eduMisc58: [Word] {
        [
            make("senior", "older or higher in rank; a final-year student",
                 "年上の・上級の・最上級生",
                 useCases: ["地位や学年が上のことを表すとき"],
                 examples: [
                    ("A senior manager.", "上級管理職。"),
                    ("A high school senior.", "高校3年生。")
                 ], ipa: "/sˈiːnjɐ/"),
            make("sophomore", "a second-year student",
                 "(高校・大学の)2年生",
                 useCases: ["アメリカの学制で2年生を表すとき"],
                 examples: [
                    ("A sophomore in college.", "大学2年生。"),
                    ("Sophomore year.", "2年次。")
                 ], ipa: "/sˈɒfəmˌɔː/"),
            make("freshman", "a first-year student",
                 "(高校・大学の)1年生",
                 useCases: ["新入生・1年生を表すとき"],
                 examples: [
                    ("A college freshman.", "大学1年生。"),
                    ("Freshman orientation.", "新入生オリエン。")
                 ], ipa: "/fɹˈɛʃmən/"),
            make("upskill", "learn new skills to improve at work",
                 "スキルを高める・学び直す",
                 useCases: ["仕事のために新しい技能を身につけるとき"],
                 examples: [
                    ("Upskill your team.", "チームのスキルを底上げする。"),
                    ("I want to upskill.", "スキルアップしたい。")
                 ], ipa: "/ˈʌpskɪl/"),
            make("pesticide", "a chemical used to kill pests",
                 "農薬・殺虫剤",
                 useCases: ["害虫駆除に使う化学薬品を表すとき"],
                 examples: [
                    ("Spray pesticide.", "農薬を散布する。"),
                    ("Pesticide-free.", "無農薬の。")
                 ], ipa: "/pˈɛstɪsˌaɪd/"),
            make("farming", "the activity of growing crops or raising animals",
                 "農業・畜産",
                 useCases: ["農作物や家畜を育てる営みを表すとき"],
                 examples: [
                    ("Organic farming.", "有機農業。"),
                    ("Fish farming.", "養殖。")
                 ], ipa: "/fˈɑːmɪŋ/"),
            make("quarrel", "an angry argument or disagreement",
                 "口論・けんか",
                 useCases: ["言い争いや仲たがいを表すとき"],
                 examples: [
                    ("Have a quarrel.", "口論する。"),
                    ("A family quarrel.", "家族間のもめ事。")
                 ], ipa: "/kwˈɒɹəl/"),
            make("quake", "shake; an earthquake",
                 "揺れる・地震",
                 useCases: ["大地や体が震えること、地震を表すとき"],
                 examples: [
                    ("The ground quaked.", "地面が揺れた。"),
                    ("A massive quake.", "大地震。")
                 ], ipa: "/kwˈeɪk/"),
            make("destiny", "events fixed by fate; one's future",
                 "運命・宿命",
                 useCases: ["定められた将来や運命を表すとき"],
                 examples: [
                    ("Control your destiny.", "自分の運命を切り開く。"),
                    ("It's my destiny.", "それが私の運命だ。")
                 ], ipa: "/dˈɛstɪnɪ/"),
            make("personality", "the qualities that form a person's character",
                 "性格・人格",
                 useCases: ["人の個性や人柄を表すとき"],
                 examples: [
                    ("A bright personality.", "明るい性格。"),
                    ("A strong personality.", "強い個性。")
                 ], ipa: "/pˌɜːsənˈælɪtɪ/"),
            make("sleet", "rain mixed with snow or ice",
                 "みぞれ",
                 useCases: ["雪混じりの冷たい雨を表すとき"],
                 examples: [
                    ("Sleet fell all day.", "一日中みぞれが降った。"),
                    ("Rain turned to sleet.", "雨がみぞれに変わった。")
                 ], ipa: "/slˈiːt/"),
            make("holiday", "a day of celebration or rest; a vacation",
                 "祝日・休暇",
                 useCases: ["祝日や旅行・休暇を表すとき"],
                 examples: [
                    ("Public holiday.", "祝日。"),
                    ("On holiday.", "休暇中。")
                 ], ipa: "/hˈɒlɪdˌeɪ/")
        ]
    }

    // MARK: - 休日・日常 (追加 59)

    private static var dayOffLife59: [Word] {
        [
            make("my day off", "a day when I don't have to work",
                 "私の休みの日",
                 useCases: ["仕事や学校が休みの日を表すとき"],
                 examples: [
                    ("Today is my day off.", "今日は休みなんだ。"),
                    ("Spend my day off relaxing.", "休みの日はゆっくり過ごす。")
                 ], ipa: "/maɪ dˈeɪ ˈɒf/"),
            make("have something to do", "have a task or plan to complete",
                 "やることがある",
                 useCases: ["予定や用事があると伝えるとき"],
                 examples: [
                    ("I have something to do later.", "後で用事があるんだ。"),
                    ("Sorry, I have something to do.", "ごめん、ちょっと用事があって。")
                 ], ipa: "/hæv sˈʌmθɪŋ tə dˈuː/"),
            make("I think I'm gonna", "I'm about to do something (casual)",
                 "〜しようかなと思ってる",
                 useCases: ["自分の予定をくだけて伝えるとき"],
                 examples: [
                    ("I think I'm gonna nap.", "ちょっと昼寝しようかな。"),
                    ("I think I'm gonna head out.", "そろそろ出ようかな。")
                 ], ipa: "/aɪ θˈɪŋk aɪm ɡˌənɐ/"),
            make("in a bit", "soon; in a short while",
                 "もうすぐ・あとで",
                 useCases: ["近い未来に何かをすると伝えるとき"],
                 examples: [
                    ("See you in a bit.", "あとでね。"),
                    ("I'll be there in a bit.", "もうすぐ着くよ。")
                 ], ipa: "/ɪn ɐ bˈɪt/"),
            make("stave off", "delay or prevent something unwanted",
                 "〜を食い止める・先送りにする",
                 useCases: ["望ましくないことを防ぐとき"],
                 examples: [
                    ("Stave off hunger.", "空腹をしのぐ。"),
                    ("Stave off boredom.", "退屈をまぎらわす。")
                 ], ipa: "/stˈeɪv ˈɒf/"),
            make("rest at home", "stay home and relax",
                 "家で休む",
                 useCases: ["家でゆっくり休養するとき"],
                 examples: [
                    ("I'll just rest at home.", "家で休んでるよ。"),
                    ("Rest at home today.", "今日は家で休もう。")
                 ], ipa: "/ɹˈɛst æt hˈəʊm/"),
            make("for the very first time", "for the absolute first occasion",
                 "本当に初めて",
                 useCases: ["初体験を強調するとき"],
                 examples: [
                    ("For the very first time.", "正真正銘初めて。"),
                    ("I saw snow for the very first time.", "生まれて初めて雪を見た。")
                 ], ipa: "/fəðə vˈɛɹɪ fˈɜːst tˈaɪm/"),
            make("a pair of", "two of something that go together",
                 "1組の・1足の",
                 useCases: ["靴や手袋など2つで一組のものを表すとき"],
                 examples: [
                    ("A pair of shoes.", "靴一足。"),
                    ("A pair of glasses.", "眼鏡一つ。")
                 ], ipa: "/ɐ pˈeəɹ ɒv/"),
            make("night fall", "the time when night begins",
                 "日暮れ・夕暮れ",
                 useCases: ["日が落ちる頃を表すとき"],
                 examples: [
                    ("Before night fall.", "日が暮れる前に。"),
                    ("At night fall.", "夕暮れ時に。")
                 ], ipa: "/nˈaɪt fˈɔːl/"),
            make("magnificent", "extremely beautiful or impressive",
                 "壮大な・見事な",
                 useCases: ["景色や建物が圧倒的に素晴らしいとき"],
                 examples: [
                    ("A magnificent view.", "見事な景色。"),
                    ("Magnificent architecture.", "壮麗な建築。")
                 ], ipa: "/mæɡnˈɪfɪsənt/"),
            make("high rise", "a tall building with many floors",
                 "高層ビル",
                 useCases: ["階数の多い建物を表すとき"],
                 examples: [
                    ("A high rise apartment.", "高層マンション。"),
                    ("High rise buildings.", "高層ビル群。")
                 ], ipa: "/hˈaɪ ɹˈaɪz/"),
            make("architecture", "the art of designing buildings",
                 "建築・建築様式",
                 useCases: ["建物の設計や様式について話すとき"],
                 examples: [
                    ("Modern architecture.", "現代建築。"),
                    ("Study architecture.", "建築を学ぶ。")
                 ], ipa: "/ˈɑːkɪtˌɛktʃɐ/"),
            make("apocalypse", "a catastrophic end of the world",
                 "黙示録・世界の終わり",
                 useCases: ["世界規模の終末を表すとき"],
                 examples: [
                    ("Zombie apocalypse.", "ゾンビによる世界の終わり。"),
                    ("Like an apocalypse.", "終末みたいだ。")
                 ], ipa: "/ɐpˈɒkɐlˌɪps/"),
            make("perhaps", "possibly; maybe",
                 "もしかすると・たぶん",
                 useCases: ["不確かな可能性を述べるとき"],
                 examples: [
                    ("Perhaps later.", "後でね、たぶん。"),
                    ("Perhaps you're right.", "もしかして君が正しいかも。")
                 ], ipa: "/pəhˈæps/"),
            make("good looking", "attractive in appearance",
                 "見た目が良い・美しい",
                 useCases: ["容姿が魅力的な人を表すとき"],
                 examples: [
                    ("A good looking guy.", "イケメン。"),
                    ("Good looking food.", "見た目のいい料理。")
                 ], ipa: "/ɡˈʊd lˈʊkɪŋ/"),
            make("have a tendency to", "be inclined to do something",
                 "〜する傾向がある",
                 useCases: ["習慣的な傾向を述べるとき"],
                 examples: [
                    ("I have a tendency to overthink.", "考えすぎる傾向がある。"),
                    ("He has a tendency to be late.", "彼は遅刻する傾向がある。")
                 ], ipa: "/hæv ɐ tˈɛndənsɪ tuː/"),
            make("grab a bite to eat", "have a quick meal",
                 "軽く食べる",
                 useCases: ["手軽に食事を済ませるとき"],
                 examples: [
                    ("Let's grab a bite to eat.", "ちょっと食べに行こう。"),
                    ("Grab a bite to eat before work.", "仕事前に何か食べる。")
                 ], ipa: "/ɡɹˈæb ɐ bˈaɪt tʊ ˈiːt/"),
            make("stuck at home", "unable to leave the house",
                 "家から出られない",
                 useCases: ["天気や体調で外出できないとき"],
                 examples: [
                    ("Stuck at home all day.", "一日中家にこもってる。"),
                    ("Stuck at home with a cold.", "風邪で家から出られない。")
                 ], ipa: "/stˈʌk æt hˈəʊm/"),
            make("head out for", "leave to go to a destination",
                 "〜へ出かける",
                 useCases: ["これから外出する目的地を伝えるとき"],
                 examples: [
                    ("Head out for lunch.", "ランチに出かける。"),
                    ("Head out for a walk.", "散歩に出かける。")
                 ], ipa: "/hˈɛd ˈaʊt fɔː/"),
            make("shortly", "in a short time; soon",
                 "まもなく・じきに",
                 useCases: ["近い将来をかしこまって表すとき"],
                 examples: [
                    ("I'll be there shortly.", "まもなくそちらに着きます。"),
                    ("Begin shortly.", "じきに始まる。")
                 ], ipa: "/ʃˈɔːtlɪ/"),
            make("excellence", "the quality of being outstanding",
                 "卓越・優秀さ",
                 useCases: ["極めて優れた水準を表すとき"],
                 examples: [
                    ("A symbol of excellence.", "卓越の象徴。"),
                    ("Pursue excellence.", "卓越を追求する。")
                 ], ipa: "/ˈɛksələns/"),
            make("anthem", "an uplifting song; a national song",
                 "国歌・テーマソング",
                 useCases: ["国歌や象徴的な曲を表すとき"],
                 examples: [
                    ("The national anthem.", "国歌。"),
                    ("A team anthem.", "チームの応援歌。")
                 ], ipa: "/ˈænθəm/"),
            make("leave off", "stop or omit something",
                 "やめる・抜かす",
                 useCases: ["途中でやめる、抜かして進めるとき"],
                 examples: [
                    ("Pick up where we left off.", "中断したところから再開しよう。"),
                    ("Leave off the salt.", "塩を抜いて。")
                 ], ipa: "/lˈiːv ˈɒf/"),
            make("crawl out", "move out slowly on hands and knees",
                 "這って出てくる",
                 useCases: ["疲れて起き出す、隠れ場所から出るとき"],
                 examples: [
                    ("Crawl out of bed.", "ベッドから這い出る。"),
                    ("Crawl out of a hole.", "穴から這い出る。")
                 ], ipa: "/kɹˈɔːl ˈaʊt/"),
            make("peaceful", "calm and free from disturbance",
                 "穏やかな・平和な",
                 useCases: ["静かで落ち着いた状態を表すとき"],
                 examples: [
                    ("A peaceful morning.", "穏やかな朝。"),
                    ("Peaceful protest.", "平和的なデモ。")
                 ], ipa: "/pˈiːsfəl/"),
            make("treat myself to", "indulge in something enjoyable",
                 "自分への ご褒美に〜する",
                 useCases: ["自分にご褒美をあげるとき"],
                 examples: [
                    ("Treat myself to cake.", "ご褒美にケーキを食べる。"),
                    ("I'll treat myself to a massage.", "マッサージで自分をねぎらおう。")
                 ], ipa: "/tɹˈiːt maɪsˈɛlf tuː/"),
            make("I'm off today", "I am not working today",
                 "今日は休みだ",
                 useCases: ["仕事が休みの日を伝えるとき"],
                 examples: [
                    ("I'm off today, want to hang?", "今日休みだけど、遊ぶ？"),
                    ("I'm off today, sleeping in.", "今日休みだから二度寝。")
                 ], ipa: "/aɪm ˈɒf tədˈeɪ/"),
            make("I'm actually about to", "I'm just on the verge of doing",
                 "実はちょうど〜しようとしてる",
                 useCases: ["話しかけられた直前の予定を伝えるとき"],
                 examples: [
                    ("I'm actually about to leave.", "実はちょうど出るところ。"),
                    ("I'm actually about to call you.", "ちょうど電話しようとしてた。")
                 ], ipa: "/aɪm ˈæktʃuːəlɪ ɐbˈaʊt tuː/"),
            make("binge watch", "watch many episodes in a row",
                 "一気見する",
                 useCases: ["ドラマや動画をぶっ続けで見るとき"],
                 examples: [
                    ("Binge watch a series.", "シリーズを一気見する。"),
                    ("We binge watched all night.", "一晩中一気見した。")
                 ], ipa: "/bˈɪndʒ wˈɒtʃ/"),
            make("cooped up inside", "stuck indoors and restless",
                 "家にこもりっぱなしで",
                 useCases: ["長時間室内に閉じ込められた状態を表すとき"],
                 examples: [
                    ("Cooped up inside all weekend.", "週末ずっと家にこもってた。"),
                    ("Feel cooped up inside.", "家にこもって気詰まりだ。")
                 ], ipa: "/kˈuːpt ˌʌp ɪnsˈaɪd/"),
            make("quick bite", "a small or fast meal",
                 "軽食",
                 useCases: ["時間のない時の軽い食事を表すとき"],
                 examples: [
                    ("Grab a quick bite.", "ちょっと食べる。"),
                    ("Just a quick bite before work.", "仕事前に軽く一口。")
                 ], ipa: "/kwˈɪk bˈaɪt/"),
            make("bored out of my mind", "extremely bored",
                 "退屈で死にそう",
                 useCases: ["極度に退屈な状態を口語で表すとき"],
                 examples: [
                    ("I'm bored out of my mind.", "暇すぎて死にそう。"),
                    ("Bored out of my mind in class.", "授業で暇でしょうがない。")
                 ], ipa: "/bˈɔːd ˌaʊtəv maɪ mˈaɪnd/"),
            make("I'm finally done", "I have at last finished",
                 "やっと終わった",
                 useCases: ["長い作業がついに終わったとき"],
                 examples: [
                    ("I'm finally done with work.", "やっと仕事終わった。"),
                    ("I'm finally done writing.", "ようやく書き終わった。")
                 ], ipa: "/aɪm fˈaɪnəlɪ dˈʌn/"),
            make("reward myself", "give myself a treat for an accomplishment",
                 "自分にご褒美をあげる",
                 useCases: ["努力の見返りに自分を労うとき"],
                 examples: [
                    ("Reward myself with dessert.", "デザートで自分にご褒美。"),
                    ("Time to reward myself.", "自分にご褒美をあげる時間だ。")
                 ], ipa: "/ɹɪwˈɔːd maɪsˈɛlf/"),
            make("I've been inside", "I have been indoors",
                 "ずっと中にいた・室内にいた",
                 useCases: ["長時間室内で過ごしたことを伝えるとき"],
                 examples: [
                    ("I've been inside all day.", "一日中室内にいた。"),
                    ("I've been inside since morning.", "朝からずっと中にいる。")
                 ], ipa: "/aɪv bˌiːn ɪnsˈaɪd/"),
            make("get a change of scenery", "go somewhere different for variety",
                 "気分転換に環境を変える",
                 useCases: ["気分を変えるために場所を変えるとき"],
                 examples: [
                    ("I need a change of scenery.", "気分を変えたいな。"),
                    ("Get a change of scenery this weekend.", "週末は環境を変えよう。")
                 ], ipa: "/ɡɛt ɐ tʃˈeɪndʒ ɒv sˈiːnəɹɪ/"),
            make("chill at home", "relax at home casually",
                 "家でまったりする",
                 useCases: ["家でのんびり過ごすとき"],
                 examples: [
                    ("Just chill at home today.", "今日は家でまったり。"),
                    ("Chill at home with snacks.", "おやつで家まったり。")
                 ], ipa: "/tʃˈɪl æt hˈəʊm/")
        ]
    }

    // MARK: - 仕事・勉強 (追加 59)

    private static var workStudy59: [Word] {
        [
            make("clock out", "record the end of a work shift",
                 "退勤する・打刻して帰る",
                 useCases: ["勤務終了を表すとき"],
                 examples: [
                    ("Clock out at five.", "5時に退勤する。"),
                    ("Don't forget to clock out.", "退勤打刻を忘れずに。")
                 ], ipa: "/klˈɒk ˈaʊt/"),
            make("glued to my desk", "unable to leave my workspace",
                 "机にかじりついている",
                 useCases: ["長時間デスクから離れられないことを表すとき"],
                 examples: [
                    ("Glued to my desk all day.", "一日中机から動けない。"),
                    ("Been glued to my desk.", "ずっと机にかじりついてた。")
                 ], ipa: "/ɡlˈuːd tə maɪ dˈɛsk/"),
            make("finish work", "complete the day's work; quit the job",
                 "仕事を終える",
                 useCases: ["一日の業務終了や仕事の完了を表すとき"],
                 examples: [
                    ("Finish work at six.", "6時に仕事を終える。"),
                    ("Once I finish work.", "仕事を終え次第。")
                 ], ipa: "/fˈɪnɪʃ wˈɜːk/"),
            make("have sth coming up later", "have something scheduled soon",
                 "あとで〜の予定がある",
                 useCases: ["少し先に予定があると伝えるとき"],
                 examples: [
                    ("I have a meeting coming up later.", "後で会議の予定がある。"),
                    ("I have something coming up later.", "後で予定があるんだ。")
                 ], ipa: "/hæv sˈʌmθɪŋ kˈʌmɪŋ ˌʌp lˈeɪtɐ/"),
            make("have some time", "have free or available time",
                 "少し時間がある",
                 useCases: ["余裕や空き時間があると伝えるとき"],
                 examples: [
                    ("Do you have some time?", "ちょっと時間ある？"),
                    ("I have some time now.", "今ちょっと時間あるよ。")
                 ], ipa: "/hæv sˌʌm tˈaɪm/"),
            make("before it starts", "prior to its beginning",
                 "始まる前に",
                 useCases: ["何かが始まる前のタイミングを表すとき"],
                 examples: [
                    ("Eat before it starts.", "始まる前に食べておいて。"),
                    ("Arrive before it starts.", "始まる前に着いて。")
                 ], ipa: "/bɪfˌɔːɹ ɪt stˈɑːts/"),
            make("waiting around", "passing time idly while waiting",
                 "ぼんやり待っている",
                 useCases: ["何もせず時間を持て余して待つとき"],
                 examples: [
                    ("Waiting around for nothing.", "意味もなく待ってる。"),
                    ("Tired of waiting around.", "待つのに飽きた。")
                 ], ipa: "/wˈeɪtɪŋ ɐɹˈaʊnd/"),
            make("inside preparing for sth", "indoors getting ready for something",
                 "中で〜の準備をしている",
                 useCases: ["室内で予定の準備をしているとき"],
                 examples: [
                    ("Inside preparing for the trip.", "中で旅行の準備中。"),
                    ("Inside preparing for tonight.", "今夜のために中で準備中。")
                 ], ipa: "/ɪnsˈaɪd pɹɪpˈeəɹɪŋ fɔː sˈʌmθɪŋ/"),
            make("file sth", "submit a document officially; arrange in order",
                 "〜を提出する・整理する",
                 useCases: ["書類を提出する、整理して保管するとき"],
                 examples: [
                    ("File a complaint.", "苦情を申し立てる。"),
                    ("File your taxes.", "確定申告を提出する。")
                 ], ipa: "/fˈaɪl sˈʌmθɪŋ/"),
            make("fuel up", "refill with fuel; eat to gain energy",
                 "給油する・栄養補給する",
                 useCases: ["車を給油する、しっかり食べるとき"],
                 examples: [
                    ("Fuel up before the trip.", "出発前に給油する。"),
                    ("Fuel up with breakfast.", "朝食で力をつける。")
                 ], ipa: "/fjˈuːəl ˈʌp/"),
            make("have some downtime", "have unscheduled free time",
                 "休憩時間がある",
                 useCases: ["仕事の合間に余裕の時間があるとき"],
                 examples: [
                    ("Have some downtime today.", "今日は少し余裕がある。"),
                    ("I have some downtime now.", "今ちょっとひと息ついている。")
                 ], ipa: "/hæv sˌʌm dˈaʊntaɪm/"),
            make("log on", "sign in to a computer system",
                 "ログオンする",
                 useCases: ["システムにサインインするとき"],
                 examples: [
                    ("Log on to the server.", "サーバーにログオンする。"),
                    ("Can't log on.", "ログオンできない。")
                 ], ipa: "/lˈɒɡ ˈɒn/"),
            make("a bit early", "slightly before the scheduled time",
                 "少し早く",
                 useCases: ["予定より少し前を表すとき"],
                 examples: [
                    ("I arrived a bit early.", "少し早く着いた。"),
                    ("That's a bit early.", "それはちょっと早いね。")
                 ], ipa: "/ɐ bˈɪt ˈɜːlɪ/"),
            make("review sth", "examine or evaluate something again",
                 "〜を見直す・復習する",
                 useCases: ["内容を見直したり確認するとき"],
                 examples: [
                    ("Review the document.", "書類を見直す。"),
                    ("Review the lesson.", "授業を復習する。")
                 ], ipa: "/ɹɪvjˈuː sˈʌmθɪŋ/"),
            make("notes", "written records to help remember",
                 "メモ・ノート",
                 useCases: ["授業や会議の記録を表すとき"],
                 examples: [
                    ("Take notes.", "メモを取る。"),
                    ("Review your notes.", "ノートを見返す。")
                 ], ipa: "/nˈəʊts/"),
            make("progress with", "make headway on a task",
                 "〜を進める",
                 useCases: ["作業や計画を前に進めるとき"],
                 examples: [
                    ("Progress with the plan.", "計画を進める。"),
                    ("How are you progressing with the report?", "レポートの進み具合は？")
                 ], ipa: "/pɹˈəʊɡɹɛs wɪð/"),
            make("subsidiary", "a company controlled by another",
                 "子会社・補助的な",
                 useCases: ["親会社配下の企業や補助的なものを表すとき"],
                 examples: [
                    ("A subsidiary company.", "子会社。"),
                    ("Subsidiary role.", "補助的な役割。")
                 ], ipa: "/sʌbsˈɪdjəɹɪ/")
        ]
    }

    // MARK: - ゲーム・スポーツ・実況 (追加 59)

    private static var gamingSports59: [Word] {
        [
            make("starting lineup", "the initial set of players in a game",
                 "スターティングメンバー",
                 useCases: ["試合開始時に出場する選手たちを表すとき"],
                 examples: [
                    ("Check the starting lineup.", "スタメンを確認する。"),
                    ("He's in the starting lineup.", "彼はスタメンだ。")
                 ], ipa: "/stˈɑːtɪŋ lˈaɪnʌp/"),
            make("on the beach", "located at or visiting the beach",
                 "ビーチで・浜辺で",
                 useCases: ["海辺の場所や時間を表すとき"],
                 examples: [
                    ("Relax on the beach.", "ビーチでくつろぐ。"),
                    ("Live on the beach.", "海辺に住む。")
                 ], ipa: "/ɒnðə bˈiːtʃ/"),
            make("stream", "broadcast video over the internet",
                 "配信する・ストリーミング",
                 useCases: ["動画やゲームをネット中継するとき"],
                 examples: [
                    ("Stream a game.", "ゲームを配信する。"),
                    ("Live stream.", "ライブ配信。")
                 ], ipa: "/stɹˈiːm/"),
            make("setup", "the way something is arranged",
                 "セットアップ・配置",
                 useCases: ["機材や環境の構成を表すとき"],
                 examples: [
                    ("Nice gaming setup.", "いいゲーミング環境だね。"),
                    ("Office setup.", "オフィスのレイアウト。")
                 ], ipa: "/sˈɛtʌp/"),
            make("massive match", "a very important or large-scale game",
                 "大一番の試合",
                 useCases: ["重要度の高い試合を表すとき"],
                 examples: [
                    ("It's a massive match tonight.", "今夜は大一番だ。"),
                    ("A massive match for the title.", "タイトルがかかった大試合。")
                 ], ipa: "/mˈæsɪv mˈætʃ/"),
            make("my brain check out", "my brain stops functioning attentively",
                 "頭が回らなくなる",
                 useCases: ["集中力が切れた状態を口語で表すとき"],
                 examples: [
                    ("My brain checked out an hour ago.", "1時間前から頭が止まってる。"),
                    ("Let my brain check out.", "頭を休める。")
                 ], ipa: "/maɪ bɹˈeɪn tʃˈɛk ˈaʊt/"),
            make("draw", "a tie; pull; sketch",
                 "引き分け・引く・描く",
                 useCases: ["試合の引き分けや図を描くこと、注意を引くこと"],
                 examples: [
                    ("The match ended in a draw.", "試合は引き分けに終わった。"),
                    ("Draw a picture.", "絵を描く。")
                 ], ipa: "/dɹˈɔː/"),
            make("expected value", "the average outcome of a probabilistic event",
                 "期待値",
                 useCases: ["確率的に予想される平均的な結果を表すとき"],
                 examples: [
                    ("Calculate the expected value.", "期待値を計算する。"),
                    ("Positive expected value.", "プラスの期待値。")
                 ], ipa: "/ɪkspˈɛktɪd vˈæljuː/"),
            make("ROI", "return on investment",
                 "投資収益率(ROI)",
                 useCases: ["投資に対する利益の割合を表すとき"],
                 examples: [
                    ("High ROI.", "高いROI。"),
                    ("Measure the ROI.", "投資効果を測る。")
                 ], ipa: "/ɹˈɔɪ/"),
            make("remaining", "still left after others are gone",
                 "残りの・残っている",
                 useCases: ["残っている量や数を表すとき"],
                 examples: [
                    ("Remaining time.", "残り時間。"),
                    ("Two remaining seats.", "残り2席。")
                 ], ipa: "/ɹɪmˈeɪnɪŋ/"),
            make("probability", "the likelihood of something happening",
                 "確率・見込み",
                 useCases: ["数学的・統計的な可能性を表すとき"],
                 examples: [
                    ("High probability.", "高確率。"),
                    ("Probability of rain.", "降水確率。")
                 ], ipa: "/pɹˌɒbəbˈɪlɪtɪ/"),
            make("minimize", "reduce to the smallest possible amount",
                 "最小化する・抑える",
                 useCases: ["損失や影響を最小に抑えるとき"],
                 examples: [
                    ("Minimize the risk.", "リスクを最小限にする。"),
                    ("Minimize the window.", "ウィンドウを最小化する。")
                 ], ipa: "/mˈɪnɪmˌaɪz/"),
            make("carbon footprint", "the amount of CO2 a person or activity produces",
                 "カーボンフットプリント・CO2排出量",
                 useCases: ["環境への二酸化炭素影響を表すとき"],
                 examples: [
                    ("Reduce your carbon footprint.", "CO2排出量を減らす。"),
                    ("A large carbon footprint.", "大きなカーボンフットプリント。")
                 ], ipa: "/kˈɑːbən fˈʊtpɹɪnt/"),
            make("single use", "designed to be used once and discarded",
                 "使い捨ての",
                 useCases: ["一回限りで捨てる製品を表すとき"],
                 examples: [
                    ("Single use plastics.", "使い捨てプラスチック。"),
                    ("Avoid single use items.", "使い捨ての物を避ける。")
                 ], ipa: "/sˈɪŋɡəl jˈuːs/"),
            make("every small steps count against", "every small action contributes to",
                 "小さな一歩一歩が積み重なって対抗する",
                 useCases: ["小さな行動の積み重ねを強調するとき"],
                 examples: [
                    ("Every small step counts against climate change.", "小さな一歩一歩が気候変動対策になる。"),
                    ("Every small step counts against waste.", "ひとつひとつの行動がごみ削減につながる。")
                 ], ipa: "/ˈɛvɹɪ smˈɔːl stˈɛps kˈaʊnt ɐɡˈɛnst/"),
            make("opposing", "competing against; on the opposite side",
                 "対戦相手の・反対の",
                 useCases: ["対立する側や相手側を表すとき"],
                 examples: [
                    ("The opposing team.", "相手チーム。"),
                    ("Opposing views.", "対立する意見。")
                 ], ipa: "/əpˈəʊzɪŋ/"),
            make("trash talk", "insulting talk between competitors",
                 "挑発的な口論・トラッシュトーク",
                 useCases: ["スポーツやゲームでの相手への挑発を表すとき"],
                 examples: [
                    ("Don't trash talk.", "挑発するな。"),
                    ("Trash talk between rivals.", "ライバル同士の挑発。")
                 ], ipa: "/tɹˈæʃ tˈɔːk/"),
            make("text message", "an SMS or chat message",
                 "テキストメッセージ・SMS",
                 useCases: ["スマホで送るメッセージを表すとき"],
                 examples: [
                    ("Send a text message.", "テキストメッセージを送る。"),
                    ("Got your text message.", "メッセージ受け取ったよ。")
                 ], ipa: "/tˈɛkst mˈɛsɪdʒ/"),
            make("geek out over", "show intense enthusiasm for a topic",
                 "〜にハマって熱く語る",
                 useCases: ["大好きな話題を夢中で語るとき"],
                 examples: [
                    ("Geek out over gadgets.", "ガジェットに熱中する。"),
                    ("We geeked out over the game.", "ゲームの話で盛り上がった。")
                 ], ipa: "/ɡˈiːk ˈaʊt ˈəʊvɐ/"),
            make("everything depends on", "the outcome is determined by",
                 "全ては〜次第だ",
                 useCases: ["結果が何かに左右されると述べるとき"],
                 examples: [
                    ("Everything depends on the weather.", "全ては天気次第だ。"),
                    ("Everything depends on you.", "すべて君次第だ。")
                 ], ipa: "/ˈɛvɹɪθˌɪŋ dɪpˈɛndz ˈɒn/"),
            make("betting strategy", "a plan for placing bets",
                 "賭けの戦略",
                 useCases: ["賭け事の方針を考えるとき"],
                 examples: [
                    ("A solid betting strategy.", "確かな賭けの戦略。"),
                    ("My betting strategy.", "私の賭け戦略。")
                 ], ipa: "/bˈɛtɪŋ stɹˈætədʒɪ/"),
            make("history", "events of the past; record of events",
                 "歴史・履歴",
                 useCases: ["過去の出来事や記録を表すとき"],
                 examples: [
                    ("Make history.", "歴史を作る。"),
                    ("Browser history.", "閲覧履歴。")
                 ], ipa: "/hˈɪstəɹɪ/"),
            make("playstyle", "the manner in which someone plays",
                 "プレイスタイル",
                 useCases: ["ゲームやスポーツの戦い方の特徴を表すとき"],
                 examples: [
                    ("An aggressive playstyle.", "攻撃的なプレイスタイル。"),
                    ("Match the playstyle.", "プレイスタイルに合わせる。")
                 ], ipa: "/plˈeɪstaɪl/"),
            make("counter strategy", "a plan to neutralize an opponent",
                 "対抗策・カウンター戦略",
                 useCases: ["相手の戦略に対抗する戦法を表すとき"],
                 examples: [
                    ("Develop a counter strategy.", "対抗戦略を立てる。"),
                    ("Need a counter strategy.", "カウンター戦略が必要だ。")
                 ], ipa: "/kˈaʊntɐ stɹˈætədʒɪ/"),
            make("metrics", "measurements used to track performance",
                 "指標・メトリクス",
                 useCases: ["数値で測る評価項目を表すとき"],
                 examples: [
                    ("Track the metrics.", "指標を追跡する。"),
                    ("Key metrics.", "主要指標。")
                 ], ipa: "/mˈɛtɹɪks/"),
            make("data crunch", "to process large amounts of data",
                 "データを処理・分析する",
                 useCases: ["大量データを集計・解析するとき"],
                 examples: [
                    ("Data crunch all night.", "一晩中データを処理する。"),
                    ("Heavy data crunch.", "重いデータ処理。")
                 ], ipa: "/dˈeɪtɐ kɹˈʌntʃ/"),
            make("blow my mind", "amaze or astonish me",
                 "度肝を抜く・衝撃を受ける",
                 useCases: ["驚きや感動が大きいとき"],
                 examples: [
                    ("That blew my mind.", "ぶっ飛んだよ。"),
                    ("It blows my mind every time.", "毎回度肝を抜かれる。")
                 ], ipa: "/blˈəʊ maɪ mˈaɪnd/")
        ]
    }

    // MARK: - 食・感覚・その他 (追加 59)

    private static var dataConcepts59: [Word] {
        [
            make("flavor profile", "the overall taste characteristics of food",
                 "風味の特徴・フレーバープロファイル",
                 useCases: ["料理や飲み物の味わいの傾向を表すとき"],
                 examples: [
                    ("A rich flavor profile.", "豊かな風味の構成。"),
                    ("The flavor profile is complex.", "風味は複雑だ。")
                 ], ipa: "/flˈeɪvɐ pɹˈəʊfaɪl/"),
            make("savory", "salty or spicy rather than sweet",
                 "塩味の・うま味のある",
                 useCases: ["甘くない、しょっぱい味を表すとき"],
                 examples: [
                    ("A savory snack.", "しょっぱい系の軽食。"),
                    ("Savory dishes.", "塩気のある料理。")
                 ], ipa: "/sˈeɪvəɹɪ/"),
            make("unbox", "open packaging to reveal contents",
                 "開封する・アンボックスする",
                 useCases: ["商品を箱から出すレビューを表すとき"],
                 examples: [
                    ("Unbox the new phone.", "新しいスマホを開封する。"),
                    ("Unbox the package.", "荷物を開ける。")
                 ], ipa: "/ʌnbˈɒks/"),
            make("a box of", "a container holding multiple items",
                 "1箱の〜",
                 useCases: ["箱単位での数量を表すとき"],
                 examples: [
                    ("A box of chocolates.", "チョコレートひと箱。"),
                    ("A box of tissues.", "ティッシュひと箱。")
                 ], ipa: "/ɐ bˈɒks ɒv/"),
            make("half the fun", "a significant part of the enjoyment",
                 "楽しみの半分・面白さの半分",
                 useCases: ["過程や別の要素が楽しさの大半だと言うとき"],
                 examples: [
                    ("Surprises are half the fun.", "驚きこそが楽しみの半分。"),
                    ("Getting there is half the fun.", "そこへ行くまでが半分の楽しみ。")
                 ], ipa: "/hˈɑːf ðə fˈʌn/"),
            make("appealing", "attractive or interesting",
                 "魅力的な・心惹かれる",
                 useCases: ["惹かれるような物事を表すとき"],
                 examples: [
                    ("An appealing offer.", "魅力的な申し出。"),
                    ("Visually appealing.", "見た目が魅力的。")
                 ], ipa: "/ɐpˈiːlɪŋ/"),
            make("tear", "rip; a drop of liquid from the eye",
                 "裂く・涙",
                 useCases: ["物を破ること、または涙を表すとき"],
                 examples: [
                    ("Tear the paper.", "紙を破る。"),
                    ("A tear ran down her face.", "涙が頬を伝った。")
                 ], ipa: "/tˈiə/"),
            make("statement", "a definite or formal declaration",
                 "声明・主張",
                 useCases: ["公式な発表や強い表現を表すとき"],
                 examples: [
                    ("Make a statement.", "声明を出す。"),
                    ("A bold statement.", "大胆な主張。")
                 ], ipa: "/stˈeɪtmənt/"),
            make("accidentally", "by chance; without intention",
                 "うっかり・偶然に",
                 useCases: ["故意でない出来事を表すとき"],
                 examples: [
                    ("I accidentally deleted it.", "うっかり消しちゃった。"),
                    ("Accidentally on purpose.", "わざと偶然装って。")
                 ], ipa: "/ˌæksɪdˈɛntəlɪ/")
        ]
    }

    private static var sensoryMisc59: [Word] {
        [
            make("stamina", "the ability to sustain prolonged effort",
                 "スタミナ・持久力",
                 useCases: ["長時間頑張れる体力や精神力を表すとき"],
                 examples: [
                    ("Build stamina.", "持久力をつける。"),
                    ("Run out of stamina.", "スタミナ切れ。")
                 ], ipa: "/stˈæmɪnɐ/")
        ]
    }

    // MARK: - フレーズ・問いかけ (追加 60)

    private static var expressionsQA60: [Word] {
        [
            make("last time", "the most recent occasion",
                 "前回・この前",
                 useCases: ["前回起きたことを引き合いに出すとき"],
                 examples: [
                    ("Last time was fun.", "前回は楽しかった。"),
                    ("Last time I checked.", "この前確認したときは。")
                 ], ipa: "/lˈɑːst tˈaɪm/"),
            make("where on earth", "where (with strong frustration or surprise)",
                 "一体どこに",
                 useCases: ["強い苛立ちや驚きで「どこ」を尋ねるとき"],
                 examples: [
                    ("Where on earth are my keys?", "鍵は一体どこ？"),
                    ("Where on earth have you been?", "一体どこに行ってたの？")
                 ], ipa: "/wˌeəɹ ˌɒn ˈɜːθ/"),
            make("no sth in", "there is no X inside",
                 "中に〜がない",
                 useCases: ["中身がないことを述べるとき"],
                 examples: [
                    ("No milk in the fridge.", "冷蔵庫に牛乳がない。"),
                    ("No money in my wallet.", "財布に金がない。")
                 ], ipa: "/nˈəʊ sˈʌmθɪŋ ˈɪn/"),
            make("where am I supposed to", "where am I expected to (frustrated)",
                 "どこで〜すればいいんだ",
                 useCases: ["指示がなく困っているときの問いかけ"],
                 examples: [
                    ("Where am I supposed to park?", "どこに停めればいいの？"),
                    ("Where am I supposed to sit?", "どこに座ればいいの？")
                 ], ipa: "/wˌeəɹ æm aɪ səpˈəʊzd tuː/"),
            make("the weather is lovely", "the weather is wonderfully pleasant",
                 "天気が素敵だ",
                 useCases: ["晴れて気持ちの良い天気を表すとき"],
                 examples: [
                    ("The weather is lovely today.", "今日は天気が素敵だ。"),
                    ("The weather is lovely outside.", "外は気持ちの良い天気だ。")
                 ], ipa: "/ðə wˈɛðɐɹ ɪz lˈʌvlɪ/"),
            make("wait for some care", "wait until care or attention is given",
                 "ケアを待つ・手入れを待つ",
                 useCases: ["世話や対処を待つ状況を表すとき"],
                 examples: [
                    ("The plants wait for some care.", "植物は手入れを待っている。"),
                    ("Patients wait for some care.", "患者は治療を待っている。")
                 ], ipa: "/wˈeɪt fɔː sˌʌm kˈeə/"),
            make("made in", "produced or manufactured in (place)",
                 "〜製",
                 useCases: ["製造国を表すとき"],
                 examples: [
                    ("Made in Japan.", "日本製。"),
                    ("Made in Italy.", "イタリア製。")
                 ], ipa: "/mˌeɪd ˈɪn/"),
            make("has it been", "has the time/state continued (since)",
                 "もう〜経つ？・〜だった？",
                 useCases: ["時間の経過や状態の継続を尋ねるとき"],
                 examples: [
                    ("Has it been a year already?", "もう一年経つの？"),
                    ("Has it been hard?", "大変だった？")
                 ], ipa: "/hɐz ɪt bˈiːn/"),
            make("send sb sth", "send someone something",
                 "(人)に(物)を送る",
                 useCases: ["人に物・情報を送るとき"],
                 examples: [
                    ("Send me the link.", "リンクを送って。"),
                    ("Send him a gift.", "彼にプレゼントを送る。")
                 ], ipa: "/sˈɛnd sˈʌmbɒdɪ sˈʌmθɪŋ/"),
            make("damn", "an exclamation of annoyance or emphasis",
                 "ちくしょう・すごい(強調)",
                 useCases: ["失敗時の悔しさや強い感情を表すくだけた表現"],
                 examples: [
                    ("Damn, I forgot.", "しまった、忘れてた。"),
                    ("Damn, that's good.", "うわ、これは旨い。")
                 ], ipa: "/dˈæm/")
        ]
    }

    // MARK: - 物・道具・場所 (追加 60)

    private static var thingsObjects60: [Word] {
        [
            make("marching", "walking with rhythmic, regular steps",
                 "行進している",
                 useCases: ["軍隊やバンドが規則正しく歩くことを表すとき"],
                 examples: [
                    ("A marching band.", "マーチングバンド。"),
                    ("Soldiers marching past.", "兵士たちが行進していく。")
                 ], ipa: "/mˈɑːtʃɪŋ/"),
            make("plugs", "devices for connecting to a power outlet",
                 "プラグ・差込口",
                 useCases: ["コンセントの差込部分を表すとき"],
                 examples: [
                    ("Different plugs in the UK.", "イギリスは違う形のプラグ。"),
                    ("Bring an adapter for the plugs.", "プラグ用アダプタを持って行って。")
                 ], ipa: "/plˈʌɡz/"),
            make("garden", "an area where plants and flowers are grown",
                 "庭・庭園",
                 useCases: ["家や公園にある植物を育てる場所を表すとき"],
                 examples: [
                    ("Work in the garden.", "庭で作業する。"),
                    ("A beautiful garden.", "美しい庭。")
                 ], ipa: "/ɡˈɑːdən/"),
            make("pot", "a deep round container for cooking or plants",
                 "鍋・鉢",
                 useCases: ["料理用の鍋や植木鉢を表すとき"],
                 examples: [
                    ("A pot of tea.", "ティーポット一杯のお茶。"),
                    ("A flower pot.", "植木鉢。")
                 ], ipa: "/pˈɒt/"),
            make("ant nest", "a colony built by ants",
                 "蟻の巣",
                 useCases: ["蟻の住処を表すとき"],
                 examples: [
                    ("An ant nest in the garden.", "庭にある蟻の巣。"),
                    ("Don't disturb the ant nest.", "蟻の巣を荒らさないで。")
                 ], ipa: "/ˈænt nˈɛst/"),
            make("measurement", "the size, length, or amount of something",
                 "測定・寸法",
                 useCases: ["物の大きさや長さを表すとき"],
                 examples: [
                    ("Take measurements.", "寸法を測る。"),
                    ("Exact measurement.", "正確な計測。")
                 ], ipa: "/mˈɛʒəmənt/"),
            make("thermometer", "an instrument for measuring temperature",
                 "温度計・体温計",
                 useCases: ["気温や体温を測る器具を表すとき"],
                 examples: [
                    ("Check the thermometer.", "温度計を見る。"),
                    ("A digital thermometer.", "デジタル体温計。")
                 ], ipa: "/θɜːmˈɒmɪtɐ/"),
            make("thermography", "imaging using heat patterns",
                 "サーモグラフィ",
                 useCases: ["温度差を画像化する技術を表すとき"],
                 examples: [
                    ("Thermography reveals heat loss.", "サーモグラフィで熱漏れが分かる。"),
                    ("A thermography scan.", "サーモグラフィ検査。")
                 ], ipa: "/θɜːmˈɒɡɹəfɪ/"),
            make("a pane of", "a flat sheet of (esp. glass)",
                 "一枚の(板状の)〜",
                 useCases: ["ガラス板など平らな一枚を表すとき"],
                 examples: [
                    ("A pane of glass.", "一枚のガラス。"),
                    ("Replace a pane of glass.", "ガラス一枚を取り替える。")
                 ], ipa: "/ɐ pˈeɪn ɒv/"),
            make("scent", "a pleasant smell; an animal's odor trail",
                 "香り・匂い",
                 useCases: ["香水や花、痕跡の匂いを表すとき"],
                 examples: [
                    ("A sweet scent.", "甘い香り。"),
                    ("The scent of roses.", "バラの香り。")
                 ], ipa: "/sˈɛnt/"),
            make("timeline", "a sequence of events arranged in time order",
                 "時系列・スケジュール",
                 useCases: ["時間の流れに沿った計画や履歴を表すとき"],
                 examples: [
                    ("Project timeline.", "プロジェクトの工程表。"),
                    ("A clear timeline.", "明確なスケジュール。")
                 ], ipa: "/tˈaɪmlaɪn/"),
            make("wireless", "without using wires; using radio signals",
                 "無線の・ワイヤレスの",
                 useCases: ["コード不要な機器や通信を表すとき"],
                 examples: [
                    ("Wireless headphones.", "ワイヤレスヘッドホン。"),
                    ("Wireless internet.", "無線インターネット。")
                 ], ipa: "/wˈaɪələs/"),
            make("exchange rate", "the value of one currency relative to another",
                 "為替レート",
                 useCases: ["通貨同士の交換比率を表すとき"],
                 examples: [
                    ("Check the exchange rate.", "為替レートを確認する。"),
                    ("A favorable exchange rate.", "有利な為替レート。")
                 ], ipa: "/ɪkstʃˈeɪndʒ ɹˈeɪt/"),
            make("guy", "a man (informal); a person (in plural)",
                 "男・(複数で)みんな",
                 useCases: ["男性を指すくだけた言い方、複数なら男女問わず"],
                 examples: [
                    ("That guy over there.", "あそこの男の人。"),
                    ("Hey guys!", "やあ、みんな!")
                 ], ipa: "/ɡˈaɪ/")
        ]
    }

    // MARK: - 動詞・行動 (追加 60)

    private static var verbsMix60: [Word] {
        [
            make("summon sth", "call something forth or order to appear",
                 "〜を呼び出す・召喚する",
                 useCases: ["気力や人を呼び起こすとき"],
                 examples: [
                    ("Summon the courage.", "勇気を奮い起こす。"),
                    ("Summon a witness.", "証人を召喚する。")
                 ], ipa: "/sˈʌmən sˈʌmθɪŋ/"),
            make("attribute to", "consider as caused or made by",
                 "〜のせいにする・〜に帰する",
                 useCases: ["原因や作者を特定するとき"],
                 examples: [
                    ("Attribute success to luck.", "成功を運のおかげにする。"),
                    ("Attributed to Shakespeare.", "シェイクスピア作とされる。")
                 ], ipa: "/ˈætɹɪbjˌuːt tuː/"),
            make("entertain sb", "amuse or host someone",
                 "(人)を楽しませる・もてなす",
                 useCases: ["客を楽しませたりもてなしたりするとき"],
                 examples: [
                    ("Entertain the guests.", "ゲストをもてなす。"),
                    ("She entertained the kids.", "彼女は子どもたちを楽しませた。")
                 ], ipa: "/ˌɛntətˈeɪn sˈʌmbɒdɪ/"),
            make("behave oneself", "act properly and politely",
                 "行儀よくする",
                 useCases: ["子どもや人に礼儀正しく振る舞うよう促すとき"],
                 examples: [
                    ("Behave yourself!", "行儀よくしなさい!"),
                    ("Try to behave yourself.", "ちゃんとしてね。")
                 ], ipa: "/bɪhˈeɪv wɒnsˈɛlf/"),
            make("install sth", "set up equipment or software for use",
                 "〜をインストールする・取り付ける",
                 useCases: ["機器やソフトを設置するとき"],
                 examples: [
                    ("Install the app.", "アプリをインストールする。"),
                    ("Install a new lock.", "新しい鍵を取り付ける。")
                 ], ipa: "/ɪnstˈɔːl sˈʌmθɪŋ/"),
            make("underrate", "rate or value lower than deserved",
                 "過小評価する",
                 useCases: ["価値を実際より低く見るとき"],
                 examples: [
                    ("Don't underrate her skills.", "彼女の力を侮るな。"),
                    ("An underrated movie.", "過小評価されている映画。")
                 ], ipa: "/ˌʌndəɹˈeɪt/"),
            make("upscale", "improve quality; aimed at wealthier customers",
                 "高級な・グレードを上げる",
                 useCases: ["高級志向のサービスや向上させる行為を表すとき"],
                 examples: [
                    ("An upscale restaurant.", "高級レストラン。"),
                    ("Upscale the brand.", "ブランドを格上げする。")
                 ], ipa: "/ˈʌpskeɪl/")
        ]
    }

    // MARK: - 形容詞・その他 (追加 60)

    private static var adjectivesMix60: [Word] {
        [
            make("malice", "intent to do evil or harm",
                 "悪意",
                 useCases: ["相手を害する意図を表すとき"],
                 examples: [
                    ("Without malice.", "悪意はなく。"),
                    ("Acts of malice.", "悪意ある行為。")
                 ], ipa: "/mˈælɪs/"),
            make("sacred", "holy; deserving of deep respect",
                 "神聖な・尊い",
                 useCases: ["宗教的に神聖、または非常に大切なものを表すとき"],
                 examples: [
                    ("A sacred place.", "神聖な場所。"),
                    ("A sacred promise.", "尊い約束。")
                 ], ipa: "/sˈeɪkɹɪd/"),
            make("simultaneous", "happening at the same time",
                 "同時の・同時発生の",
                 useCases: ["複数のことが同時に起こることを表すとき"],
                 examples: [
                    ("Simultaneous translation.", "同時通訳。"),
                    ("Simultaneous launch.", "同時発売。")
                 ], ipa: "/sˌɪməltˈeɪniəs/")
        ]
    }

    // MARK: - 健康・体調 (追加 61)

    private static var healthBody61: [Word] {
        [
            make("dementia", "a chronic disorder of mental processes",
                 "認知症",
                 useCases: ["記憶や判断の障害を表すとき"],
                 examples: [
                    ("Early signs of dementia.", "認知症の初期症状。"),
                    ("Living with dementia.", "認知症と共に生きる。")
                 ], ipa: "/dɪmˈɛnʃɐ/"),
            make("upset stomach", "discomfort or nausea in the stomach",
                 "胃の不調",
                 useCases: ["お腹の調子が悪いことを表すとき"],
                 examples: [
                    ("I have an upset stomach.", "お腹の調子が悪い。"),
                    ("Upset stomach from spicy food.", "辛い物で胃が荒れた。")
                 ], ipa: "/ʌpsˈɛt stˈʌmək/"),
            make("upset", "unhappy or annoyed; to disturb",
                 "動揺した・〜を動揺させる",
                 useCases: ["気分が悪い、または人を動揺させるとき"],
                 examples: [
                    ("Don't get upset.", "怒らないで。"),
                    ("It upset her.", "それで彼女は動揺した。")
                 ], ipa: "/ʌpsˈɛt/"),
            make("medicine", "a substance taken to treat illness",
                 "薬・医学",
                 useCases: ["薬や医療全般を表すとき"],
                 examples: [
                    ("Take your medicine.", "薬を飲んで。"),
                    ("Study medicine.", "医学を学ぶ。")
                 ], ipa: "/mˈɛdsən/"),
            make("diarrhea", "the condition of having frequent loose stools",
                 "下痢",
                 useCases: ["お腹を下している状態を表すとき"],
                 examples: [
                    ("Suffer from diarrhea.", "下痢に苦しむ。"),
                    ("Diarrhea from bad food.", "悪い食べ物で下痢になった。")
                 ], ipa: "/dˌaɪəɹˈiə/"),
            make("feel a bit off", "feel slightly unwell or strange",
                 "体調がいまいち・調子が変だ",
                 useCases: ["はっきりしないけど不調なときに使う"],
                 examples: [
                    ("I feel a bit off today.", "今日は少し調子が悪い。"),
                    ("Feel a bit off after lunch.", "昼食後どうも調子が悪い。")
                 ], ipa: "/fˈiːl ɐ bˈɪt ˈɒf/"),
            make("leg day", "a workout session focused on the legs",
                 "脚の日(脚のトレーニング日)",
                 useCases: ["ジムで脚を鍛える日を表すとき"],
                 examples: [
                    ("Never skip leg day.", "脚の日は飛ばすな。"),
                    ("Today is leg day.", "今日は脚の日だ。")
                 ], ipa: "/lˈɛɡ dˈeɪ/")
        ]
    }

    // MARK: - ビジネス・概念 (追加 61)

    private static var businessConcepts61: [Word] {
        [
            make("agent", "a person who acts on behalf of another",
                 "代理人・エージェント",
                 useCases: ["代理で行動する人や仲介役を表すとき"],
                 examples: [
                    ("A real estate agent.", "不動産業者。"),
                    ("A talent agent.", "タレントエージェント。")
                 ], ipa: "/ˈeɪdʒənt/"),
            make("compliance", "the act of obeying rules or laws",
                 "コンプライアンス・法令遵守",
                 useCases: ["規則や法令の遵守を表すとき"],
                 examples: [
                    ("In compliance with the law.", "法に従って。"),
                    ("Compliance training.", "コンプライアンス研修。")
                 ], ipa: "/kəmplˈaɪəns/"),
            make("credit", "trust to pay later; recognition for an achievement",
                 "信用・クレジット・功績",
                 useCases: ["金融の信用、賞賛、または評価を表すとき"],
                 examples: [
                    ("Credit card.", "クレジットカード。"),
                    ("Give him credit.", "彼の功績を認める。")
                 ], ipa: "/kɹˈɛdɪt/"),
            make("intern", "a trainee working to gain experience",
                 "インターン・実習生",
                 useCases: ["研修目的で働く人を表すとき"],
                 examples: [
                    ("Summer intern.", "夏のインターン生。"),
                    ("Hire an intern.", "インターンを採用する。")
                 ], ipa: "/ˈɪntɜːn/"),
            make("incur", "bring upon oneself (cost or trouble)",
                 "(費用・損失などを)被る",
                 useCases: ["コストや損失、罰を自ら招くとき"],
                 examples: [
                    ("Incur extra costs.", "追加費用が発生する。"),
                    ("Incur debt.", "借金を背負う。")
                 ], ipa: "/ɪŋkˈɜː/"),
            make("excess", "more than necessary or allowed",
                 "過剰・超過",
                 useCases: ["必要以上にある状態や量を表すとき"],
                 examples: [
                    ("Excess baggage.", "超過手荷物。"),
                    ("In excess of the limit.", "上限を超えて。")
                 ], ipa: "/ɪksˈɛs/"),
            make("demand", "request firmly; a desire for a product",
                 "要求する・需要",
                 useCases: ["強く求めるとき、また市場の需要を表すとき"],
                 examples: [
                    ("Demand an apology.", "謝罪を求める。"),
                    ("High demand.", "高い需要。")
                 ], ipa: "/dɪmˈɑːnd/"),
            make("breaking news", "newly received and important news",
                 "速報",
                 useCases: ["緊急の報道を表すとき"],
                 examples: [
                    ("Breaking news just in.", "ただいま入った速報。"),
                    ("Watch the breaking news.", "速報を見る。")
                 ], ipa: "/bɹˈeɪkɪŋ njˈuːz/"),
            make("undoubtedly", "without any doubt; certainly",
                 "疑いなく・間違いなく",
                 useCases: ["強い確信を表すとき"],
                 examples: [
                    ("Undoubtedly the best.", "間違いなく最高だ。"),
                    ("She is undoubtedly talented.", "彼女は間違いなく才能がある。")
                 ], ipa: "/ʌndˈaʊtɪdlɪ/"),
            make("upper class", "the highest social class",
                 "上流階級",
                 useCases: ["社会的に裕福で地位の高い層を表すとき"],
                 examples: [
                    ("The upper class.", "上流階級。"),
                    ("An upper class family.", "上流階級の家族。")
                 ], ipa: "/ˌʌpɐ klˈɑːs/"),
            make("thrift", "careful management of money",
                 "倹約・古着屋(thrift store)",
                 useCases: ["節約や中古品店を表すとき"],
                 examples: [
                    ("Practice thrift.", "倹約を心がける。"),
                    ("A thrift shop.", "古着屋・リサイクル店。")
                 ], ipa: "/θɹˈɪft/")
        ]
    }

    // MARK: - 動詞・行動 (追加 61)

    private static var verbsActions61: [Word] {
        [
            make("place sth", "put something in a particular position",
                 "〜を置く・配置する",
                 useCases: ["物を特定の場所に置くとき"],
                 examples: [
                    ("Place it on the table.", "テーブルに置いて。"),
                    ("Place an order.", "注文する。")
                 ], ipa: "/plˈeɪs sˈʌmθɪŋ/"),
            make("take place of", "replace; serve as a substitute for",
                 "〜の代わりを務める",
                 useCases: ["別のものや人の代わりに役目を果たすとき"],
                 examples: [
                    ("AI takes place of manual work.", "AIが手作業の代わりを務める。"),
                    ("Nothing can take place of family.", "家族の代わりになるものはない。")
                 ], ipa: "/tˈeɪk plˈeɪs ɒv/"),
            make("take place", "happen; occur",
                 "起こる・行われる",
                 useCases: ["イベントや事件が発生するとき"],
                 examples: [
                    ("The event takes place tomorrow.", "そのイベントは明日行われる。"),
                    ("When did it take place?", "それはいつ起きたの？")
                 ], ipa: "/tˈeɪk plˈeɪs/"),
            make("sprinkle sth into", "scatter small amounts into",
                 "〜に〜をふりかける",
                 useCases: ["調味料などを少しずつ加えるとき"],
                 examples: [
                    ("Sprinkle salt into the dish.", "料理に塩をふりかける。"),
                    ("Sprinkle sugar into coffee.", "コーヒーに砂糖をふりかける。")
                 ], ipa: "/spɹˈɪŋkəl sˈʌmθɪŋ ˌɪntʊ/"),
            make("lower sth", "reduce in level or amount",
                 "〜を下げる・低くする",
                 useCases: ["価格や音量、視線を下げるとき"],
                 examples: [
                    ("Lower your voice.", "声を下げて。"),
                    ("Lower the price.", "値段を下げる。")
                 ], ipa: "/lˈəʊɐ sˈʌmθɪŋ/"),
            make("originate", "have a specified beginning",
                 "起源を持つ・〜から始まる",
                 useCases: ["物事の出所や起源を表すとき"],
                 examples: [
                    ("Originate in Japan.", "日本発祥。"),
                    ("The custom originated long ago.", "その風習は昔に始まった。")
                 ], ipa: "/əɹˈɪdʒɪnˌeɪt/"),
            make("result in", "have a specified outcome",
                 "結果として〜になる",
                 useCases: ["原因と結果を結びつけて述べるとき"],
                 examples: [
                    ("It resulted in success.", "結果として成功した。"),
                    ("Lack of sleep results in fatigue.", "睡眠不足は疲労を招く。")
                 ], ipa: "/ɹɪzˈʌlt ˈɪn/"),
            make("host sth", "hold or organize an event",
                 "〜を主催する・開催する",
                 useCases: ["イベントやパーティを主催するとき"],
                 examples: [
                    ("Host a party.", "パーティを主催する。"),
                    ("Host the conference.", "会議を主催する。")
                 ], ipa: "/hˈəʊst sˈʌmθɪŋ/"),
            make("drill", "a tool for boring holes; repetitive practice",
                 "ドリル・反復練習",
                 useCases: ["穴あけ工具や繰り返し練習を表すとき"],
                 examples: [
                    ("Use a drill.", "ドリルを使う。"),
                    ("Fire drill.", "避難訓練。")
                 ], ipa: "/dɹˈɪl/"),
            make("come and go", "appear briefly and then leave",
                 "現れては消える・出入りする",
                 useCases: ["人や物が一時的にだけ現れる様子を表すとき"],
                 examples: [
                    ("The pain comes and goes.", "痛みが出たり消えたりする。"),
                    ("Trends come and go.", "流行は移り変わる。")
                 ], ipa: "/kˈʌm ænd ɡˈəʊ/"),
            make("rise up", "stand up; rebel; ascend",
                 "立ち上がる・蜂起する",
                 useCases: ["反乱や奮起、上昇する動きを表すとき"],
                 examples: [
                    ("Rise up against injustice.", "不正に立ち上がる。"),
                    ("Rise up to the challenge.", "挑戦に立ち向かう。")
                 ], ipa: "/ɹˈaɪz ˈʌp/"),
            make("roll down", "move down by turning; let down a window",
                 "転がり落ちる・(窓を)下ろす",
                 useCases: ["転がり落ちる、窓を下ろすときなど"],
                 examples: [
                    ("Tears rolled down her face.", "涙が頬を伝った。"),
                    ("Roll down the window.", "窓を下ろして。")
                 ], ipa: "/ɹˈəʊl dˈaʊn/"),
            make("come to an end", "finish; reach a conclusion",
                 "終わる・終焉を迎える",
                 useCases: ["長く続いていたものが終わることを表すとき"],
                 examples: [
                    ("The era came to an end.", "その時代は終わった。"),
                    ("All things come to an end.", "全ての物事には終わりがある。")
                 ], ipa: "/kˈʌm tʊ ɐn ˈɛnd/")
        ]
    }

    // MARK: - 名詞・物事 (追加 61)

    private static var nounsObjects61: [Word] {
        [
            make("cardboard", "thick stiff paper used for boxes",
                 "段ボール",
                 useCases: ["箱や梱包材として使われる厚紙を表すとき"],
                 examples: [
                    ("A cardboard box.", "段ボール箱。"),
                    ("Recycled cardboard.", "再生段ボール。")
                 ], ipa: "/kˈɑːdbɔːd/"),
            make("hardware", "tools, machinery, or computer components",
                 "ハードウェア・金物",
                 useCases: ["機械や物理的な機器、工具を表すとき"],
                 examples: [
                    ("Computer hardware.", "コンピューターのハードウェア。"),
                    ("Hardware store.", "金物店・ホームセンター。")
                 ], ipa: "/hˈɑːdweə/"),
            make("overnight", "for the duration of one night; very rapidly",
                 "一晩・一夜にして",
                 useCases: ["夜通し、または急速な変化を表すとき"],
                 examples: [
                    ("Stay overnight.", "一泊する。"),
                    ("Famous overnight.", "一夜で有名になった。")
                 ], ipa: "/ˌəʊvənˈaɪt/"),
            make("tulip", "a brightly-colored spring flower",
                 "チューリップ",
                 useCases: ["春に咲く花を表すとき"],
                 examples: [
                    ("Red tulips.", "赤いチューリップ。"),
                    ("A field of tulips.", "チューリップ畑。")
                 ], ipa: "/tjˈuːlɪp/"),
            make("syrup", "a thick sweet liquid",
                 "シロップ",
                 useCases: ["甘い液体の調味料を表すとき"],
                 examples: [
                    ("Maple syrup.", "メープルシロップ。"),
                    ("Cough syrup.", "咳止めシロップ。")
                 ], ipa: "/sˈɪɹʌp/"),
            make("rim", "the outer edge of a circular object",
                 "縁・リム",
                 useCases: ["カップや車輪のふちを表すとき"],
                 examples: [
                    ("The rim of the cup.", "カップの縁。"),
                    ("Wheel rim.", "ホイールリム。")
                 ], ipa: "/ɹˈɪm/"),
            make("photosynthesis", "the process by which plants make food using light",
                 "光合成",
                 useCases: ["植物が光から栄養を作る働きを表すとき"],
                 examples: [
                    ("Photosynthesis requires sunlight.", "光合成には日光が必要だ。"),
                    ("Study photosynthesis.", "光合成を学ぶ。")
                 ], ipa: "/fˌəʊtəʊsˈɪnθəsˌɪs/"),
            make("pride", "a feeling of satisfaction or self-respect",
                 "誇り・プライド",
                 useCases: ["自尊心や誇りに思う気持ちを表すとき"],
                 examples: [
                    ("Take pride in your work.", "仕事に誇りを持つ。"),
                    ("Swallow your pride.", "プライドを捨てる。")
                 ], ipa: "/pɹˈaɪd/"),
            make("fight", "a struggle or physical battle",
                 "戦い・けんか",
                 useCases: ["戦いや対立、議論などを表すとき"],
                 examples: [
                    ("Pick a fight.", "けんかをふっかける。"),
                    ("Fight for your rights.", "権利のために戦う。")
                 ], ipa: "/fˈaɪt/"),
            make("wooden", "made of wood",
                 "木製の",
                 useCases: ["木でできた物を表すとき"],
                 examples: [
                    ("A wooden chair.", "木製の椅子。"),
                    ("Wooden floors.", "木の床。")
                 ], ipa: "/wˈʊdən/"),
            make("belt", "a strap worn around the waist",
                 "ベルト・帯",
                 useCases: ["ズボンを留めるベルトや工業用ベルトを表すとき"],
                 examples: [
                    ("Tighten your belt.", "ベルトを締めて。"),
                    ("A black belt.", "黒帯。")
                 ], ipa: "/bˈɛlt/"),
            make("quantum", "an extremely small unit; relating to quantum physics",
                 "量子・大きな飛躍",
                 useCases: ["物理学の量子や、大きな進歩を比喩で表すとき"],
                 examples: [
                    ("Quantum physics.", "量子物理学。"),
                    ("A quantum leap.", "飛躍的な進歩。")
                 ], ipa: "/kwˈɒntəm/"),
            make("hill", "a raised area of land smaller than a mountain",
                 "丘",
                 useCases: ["山ほど高くない盛り上がった地形を表すとき"],
                 examples: [
                    ("Climb the hill.", "丘を登る。"),
                    ("A green hill.", "緑の丘。")
                 ], ipa: "/hˈɪl/"),
            make("stain", "a mark or discoloration that is hard to remove",
                 "シミ・汚れ",
                 useCases: ["布や物にこびりついた汚れを表すとき"],
                 examples: [
                    ("Remove the stain.", "シミを取る。"),
                    ("Coffee stain.", "コーヒーのシミ。")
                 ], ipa: "/stˈeɪn/"),
            make("poop", "feces (informal); to defecate",
                 "うんち・うんちをする",
                 useCases: ["排泄を表すくだけた言い方"],
                 examples: [
                    ("Dog poop.", "犬のうんち。"),
                    ("The baby pooped.", "赤ちゃんがうんちをした。")
                 ], ipa: "/pˈuːp/"),
            make("toilet seat", "the seat of a toilet",
                 "便座",
                 useCases: ["トイレの座る部分を表すとき"],
                 examples: [
                    ("Lower the toilet seat.", "便座を下ろして。"),
                    ("Clean the toilet seat.", "便座を掃除する。")
                 ], ipa: "/tˈɔɪlɪt sˈiːt/"),
            make("main character", "the central figure in a story",
                 "主人公",
                 useCases: ["物語の中心人物を表すとき"],
                 examples: [
                    ("The main character of the novel.", "小説の主人公。"),
                    ("Live as the main character.", "主人公として生きる。")
                 ], ipa: "/mˈeɪn kˈæɹɪktɐ/"),
            make("surge of", "a sudden powerful increase of",
                 "〜の急増・〜の波",
                 useCases: ["感情や数値、流れが急に高まるとき"],
                 examples: [
                    ("A surge of energy.", "エネルギーの急上昇。"),
                    ("A surge of emotion.", "感情の高ぶり。")
                 ], ipa: "/sˈɜːdʒ ɒv/")
        ]
    }

    // MARK: - 表現・フレーズ (追加 61)

    private static var expressionsPhrases61: [Word] {
        [
            make("right shape", "the correct or ideal form",
                 "正しい形・あるべき形",
                 useCases: ["形やコンディションが整っていることを表すとき"],
                 examples: [
                    ("In the right shape.", "正しい形で。"),
                    ("Get into the right shape.", "あるべき状態に整える。")
                 ], ipa: "/ɹˈaɪt ʃˈeɪp/"),
            make("coherent", "logical and consistent",
                 "首尾一貫した・筋の通った",
                 useCases: ["話や論理がつながっていることを表すとき"],
                 examples: [
                    ("A coherent argument.", "首尾一貫した主張。"),
                    ("Be more coherent.", "もっと筋が通った話をして。")
                 ], ipa: "/kəʊhˈiəɹənt/"),
            make("one of the saddest moment", "among the saddest moments",
                 "最も悲しい瞬間の一つ",
                 useCases: ["強い悲しみを伴う出来事を強調するとき"],
                 examples: [
                    ("One of the saddest moments of my life.", "私の人生で最も悲しい瞬間の一つ。"),
                    ("One of the saddest moments I've seen.", "見た中で最も悲しい場面の一つ。")
                 ], ipa: "/wˈɒn ɒvðə sˈædɪst mˈəʊmənt/"),
            make("bored", "feeling weary because nothing interesting is happening",
                 "退屈な",
                 useCases: ["何もすることがなく飽きている状態を表すとき"],
                 examples: [
                    ("I'm bored.", "退屈だ。"),
                    ("Bored to death.", "死ぬほど退屈。")
                 ], ipa: "/bˈɔːd/"),
            make("mission accomplished", "the task has been successfully completed",
                 "任務完了",
                 useCases: ["大事な作業を終えたときに使う口語表現"],
                 examples: [
                    ("Mission accomplished!", "任務完了!"),
                    ("Mission accomplished — let's celebrate.", "やり遂げた、お祝いしよう。")
                 ], ipa: "/mˈɪʃən ɐkˈɒmplɪʃt/"),
            make("it should sound like", "the expected sound should be",
                 "〜のような音であるべき",
                 useCases: ["音や発音の正解イメージを示すとき"],
                 examples: [
                    ("It should sound like this.", "こんな感じの音であるべき。"),
                    ("It should sound like a native.", "ネイティブのように聞こえるべきだ。")
                 ], ipa: "/ɪt ʃˌʊd sˈaʊnd lˈaɪk/"),
            make("nothing feels", "no feeling matches the description",
                 "何も〜と感じない・〜なものは何もない",
                 useCases: ["他に比べられないことを強調するとき"],
                 examples: [
                    ("Nothing feels better than this.", "これほど良い気分は他にない。"),
                    ("Nothing feels right today.", "今日は何もしっくりこない。")
                 ], ipa: "/nˈʌθɪŋ fˈiːlz/"),
            make("randomly", "in a way that lacks a pattern or order",
                 "ランダムに・無作為に",
                 useCases: ["順序を決めずに選ぶことを表すとき"],
                 examples: [
                    ("Chosen randomly.", "無作為に選ばれた。"),
                    ("Randomly bumped into him.", "偶然彼に会った。")
                 ], ipa: "/ɹˈændəmlɪ/"),
            make("it grosses me out", "it disgusts me",
                 "気持ち悪い・うえっとなる",
                 useCases: ["強い嫌悪感を口語で表すとき"],
                 examples: [
                    ("It grosses me out.", "うわっ気持ち悪い。"),
                    ("Eating bugs grosses me out.", "虫を食べるのは気持ち悪い。")
                 ], ipa: "/ɪt ɡɹˈəʊsɪz mˌiː ˈaʊt/"),
            make("in the name of", "for the sake of; under the authority of",
                 "〜の名のもとに・〜のために",
                 useCases: ["正当性や大義名分を強調するとき"],
                 examples: [
                    ("In the name of love.", "愛の名のもとに。"),
                    ("In the name of justice.", "正義の名のもとに。")
                 ], ipa: "/ɪnðə nˈeɪm ɒv/")
        ]
    }

    // MARK: - 日常・生活 (追加 62)

    private static var dailyLife62: [Word] {
        [
            make("dispose of", "get rid of; throw away",
                 "〜を処分する・捨てる",
                 useCases: ["不要なものを廃棄するとき"],
                 examples: [
                    ("Dispose of the trash.", "ゴミを処分する。"),
                    ("Dispose of old papers.", "古い書類を処分する。")
                 ], ipa: "/dɪspˈəʊz ɒv/"),
            make("leftover", "food remaining from a meal",
                 "残り物・食べ残し",
                 useCases: ["昨夜の食事の残りなどを表すとき"],
                 examples: [
                    ("Leftover pizza.", "残り物のピザ。"),
                    ("Eat the leftovers.", "残り物を食べる。")
                 ], ipa: "/lˈɛftəʊvɐ/"),
            make("kettle", "a container for boiling water",
                 "やかん・電気ケトル",
                 useCases: ["お湯を沸かす器具を表すとき"],
                 examples: [
                    ("Put the kettle on.", "お湯を沸かして。"),
                    ("Electric kettle.", "電気ケトル。")
                 ], ipa: "/kˈɛtəl/"),
            make("pet", "an animal kept for companionship",
                 "ペット",
                 useCases: ["家族として飼う動物を表すとき"],
                 examples: [
                    ("Have a pet dog.", "犬を飼っている。"),
                    ("Pet shop.", "ペットショップ。")
                 ], ipa: "/pˈɛt/"),
            make("delicious", "having a very pleasant taste",
                 "とても美味しい",
                 useCases: ["味が素晴らしいことを表すとき"],
                 examples: [
                    ("This is delicious!", "これは美味しい!"),
                    ("A delicious meal.", "美味しい食事。")
                 ], ipa: "/dɪlˈɪʃəs/"),
            make("drunk", "affected by alcohol",
                 "酔っ払った",
                 useCases: ["お酒で酔っている状態を表すとき"],
                 examples: [
                    ("Don't drive drunk.", "飲んで運転するな。"),
                    ("He was a bit drunk.", "彼はちょっと酔ってた。")
                 ], ipa: "/dɹˈʌŋk/"),
            make("lint roller", "a sticky roller used to remove lint from clothes",
                 "コロコロ(粘着クリーナー)",
                 useCases: ["服のホコリや毛を取る道具を表すとき"],
                 examples: [
                    ("Use a lint roller.", "コロコロを使う。"),
                    ("I need a lint roller.", "コロコロが必要。")
                 ], ipa: "/lˈɪnt ɹˈəʊlɐ/"),
            make("all year", "throughout the entire year",
                 "一年中",
                 useCases: ["年間を通じて続くことを表すとき"],
                 examples: [
                    ("Open all year.", "一年中営業。"),
                    ("Warm all year.", "一年中暖かい。")
                 ], ipa: "/ˈɔːl jˈiə/"),
            make("audio silent", "with audio muted",
                 "音声をオフにして",
                 useCases: ["音声がない、または無音設定を表すとき"],
                 examples: [
                    ("Keep the audio silent.", "音声はオフのままに。"),
                    ("Watch with audio silent.", "音声を消して見る。")
                 ], ipa: "/ˈɔːdɪˌəʊ sˈaɪlənt/"),
            make("tons of", "a large amount of",
                 "大量の・たくさんの",
                 useCases: ["多いことを口語で強調するとき"],
                 examples: [
                    ("Tons of work.", "仕事が山ほどある。"),
                    ("Tons of fun.", "めちゃくちゃ楽しい。")
                 ], ipa: "/tˈʌnz ɒv/"),
            make("pass away", "die (a polite expression)",
                 "亡くなる(婉曲表現)",
                 useCases: ["人の死を丁寧に伝えるとき"],
                 examples: [
                    ("She passed away peacefully.", "彼女は安らかに亡くなった。"),
                    ("He passed away last year.", "彼は昨年亡くなった。")
                 ], ipa: "/pˈɑːs ɐwˈeɪ/"),
            make("come closer", "approach nearer",
                 "もっと近づく",
                 useCases: ["人や物に近づくよう促すとき"],
                 examples: [
                    ("Come closer, please.", "もっと近づいて。"),
                    ("Come closer to the screen.", "画面にもっと寄って。")
                 ], ipa: "/kˈʌm klˈəʊsɐ/"),
            make("opening soon", "about to open in the near future",
                 "近日開店・近日公開",
                 useCases: ["店や映画などがもうすぐ始まることを表すとき"],
                 examples: [
                    ("Opening soon!", "近日オープン!"),
                    ("New store opening soon.", "新店舗が近日開店。")
                 ], ipa: "/ˈəʊpənɪŋ sˈuːn/"),
            make("closing day", "the final day of business or an event",
                 "閉店日・最終日",
                 useCases: ["閉店日や最終営業日を表すとき"],
                 examples: [
                    ("Today is closing day.", "今日が最終日。"),
                    ("The store's closing day is Friday.", "閉店日は金曜日。")
                 ], ipa: "/klˈəʊzɪŋ dˈeɪ/")
        ]
    }

    // MARK: - 動詞・行動 (追加 62)

    private static var verbsActions62: [Word] {
        [
            make("cascade", "fall or flow in a series of stages",
                 "段々に流れ落ちる・連鎖する",
                 useCases: ["滝のように連続して流れる様を表すとき"],
                 examples: [
                    ("Water cascades down the rocks.", "水が岩を伝って流れ落ちる。"),
                    ("Errors cascade through the system.", "エラーがシステム全体に連鎖する。")
                 ], ipa: "/kɐskˈeɪd/"),
            make("ascend", "go up; rise",
                 "上昇する・登る",
                 useCases: ["階段や地位を上がるとき"],
                 examples: [
                    ("Ascend the throne.", "王位に就く。"),
                    ("The plane ascended.", "飛行機は上昇した。")
                 ], ipa: "/ɐsˈɛnd/"),
            make("force yourself to do", "make yourself do despite reluctance",
                 "無理に〜する",
                 useCases: ["気が進まないことを自分に強いるとき"],
                 examples: [
                    ("Force yourself to exercise.", "無理してでも運動する。"),
                    ("Don't force yourself to eat.", "無理して食べないで。")
                 ], ipa: "/fˈɔːs jɔːsˈɛlf tə dˈuː/"),
            make("startle sb", "cause someone sudden surprise",
                 "(人)をびっくりさせる",
                 useCases: ["突然驚かせるとき"],
                 examples: [
                    ("You startled me.", "びっくりした。"),
                    ("Don't startle the cat.", "猫を驚かせないで。")
                 ], ipa: "/stˈɑːtəl sˈʌmbɒdɪ/"),
            make("vow", "make a solemn promise",
                 "誓う・誓い",
                 useCases: ["強い約束をするとき"],
                 examples: [
                    ("Vow to do better.", "もっと頑張ると誓う。"),
                    ("Marriage vows.", "結婚の誓い。")
                 ], ipa: "/vˈaʊ/"),
            make("count on", "rely on; trust",
                 "〜を当てにする・頼りにする",
                 useCases: ["人や物に頼ることを表すとき"],
                 examples: [
                    ("You can count on me.", "私に任せて。"),
                    ("Count on the team.", "チームを頼りにする。")
                 ], ipa: "/kˈaʊnt ˈɒn/"),
            make("shift sth", "move something from one position to another",
                 "〜を移す・転換する",
                 useCases: ["位置や焦点を変えるとき"],
                 examples: [
                    ("Shift the focus.", "焦点を移す。"),
                    ("Shift the boxes.", "箱を動かす。")
                 ], ipa: "/ʃˈɪft sˈʌmθɪŋ/"),
            make("shift the issue", "redirect the topic of discussion",
                 "問題をずらす・論点をすり替える",
                 useCases: ["話題や責任を別のところへずらすとき"],
                 examples: [
                    ("Don't shift the issue.", "論点をすり替えないで。"),
                    ("He shifted the issue.", "彼は論点をずらした。")
                 ], ipa: "/ʃˈɪft ðɪ ˈɪʃuː/"),
            make("lie down", "rest in a horizontal position",
                 "横になる",
                 useCases: ["身体を横たえて休むとき"],
                 examples: [
                    ("Lie down for a nap.", "ちょっと横になる。"),
                    ("I need to lie down.", "横になりたい。")
                 ], ipa: "/lˈaɪ dˈaʊn/"),
            make("sth lie in", "something rests or is rooted in",
                 "〜は〜にある",
                 useCases: ["原因や本質がどこにあるかを表すとき"],
                 examples: [
                    ("The truth lies in the details.", "真実は細部にある。"),
                    ("The problem lies in the design.", "問題は設計にある。")
                 ], ipa: "/sˈʌmθɪŋ lˈaɪ ˈɪn/"),
            make("spark my interest", "ignite my curiosity",
                 "私の興味をかき立てる",
                 useCases: ["何かに関心を持ち始めるとき"],
                 examples: [
                    ("That sparked my interest.", "あれで興味が湧いた。"),
                    ("Sparked my interest in art.", "アートへの関心に火がついた。")
                 ], ipa: "/spˈɑːk maɪ ˈɪntɹɛst/"),
            make("sth spark", "something triggers or ignites",
                 "〜が引き起こす・きっかけを生む",
                 useCases: ["小さなきっかけが大きな反応を呼ぶとき"],
                 examples: [
                    ("The comment sparked debate.", "その発言が議論を呼んだ。"),
                    ("A spark of hope.", "希望の火種。")
                 ], ipa: "/sˈʌmθɪŋ spˈɑːk/"),
            make("blend in", "merge with surroundings",
                 "周囲に溶け込む・混ざる",
                 useCases: ["目立たず環境に溶け込むとき"],
                 examples: [
                    ("Blend in with the crowd.", "人混みに紛れる。"),
                    ("Try to blend in.", "溶け込もうとする。")
                 ], ipa: "/blˈɛnd ˈɪn/"),
            make("reflect on", "think carefully about something past",
                 "〜について深く考える",
                 useCases: ["過去や経験を振り返るとき"],
                 examples: [
                    ("Reflect on your choices.", "選択を振り返る。"),
                    ("Time to reflect on the year.", "一年を振り返る時。")
                 ], ipa: "/ɹɪflˈɛkt ˈɒn/"),
            make("hatch", "come out of an egg; devise a plan",
                 "孵化する・(計画を)企てる",
                 useCases: ["卵から生まれる、または計画を練るとき"],
                 examples: [
                    ("The eggs hatched.", "卵が孵った。"),
                    ("Hatch a plan.", "計画を企てる。")
                 ], ipa: "/hˈætʃ/"),
            make("join together", "unite or combine",
                 "結合する・一緒になる",
                 useCases: ["人や物が一つになるとき"],
                 examples: [
                    ("Join together as one.", "一つになる。"),
                    ("Join the pieces together.", "部品をくっつける。")
                 ], ipa: "/dʒˈɔɪn təɡˈɛðɐ/"),
            make("station", "place oneself or someone at a position",
                 "配置する・(動詞)位置につける",
                 useCases: ["人や物をある場所に配置するとき"],
                 examples: [
                    ("Station guards at the door.", "ドアに警備員を配置する。"),
                    ("He was stationed in Germany.", "彼はドイツに配属された。")
                 ], ipa: "/stˈeɪʃən/"),
            make("phase in", "introduce gradually",
                 "段階的に導入する",
                 useCases: ["新制度や機能をゆっくり取り入れるとき"],
                 examples: [
                    ("Phase in the new system.", "新システムを段階導入する。"),
                    ("Phase in the changes.", "変更を順次反映する。")
                 ], ipa: "/fˈeɪz ˈɪn/"),
            make("make a change", "alter something",
                 "変化を起こす・変える",
                 useCases: ["何かを意図的に変えるとき"],
                 examples: [
                    ("Make a change in your life.", "人生に変化を起こす。"),
                    ("Time to make a change.", "変える時だ。")
                 ], ipa: "/mˌeɪk ɐ tʃˈeɪndʒ/"),
            make("predict sth bad", "foresee a negative outcome",
                 "悪いことを予測する",
                 useCases: ["望ましくない結果を予想するとき"],
                 examples: [
                    ("Don't predict sth bad.", "悪いことを予測しないで。"),
                    ("Experts predict sth bad next year.", "来年は悪化すると専門家は予測する。")
                 ], ipa: "/pɹɪdˈɪkt sˈʌmθɪŋ bˈæd/"),
            make("save sb sth", "spare someone trouble or expense",
                 "(人)に〜を省かせる・助ける",
                 useCases: ["相手の手間や費用を省いてあげるとき"],
                 examples: [
                    ("Save me a seat.", "席をとっておいて。"),
                    ("That'll save you time.", "それで時間が節約できる。")
                 ], ipa: "/sˈeɪv sˈʌmbɒdɪ sˈʌmθɪŋ/"),
            make("go in ahead", "go in before others",
                 "先に入る",
                 useCases: ["他より先に中へ入るとき"],
                 examples: [
                    ("You go in ahead.", "先に入ってて。"),
                    ("Go in ahead of me.", "私より先に入って。")
                 ], ipa: "/ɡˌəʊ ɪn ɐhˈɛd/")
        ]
    }

    // MARK: - 名詞・物事 (追加 62)

    private static var nounsObjects62: [Word] {
        [
            make("asking price", "the price requested by a seller",
                 "売り出し価格",
                 useCases: ["売り手が提示している価格を表すとき"],
                 examples: [
                    ("What's the asking price?", "売値はいくら？"),
                    ("Above the asking price.", "売値以上で。")
                 ], ipa: "/ˈɑːskɪŋ pɹˈaɪs/"),
            make("net", "a mesh material; the remaining amount after deductions",
                 "網・正味の",
                 useCases: ["網状の物、または差し引き後の正味金額を表すとき"],
                 examples: [
                    ("A fishing net.", "漁網。"),
                    ("Net income.", "純利益。")
                 ], ipa: "/nˈɛt/"),
            make("yard", "an area outside a house; a unit of length",
                 "庭・ヤード(長さの単位)",
                 useCases: ["家の外スペースや長さの単位を表すとき"],
                 examples: [
                    ("In the back yard.", "裏庭で。"),
                    ("Three yards long.", "3ヤードの長さ。")
                 ], ipa: "/jˈɑːd/"),
            make("graveyard", "a burial ground; a cemetery",
                 "墓地",
                 useCases: ["墓のある場所を表すとき"],
                 examples: [
                    ("Visit the graveyard.", "墓地を訪れる。"),
                    ("A quiet graveyard.", "静かな墓地。")
                 ], ipa: "/ɡɹˈeɪvjɑːd/"),
            make("ecstasy", "an overwhelming feeling of joy",
                 "歓喜・恍惚",
                 useCases: ["非常に強い喜びや恍惚状態を表すとき"],
                 examples: [
                    ("Pure ecstasy.", "純粋な歓喜。"),
                    ("In ecstasy over the news.", "知らせに有頂天。")
                 ], ipa: "/ˈɛkstəsɪ/"),
            make("highlights", "the most interesting parts of something",
                 "ハイライト・見どころ",
                 useCases: ["注目すべき場面や髪のメッシュを表すとき"],
                 examples: [
                    ("Game highlights.", "試合のハイライト。"),
                    ("Hair highlights.", "ハイライトの髪色。")
                 ], ipa: "/hˈaɪlaɪts/"),
            make("upper deck", "the higher level of a vehicle or ship",
                 "上層階・上階デッキ",
                 useCases: ["二階建てバスや船の上の階を表すとき"],
                 examples: [
                    ("Sit on the upper deck.", "上のデッキに座る。"),
                    ("The upper deck has a view.", "上の階は眺めが良い。")
                 ], ipa: "/ˌʌpɐ dˈɛk/"),
            make("calf", "the back part of the lower leg; a young cow",
                 "ふくらはぎ・子牛",
                 useCases: ["脚のふくらはぎや子牛を表すとき"],
                 examples: [
                    ("Stretch your calves.", "ふくらはぎを伸ばす。"),
                    ("A baby calf.", "子牛。")
                 ], ipa: "/kˈɑːf/"),
            make("slime", "a soft, sticky substance",
                 "粘液・スライム",
                 useCases: ["ぬるぬるした物質やおもちゃのスライムを表すとき"],
                 examples: [
                    ("Make slime.", "スライムを作る。"),
                    ("Covered in slime.", "粘液まみれ。")
                 ], ipa: "/slˈaɪm/"),
            make("pipe", "a tube; a smoking device",
                 "パイプ・管",
                 useCases: ["水道管や喫煙具を表すとき"],
                 examples: [
                    ("Water pipe.", "水道管。"),
                    ("Smoke a pipe.", "パイプタバコを吸う。")
                 ], ipa: "/pˈaɪp/"),
            make("roundup", "a summary of news or events",
                 "総まとめ・要約",
                 useCases: ["ニュースや出来事をまとめて伝えるとき"],
                 examples: [
                    ("News roundup.", "ニュースまとめ。"),
                    ("A weekly roundup.", "週間まとめ。")
                 ], ipa: "/ɹˈaʊndʌp/"),
            make("notice period", "the time given before leaving a job",
                 "予告期間",
                 useCases: ["退職や契約終了前の通知期間を表すとき"],
                 examples: [
                    ("One month notice period.", "1か月の予告期間。"),
                    ("My notice period is two weeks.", "予告期間は2週間。")
                 ], ipa: "/nˈəʊtɪs pˈiəɹɪəd/"),
            make("opponent", "a person on the other side of a contest",
                 "対戦相手",
                 useCases: ["試合や議論の相手を表すとき"],
                 examples: [
                    ("A tough opponent.", "手強い相手。"),
                    ("Face your opponent.", "相手と向き合う。")
                 ], ipa: "/əpˈəʊnənt/"),
            make("hallucination", "a perception of something not actually present",
                 "幻覚",
                 useCases: ["実在しないものが見えたり聞こえたりする状態"],
                 examples: [
                    ("Have hallucinations.", "幻覚を見る。"),
                    ("Drug-induced hallucination.", "薬物による幻覚。")
                 ], ipa: "/hɐlˌuːsɪnˈeɪʃən/"),
            make("ivory coast", "the country Côte d'Ivoire in West Africa",
                 "コートジボワール",
                 useCases: ["西アフリカの国を表すとき"],
                 examples: [
                    ("Travel to Ivory Coast.", "コートジボワールに行く。"),
                    ("From Ivory Coast.", "コートジボワール出身。")
                 ], ipa: "/ˈaɪvəɹɪ kˈəʊst/"),
            make("joint", "shared; a place where two bones meet",
                 "共同の・関節",
                 useCases: ["共同で行うことや体の関節を表すとき"],
                 examples: [
                    ("Joint effort.", "共同作業。"),
                    ("Knee joint.", "膝の関節。")
                 ], ipa: "/dʒˈɔɪnt/"),
            make("cluster", "a group of similar things close together",
                 "群れ・集まり",
                 useCases: ["近くに集まったもののまとまりを表すとき"],
                 examples: [
                    ("A cluster of stars.", "星団。"),
                    ("Cluster of houses.", "家々の集まり。")
                 ], ipa: "/klˈʌstɐ/"),
            make("surplus", "an amount left over; extra",
                 "余剰・黒字",
                 useCases: ["必要分以上に残った量を表すとき"],
                 examples: [
                    ("Trade surplus.", "貿易黒字。"),
                    ("Food surplus.", "食料の余剰。")
                 ], ipa: "/sˈɜːpləs/"),
            make("sensitivity", "the quality of being easily affected or sensing",
                 "感度・繊細さ",
                 useCases: ["敏感さや受容性、機器の感度を表すとき"],
                 examples: [
                    ("Skin sensitivity.", "肌の敏感さ。"),
                    ("High sensitivity.", "高い感度。")
                 ], ipa: "/sˌɛnsɪtˈɪvɪtɪ/"),
            make("apprenticeship", "a period training under a skilled worker",
                 "見習い期間・修行",
                 useCases: ["熟練者のもとで技を学ぶ期間を表すとき"],
                 examples: [
                    ("Complete an apprenticeship.", "見習い期間を終える。"),
                    ("Apprenticeship program.", "見習い制度。")
                 ], ipa: "/ɐpɹˈɛntɪsʃˌɪp/")
        ]
    }

    // MARK: - 形容詞・状態 (追加 62)

    private static var adjectivesStates62: [Word] {
        [
            make("suit sth", "be acceptable or appropriate for",
                 "〜に合う・〜に向いている",
                 useCases: ["人や状況に適していると述べるとき"],
                 examples: [
                    ("Does this time suit you?", "この時間で大丈夫？"),
                    ("That color suits you.", "その色似合うよ。")
                 ], ipa: "/sˈuːt sˈʌmθɪŋ/"),
            make("suitable", "right or appropriate for a purpose",
                 "ふさわしい・適した",
                 useCases: ["目的に合った人や物を表すとき"],
                 examples: [
                    ("A suitable candidate.", "適任者。"),
                    ("Suitable for kids.", "子ども向け。")
                 ], ipa: "/sˈuːtəbəl/"),
            make("be opposed to", "be against; disagree with",
                 "〜に反対している",
                 useCases: ["何かに賛成しない立場を表すとき"],
                 examples: [
                    ("I'm opposed to the plan.", "その計画には反対だ。"),
                    ("They are opposed to change.", "彼らは変化に反対だ。")
                 ], ipa: "/biː əpˈəʊzd tuː/"),
            make("crystal clear", "completely transparent or easy to understand",
                 "極めて明瞭な",
                 useCases: ["とても透明・明快なことを表すとき"],
                 examples: [
                    ("Crystal clear water.", "透き通った水。"),
                    ("The rules are crystal clear.", "ルールは極めて明確だ。")
                 ], ipa: "/kɹˈɪstəl klˈiə/"),
            make("good enough", "sufficient; acceptable",
                 "十分なほど良い",
                 useCases: ["合格水準を満たしていることを表すとき"],
                 examples: [
                    ("That's good enough.", "それで十分。"),
                    ("Good enough for me.", "私には十分だ。")
                 ], ipa: "/ɡˈʊd ɪnˈʌf/"),
            make("sure enough", "as expected",
                 "案の定・やっぱり",
                 useCases: ["予想通りの結果を表すとき"],
                 examples: [
                    ("Sure enough, he was late.", "案の定、彼は遅れた。"),
                    ("Sure enough, it rained.", "やっぱり雨になった。")
                 ], ipa: "/ʃˈɔːɹ ɪnˈʌf/"),
            make("be down about", "feel sad regarding something",
                 "〜について落ち込んでいる",
                 useCases: ["特定のことで気落ちしている状態を表すとき"],
                 examples: [
                    ("He's down about the loss.", "彼は敗北で落ち込んでいる。"),
                    ("Don't be down about it.", "そのことで落ち込まないで。")
                 ], ipa: "/biː dˌaʊn ɐbˈaʊt/"),
            make("underway", "in progress; happening now",
                 "進行中で",
                 useCases: ["計画や作業がすでに動いていることを表すとき"],
                 examples: [
                    ("Work is underway.", "作業は進行中。"),
                    ("Plans are underway.", "計画が進んでいる。")
                 ], ipa: "/ˌʌndəwˈeɪ/"),
            make("arguably", "as may be shown by argument; possibly",
                 "おそらく・議論の余地はあるが",
                 useCases: ["議論はあれど〜だと言うとき"],
                 examples: [
                    ("Arguably the best.", "間違いなく最高と言える。"),
                    ("Arguably true.", "ほぼ真実だろう。")
                 ], ipa: "/ˈɑːɡjuːəblɪ/")
        ]
    }

    // MARK: - 表現・フレーズ (追加 62)

    private static var expressionsPhrases62: [Word] {
        [
            make("it goes without saying", "it is obvious",
                 "言うまでもなく",
                 useCases: ["明らかなことを念のため述べるとき"],
                 examples: [
                    ("It goes without saying.", "言うまでもないね。"),
                    ("It goes without saying that safety matters.", "言うまでもなく安全は大事だ。")
                 ], ipa: "/ɪt ɡəʊz wɪðˌaʊt sˈeɪɪŋ/"),
            make("you don't have to force yourself to do", "you don't need to push yourself",
                 "無理して〜しなくていい",
                 useCases: ["相手に無理を強いないよう伝えるとき"],
                 examples: [
                    ("You don't have to force yourself to eat.", "無理に食べなくていい。"),
                    ("You don't have to force yourself to go.", "無理に行かなくていい。")
                 ], ipa: "/juː dˈəʊnt hæv tə fˈɔːs jɔːsˈɛlf tə dˈuː/"),
            make("since you've got the chance", "while you have the opportunity",
                 "せっかくの機会だから",
                 useCases: ["せっかくの機会を活かすよう促すとき"],
                 examples: [
                    ("Since you've got the chance, try it.", "せっかくだから試してみて。"),
                    ("Since you've got the chance, ask him.", "せっかくの機会、彼に聞いて。")
                 ], ipa: "/sˈɪns juːv ɡɒt ðə tʃˈɑːns/"),
            make("it that's how it will end up", "if that's the eventual outcome",
                 "もしそうなるなら",
                 useCases: ["想定される結末を述べるとき"],
                 examples: [
                    ("It that's how it will end up, so be it.", "そうなるならそれでいい。"),
                    ("It that's how it will end up, I'll prepare.", "そうなるなら備えるよ。")
                 ], ipa: "/ɪt ðæts hˌaʊ ɪt wɪl ˈɛnd ˈʌp/"),
            make("at the time of", "during the moment of",
                 "〜の時点で",
                 useCases: ["特定の時点や瞬間に起きたことを述べるとき"],
                 examples: [
                    ("At the time of writing.", "執筆時点で。"),
                    ("At the time of the accident.", "事故が起きた時に。")
                 ], ipa: "/æt ðə tˈaɪm ɒv/"),
            make("I'd really rather you didn't", "I really prefer that you don't",
                 "本当に〜しないでほしい",
                 useCases: ["丁寧だが強く相手の行為を控えるよう求めるとき"],
                 examples: [
                    ("I'd really rather you didn't smoke here.", "ここでは吸わないでほしい。"),
                    ("I'd really rather you didn't tell him.", "彼に言わないでほしい。")
                 ], ipa: "/aɪd ɹˈiəlɪ ɹˈɑːðɐ juː dˈɪdnt/"),
            make("there used to be more", "there were previously more",
                 "昔はもっとあった",
                 useCases: ["以前と比べ減ったものを述べるとき"],
                 examples: [
                    ("There used to be more shops.", "昔はもっと店があった。"),
                    ("There used to be more snow.", "昔はもっと雪が降った。")
                 ], ipa: "/ðeə jˈuːzd təbɪ mˈɔː/"),
            make("in your dream", "not going to happen; never (sarcastic)",
                 "夢でも見てな・あり得ない",
                 useCases: ["相手の望みを揶揄するくだけた表現"],
                 examples: [
                    ("In your dream!", "夢のまた夢だね。"),
                    ("Win the lottery? In your dream.", "宝くじ当たる？夢見ろ。")
                 ], ipa: "/ɪn jɔː dɹˈiːm/"),
            make("so much so that", "to such a great extent that",
                 "あまりに〜なので",
                 useCases: ["程度がひどく結果を引き起こすことを述べるとき"],
                 examples: [
                    ("It rained, so much so that we cancelled.", "雨があまりにひどくて中止した。"),
                    ("She loves it, so much so that she cries.", "好きすぎて泣くほどだ。")
                 ], ipa: "/sˈəʊ mˌʌtʃ sˌəʊ ðˈæt/"),
            make("be included in", "be part of",
                 "〜に含まれている",
                 useCases: ["何かの中に入っているものを述べるとき"],
                 examples: [
                    ("Tax is included in the price.", "価格に税が含まれている。"),
                    ("Breakfast is included in the room.", "朝食付き。")
                 ], ipa: "/biː ɪŋklˈuːdɪd ˈɪn/"),
            make("the point of", "the purpose of",
                 "〜の目的・意義",
                 useCases: ["行為の目的を問うとき"],
                 examples: [
                    ("What's the point of this?", "これの目的は？"),
                    ("Miss the point of it.", "本質を見落とす。")
                 ], ipa: "/ðə pˈɔɪnt ɒv/"),
            make("what impacts do you think sth have on", "what effects do you believe X has on",
                 "〜がどんな影響を及ぼすと思いますか",
                 useCases: ["相手に影響の見解を尋ねるとき"],
                 examples: [
                    ("What impacts do you think AI have on jobs?", "AIが仕事に与える影響をどう思う？"),
                    ("What impacts do you think SNS have on teens?", "SNSが10代に与える影響は？")
                 ], ipa: "/wˌɒt ˈɪmpækts dˈuː juː θˈɪŋk sˈʌmθɪŋ hæv ˈɒn/")
        ]
    }

    // MARK: - 教育・その他 (追加 62)

    private static var education62: [Word] {
        [
            make("grade", "a level of quality or a mark for schoolwork",
                 "成績・等級",
                 useCases: ["学校の評価や品質ランクを表すとき"],
                 examples: [
                    ("Get a good grade.", "良い成績を取る。"),
                    ("Top grade beef.", "最高ランクの牛肉。")
                 ], ipa: "/ɡɹˈeɪd/"),
            make("subject", "a topic or course of study",
                 "科目・主題",
                 useCases: ["学校の科目や話題を表すとき"],
                 examples: [
                    ("Favorite subject.", "得意科目。"),
                    ("Change the subject.", "話題を変える。")
                 ], ipa: "/sˈʌbdʒɛkt/"),
            make("coursework", "work done during a course of study",
                 "授業課題・コース課題",
                 useCases: ["授業期間中に課される課題を表すとき"],
                 examples: [
                    ("Submit your coursework.", "課題を提出する。"),
                    ("Heavy coursework.", "重い課題。")
                 ], ipa: "/kˈɔːsjuːˌɜːk/"),
            make("syllabus", "an outline of a course's topics",
                 "シラバス・授業計画",
                 useCases: ["授業の内容や予定を示す資料を表すとき"],
                 examples: [
                    ("Check the syllabus.", "シラバスを確認する。"),
                    ("On the syllabus.", "授業計画に含まれている。")
                 ], ipa: "/sˈɪlæbəs/"),
            make("findings", "results of an investigation or study",
                 "発見・調査結果",
                 useCases: ["研究や調査で得られた結果を表すとき"],
                 examples: [
                    ("Present the findings.", "調査結果を発表する。"),
                    ("Key findings.", "主要な発見。")
                 ], ipa: "/fˈaɪndɪŋz/")
        ]
    }

    // MARK: - 丁寧な依頼 (追加 63)

    private static var politeRequests63: [Word] {
        [
            make("do you think you could", "polite way to ask for a favor",
                 "〜してもらえそうですか",
                 useCases: ["丁寧にお願いするとき"],
                 examples: [
                    ("Do you think you could help me?", "手伝ってもらえる？"),
                    ("Do you think you could check this?", "これ確認してもらえる？")
                 ], ipa: "/dˈuː juː θˈɪŋk juː kˈʊd/"),
            make("I'd appreciate it if you could", "I would be grateful if you could",
                 "〜していただけるとありがたいです",
                 useCases: ["丁寧に感謝を込めて依頼するとき"],
                 examples: [
                    ("I'd appreciate it if you could reply soon.", "早めにお返事いただけるとありがたいです。"),
                    ("I'd appreciate it if you could share.", "シェアしていただけると助かります。")
                 ], ipa: "/aɪd ɐpɹˈiːʃɪˌeɪt ɪt ɪf juː kˈʊd/"),
            make("would it be possible", "is it feasible to",
                 "〜は可能でしょうか",
                 useCases: ["丁寧に可能かどうか尋ねるとき"],
                 examples: [
                    ("Would it be possible to meet?", "お会いするのは可能でしょうか。"),
                    ("Would it be possible to extend the deadline?", "締切を延長することは可能ですか。")
                 ], ipa: "/wʊd ɪt biː pˈɒsɪbəl/"),
            make("would you mind ing", "would it be an inconvenience to",
                 "〜していただけませんか",
                 useCases: ["相手に丁寧に依頼するとき"],
                 examples: [
                    ("Would you mind closing the window?", "窓を閉めていただけませんか。"),
                    ("Would you mind waiting?", "お待ちいただけますか。")
                 ], ipa: "/wʊd juː mˈaɪnd ˈɪŋ/"),
            make("do I have to", "is it required for me to",
                 "〜しないといけないの？",
                 useCases: ["義務かどうかを確かめるとき"],
                 examples: [
                    ("Do I have to go?", "行かないといけない？"),
                    ("Do I have to pay now?", "今払わないとダメ？")
                 ], ipa: "/dˈuː aɪ hˈæv tuː/"),
            make("you're free to", "you are allowed to",
                 "ご自由に〜してください",
                 useCases: ["相手に許可や選択肢を与えるとき"],
                 examples: [
                    ("You're free to leave.", "ご自由にお帰りください。"),
                    ("You're free to choose.", "自由に選んでいいよ。")
                 ], ipa: "/jɔː fɹˈiː tuː/"),
            make("it's your choice whether or not", "you can decide if",
                 "〜するかしないかはあなた次第",
                 useCases: ["相手に判断を委ねるとき"],
                 examples: [
                    ("It's your choice whether or not to come.", "来るかどうかは君次第。"),
                    ("It's your choice whether or not to agree.", "同意するかは君次第。")
                 ], ipa: "/ɪts jɔː tʃˈɔɪs wˈɛðɐ ɔː nˈɒt/"),
            make("need a favor", "request a favor from someone",
                 "お願いがあるんだ",
                 useCases: ["人に頼みごとがあるとき"],
                 examples: [
                    ("I need a favor.", "お願いがあるんだけど。"),
                    ("I need a favor from you.", "君に頼みたいことがある。")
                 ], ipa: "/nˈiːd ɐ fˈeɪvɐ/"),
            make("do sb a favor", "perform a kind service for someone",
                 "(人)に親切なことをする",
                 useCases: ["相手の頼みを聞く、または依頼するとき"],
                 examples: [
                    ("Do me a favor.", "頼みごとがあるんだ。"),
                    ("Do him a favor.", "彼を助けてあげて。")
                 ], ipa: "/dˈuː sˈʌmbɒdɪ ɐ fˈeɪvɐ/"),
            make("bother sb for a sec", "interrupt someone briefly",
                 "ちょっとお邪魔するけど",
                 useCases: ["ほんの少し話しかける前置きとして"],
                 examples: [
                    ("Sorry to bother you for a sec.", "ちょっとだけお邪魔します。"),
                    ("Can I bother you for a sec?", "少しだけお時間いいですか？")
                 ], ipa: "/bˈɒðɐ sˈʌmbɒdɪ fəɹɐ sˈɛk/"),
            make("have a minute", "have a brief moment to spare",
                 "ちょっと時間ある？",
                 useCases: ["短時間の余裕があるか尋ねるとき"],
                 examples: [
                    ("Do you have a minute?", "ちょっと時間ある？"),
                    ("Got a minute?", "今ちょっといい？")
                 ], ipa: "/hæv ɐ mˈɪnɪt/")
        ]
    }

    // MARK: - カジュアル表現 (追加 63)

    private static var casualPhrases63: [Word] {
        [
            make("drama queen", "a person who reacts overly dramatically",
                 "大げさに騒ぐ人",
                 useCases: ["小さなことで大騒ぎする人を表すくだけた言い方"],
                 examples: [
                    ("Don't be such a drama queen.", "そんなに大げさにしないで。"),
                    ("She's a total drama queen.", "彼女はめっちゃドラマクイーン。")
                 ], ipa: "/dɹˈɑːmɐ kwˈiːn/"),
            make("know what you mean", "understand what you're saying",
                 "言いたいことが分かる",
                 useCases: ["相手の発言に共感するとき"],
                 examples: [
                    ("I know what you mean.", "分かるよ、その気持ち。"),
                    ("Yeah, I know what you mean.", "うん、わかる。")
                 ], ipa: "/nˈəʊ wɒt juː mˈiːn/"),
            make("that's so you", "that's typical of you",
                 "それあなたらしい",
                 useCases: ["その人らしい行動だと指摘するとき"],
                 examples: [
                    ("That's so you!", "それ、めっちゃ君らしい!"),
                    ("Late again? That's so you.", "また遅刻？君らしいね。")
                 ], ipa: "/ðæts sˈəʊ juː/"),
            make("only child", "a child with no siblings",
                 "一人っ子",
                 useCases: ["兄弟姉妹がいない人を表すとき"],
                 examples: [
                    ("I'm an only child.", "私は一人っ子です。"),
                    ("Only child syndrome.", "一人っ子症候群。")
                 ], ipa: "/ˈəʊnlɪ tʃˈaɪld/"),
            make("haha fine", "okay then (resigned, friendly)",
                 "はは、わかったよ",
                 useCases: ["軽くあきらめて同意するとき"],
                 examples: [
                    ("Haha fine, you win.", "はは、わかった、君の勝ち。"),
                    ("Haha fine, I'll do it.", "はは、しょうがない、やるよ。")
                 ], ipa: "/hɑːhˈɑː fˈaɪn/"),
            make("keep my mouth shut", "stay silent; not tell",
                 "口を閉じておく・黙っておく",
                 useCases: ["秘密を漏らさないように黙っておくとき"],
                 examples: [
                    ("I'll keep my mouth shut.", "黙っとくよ。"),
                    ("Keep your mouth shut about this.", "このことは口外しないで。")
                 ], ipa: "/kˈiːp maɪ mˈaʊθ ʃˈʌt/"),
            make("wanna", "want to (informal)",
                 "〜したい(口語)",
                 useCases: ["want toのくだけた言い方"],
                 examples: [
                    ("Wanna go?", "行きたい？"),
                    ("I wanna try.", "やってみたい。")
                 ], ipa: "/wˈɒnɐ/"),
            make("can we", "are we able to / may we",
                 "〜してもいい？・〜できる？",
                 useCases: ["相手と一緒に何かする提案や許可を求めるとき"],
                 examples: [
                    ("Can we leave now?", "もう出ていい？"),
                    ("Can we talk?", "ちょっと話せる？")
                 ], ipa: "/kˈæn wiː/"),
            make("hit up", "contact someone (informal)",
                 "(人)に連絡する",
                 useCases: ["人にメッセージや電話で連絡するくだけた言い方"],
                 examples: [
                    ("Hit me up later.", "あとで連絡して。"),
                    ("Hit her up.", "彼女に連絡してみて。")
                 ], ipa: "/hˈɪt ˈʌp/"),
            make("hinge", "a turning point; a hinge joint",
                 "蝶番・要となるもの",
                 useCases: ["扉の蝶番や物事の鍵になる要素を表すとき"],
                 examples: [
                    ("The door hinges creaked.", "ドアの蝶番が軋んだ。"),
                    ("Everything hinges on this.", "全てはこれにかかっている。")
                 ], ipa: "/hˈɪndʒ/"),
            make("take care", "be careful; goodbye (informal)",
                 "気をつけて・じゃあね",
                 useCases: ["別れ際の挨拶や注意を促すとき"],
                 examples: [
                    ("Take care.", "じゃあね、気をつけて。"),
                    ("Take care of yourself.", "体に気をつけて。")
                 ], ipa: "/tˈeɪk kˈeə/"),
            make("getting late", "becoming late in time",
                 "もう遅くなってきた",
                 useCases: ["時間が遅いことを伝えるとき"],
                 examples: [
                    ("It's getting late.", "もう遅くなってきた。"),
                    ("Getting late, I should go.", "もう遅いから帰るよ。")
                 ], ipa: "/ɡˌɛtɪŋ lˈeɪt/"),
            make("gotta run", "I have to leave now (informal)",
                 "もう行かなきゃ",
                 useCases: ["急いで立ち去る時のカジュアルな別れの挨拶"],
                 examples: [
                    ("Gotta run, see you!", "もう行くね、じゃ!"),
                    ("Sorry, gotta run.", "ごめん、急いでるんだ。")
                 ], ipa: "/ɡˈɒtɐ ɹˈʌn/"),
            make("can't be late", "must not be late",
                 "遅れるわけにはいかない",
                 useCases: ["遅刻が許されない状況を強調するとき"],
                 examples: [
                    ("I can't be late.", "遅刻できない。"),
                    ("Can't be late today.", "今日は遅れちゃいけない。")
                 ], ipa: "/kˈɑːnt biː lˈeɪt/"),
            make("I'll be there soon", "I will arrive shortly",
                 "もうすぐ着くよ",
                 useCases: ["まもなく到着することを伝えるとき"],
                 examples: [
                    ("I'll be there soon.", "もうすぐ着く。"),
                    ("Wait, I'll be there soon.", "待ってて、すぐ着くから。")
                 ], ipa: "/aɪl biː ðeə sˈuːn/"),
            make("amazing", "extremely impressive",
                 "素晴らしい・驚くべき",
                 useCases: ["強い感嘆を表すとき"],
                 examples: [
                    ("That's amazing!", "それすごい!"),
                    ("An amazing performance.", "見事な演技。")
                 ], ipa: "/ɐmˈeɪzɪŋ/"),
            make("just looking", "browsing without intent to buy",
                 "見てるだけです",
                 useCases: ["店で店員に声をかけられたとき"],
                 examples: [
                    ("Just looking, thanks.", "見てるだけです、ありがとう。"),
                    ("I'm just looking.", "ただ見ているだけ。")
                 ], ipa: "/dʒˈʌst lˈʊkɪŋ/"),
            make("to go please", "for takeaway please",
                 "持ち帰りでお願いします",
                 useCases: ["飲食店で持ち帰りを頼むとき"],
                 examples: [
                    ("One coffee to go please.", "コーヒー1つテイクアウトで。"),
                    ("To go please.", "持ち帰りで。")
                 ], ipa: "/tə ɡˌəʊ plˈiːz/")
        ]
    }

    // MARK: - スケジュール・依頼 (追加 63)

    private static var schedulingMisc63: [Word] {
        [
            make("schedule sth", "arrange a time for something",
                 "〜の予定を組む",
                 useCases: ["会議や予約の時間を決めるとき"],
                 examples: [
                    ("Schedule a meeting.", "会議を設定する。"),
                    ("Let's schedule a call.", "電話の予定を組もう。")
                 ], ipa: "/ʃˈɛdjuːl sˈʌmθɪŋ/"),
            make("availability", "the state of being free to be used or seen",
                 "都合・空き状況",
                 useCases: ["人や物の予定の空きを表すとき"],
                 examples: [
                    ("Check my availability.", "私の空きを確認する。"),
                    ("Confirm availability.", "空き状況を確認する。")
                 ], ipa: "/ɐvˌeɪləbˈɪlɪtɪ/"),
            make("sth works perfectly", "something fits or functions perfectly",
                 "〜は完璧にうまくいく",
                 useCases: ["予定や物がぴったり合っているとき"],
                 examples: [
                    ("That time works perfectly.", "その時間でばっちりです。"),
                    ("Friday works perfectly.", "金曜日が完璧です。")
                 ], ipa: "/sˈʌmθɪŋ wˈɜːks pˈɜːfɛktlɪ/"),
            make("either of these", "any one of these (two)",
                 "これらのどちらでも",
                 useCases: ["2択のうちどちらでも構わないと示すとき"],
                 examples: [
                    ("Either of these works.", "どちらでも大丈夫。"),
                    ("Pick either of these.", "どちらか選んで。")
                 ], ipa: "/ˈaɪðɐɹ ɒv ðˈiːz/"),
            make("what time works", "what time is suitable",
                 "何時が都合いい？",
                 useCases: ["相手の都合の良い時間を尋ねるとき"],
                 examples: [
                    ("What time works for you?", "何時が都合いい？"),
                    ("What time works best?", "何時が一番いい？")
                 ], ipa: "/wˌɒt tˈaɪm wˈɜːks/"),
            make("in a hurry", "rushed or pressed for time",
                 "急いで",
                 useCases: ["時間に追われている状況を表すとき"],
                 examples: [
                    ("I'm in a hurry.", "急いでるんだ。"),
                    ("Why the hurry?", "なんでそんなに急いでるの？")
                 ], ipa: "/ɪn ɐ hˈʌɹɪ/"),
            make("altogether", "in total; entirely",
                 "全部で・全体的に",
                 useCases: ["合計や全体的な様子を述べるとき"],
                 examples: [
                    ("Altogether, it costs $50.", "全部で50ドル。"),
                    ("Altogether different.", "全く違う。")
                 ], ipa: "/ˌɔːltəɡˈɛðɐ/"),
            make("half of", "fifty percent of",
                 "〜の半分",
                 useCases: ["全体の半分を表すとき"],
                 examples: [
                    ("Half of the cake.", "ケーキの半分。"),
                    ("Half of them agree.", "半数が同意。")
                 ], ipa: "/hˈɑːf ɒv/"),
            make("halve", "divide into two equal parts",
                 "半分にする",
                 useCases: ["二等分するときや半減させるとき"],
                 examples: [
                    ("Halve the cost.", "コストを半分にする。"),
                    ("Halve the apple.", "リンゴを半分に切る。")
                 ], ipa: "/hˈɑːv/"),
            make("first come first served basis", "served in the order of arrival",
                 "先着順",
                 useCases: ["先着で対応する方式を表すとき"],
                 examples: [
                    ("On a first come first served basis.", "先着順で。"),
                    ("Seats are first come first served basis.", "席は先着順です。")
                 ], ipa: "/fˈɜːst kˈʌm fˈɜːst sˈɜːvd bˈeɪsɪs/"),
            make("nearby", "close at hand",
                 "近くの・すぐそばに",
                 useCases: ["近い場所を表すとき"],
                 examples: [
                    ("A nearby café.", "近くのカフェ。"),
                    ("Is there a station nearby?", "近くに駅ある？")
                 ], ipa: "/niəbˈaɪ/"),
            make("location", "a particular place or position",
                 "場所・所在地",
                 useCases: ["地理的な位置や店舗の場所を表すとき"],
                 examples: [
                    ("Send your location.", "現在地を送って。"),
                    ("A great location.", "好立地。")
                 ], ipa: "/ləʊkˈeɪʃən/"),
            make("locate sth", "find or place something",
                 "〜の場所を突き止める・配置する",
                 useCases: ["位置を特定する、または設置するとき"],
                 examples: [
                    ("Locate the file.", "ファイルを探し当てる。"),
                    ("Locate the new office.", "新オフィスを配置する。")
                 ], ipa: "/ləʊkˈeɪt sˈʌmθɪŋ/")
        ]
    }

    // MARK: - 動詞・依頼・行動 (追加 63)

    private static var verbsAndPhrases63: [Word] {
        [
            make("go on a trip", "take a journey",
                 "旅行に行く",
                 useCases: ["旅行や出張に出かけるとき"],
                 examples: [
                    ("Go on a trip to Italy.", "イタリアへ旅行に行く。"),
                    ("Let's go on a trip.", "旅行に行こう。")
                 ], ipa: "/ɡˌəʊ ˌɒn ɐ tɹˈɪp/"),
            make("be hesitant", "be reluctant or unsure to do something",
                 "ためらっている",
                 useCases: ["決断を渋っている状態を表すとき"],
                 examples: [
                    ("I'm hesitant to say yes.", "うんと言うのをためらっている。"),
                    ("Don't be hesitant.", "ためらわないで。")
                 ], ipa: "/biː hˈɛzɪtənt/"),
            make("be overwhelmed with", "be flooded by too much of something",
                 "〜に圧倒されている",
                 useCases: ["仕事や感情に押しつぶされそうな状態を表すとき"],
                 examples: [
                    ("I'm overwhelmed with work.", "仕事に圧倒されている。"),
                    ("Be overwhelmed with joy.", "喜びでいっぱい。")
                 ], ipa: "/biː ˌəʊvəwˈɛlmd wɪð/"),
            make("hoping to", "wishing or planning to",
                 "〜したいと思っている",
                 useCases: ["希望や予定を控えめに伝えるとき"],
                 examples: [
                    ("Hoping to see you soon.", "近いうちに会えたら。"),
                    ("Hoping to travel this year.", "今年旅行できたらいいな。")
                 ], ipa: "/hˈəʊpɪŋ tuː/"),
            make("spoil sth", "ruin something; reveal a plot in advance",
                 "〜を台無しにする・ネタバレする",
                 useCases: ["楽しみを台無しにしたり物を傷ませるとき"],
                 examples: [
                    ("Don't spoil the ending.", "結末をバラさないで。"),
                    ("Spoil the surprise.", "サプライズを台無しにする。")
                 ], ipa: "/spˈɔɪl sˈʌmθɪŋ/"),
            make("get dressed", "put clothes on",
                 "服を着る",
                 useCases: ["朝の身支度やドレスアップを表すとき"],
                 examples: [
                    ("Time to get dressed.", "服を着る時間だ。"),
                    ("Get dressed quickly.", "早く着替えて。")
                 ], ipa: "/ɡɛt dɹˈɛst/"),
            make("get sb sth", "obtain something for someone",
                 "(人)に(物)を手に入れてあげる",
                 useCases: ["人のために何かを買う・取ってくるとき"],
                 examples: [
                    ("Get me some water.", "水を取ってきて。"),
                    ("Get him a present.", "彼にプレゼントを買う。")
                 ], ipa: "/ɡɛt sˈʌmbɒdɪ sˈʌmθɪŋ/"),
            make("give me a hand", "help me with something",
                 "手伝ってくれる？",
                 useCases: ["手伝いを頼むくだけた言い方"],
                 examples: [
                    ("Give me a hand here.", "ちょっと手伝って。"),
                    ("Can you give me a hand?", "手を貸してくれる？")
                 ], ipa: "/ɡˈɪv mˌiː ɐ hˈænd/"),
            make("volunteer", "offer help without payment; a person who does so",
                 "ボランティアをする・志願者",
                 useCases: ["無償で何かを引き受ける、または志願する人を表すとき"],
                 examples: [
                    ("Volunteer at the shelter.", "保護施設でボランティアする。"),
                    ("I'll volunteer.", "私が手を挙げます。")
                 ], ipa: "/vˌɒləntˈiə/"),
            make("lack sth", "be without enough of something",
                 "〜が不足している",
                 useCases: ["必要なものが足りないことを表すとき"],
                 examples: [
                    ("Lack confidence.", "自信が足りない。"),
                    ("Lack of sleep.", "睡眠不足。")
                 ], ipa: "/lˈæk sˈʌmθɪŋ/"),
            make("count too much on", "rely excessively on",
                 "〜を当てにしすぎる",
                 useCases: ["過度に頼りすぎていることを表すとき"],
                 examples: [
                    ("Don't count too much on luck.", "運に頼りすぎないで。"),
                    ("Count too much on him.", "彼を当てにしすぎる。")
                 ], ipa: "/kˈaʊnt tˈuː mʌtʃ ˈɒn/"),
            make("take kindness for granted", "treat kindness as if owed",
                 "親切を当然と思う",
                 useCases: ["人の優しさをありがたがらない態度を諫めるとき"],
                 examples: [
                    ("Don't take kindness for granted.", "親切を当たり前と思わないで。"),
                    ("She takes kindness for granted.", "彼女は人の親切を当然と思っている。")
                 ], ipa: "/tˈeɪk kˈaɪndnəs fɔː ɡɹˈɑːntɪd/"),
            make("chicken out", "back out because of fear",
                 "怖気づいてやめる",
                 useCases: ["怖くなって途中で逃げ出すとき"],
                 examples: [
                    ("Don't chicken out.", "怖気づくなよ。"),
                    ("He chickened out.", "彼はビビって逃げた。")
                 ], ipa: "/tʃˈɪkɪn ˈaʊt/"),
            make("surpass", "exceed; go beyond a limit",
                 "〜を上回る・超える",
                 useCases: ["他を超える、限界を超えるとき"],
                 examples: [
                    ("Surpass expectations.", "期待を超える。"),
                    ("Surpass the record.", "記録を更新する。")
                 ], ipa: "/səpˈɑːs/"),
            make("be hard on", "treat strictly or harshly",
                 "〜に厳しい",
                 useCases: ["人に厳しく当たることを表すとき"],
                 examples: [
                    ("Don't be hard on yourself.", "自分に厳しくしすぎないで。"),
                    ("She's hard on her kids.", "彼女は子どもに厳しい。")
                 ], ipa: "/biː hˈɑːd ˈɒn/"),
            make("tease", "make fun of in a playful or annoying way",
                 "からかう・じらす",
                 useCases: ["軽い冗談や悪戯で人をいじるとき"],
                 examples: [
                    ("Don't tease him.", "彼をからかわないで。"),
                    ("Just teasing.", "ただからかってるだけ。")
                 ], ipa: "/tˈiːz/"),
            make("have you ever gone to", "have you visited",
                 "〜に行ったことある？",
                 useCases: ["過去の訪問経験を尋ねるとき"],
                 examples: [
                    ("Have you ever gone to Paris?", "パリ行ったことある？"),
                    ("Have you ever gone to a concert?", "コンサート行ったことある？")
                 ], ipa: "/hæv juː ˈɛvɐ ɡˈɒn tuː/"),
            make("correct sth", "make right or improve",
                 "〜を訂正する・直す",
                 useCases: ["間違いを直すとき"],
                 examples: [
                    ("Correct your mistake.", "間違いを直す。"),
                    ("Please correct this sentence.", "この文を直してください。")
                 ], ipa: "/kəɹˈɛkt sˈʌmθɪŋ/"),
            make("proofread", "read to find and fix errors",
                 "校正する",
                 useCases: ["文章をチェックして誤りを正すとき"],
                 examples: [
                    ("Proofread the article.", "記事を校正する。"),
                    ("I'll proofread it for you.", "校正しといてあげる。")
                 ], ipa: "/pɹˈuːfɹiːd/"),
            make("inform sb", "give someone information",
                 "(人)に知らせる",
                 useCases: ["人に情報を伝えるとき"],
                 examples: [
                    ("Inform me of any changes.", "変更があれば教えて。"),
                    ("Inform the team.", "チームに知らせる。")
                 ], ipa: "/ɪnfˈɔːm sˈʌmbɒdɪ/"),
            make("hold up", "delay; raise; cope; rob",
                 "遅らせる・持ちこたえる",
                 useCases: ["待たせる、持ちこたえる、強盗などに使う"],
                 examples: [
                    ("Sorry to hold you up.", "お待たせしてごめん。"),
                    ("Hold up, wait a sec.", "ちょっと待って。")
                 ], ipa: "/hˈəʊld ˈʌp/"),
            make("sit on the fence", "remain neutral; avoid taking sides",
                 "中立の立場をとる・どっちつかず",
                 useCases: ["立場を決めず態度を保留するとき"],
                 examples: [
                    ("Stop sitting on the fence.", "態度を決めて。"),
                    ("He's sitting on the fence.", "彼はどっちつかずだ。")
                 ], ipa: "/sˈɪt ɒnðə fˈɛns/"),
            make("flick", "a quick light movement; a movie (slang)",
                 "軽く弾く・映画(俗)",
                 useCases: ["指で弾く動作や映画を俗に呼ぶとき"],
                 examples: [
                    ("Flick the switch.", "スイッチをパチンと押す。"),
                    ("Watch a flick.", "映画を観る。")
                 ], ipa: "/flˈɪk/"),
            make("ride", "travel on or in a vehicle; a journey",
                 "乗る・乗車",
                 useCases: ["乗り物に乗る、乗る行為を表すとき"],
                 examples: [
                    ("Ride a bike.", "自転車に乗る。"),
                    ("Need a ride?", "送ろうか？")
                 ], ipa: "/ɹˈaɪd/")
        ]
    }

    // MARK: - 名詞・その他 (追加 63)

    private static var nounsAndMisc63: [Word] {
        [
            make("oral", "relating to the mouth or spoken",
                 "口の・口頭の",
                 useCases: ["口に関する、または口頭での説明を表すとき"],
                 examples: [
                    ("Oral exam.", "口頭試験。"),
                    ("Oral health.", "口腔の健康。")
                 ], ipa: "/ˈɔːɹəl/"),
            make("minutes", "an official record of a meeting",
                 "議事録",
                 useCases: ["会議の記録を表すとき"],
                 examples: [
                    ("Take the minutes.", "議事録を取る。"),
                    ("Meeting minutes.", "会議議事録。")
                 ], ipa: "/mˈɪnɪts/"),
            make("textbook", "a book used for studying a subject",
                 "教科書",
                 useCases: ["授業で使う教科書を表すとき"],
                 examples: [
                    ("Open your textbook.", "教科書を開いて。"),
                    ("A textbook example.", "典型的な例。")
                 ], ipa: "/tˈɛkstbʊk/"),
            make("nothing but thanks", "only gratitude",
                 "感謝以外にない・ただただ感謝",
                 useCases: ["心からのお礼を強調するとき"],
                 examples: [
                    ("Nothing but thanks from me.", "ただただ感謝しかない。"),
                    ("I have nothing but thanks.", "感謝の言葉しかない。")
                 ], ipa: "/nˈʌθɪŋ bˌʌt θˈæŋks/"),
            make("picnic weather", "weather perfect for a picnic",
                 "ピクニック日和",
                 useCases: ["外で過ごすのにぴったりの天気を表すとき"],
                 examples: [
                    ("Today is picnic weather.", "今日はピクニック日和。"),
                    ("Picnic weather at last.", "やっとピクニック日和。")
                 ], ipa: "/pˈɪknɪk wˈɛðɐ/"),
            make("hidden gem", "a little-known but valuable thing or place",
                 "知る人ぞ知る名所・隠れた宝",
                 useCases: ["隠れた良いお店や場所を表すとき"],
                 examples: [
                    ("This café is a hidden gem.", "ここは隠れた名店だ。"),
                    ("A hidden gem of a movie.", "知られざる名作映画。")
                 ], ipa: "/hˈɪdən dʒˈɛm/"),
            make("a surprise", "an unexpected event or gift",
                 "驚き・サプライズ",
                 useCases: ["予期せぬ出来事や贈り物を表すとき"],
                 examples: [
                    ("What a surprise!", "びっくり!"),
                    ("It was a nice surprise.", "嬉しいサプライズだった。")
                 ], ipa: "/ɐ səpɹˈaɪz/"),
            make("slave driver", "a person who makes others work very hard",
                 "扱使う人・人使いの荒い人",
                 useCases: ["過酷に人を働かせる上司などをくだけて表すとき"],
                 examples: [
                    ("Our boss is a slave driver.", "うちの上司は人使いが荒い。"),
                    ("Don't be a slave driver.", "そんなに働かせないで。")
                 ], ipa: "/slˈeɪv dɹˈaɪvɐ/"),
            make("the time has come", "the moment has arrived",
                 "その時が来た",
                 useCases: ["決断や行動の時を厳かに告げるとき"],
                 examples: [
                    ("The time has come to decide.", "決断の時が来た。"),
                    ("The time has come at last.", "ついにその時が来た。")
                 ], ipa: "/ðə tˈaɪm hɐz kˈʌm/"),
            make("rope", "a thick strong cord",
                 "ロープ・縄",
                 useCases: ["太い縄や紐を表すとき"],
                 examples: [
                    ("Tie with a rope.", "ロープで縛る。"),
                    ("A jump rope.", "縄跳び。")
                 ], ipa: "/ɹˈəʊp/"),
            make("light", "illumination; not heavy; ignite",
                 "光・軽い・点灯する",
                 useCases: ["光、軽さ、火をつけるなど多義に使う"],
                 examples: [
                    ("Turn on the light.", "明かりを点けて。"),
                    ("Light as a feather.", "羽のように軽い。")
                 ], ipa: "/lˈaɪt/"),
            make("rest in peace to", "may they rest in peace",
                 "〜の安らかな眠りを",
                 useCases: ["亡くなった人への追悼を表すとき"],
                 examples: [
                    ("Rest in peace to grandma.", "祖母の安らかな眠りを。"),
                    ("Rest in peace to all victims.", "全ての犠牲者に安らかな眠りを。")
                 ], ipa: "/ɹˈɛst ɪn pˈiːs tuː/"),
            make("abdominal", "relating to the abdomen",
                 "腹部の",
                 useCases: ["お腹に関する筋肉や痛みを表すとき"],
                 examples: [
                    ("Abdominal muscles.", "腹筋。"),
                    ("Abdominal pain.", "腹痛。")
                 ], ipa: "/æbdˈɒmɪnəl/"),
            make("in the loop", "informed about something",
                 "情報を共有している",
                 useCases: ["情報の輪の中にいる状態を表すとき"],
                 examples: [
                    ("Keep me in the loop.", "情報共有よろしく。"),
                    ("I'm in the loop.", "私もその件知ってる。")
                 ], ipa: "/ɪnðə lˈuːp/"),
            make("clickbait", "online content with misleading attractive titles",
                 "クリックベイト・釣り見出し",
                 useCases: ["クリックを誘うために誇張された見出しを表すとき"],
                 examples: [
                    ("Don't fall for clickbait.", "釣り記事にだまされないで。"),
                    ("That headline is clickbait.", "あの見出しは釣りだ。")
                 ], ipa: "/klˈɪkbeɪt/")
        ]
    }

    // MARK: - 状態・責任 (追加 63)

    private static var statesAndFaults63: [Word] {
        [
            make("all my fault", "entirely my responsibility",
                 "全部私のせい",
                 useCases: ["責任を完全に引き受けるとき"],
                 examples: [
                    ("It's all my fault.", "全部私のせいだ。"),
                    ("All my fault, I'm sorry.", "全部僕のせい、ごめん。")
                 ], ipa: "/ˈɔːl maɪ fˈɒlt/"),
            make("at fault", "responsible for an error",
                 "落ち度がある",
                 useCases: ["過失や責任を負っている状態を表すとき"],
                 examples: [
                    ("Who's at fault?", "誰が悪いの？"),
                    ("I'm at fault.", "私に落ち度があります。")
                 ], ipa: "/æt fˈɒlt/"),
            make("at risk", "in danger of harm or loss",
                 "危険にさらされている",
                 useCases: ["損害や被害の可能性がある状態を表すとき"],
                 examples: [
                    ("At risk of failure.", "失敗の危険にある。"),
                    ("Lives are at risk.", "命が危険にさらされている。")
                 ], ipa: "/æt ɹˈɪsk/"),
            make("be to blame", "be responsible for something bad",
                 "〜のせいだ・責められるべき",
                 useCases: ["問題の原因が特定の人物にあると述べるとき"],
                 examples: [
                    ("He is to blame.", "彼のせいだ。"),
                    ("No one is to blame.", "誰のせいでもない。")
                 ], ipa: "/biː tə blˈeɪm/"),
            make("if I were in your shoes", "if I were in your position",
                 "もし私があなたの立場なら",
                 useCases: ["相手の立場で意見を述べるとき"],
                 examples: [
                    ("If I were in your shoes, I'd quit.", "私なら辞めるね。"),
                    ("If I were in your shoes, I'd wait.", "私だったら待つよ。")
                 ], ipa: "/ɪf aɪ wɜːɹ ɪn jɔː ʃˈuːz/"),
            make("too good to be true", "so good that it seems unreal",
                 "話がうますぎる",
                 useCases: ["信じられないほど好条件のものを疑うとき"],
                 examples: [
                    ("Sounds too good to be true.", "話がうますぎる。"),
                    ("This deal is too good to be true.", "この取引はうますぎる。")
                 ], ipa: "/tˈuː ɡˈʊd təbɪ tɹˈuː/"),
            make("unwelcome", "not invited or wanted",
                 "歓迎されない",
                 useCases: ["望まれていない訪問や知らせを表すとき"],
                 examples: [
                    ("An unwelcome guest.", "招かれざる客。"),
                    ("Unwelcome news.", "ありがたくない知らせ。")
                 ], ipa: "/ʌnwˈɛlkʌm/"),
            make("unwell", "not in good health",
                 "体調が悪い",
                 useCases: ["体調がすぐれない状態を婉曲に表すとき"],
                 examples: [
                    ("I feel unwell today.", "今日は体調が悪い。"),
                    ("She's unwell.", "彼女は体調が悪い。")
                 ], ipa: "/ʌnwˈɛl/"),
            make("are you saying", "do you mean to say",
                 "つまり〜と言ってるの？",
                 useCases: ["相手の発言の意図を確認するとき"],
                 examples: [
                    ("Are you saying I'm wrong?", "私が間違ってるってこと？"),
                    ("Are you saying it's over?", "もう終わりってこと？")
                 ], ipa: "/ɑː juː sˈeɪɪŋ/"),
            make("I'd be lying to you if I said", "I would lie if I told you",
                 "もし〜と言ったら嘘になる",
                 useCases: ["本音を伝える前置きとして"],
                 examples: [
                    ("I'd be lying to you if I said I wasn't upset.", "怒ってないと言ったら嘘になる。"),
                    ("I'd be lying to you if I said it was easy.", "簡単だと言ったら嘘だ。")
                 ], ipa: "/aɪd biː lˈaɪɪŋ tə juː ɪf aɪ sˈɛd/"),
            make("at a stand mill", "stuck in one place; making no progress",
                 "膠着状態で",
                 useCases: ["進展しない状況を比喩で表すとき"],
                 examples: [
                    ("The talks are at a stand mill.", "交渉は膠着状態だ。"),
                    ("I'm at a stand mill.", "全然進まない。")
                 ], ipa: "/ætɐ stˈænd mˈɪl/"),
            make("so much for", "that's the end of (sarcastic)",
                 "〜なんてもう終わり・〜って何だったんだ",
                 useCases: ["期待外れの結果を皮肉るとき"],
                 examples: [
                    ("So much for our plan.", "計画も台無しだ。"),
                    ("So much for being on time.", "時間通りって何だったんだ。")
                 ], ipa: "/sˈəʊ mˌʌtʃ fɔː/"),
            make("there's nothing like", "nothing compares to",
                 "〜に勝るものはない",
                 useCases: ["特定のものを最高だと強調するとき"],
                 examples: [
                    ("There's nothing like home.", "我が家に勝るものはない。"),
                    ("There's nothing like fresh bread.", "焼きたてパンに勝るものはない。")
                 ], ipa: "/ðeəz nˈʌθɪŋ lˈaɪk/"),
            make("gone", "departed; no longer present",
                 "去った・なくなった",
                 useCases: ["人や物がもうそこにない状態を表すとき"],
                 examples: [
                    ("She's gone.", "彼女は行ってしまった。"),
                    ("All gone.", "全部なくなった。")
                 ], ipa: "/ɡˈɒn/"),
            make("I'm coming now", "I am on my way",
                 "今行きます",
                 useCases: ["呼ばれた時にすぐ向かうと伝えるとき"],
                 examples: [
                    ("I'm coming now!", "今行く!"),
                    ("Wait, I'm coming now.", "待って、今向かってる。")
                 ], ipa: "/aɪm kˈʌmɪŋ nˈaʊ/"),
            make("have you ?", "have you (done sth)?",
                 "〜したことある？",
                 useCases: ["過去の経験や完了を尋ねるくだけた言い方"],
                 examples: [
                    ("Have you eaten?", "ご飯食べた？"),
                    ("Have you finished?", "もう終わった？")
                 ], ipa: "/hˈæv juː/")
        ]
    }
}
