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
        examples: [(String, String)]
    ) -> Word {
        Word(
            word: word,
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
                 ]),
            make("put off",
                 "postpone or delay something",
                 "延期する・先延ばしにする",
                 useCases: ["予定を後ろにずらすとき", "嫌な作業を先延ばしにするとき"],
                 examples: [
                    ("Let's put off the meeting.", "会議を延期しよう。"),
                    ("Don't put off your homework.", "宿題を先延ばしにしないで。")
                 ]),
            make("look up to",
                 "respect and admire someone",
                 "尊敬する・憧れる",
                 useCases: ["年上や上司を尊敬するとき", "憧れの人物を表すとき"],
                 examples: [
                    ("I look up to my mother.", "母を尊敬している。"),
                    ("Kids look up to their teachers.", "子どもは先生を尊敬する。")
                 ]),
            make("give up",
                 "stop trying; surrender",
                 "諦める・やめる",
                 useCases: ["挫折・断念を表すとき", "「諦めるな」と励ますとき", "悪習慣をやめると言うとき"],
                 examples: [
                    ("Don't give up!", "諦めないで！"),
                    ("He gave up smoking.", "彼はタバコをやめた。")
                 ]),
            make("figure out",
                 "understand or solve something after thinking",
                 "理解する・解明する",
                 useCases: ["問題の答えに辿り着くとき", "状況を把握しようとするとき"],
                 examples: [
                    ("I can't figure it out.", "理解できない。"),
                    ("Let me figure out the password.", "パスワードを考えてみる。")
                 ]),
            make("take care of",
                 "be responsible for; look after",
                 "世話する・対処する",
                 useCases: ["子どもやペットの世話", "仕事や問題を担当するとき"],
                 examples: [
                    ("I'll take care of it.", "私が対処します。"),
                    ("She takes care of her brother.", "彼女は弟の面倒を見ている。")
                 ]),
            make("run into",
                 "meet someone unexpectedly",
                 "偶然出会う",
                 useCases: ["街中で知人にバッタリ会ったとき", "偶然の出会いを話すとき"],
                 examples: [
                    ("I ran into Tom yesterday.", "昨日トムにバッタリ会った。"),
                    ("We ran into each other at the cafe.", "カフェで偶然会った。")
                 ]),
            make("break down",
                 "stop working; analyze in detail",
                 "故障する・分析する",
                 useCases: ["機械や車が壊れたとき", "データや情報を細かく分析するとき"],
                 examples: [
                    ("My car broke down.", "車が故障した。"),
                    ("Let's break down the data.", "データを分析しよう。")
                 ]),
            make("carry out",
                 "perform a task or plan",
                 "実行する・遂行する",
                 useCases: ["計画や指示を実施するとき", "実験や調査を行うとき"],
                 examples: [
                    ("We carried out the plan.", "計画を実行した。"),
                    ("They carried out an experiment.", "彼らは実験を行った。")
                 ]),
            make("look forward to",
                 "feel excited about a future event",
                 "楽しみにする",
                 useCases: ["メールや会話で「楽しみ」と言うとき", "次回の予定にワクワクするとき"],
                 examples: [
                    ("I look forward to seeing you.", "会えるのを楽しみにしています。"),
                    ("She's looking forward to the trip.", "彼女は旅行を楽しみにしている。")
                 ]),
            make("catch up",
                 "reach the same level; share recent news",
                 "追いつく・近況を話す",
                 useCases: ["遅れを取り戻すとき", "久しぶりに会って近況報告するとき"],
                 examples: [
                    ("Let's catch up over coffee.", "コーヒーでもしながら近況話そう。"),
                    ("I need to catch up on my work.", "仕事の遅れを取り戻さないと。")
                 ]),
            make("show up",
                 "arrive or appear",
                 "現れる・姿を見せる",
                 useCases: ["人が約束の場所に来るとき", "予期されていた人が姿を見せたとき"],
                 examples: [
                    ("He didn't show up.", "彼は来なかった。"),
                    ("She showed up late.", "彼女は遅れて現れた。")
                 ]),
            make("turn out",
                 "end up being a particular way; happen as a result",
                 "結局〜になる・判明する",
                 useCases: ["結果や結論を述べるとき", "後から判明したことを伝えるとき"],
                 examples: [
                    ("It turned out fine.", "結局うまくいった。"),
                    ("He turned out to be right.", "結局彼が正しかった。")
                 ]),
            make("get along",
                 "have a friendly relationship",
                 "仲良くやる",
                 useCases: ["人間関係について話すとき", "チームの相性について話すとき"],
                 examples: [
                    ("We get along well.", "私たちは仲が良い。"),
                    ("They don't get along.", "彼らは仲が悪い。")
                 ]),
            make("hold on",
                 "wait; grip firmly",
                 "待つ・しがみつく",
                 useCases: ["電話で「ちょっと待って」と言うとき", "物理的にしっかり掴むとき"],
                 examples: [
                    ("Hold on a second.", "ちょっと待って。"),
                    ("Hold on tight.", "しっかりつかまって。")
                 ]),
            make("take over",
                 "take control or responsibility",
                 "引き継ぐ・支配する",
                 useCases: ["仕事を引き継ぐとき", "会社が買収されるとき"],
                 examples: [
                    ("I'll take over from here.", "ここから私が引き継ぎます。"),
                    ("She took over the project.", "彼女がプロジェクトを引き継いだ。")
                 ]),
            make("point out",
                 "bring attention to something",
                 "指摘する・示す",
                 useCases: ["間違いや事実を指摘するとき", "注意を促すとき"],
                 examples: [
                    ("He pointed out the error.", "彼は間違いを指摘した。"),
                    ("Let me point out one thing.", "一つ指摘させて。")
                 ]),
            make("bring up",
                 "mention a topic; raise a child",
                 "話題に出す・育てる",
                 useCases: ["会話で話題を持ち出すとき", "子育てを表すとき"],
                 examples: [
                    ("Don't bring up that topic.", "その話題は出さないで。"),
                    ("She was brought up in Tokyo.", "彼女は東京で育った。")
                 ]),
            make("come across",
                 "find by chance; encounter",
                 "偶然見つける・出会う",
                 useCases: ["本やネットで偶然見つけたとき", "古い物を発掘したとき"],
                 examples: [
                    ("I came across this article.", "この記事を偶然見つけた。"),
                    ("He came across an old letter.", "彼は古い手紙を見つけた。")
                 ]),
            make("make sense",
                 "be reasonable or understandable",
                 "理にかなう・納得がいく",
                 useCases: ["説明が論理的か確認するとき", "意味が通るかを話すとき"],
                 examples: [
                    ("That makes sense.", "なるほど、納得。"),
                    ("It doesn't make sense to me.", "私には意味が分からない。")
                 ])
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
                 ]),
            make("by the way",
                 "used to introduce a new topic",
                 "ところで・ちなみに",
                 useCases: ["会話で話題を変えるとき", "思い出して付け加えるとき"],
                 examples: [
                    ("By the way, did you eat?", "ところで、食べた？"),
                    ("By the way, I love it.", "ちなみに、それ好き。")
                 ]),
            make("as far as",
                 "to the extent that",
                 "〜に関する限り",
                 useCases: ["自分の知る限りで、と限定するとき", "範囲を示すとき"],
                 examples: [
                    ("As far as I know, it's true.", "私の知る限り本当だ。"),
                    ("As far as I'm concerned, it's fine.", "私としては問題ない。")
                 ]),
            make("on the other hand",
                 "introducing a contrasting point",
                 "一方で・他方では",
                 useCases: ["対比を示すとき", "議論で別の見方を提示するとき"],
                 examples: [
                    ("On the other hand, it's expensive.", "一方で、高い。"),
                    ("On the other hand, it works fast.", "一方で、動作は速い。")
                 ]),
            make("so to speak",
                 "as it were; in a manner of speaking",
                 "言ってみれば・いわば",
                 useCases: ["比喩的に言うとき", "厳密ではないが大まかに表現するとき"],
                 examples: [
                    ("He's our boss, so to speak.", "言ってみれば彼が我々のボスだ。"),
                    ("It's our home, so to speak.", "我々の家のようなものだ。")
                 ]),
            make("for the time being",
                 "for now; temporarily",
                 "当面の間・今のところ",
                 useCases: ["一時的な対応を伝えるとき", "暫定措置を示すとき"],
                 examples: [
                    ("Stay here for the time being.", "当面ここにいて。"),
                    ("This will do for the time being.", "当面はこれで十分。")
                 ]),
            make("no matter what",
                 "regardless of what happens",
                 "何があっても・どんなことがあっても",
                 useCases: ["強い決意を示すとき", "約束や宣言の場面で"],
                 examples: [
                    ("I'll be there, no matter what.", "何があっても行く。"),
                    ("No matter what, I love you.", "何があっても君を愛してる。")
                 ]),
            make("as a result",
                 "because of something that happened",
                 "結果として・その結果",
                 useCases: ["因果関係を述べるとき", "結論を導くとき"],
                 examples: [
                    ("As a result, sales rose.", "結果として売上が上がった。"),
                    ("As a result, he was promoted.", "結果として彼は昇進した。")
                 ]),
            make("to be honest",
                 "speaking truthfully",
                 "正直に言うと",
                 useCases: ["本音を言う前置きに", "率直な意見を述べるとき"],
                 examples: [
                    ("To be honest, I don't like it.", "正直、好きじゃない。"),
                    ("To be honest, I'm tired.", "正直疲れた。")
                 ]),
            make("in the long run",
                 "over a long period of time",
                 "長い目で見れば・長期的には",
                 useCases: ["長期的な視点を強調するとき", "将来の利益を語るとき"],
                 examples: [
                    ("It pays off in the long run.", "長い目で見ると報われる。"),
                    ("It's better in the long run.", "長期的にはこの方が良い。")
                 ])
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
                 ]),
            make("crucial",
                 "extremely important",
                 "極めて重要な・決定的な",
                 useCases: ["重大な決断について話すとき", "不可欠な要素を強調するとき"],
                 examples: [
                    ("Sleep is crucial for health.", "睡眠は健康に不可欠だ。"),
                    ("This is a crucial step.", "これは重要なステップだ。")
                 ]),
            make("tedious",
                 "long, slow, and boring",
                 "退屈で面倒な",
                 useCases: ["単調な作業について話すとき", "時間がかかる作業に文句を言うとき"],
                 examples: [
                    ("The work is tedious.", "その仕事は退屈だ。"),
                    ("A tedious meeting.", "退屈な会議。")
                 ]),
            make("obvious",
                 "easy to see or understand",
                 "明らかな・明白な",
                 useCases: ["明白な事実を指摘するとき", "「言うまでもない」と表現するとき"],
                 examples: [
                    ("It's obvious.", "それは明らかだ。"),
                    ("An obvious mistake.", "明らかなミス。")
                 ]),
            make("reluctant",
                 "unwilling and hesitant",
                 "気が進まない・しぶしぶの",
                 useCases: ["乗り気でないと伝えるとき", "しぶしぶ同意するとき"],
                 examples: [
                    ("He was reluctant to go.", "彼は行きたがらなかった。"),
                    ("A reluctant agreement.", "しぶしぶの同意。")
                 ]),
            make("ambiguous",
                 "open to more than one interpretation",
                 "曖昧な・多義的な",
                 useCases: ["意味や指示が複数解釈できるとき", "立場や表現が不明確なとき"],
                 examples: [
                    ("The answer was ambiguous.", "答えが曖昧だった。"),
                    ("Ambiguous wording.", "あいまいな言い回し。")
                 ]),
            make("spontaneous",
                 "happening naturally without planning",
                 "自然発生的な・思いつきの",
                 useCases: ["計画なしの行動を表すとき", "自発的な反応を表すとき"],
                 examples: [
                    ("A spontaneous trip.", "思いつきの旅行。"),
                    ("Spontaneous laughter.", "自然な笑い。")
                 ]),
            make("vague",
                 "not clear or precise",
                 "漠然とした・あいまいな",
                 useCases: ["説明が具体性に欠けるとき", "記憶があやふやなとき"],
                 examples: [
                    ("I have a vague memory.", "ぼんやりした記憶がある。"),
                    ("A vague answer.", "あいまいな答え。")
                 ]),
            make("peculiar",
                 "strange or unusual",
                 "独特な・奇妙な",
                 useCases: ["変わった特徴を表すとき", "独特の風味や匂いを伝えるとき"],
                 examples: [
                    ("A peculiar smell.", "独特な匂い。"),
                    ("His behavior was peculiar.", "彼の行動は奇妙だった。")
                 ]),
            make("consistent",
                 "always the same; not changing",
                 "一貫した・首尾一貫した",
                 useCases: ["パフォーマンスや方針が安定していると評するとき", "矛盾がないと表すとき"],
                 examples: [
                    ("Be consistent in your work.", "仕事に一貫性を持って。"),
                    ("Consistent results.", "一貫した結果。")
                 ])
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
                 ]),
            make("anticipate",
                 "expect or predict",
                 "予測する・期待する",
                 useCases: ["先読みして準備するとき", "需要や問題を見越すとき"],
                 examples: [
                    ("We anticipate problems.", "問題を予測している。"),
                    ("I anticipated his answer.", "彼の答えを予想していた。")
                 ]),
            make("appreciate",
                 "be thankful; recognize value",
                 "感謝する・価値を認める",
                 useCases: ["お礼を伝えるとき", "物事の価値を理解する場面で"],
                 examples: [
                    ("I appreciate your help.", "助けてくれてありがとう。"),
                    ("I appreciate good music.", "良い音楽が分かる。")
                 ]),
            make("assume",
                 "take for granted without proof",
                 "仮定する・思い込む",
                 useCases: ["証拠なしに信じるとき", "仮の前提を置いて議論するとき"],
                 examples: [
                    ("I assumed you knew.", "君は知っていると思った。"),
                    ("Let's assume it's true.", "それが本当だと仮定しよう。")
                 ]),
            make("clarify",
                 "make something easier to understand",
                 "明確にする・はっきりさせる",
                 useCases: ["説明を補足するとき", "誤解を解くとき"],
                 examples: [
                    ("Could you clarify?", "もう少し詳しく説明してくれる？"),
                    ("Let me clarify my point.", "言いたいことを明確にさせて。")
                 ]),
            make("demonstrate",
                 "show clearly",
                 "示す・実演する",
                 useCases: ["使い方を実演するとき", "能力や事実を証明するとき"],
                 examples: [
                    ("He demonstrated the tool.", "彼は道具の使い方を実演した。"),
                    ("Demonstrate your skill.", "実力を示して。")
                 ]),
            make("emphasize",
                 "give special importance to",
                 "強調する",
                 useCases: ["プレゼンで重要点を伝えるとき", "強く言いたい部分を際立たせるとき"],
                 examples: [
                    ("She emphasized the deadline.", "彼女は締切を強調した。"),
                    ("Let me emphasize this.", "ここを強調させてください。")
                 ]),
            make("evaluate",
                 "judge the value or quality",
                 "評価する・査定する",
                 useCases: ["パフォーマンスや成果を判断するとき", "製品をレビューするとき"],
                 examples: [
                    ("We evaluate employees yearly.", "毎年従業員を評価する。"),
                    ("Evaluate the risks.", "リスクを評価して。")
                 ]),
            make("illustrate",
                 "explain by giving examples",
                 "例示する・図解する",
                 useCases: ["例を挙げて説明するとき", "図やイラストで示すとき"],
                 examples: [
                    ("Let me illustrate with an example.", "例を挙げて説明します。"),
                    ("The graph illustrates the trend.", "グラフが傾向を示している。")
                 ]),
            make("interpret",
                 "explain the meaning; translate spoken words",
                 "解釈する・通訳する",
                 useCases: ["データや出来事の意味を読み解くとき", "会話を別言語に変換するとき"],
                 examples: [
                    ("How do you interpret this?", "これをどう解釈する？"),
                    ("She interprets Japanese.", "彼女は日本語を通訳する。")
                 ]),
            make("justify",
                 "show or prove to be right",
                 "正当化する・理由を示す",
                 useCases: ["行動や決定の理由を説明するとき", "言い訳や弁明をするとき"],
                 examples: [
                    ("Justify your decision.", "あなたの決断の理由を述べて。"),
                    ("He justified his actions.", "彼は自分の行動を正当化した。")
                 ]),
            make("modify",
                 "make small changes",
                 "修正する・変更する",
                 useCases: ["既存の物に変更を加えるとき", "計画やデザインを微調整するとき"],
                 examples: [
                    ("Modify the design.", "デザインを修正して。"),
                    ("We modified the plan.", "計画を変更した。")
                 ]),
            make("negotiate",
                 "discuss to reach an agreement",
                 "交渉する",
                 useCases: ["契約条件を話し合うとき", "価格や妥協点を探るとき"],
                 examples: [
                    ("Let's negotiate the price.", "価格を交渉しよう。"),
                    ("He negotiated a deal.", "彼は契約をまとめた。")
                 ]),
            make("perceive",
                 "become aware; understand in a particular way",
                 "知覚する・捉える",
                 useCases: ["感じ方や受け取り方を表すとき", "客観的な観察を述べるとき"],
                 examples: [
                    ("How do you perceive it?", "君はそれをどう捉える？"),
                    ("He perceived the danger.", "彼は危険を察した。")
                 ]),
            make("preserve",
                 "keep in original or good condition",
                 "保存する・保つ",
                 useCases: ["文化や自然を守るとき", "食品を保存するとき"],
                 examples: [
                    ("Preserve nature.", "自然を守ろう。"),
                    ("Preserve the tradition.", "伝統を守る。")
                 ]),
            make("resemble",
                 "look or be similar to",
                 "似ている",
                 useCases: ["人や物の見た目が似ているとき", "性格や形が似ていると言うとき"],
                 examples: [
                    ("She resembles her mother.", "彼女は母親に似ている。"),
                    ("It resembles a cat.", "それは猫に似ている。")
                 ]),
            make("simulate",
                 "imitate; recreate the appearance",
                 "シミュレートする・模倣する",
                 useCases: ["実験や訓練で疑似体験を行うとき", "状況を再現するとき"],
                 examples: [
                    ("Simulate a real situation.", "実際の状況を再現する。"),
                    ("We simulated the test.", "テストをシミュレートした。")
                 ]),
            make("tolerate",
                 "accept or endure",
                 "我慢する・許容する",
                 useCases: ["不快なことを耐えるとき", "多様性を受け入れる場面で"],
                 examples: [
                    ("I can't tolerate noise.", "騒音には耐えられない。"),
                    ("Tolerate other opinions.", "他の意見を受け入れて。")
                 ]),
            make("underline",
                 "emphasize; draw a line under text",
                 "強調する・下線を引く",
                 useCases: ["重要性を強調するとき", "文書で目立たせる作業を表すとき"],
                 examples: [
                    ("Underline the key points.", "重要なところに下線を。"),
                    ("This underlines the issue.", "このことが問題を浮き彫りにする。")
                 ]),
            make("urge",
                 "strongly encourage",
                 "強く促す・駆り立てる",
                 useCases: ["行動を強く勧めるとき", "切迫した促しを表すとき"],
                 examples: [
                    ("I urge you to act now.", "今すぐ行動するよう強く促す。"),
                    ("She urged me to apply.", "彼女は応募するよう強く勧めた。")
                 ])
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
                 ]),
            make("analysis",
                 "detailed examination",
                 "分析",
                 useCases: ["データや状況を詳しく検討するとき", "レポートや論文の見出しに"],
                 examples: [
                    ("Do an analysis.", "分析して。"),
                    ("Detailed analysis is needed.", "詳細な分析が必要だ。")
                 ]),
            make("assumption",
                 "a thing accepted as true without proof",
                 "仮定・前提・思い込み",
                 useCases: ["議論の出発点となる前提を示すとき", "誤った思い込みを指摘するとき"],
                 examples: [
                    ("That's a wrong assumption.", "それは誤った仮定だ。"),
                    ("Based on the assumption...", "その前提に基づくと…")
                 ]),
            make("benefit",
                 "an advantage or good result",
                 "利益・恩恵・メリット",
                 useCases: ["メリットを説明するとき", "福利厚生や恩恵について話すとき"],
                 examples: [
                    ("What's the benefit?", "どんな利点があるの？"),
                    ("Health benefits.", "健康への恩恵。")
                 ]),
            make("circumstance",
                 "a fact or condition relevant to a situation",
                 "状況・事情",
                 useCases: ["事情や経緯を説明するとき", "「状況によります」と言うとき"],
                 examples: [
                    ("Under the circumstances...", "そういう事情なので…"),
                    ("Special circumstances apply.", "特別な事情がある。")
                 ]),
            make("commitment",
                 "a promise; dedication",
                 "約束・献身・コミットメント",
                 useCases: ["仕事への熱意を示すとき", "約束や責任を果たす姿勢を表すとき"],
                 examples: [
                    ("He has strong commitment.", "彼には強い意志がある。"),
                    ("Make a commitment.", "約束をする。")
                 ]),
            make("consequence",
                 "a result of an action",
                 "結果・影響",
                 useCases: ["行動の影響を説明するとき", "重大さを強調するとき"],
                 examples: [
                    ("Face the consequences.", "結果を受け入れて。"),
                    ("Serious consequences.", "深刻な結果。")
                 ]),
            make("context",
                 "the situation in which something happens",
                 "文脈・状況",
                 useCases: ["言葉の意味を文脈で判断するとき", "背景情報を補足するとき"],
                 examples: [
                    ("Out of context.", "文脈を無視して。"),
                    ("In this context...", "この文脈では…")
                 ]),
            make("criteria",
                 "standards used to judge",
                 "基準（criterionの複数形）",
                 useCases: ["選考や評価の基準を示すとき", "比較する基準を述べるとき"],
                 examples: [
                    ("Meet the criteria.", "基準を満たす。"),
                    ("Evaluation criteria.", "評価基準。")
                 ]),
            make("distinction",
                 "difference; honor",
                 "区別・特色・栄誉",
                 useCases: ["二つの違いを明確にするとき", "優れた成果を称えるとき"],
                 examples: [
                    ("Make a distinction.", "区別をつけて。"),
                    ("Graduated with distinction.", "優秀な成績で卒業した。")
                 ]),
            make("expertise",
                 "special skill or knowledge",
                 "専門知識・専門性",
                 useCases: ["専門分野を説明するとき", "スキルセットをアピールするとき"],
                 examples: [
                    ("His expertise in law.", "彼の法律の専門知識。"),
                    ("We need your expertise.", "君の専門知識が必要だ。")
                 ]),
            make("framework",
                 "a basic structure",
                 "枠組み・骨組み・フレームワーク",
                 useCases: ["計画や考え方の骨組みを話すとき", "ソフトウェアの基盤を指すとき"],
                 examples: [
                    ("A new framework.", "新しい枠組み。"),
                    ("Use a framework.", "フレームワークを使う。")
                 ]),
            make("hypothesis",
                 "a proposed explanation",
                 "仮説",
                 useCases: ["科学的研究で仮説を立てるとき", "議論で仮の説を提示するとき"],
                 examples: [
                    ("Test the hypothesis.", "仮説を検証する。"),
                    ("A bold hypothesis.", "大胆な仮説。")
                 ]),
            make("initiative",
                 "ability to act without being told; new program",
                 "主導権・自発性・新しい取り組み",
                 useCases: ["自発的な行動を取るとき", "新事業や活動を立ち上げるとき"],
                 examples: [
                    ("Take the initiative.", "主導権を握って。"),
                    ("Launch an initiative.", "新たな取り組みを始める。")
                 ]),
            make("milestone",
                 "a significant point in development",
                 "節目・重要な達成",
                 useCases: ["プロジェクトの節目を祝うとき", "人生の重要な出来事について話すとき"],
                 examples: [
                    ("Reach a milestone.", "節目を迎える。"),
                    ("A major milestone.", "大きな節目。")
                 ]),
            make("perspective",
                 "a particular way of viewing things",
                 "視点・観点",
                 useCases: ["別の角度から見るとき", "視野を広げる話をするとき"],
                 examples: [
                    ("From my perspective...", "私の視点では…"),
                    ("Get some perspective.", "視野を広げて。")
                 ]),
            make("priority",
                 "something important that must be dealt with first",
                 "優先順位・優先事項",
                 useCases: ["仕事の優先度を決めるとき", "重要事項を強調するとき"],
                 examples: [
                    ("Set your priorities.", "優先順位を決めて。"),
                    ("Family is my priority.", "家族が一番大切だ。")
                 ]),
            make("tendency",
                 "an inclination to behave in a certain way",
                 "傾向・性向",
                 useCases: ["人の性格や行動パターンを話すとき", "統計的な傾向を述べるとき"],
                 examples: [
                    ("He has a tendency to be late.", "彼は遅刻する傾向がある。"),
                    ("A growing tendency.", "高まる傾向。")
                 ]),
            make("trait",
                 "a distinguishing characteristic",
                 "特徴・特性",
                 useCases: ["性格的な特徴を説明するとき", "遺伝的特性を話すとき"],
                 examples: [
                    ("A good trait.", "良い特徴。"),
                    ("Inherited traits.", "遺伝的特性。")
                 ]),
            make("virtue",
                 "a good moral quality",
                 "美徳・長所",
                 useCases: ["人の良い性質を称えるとき", "「忍耐は美徳」のような言い回しで"],
                 examples: [
                    ("Patience is a virtue.", "忍耐は美徳。"),
                    ("His main virtue.", "彼の主な長所。")
                 ])
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
                 ]),
            make("keep in mind", "remember to consider something",
                 "心に留めておく・覚えておく",
                 useCases: ["注意点を念押しするとき", "後で思い出してほしいことを伝えるとき"],
                 examples: [
                    ("Keep in mind we have a meeting at 3.", "3時に会議あるって覚えといて。"),
                    ("Just keep that in mind.", "それだけ覚えといて。")
                 ]),
            make("on purpose", "intentionally; not by accident",
                 "わざと・意図的に",
                 useCases: ["故意かどうか確認するとき", "意図的な行動を表すとき"],
                 examples: [
                    ("Did you do that on purpose?", "わざとやった？"),
                    ("I broke it on purpose.", "わざと壊したんだ。")
                 ]),
            make("get used to", "become familiar with something",
                 "慣れる",
                 useCases: ["新しい環境に慣れる話をするとき", "時間が経って慣れたと言うとき"],
                 examples: [
                    ("I'm getting used to the new job.", "新しい仕事に慣れてきた。"),
                    ("You'll get used to it.", "そのうち慣れるよ。")
                 ]),
            make("feel free to", "you're welcome to do something",
                 "気軽に〜してね",
                 useCases: ["気軽な行動を促すとき", "丁寧に許可を出すとき"],
                 examples: [
                    ("Feel free to ask me anything.", "何でも気軽に聞いてね。"),
                    ("Feel free to grab a snack.", "好きにお菓子つまんで。")
                 ]),
            make("come in handy", "be useful when needed",
                 "役に立つ・重宝する",
                 useCases: ["後で使えると伝えるとき", "もしもの時に便利だと言うとき"],
                 examples: [
                    ("This will come in handy.", "これ後で役立つよ。"),
                    ("That tip came in handy.", "そのコツ役に立った。")
                 ]),
            make("on second thought", "after reconsidering",
                 "やっぱり・考え直して",
                 useCases: ["決断を変えるとき", "言い直すとき"],
                 examples: [
                    ("On second thought, let's stay home.", "やっぱり家にいよう。"),
                    ("On second thought, I'll skip dessert.", "やっぱりデザートはやめとく。")
                 ]),
            make("in case", "as a precaution; if something happens",
                 "念のため・万一に備えて",
                 useCases: ["保険として準備するとき", "もしもに備えると言うとき"],
                 examples: [
                    ("Bring a jacket in case it's cold.", "寒い時用にジャケット持ってきて。"),
                    ("Just in case.", "念のためね。")
                 ]),
            make("by mistake", "unintentionally; accidentally",
                 "間違って・うっかり",
                 useCases: ["うっかりミスを伝えるとき", "故意でないと釈明するとき"],
                 examples: [
                    ("I texted her by mistake.", "間違えて彼女にメッセージ送った。"),
                    ("I deleted it by mistake.", "間違えて消しちゃった。")
                 ]),
            make("in advance", "ahead of time; beforehand",
                 "事前に・前もって",
                 useCases: ["事前準備の話をするとき", "予約や予告について話すとき"],
                 examples: [
                    ("Let me know in advance.", "前もって教えて。"),
                    ("Thanks in advance.", "先にありがとう。")
                 ]),
            make("out of the blue", "unexpectedly; suddenly",
                 "突然・急に",
                 useCases: ["予期せぬ出来事を伝えるとき", "予告なしの連絡に驚いたとき"],
                 examples: [
                    ("She called me out of the blue.", "急に彼女から電話来たんだ。"),
                    ("It happened out of the blue.", "急に起きたんだ。")
                 ]),
            make("sooner or later", "at some point; eventually",
                 "遅かれ早かれ・いずれ",
                 useCases: ["いずれ起きると伝えるとき", "避けられない結果を予測するとき"],
                 examples: [
                    ("You'll find out sooner or later.", "遅かれ早かれわかるよ。"),
                    ("Sooner or later, he'll quit.", "そのうち彼辞めるよ。")
                 ]),
            make("believe it or not", "you may find this surprising",
                 "信じられないかもしれないけど",
                 useCases: ["驚きの話を切り出すとき", "意外な事実を共有するとき"],
                 examples: [
                    ("Believe it or not, I won.", "信じられないけど勝ったんだ。"),
                    ("Believe it or not, he's 50.", "信じられる？彼50歳なんだ。")
                 ]),
            make("speaking of", "since you mentioned that",
                 "そういえば・〜と言えば",
                 useCases: ["話題を関連事項に繋げるとき", "ふと思い出して話を振るとき"],
                 examples: [
                    ("Speaking of food, I'm hungry.", "食べ物といえばお腹減った。"),
                    ("Speaking of work, did you hear?", "そういえば仕事の話聞いた？")
                 ]),
            make("as usual", "in the same way as normal",
                 "いつものように・相変わらず",
                 useCases: ["普段通りであることを表すとき", "繰り返し起きる事象を述べるとき"],
                 examples: [
                    ("She's late, as usual.", "彼女、いつも通り遅刻。"),
                    ("Same place as usual?", "いつものとこで？")
                 ])
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
                 ]),
            make("workload", "the amount of work to do",
                 "仕事量・業務量",
                 useCases: ["業務の多さを伝えるとき", "誰かに負担を聞くとき"],
                 examples: [
                    ("My workload is crazy this week.", "今週仕事量ヤバい。"),
                    ("Heavy workload again.", "また仕事量多い。")
                 ]),
            make("overtime", "work beyond regular hours",
                 "残業・時間外労働",
                 useCases: ["残業について話すとき", "勤務時間の話をするとき"],
                 examples: [
                    ("I'm working overtime tonight.", "今夜残業だ。"),
                    ("Too much overtime lately.", "最近残業多すぎ。")
                 ]),
            make("colleague", "a person you work with",
                 "同僚",
                 useCases: ["職場の人を紹介するとき", "同じ会社のメンバーを指すとき"],
                 examples: [
                    ("She's my colleague.", "彼女、同僚なんだ。"),
                    ("I had lunch with a colleague.", "同僚とランチした。")
                 ]),
            make("feedback", "comments on something you've done",
                 "フィードバック・意見",
                 useCases: ["意見を求めるとき", "改善点を共有するとき"],
                 examples: [
                    ("Can I get your feedback?", "意見もらえる？"),
                    ("Thanks for the feedback.", "フィードバックありがとう。")
                 ]),
            make("in charge of", "responsible for something",
                 "〜の担当・責任者",
                 useCases: ["責任者を確認するとき", "業務分担を伝えるとき"],
                 examples: [
                    ("Who's in charge of this project?", "この案件誰が担当？"),
                    ("I'm in charge of marketing.", "マーケティング担当してます。")
                 ]),
            make("due to", "because of",
                 "〜のため・〜が原因で",
                 useCases: ["原因を説明するとき", "予定変更の理由を述べるとき"],
                 examples: [
                    ("Delayed due to traffic.", "渋滞で遅れた。"),
                    ("Due to weather, we cancelled.", "天気のせいでキャンセルした。")
                 ]),
            make("approve", "officially agree to something",
                 "承認する・OKを出す",
                 useCases: ["決済や許可を出すとき", "上司の承認待ちの話をするとき"],
                 examples: [
                    ("My boss approved it.", "上司がOK出した。"),
                    ("Has it been approved yet?", "もう承認された？")
                 ]),
            make("decline", "politely refuse",
                 "断る・辞退する",
                 useCases: ["招待や提案を断るとき", "丁寧に拒否するとき"],
                 examples: [
                    ("I had to decline the offer.", "オファー断るしかなかった。"),
                    ("She declined politely.", "彼女は丁寧に断った。")
                 ]),
            make("client", "a customer or person you do work for",
                 "クライアント・顧客",
                 useCases: ["取引先について話すとき", "顧客対応の話題のとき"],
                 examples: [
                    ("The client wants changes.", "クライアントが変更を希望してる。"),
                    ("Big client meeting today.", "今日大事なクライアントとの会議。")
                 ]),
            make("meeting", "a planned discussion with people",
                 "会議・打ち合わせ",
                 useCases: ["打ち合わせの予定を伝えるとき", "ミーティング全般について話すとき"],
                 examples: [
                    ("I have a meeting at 2.", "2時に会議ある。"),
                    ("That meeting was useless.", "あの会議無駄だった。")
                 ]),
            make("presentation", "a talk that explains something",
                 "プレゼン・発表",
                 useCases: ["発表の準備や本番について話すとき", "学校・仕事の場面で"],
                 examples: [
                    ("I'm nervous about the presentation.", "プレゼン緊張する。"),
                    ("Great presentation!", "プレゼンよかった！")
                 ]),
            make("brainstorm", "throw out ideas together",
                 "アイデアを出し合う・ブレストする",
                 useCases: ["新企画の発想会で", "ブレストの場面を表現するとき"],
                 examples: [
                    ("Let's brainstorm some ideas.", "アイデア出し合おう。"),
                    ("We brainstormed for an hour.", "1時間ブレストした。")
                 ]),
            make("on track", "going as planned",
                 "順調に・予定通りに",
                 useCases: ["プロジェクト進捗を伝えるとき", "計画通りと言うとき"],
                 examples: [
                    ("We're on track to finish.", "完了に向けて順調。"),
                    ("Everything's on track.", "全部順調。")
                 ]),
            make("behind schedule", "later than planned",
                 "予定より遅れている",
                 useCases: ["遅延を伝えるとき", "プロジェクトが遅れていると報告するとき"],
                 examples: [
                    ("We're behind schedule.", "予定より遅れてる。"),
                    ("The project is behind schedule.", "プロジェクト遅れてる。")
                 ])
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
                 ]),
            make("cancel", "call off a plan or reservation",
                 "キャンセルする",
                 useCases: ["予定や予約を取り消すとき"],
                 examples: [
                    ("I had to cancel the trip.", "旅行キャンセルしないといけなかった。"),
                    ("They cancelled the flight.", "フライトがキャンセルになった。")
                 ]),
            make("departure", "leaving from a place",
                 "出発",
                 useCases: ["飛行機・電車の出発時刻を確認するとき"],
                 examples: [
                    ("What's your departure time?", "出発何時？"),
                    ("Departure is at 9.", "出発は9時だ。")
                 ]),
            make("arrival", "reaching a place",
                 "到着",
                 useCases: ["到着予定時刻を確認するとき"],
                 examples: [
                    ("Arrival's around 5.", "到着は5時くらい。"),
                    ("Check the arrival board.", "到着案内板見て。")
                 ]),
            make("luggage", "bags you take when traveling",
                 "荷物・手荷物",
                 useCases: ["旅行の荷物について話すとき", "空港でのやり取り"],
                 examples: [
                    ("Don't forget your luggage.", "荷物忘れないで。"),
                    ("My luggage didn't arrive.", "荷物届かなかった。")
                 ]),
            make("head to", "go in the direction of",
                 "〜へ向かう",
                 useCases: ["これから行く場所を伝えるとき"],
                 examples: [
                    ("I'm heading to the airport.", "これから空港に向かう。"),
                    ("Let's head to the cafe.", "カフェに行こう。")
                 ]),
            make("pull over", "stop a car at the side of the road",
                 "路肩に車を寄せる",
                 useCases: ["運転中に止まる必要があるとき", "警察に止められた話をするとき"],
                 examples: [
                    ("Pull over up here.", "ここで止めて。"),
                    ("The cop pulled me over.", "警察に止められた。")
                 ]),
            make("detour", "an alternative route around something",
                 "迂回路・回り道",
                 useCases: ["道路工事や事故で迂回するとき"],
                 examples: [
                    ("There's a detour ahead.", "この先迂回路あるよ。"),
                    ("We had to take a detour.", "迂回するしかなかった。")
                 ]),
            make("shortcut", "a quicker route",
                 "近道・ショートカット",
                 useCases: ["最短ルートを提案するとき"],
                 examples: [
                    ("I know a shortcut.", "近道知ってる。"),
                    ("Take the shortcut.", "近道使って。")
                 ]),
            make("in the middle of", "currently doing something",
                 "〜の最中・〜している途中",
                 useCases: ["何かをやっている途中だと伝えるとき"],
                 examples: [
                    ("I'm in the middle of something.", "ちょっと今手が離せない。"),
                    ("In the middle of dinner.", "今ご飯中。")
                 ]),
            make("all set", "ready; everything's done",
                 "準備万端・もう大丈夫",
                 useCases: ["準備完了を確認するとき", "支払い完了などを伝えるとき"],
                 examples: [
                    ("Are you all set?", "準備できた？"),
                    ("We're all set.", "準備OK。")
                 ]),
            make("check in", "register on arrival",
                 "チェックインする",
                 useCases: ["ホテルや空港でチェックインするとき", "出勤時の打刻"],
                 examples: [
                    ("Let's check in at the hotel.", "ホテルでチェックインしよう。"),
                    ("I'll check in online.", "オンラインでチェックインする。")
                 ]),
            make("check out", "leave; or take a look at",
                 "チェックアウトする・見てみる",
                 useCases: ["ホテルを出るとき", "新しいものを見てみてと言うとき"],
                 examples: [
                    ("I'll check out at 11.", "11時にチェックアウトする。"),
                    ("Check out this song.", "この曲聴いてみて。")
                 ]),
            make("on the way", "in the process of going somewhere",
                 "向かっている途中・道中で",
                 useCases: ["移動中であることを伝えるとき"],
                 examples: [
                    ("I'm on the way.", "今向かってる。"),
                    ("On the way home now.", "今帰り道。")
                 ]),
            make("in person", "face to face, not online",
                 "直接・対面で",
                 useCases: ["会って話したいとき", "オンラインではなく対面と区別するとき"],
                 examples: [
                    ("Let's talk in person.", "直接会って話そう。"),
                    ("I want to meet in person.", "実際に会いたい。")
                 ])
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
                 ]),
            make("discount", "a reduction in price",
                 "割引・値引き",
                 useCases: ["値引きについて話すとき"],
                 examples: [
                    ("Any discount?", "割引ある？"),
                    ("They gave me a discount.", "割引してくれた。")
                 ]),
            make("refund", "money returned to you",
                 "返金",
                 useCases: ["返品時の返金を求めるとき"],
                 examples: [
                    ("Can I get a refund?", "返金できる？"),
                    ("I want a refund.", "返金してほしい。")
                 ]),
            make("split the bill", "divide the cost evenly",
                 "割り勘する",
                 useCases: ["友達と食事代を分けるとき"],
                 examples: [
                    ("Let's split the bill.", "割り勘しよう。"),
                    ("Split the bill, OK?", "割り勘でいい？")
                 ]),
            make("on sale", "available at a reduced price",
                 "セール中・特価で",
                 useCases: ["セール商品を見つけたとき"],
                 examples: [
                    ("It's on sale!", "セール中だ！"),
                    ("These shoes are on sale.", "この靴セール中。")
                 ]),
            make("receipt", "proof of purchase",
                 "レシート・領収書",
                 useCases: ["買い物のレシートをやり取りするとき"],
                 examples: [
                    ("Can I have the receipt?", "レシートもらえる？"),
                    ("Save the receipt.", "レシート取っといて。")
                 ]),
            make("expense", "money spent",
                 "経費・出費",
                 useCases: ["費用について話すとき", "出費が大きいと嘆くとき"],
                 examples: [
                    ("That's a big expense.", "それ大きい出費だ。"),
                    ("I'll claim it as an expense.", "経費で落とす。")
                 ]),
            make("service charge", "an extra fee for service",
                 "サービス料",
                 useCases: ["レストランの請求を確認するとき"],
                 examples: [
                    ("There's a service charge.", "サービス料込みだ。"),
                    ("Service charge is 10%.", "サービス料は10%。")
                 ]),
            make("out of stock", "no longer available",
                 "在庫切れ",
                 useCases: ["商品が買えないとき"],
                 examples: [
                    ("It's out of stock.", "在庫切れだ。"),
                    ("Sorry, it's out of stock.", "ごめん、在庫切れ。")
                 ]),
            make("warranty", "a guarantee on a product",
                 "保証",
                 useCases: ["保証期間について話すとき"],
                 examples: [
                    ("Is there a warranty?", "保証ある？"),
                    ("It's still under warranty.", "まだ保証期間内だ。")
                 ])
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
                 ]),
            make("prescription", "doctor's note for medicine",
                 "処方箋",
                 useCases: ["薬を処方されたとき"],
                 examples: [
                    ("I need to fill my prescription.", "処方箋出さないと。"),
                    ("Got a prescription from the doctor.", "医者から処方箋もらった。")
                 ]),
            make("symptom", "a sign of illness",
                 "症状",
                 useCases: ["体調不良を医者に説明するとき"],
                 examples: [
                    ("What are your symptoms?", "症状は？"),
                    ("Cold-like symptoms.", "風邪っぽい症状。")
                 ]),
            make("appointment", "a scheduled meeting",
                 "予約・アポ",
                 useCases: ["医者や美容院のアポを取るとき"],
                 examples: [
                    ("I have an appointment at 2.", "2時にアポある。"),
                    ("Book an appointment.", "予約取って。")
                 ]),
            make("sore", "painful, especially muscle pain",
                 "痛い・筋肉痛で",
                 useCases: ["体が痛いと伝えるとき"],
                 examples: [
                    ("My legs are sore.", "脚が痛い。"),
                    ("I've got a sore throat.", "喉が痛い。")
                 ]),
            make("workout", "a session of exercise",
                 "トレーニング・運動",
                 useCases: ["運動について話すとき"],
                 examples: [
                    ("Good workout today.", "今日のトレ良かった。"),
                    ("I'm done with my workout.", "トレ終わった。")
                 ]),
            make("stress out", "feel very stressed",
                 "ストレスがたまる・イライラする",
                 useCases: ["仕事や生活のストレスを話すとき"],
                 examples: [
                    ("Don't stress out.", "ストレスためないで。"),
                    ("I'm super stressed out.", "めっちゃストレスたまってる。")
                 ]),
            make("diet", "what you eat; eating plan",
                 "食事・ダイエット",
                 useCases: ["食事制限の話をするとき"],
                 examples: [
                    ("I'm on a diet.", "ダイエット中。"),
                    ("Bad for your diet.", "ダイエットに悪いよ。")
                 ]),
            make("fall asleep", "drift off to sleep",
                 "寝落ちする・眠ってしまう",
                 useCases: ["寝てしまった話をするとき"],
                 examples: [
                    ("I fell asleep on the couch.", "ソファで寝落ちした。"),
                    ("Don't fall asleep!", "寝るな！")
                 ]),
            make("wake up", "stop sleeping",
                 "起きる・目を覚ます",
                 useCases: ["朝の習慣を話すとき"],
                 examples: [
                    ("I wake up at 6.", "6時に起きる。"),
                    ("Wake up!", "起きろ！")
                 ])
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
                 ]),
            make("upload", "send a file from your device",
                 "アップロードする",
                 useCases: ["ファイルやデータを送るとき"],
                 examples: [
                    ("I'll upload it later.", "あとでアップする。"),
                    ("Upload finished.", "アップロード終わった。")
                 ]),
            make("log in", "sign into an account",
                 "ログインする",
                 useCases: ["アカウントにアクセスするとき"],
                 examples: [
                    ("I can't log in.", "ログインできない。"),
                    ("Just log in here.", "ここでログインして。")
                 ]),
            make("sign up", "create a new account",
                 "登録する・サインアップする",
                 useCases: ["新規アカウント作成のとき"],
                 examples: [
                    ("Did you sign up?", "登録した？"),
                    ("Sign up for free.", "無料登録できるよ。")
                 ]),
            make("update", "make something more current",
                 "アップデート・更新する",
                 useCases: ["ソフトの更新の話", "近況の最新情報を伝えるとき"],
                 examples: [
                    ("Update your app.", "アプリ更新して。"),
                    ("Got an update?", "なんか進捗ある？")
                 ]),
            make("crash", "stop working unexpectedly",
                 "クラッシュする・落ちる",
                 useCases: ["アプリやPCが落ちたとき"],
                 examples: [
                    ("My app keeps crashing.", "アプリよく落ちる。"),
                    ("The system crashed.", "システムが落ちた。")
                 ]),
            make("swipe", "drag your finger across the screen",
                 "スワイプする",
                 useCases: ["スマホの操作を伝えるとき"],
                 examples: [
                    ("Swipe right to like.", "右にスワイプでいいね。"),
                    ("Just swipe up.", "上にスワイプして。")
                 ]),
            make("settings", "options to control the app/device",
                 "設定",
                 useCases: ["アプリやデバイスの設定を確認するとき"],
                 examples: [
                    ("Check your settings.", "設定見て。"),
                    ("It's in the settings.", "設定の中にあるよ。")
                 ]),
            make("backup", "a copy of data for safety",
                 "バックアップ",
                 useCases: ["データを保存するとき"],
                 examples: [
                    ("Did you back up your phone?", "携帯バックアップ取った？"),
                    ("I lost the backup.", "バックアップ消えた。")
                 ]),
            make("notification", "an alert from an app",
                 "通知",
                 useCases: ["通知設定や通知音について話すとき"],
                 examples: [
                    ("Turn off notifications.", "通知切って。"),
                    ("I missed your notification.", "通知見落とした。")
                 ])
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
                 ]),
            make("meanwhile", "at the same time",
                 "その間に・一方で",
                 useCases: ["並行して別のことが起きていると伝えるとき"],
                 examples: [
                    ("I cooked. Meanwhile, she set the table.", "料理してる間に彼女がテーブル準備した。"),
                    ("Meanwhile, let's wait.", "とりあえず待とう。")
                 ]),
            make("these days", "currently; in the recent period",
                 "最近・このごろ",
                 useCases: ["近況を伝えるとき"],
                 examples: [
                    ("I've been busy these days.", "最近忙しい。"),
                    ("It's hot these days.", "最近暑い。")
                 ]),
            make("the other day", "recently in the past",
                 "先日・この前",
                 useCases: ["過去のちょっと前の出来事を話すとき"],
                 examples: [
                    ("I saw him the other day.", "この前彼に会った。"),
                    ("The other day, I went hiking.", "先日ハイキング行った。")
                 ]),
            make("in a row", "consecutively",
                 "連続して・続けて",
                 useCases: ["連続記録について話すとき"],
                 examples: [
                    ("Three days in a row.", "3日連続。"),
                    ("I won 5 in a row.", "5回連続で勝った。")
                 ]),
            make("from now on", "starting at this moment",
                 "今後は・これから先",
                 useCases: ["習慣を変えると宣言するとき"],
                 examples: [
                    ("From now on, I'll be early.", "これからは早めに行く。"),
                    ("From now on, no junk food.", "これからジャンクフード禁止。")
                 ]),
            make("a while ago", "some time in the past",
                 "少し前に・しばらく前に",
                 useCases: ["少し前の出来事を伝えるとき"],
                 examples: [
                    ("She left a while ago.", "彼女ちょっと前に出た。"),
                    ("I texted you a while ago.", "少し前にメッセージ送ったよ。")
                 ]),
            make("any minute now", "very soon",
                 "今にも・もうすぐ",
                 useCases: ["何かが起きる直前に"],
                 examples: [
                    ("He should be here any minute now.", "彼すぐ来るはず。"),
                    ("It'll start any minute now.", "今にも始まる。")
                 ]),
            make("every now and then", "occasionally",
                 "時々・たまに",
                 useCases: ["たまに起きることを話すとき"],
                 examples: [
                    ("I see her every now and then.", "彼女には時々会う。"),
                    ("Every now and then I cook.", "たまに料理する。")
                 ]),
            make("way too", "excessively",
                 "あまりにも〜すぎる",
                 useCases: ["強調して文句や驚きを言うとき"],
                 examples: [
                    ("It's way too cold.", "寒すぎ。"),
                    ("Way too expensive.", "高すぎ。")
                 ])
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
                 ]),
            make("disagree", "have a different opinion",
                 "反対する・同意しない",
                 useCases: ["反対意見を述べるとき"],
                 examples: [
                    ("I disagree, honestly.", "正直反対だな。"),
                    ("They disagreed on everything.", "彼ら全部で意見合わなかった。")
                 ]),
            make("convince", "make someone believe or agree",
                 "説得する・納得させる",
                 useCases: ["相手を説得する場面で"],
                 examples: [
                    ("I convinced her to come.", "彼女説得して連れてきた。"),
                    ("Convince me.", "納得させて。")
                 ]),
            make("argue", "exchange opposing views; quarrel",
                 "議論する・言い争う",
                 useCases: ["口論や議論を表すとき"],
                 examples: [
                    ("They were arguing again.", "また言い合いしてた。"),
                    ("Don't argue with me.", "言い返さないで。")
                 ]),
            make("complain", "express dissatisfaction",
                 "文句を言う・不満を述べる",
                 useCases: ["不満を述べるとき"],
                 examples: [
                    ("Stop complaining.", "文句言うのやめて。"),
                    ("She complained about the food.", "彼女料理に文句言ってた。")
                 ]),
            make("explain", "make something clear",
                 "説明する",
                 useCases: ["何かを分かりやすく伝えるとき"],
                 examples: [
                    ("Can you explain it?", "説明してくれる？"),
                    ("Let me explain.", "説明させて。")
                 ]),
            make("mention", "refer to something briefly",
                 "ちょっと触れる・言及する",
                 useCases: ["話題にちらっと触れるとき"],
                 examples: [
                    ("Did she mention it?", "彼女それ言ってた？"),
                    ("Just mentioned it briefly.", "ちらっと言っただけ。")
                 ]),
            make("reply", "respond to a message",
                 "返信する・返事する",
                 useCases: ["メッセージや問い合わせに返事するとき"],
                 examples: [
                    ("I'll reply later.", "あとで返信する。"),
                    ("She didn't reply.", "彼女返事くれなかった。")
                 ]),
            make("swear", "promise strongly; or curse",
                 "誓う・罵り言葉を使う",
                 useCases: ["強く約束するとき", "口の悪さを注意する場面"],
                 examples: [
                    ("I swear I didn't do it.", "やってないって誓う。"),
                    ("Don't swear.", "口悪くしないで。")
                 ]),
            make("whisper", "speak very quietly",
                 "ささやく・小声で話す",
                 useCases: ["小声で話すとき"],
                 examples: [
                    ("She whispered something.", "彼女何かささやいた。"),
                    ("Why are you whispering?", "なんでひそひそ話してるの？")
                 ])
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
                 ]),
            make("lend", "give with the expectation of return",
                 "貸す",
                 useCases: ["人に物を貸すとき"],
                 examples: [
                    ("I'll lend it to you.", "貸してあげるよ。"),
                    ("Can you lend me $5?", "5ドル貸してくれる？")
                 ]),
            make("return", "give back; come back",
                 "返す・返却する・戻る",
                 useCases: ["借りた物を戻すとき", "店に返品するとき"],
                 examples: [
                    ("I'll return it tomorrow.", "明日返す。"),
                    ("Returned the book.", "本返した。")
                 ]),
            make("share", "use or have something jointly",
                 "共有する・分け合う",
                 useCases: ["物や情報をシェアするとき"],
                 examples: [
                    ("Let's share the pizza.", "ピザシェアしよう。"),
                    ("Share the link.", "リンク共有して。")
                 ]),
            make("reach", "get in touch with; arrive at",
                 "連絡を取る・到達する",
                 useCases: ["連絡が取れるか確認するとき", "目的地に着く場面で"],
                 examples: [
                    ("I couldn't reach her.", "彼女に連絡取れなかった。"),
                    ("We finally reached the top.", "ついに頂上に着いた。")
                 ])
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
                 ]),
            make("rule out", "exclude as a possibility",
                 "除外する・可能性を排除する",
                 useCases: ["選択肢から外すとき", "原因を絞り込むとき"],
                 examples: [
                    ("Let's rule out food poisoning first.", "まず食中毒は除外しよう。"),
                    ("I wouldn't rule it out.", "可能性は否定しないよ。")
                 ]),
            make("bring about", "cause something to happen",
                 "引き起こす・もたらす",
                 useCases: ["変化や結果を引き起こすとき"],
                 examples: [
                    ("Tech brought about huge change.", "テクノロジーが大きな変化をもたらした。"),
                    ("It brought about a new era.", "新しい時代をもたらした。")
                 ]),
            make("carry on", "continue doing something",
                 "続ける",
                 useCases: ["作業を続けてと伝えるとき", "継続を促すとき"],
                 examples: [
                    ("Carry on with what you were doing.", "やってたこと続けて。"),
                    ("Just carry on, I'll catch up.", "先進んで、追いつくから。")
                 ]),
            make("look after", "take care of someone or something",
                 "世話をする・面倒を見る",
                 useCases: ["子どもやペットの世話", "誰かのケアを頼むとき"],
                 examples: [
                    ("Can you look after my dog?", "うちの犬の世話お願いできる？"),
                    ("She looks after her mom.", "彼女はお母さんの世話してる。")
                 ]),
            make("look up", "search for information; raise your eyes",
                 "調べる・見上げる",
                 useCases: ["辞書やネットで情報を調べるとき", "上を見上げる動作"],
                 examples: [
                    ("Look it up online.", "ネットで調べて。"),
                    ("Look up at the stars.", "星を見上げてみて。")
                 ]),
            make("look down on", "regard as inferior",
                 "見下す",
                 useCases: ["他人を軽く扱う態度を表すとき"],
                 examples: [
                    ("Don't look down on him.", "彼を見下さないで。"),
                    ("She looks down on us.", "彼女は私たちを見下してる。")
                 ]),
            make("take after", "resemble a family member",
                 "（家族に）似ている",
                 useCases: ["親や親戚に似ていると言うとき"],
                 examples: [
                    ("She takes after her mom.", "彼女はお母さん似だ。"),
                    ("You really take after your dad.", "君、お父さんにそっくり。")
                 ]),
            make("take in", "understand; absorb; let in",
                 "理解する・受け入れる",
                 useCases: ["情報を頭に入れるとき", "誰かを家に迎え入れるとき"],
                 examples: [
                    ("Hard to take in all at once.", "一度に全部理解するのは難しい。"),
                    ("They took in a stray cat.", "彼ら、野良猫を引き取った。")
                 ]),
            make("take off", "depart; remove; gain popularity",
                 "離陸する・脱ぐ・人気が出る",
                 useCases: ["飛行機の出発", "服を脱ぐとき", "ヒットする話"],
                 examples: [
                    ("The flight just took off.", "便、たった今離陸した。"),
                    ("Take off your shoes.", "靴脱いで。")
                 ]),
            make("take on", "accept a task or challenge",
                 "引き受ける・挑む",
                 useCases: ["新しい仕事を引き受けるとき"],
                 examples: [
                    ("She took on the project.", "彼女、その案件引き受けた。"),
                    ("Take on the challenge.", "その挑戦受けて立てよ。")
                 ]),
            make("take up", "start a hobby; occupy space or time",
                 "始める（趣味を）・占める",
                 useCases: ["新しい趣味を始める話", "場所や時間を取るとき"],
                 examples: [
                    ("I took up yoga.", "ヨガ始めた。"),
                    ("This takes up too much room.", "これ場所取りすぎ。")
                 ]),
            make("put up with", "tolerate something annoying",
                 "我慢する・耐える",
                 useCases: ["不快なことを我慢する話"],
                 examples: [
                    ("I can't put up with the noise.", "この騒音は我慢できない。"),
                    ("She puts up with a lot.", "彼女はいろいろ我慢してる。")
                 ]),
            make("put down", "place down; criticize harshly",
                 "置く・けなす",
                 useCases: ["物を下に置くとき", "誰かを馬鹿にするとき"],
                 examples: [
                    ("Put it down here.", "ここに置いて。"),
                    ("Stop putting him down.", "彼をけなすのやめて。")
                 ]),
            make("put together", "assemble; organize",
                 "組み立てる・まとめる",
                 useCases: ["家具を組み立てる", "資料や計画をまとめる"],
                 examples: [
                    ("I put together a slideshow.", "スライド作った。"),
                    ("Help me put this together.", "これ組み立てるの手伝って。")
                 ]),
            make("put aside", "set apart; save for later",
                 "脇に置く・取っておく",
                 useCases: ["後で使う物を取っておくとき", "感情を一旦置いておくとき"],
                 examples: [
                    ("Put aside some money each month.", "毎月少しずつ貯金してる。"),
                    ("Let's put that aside for now.", "今はそれ脇に置いとこう。")
                 ]),
            make("get over", "recover from something",
                 "乗り越える・克服する",
                 useCases: ["失恋や病気から立ち直る話"],
                 examples: [
                    ("Get over it!", "もう忘れなよ。"),
                    ("I'm finally getting over the flu.", "やっとインフルから回復してきた。")
                 ]),
            make("get through", "finish or survive a difficult thing",
                 "やり遂げる・通り抜ける",
                 useCases: ["大変な期間を乗り切る話"],
                 examples: [
                    ("We got through the week.", "なんとか今週乗り切った。"),
                    ("I'll get through this somehow.", "なんとかこれを乗り切る。")
                 ]),
            make("get by", "manage to survive with what you have",
                 "何とかやっていく",
                 useCases: ["最低限の生活でしのぐ話"],
                 examples: [
                    ("We get by on a small budget.", "少ない予算でやりくりしてる。"),
                    ("I'm just getting by.", "なんとか食いつないでる。")
                 ]),
            make("get ahead", "advance or succeed",
                 "先に進む・出世する",
                 useCases: ["キャリアで成功する話"],
                 examples: [
                    ("She works hard to get ahead.", "彼女は出世のために頑張ってる。"),
                    ("Just trying to get ahead.", "前に進もうとしてるだけ。")
                 ]),
            make("make out", "understand; perceive",
                 "理解する・見分ける",
                 useCases: ["小さな声や字を読み取る話"],
                 examples: [
                    ("I can't make out what he's saying.", "彼が何言ってるか分からない。"),
                    ("Can you make out the sign?", "あの標識読める？")
                 ]),
            make("make do", "manage with what you have",
                 "間に合わせる・代用する",
                 useCases: ["足りない物で済ますとき"],
                 examples: [
                    ("We'll have to make do.", "間に合わせるしかない。"),
                    ("Make do with what you've got.", "あるもので何とかして。")
                 ]),
            make("wear out", "exhaust; become worn",
                 "すり減らす・疲れさせる",
                 useCases: ["疲れ切ったとき", "靴や服が古くなるとき"],
                 examples: [
                    ("The kids wore me out.", "子どもたちにヘトヘトにされた。"),
                    ("My shoes are worn out.", "靴がボロボロだ。")
                 ]),
            make("carry through", "complete a task to the end",
                 "やり遂げる",
                 useCases: ["最後までやり通すとき"],
                 examples: [
                    ("She carried it through.", "彼女は最後までやり遂げた。"),
                    ("Carry the plan through.", "計画を最後までやり通して。")
                 ]),
            make("pull through", "survive a tough situation",
                 "困難を乗り越える",
                 useCases: ["病気や危機から回復する話"],
                 examples: [
                    ("He pulled through the surgery.", "彼は手術を乗り越えた。"),
                    ("We'll pull through this.", "これ乗り越えられるよ。")
                 ]),
            make("pull up", "stop a vehicle; bring up",
                 "車を停める・引き上げる",
                 useCases: ["車を寄せて停めるとき", "椅子を寄せるとき"],
                 examples: [
                    ("Pull up over there.", "あそこに停めて。"),
                    ("Pull up a chair.", "椅子持ってきて座って。")
                 ]),
            make("pull together", "cooperate as a team",
                 "力を合わせる",
                 useCases: ["チームで頑張る話"],
                 examples: [
                    ("Let's pull together.", "みんなで力合わせよう。"),
                    ("They pulled together to win.", "彼らは力を合わせて勝った。")
                 ]),
            make("set aside", "save or reserve",
                 "取っておく・脇に置く",
                 useCases: ["お金や時間を確保する話"],
                 examples: [
                    ("Set aside some time.", "ちょっと時間取っといて。"),
                    ("I set aside money for travel.", "旅行用にお金取ってある。")
                 ]),
            make("set off", "depart; trigger something",
                 "出発する・引き起こす",
                 useCases: ["旅行に出発する話", "アラームを鳴らす場面"],
                 examples: [
                    ("We set off at dawn.", "夜明けに出発した。"),
                    ("That set off the alarm.", "それでアラーム鳴った。")
                 ]),
            make("set out", "begin a journey or task",
                 "出発する・着手する",
                 useCases: ["何かに取り組み始めるとき"],
                 examples: [
                    ("We set out to find a solution.", "解決策を探し始めた。"),
                    ("They set out early.", "彼らは早めに出発した。")
                 ])
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
                 ]),
            make("a tough cookie", "a strong, resilient person",
                 "タフな人・芯の強い人",
                 useCases: ["逆境に強い人を表すとき"],
                 examples: [
                    ("She's a tough cookie.", "彼女は芯が強い。"),
                    ("Don't worry, he's a tough cookie.", "心配しないで、彼タフだから。")
                 ]),
            make("the last straw", "the final irritation that causes a reaction",
                 "我慢の限界",
                 useCases: ["もう耐えられないと言うとき"],
                 examples: [
                    ("That was the last straw.", "もう限界。"),
                    ("This is the last straw for me.", "これが最後の堪忍袋の緒だ。")
                 ]),
            make("a wild goose chase", "a pointless pursuit",
                 "無駄足・的外れな追跡",
                 useCases: ["徒労に終わった追跡を表すとき"],
                 examples: [
                    ("It was a wild goose chase.", "完全に無駄足だった。"),
                    ("He sent us on a wild goose chase.", "彼に振り回された。")
                 ]),
            make("add fuel to the fire", "make a bad situation worse",
                 "火に油を注ぐ",
                 useCases: ["状況を悪化させる発言や行動"],
                 examples: [
                    ("That just added fuel to the fire.", "それで火に油注いだ。"),
                    ("Don't add fuel to the fire.", "火に油注ぐようなことしないで。")
                 ]),
            make("let bygones be bygones", "let the past be the past",
                 "過去のことは水に流す",
                 useCases: ["仲直りや和解の場面で"],
                 examples: [
                    ("Let's let bygones be bygones.", "過去のことは水に流そう。"),
                    ("Just let bygones be bygones.", "もう昔のことだから。")
                 ]),
            make("water under the bridge", "something past and forgotten",
                 "過ぎたこと",
                 useCases: ["昔のトラブルを蒸し返さないとき"],
                 examples: [
                    ("It's all water under the bridge.", "全部もう過ぎたことだ。"),
                    ("That's water under the bridge now.", "それはもう昔の話。")
                 ]),
            make("don't judge a book by its cover", "don't judge by appearance",
                 "見かけで判断するな",
                 useCases: ["第一印象で人を判断しないよう諭すとき"],
                 examples: [
                    ("Don't judge a book by its cover.", "見た目で判断しないで。"),
                    ("Hey, don't judge a book by its cover.", "見かけだけで決めるなよ。")
                 ]),
            make("the apple of my eye", "someone you cherish",
                 "大切な人・宝物",
                 useCases: ["最愛の人を表すとき"],
                 examples: [
                    ("She's the apple of my eye.", "彼女は私の宝物。"),
                    ("He's the apple of his mom's eye.", "彼はお母さんの宝物だ。")
                 ]),
            make("break the news", "share important news",
                 "ニュースを伝える",
                 useCases: ["重要な知らせを切り出すとき"],
                 examples: [
                    ("I had to break the news.", "知らせを伝えるしかなかった。"),
                    ("Who's gonna break the news?", "誰が伝える？")
                 ]),
            make("caught red-handed", "caught in the act",
                 "現行犯で捕まる",
                 useCases: ["悪いことをしている最中に見つかる場面"],
                 examples: [
                    ("They caught him red-handed.", "彼、現行犯で捕まった。"),
                    ("Caught red-handed!", "現行犯！")
                 ]),
            make("once and for all", "definitively; finally",
                 "きっぱりと・最終的に",
                 useCases: ["はっきり決着をつけるとき"],
                 examples: [
                    ("Let's settle this once and for all.", "これ、はっきり決着つけよう。"),
                    ("Once and for all, no.", "もう最後、ノーだ。")
                 ]),
            make("out of the woods", "past a difficult phase",
                 "危機を脱した",
                 useCases: ["困難な状況を抜けた話"],
                 examples: [
                    ("We're not out of the woods yet.", "まだ油断はできない。"),
                    ("He's out of the woods.", "彼はもう大丈夫。")
                 ]),
            make("off the hook", "freed from responsibility",
                 "責任を免れた",
                 useCases: ["面倒事から逃れた話"],
                 examples: [
                    ("Looks like I'm off the hook.", "私はお咎めなしみたい。"),
                    ("You're off the hook this time.", "今回は許してあげる。")
                 ]),
            make("on thin ice", "in a risky situation",
                 "危険な状況にある",
                 useCases: ["失敗が許されない状況の話"],
                 examples: [
                    ("You're on thin ice.", "君、もう後がないよ。"),
                    ("I'm on thin ice with my boss.", "上司との関係がヤバい。")
                 ]),
            make("in the dark", "uninformed",
                 "知らされていない",
                 useCases: ["情報共有されていないと不満を言うとき"],
                 examples: [
                    ("I'm totally in the dark.", "全然知らされてない。"),
                    ("They kept us in the dark.", "彼らは私たちに知らせなかった。")
                 ]),
            make("walking on eggshells", "being very careful around someone",
                 "慎重に振る舞う・腫れ物に触るよう",
                 useCases: ["気難しい人に気を遣う話"],
                 examples: [
                    ("I'm walking on eggshells around her.", "彼女に気を遣いまくり。"),
                    ("Stop walking on eggshells.", "そんな気を遣わなくていいよ。")
                 ]),
            make("rain check", "a deferred invitation",
                 "また今度・延期",
                 useCases: ["誘いを断りつつ次回に約束するとき"],
                 examples: [
                    ("Can I take a rain check?", "また今度でもいい？"),
                    ("I'll take a rain check.", "また誘って。")
                 ]),
            make("a long shot", "an unlikely possibility",
                 "望み薄・一か八か",
                 useCases: ["可能性が低いが試す話"],
                 examples: [
                    ("It's a long shot.", "可能性低いけど。"),
                    ("That's a long shot at best.", "一か八かだね。")
                 ]),
            make("kill two birds with one stone", "achieve two goals at once",
                 "一石二鳥",
                 useCases: ["1つの行動で2つの効果を狙うとき"],
                 examples: [
                    ("Kill two birds with one stone.", "一石二鳥だね。"),
                    ("Let's kill two birds with one stone.", "ついでに済ませよう。")
                 ]),
            make("the tip of the iceberg", "a small visible part of a bigger problem",
                 "氷山の一角",
                 useCases: ["問題の一部しか見えていない話"],
                 examples: [
                    ("That's just the tip of the iceberg.", "それは氷山の一角だ。"),
                    ("Tip of the iceberg, honestly.", "正直、氷山の一角。")
                 ]),
            make("a drop in the bucket", "a tiny insignificant amount",
                 "焼け石に水",
                 useCases: ["対策が小さすぎると評するとき"],
                 examples: [
                    ("It's just a drop in the bucket.", "焼け石に水だ。"),
                    ("That's a drop in the bucket.", "そんなの全然足りない。")
                 ]),
            make("easier said than done", "talking is easier than doing",
                 "言うは易し",
                 useCases: ["簡単に言うけど実行は難しいと反論するとき"],
                 examples: [
                    ("Easier said than done.", "言うのは簡単だよね。"),
                    ("Yeah, easier said than done.", "うん、それ言うほど簡単じゃない。")
                 ]),
            make("actions speak louder than words", "what you do matters more than what you say",
                 "行動は言葉より雄弁",
                 useCases: ["口だけの人に対して使うとき"],
                 examples: [
                    ("Actions speak louder than words.", "行動が大事だよ。"),
                    ("Remember, actions speak louder than words.", "言葉より行動だよ。")
                 ]),
            make("when pigs fly", "something that will never happen",
                 "そんなことありえない",
                 useCases: ["絶対起こらないと冗談で言うとき"],
                 examples: [
                    ("Yeah, when pigs fly.", "うん、そんなのありえない。"),
                    ("He'll apologize when pigs fly.", "彼が謝るなんて天地がひっくり返ってもない。")
                 ])
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
                 ]),
            make("worn out", "very tired",
                 "疲れ果てた・くたくた",
                 useCases: ["疲労困憊を表すとき"],
                 examples: [
                    ("I'm worn out.", "もうクタクタ。"),
                    ("Worn out from work.", "仕事で疲れ果てた。")
                 ]),
            make("stuck up", "arrogant; snobbish",
                 "高慢な・お高くとまった",
                 useCases: ["態度が偉そうな人を批評するとき"],
                 examples: [
                    ("She's so stuck up.", "彼女、すごい上から目線。"),
                    ("Don't be stuck up.", "そんなお高く止まらないで。")
                 ]),
            make("laid back", "relaxed; easygoing",
                 "のんびりした",
                 useCases: ["リラックスした性格を表すとき"],
                 examples: [
                    ("He's super laid back.", "彼、めっちゃのんびりしてる。"),
                    ("A laid back vibe.", "のんびりした雰囲気。")
                 ]),
            make("uptight", "tense; overly strict",
                 "神経質な・堅苦しい",
                 useCases: ["緊張しすぎた態度を表すとき"],
                 examples: [
                    ("Don't be so uptight.", "そんなに固くならないで。"),
                    ("He's pretty uptight.", "彼ちょっと堅すぎ。")
                 ]),
            make("easygoing", "relaxed and tolerant",
                 "大らかな・気楽な",
                 useCases: ["性格を褒めるとき"],
                 examples: [
                    ("She's so easygoing.", "彼女、すごく大らか。"),
                    ("Easygoing personality.", "気楽な性格だよ。")
                 ]),
            make("outgoing", "sociable; extroverted",
                 "社交的な",
                 useCases: ["人との交流が好きな性格を表すとき"],
                 examples: [
                    ("She's really outgoing.", "彼女、すごく社交的。"),
                    ("Are you outgoing?", "社交的なほう？")
                 ]),
            make("picky", "very selective",
                 "好き嫌いが激しい・うるさい",
                 useCases: ["食べ物や好みのこだわりを表すとき"],
                 examples: [
                    ("He's a picky eater.", "彼は好き嫌い多い。"),
                    ("Don't be so picky.", "そんなにうるさく言うな。")
                 ]),
            make("stubborn", "refusing to change one's mind",
                 "頑固な",
                 useCases: ["意見を曲げない人を表すとき"],
                 examples: [
                    ("He's so stubborn.", "彼、頑固すぎ。"),
                    ("Don't be stubborn.", "頑固にならないで。")
                 ]),
            make("humble", "modest; not arrogant",
                 "謙虚な",
                 useCases: ["控えめな人を褒めるとき"],
                 examples: [
                    ("She's really humble.", "彼女はすごく謙虚。"),
                    ("Stay humble.", "謙虚でいて。")
                 ]),
            make("brave", "showing courage",
                 "勇敢な・勇気のある",
                 useCases: ["勇気ある行動を称えるとき"],
                 examples: [
                    ("That was brave of you.", "勇敢だったね。"),
                    ("Be brave.", "勇気出して。")
                 ]),
            make("shy", "reserved around others",
                 "内気な・恥ずかしがり",
                 useCases: ["人見知りを表すとき"],
                 examples: [
                    ("I'm a bit shy.", "ちょっと内気なんだ。"),
                    ("Don't be shy.", "恥ずかしがらないで。")
                 ]),
            make("awkward", "uncomfortable; clumsy socially",
                 "気まずい・ぎこちない",
                 useCases: ["変な空気を表すとき", "ぎこちない動作を言うとき"],
                 examples: [
                    ("That was so awkward.", "あれ気まずかった。"),
                    ("It feels awkward.", "なんか気まずい。")
                 ]),
            make("clumsy", "awkward in movement",
                 "不器用な・ドジな",
                 useCases: ["失敗が多い人を表すとき"],
                 examples: [
                    ("Sorry, I'm clumsy.", "ごめん、不器用なんだ。"),
                    ("Clumsy me!", "私ったらドジ！")
                 ]),
            make("mature", "developed; grown up",
                 "成熟した・大人びた",
                 useCases: ["精神的に大人な人を表すとき"],
                 examples: [
                    ("She's so mature for her age.", "彼女、年の割に大人びてる。"),
                    ("That's not very mature.", "それ大人げないよ。")
                 ]),
            make("selfish", "thinking only of oneself",
                 "利己的な・自分勝手な",
                 useCases: ["自己中心的な行動を批判するとき"],
                 examples: [
                    ("Don't be selfish.", "自分勝手にならないで。"),
                    ("That's selfish of him.", "彼ったら自己中。")
                 ]),
            make("generous", "willing to give",
                 "寛大な・気前のいい",
                 useCases: ["気前よくおごってくれる人を褒めるとき"],
                 examples: [
                    ("That's so generous of you.", "本当に気前いいね。"),
                    ("He's a generous guy.", "彼は気前のいい人。")
                 ]),
            make("reliable", "dependable; trustworthy",
                 "信頼できる",
                 useCases: ["頼れる人を表すとき"],
                 examples: [
                    ("He's super reliable.", "彼はめっちゃ頼れる。"),
                    ("A reliable friend.", "信頼できる友達。")
                 ]),
            make("stunning", "extremely impressive or beautiful",
                 "見事な・素晴らしい",
                 useCases: ["美しさや出来栄えを褒めるとき"],
                 examples: [
                    ("You look stunning.", "めっちゃきれい。"),
                    ("Stunning view!", "絶景！")
                 ]),
            make("decent", "satisfactory; respectable",
                 "まともな・きちんとした",
                 useCases: ["最低限十分な質を表すとき"],
                 examples: [
                    ("That's a decent meal.", "まあまあいい食事。"),
                    ("He's a decent guy.", "彼はちゃんとした人だ。")
                 ])
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
                 ]),
            make("suit yourself", "do what you want",
                 "好きにすれば",
                 useCases: ["相手の決定に呆れて任せるとき"],
                 examples: [
                    ("Fine, suit yourself.", "好きにしなよ。"),
                    ("Suit yourself, then.", "じゃあ勝手にして。")
                 ]),
            make("whatever", "I don't care",
                 "どうでもいい・なんでも",
                 useCases: ["興味がないと示すとき"],
                 examples: [
                    ("Whatever, it doesn't matter.", "別にどうでもいい。"),
                    ("Whatever you want.", "君の好きにして。")
                 ]),
            make("says who", "who said that?",
                 "誰がそう言った？",
                 useCases: ["主張に反論するとき"],
                 examples: [
                    ("Says who?", "誰がそう言った？"),
                    ("Yeah, says who?", "は？誰がそう言ったの？")
                 ]),
            make("for real", "seriously; truly",
                 "マジで・本当に",
                 useCases: ["本気か確認するとき", "強調するとき"],
                 examples: [
                    ("Are you for real?", "マジで言ってる？"),
                    ("For real, it was awesome.", "本当に最高だった。")
                 ]),
            make("kind of", "somewhat; a little",
                 "ちょっと・なんとなく",
                 useCases: ["はっきり言わずぼかすとき"],
                 examples: [
                    ("Kind of tired.", "ちょっと疲れた。"),
                    ("It's kind of weird.", "なんか変だよ。")
                 ]),
            make("sort of", "somewhat; like",
                 "みたいな・ちょっと",
                 useCases: ["曖昧に表現したいとき"],
                 examples: [
                    ("Sort of, yeah.", "まあ、そんな感じ。"),
                    ("It's sort of like a hat.", "帽子みたいなものだ。")
                 ]),
            make("and stuff", "and other things",
                 "などなど",
                 useCases: ["列挙の最後に省略するとき"],
                 examples: [
                    ("Snacks, drinks, and stuff.", "お菓子とか飲み物とか。"),
                    ("Books and stuff.", "本とかいろいろ。")
                 ]),
            make("or something", "or something like that",
                 "か何か",
                 useCases: ["はっきりしない代替を示すとき"],
                 examples: [
                    ("Coffee or something?", "コーヒーか何か？"),
                    ("She's a doctor or something.", "彼女医者か何かだ。")
                 ]),
            make("you know what", "let me tell you",
                 "あのね・ちょっと聞いて",
                 useCases: ["話を切り出すとき"],
                 examples: [
                    ("You know what, forget it.", "ねえ、もういいや。"),
                    ("You know what? I'm done.", "あのさ、もう無理。")
                 ]),
            make("guess what", "I have surprising news",
                 "何だと思う？",
                 useCases: ["驚きの話を切り出すとき"],
                 examples: [
                    ("Guess what! I got the job.", "聞いて！採用された！"),
                    ("Guess what happened.", "何が起きたと思う？")
                 ]),
            make("here we go", "we're about to start",
                 "さあ始めるよ",
                 useCases: ["始まりの合図として"],
                 examples: [
                    ("Here we go!", "さあ行くぞ！"),
                    ("Okay, here we go.", "よし、始めよう。")
                 ]),
            make("there you go", "exactly; well done",
                 "そうそう・そんな感じ",
                 useCases: ["相手の理解や成功を称えるとき"],
                 examples: [
                    ("There you go!", "そう、それでいい！"),
                    ("There you go, you did it.", "ほら、できたじゃん。")
                 ]),
            make("look here", "hey; listen",
                 "おい・ねえ",
                 useCases: ["注意を引きたいとき", "やや強めに呼びかけるとき"],
                 examples: [
                    ("Look here, I told you no.", "おい、ダメって言っただろ。"),
                    ("Look here, listen up.", "ねえ、ちょっと聞いて。")
                 ]),
            make("how come", "why",
                 "なんで？",
                 useCases: ["カジュアルに理由を聞くとき"],
                 examples: [
                    ("How come you're late?", "なんで遅れたの？"),
                    ("How come?", "なんで？")
                 ])
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
                 ]),
            make("at the end of the day", "ultimately",
                 "結局のところ",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("At the end of the day, we tried.", "結局のところ、頑張ったよ。"),
                    ("At the end of the day, it's up to you.", "最終的には君次第だ。")
                 ]),
            make("when push comes to shove", "when it really matters",
                 "いざという時",
                 useCases: ["最後の局面の話をするとき"],
                 examples: [
                    ("When push comes to shove, he'll help.", "いざという時、彼は助けてくれる。"),
                    ("When push comes to shove, decide quickly.", "いざとなったら即決して。")
                 ]),
            make("come hell or high water", "no matter what happens",
                 "何があっても",
                 useCases: ["強い決意を表すとき"],
                 examples: [
                    ("I'll be there, come hell or high water.", "何があっても行く。"),
                    ("Come hell or high water, we finish.", "何があってもやり遂げる。")
                 ]),
            make("be that as it may", "even if that's true",
                 "それはともかく",
                 useCases: ["話題を切り替えつつ前提は認めるとき"],
                 examples: [
                    ("Be that as it may, we have to go.", "そうかもしれないけど、行かないと。"),
                    ("Be that as it may, I disagree.", "それはともかく、私は反対。")
                 ]),
            make("for what it's worth", "I'm not sure if this helps, but...",
                 "役に立つかわからないけど",
                 useCases: ["控えめに意見を伝えるとき"],
                 examples: [
                    ("For what it's worth, I think you're right.", "参考までに、君が正しいと思うよ。"),
                    ("For what it's worth, sorry.", "気休めだけど、ごめん。")
                 ]),
            make("to put it mildly", "saying it gently",
                 "控えめに言って",
                 useCases: ["強い表現をやわらげるとき"],
                 examples: [
                    ("It was bad, to put it mildly.", "控えめに言ってひどかった。"),
                    ("To put it mildly, awkward.", "控えめに言って気まずい。")
                 ]),
            make("to put it bluntly", "speaking frankly",
                 "率直に言って",
                 useCases: ["遠慮なく本音を言うとき"],
                 examples: [
                    ("To put it bluntly, you're wrong.", "率直に言って間違ってる。"),
                    ("To put it bluntly, no.", "はっきり言うと、無理。")
                 ]),
            make("needless to say", "obviously",
                 "言うまでもなく",
                 useCases: ["当然のことを強調するとき"],
                 examples: [
                    ("Needless to say, I was happy.", "言うまでもなく嬉しかった。"),
                    ("Needless to say, it works.", "もちろん、ちゃんと動く。")
                 ]),
            make("mind you", "by the way; just so you know",
                 "言っとくけど・断っておくが",
                 useCases: ["補足や注意を加えるとき"],
                 examples: [
                    ("Mind you, it wasn't easy.", "言っておくけど、簡単じゃなかった。"),
                    ("It was great, mind you.", "ちなみに最高だったよ。")
                 ])
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
                 ]),
            make("wash up", "clean dishes; or be carried ashore",
                 "洗い物をする・漂着する",
                 useCases: ["食後の片付けの話", "海に漂着した物の話"],
                 examples: [
                    ("I'll wash up after dinner.", "夕食後、洗い物するね。"),
                    ("A bottle washed up on the beach.", "瓶が浜辺に漂着した。")
                 ]),
            make("wake up to", "become aware of something",
                 "〜に気づく・目覚める",
                 useCases: ["問題の重大さに気づくとき"],
                 examples: [
                    ("People are waking up to climate change.", "みんな気候変動に気づき始めてる。"),
                    ("Wake up to reality.", "現実を見ろ。")
                 ]),
            make("turn up", "appear; increase volume",
                 "現れる・音量を上げる",
                 useCases: ["人が突然来た話", "音量を上げる場面"],
                 examples: [
                    ("She turned up late.", "彼女、遅れて現れた。"),
                    ("Turn up the music.", "音楽の音量上げて。")
                 ]),
            make("turn over", "flip; hand over",
                 "ひっくり返す・引き渡す",
                 useCases: ["物を裏返すとき", "鍵などを引き渡す場面"],
                 examples: [
                    ("Turn the page over.", "ページめくって。"),
                    ("He turned over the keys.", "彼は鍵を渡した。")
                 ]),
            make("turn against", "become hostile to",
                 "敵対する・反発する",
                 useCases: ["味方が敵に回る場面"],
                 examples: [
                    ("They turned against him.", "彼らは彼に反発した。"),
                    ("Don't turn against me.", "敵に回らないで。")
                 ]),
            make("stop by", "make a quick visit",
                 "立ち寄る",
                 useCases: ["軽く寄っていく話"],
                 examples: [
                    ("I'll stop by later.", "あとでちょっと寄るね。"),
                    ("Stop by anytime.", "いつでも寄って。")
                 ]),
            make("stick to", "stay loyal to; cling",
                 "固執する・くっつく",
                 useCases: ["決めたことを守る話"],
                 examples: [
                    ("Stick to the plan.", "計画通りに進めて。"),
                    ("Stick to the rules.", "ルールを守って。")
                 ]),
            make("stick with", "continue with the same choice",
                 "そのまま続ける",
                 useCases: ["同じものを使い続ける話"],
                 examples: [
                    ("I'll stick with coffee.", "コーヒーのままでいいや。"),
                    ("Just stick with it.", "そのまま続けて。")
                 ]),
            make("stand by", "wait; support",
                 "待機する・支持する",
                 useCases: ["待機する場面", "誰かを支える話"],
                 examples: [
                    ("Stand by for updates.", "更新を待って。"),
                    ("I stand by him.", "彼を支持する。")
                 ]),
            make("stand for", "represent; symbolize",
                 "表す・象徴する",
                 useCases: ["略語の意味を聞くとき"],
                 examples: [
                    ("What does NASA stand for?", "NASAって何の略？"),
                    ("It stands for love.", "それは愛を象徴してる。")
                 ]),
            make("stand out", "be noticeable",
                 "目立つ",
                 useCases: ["群衆の中で目立つ話"],
                 examples: [
                    ("She really stands out.", "彼女、すごく目立つ。"),
                    ("This one stands out.", "これは目立つね。")
                 ]),
            make("slow down", "reduce speed",
                 "速度を落とす・ゆっくりする",
                 useCases: ["急ぎすぎを止めるとき"],
                 examples: [
                    ("Slow down, you're going too fast.", "落ち着いて、速すぎる。"),
                    ("I need to slow down.", "ペース落とさないと。")
                 ]),
            make("show off", "boast or display proudly",
                 "見せびらかす",
                 useCases: ["自慢する人を表すとき"],
                 examples: [
                    ("He's just showing off.", "彼、自慢してるだけ。"),
                    ("Don't show off.", "見せびらかさないで。")
                 ]),
            make("shut down", "close; stop operating",
                 "閉鎖する・停止する",
                 useCases: ["店や工場を閉める話", "PCを切るとき"],
                 examples: [
                    ("They shut down the store.", "店を閉めた。"),
                    ("Shut it down.", "停止して。")
                 ]),
            make("shut up", "stop talking",
                 "黙る",
                 useCases: ["強めに黙ってと言うとき"],
                 examples: [
                    ("Shut up!", "黙って！"),
                    ("Just shut up already.", "もういい加減黙って。")
                 ]),
            make("roll out", "release or launch something",
                 "展開する・発表する",
                 useCases: ["新製品や機能をリリースするとき"],
                 examples: [
                    ("They rolled out the new feature.", "新機能をリリースした。"),
                    ("Rolling out next week.", "来週公開するよ。")
                 ]),
            make("rip up", "tear into pieces",
                 "破り捨てる",
                 useCases: ["紙をビリビリ破る話"],
                 examples: [
                    ("He ripped up the letter.", "彼、手紙を破り捨てた。"),
                    ("Don't rip it up!", "破かないで！")
                 ]),
            make("rest assured", "be confident about",
                 "安心してください",
                 useCases: ["保証を伝える丁寧な言い方"],
                 examples: [
                    ("Rest assured, it's safe.", "安心して、安全だから。"),
                    ("Rest assured, we'll handle it.", "ご安心を、こちらで対応します。")
                 ]),
            make("read up on", "study a topic carefully",
                 "〜について詳しく読む",
                 useCases: ["特定のテーマを下調べする話"],
                 examples: [
                    ("I read up on it last night.", "昨晩それについて調べた。"),
                    ("Read up on the topic.", "そのテーマを下調べして。")
                 ]),
            make("plug in", "connect to a power source",
                 "プラグを差し込む",
                 useCases: ["電源を入れる動作"],
                 examples: [
                    ("Plug in the charger.", "充電器差して。"),
                    ("It's plugged in.", "コンセント刺さってるよ。")
                 ]),
            make("pile up", "accumulate",
                 "積み重なる・たまる",
                 useCases: ["仕事や書類が溜まる話"],
                 examples: [
                    ("Work is piling up.", "仕事が溜まってる。"),
                    ("Bills are piling up.", "請求書が積み上がってる。")
                 ]),
            make("patch up", "repair; reconcile",
                 "修復する・仲直りする",
                 useCases: ["関係を修復する話"],
                 examples: [
                    ("They patched things up.", "彼ら仲直りした。"),
                    ("Patch up the hole.", "穴を直して。")
                 ]),
            make("opt out", "choose not to participate",
                 "選ばない・脱退する",
                 useCases: ["参加しない選択をする話"],
                 examples: [
                    ("I opted out of the trip.", "旅行は不参加にした。"),
                    ("You can opt out anytime.", "いつでも辞退できる。")
                 ]),
            make("opt for", "choose something",
                 "〜を選ぶ",
                 useCases: ["選択肢から選ぶ話"],
                 examples: [
                    ("I opted for tea.", "紅茶にした。"),
                    ("She opted for the larger size.", "彼女は大きいサイズを選んだ。")
                 ]),
            make("mess up", "make a mistake; ruin",
                 "しくじる・台無しにする",
                 useCases: ["失敗を伝えるとき"],
                 examples: [
                    ("I really messed up.", "完全にやらかした。"),
                    ("Don't mess this up.", "これ台無しにしないで。")
                 ]),
            make("lighten up", "relax; cheer up",
                 "元気を出す・気楽になる",
                 useCases: ["重い空気を和らげるとき"],
                 examples: [
                    ("Lighten up, it's a joke.", "気楽に、冗談だよ。"),
                    ("Just lighten up.", "リラックスして。")
                 ]),
            make("let down", "disappoint",
                 "失望させる",
                 useCases: ["期待を裏切られた話"],
                 examples: [
                    ("Don't let me down.", "がっかりさせないで。"),
                    ("He let me down again.", "彼にまた裏切られた。")
                 ]),
            make("lash out", "attack verbally or violently",
                 "激しく非難する・八つ当たりする",
                 useCases: ["怒って人に当たる話"],
                 examples: [
                    ("He lashed out at me.", "彼、私に八つ当たりした。"),
                    ("Don't lash out.", "感情的に当たらないで。")
                 ]),
            make("iron out", "resolve issues; smooth over",
                 "解決する・調整する",
                 useCases: ["問題点を整える話"],
                 examples: [
                    ("Let's iron out the details.", "細部を詰めよう。"),
                    ("We need to iron out a few things.", "いくつか調整しないと。")
                 ])
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
                 ]),
            make("prohibit", "officially forbid",
                 "禁止する",
                 useCases: ["公式に禁止されている事柄"],
                 examples: [
                    ("Smoking is prohibited here.", "ここは禁煙です。"),
                    ("They prohibit pets.", "ペット禁止だ。")
                 ]),
            make("promote", "encourage; raise in rank",
                 "促進する・昇進させる",
                 useCases: ["売り込みや昇進の話"],
                 examples: [
                    ("She got promoted.", "彼女、昇進した。"),
                    ("They promote teamwork.", "チームワークを推進してる。")
                 ]),
            make("propose", "suggest; ask to marry",
                 "提案する・プロポーズする",
                 useCases: ["案を出すとき", "結婚を申し込む場面"],
                 examples: [
                    ("I propose a toast.", "乾杯を提案するよ。"),
                    ("He proposed last night.", "昨夜彼がプロポーズした。")
                 ]),
            make("provide", "supply; give what's needed",
                 "提供する",
                 useCases: ["サービスや物を提供するとき"],
                 examples: [
                    ("We provide free Wi-Fi.", "無料Wi-Fiあります。"),
                    ("They provided meals.", "食事を出してくれた。")
                 ]),
            make("purchase", "buy something",
                 "購入する",
                 useCases: ["フォーマルに買い物の話をするとき"],
                 examples: [
                    ("I purchased a new laptop.", "新しいPCを買った。"),
                    ("Where did you purchase it?", "どこで買ったの？")
                 ]),
            make("pursue", "follow or chase after",
                 "追求する・追いかける",
                 useCases: ["夢やキャリアを追う話"],
                 examples: [
                    ("She pursued her dream.", "彼女は夢を追いかけた。"),
                    ("Pursue what you love.", "好きなことを追求して。")
                 ]),
            make("qualify", "meet requirements",
                 "資格を得る・適合する",
                 useCases: ["条件を満たして資格を得る話"],
                 examples: [
                    ("Do I qualify for this?", "これに該当する？"),
                    ("He qualified for the finals.", "彼は決勝に進出した。")
                 ]),
            make("rebuild", "build again",
                 "再建する",
                 useCases: ["建物や関係を建て直す話"],
                 examples: [
                    ("They rebuilt the house.", "家を建て直した。"),
                    ("Rebuild your confidence.", "自信を取り戻して。")
                 ]),
            make("refer to", "mention; consult",
                 "言及する・参照する",
                 useCases: ["資料を参照する場面", "話題を指す場面"],
                 examples: [
                    ("Refer to the manual.", "マニュアルを見て。"),
                    ("She referred to the article.", "彼女はその記事に触れた。")
                 ]),
            make("reflect", "show; think deeply",
                 "反映する・熟考する",
                 useCases: ["鏡や水面に映る話", "じっくり考える話"],
                 examples: [
                    ("It reflects your effort.", "あなたの努力が表れてる。"),
                    ("Take time to reflect.", "じっくり考えて。")
                 ]),
            make("regret", "feel sorry for an action",
                 "後悔する",
                 useCases: ["過去の行動を悔やむとき"],
                 examples: [
                    ("I regret saying that.", "あれ言ったの後悔してる。"),
                    ("No regrets.", "後悔はない。")
                 ]),
            make("rely on", "depend on for support",
                 "頼る・依存する",
                 useCases: ["信頼して任せる話"],
                 examples: [
                    ("You can rely on me.", "私を頼っていいよ。"),
                    ("She relies on her car.", "彼女は車に頼ってる。")
                 ]),
            make("remind", "make someone remember",
                 "思い出させる",
                 useCases: ["相手にリマインドする場面"],
                 examples: [
                    ("Remind me later.", "あとで言って。"),
                    ("It reminds me of home.", "家を思い出すよ。")
                 ]),
            make("replace", "put something in another's place",
                 "取り替える・代わりにする",
                 useCases: ["故障した物を交換する話"],
                 examples: [
                    ("Replace the battery.", "電池替えて。"),
                    ("Nothing can replace her.", "彼女の代わりはいない。")
                 ]),
            make("represent", "stand for; act on behalf of",
                 "代表する・表す",
                 useCases: ["代表して発言・行動する話"],
                 examples: [
                    ("She represents our team.", "彼女が私たちのチームを代表する。"),
                    ("This logo represents us.", "このロゴが我々を表す。")
                 ]),
            make("request", "ask for formally",
                 "要請する・依頼する",
                 useCases: ["丁寧にお願いするとき"],
                 examples: [
                    ("I'd like to request a meeting.", "会議をお願いしたいです。"),
                    ("Request approved.", "依頼は承認された。")
                 ]),
            make("require", "need; demand",
                 "必要とする",
                 useCases: ["条件として必要なものを示すとき"],
                 examples: [
                    ("This requires patience.", "これには忍耐が必要だ。"),
                    ("ID is required.", "身分証必須。")
                 ]),
            make("reveal", "make known; uncover",
                 "明かす・暴露する",
                 useCases: ["秘密を打ち明けるとき"],
                 examples: [
                    ("He revealed the truth.", "彼は真実を明かした。"),
                    ("Don't reveal the ending.", "結末バラさないで。")
                 ]),
            make("rush", "hurry; charge forward",
                 "急ぐ・突進する",
                 useCases: ["急いでいる場面"],
                 examples: [
                    ("Don't rush.", "急がなくていいよ。"),
                    ("I'm in a rush.", "急いでるんだ。")
                 ])
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
                 ]),
            make("apparent", "clearly visible or understood",
                 "明らかな・見たところの",
                 useCases: ["明白な事実を述べるとき"],
                 examples: [
                    ("It's apparent he's lying.", "彼が嘘ついてるのは明らかだ。"),
                    ("No apparent reason.", "明確な理由はない。")
                 ]),
            make("arrogant", "having too much pride",
                 "傲慢な",
                 useCases: ["態度が偉そうな人を批判するとき"],
                 examples: [
                    ("He's so arrogant.", "彼、めっちゃ傲慢。"),
                    ("Don't be arrogant.", "傲慢にならないで。")
                 ]),
            make("awful", "very bad",
                 "ひどい・最悪な",
                 useCases: ["強く否定的な評価を伝えるとき"],
                 examples: [
                    ("That's awful.", "それひどい。"),
                    ("The food was awful.", "料理がひどかった。")
                 ]),
            make("brilliant", "very smart; outstanding",
                 "素晴らしい・優秀な",
                 useCases: ["賞賛するとき"],
                 examples: [
                    ("Brilliant idea!", "素晴らしいアイデア！"),
                    ("She's brilliant.", "彼女は優秀だ。")
                 ]),
            make("bold", "brave; daring",
                 "大胆な",
                 useCases: ["勇気ある決断や発言を表すとき"],
                 examples: [
                    ("That's a bold move.", "それは大胆な行動だ。"),
                    ("Be bold.", "大胆にいこう。")
                 ]),
            make("cautious", "careful; wary",
                 "慎重な",
                 useCases: ["危険を避けて慎重に動く話"],
                 examples: [
                    ("Be cautious.", "慎重にね。"),
                    ("She's cautious by nature.", "彼女は元々慎重なタイプ。")
                 ]),
            make("chaotic", "very disorganized",
                 "混沌とした",
                 useCases: ["大混乱の状況を表すとき"],
                 examples: [
                    ("The room was chaotic.", "部屋がカオスだった。"),
                    ("It's been chaotic at work.", "仕事がてんやわんや。")
                 ]),
            make("competitive", "wanting to win",
                 "競争心の強い",
                 useCases: ["勝負好きな性格を表すとき"],
                 examples: [
                    ("He's super competitive.", "彼、すごい負けず嫌い。"),
                    ("It's a competitive market.", "競争の激しい市場だ。")
                 ]),
            make("complex", "having many parts; not simple",
                 "複雑な",
                 useCases: ["難しい問題やシステムを表すとき"],
                 examples: [
                    ("It's a complex issue.", "複雑な問題だ。"),
                    ("Pretty complex.", "結構複雑。")
                 ]),
            make("confident", "self-assured",
                 "自信のある",
                 useCases: ["自信ある態度を表すとき"],
                 examples: [
                    ("She's so confident.", "彼女、自信に満ちてる。"),
                    ("I'm confident about it.", "自信があるよ。")
                 ]),
            make("considerate", "thinking of others",
                 "思いやりのある",
                 useCases: ["他人の立場を考える人を褒めるとき"],
                 examples: [
                    ("That's considerate of you.", "気を遣ってくれてありがとう。"),
                    ("He's very considerate.", "彼はすごく思いやりがある。")
                 ]),
            make("convenient", "easy to use; well located",
                 "便利な",
                 useCases: ["都合がいい場所や時間"],
                 examples: [
                    ("Super convenient location.", "立地めっちゃ便利。"),
                    ("Whatever's convenient.", "都合のいい時で。")
                 ]),
            make("creative", "showing imagination",
                 "創造的な・クリエイティブな",
                 useCases: ["独創性を褒めるとき"],
                 examples: [
                    ("Very creative idea!", "とても独創的なアイデア！"),
                    ("She's so creative.", "彼女、すごくクリエイティブ。")
                 ]),
            make("curious", "eager to know",
                 "好奇心旺盛な",
                 useCases: ["興味津々な様子を表すとき"],
                 examples: [
                    ("I'm curious about it.", "気になる。"),
                    ("She's a curious kid.", "彼女、好奇心旺盛な子だ。")
                 ]),
            make("delicate", "fragile; subtle",
                 "繊細な・壊れやすい",
                 useCases: ["扱いに注意がいる物や問題"],
                 examples: [
                    ("It's delicate.", "壊れやすいよ。"),
                    ("A delicate situation.", "デリケートな状況。")
                 ]),
            make("dependent", "needing support",
                 "依存している",
                 useCases: ["他者や物に頼っている状態"],
                 examples: [
                    ("He's dependent on coffee.", "彼コーヒー依存だ。"),
                    ("Too dependent on her phone.", "携帯に依存しすぎ。")
                 ]),
            make("desperate", "having no hope; reckless",
                 "必死の・絶望的な",
                 useCases: ["切羽詰まった状況を表すとき"],
                 examples: [
                    ("I was desperate.", "必死だった。"),
                    ("Desperate times.", "厳しい時代だ。")
                 ]),
            make("diverse", "varied; from many different sources",
                 "多様な",
                 useCases: ["バラエティ豊かな構成を表すとき"],
                 examples: [
                    ("A diverse team.", "多様性のあるチーム。"),
                    ("Tokyo is super diverse.", "東京はすごく多様性がある。")
                 ]),
            make("dynamic", "active; full of energy",
                 "動的な・活発な",
                 useCases: ["勢いがあるものや人を表すとき"],
                 examples: [
                    ("A dynamic speaker.", "エネルギッシュな話し手。"),
                    ("Dynamic environment.", "動きのある職場。")
                 ])
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
                 ]),
            make("alternative", "another option",
                 "代替案・別の選択肢",
                 useCases: ["他の選択肢を提案するとき"],
                 examples: [
                    ("Any alternative?", "他の選択肢ある？"),
                    ("A vegan alternative.", "ビーガン用の代替品。")
                 ]),
            make("approach", "way of doing; come closer",
                 "アプローチ・近づくこと",
                 useCases: ["やり方や戦略を話すとき"],
                 examples: [
                    ("Different approach.", "違うアプローチ。"),
                    ("Try a new approach.", "新しい方法でやってみて。")
                 ]),
            make("awareness", "knowledge of something",
                 "意識・認識",
                 useCases: ["問題への注目を高める話"],
                 examples: [
                    ("Raise awareness.", "意識を高める。"),
                    ("Lack of awareness.", "認識不足。")
                 ]),
            make("boundary", "a limit; a line dividing two areas",
                 "境界・限界",
                 useCases: ["人間関係の境界線", "区域の境を話すとき"],
                 examples: [
                    ("Set boundaries.", "線引きしよう。"),
                    ("Cross the boundary.", "境界を越える。")
                 ]),
            make("challenge", "a difficult task; a dare",
                 "挑戦・難題",
                 useCases: ["新しい挑戦に取り組む話"],
                 examples: [
                    ("Big challenge ahead.", "大きな挑戦が待ってる。"),
                    ("I love a challenge.", "挑戦が好きなんだ。")
                 ]),
            make("conclusion", "the end or final decision",
                 "結論",
                 useCases: ["話し合いをまとめるとき"],
                 examples: [
                    ("In conclusion, yes.", "結論としてはYES。"),
                    ("Jumped to a conclusion.", "結論を急いだ。")
                 ]),
            make("concern", "worry; matter of interest",
                 "心配・関心事",
                 useCases: ["懸念を表明するとき"],
                 examples: [
                    ("That's my concern.", "それが気になってる。"),
                    ("Cause for concern.", "心配の種。")
                 ]),
            make("conflict", "a serious disagreement",
                 "対立・衝突",
                 useCases: ["意見や価値観の衝突を表すとき"],
                 examples: [
                    ("There's a conflict.", "対立がある。"),
                    ("Avoid conflict.", "もめるのは避けよう。")
                 ]),
            make("diversity", "variety; different kinds",
                 "多様性",
                 useCases: ["人や文化の多様性について話すとき"],
                 examples: [
                    ("Diversity matters.", "多様性は大事。"),
                    ("Cultural diversity.", "文化の多様性。")
                 ]),
            make("emergency", "an urgent serious situation",
                 "緊急事態",
                 useCases: ["急ぎの危険な事態の話"],
                 examples: [
                    ("It's an emergency.", "緊急事態だ。"),
                    ("In case of emergency.", "緊急時には。")
                 ]),
            make("encounter", "an unexpected meeting",
                 "出会い・遭遇",
                 useCases: ["珍しい出会いの話"],
                 examples: [
                    ("A strange encounter.", "奇妙な出会い。"),
                    ("Brief encounter.", "短い出会い。")
                 ]),
            make("evidence", "facts that prove something",
                 "証拠",
                 useCases: ["主張の裏付けを話すとき"],
                 examples: [
                    ("No evidence yet.", "まだ証拠がない。"),
                    ("Strong evidence.", "強い証拠だ。")
                 ]),
            make("experience", "knowledge from doing things",
                 "経験",
                 useCases: ["過去の体験や実績を話すとき"],
                 examples: [
                    ("Great experience.", "いい経験だった。"),
                    ("Years of experience.", "何年もの経験。")
                 ]),
            make("exception", "something different from the rule",
                 "例外",
                 useCases: ["ルールから外れた事例を示すとき"],
                 examples: [
                    ("With one exception.", "1つだけ例外あり。"),
                    ("No exceptions.", "例外なし。")
                 ])
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
                 ]),
            make("for the sake of", "for the purpose of",
                 "〜のために",
                 useCases: ["目的を強調するとき"],
                 examples: [
                    ("For the sake of clarity.", "明確にするために。"),
                    ("For the sake of peace.", "平和のために。")
                 ]),
            make("at any rate", "in any case; anyway",
                 "とにかく・いずれにせよ",
                 useCases: ["話を前に進めるとき"],
                 examples: [
                    ("At any rate, let's go.", "とにかく行こう。"),
                    ("At any rate, it's done.", "いずれにせよ終わった。")
                 ]),
            make("in spite of", "despite",
                 "〜にもかかわらず",
                 useCases: ["逆境を踏まえて結果を述べるとき"],
                 examples: [
                    ("In spite of the rain, we went.", "雨にもかかわらず行った。"),
                    ("In spite of everything.", "何があっても。")
                 ]),
            make("as opposed to", "in contrast to",
                 "〜とは対照的に",
                 useCases: ["2つの選択肢を対比するとき"],
                 examples: [
                    ("Tea, as opposed to coffee.", "コーヒーじゃなくて紅茶ね。"),
                    ("As opposed to last year.", "去年と対照的に。")
                 ]),
            make("with respect to", "regarding",
                 "〜に関して",
                 useCases: ["フォーマルに話題を導入するとき"],
                 examples: [
                    ("With respect to your question...", "ご質問に関しては…"),
                    ("With respect to safety.", "安全面に関して。")
                 ]),
            make("in the wake of", "as a result of; just after",
                 "〜の余波で・直後に",
                 useCases: ["出来事の影響を受けた状況を伝えるとき"],
                 examples: [
                    ("In the wake of the crisis.", "危機の余波で。"),
                    ("In the wake of the storm.", "嵐の直後に。")
                 ]),
            make("at odds with", "in disagreement with",
                 "〜と対立して",
                 useCases: ["意見が衝突している話"],
                 examples: [
                    ("He's at odds with his boss.", "彼、上司ともめてる。"),
                    ("At odds with the rules.", "規則と矛盾してる。")
                 ]),
            make("on behalf of", "as a representative of",
                 "〜を代表して",
                 useCases: ["代表として発言するとき"],
                 examples: [
                    ("On behalf of the team.", "チームを代表して。"),
                    ("On behalf of all of us.", "私たち皆を代表して。")
                 ]),
            make("in light of", "considering",
                 "〜を考慮して",
                 useCases: ["事情を踏まえて判断するとき"],
                 examples: [
                    ("In light of recent events.", "最近の事件を踏まえて。"),
                    ("In light of the data.", "データを考慮して。")
                 ]),
            make("at the expense of", "while sacrificing",
                 "〜を犠牲にして",
                 useCases: ["何かを犠牲にして得る話"],
                 examples: [
                    ("Worked at the expense of sleep.", "睡眠を削って働いた。"),
                    ("At the expense of others.", "他人を犠牲にして。")
                 ]),
            make("prior to", "before",
                 "〜の前に",
                 useCases: ["フォーマルに「〜の前に」と言うとき"],
                 examples: [
                    ("Prior to the meeting.", "会議の前に。"),
                    ("Prior to that, I lived in Tokyo.", "それ以前は東京に住んでた。")
                 ]),
            make("subsequent to", "after; following",
                 "〜の後に",
                 useCases: ["フォーマルに時間順を示すとき"],
                 examples: [
                    ("Subsequent to the launch.", "発売後に。"),
                    ("Subsequent to that event.", "その出来事の後で。")
                 ]),
            make("with the exception of", "except for",
                 "〜を除いて",
                 useCases: ["フォーマルに例外を示すとき"],
                 examples: [
                    ("With the exception of Sunday.", "日曜を除いて。"),
                    ("Open daily, with the exception of Monday.", "月曜以外は毎日営業。")
                 ]),
            make("in conjunction with", "together with",
                 "〜と連携して・〜と組み合わせて",
                 useCases: ["共同作業や組み合わせを示すとき"],
                 examples: [
                    ("In conjunction with the team.", "チームと連携して。"),
                    ("Use in conjunction with the app.", "アプリと組み合わせて使って。")
                 ])
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
                 ]),
            make("fill up", "make completely full",
                 "満たす・満タンにする",
                 useCases: ["ガソリンを満タンにする話", "容器をいっぱいにするとき"],
                 examples: [
                    ("Fill up the tank.", "満タンにして。"),
                    ("Fill it up, please.", "満タンでお願いします。")
                 ]),
            make("fall back on", "rely on as a backup",
                 "頼りにする・最後の手段にする",
                 useCases: ["保険として用意する話"],
                 examples: [
                    ("She fell back on her savings.", "彼女、貯金に頼った。"),
                    ("Something to fall back on.", "もしもの時の備え。")
                 ]),
            make("fall for", "be deceived by; fall in love with",
                 "騙される・恋に落ちる",
                 useCases: ["嘘に引っかかる話", "誰かに惚れる話"],
                 examples: [
                    ("Don't fall for it.", "騙されないで。"),
                    ("I'm falling for him.", "彼を好きになりかけてる。")
                 ]),
            make("fall in love", "develop romantic feelings",
                 "恋に落ちる",
                 useCases: ["恋愛が始まる話"],
                 examples: [
                    ("They fell in love at first sight.", "彼ら一目惚れだった。"),
                    ("I fell in love with this city.", "この街に恋しちゃった。")
                 ]),
            make("drop by", "make a brief visit",
                 "立ち寄る",
                 useCases: ["軽く寄っていく話"],
                 examples: [
                    ("Drop by anytime.", "いつでも寄って。"),
                    ("I'll drop by later.", "あとで寄るよ。")
                 ]),
            make("drop in", "visit unannounced",
                 "ふらっと立ち寄る",
                 useCases: ["予告なしの来訪"],
                 examples: [
                    ("She just dropped in.", "彼女、ふらっと寄ってきた。"),
                    ("Drop in if you're nearby.", "近くまで来たら寄って。")
                 ]),
            make("drop out", "stop participating; quit school",
                 "中退する・脱落する",
                 useCases: ["学校を辞める話", "コンテストから抜ける話"],
                 examples: [
                    ("He dropped out of college.", "彼は大学中退した。"),
                    ("She dropped out of the race.", "彼女はレースを棄権した。")
                 ]),
            make("dawn on", "suddenly become clear",
                 "はっと気づく",
                 useCases: ["突然真意が分かる場面"],
                 examples: [
                    ("It just dawned on me.", "今ふと気づいた。"),
                    ("Then it dawned on her.", "彼女はそこで気づいた。")
                 ]),
            make("dive into", "start eagerly; plunge",
                 "飛び込む・没頭する",
                 useCases: ["新しい仕事や趣味に夢中になる話"],
                 examples: [
                    ("Let's dive into the work.", "仕事に取りかかろう。"),
                    ("She dove into the book.", "彼女は本に没頭した。")
                 ]),
            make("count down", "count toward zero",
                 "カウントダウンする",
                 useCases: ["イベントや年末などの秒読み"],
                 examples: [
                    ("Count down from 10!", "10からカウントダウン！"),
                    ("Counting down to launch.", "発売までカウントダウン中。")
                 ]),
            make("clear up", "tidy; become sunny; resolve",
                 "片付ける・晴れる・解決する",
                 useCases: ["天気が晴れる話", "誤解を解く話"],
                 examples: [
                    ("It cleared up by noon.", "昼には晴れた。"),
                    ("Let's clear up the misunderstanding.", "誤解を解こう。")
                 ]),
            make("clean up", "make tidy",
                 "きれいにする・片付ける",
                 useCases: ["部屋を片付ける話"],
                 examples: [
                    ("Clean up your room.", "部屋片付けて。"),
                    ("Time to clean up.", "片付ける時間だ。")
                 ]),
            make("chop up", "cut into small pieces",
                 "細かく切る",
                 useCases: ["料理の下ごしらえ"],
                 examples: [
                    ("Chop up the onions.", "玉ねぎ刻んで。"),
                    ("I chopped them up small.", "細かく切った。")
                 ]),
            make("buckle up", "fasten a seatbelt",
                 "シートベルトを締める",
                 useCases: ["車に乗り込んだ時"],
                 examples: [
                    ("Buckle up!", "シートベルト締めて！"),
                    ("Everyone buckled up?", "全員ベルトした？")
                 ]),
            make("bottle up", "suppress emotions",
                 "感情を抑え込む",
                 useCases: ["気持ちをため込む話"],
                 examples: [
                    ("Don't bottle it up.", "ため込まないで。"),
                    ("She bottles up her feelings.", "彼女は感情をため込む。")
                 ]),
            make("boil down to", "ultimately come down to",
                 "結局〜に行き着く",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("It boils down to money.", "結局お金の問題だ。"),
                    ("Boils down to trust.", "結局は信頼の話。")
                 ]),
            make("bear in mind", "keep in mind",
                 "心に留める",
                 useCases: ["注意点を念押しするとき"],
                 examples: [
                    ("Bear in mind it's expensive.", "高いって覚えておいて。"),
                    ("Bear that in mind.", "それを心に留めておいて。")
                 ]),
            make("beat down", "haggle; defeat",
                 "値切る・打ち倒す",
                 useCases: ["値段を下げてもらう交渉"],
                 examples: [
                    ("She beat down the price.", "彼女、値切った。"),
                    ("Beat the price down.", "値切ってみて。")
                 ]),
            make("back off", "step away; stop being aggressive",
                 "引き下がる・距離を取る",
                 useCases: ["強引な相手から離れる話"],
                 examples: [
                    ("Back off!", "離れて！"),
                    ("Just back off a bit.", "少し下がって。")
                 ]),
            make("act on", "take action based on",
                 "〜に基づいて行動する",
                 useCases: ["情報やアドバイスを実行に移すとき"],
                 examples: [
                    ("Act on your instincts.", "直感で動いて。"),
                    ("They acted on the tip.", "彼らはその情報を元に動いた。")
                 ]),
            make("adhere to", "stick to; follow strictly",
                 "守る・固執する",
                 useCases: ["ルールに従う話"],
                 examples: [
                    ("Adhere to the rules.", "ルールを守って。"),
                    ("Adhere to the schedule.", "スケジュール通りに。")
                 ]),
            make("abide by", "follow a rule or decision",
                 "従う・遵守する",
                 useCases: ["契約や法律を守る話"],
                 examples: [
                    ("Abide by the law.", "法律を守って。"),
                    ("We abide by the agreement.", "契約に従ってる。")
                 ]),
            make("account for", "explain; constitute",
                 "説明する・占める",
                 useCases: ["割合を説明するとき", "事情を弁明するとき"],
                 examples: [
                    ("That accounts for 30%.", "それで30%占める。"),
                    ("Can you account for this?", "これ説明できる？")
                 ]),
            make("agree on", "reach consensus about",
                 "〜について合意する",
                 useCases: ["全員一致で何かを決める話"],
                 examples: [
                    ("Let's agree on a date.", "日付を決めよう。"),
                    ("We agreed on the plan.", "計画について合意した。")
                 ])
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
                 ]),
            make("admit", "confess; allow entry",
                 "認める・入場を許す",
                 useCases: ["事実を白状するとき", "入場や入会を許可するとき"],
                 examples: [
                    ("I admit I was wrong.", "間違ってたって認める。"),
                    ("Children aren't admitted.", "子どもは入場不可です。")
                 ]),
            make("advise", "give advice",
                 "助言する・アドバイスする",
                 useCases: ["人に勧める場面"],
                 examples: [
                    ("I advise you to wait.", "待ったほうがいいよ。"),
                    ("She advised me to apply.", "彼女が応募を勧めてくれた。")
                 ]),
            make("affect", "have an influence on",
                 "影響する",
                 useCases: ["感情や状況に与える影響を話すとき"],
                 examples: [
                    ("It affects my mood.", "気分に影響する。"),
                    ("The weather affects sales.", "天候が売上に影響する。")
                 ]),
            make("achieve", "successfully reach a goal",
                 "達成する・成し遂げる",
                 useCases: ["目標達成について話すとき"],
                 examples: [
                    ("She achieved her goal.", "彼女は目標を達成した。"),
                    ("Achieve great things.", "素晴らしいことを成し遂げて。")
                 ]),
            make("announce", "make publicly known",
                 "発表する・告知する",
                 useCases: ["公式に何かを知らせる場面"],
                 examples: [
                    ("They announced the winner.", "勝者が発表された。"),
                    ("Announce it tomorrow.", "明日告知して。")
                 ]),
            make("apologize", "say you're sorry",
                 "謝る",
                 useCases: ["過ちを謝罪する場面"],
                 examples: [
                    ("I apologize for that.", "それについては謝ります。"),
                    ("He apologized to me.", "彼は私に謝った。")
                 ]),
            make("appoint", "officially choose for a role",
                 "任命する",
                 useCases: ["人事・役職に就かせる話"],
                 examples: [
                    ("They appointed her CEO.", "彼女がCEOに任命された。"),
                    ("Appointed last week.", "先週任命された。")
                 ]),
            make("arrange", "organize; plan",
                 "手配する・並べる",
                 useCases: ["予定や物の配置を整える話"],
                 examples: [
                    ("I'll arrange the meeting.", "会議を手配する。"),
                    ("Arrange the chairs.", "椅子を並べて。")
                 ]),
            make("assemble", "put together; gather",
                 "組み立てる・集まる",
                 useCases: ["家具の組み立て", "集会"],
                 examples: [
                    ("Assemble the desk.", "机を組み立てて。"),
                    ("Everyone assembled outside.", "みんな外に集まった。")
                 ]),
            make("assign", "allocate; give out",
                 "割り当てる",
                 useCases: ["業務や役割を割り振る場面"],
                 examples: [
                    ("They assigned me the task.", "そのタスク任された。"),
                    ("Assign each person a role.", "各自に役割を割り振って。")
                 ]),
            make("attempt", "try to do something",
                 "試みる",
                 useCases: ["挑戦する場面"],
                 examples: [
                    ("Attempt the question.", "問題に挑戦して。"),
                    ("First attempt failed.", "最初の挑戦は失敗。")
                 ]),
            make("attend", "be present at",
                 "出席する",
                 useCases: ["会議や授業への参加"],
                 examples: [
                    ("Will you attend?", "出席する？"),
                    ("I attended the conference.", "会議に出た。")
                 ]),
            make("avoid", "stay away from",
                 "避ける",
                 useCases: ["危険や問題を回避する話"],
                 examples: [
                    ("Avoid the rush hour.", "ラッシュアワー避けて。"),
                    ("I avoided him all day.", "一日中彼を避けてた。")
                 ]),
            make("balance", "keep stable; equalize",
                 "バランスを取る",
                 useCases: ["仕事と生活のバランスを話すとき"],
                 examples: [
                    ("Balance work and life.", "仕事と生活のバランス取って。"),
                    ("Hard to balance both.", "両方バランス取るのは大変。")
                 ]),
            make("belong", "be a member of; have a place",
                 "属する・所属する",
                 useCases: ["所有や所属を表すとき"],
                 examples: [
                    ("Where do I belong?", "私の居場所はどこ？"),
                    ("This belongs to me.", "これは私のもの。")
                 ]),
            make("bend", "curve; force into a shape",
                 "曲げる",
                 useCases: ["体や物を曲げる話"],
                 examples: [
                    ("Bend your knees.", "膝を曲げて。"),
                    ("Don't bend it.", "曲げないで。")
                 ]),
            make("blame", "hold responsible",
                 "責める",
                 useCases: ["責任を押し付ける場面"],
                 examples: [
                    ("Don't blame me.", "私のせいにしないで。"),
                    ("She blamed her phone.", "彼女は携帯のせいにした。")
                 ]),
            make("bother", "annoy; take the trouble",
                 "悩ます・わざわざ〜する",
                 useCases: ["邪魔する場面", "面倒を引き受けるとき"],
                 examples: [
                    ("Don't bother her.", "彼女を邪魔しないで。"),
                    ("Don't bother trying.", "わざわざ挑戦しなくていい。")
                 ]),
            make("breathe", "take air in and out",
                 "呼吸する",
                 useCases: ["深呼吸を促す場面"],
                 examples: [
                    ("Just breathe.", "深呼吸して。"),
                    ("Breathe deeply.", "深く呼吸して。")
                 ]),
            make("broadcast", "transmit on TV/radio",
                 "放送する",
                 useCases: ["ニュースなどを伝える話"],
                 examples: [
                    ("It was broadcast live.", "生放送された。"),
                    ("Broadcast the message.", "メッセージを発信して。")
                 ]),
            make("bury", "place in the ground",
                 "埋める",
                 useCases: ["物を埋める話", "感情を隠す比喩"],
                 examples: [
                    ("They buried the time capsule.", "タイムカプセル埋めた。"),
                    ("Don't bury your feelings.", "気持ちを押し殺さないで。")
                 ]),
            make("calculate", "compute; figure out",
                 "計算する",
                 useCases: ["数字を出す場面"],
                 examples: [
                    ("Calculate the total.", "合計を計算して。"),
                    ("I calculated the cost.", "コストを計算した。")
                 ]),
            make("capture", "catch; record",
                 "捕らえる・とらえる",
                 useCases: ["瞬間を写真に収める話", "捕獲する話"],
                 examples: [
                    ("Capture the moment.", "その瞬間を捉えて。"),
                    ("They captured him.", "彼を捕まえた。")
                 ]),
            make("celebrate", "honor or commemorate",
                 "祝う",
                 useCases: ["誕生日や成功を祝う話"],
                 examples: [
                    ("Let's celebrate!", "お祝いしよう！"),
                    ("We celebrated her birthday.", "彼女の誕生日を祝った。")
                 ])
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
                 ]),
            make("elegant", "graceful and stylish",
                 "上品な・優雅な",
                 useCases: ["洗練された人や物を表すとき"],
                 examples: [
                    ("That dress is elegant.", "そのドレス上品。"),
                    ("An elegant solution.", "エレガントな解決法。")
                 ]),
            make("empty", "containing nothing",
                 "空の",
                 useCases: ["容器や場所が空の話"],
                 examples: [
                    ("The fridge is empty.", "冷蔵庫空っぽ。"),
                    ("Empty room.", "空っぽの部屋。")
                 ]),
            make("enormous", "very large",
                 "巨大な・莫大な",
                 useCases: ["とても大きいものを強調するとき"],
                 examples: [
                    ("Enormous building.", "巨大な建物。"),
                    ("Enormous impact.", "莫大な影響。")
                 ]),
            make("enthusiastic", "showing great excitement",
                 "熱心な・乗り気な",
                 useCases: ["やる気満々な様子を表すとき"],
                 examples: [
                    ("She's enthusiastic about it.", "彼女、それに乗り気。"),
                    ("Not very enthusiastic.", "あまり乗り気じゃない。")
                 ]),
            make("exact", "precise; accurate",
                 "正確な",
                 useCases: ["数字や言葉の正確さを強調するとき"],
                 examples: [
                    ("The exact time.", "正確な時間。"),
                    ("Be more exact.", "もっと正確に。")
                 ]),
            make("excellent", "extremely good",
                 "優秀な・素晴らしい",
                 useCases: ["高評価を伝えるとき"],
                 examples: [
                    ("Excellent job!", "素晴らしい仕事！"),
                    ("Excellent service.", "素晴らしいサービス。")
                 ]),
            make("exhausted", "extremely tired",
                 "疲れ果てた",
                 useCases: ["極度の疲労を表すとき"],
                 examples: [
                    ("I'm exhausted.", "もうクタクタ。"),
                    ("Exhausted from work.", "仕事で疲れ果ててる。")
                 ]),
            make("expensive", "costing a lot",
                 "高価な・高い",
                 useCases: ["値段の高さを話すとき"],
                 examples: [
                    ("Too expensive.", "高すぎ。"),
                    ("That's expensive.", "それ高いね。")
                 ]),
            make("extreme", "very intense or severe",
                 "極端な",
                 useCases: ["過激な事象や意見を表すとき"],
                 examples: [
                    ("Extreme weather.", "異常気象。"),
                    ("That's a bit extreme.", "それはちょっと極端だ。")
                 ]),
            make("fancy", "elaborate; high-end",
                 "凝った・高級な",
                 useCases: ["お洒落で凝った物を表すとき"],
                 examples: [
                    ("Fancy restaurant.", "高級レストラン。"),
                    ("Nothing fancy.", "別に大したもんじゃない。")
                 ]),
            make("fragile", "easily broken",
                 "壊れやすい・繊細な",
                 useCases: ["注意して扱う物の話"],
                 examples: [
                    ("Handle with care—it's fragile.", "壊れ物注意。"),
                    ("Fragile feelings.", "繊細な気持ち。")
                 ]),
            make("frustrated", "feeling annoyed and helpless",
                 "イライラした・もどかしい",
                 useCases: ["うまくいかなくてイライラする話"],
                 examples: [
                    ("I'm so frustrated.", "めっちゃイライラ。"),
                    ("Frustrated with traffic.", "渋滞でイラついた。")
                 ]),
            make("gentle", "kind; mild",
                 "優しい・穏やかな",
                 useCases: ["柔らかい性格や扱いを表すとき"],
                 examples: [
                    ("Be gentle with him.", "彼に優しくして。"),
                    ("Gentle breeze.", "穏やかな風。")
                 ]),
            make("gorgeous", "very beautiful; stunning",
                 "豪華な・美しい",
                 useCases: ["美しさを強く褒めるとき"],
                 examples: [
                    ("You look gorgeous!", "めっちゃ綺麗！"),
                    ("Gorgeous view.", "絶景。")
                 ]),
            make("grateful", "feeling thankful",
                 "感謝している",
                 useCases: ["丁寧に感謝を伝えるとき"],
                 examples: [
                    ("I'm so grateful.", "本当に感謝してる。"),
                    ("Grateful for your help.", "助けてくれて感謝。")
                 ]),
            make("guilty", "responsible for wrongdoing; feeling regret",
                 "罪悪感のある・有罪の",
                 useCases: ["後ろめたさを感じるとき", "法的に有罪のとき"],
                 examples: [
                    ("I feel guilty.", "罪悪感ある。"),
                    ("Found guilty.", "有罪と判決された。")
                 ]),
            make("honest", "truthful; sincere",
                 "正直な",
                 useCases: ["率直な意見を述べる前置き"],
                 examples: [
                    ("To be honest, no.", "正直、無理。"),
                    ("She's an honest person.", "彼女は正直な人だ。")
                 ]),
            make("horrible", "very unpleasant",
                 "恐ろしい・ひどい",
                 useCases: ["ひどい状況を表すとき"],
                 examples: [
                    ("It was horrible.", "ひどかった。"),
                    ("Horrible weather.", "最悪の天気。")
                 ]),
            make("ideal", "perfect; most suitable",
                 "理想的な",
                 useCases: ["完璧な条件や状態を表すとき"],
                 examples: [
                    ("Ideal weather for a picnic.", "ピクニックに理想的な天気。"),
                    ("Not ideal, but okay.", "理想じゃないけど大丈夫。")
                 ])
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
                 ]),
            make("advantage", "a beneficial point",
                 "利点・有利な点",
                 useCases: ["メリットを強調するとき"],
                 examples: [
                    ("Big advantage.", "大きなアドバンテージ。"),
                    ("Take advantage of it.", "それを活かして。")
                 ]),
            make("advice", "an opinion offered as guidance",
                 "助言・アドバイス",
                 useCases: ["人にアドバイスを求める場面"],
                 examples: [
                    ("Any advice?", "なんかアドバイスある？"),
                    ("Good advice.", "いいアドバイスだ。")
                 ]),
            make("affection", "warm feeling toward someone",
                 "愛情・好意",
                 useCases: ["親しみや愛情を表すとき"],
                 examples: [
                    ("Show some affection.", "もっと愛情表現して。"),
                    ("Deep affection for her.", "彼女への深い愛情。")
                 ]),
            make("agreement", "an arrangement; consensus",
                 "合意・契約",
                 useCases: ["双方の同意・契約締結の話"],
                 examples: [
                    ("We have an agreement.", "合意した。"),
                    ("Sign the agreement.", "契約書にサインして。")
                 ]),
            make("ambition", "strong desire to achieve",
                 "野心・大志",
                 useCases: ["将来の目標を語るとき"],
                 examples: [
                    ("Big ambition.", "大きな野望だ。"),
                    ("She has ambition.", "彼女には野心がある。")
                 ]),
            make("anxiety", "feeling of worry",
                 "不安・心配",
                 useCases: ["不安な気持ちを表すとき"],
                 examples: [
                    ("Social anxiety.", "対人不安。"),
                    ("My anxiety is high.", "不安が強い。")
                 ]),
            make("appearance", "the way someone or something looks",
                 "外見・登場",
                 useCases: ["見た目について話すとき"],
                 examples: [
                    ("Her appearance changed.", "彼女、見た目が変わった。"),
                    ("Make a brief appearance.", "ちょっと顔出して。")
                 ]),
            make("argument", "discussion; quarrel",
                 "議論・口論",
                 useCases: ["討論や口論を表すとき"],
                 examples: [
                    ("Big argument last night.", "昨夜大喧嘩した。"),
                    ("Strong argument.", "強い論拠だ。")
                 ]),
            make("assistance", "help; support",
                 "援助・助力",
                 useCases: ["公式に支援を頼む話"],
                 examples: [
                    ("Need any assistance?", "お手伝いいる？"),
                    ("Thanks for the assistance.", "援助ありがとう。")
                 ]),
            make("attitude", "a settled way of thinking",
                 "態度・姿勢",
                 useCases: ["人の態度や心構えを話すとき"],
                 examples: [
                    ("Bad attitude.", "態度悪い。"),
                    ("Positive attitude!", "前向きな姿勢で！")
                 ]),
            make("attraction", "something that pulls; appeal",
                 "魅力・引きつけるもの",
                 useCases: ["観光地や人の魅力を話すとき"],
                 examples: [
                    ("Tourist attraction.", "観光名所。"),
                    ("There's an attraction between them.", "二人には惹かれ合うものがある。")
                 ]),
            make("audience", "people watching or listening",
                 "観客・聴衆",
                 useCases: ["イベントやプレゼンの聴衆を話すとき"],
                 examples: [
                    ("Big audience tonight.", "今夜は観客多い。"),
                    ("Engage the audience.", "観客を引き込んで。")
                 ]),
            make("authority", "power; an expert",
                 "権威・当局",
                 useCases: ["権限のある立場や専門家を表すとき"],
                 examples: [
                    ("Speak to the authority.", "当局に問い合わせて。"),
                    ("She's an authority on art.", "彼女は美術の権威だ。")
                 ]),
            make("basis", "the foundation of something",
                 "基礎・根拠",
                 useCases: ["論拠や前提を話すとき"],
                 examples: [
                    ("On a daily basis.", "毎日ベースで。"),
                    ("No basis for the claim.", "その主張に根拠はない。")
                 ])
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
                 ]),
            make("for another thing", "as another reason",
                 "もう一つには",
                 useCases: ["追加の理由を出すとき"],
                 examples: [
                    ("For another thing, it's far.", "もう一つには、遠い。"),
                    ("For another thing, it's late.", "それに、もう遅い。")
                 ]),
            make("last but not least", "finally and importantly",
                 "最後になるが重要なこととして",
                 useCases: ["締めくくりに大事なことを述べるとき"],
                 examples: [
                    ("Last but not least, thank you.", "最後になりますが、ありがとう。"),
                    ("And last but not least, the budget.", "最後に大事な点、予算ね。")
                 ]),
            make("to begin with", "first of all",
                 "まず初めに",
                 useCases: ["話を始めるとき"],
                 examples: [
                    ("To begin with, hi.", "まずは、ハロー。"),
                    ("To begin with, let's plan.", "まず計画を立てよう。")
                 ]),
            make("to make matters worse", "as a worsening factor",
                 "さらに悪いことに",
                 useCases: ["悪い状況に追加の悪材料を言うとき"],
                 examples: [
                    ("To make matters worse, it rained.", "おまけに雨まで降った。"),
                    ("To make matters worse, he's sick.", "さらに悪いことに、彼が体調不良。")
                 ]),
            make("on top of everything", "in addition to everything",
                 "おまけに・その上",
                 useCases: ["さらに何かが起きたと強調するとき"],
                 examples: [
                    ("On top of everything, I lost my keys.", "おまけに鍵までなくした。"),
                    ("On top of everything else.", "それに加えて。")
                 ]),
            make("in addition to", "as well as",
                 "〜に加えて",
                 useCases: ["要素を追加して話すとき"],
                 examples: [
                    ("In addition to coffee, tea.", "コーヒーに加えて紅茶も。"),
                    ("In addition to that, yes.", "それに加えて、はい。")
                 ]),
            make("as well as", "in addition to; and also",
                 "〜だけでなく",
                 useCases: ["並列して述べるとき"],
                 examples: [
                    ("She sings as well as dances.", "彼女、歌も踊りもできる。"),
                    ("Tea as well as coffee.", "コーヒーだけでなく紅茶も。")
                 ]),
            make("rather than", "instead of",
                 "〜よりむしろ",
                 useCases: ["優先する選択肢を伝えるとき"],
                 examples: [
                    ("Tea rather than coffee.", "コーヒーじゃなくて紅茶。"),
                    ("Walk rather than drive.", "車じゃなくて歩こう。")
                 ]),
            make("instead of", "in place of",
                 "〜の代わりに",
                 useCases: ["代替案を提示するとき"],
                 examples: [
                    ("Instead of pizza, sushi.", "ピザじゃなくて寿司。"),
                    ("Instead of leaving, stay.", "帰らないで残って。")
                 ]),
            make("provided that", "on the condition that",
                 "〜という条件で",
                 useCases: ["条件付きで合意する場面"],
                 examples: [
                    ("Provided that you agree.", "君が同意する条件で。"),
                    ("Provided that it rains.", "雨が降ったらの話だけど。")
                 ]),
            make("suppose that", "assuming that",
                 "〜と仮定すれば",
                 useCases: ["仮定で話を進めるとき"],
                 examples: [
                    ("Suppose that he's late.", "彼が遅れたとして。"),
                    ("Suppose that's true.", "それが本当だとしよう。")
                 ]),
            make("assuming that", "if we accept",
                 "〜と仮定して",
                 useCases: ["前提を立てて議論するとき"],
                 examples: [
                    ("Assuming that's true...", "それが本当だとしたら…"),
                    ("Assuming that we leave now.", "今出発するとして。")
                 ]),
            make("given that", "since; considering",
                 "〜を考えると",
                 useCases: ["状況を踏まえて結論する場面"],
                 examples: [
                    ("Given that it's raining...", "雨だから…"),
                    ("Given that you're new.", "新人だから仕方ない。")
                 ]),
            make("considering that", "taking into account",
                 "〜であることを考えると",
                 useCases: ["事情を踏まえて評価するとき"],
                 examples: [
                    ("Considering that, well done.", "それを考えれば、よくやった。"),
                    ("Considering that, fair.", "それを踏まえれば妥当。")
                 ])
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
                 ]),
            make("freak out", "panic or get very upset",
                 "パニックになる・取り乱す",
                 useCases: ["びっくりしすぎて慌てる話"],
                 examples: [
                    ("Don't freak out.", "パニックにならないで。"),
                    ("She freaked out when she saw it.", "彼女、見てパニックになった。")
                 ]),
            make("calm down", "become less upset",
                 "落ち着く",
                 useCases: ["興奮している人をなだめるとき"],
                 examples: [
                    ("Calm down, it's fine.", "落ち着いて、大丈夫だから。"),
                    ("Just calm down for a sec.", "ちょっと落ち着いて。")
                 ]),
            make("cut it out", "stop doing something annoying",
                 "やめろ",
                 useCases: ["うるさい行為を止めるとき"],
                 examples: [
                    ("Cut it out!", "やめて！"),
                    ("Hey, cut it out.", "おい、やめろよ。")
                 ]),
            make("get out", "leave; or expression of disbelief",
                 "出て行け・うそでしょ",
                 useCases: ["強く追い出すとき", "信じられない時の感嘆として"],
                 examples: [
                    ("Get out of here.", "出てけ。"),
                    ("Get out! No way!", "うそでしょ！マジで！？")
                 ]),
            make("come on", "hurry up; expression of disbelief",
                 "早く・冗談でしょ",
                 useCases: ["急かすとき", "ありえない反応をするとき"],
                 examples: [
                    ("Come on, let's go!", "ほら、行こう！"),
                    ("Oh come on, really?", "ちょっと、マジで？")
                 ]),
            make("hang on", "wait a moment",
                 "待って・ちょっと",
                 useCases: ["相手にちょっと待ってと言うとき"],
                 examples: [
                    ("Hang on a sec.", "ちょっと待って。"),
                    ("Hang on, let me check.", "待って、確認する。")
                 ]),
            make("mess around", "fool around; play",
                 "ふざける・遊ぶ",
                 useCases: ["友達とじゃれてる話", "真面目にやらない話"],
                 examples: [
                    ("Stop messing around.", "ふざけないで。"),
                    ("We were just messing around.", "ただふざけてただけ。")
                 ]),
            make("goof off", "slack off; mess around",
                 "サボる・ふざける",
                 useCases: ["仕事や勉強をさぼる話"],
                 examples: [
                    ("Don't goof off in class.", "授業中ふざけるな。"),
                    ("They were goofing off all day.", "彼ら一日中サボってた。")
                 ]),
            make("chill out", "relax; calm down",
                 "リラックスする",
                 useCases: ["焦ってる相手をなだめるとき"],
                 examples: [
                    ("Just chill out.", "リラックスして。"),
                    ("Let's chill out tonight.", "今夜はゆっくりしよう。")
                 ]),
            make("speed up", "go faster",
                 "早めて・スピードを上げる",
                 useCases: ["急ぐよう促すとき"],
                 examples: [
                    ("Speed up, we're late.", "急いで、遅れるよ。"),
                    ("Can you speed it up?", "もっと早くできる？")
                 ]),
            make("swing by", "make a quick stop",
                 "ちょっと寄る",
                 useCases: ["軽く立ち寄る予定の話"],
                 examples: [
                    ("I'll swing by later.", "後でちょっと寄るね。"),
                    ("Swing by the store.", "店にちょっと寄って。")
                 ]),
            make("head out", "leave; depart",
                 "出る・出発する",
                 useCases: ["そろそろ帰る・出発する話"],
                 examples: [
                    ("I gotta head out.", "そろそろ出るね。"),
                    ("We'll head out around 8.", "8時くらいに出るよ。")
                 ]),
            make("get going", "start moving; depart",
                 "出発する・取りかかる",
                 useCases: ["移動や作業を始める話"],
                 examples: [
                    ("Let's get going.", "そろそろ行こう。"),
                    ("Time to get going.", "もう出発の時間。")
                 ]),
            make("wrap up", "finish; conclude",
                 "終わらせる・まとめる",
                 useCases: ["仕事や会議を締めくくる話"],
                 examples: [
                    ("Let's wrap this up.", "これ終わらせよう。"),
                    ("I'll wrap up by 5.", "5時までに片付ける。")
                 ]),
            make("screw up", "make a serious mistake",
                 "失敗する・ヘマする",
                 useCases: ["大きなミスをした話"],
                 examples: [
                    ("I really screwed up.", "完全にやらかした。"),
                    ("Don't screw it up.", "ミスらないで。")
                 ])
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
                 ]),
            make("so what", "why does that matter?",
                 "だから何？",
                 useCases: ["相手の主張を軽く突き返すとき"],
                 examples: [
                    ("So what?", "だから何？"),
                    ("So what if I do?", "だから何？やってもいいでしょ。")
                 ]),
            make("not really", "not exactly; a soft no",
                 "そうでもない・別に",
                 useCases: ["否定をやんわり伝えるとき"],
                 examples: [
                    ("Not really, no.", "うーん、別に。"),
                    ("Tired? Not really.", "疲れてる？まあそうでもない。")
                 ]),
            make("kind of like", "somewhat similar to",
                 "みたいな感じ",
                 useCases: ["何かに似ていると説明するとき"],
                 examples: [
                    ("It's kind of like Twitter.", "Twitter みたいな感じ。"),
                    ("Kind of like a hat, but bigger.", "帽子みたいだけど大きい。")
                 ]),
            make("or whatever", "or something similar",
                 "か何か",
                 useCases: ["はっきり指定せずぼかすとき"],
                 examples: [
                    ("Pizza or whatever.", "ピザか何か。"),
                    ("Friday or whatever works.", "金曜とか、都合つく日で。")
                 ]),
            make("pretty much", "almost completely",
                 "ほぼ・大体",
                 useCases: ["ほぼ完了している話を伝えるとき"],
                 examples: [
                    ("Pretty much done.", "ほぼ終わってる。"),
                    ("That's pretty much it.", "まあそんなとこ。")
                 ]),
            make("more or less", "approximately; roughly",
                 "だいたい・ほぼ",
                 useCases: ["大雑把に言うとき"],
                 examples: [
                    ("More or less, yeah.", "まあだいたいそんな感じ。"),
                    ("More or less the same.", "ほぼ同じ。")
                 ]),
            make("big time", "to a great extent",
                 "超・めっちゃ",
                 useCases: ["強調したいとき"],
                 examples: [
                    ("I owe you big time.", "めっちゃ恩がある。"),
                    ("He messed up big time.", "彼、超やらかした。")
                 ]),
            make("for sure", "definitely; absolutely",
                 "確かに・もちろん",
                 useCases: ["強く同意するとき"],
                 examples: [
                    ("For sure!", "もちろん！"),
                    ("That's a yes for sure.", "それは確実にYES。")
                 ]),
            make("no doubt", "without question",
                 "間違いない",
                 useCases: ["疑いなく賛同するとき"],
                 examples: [
                    ("No doubt about it.", "間違いない。"),
                    ("She'll win, no doubt.", "彼女が勝つよ、間違いなく。")
                 ])
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
                 ]),
            make("no worries", "don't worry; it's fine",
                 "気にしないで",
                 useCases: ["相手の謝罪を軽く受け流すとき"],
                 examples: [
                    ("No worries!", "気にしないで！"),
                    ("No worries, it's fine.", "大丈夫、平気だよ。")
                 ]),
            make("no problem", "no trouble at all",
                 "問題ない・どういたしまして",
                 useCases: ["お礼に応えるとき"],
                 examples: [
                    ("No problem!", "どういたしまして！"),
                    ("No problem, anytime.", "全然大丈夫、いつでも。")
                 ]),
            make("no biggie", "not a big deal",
                 "大したことない",
                 useCases: ["軽く済ませるとき"],
                 examples: [
                    ("It's no biggie.", "大したことないよ。"),
                    ("No biggie, forget it.", "気にしないで、忘れて。")
                 ]),
            make("no sweat", "no problem; easy",
                 "楽勝・問題なし",
                 useCases: ["余裕でできると伝えるとき"],
                 examples: [
                    ("No sweat.", "楽勝。"),
                    ("Yeah, no sweat.", "うん、余裕。")
                 ]),
            make("you bet", "of course; certainly",
                 "もちろん",
                 useCases: ["快く同意するとき"],
                 examples: [
                    ("You bet!", "もちろん！"),
                    ("You bet I will.", "やるに決まってる。")
                 ]),
            make("you got it", "got it; I'll do it",
                 "任せて・了解",
                 useCases: ["頼みを快く引き受けるとき"],
                 examples: [
                    ("You got it!", "任せて！"),
                    ("You got it, boss.", "了解、ボス。")
                 ]),
            make("got it", "I understand",
                 "分かった",
                 useCases: ["内容を理解したと伝えるとき"],
                 examples: [
                    ("Got it.", "分かった。"),
                    ("Got it, thanks.", "了解、ありがとう。")
                 ]),
            make("gotcha", "I understand; got you",
                 "分かった・捕まえた",
                 useCases: ["カジュアルに「了解」と伝えるとき"],
                 examples: [
                    ("Gotcha.", "了解。"),
                    ("Gotcha, makes sense.", "なるほど、わかる。")
                 ]),
            make("right on", "exactly; cool",
                 "その通り・いいね",
                 useCases: ["賛同や称賛を軽く伝えるとき"],
                 examples: [
                    ("Right on!", "いいね！"),
                    ("Right on, dude.", "その通りだよ。")
                 ]),
            make("way to go", "good job",
                 "よくやった",
                 useCases: ["称賛するとき（皮肉でも）"],
                 examples: [
                    ("Way to go!", "やったね！"),
                    ("Hey, way to go!", "よくやった！")
                 ]),
            make("good for you", "I'm happy for you",
                 "よかったね",
                 useCases: ["相手の成功を喜ぶとき"],
                 examples: [
                    ("Good for you!", "よかったね！"),
                    ("Aww, good for you.", "わー、よかったじゃん。")
                 ]),
            make("lucky you", "lucky on your part",
                 "いいなあ・うらやましい",
                 useCases: ["相手をうらやむとき"],
                 examples: [
                    ("Lucky you!", "いいなあ！"),
                    ("Lucky you got the day off.", "休みもらえてラッキーだね。")
                 ]),
            make("bummer", "that's too bad",
                 "残念",
                 useCases: ["残念な話に共感するとき"],
                 examples: [
                    ("That's a bummer.", "それは残念。"),
                    ("Aw, bummer.", "あー、残念。")
                 ]),
            make("shoot", "darn; mild expression of frustration",
                 "しまった",
                 useCases: ["軽く失敗した時の独り言"],
                 examples: [
                    ("Shoot, I forgot.", "しまった、忘れた。"),
                    ("Shoot!", "しまった！")
                 ]),
            make("dang", "dammit (mild)",
                 "くそ・ちぇっ",
                 useCases: ["軽くがっかりした時の表現"],
                 examples: [
                    ("Dang, that's expensive.", "くそっ、高い。"),
                    ("Dang it.", "ちぇっ。")
                 ]),
            make("darn", "darn; mild expletive",
                 "ちくしょう",
                 useCases: ["軽い悔しさ"],
                 examples: [
                    ("Darn, I missed it.", "ちくしょう、逃した。"),
                    ("Darn it!", "ちぇっ！")
                 ]),
            make("crap", "expression of frustration",
                 "まずい・くそ",
                 useCases: ["失敗・困った時の口語"],
                 examples: [
                    ("Crap, I forgot my keys.", "まずい、鍵忘れた。"),
                    ("Oh crap.", "やばい。")
                 ]),
            make("whoops", "oops; I made a small mistake",
                 "おっと",
                 useCases: ["小さなミスをした時"],
                 examples: [
                    ("Whoops, sorry!", "おっと、ごめん！"),
                    ("Whoops, my bad.", "あ、ごめんごめん。")
                 ]),
            make("oops", "oh, a small mistake",
                 "しまった",
                 useCases: ["うっかりミスを伝えるとき"],
                 examples: [
                    ("Oops!", "しまった！"),
                    ("Oops, I dropped it.", "あ、落とした。")
                 ])
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
                 ]),
            make("call it a night", "end the day; go to sleep",
                 "今夜はもう寝る・お開きにする",
                 useCases: ["夜の集まりを終える話"],
                 examples: [
                    ("Let's call it a night.", "そろそろ寝よう。"),
                    ("I'm calling it a night.", "もう寝るね。")
                 ]),
            make("grab a bite", "eat a quick meal",
                 "軽く食べる",
                 useCases: ["気軽に食事に行く話"],
                 examples: [
                    ("Wanna grab a bite?", "ちょっと食べに行く？"),
                    ("Let's grab a bite.", "軽く食べに行こう。")
                 ]),
            make("grab coffee", "go for coffee",
                 "コーヒーを飲みに行く",
                 useCases: ["カジュアルにお茶しようと誘うとき"],
                 examples: [
                    ("Wanna grab coffee?", "コーヒー行く？"),
                    ("Let's grab coffee tomorrow.", "明日コーヒーしよう。")
                 ]),
            make("catch some Z's", "get some sleep",
                 "ひと眠りする",
                 useCases: ["眠りに行くカジュアルな表現"],
                 examples: [
                    ("Gonna catch some Z's.", "ちょっと寝てくる。"),
                    ("Need to catch some Z's.", "ひと眠りしないと。")
                 ]),
            make("be beat", "be very tired",
                 "疲れ果てている",
                 useCases: ["疲労を伝える口語表現"],
                 examples: [
                    ("I'm beat.", "もうクタクタ。"),
                    ("She looks beat.", "彼女、疲れて見える。")
                 ]),
            make("be wiped out", "be exhausted",
                 "クタクタ・へとへと",
                 useCases: ["極度に疲れているとき"],
                 examples: [
                    ("I'm wiped out.", "もうへとへと。"),
                    ("Wiped out from work.", "仕事でクタクタ。")
                 ]),
            make("butter up", "flatter to gain favor",
                 "おだてる・機嫌を取る",
                 useCases: ["お世辞を言って何か頼む話"],
                 examples: [
                    ("Stop trying to butter me up.", "おだてないで。"),
                    ("He's buttering up the boss.", "彼、上司にゴマすってる。")
                 ]),
            make("bail on", "back out of plans",
                 "約束をすっぽかす",
                 useCases: ["予定を急にキャンセルする話"],
                 examples: [
                    ("She bailed on me.", "彼女、ドタキャンした。"),
                    ("Don't bail on us!", "ドタキャンしないで！")
                 ]),
            make("flake out", "fail to show up; cancel last minute",
                 "ドタキャンする",
                 useCases: ["人の信用を落とすキャンセル行動"],
                 examples: [
                    ("He flaked out again.", "またドタキャンされた。"),
                    ("Don't flake out on me.", "ドタキャンしないで。")
                 ]),
            make("chicken out", "lose courage and back away",
                 "ビビる・尻込みする",
                 useCases: ["怖気付いてやめる話"],
                 examples: [
                    ("Don't chicken out!", "ビビるなよ！"),
                    ("I chickened out.", "怖くてやめちゃった。")
                 ]),
            make("suck up to", "flatter to gain favor",
                 "ゴマをする",
                 useCases: ["上司に媚びる話"],
                 examples: [
                    ("He always sucks up to the boss.", "彼、いつも上司にゴマすってる。"),
                    ("Stop sucking up.", "ゴマすりやめて。")
                 ])
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
                 ]),
            make("stressed out", "very stressed",
                 "ストレスでまいってる",
                 useCases: ["ストレス過剰な状態を伝えるとき"],
                 examples: [
                    ("I'm stressed out.", "もうストレスたまってる。"),
                    ("She's super stressed out.", "彼女、めっちゃストレスためてる。")
                 ]),
            make("freaked out", "shocked or panicked",
                 "びっくりした・動揺した",
                 useCases: ["びっくりして動揺した話"],
                 examples: [
                    ("I was so freaked out.", "めっちゃびっくりした。"),
                    ("She looked freaked out.", "彼女、動揺してた。")
                 ]),
            make("psyched", "very excited",
                 "ワクワクしてる",
                 useCases: ["楽しみで仕方ない気持ちを伝えるとき"],
                 examples: [
                    ("I'm psyched!", "めっちゃ楽しみ！"),
                    ("Totally psyched for the trip.", "旅行ワクワクしてる。")
                 ]),
            make("stoked", "extremely excited",
                 "めっちゃ興奮してる",
                 useCases: ["カジュアルに興奮を表すとき"],
                 examples: [
                    ("I'm stoked!", "めっちゃテンション上がってる！"),
                    ("Stoked to see you.", "会えるの楽しみ。")
                 ]),
            make("pumped", "fired up; energized",
                 "気合入ってる・テンション高い",
                 useCases: ["やる気満々の状態を表すとき"],
                 examples: [
                    ("I'm pumped for this!", "これ、めっちゃテンション上がる！"),
                    ("She's pumped up.", "彼女、気合入ってる。")
                 ]),
            make("wasted", "drunk; or exhausted",
                 "酔っ払い・疲れ果て",
                 useCases: ["酔っている話", "完全に疲れた話"],
                 examples: [
                    ("He got wasted last night.", "彼、昨夜ベロベロだった。"),
                    ("I'm wasted from work.", "仕事でぐったり。")
                 ]),
            make("jet-lagged", "suffering from jet lag",
                 "時差ボケ",
                 useCases: ["長距離フライト後のだるさ"],
                 examples: [
                    ("I'm so jet-lagged.", "時差ボケがひどい。"),
                    ("Still jet-lagged from Japan.", "日本からの時差ボケが残ってる。")
                 ]),
            make("starving", "very hungry",
                 "めっちゃお腹空いた",
                 useCases: ["強い空腹を表すとき"],
                 examples: [
                    ("I'm starving!", "お腹ペコペコ！"),
                    ("Starving — let's eat.", "お腹空いた、食べよう。")
                 ]),
            make("full", "no longer hungry",
                 "お腹いっぱい",
                 useCases: ["食事の後で満腹を伝えるとき"],
                 examples: [
                    ("I'm full.", "お腹いっぱい。"),
                    ("So full I can't move.", "満腹で動けない。")
                 ])
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
                 ]),
            make("brush off", "dismiss casually",
                 "軽くあしらう・無視する",
                 useCases: ["相手の発言を軽く受け流す話"],
                 examples: [
                    ("She brushed me off.", "彼女、私を軽くあしらった。"),
                    ("Don't brush it off.", "軽くあしらわないで。")
                 ]),
            make("brush up on", "review or refresh skills",
                 "復習する・腕を磨き直す",
                 useCases: ["スキルを再確認する話"],
                 examples: [
                    ("I need to brush up on my Spanish.", "スペイン語復習しないと。"),
                    ("Brush up on the basics.", "基礎を復習して。")
                 ]),
            make("catch on", "understand; become popular",
                 "理解する・流行る",
                 useCases: ["新しい流れに気づく話", "コツを掴む話"],
                 examples: [
                    ("She caught on quickly.", "彼女、すぐに理解した。"),
                    ("This trend is catching on.", "この流行、広がってる。")
                 ]),
            make("come around", "change one's mind; regain consciousness",
                 "考えを変える・意識を取り戻す",
                 useCases: ["相手が納得し始める話", "気絶から意識が戻る話"],
                 examples: [
                    ("He'll come around eventually.", "そのうち彼も納得するよ。"),
                    ("She came around after fainting.", "彼女、気絶から意識が戻った。")
                 ]),
            make("cop out", "back out; make excuses",
                 "言い逃れする・逃げる",
                 useCases: ["責任から逃げる話"],
                 examples: [
                    ("Don't cop out.", "逃げないで。"),
                    ("That's a cop-out answer.", "それは逃げの答えだ。")
                 ]),
            make("crack down on", "enforce strictly",
                 "厳しく取り締まる",
                 useCases: ["違反者を厳しく取り締まる話"],
                 examples: [
                    ("They cracked down on speeders.", "スピード違反を取り締まった。"),
                    ("Cops are cracking down.", "警察が取り締まり強化してる。")
                 ]),
            make("doll up", "dress up nicely",
                 "めかしこむ",
                 useCases: ["きれいに着飾る話"],
                 examples: [
                    ("She dolled up for the party.", "彼女、パーティー用にめかしこんだ。"),
                    ("All dolled up tonight!", "今夜はバッチリ決めてるね！")
                 ]),
            make("drag out", "make something take longer",
                 "長引かせる",
                 useCases: ["話や手続きを引き延ばす話"],
                 examples: [
                    ("Don't drag this out.", "長引かせないで。"),
                    ("They dragged out the meeting.", "会議を引き延ばした。")
                 ]),
            make("drum up", "gather; stir up",
                 "かき集める・盛り上げる",
                 useCases: ["興味や支援を集める話"],
                 examples: [
                    ("Drum up some support.", "支持を集めよう。"),
                    ("Trying to drum up business.", "ビジネスを盛り上げようとしてる。")
                 ]),
            make("gloss over", "treat superficially; cover up",
                 "ごまかす・うわべを取り繕う",
                 useCases: ["重要な点を流して説明する話"],
                 examples: [
                    ("He glossed over the details.", "彼、細かい部分はごまかした。"),
                    ("Don't gloss over it.", "適当にごまかさないで。")
                 ]),
            make("goof around", "fool around; loaf about",
                 "ぶらぶら遊ぶ・だらける",
                 useCases: ["特に目的なく遊ぶ話"],
                 examples: [
                    ("We goofed around all day.", "一日中ダラダラ遊んでた。"),
                    ("Stop goofing around.", "ふざけてないで。")
                 ]),
            make("harp on", "talk about repeatedly",
                 "くどくどと言う",
                 useCases: ["同じ話を繰り返し蒸し返す話"],
                 examples: [
                    ("Stop harping on about it.", "そのことくどくど言わないで。"),
                    ("She always harps on about money.", "彼女、いつもお金の話ばっかり。")
                 ]),
            make("hash out", "discuss to resolve",
                 "議論して解決する",
                 useCases: ["問題を話し合いで詰める話"],
                 examples: [
                    ("Let's hash it out.", "話し合って決めよう。"),
                    ("We hashed out a plan.", "計画をまとめた。")
                 ]),
            make("kick back", "relax; chill",
                 "くつろぐ・リラックス",
                 useCases: ["仕事終わりにのんびりする話"],
                 examples: [
                    ("Just kick back and relax.", "ただゆっくりしよう。"),
                    ("Kick back with a beer.", "ビール片手にくつろぐ。")
                 ]),
            make("knuckle down", "buckle down; work seriously",
                 "真剣に取り組む",
                 useCases: ["気合を入れて作業する話"],
                 examples: [
                    ("Time to knuckle down.", "本気出す時間だ。"),
                    ("Knuckle down and study.", "本気で勉強しよう。")
                 ]),
            make("muscle in", "force one's way in",
                 "強引に割り込む",
                 useCases: ["強引に介入する話"],
                 examples: [
                    ("He muscled in on the deal.", "彼、その案件に強引に割り込んだ。"),
                    ("Don't muscle in.", "強引に入ってこないで。")
                 ]),
            make("nail down", "pin down; finalize",
                 "はっきりさせる・確定する",
                 useCases: ["不確定なことを固める話"],
                 examples: [
                    ("Let's nail down the date.", "日付を確定させよう。"),
                    ("Nail down the details.", "細部を詰めて。")
                 ]),
            make("own up", "admit; confess",
                 "認める・白状する",
                 useCases: ["悪いことを正直に告白する話"],
                 examples: [
                    ("Own up to it.", "正直に認めて。"),
                    ("He finally owned up.", "彼ついに白状した。")
                 ]),
            make("rope into", "persuade or trick into",
                 "巻き込む・引き込む",
                 useCases: ["気が乗らないことを誘い込む話"],
                 examples: [
                    ("She roped me into helping.", "彼女に手伝いに引き込まれた。"),
                    ("Don't rope me into this.", "これに巻き込まないで。")
                 ]),
            make("scrap together", "gather scraps; piece together",
                 "かき集める",
                 useCases: ["少しずつ集めてなんとかする話"],
                 examples: [
                    ("I scraped together some money.", "なんとかお金をかき集めた。"),
                    ("Scrap together a meal.", "なんとか食事を作る。")
                 ]),
            make("shrug off", "dismiss; brush aside",
                 "軽く受け流す",
                 useCases: ["気にせず流す話"],
                 examples: [
                    ("She shrugged it off.", "彼女、軽く受け流した。"),
                    ("Just shrug it off.", "気にしないで流して。")
                 ]),
            make("size up", "evaluate; assess",
                 "値踏みする・見極める",
                 useCases: ["人や状況を判断する話"],
                 examples: [
                    ("He sized me up.", "彼、私を品定めしてた。"),
                    ("Size up the competition.", "ライバルを見極めて。")
                 ]),
            make("square away", "put in order",
                 "きちんと片付ける",
                 useCases: ["手続きや問題を整理する話"],
                 examples: [
                    ("Get things squared away.", "色々整理してから。"),
                    ("It's all squared away.", "全部片付いた。")
                 ]),
            make("whip out", "pull out quickly",
                 "さっと取り出す",
                 useCases: ["スマホや財布を素早く出す話"],
                 examples: [
                    ("He whipped out his phone.", "彼、サッと携帯出した。"),
                    ("Whip out the camera.", "カメラ取り出して。")
                 ])
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
                 ]),
            make("bluff", "pretend; deceive",
                 "はったりをかける",
                 useCases: ["ポーカーや交渉で強がる話"],
                 examples: [
                    ("He's bluffing.", "あいつハッタリだ。"),
                    ("Don't bluff me.", "はったりかけないで。")
                 ]),
            make("brag", "boast about oneself",
                 "自慢する",
                 useCases: ["自慢話をする人を表すとき"],
                 examples: [
                    ("Stop bragging.", "自慢やめて。"),
                    ("He brags about everything.", "彼、何でも自慢する。")
                 ]),
            make("dodge", "avoid by quick movement",
                 "かわす・避ける",
                 useCases: ["物理的にかわす話", "質問を避ける話"],
                 examples: [
                    ("She dodged the question.", "彼女、質問をかわした。"),
                    ("Dodge the ball!", "ボール避けて！")
                 ]),
            make("drift", "move slowly; lose focus",
                 "漂う・話がそれる",
                 useCases: ["注意が散漫になる話", "話題が脱線する話"],
                 examples: [
                    ("My mind drifted.", "気が散ってた。"),
                    ("We drifted off topic.", "話がそれた。")
                 ]),
            make("fiddle", "play around with absentmindedly",
                 "いじくる・もてあそぶ",
                 useCases: ["手元の物を意味なく触る話"],
                 examples: [
                    ("Stop fiddling with that.", "それいじくらないで。"),
                    ("She fiddled with her ring.", "彼女、指輪をいじってた。")
                 ]),
            make("fumble", "handle clumsily; struggle",
                 "まごつく・手探りする",
                 useCases: ["うまく扱えなくて慌てる話"],
                 examples: [
                    ("He fumbled with the keys.", "彼、鍵をまごついて出した。"),
                    ("Fumbled the ball.", "ボール落とした。")
                 ]),
            make("giggle", "laugh in a silly way",
                 "クスクス笑う",
                 useCases: ["軽い笑い・はにかみ笑い"],
                 examples: [
                    ("She giggled.", "彼女、クスッと笑った。"),
                    ("Stop giggling.", "笑わないで。")
                 ]),
            make("gobble", "eat quickly and noisily",
                 "がつがつ食べる",
                 useCases: ["勢いよく食べる様子"],
                 examples: [
                    ("He gobbled up the pizza.", "彼、ピザがっついた。"),
                    ("Don't gobble!", "がっつかないで！")
                 ]),
            make("grumble", "complain in a low voice",
                 "ぶつぶつ言う",
                 useCases: ["小声で不満を漏らす話"],
                 examples: [
                    ("He's grumbling about work.", "彼、仕事のことぶつぶつ言ってる。"),
                    ("Stop grumbling.", "ぶつぶつ言わないで。")
                 ]),
            make("hover", "linger; stay close",
                 "うろうろする・近くにいる",
                 useCases: ["近くで様子を伺う話"],
                 examples: [
                    ("Stop hovering!", "うろちょろしないで！"),
                    ("He hovered behind me.", "彼、後ろでうろうろしてた。")
                 ]),
            make("lecture", "give a long talk; scold",
                 "説教する",
                 useCases: ["長々と諭す話"],
                 examples: [
                    ("Don't lecture me.", "説教しないで。"),
                    ("She lectured me for an hour.", "1時間も説教された。")
                 ]),
            make("linger", "stay longer; be slow to leave",
                 "ぐずぐずする・残る",
                 useCases: ["なかなか帰らない様子"],
                 examples: [
                    ("The smell lingered.", "匂いが残ってた。"),
                    ("Don't linger.", "ぐずぐずしないで。")
                 ]),
            make("mumble", "speak unclearly",
                 "もごもご言う",
                 useCases: ["口の中で何か言う話"],
                 examples: [
                    ("Stop mumbling.", "はっきり言って。"),
                    ("He mumbled an apology.", "彼、ぼそっと謝った。")
                 ]),
            make("nag", "complain or remind repeatedly",
                 "小言を言う・うるさく言う",
                 useCases: ["何度も繰り返し注意する話"],
                 examples: [
                    ("Stop nagging me.", "ガミガミ言わないで。"),
                    ("She nags about everything.", "彼女、何でもうるさく言う。")
                 ]),
            make("peek", "look quickly and secretly",
                 "こっそり覗く",
                 useCases: ["ちらっと盗み見する話"],
                 examples: [
                    ("Don't peek!", "覗かないで！"),
                    ("She peeked at the gift.", "彼女、こっそりプレゼント見た。")
                 ]),
            make("ponder", "think deeply about",
                 "じっくり考える",
                 useCases: ["熟考する話"],
                 examples: [
                    ("Let me ponder it.", "ちょっと考えさせて。"),
                    ("He pondered the question.", "彼は質問をじっくり考えた。")
                 ]),
            make("rant", "speak angrily at length",
                 "まくし立てる・怒鳴る",
                 useCases: ["怒って長々と話す話"],
                 examples: [
                    ("He's ranting again.", "彼、また熱弁してる。"),
                    ("Don't rant at me.", "私にまくし立てないで。")
                 ]),
            make("scribble", "write hastily",
                 "走り書きする",
                 useCases: ["雑にメモする話"],
                 examples: [
                    ("I scribbled a note.", "メモを走り書きした。"),
                    ("Just scribble it down.", "ささっとメモして。")
                 ]),
            make("sigh", "exhale audibly",
                 "ため息をつく",
                 useCases: ["疲労や落胆のサイン"],
                 examples: [
                    ("She sighed deeply.", "彼女、深いため息をついた。"),
                    ("He sighed in relief.", "彼、ほっとしてため息ついた。")
                 ]),
            make("smirk", "smile smugly or knowingly",
                 "ニヤつく・薄笑いを浮かべる",
                 useCases: ["得意げ・皮肉の笑み"],
                 examples: [
                    ("He smirked at me.", "彼、私にニヤッとした。"),
                    ("Wipe that smirk off your face.", "そのニヤけた顔やめて。")
                 ]),
            make("stammer", "speak with hesitation",
                 "どもる",
                 useCases: ["緊張で言葉が詰まる話"],
                 examples: [
                    ("She stammered an answer.", "彼女、どもりながら答えた。"),
                    ("I stammered through it.", "なんとかどもりながら話した。")
                 ]),
            make("sulk", "be silently moody",
                 "すねる・むくれる",
                 useCases: ["不機嫌で黙り込む話"],
                 examples: [
                    ("Don't sulk.", "すねないで。"),
                    ("He's sulking in his room.", "彼、部屋でむくれてる。")
                 ]),
            make("vent", "express frustration",
                 "愚痴をこぼす・発散する",
                 useCases: ["不満を吐き出す話"],
                 examples: [
                    ("Let me vent for a sec.", "ちょっと愚痴らせて。"),
                    ("She vented to me.", "彼女、私に愚痴った。")
                 ]),
            make("wander", "move aimlessly; lose focus",
                 "さまよう・気が散る",
                 useCases: ["目的なく歩く話", "注意が散漫になる話"],
                 examples: [
                    ("My mind wandered.", "気が散ってた。"),
                    ("She wandered off.", "彼女、ふらっといなくなった。")
                 ])
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
                 ]),
            make("broke", "having no money",
                 "金欠の・無一文",
                 useCases: ["お金がない時の口語"],
                 examples: [
                    ("I'm broke.", "金欠。"),
                    ("Totally broke this month.", "今月マジ金欠。")
                 ]),
            make("catchy", "easy to remember; appealing",
                 "耳に残る・キャッチーな",
                 useCases: ["音楽や言い回しが耳に残る話"],
                 examples: [
                    ("Catchy tune!", "耳に残る曲！"),
                    ("That's a catchy slogan.", "キャッチーな標語だ。")
                 ]),
            make("cheesy", "tacky; corny",
                 "安っぽい・わざとらしい",
                 useCases: ["くさい演出や台詞を表すとき"],
                 examples: [
                    ("That's so cheesy.", "それくさいなあ。"),
                    ("Cheesy pickup line.", "ベタなナンパ文句。")
                 ]),
            make("clingy", "overly attached",
                 "まとわりつく・依存的な",
                 useCases: ["距離感の近すぎる人を表すとき"],
                 examples: [
                    ("He's so clingy.", "彼、構ってちゃん。"),
                    ("Don't be clingy.", "依存しすぎないで。")
                 ]),
            make("cocky", "overconfident; arrogant",
                 "生意気な・自惚れた",
                 useCases: ["自信過剰な態度を表すとき"],
                 examples: [
                    ("Don't get cocky.", "調子に乗らないで。"),
                    ("He's a bit cocky.", "彼ちょっと生意気。")
                 ]),
            make("corny", "old-fashioned; lame",
                 "古臭い・寒い",
                 useCases: ["くだらないジョークや演出"],
                 examples: [
                    ("That joke is corny.", "そのジョーク寒い。"),
                    ("Corny but cute.", "ベタだけど可愛い。")
                 ]),
            make("creepy", "unsettling; weird",
                 "気味悪い",
                 useCases: ["気味悪い人や場所を表すとき"],
                 examples: [
                    ("That's creepy.", "気持ち悪い。"),
                    ("Creepy vibes.", "ゾッとする雰囲気。")
                 ]),
            make("fishy", "suspicious; doubtful",
                 "怪しい・うさんくさい",
                 useCases: ["何か怪しいと感じるとき"],
                 examples: [
                    ("Something's fishy.", "なんか怪しい。"),
                    ("That sounds fishy.", "それ怪しい。")
                 ]),
            make("flaky", "unreliable; capricious",
                 "当てにならない・気まぐれ",
                 useCases: ["約束を守らない人を表すとき"],
                 examples: [
                    ("He's so flaky.", "彼、当てにならない。"),
                    ("Don't be flaky.", "ドタキャンとかしないで。")
                 ]),
            make("fussy", "picky; hard to please",
                 "気難しい・うるさい",
                 useCases: ["細かいことにこだわる人を表すとき"],
                 examples: [
                    ("She's a fussy eater.", "彼女、好き嫌い多い。"),
                    ("Don't be fussy.", "うるさく言わないで。")
                 ]),
            make("groggy", "dazed; sleepy",
                 "ぼんやりした・寝起きの",
                 useCases: ["寝起きや疲れで頭が回らない話"],
                 examples: [
                    ("I'm still groggy.", "まだ寝ぼけてる。"),
                    ("Feeling groggy this morning.", "今朝はぼーっとしてる。")
                 ]),
            make("hectic", "chaotic and busy",
                 "めちゃくちゃ忙しい",
                 useCases: ["バタバタしている状況"],
                 examples: [
                    ("It's been hectic.", "バタバタしてた。"),
                    ("Hectic week.", "ヘクティックな週。")
                 ]),
            make("iffy", "uncertain; questionable",
                 "微妙・怪しい",
                 useCases: ["不確かな状況を表すとき"],
                 examples: [
                    ("It's a bit iffy.", "ちょっと怪しい。"),
                    ("The weather's iffy.", "天気微妙。")
                 ]),
            make("moody", "having unpredictable moods",
                 "気分屋の",
                 useCases: ["気分の浮き沈みが激しい人"],
                 examples: [
                    ("She's so moody today.", "彼女、今日機嫌悪い。"),
                    ("He's a moody guy.", "彼は気分屋。")
                 ]),
            make("needy", "overly demanding of attention",
                 "構ってちゃん・依存的",
                 useCases: ["構ってもらいたがる人"],
                 examples: [
                    ("Don't be needy.", "構ってちゃんにならないで。"),
                    ("He's pretty needy.", "彼かなり構ってちゃん。")
                 ]),
            make("nosy", "too curious about others' affairs",
                 "詮索好き",
                 useCases: ["プライバシーに踏み込む人"],
                 examples: [
                    ("Don't be nosy.", "詮索しないで。"),
                    ("Nosy neighbors.", "詮索好きな隣人。")
                 ]),
            make("petty", "small-minded; trivial",
                 "細かい・くだらない",
                 useCases: ["どうでもいいことに執着する話"],
                 examples: [
                    ("That's so petty.", "それ細かすぎ。"),
                    ("Don't be petty.", "細かいこと気にしないで。")
                 ]),
            make("shady", "suspicious; unreliable",
                 "怪しい・うさんくさい",
                 useCases: ["怪しい人物や取引"],
                 examples: [
                    ("That guy looks shady.", "あいつ怪しい。"),
                    ("Sketchy and shady.", "色々怪しい。")
                 ]),
            make("sketchy", "dubious; unclear",
                 "怪しい・あやふや",
                 useCases: ["不審な場所や記憶を表すとき"],
                 examples: [
                    ("That neighborhood is sketchy.", "あそこ治安悪い。"),
                    ("My memory's sketchy.", "記憶が曖昧。")
                 ])
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
                 ]),
            make("drag", "a boring or tedious thing",
                 "退屈な人/物・面倒",
                 useCases: ["つまらない、面倒なことを言うとき"],
                 examples: [
                    ("What a drag.", "面倒だなー。"),
                    ("This party is a drag.", "このパーティーつまらない。")
                 ]),
            make("fluke", "a lucky accident",
                 "まぐれ・偶然",
                 useCases: ["運良くできたことを表すとき"],
                 examples: [
                    ("Pure fluke.", "完全にまぐれ。"),
                    ("It was a fluke.", "ただの偶然だ。")
                 ]),
            make("gist", "the main point",
                 "要点・大筋",
                 useCases: ["話の核心を伝えるとき"],
                 examples: [
                    ("Get the gist?", "要点わかる？"),
                    ("Just the gist of it.", "要点だけね。")
                 ]),
            make("glimpse", "a brief look",
                 "ちらっと見ること",
                 useCases: ["一瞬だけ見る話"],
                 examples: [
                    ("I caught a glimpse.", "ちらっと見えた。"),
                    ("Just a glimpse.", "ちらっとだけ。")
                 ]),
            make("hassle", "annoying trouble",
                 "面倒・厄介事",
                 useCases: ["面倒な手続きや事情"],
                 examples: [
                    ("What a hassle.", "面倒だな。"),
                    ("Too much hassle.", "手間かかりすぎ。")
                 ]),
            make("hunch", "intuitive feeling",
                 "直感・予感",
                 useCases: ["論理ではなく勘で判断する話"],
                 examples: [
                    ("I have a hunch.", "なんとなく予感がする。"),
                    ("Just a hunch.", "ただの勘。")
                 ]),
            make("jerk", "a rude or annoying person",
                 "嫌な奴・ろくでなし",
                 useCases: ["失礼な人を表すカジュアル表現"],
                 examples: [
                    ("Don't be a jerk.", "嫌な奴になるな。"),
                    ("What a jerk.", "ひどいやつ。")
                 ]),
            make("kicker", "the surprising twist",
                 "落とし所・どんでん返し",
                 useCases: ["話のオチを伝えるとき"],
                 examples: [
                    ("Here's the kicker.", "ここがオチ。"),
                    ("And the kicker is...", "そして驚きなのが…")
                 ]),
            make("knack", "a clever talent",
                 "コツ・才能",
                 useCases: ["何かが得意な人を表すとき"],
                 examples: [
                    ("She has a knack for it.", "彼女、それコツ掴んでる。"),
                    ("Got the knack.", "コツ掴んだ。")
                 ]),
            make("loophole", "a gap in rules",
                 "抜け穴",
                 useCases: ["法律やルールの抜け道を話すとき"],
                 examples: [
                    ("Found a loophole.", "抜け穴見つけた。"),
                    ("Tax loophole.", "税の抜け穴。")
                 ]),
            make("scoop", "the latest news",
                 "内輪話・特ダネ",
                 useCases: ["最新の噂やゴシップ"],
                 examples: [
                    ("What's the scoop?", "最新情報何？"),
                    ("Got the scoop on her.", "彼女のスクープゲットした。")
                 ]),
            make("snag", "a small obstacle",
                 "障害・問題",
                 useCases: ["小さなトラブルが起きた話"],
                 examples: [
                    ("Hit a snag.", "ちょっとつまずいた。"),
                    ("Small snag in the plan.", "計画にちょっと問題あり。")
                 ])
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
                 ]),
            make("a deal-breaker", "an unacceptable condition",
                 "譲れない条件・ダメな条件",
                 useCases: ["これがダメなら成立しない要素"],
                 examples: [
                    ("That's a deal-breaker for me.", "それは無理。"),
                    ("Pets are a deal-breaker.", "ペット不可は無理。")
                 ]),
            make("the elephant in the room", "an obvious issue everyone avoids",
                 "みんな気づいてるのに触れない問題",
                 useCases: ["話しにくい話題に切り込むとき"],
                 examples: [
                    ("Let's address the elephant in the room.", "触れにくい話に触れよう。"),
                    ("It's the elephant in the room.", "皆避けてる話題だよね。")
                 ]),
            make("a wake-up call", "a warning that prompts change",
                 "目が覚めるような出来事・警告",
                 useCases: ["気付かされる体験を語るとき"],
                 examples: [
                    ("That was a real wake-up call.", "あれは目が覚めた。"),
                    ("It's a wake-up call.", "目を覚まさせる出来事だ。")
                 ]),
            make("a long story", "complicated to explain",
                 "話せば長い",
                 useCases: ["説明が長くなることを示唆するとき"],
                 examples: [
                    ("It's a long story.", "話せば長くなる。"),
                    ("Long story short, no.", "結論を言うとダメ。")
                 ])
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
                 ]),
            make("come to think of it", "now that I think about it",
                 "そういえば",
                 useCases: ["ふと思い出して話すとき"],
                 examples: [
                    ("Come to think of it, he called.", "そういえば彼から電話あった。"),
                    ("Come to think of it, that's strange.", "考えてみればおかしい。")
                 ]),
            make("case in point", "a perfect example",
                 "その良い例・典型",
                 useCases: ["主張の具体例を挙げるとき"],
                 examples: [
                    ("Case in point: yesterday.", "その例が昨日のこと。"),
                    ("Case in point, look at this.", "好例だよ、これ見て。")
                 ])
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
                 ]),
            make("may as well", "we might as well",
                 "〜してもいいかな（同上）",
                 useCases: ["might as well と同じ意味の少し丁寧め"],
                 examples: [
                    ("May as well try.", "どうせなら試そう。"),
                    ("May as well start now.", "今始めてもいいかな。")
                 ]),
            make("would rather", "prefer to do something",
                 "〜したい（の方がまし）",
                 useCases: ["代案の方が良いと伝えるとき"],
                 examples: [
                    ("I'd rather walk.", "歩く方がいい。"),
                    ("I'd rather stay home.", "家にいたい。")
                 ]),
            make("could use", "would benefit from",
                 "〜が欲しい・必要",
                 useCases: ["欲しい物を控えめに伝えるとき"],
                 examples: [
                    ("I could use a coffee.", "コーヒー飲みたい。"),
                    ("Could use some help.", "ちょっと手伝ってほしい。")
                 ]),
            make("better off", "in a better situation",
                 "〜した方がいい・よりまし",
                 useCases: ["別の状態の方が良いと伝えるとき"],
                 examples: [
                    ("You're better off without him.", "彼なしの方がいい。"),
                    ("Better off staying.", "残った方がいい。")
                 ])
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
                 ]),
            make("right around the corner", "very near; almost here",
                 "すぐそこ・もうすぐ",
                 useCases: ["近い距離・近い時期を伝えるとき"],
                 examples: [
                    ("Summer's right around the corner.", "夏はもうすぐ。"),
                    ("The cafe is right around the corner.", "カフェはすぐそこ。")
                 ]),
            make("all the way", "entirely; the whole way",
                 "ずっと・はるばる",
                 useCases: ["最後までやり通す話", "遠路はるばる"],
                 examples: [
                    ("All the way to Tokyo.", "東京までずっと。"),
                    ("I support you all the way.", "ずっと応援してる。")
                 ]),
            make("way back", "long ago; far behind",
                 "ずっと昔・かなり後ろ",
                 useCases: ["ずっと昔の話・離れた距離"],
                 examples: [
                    ("Way back in 2010.", "ずっと昔の2010年に。"),
                    ("He's way back there.", "彼はかなり後ろにいる。")
                 ]),
            make("up front", "in advance; honestly",
                 "前もって・正直に",
                 useCases: ["事前に伝える話", "率直に話す話"],
                 examples: [
                    ("I'll be up front.", "正直に言うね。"),
                    ("Pay up front.", "前払いで。")
                 ]),
            make("all over the place", "everywhere; messy",
                 "そこら中に・めちゃくちゃ",
                 useCases: ["散らかっている様子", "話があちこち飛ぶ話"],
                 examples: [
                    ("Stuff is all over the place.", "物がそこら中に。"),
                    ("My mind is all over the place.", "頭の中ぐちゃぐちゃ。")
                 ]),
            make("on and off", "intermittently",
                 "断続的に",
                 useCases: ["途切れ途切れに続く話"],
                 examples: [
                    ("Rain on and off all day.", "一日中雨が降ったり止んだり。"),
                    ("We've dated on and off.", "付き合ったり別れたりしてた。")
                 ]),
            make("back and forth", "to and fro",
                 "行ったり来たり",
                 useCases: ["何度も往復する話"],
                 examples: [
                    ("He paced back and forth.", "彼、行ったり来たりしてた。"),
                    ("Emails back and forth.", "メールのやり取り。")
                 ]),
            make("side by side", "next to each other",
                 "並んで",
                 useCases: ["横並びで何かを行う話"],
                 examples: [
                    ("They walked side by side.", "二人並んで歩いた。"),
                    ("Stood side by side.", "横に並んで立った。")
                 ]),
            make("upside down", "inverted",
                 "逆さま",
                 useCases: ["物を裏返している話"],
                 examples: [
                    ("The book is upside down.", "本が逆さまだ。"),
                    ("Turn it upside down.", "逆さまにして。")
                 ])
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
                 ]),
            make("how do you figure", "what makes you think that",
                 "どうしてそう思うの？",
                 useCases: ["相手の推論の根拠を聞くとき"],
                 examples: [
                    ("How do you figure?", "どうしてそう思うの？"),
                    ("Why? How do you figure that?", "なんで？どう考えたの？")
                 ]),
            make("how do you like", "what do you think of",
                 "〜はどう？気に入った？",
                 useCases: ["感想を聞くとき"],
                 examples: [
                    ("How do you like the new job?", "新しい仕事どう？"),
                    ("How do you like it here?", "ここどう？")
                 ]),
            make("how do you say", "ask for translation or pronunciation",
                 "〜は…語で何と言う？",
                 useCases: ["別言語での言い方を聞くとき"],
                 examples: [
                    ("How do you say it in English?", "英語で何て言う？"),
                    ("How do you say 'thank you' in Japanese?", "thank you は日本語で何？")
                 ]),
            make("how would you feel about", "what do you think about",
                 "〜についてどう思う？",
                 useCases: ["提案について意見を聞くとき"],
                 examples: [
                    ("How would you feel about pizza?", "ピザはどう？"),
                    ("How would you feel about leaving early?", "早めに出るのどう思う？")
                 ])
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
                 ]),
            make("what for", "for what purpose",
                 "何のために？",
                 useCases: ["理由・目的を聞くとき"],
                 examples: [
                    ("What for?", "何のために？"),
                    ("Wait, what for?", "ちょっと、なんで？")
                 ]),
            make("what if", "what would happen if",
                 "もし〜だったら？",
                 useCases: ["仮定の話を切り出すとき"],
                 examples: [
                    ("What if it rains?", "もし雨だったら？"),
                    ("What if he's late?", "彼が遅れたらどうする？")
                 ]),
            make("what's the point", "what's the purpose",
                 "何の意味がある？",
                 useCases: ["やる意義を疑問視するとき"],
                 examples: [
                    ("What's the point?", "意味ある？"),
                    ("What's the point of this?", "これ何のため？")
                 ]),
            make("what's wrong with", "what's the issue with",
                 "〜の何がダメ？／どうしたの？",
                 useCases: ["何が問題かを問うとき"],
                 examples: [
                    ("What's wrong with you?", "どうしたの？"),
                    ("What's wrong with this idea?", "このアイデアの何が悪い？")
                 ]),
            make("what's up with", "what's going on with",
                 "〜どうしたの？",
                 useCases: ["状況を尋ねる口語"],
                 examples: [
                    ("What's up with him?", "彼どうしたの？"),
                    ("What's up with the noise?", "あの音何？")
                 ]),
            make("what's it to you", "why is it your business",
                 "お前に関係ない",
                 useCases: ["余計な詮索に反論するとき"],
                 examples: [
                    ("What's it to you?", "あなたに関係ある？"),
                    ("And what's it to you?", "で、何の関係？")
                 ]),
            make("what kind of", "what type of",
                 "どんな〜？",
                 useCases: ["種類を尋ねるとき"],
                 examples: [
                    ("What kind of music?", "どんな音楽？"),
                    ("What kind of person is he?", "彼ってどんな人？")
                 ]),
            make("what brings you here", "why are you here",
                 "どうしてここに？",
                 useCases: ["来訪の理由を聞くとき"],
                 examples: [
                    ("What brings you here?", "どうしてここに？"),
                    ("Hey! What brings you here?", "ねえ、どうしたの？")
                 ]),
            make("what do you say", "what's your reaction; how about",
                 "どう？・〜しない？",
                 useCases: ["提案に対する反応を伺うとき"],
                 examples: [
                    ("What do you say?", "どう？"),
                    ("What do you say we go now?", "今行くのどう？")
                 ])
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
                 ]),
            make("have something done", "have something done (formal-ish)",
                 "〜してもらう（やや改まった）",
                 useCases: ["業者やプロに作業してもらう話"],
                 examples: [
                    ("I had my car fixed.", "車を直してもらった。"),
                    ("Had the photos printed.", "写真を印刷してもらった。")
                 ]),
            make("get someone to do", "persuade someone to do",
                 "人に〜させる・してもらう",
                 useCases: ["説得して動いてもらう話"],
                 examples: [
                    ("I got him to help.", "彼に手伝ってもらった。"),
                    ("Get her to call back.", "彼女から折り返してもらって。")
                 ]),
            make("have someone do", "ask or order someone to do",
                 "人に〜させる",
                 useCases: ["指示して動かす話"],
                 examples: [
                    ("I had him wait.", "彼に待たせた。"),
                    ("Have her come over.", "彼女に来てもらって。")
                 ]),
            make("make someone do", "force someone to do",
                 "人に〜させる（強制）",
                 useCases: ["強制的にやらせる話"],
                 examples: [
                    ("He made me cry.", "彼が私を泣かせた。"),
                    ("Don't make me wait.", "待たせないで。")
                 ]),
            make("let someone do", "allow someone to do",
                 "人に〜させる（許可）",
                 useCases: ["許可を与える話"],
                 examples: [
                    ("Let me know.", "知らせて。"),
                    ("Let him try.", "彼に試させて。")
                 ]),
            make("help someone do", "assist someone with doing",
                 "〜するのを手伝う",
                 useCases: ["手伝う場面"],
                 examples: [
                    ("Help me carry this.", "運ぶの手伝って。"),
                    ("She helped me move.", "彼女が引っ越し手伝ってくれた。")
                 ]),
            make("see someone doing", "observe someone in the act",
                 "〜しているのを見る/聞く",
                 useCases: ["途中を目撃する話"],
                 examples: [
                    ("I saw him leaving.", "彼が出ていくところを見た。"),
                    ("I heard her singing.", "彼女が歌うのを聞いた。")
                 ]),
            make("catch someone doing", "discover someone in the act",
                 "〜しているのを目撃する",
                 useCases: ["不意に見つける話"],
                 examples: [
                    ("I caught him lying.", "嘘をついているのを見つけた。"),
                    ("Caught them sneaking out.", "こっそり出るのを見つけた。")
                 ]),
            make("find someone doing", "discover someone in a state",
                 "〜だと気づく",
                 useCases: ["ある状態を見つける話"],
                 examples: [
                    ("I found her crying.", "泣いているのを見た。"),
                    ("Found him asleep.", "彼が寝ているのを見つけた。")
                 ])
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
                 ]),
            make("come to realize", "gradually understand",
                 "気づくに至る",
                 useCases: ["徐々に気づく話"],
                 examples: [
                    ("I came to realize the truth.", "真実に気づくに至った。"),
                    ("She came to realize her mistake.", "彼女、自分の過ちに気づいた。")
                 ]),
            make("get to do", "have the chance to do",
                 "〜できる機会を得る",
                 useCases: ["珍しい機会を得た話"],
                 examples: [
                    ("I got to meet him.", "彼に会えた。"),
                    ("Got to try sushi for the first time.", "初めて寿司食べられた。")
                 ]),
            make("get to a place", "arrive at a place",
                 "〜に着く",
                 useCases: ["目的地に到着する話"],
                 examples: [
                    ("How do I get to the station?", "駅へどう行く？"),
                    ("We got to the hotel late.", "ホテルに遅く着いた。")
                 ]),
            make("used to", "did regularly in the past",
                 "かつて〜していた",
                 useCases: ["昔の習慣を語るとき"],
                 examples: [
                    ("I used to smoke.", "昔タバコを吸ってた。"),
                    ("Used to live in NY.", "ニューヨークに住んでた。")
                 ]),
            make("be used to", "be familiar with",
                 "〜に慣れている",
                 useCases: ["既に慣れている状態を表すとき"],
                 examples: [
                    ("I'm used to it.", "慣れてる。"),
                    ("Are you used to the cold?", "寒さに慣れた？")
                 ]),
            make("be supposed to", "expected to",
                 "〜することになっている",
                 useCases: ["予定や規則を伝えるとき"],
                 examples: [
                    ("I'm supposed to call her.", "彼女に電話することになってる。"),
                    ("You're not supposed to be here.", "ここにいちゃダメ。")
                 ]),
            make("be about to", "on the verge of",
                 "今にも〜しようとしている",
                 useCases: ["直前の動作を伝えるとき"],
                 examples: [
                    ("I was about to leave.", "ちょうど出るところだった。"),
                    ("It's about to rain.", "今にも雨が降りそう。")
                 ]),
            make("come down to", "ultimately depend on",
                 "結局〜次第になる",
                 useCases: ["最終的に何で決まるかを話すとき"],
                 examples: [
                    ("It comes down to money.", "結局はお金の問題。"),
                    ("Comes down to your choice.", "君の選択次第。")
                 ])
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
                 ]),
            make("what I want is", "the thing I want is…",
                 "私が〜なのは",
                 useCases: ["欲しいものを強調するとき"],
                 examples: [
                    ("What I want is rest.", "欲しいのは休息。"),
                    ("What I need is time.", "必要なのは時間。")
                 ]),
            make("all I want is", "the only thing I want is",
                 "私が〜することは全て",
                 useCases: ["欲しいものを限定して伝えるとき"],
                 examples: [
                    ("All I want is peace.", "欲しいのは平和だけ。"),
                    ("All I need is one chance.", "必要なのは1回のチャンスだけ。")
                 ]),
            make("the thing is", "actually; here's the thing",
                 "実はね",
                 useCases: ["切り出しの前置き"],
                 examples: [
                    ("The thing is, I forgot.", "実は忘れた。"),
                    ("The thing is, it's expensive.", "実はそれ高いんだよ。")
                 ]),
            make("the point is", "what matters is",
                 "要点はこうだ",
                 useCases: ["要点をまとめるとき"],
                 examples: [
                    ("The point is, we lost.", "要は負けた。"),
                    ("The point is to try.", "大事なのは挑戦すること。")
                 ])
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
                 ]),
            make("as as possible", "as X as possible",
                 "できるだけ〜",
                 useCases: ["最大限を要求するとき"],
                 examples: [
                    ("As soon as possible.", "できるだけ早く。"),
                    ("As quietly as possible.", "できるだけ静かに。")
                 ]),
            make("as as can be", "as X as can be",
                 "この上なく〜",
                 useCases: ["極限の状態を表すとき"],
                 examples: [
                    ("As happy as can be.", "最高に幸せ。"),
                    ("As busy as can be.", "ものすごく忙しい。")
                 ]),
            make("no more than", "not exceeding; only",
                 "〜以下・〜だけ",
                 useCases: ["上限や控えめな量を示すとき"],
                 examples: [
                    ("No more than $10.", "10ドル以下。"),
                    ("No more than 5 people.", "5人まで。")
                 ]),
            make("less than", "fewer than",
                 "〜より少なく",
                 useCases: ["量や程度を比較して少ないと言うとき"],
                 examples: [
                    ("Less than I thought.", "思ったより少ない。"),
                    ("Less than 10 minutes.", "10分以内。")
                 ]),
            make("better than nothing", "preferable to none",
                 "ないよりまし",
                 useCases: ["少しでもあった方が良いと言うとき"],
                 examples: [
                    ("It's better than nothing.", "ないよりはマシ。"),
                    ("Hey, better than nothing!", "まあ、無いよりはマシ！")
                 ]),
            make("the same as", "identical to",
                 "〜と同じ",
                 useCases: ["同じだと伝えるとき"],
                 examples: [
                    ("Same as before.", "前と同じ。"),
                    ("The same as yours.", "あなたのと同じ。")
                 ]),
            make("different from", "not the same as",
                 "〜と違う",
                 useCases: ["違いを伝えるとき"],
                 examples: [
                    ("Different from yesterday.", "昨日と違う。"),
                    ("It's different from what I expected.", "思ったのと違う。")
                 ]),
            make("as good as", "almost; equivalent to",
                 "〜と同じくらい・ほぼ〜",
                 useCases: ["ほぼ同等であることを伝えるとき"],
                 examples: [
                    ("As good as new.", "ほぼ新品。"),
                    ("As good as done.", "ほぼ終わったも同然。")
                 ])
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
                 ]),
            make("if it weren't for", "if not for",
                 "〜がなかったら",
                 useCases: ["仮定で原因や恩を語るとき"],
                 examples: [
                    ("If it weren't for you, I'd fail.", "君がいなきゃ失敗してた。"),
                    ("If it weren't for the rain.", "雨さえなければね。")
                 ]),
            make("but for", "if not for (formal)",
                 "〜がなければ",
                 useCases: ["フォーマルに「if it weren't for」と同じ意味で"],
                 examples: [
                    ("But for your help, I'd be lost.", "君の助けがなければ困ってた。"),
                    ("But for that, perfect.", "それさえなければ完璧。")
                 ]),
            make("suppose", "assume; what if",
                 "仮に〜なら",
                 useCases: ["仮定の話を切り出すとき"],
                 examples: [
                    ("Suppose he comes?", "もし彼が来たら？"),
                    ("Supposing it rains, what then?", "もし雨ならどうする？")
                 ]),
            make("I wish", "I would like it to be (counterfactual)",
                 "〜だったらなあ",
                 useCases: ["叶わない願いを語るとき"],
                 examples: [
                    ("I wish I knew.", "知ってたらなあ。"),
                    ("I wish it were Friday.", "金曜だったらいいのに。")
                 ])
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
                 ]),
            make("there's no need to", "it's not necessary to",
                 "〜する必要はない",
                 useCases: ["不要だと伝えるとき"],
                 examples: [
                    ("There's no need to worry.", "心配いらない。"),
                    ("No need to apologize.", "謝らなくていいよ。")
                 ]),
            make("there's a chance", "there's a possibility",
                 "可能性がある",
                 useCases: ["ありえると伝えるとき"],
                 examples: [
                    ("There's a chance it'll rain.", "雨の可能性がある。"),
                    ("There's a chance, sure.", "可能性はあるね。")
                 ]),
            make("it takes to", "it requires X to do",
                 "〜するのに…かかる",
                 useCases: ["所要時間や努力を表すとき"],
                 examples: [
                    ("It takes time to learn.", "学ぶには時間がかかる。"),
                    ("It takes courage to speak.", "話すには勇気がいる。")
                 ]),
            make("it occurs to me", "a thought comes to mind",
                 "ふと思いつく",
                 useCases: ["突然思いつく場面"],
                 examples: [
                    ("It occurred to me.", "ふと思った。"),
                    ("It just occurred to me, why don't we go?", "ふと思ったんだけど、行かない？")
                 ])
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
                 ]),
            make("why don't you", "why not do; suggestion",
                 "〜したら？",
                 useCases: ["軽く提案するとき"],
                 examples: [
                    ("Why don't we eat?", "食べない？"),
                    ("Why don't you call her?", "彼女に電話したら？")
                 ]),
            make("what do you say we", "shall we; how about we",
                 "〜するのどう？",
                 useCases: ["共同行動を提案するとき"],
                 examples: [
                    ("What do you say we leave?", "出るのどう？"),
                    ("What do you say we grab lunch?", "ランチ食べに行かない？")
                 ]),
            make("let's not", "I suggest we don't",
                 "〜するのやめよう",
                 useCases: ["何かをしないように提案するとき"],
                 examples: [
                    ("Let's not fight.", "喧嘩やめよう。"),
                    ("Let's not be late.", "遅れないようにしよう。")
                 ]),
            make("don't bother", "don't trouble yourself",
                 "わざわざ〜しないで",
                 useCases: ["面倒を引き受けなくていいと伝えるとき"],
                 examples: [
                    ("Don't bother calling.", "わざわざ電話しなくていい。"),
                    ("Don't bother explaining.", "説明しなくていいよ。")
                 ])
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
                 ]),
            make("enough to", "X enough to do",
                 "〜するのに十分",
                 useCases: ["十分な程度を伝えるとき"],
                 examples: [
                    ("Old enough to vote.", "投票するのに十分な年齢。"),
                    ("Strong enough to lift it.", "持ち上げられるくらい強い。")
                 ]),
            make("so that", "so X that Y",
                 "とても…なので〜",
                 useCases: ["原因と結果を結びつけるとき"],
                 examples: [
                    ("So tired that I slept.", "疲れすぎて寝た。"),
                    ("So hot that we melted.", "暑すぎて溶けそう。")
                 ]),
            make("such that", "such X that Y",
                 "それほどの…なので〜",
                 useCases: ["名詞を強調する形での原因結果"],
                 examples: [
                    ("Such a long day that I'm done.", "長い一日でクタクタ。"),
                    ("Such a mess that I gave up.", "あまりにめちゃくちゃで諦めた。")
                 ]),
            make("not so much as", "not so much X as Y",
                 "〜というよりむしろ",
                 useCases: ["ニュアンスを訂正するとき"],
                 examples: [
                    ("Not so much tired as bored.", "疲れたというより退屈。"),
                    ("Not so much angry as confused.", "怒ってるというより混乱してる。")
                 ])
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
                 ]),
            make("wind up doing", "end up doing",
                 "結局〜になる",
                 useCases: ["end up と同じ意味で使うとき"],
                 examples: [
                    ("We wound up paying.", "結局払うはめになった。"),
                    ("Wound up missing the train.", "結局電車逃した。")
                 ]),
            make("can't help doing", "can't stop doing involuntarily",
                 "〜せずにいられない",
                 useCases: ["抑えられない反応を伝えるとき"],
                 examples: [
                    ("Can't help laughing.", "笑わずにいられない。"),
                    ("Can't help worrying.", "心配せずにいられない。")
                 ]),
            make("can't stand doing", "can't tolerate doing",
                 "〜が我慢できない",
                 useCases: ["強い嫌悪を表すとき"],
                 examples: [
                    ("Can't stand waiting.", "待つのが耐えられない。"),
                    ("Can't stand his attitude.", "彼の態度が我慢できない。")
                 ]),
            make("worth doing", "worthwhile to do",
                 "〜する価値がある",
                 useCases: ["価値があると勧めるとき"],
                 examples: [
                    ("Worth trying.", "試す価値あり。"),
                    ("This place is worth visiting.", "ここは行く価値ある。")
                 ]),
            make("have a hard time doing", "find it difficult to do",
                 "〜するのに苦労する",
                 useCases: ["難しさを訴えるとき"],
                 examples: [
                    ("Have a hard time sleeping.", "寝るのが大変。"),
                    ("Hard time understanding.", "理解するのが難しい。")
                 ]),
            make("have trouble doing", "have difficulty doing",
                 "〜するのに苦労する",
                 useCases: ["問題を抱えていることを伝えるとき"],
                 examples: [
                    ("Have trouble focusing.", "集中するのが大変。"),
                    ("Trouble logging in.", "ログインするのに苦労してる。")
                 ]),
            make("spend time doing", "use time doing",
                 "〜して時間を過ごす",
                 useCases: ["時間の使い方を伝えるとき"],
                 examples: [
                    ("Spend time reading.", "読書で時間を過ごす。"),
                    ("Spent the afternoon studying.", "午後は勉強して過ごした。")
                 ]),
            make("busy doing", "occupied doing",
                 "〜するのに忙しい",
                 useCases: ["何かに追われていると伝えるとき"],
                 examples: [
                    ("Busy working.", "仕事で忙しい。"),
                    ("She's busy cooking.", "彼女は料理で忙しい。")
                 ])
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
                 ]),
            make("it seems", "it appears that",
                 "〜のようだ",
                 useCases: ["やや距離を置いて推測するとき"],
                 examples: [
                    ("It seems he left.", "彼は出たようだ。"),
                    ("Seems he forgot.", "忘れたみたい。")
                 ]),
            make("look like", "appear similar to",
                 "〜のようだ・〜に似てる",
                 useCases: ["見た目から推測するとき"],
                 examples: [
                    ("Looks like rain.", "雨が降りそう。"),
                    ("You look like your mom.", "お母さんに似てるね。")
                 ]),
            make("sound like", "seem like (auditory)",
                 "〜のように聞こえる",
                 useCases: ["話の内容や音から推測するとき"],
                 examples: [
                    ("Sounds like fun.", "楽しそう。"),
                    ("Sounds like a plan.", "いい計画みたい。")
                 ]),
            make("feel like", "seem like; have the urge to",
                 "〜のような感じ・〜したい気分",
                 useCases: ["雰囲気を伝えるとき", "気分を伝えるとき"],
                 examples: [
                    ("Feels like Monday.", "月曜みたい。"),
                    ("Feel like pizza tonight.", "今夜はピザ食べたい気分。")
                 ])
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
                 ]),
            make("I'd say", "I'd estimate; my guess",
                 "〜と思う・言うなら",
                 useCases: ["控えめに意見を述べるとき"],
                 examples: [
                    ("I'd say it's fine.", "大丈夫だと思う。"),
                    ("I'd say about 5 minutes.", "5分くらいかな。")
                 ]),
            make("I bet", "I'm sure",
                 "〜に違いない・きっと",
                 useCases: ["強い確信を伝えるとき"],
                 examples: [
                    ("I bet he's late.", "きっと遅刻。"),
                    ("I bet you're tired.", "絶対疲れてるでしょ。")
                 ]),
            make("I take it", "I assume; I gather",
                 "〜ということだね",
                 useCases: ["相手の意図を確認するとき"],
                 examples: [
                    ("I take it you agree.", "賛成ってことね。"),
                    ("I take it you've heard.", "もう聞いたんでしょ。")
                 ]),
            make("as far as I know", "to my knowledge",
                 "私の知る限り",
                 useCases: ["自分の知識の範囲で答えるとき"],
                 examples: [
                    ("As far as I know, yes.", "知る限りはイエス。"),
                    ("As far as I know, it's open.", "私の知る限りオープンしてる。")
                 ])
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
                 ]),
            make("I'm planning to", "intending to",
                 "〜する予定",
                 useCases: ["予定を伝えるとき"],
                 examples: [
                    ("I'm planning to go.", "行く予定。"),
                    ("Planning to leave at 8.", "8時に出る予定。")
                 ]),
            make("I'm hoping to", "hoping to",
                 "〜できればと思って",
                 useCases: ["希望を控えめに伝えるとき"],
                 examples: [
                    ("I'm hoping to finish today.", "今日終わらせたい。"),
                    ("Hoping to see you soon.", "そのうち会えるといいな。")
                 ]),
            make("I'm looking to", "thinking about doing",
                 "〜したいと思っている",
                 useCases: ["やや具体的な意向を伝えるとき"],
                 examples: [
                    ("I'm looking to buy a car.", "車を買おうと思って。"),
                    ("Looking to move out soon.", "近いうちに引っ越したい。")
                 ]),
            make("I'm trying to", "attempting to",
                 "〜しようとしている",
                 useCases: ["努力中だと伝えるとき"],
                 examples: [
                    ("I'm trying to focus.", "集中しようとしてる。"),
                    ("Trying to lose weight.", "痩せようとしてる。")
                 ])
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
                 ]),
            make("back in the day", "long ago",
                 "昔は",
                 useCases: ["昔話の前置き"],
                 examples: [
                    ("Back in the day, we walked.", "昔は歩いて行った。"),
                    ("Back in the day, I was thin.", "昔はやせてたんだよ。")
                 ]),
            make("I remember when", "I recall the time when",
                 "〜だった時を覚えてる",
                 useCases: ["懐かしむときの口語"],
                 examples: [
                    ("I remember when we met.", "出会った時を覚えてる。"),
                    ("I remember when this was empty.", "ここがガラガラだった頃覚えてる。")
                 ]),
            make("there was this time", "there was a time when",
                 "こんなことがあって",
                 useCases: ["昔の小話を切り出すとき"],
                 examples: [
                    ("There was this time I...", "こんなことがあってさ…"),
                    ("There was this time we got lost.", "迷子になったことがあって。")
                 ])
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
                 ]),
            make("I guess", "I suppose; probably",
                 "〜じゃないかな",
                 useCases: ["やや自信なく推測するとき"],
                 examples: [
                    ("I guess so.", "そうかも。"),
                    ("I guess he forgot.", "忘れたんじゃないかな。")
                 ]),
            make("I figure", "I assume",
                 "〜だろう",
                 useCases: ["推測を伝えるとき"],
                 examples: [
                    ("I figure he forgot.", "忘れたんだろう。"),
                    ("I figure it's around 9.", "9時くらいだろう。")
                 ])
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
                 ]),
            make("you said", "you previously said",
                 "〜って言ったよね",
                 useCases: ["過去の発言を蒸し返すとき"],
                 examples: [
                    ("You said you'd come.", "来るって言ったよね。"),
                    ("You said it was free.", "無料って言ったじゃん。")
                 ]),
            make("you know", "as you're aware (filler)",
                 "〜じゃん・ねえ",
                 useCases: ["軽く同意を求める前置き"],
                 examples: [
                    ("You know he's nice.", "彼って優しいじゃん。"),
                    ("You know what I mean?", "言いたいこと分かるよね？")
                 ]),
            make("you'd think", "one would expect",
                 "普通〜だと思うよね",
                 useCases: ["常識を呆れて持ち出すとき"],
                 examples: [
                    ("You'd think he'd call.", "普通電話するよね。"),
                    ("You'd think they'd know.", "普通知ってるはずでしょ。")
                 ]),
            make("you'd be surprised", "it would surprise you",
                 "びっくりするよ",
                 useCases: ["意外な事実を切り出すとき"],
                 examples: [
                    ("You'd be surprised how easy.", "びっくりするほど簡単。"),
                    ("You'd be surprised what he said.", "彼が言ったこと聞いたらびっくりするよ。")
                 ])
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
                 ]),
            make("the way I see it", "in my opinion",
                 "私の見方では",
                 useCases: ["主観の意見を切り出すとき"],
                 examples: [
                    ("The way I see it, no.", "私の見方ではノー。"),
                    ("The way I see it, we lost.", "私から見れば負けた。")
                 ]),
            make("the way things are going", "given how things are progressing",
                 "今の流れだと",
                 useCases: ["今の状況から将来を予測するとき"],
                 examples: [
                    ("The way things are going, fail.", "この流れだと失敗。"),
                    ("The way things are going, no chance.", "この調子じゃ無理。")
                 ]),
            make("judging by the way", "based on the manner",
                 "〜の様子からして",
                 useCases: ["様子から判断するとき"],
                 examples: [
                    ("Judging by the way he looks, tired.", "様子からして疲れてる。"),
                    ("Judging by the way she walks, hurt.", "歩き方からして怪我してる。")
                 ]),
            make("that's just the way", "that's how it is",
                 "そういうものだ",
                 useCases: ["諦めの境地で物事を受け入れるとき"],
                 examples: [
                    ("That's just the way it is.", "そういうものだよ。"),
                    ("That's just the way she is.", "彼女ってそういう人。")
                 ])
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
                 ]),
            make("want me to", "do you want me to",
                 "〜しようか？",
                 useCases: ["手伝いを申し出るとき"],
                 examples: [
                    ("Want me to help?", "手伝おうか？"),
                    ("Want me to drive?", "運転しようか？")
                 ]),
            make("shall I", "should I",
                 "〜しましょうか？",
                 useCases: ["丁寧に申し出るとき"],
                 examples: [
                    ("Shall I open it?", "開けましょうか？"),
                    ("Shall I bring more?", "もう少しお持ちしましょうか？")
                 ]),
            make("mind if I", "do you mind if I",
                 "〜してもいい？",
                 useCases: ["許可を求めるとき"],
                 examples: [
                    ("Mind if I sit here?", "座ってもいい？"),
                    ("Mind if I borrow this?", "これ借りてもいい？")
                 ])
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
                 ]),
            make("judging from", "based on",
                 "〜から判断すると",
                 useCases: ["手がかりから判断するとき"],
                 examples: [
                    ("Judging from his face.", "顔つきから察するに。"),
                    ("Judging from the smell, burnt.", "匂いからして焦げてる。")
                 ])
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
                 ]),
            make("let me think", "give me a moment to think",
                 "考えさせて",
                 useCases: ["即答できない場面"],
                 examples: [
                    ("Let me think.", "考えさせて。"),
                    ("Let me think about it.", "ちょっと考えさせて。")
                 ]),
            make("let me get this straight", "let me make sure I understand",
                 "整理させて",
                 useCases: ["相手の話を確認しなおすとき"],
                 examples: [
                    ("Let me get this straight.", "整理させてね。"),
                    ("Wait, let me get this straight.", "ちょっと、確認させて。")
                 ]),
            make("let me put it this way", "let me phrase it like this",
                 "こう言おうか",
                 useCases: ["別の角度で説明するとき"],
                 examples: [
                    ("Let me put it this way.", "こう言わせて。"),
                    ("Let me put it this way: it's tough.", "言い換えると、厳しい。")
                 ]),
            make("let's just say", "let me put it this way; suggest",
                 "まあ〜とだけ言っておく",
                 useCases: ["詳細をぼかして伝えるとき"],
                 examples: [
                    ("Let's just say I know.", "知ってるとだけ言っておく。"),
                    ("Let's just say it didn't go well.", "うまくいかなかったとだけ。")
                 ])
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
                 ]),
            make("I'd hate to", "I really wouldn't want to",
                 "〜したくない",
                 useCases: ["気が進まないと丁寧に伝えるとき"],
                 examples: [
                    ("I'd hate to bother you.", "邪魔したくない。"),
                    ("I'd hate to miss it.", "見逃したくない。")
                 ]),
            make("I'd appreciate it if", "I'd be grateful if",
                 "〜してもらえると助かる",
                 useCases: ["丁寧に頼むとき"],
                 examples: [
                    ("I'd appreciate it if you'd call.", "電話くれると嬉しい。"),
                    ("I'd appreciate it if you helped.", "手伝ってくれると助かる。")
                 ]),
            make("I'd rather not", "I would prefer not to",
                 "遠慮したい",
                 useCases: ["丁重に断るとき"],
                 examples: [
                    ("I'd rather not say.", "言いたくない。"),
                    ("I'd rather not go.", "行きたくない。")
                 ]),
            make("I'd better", "I should",
                 "〜した方がいい",
                 useCases: ["自分が動くべきだと示すとき"],
                 examples: [
                    ("I'd better go.", "行った方がいい。"),
                    ("I'd better get started.", "始めないと。")
                 ])
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
                 ]),
            make("happen to", "by chance",
                 "たまたま〜する",
                 useCases: ["偶然性を強調するとき"],
                 examples: [
                    ("Happen to know?", "たまたま知ってる？"),
                    ("I happen to like it.", "たまたまそれ好きなんだ。")
                 ]),
            make("turn out to", "end up being",
                 "結果〜だった",
                 useCases: ["後から判明する話"],
                 examples: [
                    ("Turned out to be wrong.", "間違っていた。"),
                    ("Turned out to be cheaper.", "結果的に安くついた。")
                 ]),
            make("manage to", "succeed in doing",
                 "どうにか〜する",
                 useCases: ["努力して成功する話"],
                 examples: [
                    ("Managed to finish.", "どうにか終えた。"),
                    ("Managed to catch the train.", "なんとか電車に間に合った。")
                 ]),
            make("fail to", "not succeed in doing",
                 "〜できない",
                 useCases: ["やり損ねた話"],
                 examples: [
                    ("Failed to call.", "電話しそびれた。"),
                    ("She failed to mention it.", "彼女それに触れなかった。")
                 ])
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
                 ]),
            make("how (adjective)", "how + adj",
                 "なんて〜",
                 useCases: ["驚きや称賛を表すとき"],
                 examples: [
                    ("How nice!", "なんて素敵！"),
                    ("How sweet!", "なんて優しい！")
                 ]),
            make("such a", "such a (adj noun)",
                 "そんなに〜な",
                 useCases: ["強調しつつ感想を述べるとき"],
                 examples: [
                    ("Such a long day.", "なんて長い一日。"),
                    ("Such a kind person.", "本当に優しい人。")
                 ]),
            make("so (adjective)", "very + adj",
                 "とても〜",
                 useCases: ["感情を強調するとき"],
                 examples: [
                    ("So tired.", "めっちゃ疲れた。"),
                    ("So happy for you.", "とても嬉しいよ。")
                 ]),
            make("way (adjective)", "way + adj (super)",
                 "めちゃくちゃ〜",
                 useCases: ["カジュアルに強調するとき"],
                 examples: [
                    ("Way better.", "めっちゃいい。"),
                    ("Way faster than expected.", "想像よりめっちゃ速い。")
                 ])
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
                 ]),
            make("a little", "slightly",
                 "少し〜",
                 useCases: ["やわらかく程度を伝えるとき"],
                 examples: [
                    ("A little nervous.", "ちょっと緊張。"),
                    ("A little late, sorry.", "少し遅れた、ごめん。")
                 ]),
            make("somewhat", "to some extent",
                 "いくらか〜",
                 useCases: ["やや控えめな評価をするとき"],
                 examples: [
                    ("Somewhat surprised.", "いくらか驚いた。"),
                    ("Somewhat better.", "幾分かまし。")
                 ])
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
                 ]),
            make("come out", "be revealed; turn out",
                 "〜と分かる・明らかになる",
                 useCases: ["結果が判明する話"],
                 examples: [
                    ("Come out clean.", "潔白だと分かる。"),
                    ("It came out fine.", "うまく出来上がった。")
                 ])
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
                 ]),
            make("not supposed to", "shouldn't",
                 "〜してはいけない",
                 useCases: ["禁止されている話"],
                 examples: [
                    ("Not supposed to talk.", "話してはダメ。"),
                    ("You're not supposed to be here.", "ここにいちゃダメ。")
                 ]),
            make("what's that supposed to mean", "what do you mean by that",
                 "それどういう意味？",
                 useCases: ["失礼な発言に問い返すとき"],
                 examples: [
                    ("What's that supposed to mean?", "それどういう意味？"),
                    ("Hey, what's that supposed to mean?", "ねえ、それどういう意味？")
                 ]),
            make("as it's supposed to", "the way it should",
                 "本来あるべき姿で",
                 useCases: ["正しく動いている話"],
                 examples: [
                    ("As it's supposed to be.", "あるべき姿で。"),
                    ("Working as it's supposed to.", "正しく動いてる。")
                 ])
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
                 ]),
            make("chances are", "probably",
                 "おそらく",
                 useCases: ["確率高く起きる予測を伝えるとき"],
                 examples: [
                    ("Chances are he's late.", "おそらく遅れる。"),
                    ("Chances are she'll say yes.", "彼女はOKと言うだろう。")
                 ]),
            make("odds are", "it's likely",
                 "多分",
                 useCases: ["カジュアルな予測"],
                 examples: [
                    ("Odds are it'll rain.", "多分雨。"),
                    ("Odds are he forgot.", "彼、忘れたんだろうな。")
                 ]),
            make("it's no wonder", "no surprise that",
                 "〜なのも当然",
                 useCases: ["納得の理由を述べるとき"],
                 examples: [
                    ("No wonder he's tired.", "疲れて当然。"),
                    ("No wonder it broke.", "壊れて当然。")
                 ]),
            make("it makes sense that", "it's logical that",
                 "〜なのも納得",
                 useCases: ["納得感を伝えるとき"],
                 examples: [
                    ("Makes sense that he left.", "出るのも納得。"),
                    ("Makes sense it's expensive.", "高いのも納得。")
                 ])
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
                 ]),
            make("whatever it takes", "no matter what's needed",
                 "どんな手を使っても",
                 useCases: ["強い決意を表すとき"],
                 examples: [
                    ("Whatever it takes to win.", "勝つためなら何でも。"),
                    ("I'll do whatever it takes.", "何でもやる。")
                 ]),
            make("whoever", "any person who",
                 "〜する誰でも",
                 useCases: ["人を限定せずに伝えるとき"],
                 examples: [
                    ("Whoever wins gets it.", "勝った人がもらう。"),
                    ("Whoever called, hang up.", "誰がかけてきても切って。")
                 ]),
            make("whichever", "any of the choices",
                 "どちらでも",
                 useCases: ["選択を相手に任せるとき"],
                 examples: [
                    ("Whichever you like.", "お好きな方を。"),
                    ("Whichever works for you.", "君に合う方で。")
                 ])
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
                 ]),
            make("not necessarily", "not always; not certainly",
                 "そうとは限らない",
                 useCases: ["相手の決めつけをやんわり否定するとき"],
                 examples: [
                    ("Not necessarily true.", "必ずしも本当じゃない。"),
                    ("Not necessarily, no.", "必ずしもそうとは限らない。")
                 ]),
            make("not exactly", "not quite; not really",
                 "まさにそうではない",
                 useCases: ["微妙に違うとやんわり言うとき"],
                 examples: [
                    ("Not exactly fun.", "そんなに楽しくはない。"),
                    ("Not exactly cheap.", "別に安くはない。")
                 ]),
            make("not at all", "absolutely not",
                 "全然違う",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("Not at all what I wanted.", "全然欲しかったのと違う。"),
                    ("Not at all!", "全然！")
                 ])
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
                 ]),
            make("the truth is", "honestly",
                 "本当のところ",
                 useCases: ["本音を打ち明けるとき"],
                 examples: [
                    ("The truth is, I don't know.", "本当は分からない。"),
                    ("The truth is, I'm scared.", "正直、怖い。")
                 ]),
            make("the trouble is", "the problem is",
                 "問題はね",
                 useCases: ["難点を切り出すとき"],
                 examples: [
                    ("The trouble is, no time.", "問題は時間がない。"),
                    ("The trouble is, it costs too much.", "問題はコスト。")
                 ]),
            make("the question is", "what we need to ask is",
                 "問題は・問うべきは",
                 useCases: ["核心の問いを切り出すとき"],
                 examples: [
                    ("The question is why.", "問題はなぜか。"),
                    ("The question is, can we afford it?", "問題は払えるかだ。")
                 ])
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
                 ]),
            make("go get", "go and get",
                 "取りに行く",
                 useCases: ["何かを取って来てと頼むとき"],
                 examples: [
                    ("Go get it.", "取って来て。"),
                    ("Go get the keys.", "鍵取って来て。")
                 ]),
            make("come help", "come and help",
                 "手伝いに来て",
                 useCases: ["手助けを呼ぶとき"],
                 examples: [
                    ("Come help me.", "助けに来て。"),
                    ("Come help us out.", "手伝いに来て。")
                 ]),
            make("go grab", "go and grab",
                 "取って来る",
                 useCases: ["軽くつかみに行く話"],
                 examples: [
                    ("Go grab a coffee.", "コーヒー取ってくる。"),
                    ("Go grab your jacket.", "ジャケット取って来て。")
                 ]),
            make("come check out", "come and look at",
                 "見に来てよ",
                 useCases: ["新しいものを見せたいとき"],
                 examples: [
                    ("Come check it out.", "見に来てよ。"),
                    ("Come check out my place.", "うち見に来てよ。")
                 ])
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
                 ]),
            make("or what", "isn't it; right",
                 "〜じゃない？",
                 useCases: ["強く同意を求めるとき"],
                 examples: [
                    ("Cool or what?", "かっこよくない？"),
                    ("Crazy or what?", "やばくない？")
                 ]),
            make("or not", "yes or no",
                 "〜かどうか",
                 useCases: ["二択を迫るとき"],
                 examples: [
                    ("Coming or not?", "来るの来ないの？"),
                    ("True or not?", "本当か嘘か？")
                 ]),
            make("right?", "isn't that so",
                 "〜だよね？",
                 useCases: ["軽く同意を求めるとき"],
                 examples: [
                    ("You agree, right?", "賛成だよね？"),
                    ("It's hot, right?", "暑いよね？")
                 ])
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
                 ]),
            make("mate", "friend; pal (UK/AUS)",
                 "友よ・お前（男性同士）",
                 useCases: ["イギリスやオーストラリアでの呼びかけ"],
                 examples: [
                    ("Alright, mate?", "元気か？"),
                    ("Thanks, mate.", "ありがとう、相棒。")
                 ]),
            make("love", "term of endearment to a customer or friend",
                 "あなた（お店の人がお客に）",
                 useCases: ["カフェや店員が客に呼びかけるとき"],
                 examples: [
                    ("That'll be £5, love.", "5ポンドだよ。"),
                    ("Here you go, love.", "はいどうぞ。")
                 ]),
            make("alright?", "are you well? (UK greeting)",
                 "元気？・どうも？",
                 useCases: ["イギリスでの挨拶"],
                 examples: [
                    ("Alright?", "どうも？"),
                    ("Alright! Long time no see.", "おう！久しぶり。")
                 ]),
            make("you alright?", "are you okay? (UK greeting)",
                 "大丈夫？・元気？",
                 useCases: ["相手の様子を確認するとき"],
                 examples: [
                    ("You alright, mate?", "元気か？"),
                    ("You alright? You look tired.", "大丈夫？疲れて見える。")
                 ]),
            make("how's it going?", "how are things",
                 "調子どう？",
                 useCases: ["気軽な挨拶として"],
                 examples: [
                    ("How's it going?", "元気？"),
                    ("Hey, how's it going?", "やあ、調子どう？")
                 ]),
            make("ta", "thanks (very casual UK)",
                 "ありがとう（超カジュアル）",
                 useCases: ["イギリスで軽くお礼を言うとき"],
                 examples: [
                    ("Ta!", "どうも！"),
                    ("Ta very much.", "どうもありがとう。")
                 ]),
            make("see you later", "see you later",
                 "じゃあね・またね",
                 useCases: ["別れ際の決まり文句"],
                 examples: [
                    ("See you later.", "またね。"),
                    ("See you later, alligator.", "じゃあね。")
                 ])
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
                 ]),
            make("mental", "crazy; amazing (UK slang)",
                 "狂ってる・すごい",
                 useCases: ["驚きや興奮を表すとき"],
                 examples: [
                    ("That's mental!", "マジでヤバい。"),
                    ("It was absolutely mental.", "完全にイカれてた。")
                 ]),
            make("chuffed", "very pleased",
                 "嬉しい・満足",
                 useCases: ["イギリスで嬉しさを表現するとき"],
                 examples: [
                    ("Well chuffed!", "超嬉しい。"),
                    ("Chuffed to bits.", "めっちゃ嬉しい。")
                 ]),
            make("gutted", "really disappointed",
                 "がっかり・凹む",
                 useCases: ["落胆を強く伝えるとき"],
                 examples: [
                    ("I'm gutted.", "めっちゃ凹む。"),
                    ("Absolutely gutted!", "完全に落ち込んでる。")
                 ]),
            make("knackered", "exhausted (UK)",
                 "クタクタ・疲れ果てた",
                 useCases: ["強い疲労を表すとき"],
                 examples: [
                    ("I'm knackered.", "もうへとへと。"),
                    ("Knackered after work.", "仕事でクタクタ。")
                 ]),
            make("shattered", "exhausted",
                 "疲れ切った",
                 useCases: ["疲労困憊を表すとき"],
                 examples: [
                    ("Absolutely shattered.", "マジで疲れた。"),
                    ("I'm shattered, going to bed.", "クタクタ、寝るね。")
                 ]),
            make("sorted", "settled; taken care of",
                 "解決済み・OK",
                 useCases: ["問題が片付いた話"],
                 examples: [
                    ("It's sorted.", "もう片付いた。"),
                    ("All sorted, no worries.", "全部解決、心配ないよ。")
                 ]),
            make("dodgy", "dubious; iffy (UK)",
                 "怪しい・うさんくさい",
                 useCases: ["信用できない物事"],
                 examples: [
                    ("That's dodgy.", "それ怪しい。"),
                    ("Dodgy neighborhood.", "治安悪い地区。")
                 ]),
            make("cheeky", "saucy; impudent in a charming way",
                 "生意気な・ずる賢い",
                 useCases: ["軽くからかう・かわいげのあるイタズラ"],
                 examples: [
                    ("Cheeky little thing.", "生意気な奴だな。"),
                    ("A cheeky pint.", "ちょっと一杯。")
                 ])
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
                 ]),
            make("rather", "fairly; somewhat",
                 "かなり・むしろ",
                 useCases: ["やや控えめな評価のとき"],
                 examples: [
                    ("Rather expensive.", "けっこう高い。"),
                    ("Rather nice, actually.", "実は結構良い。")
                 ]),
            make("proper", "real; genuine; thorough (UK)",
                 "本物の・ちゃんとした",
                 useCases: ["きちんとしている、本物だと強調するとき"],
                 examples: [
                    ("A proper meal.", "ちゃんとした食事。"),
                    ("Proper job!", "よくやった！")
                 ]),
            make("dead", "very (UK slang)",
                 "めっちゃ〜",
                 useCases: ["強調副詞として"],
                 examples: [
                    ("Dead tired.", "めっちゃ疲れた。"),
                    ("Dead easy.", "超簡単。")
                 ]),
            make("bloody", "damn (UK intensifier)",
                 "めっちゃ・くそ",
                 useCases: ["強い感情を込めるとき"],
                 examples: [
                    ("Bloody brilliant!", "マジで最高！"),
                    ("Bloody hell!", "なんてこった！")
                 ])
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
                 ]),
            make("brew", "tea; sometimes coffee",
                 "お茶（紅茶）",
                 useCases: ["ティータイムを誘うとき"],
                 examples: [
                    ("Cup of brew?", "お茶どう？"),
                    ("Make us a brew.", "お茶入れて。")
                 ]),
            make("cuppa", "a cup of tea",
                 "一杯のお茶",
                 useCases: ["ティーを誘うイギリス的表現"],
                 examples: [
                    ("Fancy a cuppa?", "お茶飲む？"),
                    ("I'll put the cuppa on.", "お茶用意するね。")
                 ]),
            make("takeaway", "takeout food (UK)",
                 "持ち帰り",
                 useCases: ["持ち帰り注文するとき"],
                 examples: [
                    ("Order a takeaway.", "持ち帰り頼もう。"),
                    ("Indian takeaway tonight?", "今夜インド料理のテイク？")
                 ]),
            make("chippy", "fish and chips shop",
                 "フィッシュ&チップス店",
                 useCases: ["イギリスのチップ屋を指すとき"],
                 examples: [
                    ("Off to the chippy.", "チッピーに行く。"),
                    ("Local chippy is great.", "近所のチッピー美味しい。")
                 ])
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
                 ]),
            make("shall we", "shall we go (let's)",
                 "〜しましょうか",
                 useCases: ["丁寧に誘うとき"],
                 examples: [
                    ("Shall we go?", "行きましょうか？"),
                    ("Shall we, then?", "じゃあ、行こうか？")
                 ]),
            make("how about a cuppa", "how about tea",
                 "お茶でもどう？",
                 useCases: ["お茶に誘う定番フレーズ"],
                 examples: [
                    ("How about a cuppa?", "お茶でも？"),
                    ("How about a cuppa and a chat?", "お茶しながら話す？")
                 ]),
            make("let's pop out", "let's step out briefly",
                 "ちょっと出よう",
                 useCases: ["ちょっと外に出ようと誘うとき"],
                 examples: [
                    ("Let's pop out for lunch.", "昼ごはんに出よう。"),
                    ("Let's pop out to the shop.", "店に行こう。")
                 ])
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
                 ]),
            make("pop round", "drop by",
                 "立ち寄る",
                 useCases: ["カジュアルに訪問するとき"],
                 examples: [
                    ("Pop round tomorrow.", "明日寄るね。"),
                    ("Pop round for tea?", "お茶に寄る？")
                 ]),
            make("nip out", "step out briefly",
                 "ちょっと出る",
                 useCases: ["短時間外出する話"],
                 examples: [
                    ("Nip out for milk.", "牛乳買いに出る。"),
                    ("I'll just nip out.", "ちょっと出てくる。")
                 ]),
            make("queue", "line up (UK)",
                 "並ぶ",
                 useCases: ["イギリスで列を作るとき"],
                 examples: [
                    ("Queue here.", "ここで並んで。"),
                    ("Queue's long.", "列が長い。")
                 ]),
            make("post", "mail something (UK)",
                 "投函する",
                 useCases: ["手紙や荷物を出す話"],
                 examples: [
                    ("Post the letter.", "手紙を出す。"),
                    ("I'll post it tomorrow.", "明日出すね。")
                 ]),
            make("ring", "call on the phone (UK)",
                 "電話する",
                 useCases: ["電話の連絡を取るとき"],
                 examples: [
                    ("I'll ring you.", "電話するよ。"),
                    ("Give me a ring.", "電話して。")
                 ]),
            make("fortnight", "two weeks",
                 "2週間",
                 useCases: ["2週間の期間を表すとき"],
                 examples: [
                    ("In a fortnight.", "2週間後に。"),
                    ("Once a fortnight.", "2週間に1回。")
                 ]),
            make("wee", "small (Scottish/UK)",
                 "小さい・ちょっと",
                 useCases: ["小ささや少量を表すとき"],
                 examples: [
                    ("A wee bit.", "ちょっとだけ。"),
                    ("Just a wee minute.", "ちょっと待って。")
                 ]),
            make("nick", "steal; arrest (UK)",
                 "盗む・捕まえる",
                 useCases: ["盗難の話", "警察に捕まる話"],
                 examples: [
                    ("Someone nicked it.", "誰かに盗まれた。"),
                    ("Got nicked!", "捕まった！")
                 ]),
            make("reckon", "think; suppose (UK/AUS)",
                 "〜だと思う",
                 useCases: ["カジュアルに意見を述べるとき"],
                 examples: [
                    ("I reckon so.", "そう思う。"),
                    ("Reckon he'll come?", "彼来ると思う？")
                 ])
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
                 ]),
            make("bollocks", "nonsense; rubbish (UK vulgar)",
                 "でたらめ・くそ",
                 useCases: ["強く否定する場面"],
                 examples: [
                    ("That's bollocks.", "でたらめだ。"),
                    ("Bollocks!", "くそっ！")
                 ]),
            make("rubbish", "nonsense; trash",
                 "くだらない・ゴミ",
                 useCases: ["価値がないと否定するとき"],
                 examples: [
                    ("That's rubbish.", "くだらない。"),
                    ("Take out the rubbish.", "ゴミ出して。")
                 ])
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
                 ]),
            make("right", "okay; that's correct",
                 "そうだよね・了解",
                 useCases: ["相づち", "話を進めるための合いの手"],
                 examples: [
                    ("Right, let's go.", "よし、行こう。"),
                    ("Right, got it.", "了解、わかった。")
                 ]),
            make("spot on", "exactly right",
                 "その通り・ピッタリ",
                 useCases: ["完璧な答えに賛同するとき"],
                 examples: [
                    ("Spot on!", "その通り！"),
                    ("That's spot on.", "ぴったり。")
                 ])
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
                 ]),
            make("It strikes me as", "it appears to me as",
                 "〜のように感じる",
                 useCases: ["自分の印象を知的に伝えるとき"],
                 examples: [
                    ("It strikes me as odd.", "なんか奇妙に感じる。"),
                    ("It strikes me as a bit risky.", "少しリスキーに感じる。")
                 ]),
            make("It seems to me that", "in my view it seems",
                 "〜のように思える",
                 useCases: ["押し付けがましくなく意見を伝えるとき"],
                 examples: [
                    ("It seems to me that we agree.", "私たちは同意してるように思える。"),
                    ("It seems to me that this works.", "これでうまくいくように思う。")
                 ]),
            make("From my perspective", "from my point of view",
                 "私の視点では",
                 useCases: ["立場を明確にしつつ意見を述べるとき"],
                 examples: [
                    ("From my perspective, it works.", "私の視点ではうまくいく。"),
                    ("From my perspective, it's worth it.", "私から見れば価値がある。")
                 ]),
            make("As far as I can tell", "from what I can see",
                 "私の見る限り",
                 useCases: ["限定的な確信を控えめに伝えるとき"],
                 examples: [
                    ("As far as I can tell, fine.", "見る限り問題なし。"),
                    ("As far as I can tell, no issues.", "私が見る限り問題ない。")
                 ]),
            make("If I may", "if you'll allow me",
                 "もしよろしければ",
                 useCases: ["丁寧に発言の許可を求めるとき"],
                 examples: [
                    ("If I may, I'd suggest…", "よろしければご提案を…"),
                    ("If I may, one more thing.", "もしよければ、もう一つ。")
                 ]),
            make("Allow me to", "let me",
                 "〜させてください",
                 useCases: ["フォーマルな前置きとして"],
                 examples: [
                    ("Allow me to explain.", "説明させてください。"),
                    ("Allow me to introduce myself.", "自己紹介させてください。")
                 ])
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
                 ]),
            make("That's a fair point", "that's a valid point",
                 "それは妥当な指摘ですね",
                 useCases: ["建設的な議論で知的に同意するとき"],
                 examples: [
                    ("That's a fair point.", "それは妥当な指摘。"),
                    ("Hmm, that's a fair point.", "うん、もっともだ。")
                 ]),
            make("I see where you're coming from", "I understand your position",
                 "あなたの立場は理解できる",
                 useCases: ["意見が違っても相手を尊重するとき"],
                 examples: [
                    ("I see where you're coming from.", "言いたいことは分かる。"),
                    ("I see where you're coming from, but…", "立場は分かるけど…")
                 ]),
            make("there's something to that", "there's some truth in that",
                 "一理ある",
                 useCases: ["完全には同意しないが認めるとき"],
                 examples: [
                    ("There's something to that.", "一理あるね。"),
                    ("Actually, there's something to that.", "確かに、一理ある。")
                 ]),
            make("to a certain extent", "to some degree",
                 "ある程度は",
                 useCases: ["部分的同意を知的に表現するとき"],
                 examples: [
                    ("To a certain extent, yes.", "ある程度はそうだね。"),
                    ("Agree, to a certain extent.", "ある程度は同意。")
                 ])
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
                 ]),
            make("With all due respect", "while respecting you",
                 "失礼ながら",
                 useCases: ["強い反対を礼儀正しく言う定番"],
                 examples: [
                    ("With all due respect, I disagree.", "失礼ながら反対です。"),
                    ("With all due respect, that's wrong.", "失礼ですが間違っています。")
                 ]),
            make("I'm not entirely convinced", "I have doubts",
                 "完全には納得していない",
                 useCases: ["強くは否定せず疑問を投げかけるとき"],
                 examples: [
                    ("I'm not entirely convinced.", "完全には納得していない。"),
                    ("I'm not entirely convinced of the plan.", "計画に完全には納得していない。")
                 ]),
            make("I would argue otherwise", "I'd say the opposite",
                 "私はそうは思いません",
                 useCases: ["知的に異論を提示するとき"],
                 examples: [
                    ("I would argue otherwise.", "私はそうは思いません。"),
                    ("Actually, I would argue otherwise.", "実は逆だと思う。")
                 ]),
            make("That's debatable", "that's open to debate",
                 "それは議論の余地があるね",
                 useCases: ["賛成も反対もしないクールな立場"],
                 examples: [
                    ("That's debatable.", "それは議論の余地あり。"),
                    ("Hmm, that's debatable.", "それはちょっと議論の余地あるね。")
                 ])
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
                 ]),
            make("slightly", "to a small degree",
                 "少し〜",
                 useCases: ["直接的な批判を避ける決まり文句"],
                 examples: [
                    ("Slightly disappointing.", "少しがっかり。"),
                    ("Slightly off.", "少しずれてる。")
                 ])
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
                 ]),
            make("that being said", "having said that",
                 "とはいえ",
                 useCases: ["前言を踏まえて展開する大人の表現"],
                 examples: [
                    ("That being said, I agree.", "とはいえ、賛成。"),
                    ("That being said, we should try.", "そうは言っても、やってみるべき。")
                 ]),
            make("having said that", "that being said",
                 "そうは言っても",
                 useCases: ["前提を認めつつ別の見方を出すとき"],
                 examples: [
                    ("Having said that, let's try.", "そうは言ってもやってみよう。"),
                    ("Having said that, it's risky.", "とはいえリスクはある。")
                 ]),
            make("in any event", "anyway; in any case",
                 "いずれにせよ",
                 useCases: ["anyway より洗練された印象で結論に進むとき"],
                 examples: [
                    ("In any event, thank you.", "いずれにせよ、ありがとう。"),
                    ("In any event, we move on.", "いずれにせよ、先に進もう。")
                 ])
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
                 ]),
            make("Perhaps we could", "maybe we could",
                 "おそらく〜できるかも",
                 useCases: ["押し付けがましくない提案"],
                 examples: [
                    ("Perhaps we could meet later.", "後で会えるといいかも。"),
                    ("Perhaps we could try this.", "これを試してみても。")
                 ]),
            make("I was wondering if", "I'd like to ask if",
                 "〜してもらえたらと",
                 useCases: ["丁寧な依頼の定番"],
                 examples: [
                    ("I was wondering if you could help.", "手伝ってもらえないかと思って。"),
                    ("I was wondering if we could meet.", "お会いできないかと思って。")
                 ]),
            make("Would you mind", "do you mind if (polite)",
                 "〜していただけませんか",
                 useCases: ["丁寧な依頼で必須"],
                 examples: [
                    ("Would you mind waiting?", "少々お待ちいただけますか？"),
                    ("Would you mind closing the door?", "ドアを閉めていただけますか？")
                 ]),
            make("It would be lovely if", "it would be wonderful if",
                 "〜していただけたら嬉しいです",
                 useCases: ["lovely を使う英国的優雅さ"],
                 examples: [
                    ("It would be lovely if you could come.", "来ていただけたら嬉しいです。"),
                    ("It would be lovely if we met soon.", "近いうちに会えたら素敵。")
                 ])
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
                 ]),
            make("Rather impressive", "fairly impressive",
                 "かなり印象的",
                 useCases: ["抑制された褒め言葉"],
                 examples: [
                    ("Rather impressive work.", "なかなか印象的な仕事。"),
                    ("Rather impressive, I must say.", "正直、かなり印象的。")
                 ]),
            make("Most enjoyable", "very enjoyable (UK elegant)",
                 "とても楽しい",
                 useCases: ["very より most を使う英国的優雅さ"],
                 examples: [
                    ("It was most enjoyable.", "とても楽しかったです。"),
                    ("Most enjoyable evening.", "とても楽しい夜でした。")
                 ]),
            make("Genuinely", "really; truly (intelligent)",
                 "心から〜・本当に〜",
                 useCases: ["「really」の知的バージョン"],
                 examples: [
                    ("Genuinely surprised.", "心から驚いた。"),
                    ("Genuinely impressed.", "本当に感心した。")
                 ]),
            make("Frankly speaking", "to be frank (refined)",
                 "率直に言うと",
                 useCases: ["honestly より洗練された前置き"],
                 examples: [
                    ("Frankly speaking, no.", "率直に言って、ノー。"),
                    ("Frankly speaking, I'm worried.", "正直なところ、心配だ。")
                 ])
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
                 ]),
            make("In which case", "if that's the case",
                 "その場合は",
                 useCases: ["条件付き返答を上品に作るとき"],
                 examples: [
                    ("In which case, we'll go.", "その場合は行きます。"),
                    ("In which case, let me check.", "その場合は確認させて。")
                 ])
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
                 ]),
            make("fuss over", "pay excessive attention to",
                 "大げさに気を遣う・かまいすぎる",
                 useCases: ["過剰に世話を焼く話"],
                 examples: [
                    ("Don't fuss over me.", "そんなに気を遣わないで。"),
                    ("She fussed over the kids.", "彼女、子どもたちにかまいすぎてた。")
                 ]),
            make("moan", "complain in a whiny tone",
                 "ぐちぐち言う・うめく",
                 useCases: ["不満を漏らす話"],
                 examples: [
                    ("Stop moaning.", "ぐちぐち言わないで。"),
                    ("He's always moaning.", "彼、いつもブーブー言ってる。")
                 ]),
            make("pop over", "drop by quickly",
                 "ちょっと立ち寄る",
                 useCases: ["近所の家にふらっと行く話"],
                 examples: [
                    ("Pop over for a tea.", "お茶しに来てよ。"),
                    ("I'll pop over later.", "後で寄るね。")
                 ]),
            make("buzzing", "very excited; energetic",
                 "ワクワクしてる・盛り上がってる",
                 useCases: ["興奮や活気を表すとき"],
                 examples: [
                    ("I'm buzzing!", "テンション上がってる！"),
                    ("The crowd was buzzing.", "観客が盛り上がってた。")
                 ]),
            make("wreck", "ruin; a person who's a mess",
                 "台無しにする・ボロボロの人",
                 useCases: ["何かを壊す話", "疲労困憊した人を表すとき"],
                 examples: [
                    ("That wrecked my plan.", "それで計画が台無し。"),
                    ("I'm a wreck today.", "今日ボロボロ。")
                 ]),
            make("maniac", "crazy or fanatical person",
                 "狂人・〜マニア",
                 useCases: ["危ない人や熱狂的なファンを表すとき"],
                 examples: [
                    ("He drives like a maniac.", "彼、運転が荒い。"),
                    ("A coffee maniac.", "コーヒーマニア。")
                 ]),
            make("have a go", "give it a try (UK)",
                 "挑戦してみる・やってみる",
                 useCases: ["試しにやってみるとき"],
                 examples: [
                    ("Have a go.", "やってみて。"),
                    ("I'll have a go at it.", "ちょっと試してみる。")
                 ]),
            make("if you ask me", "in my opinion",
                 "私に言わせれば",
                 useCases: ["率直な意見を切り出すとき"],
                 examples: [
                    ("If you ask me, it's silly.", "私に言わせればバカげてる。"),
                    ("If you ask me, he's right.", "言わせてもらえれば、彼は正しい。")
                 ]),
            make("good on you", "good for you (UK/AUS)",
                 "よくやったね・偉い",
                 useCases: ["相手の頑張りを称えるとき"],
                 examples: [
                    ("Good on you!", "よくやった！"),
                    ("Good on you for trying.", "挑戦して偉い。")
                 ]),
            make("don't you think", "wouldn't you agree",
                 "〜だと思わない？",
                 useCases: ["相手の同意を促すとき"],
                 examples: [
                    ("It's hot, don't you think?", "暑いと思わない？"),
                    ("That's strange, don't you think?", "それ変だと思わない？")
                 ])
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
                 ]),
            make("hurry up", "be quick",
                 "急ぐ",
                 useCases: ["相手を急かすとき"],
                 examples: [
                    ("Hurry up!", "早く！"),
                    ("Hurry up, we're late.", "急いで、遅れる。")
                 ]),
            make("slip", "slide; sneak something in",
                 "滑る・こっそり入れる",
                 useCases: ["転倒する話", "そっと挟み込む話"],
                 examples: [
                    ("I slipped on ice.", "氷で滑った。"),
                    ("She slipped a note in.", "メモをこっそり挟んだ。")
                 ]),
            make("trip", "stumble",
                 "つまずく",
                 useCases: ["足を引っ掛けて転びかける話"],
                 examples: [
                    ("I tripped on the rug.", "敷物でつまずいた。"),
                    ("Don't trip!", "転ばないで！")
                 ]),
            make("bump into", "collide; meet by chance",
                 "ぶつかる・偶然会う",
                 useCases: ["人にバッタリ会う話"],
                 examples: [
                    ("Bumped into John.", "ジョンに偶然会った。"),
                    ("Sorry, bumped into you.", "ごめん、ぶつかっちゃった。")
                 ]),
            make("crash into", "smash into",
                 "激突する",
                 useCases: ["車などが何かにぶつかる話"],
                 examples: [
                    ("Crashed into a wall.", "壁にぶつかった。"),
                    ("The car crashed into a tree.", "車が木に激突した。")
                 ]),
            make("grab", "take quickly",
                 "つかむ・素早く取る",
                 useCases: ["素早く何かを取る話"],
                 examples: [
                    ("Grab a coffee.", "コーヒーを買う。"),
                    ("Grab my hand!", "手を掴んで！")
                 ]),
            make("toss", "throw lightly",
                 "投げる・放る",
                 useCases: ["軽く投げる話"],
                 examples: [
                    ("Toss it over.", "こっちに投げて。"),
                    ("Toss it in the bin.", "ゴミ箱に放って。")
                 ]),
            make("shove", "push roughly",
                 "押しのける・突っ込む",
                 useCases: ["強く押す話"],
                 examples: [
                    ("Don't shove me!", "押さないで！"),
                    ("He shoved past me.", "彼、押しのけて通った。")
                 ]),
            make("squeeze", "press; force through",
                 "押し込む・絞る",
                 useCases: ["人混みを通り抜ける話", "果汁を絞る話"],
                 examples: [
                    ("Squeeze through the crowd.", "人混みを押し分ける。"),
                    ("Squeeze the lemon.", "レモンを絞って。")
                 ]),
            make("stretch", "extend; do stretches",
                 "伸ばす・ストレッチする",
                 useCases: ["体を伸ばす話"],
                 examples: [
                    ("Stretch your legs.", "足を伸ばして。"),
                    ("Time to stretch.", "ストレッチの時間。")
                 ]),
            make("bend over", "lean down",
                 "かがむ",
                 useCases: ["前かがみになる話"],
                 examples: [
                    ("Bend over to pick it up.", "かがんで拾う。"),
                    ("Don't bend over too far.", "前にかがみすぎないで。")
                 ]),
            make("lean on", "rest against; depend on",
                 "もたれかかる・頼る",
                 useCases: ["物理的に寄りかかる話", "誰かを頼る話"],
                 examples: [
                    ("Lean on me.", "頼ってね。"),
                    ("Lean on the wall.", "壁にもたれて。")
                 ]),
            make("knock", "tap; rap on a door",
                 "ノックする・叩く",
                 useCases: ["ドアを叩く話"],
                 examples: [
                    ("Knock before entering.", "入る前にノック。"),
                    ("Someone's knocking.", "誰かノックしてる。")
                 ]),
            make("kick", "strike with foot; start",
                 "蹴る・始める",
                 useCases: ["ボールを蹴る話", "活動を始める話"],
                 examples: [
                    ("Kick the ball.", "ボールを蹴る。"),
                    ("Kick off the meeting.", "会議を始める。")
                 ]),
            make("swing", "sway; rotate around",
                 "揺れる・振る",
                 useCases: ["バットを振る話", "揺れる話"],
                 examples: [
                    ("Swing the bat.", "バットを振る。"),
                    ("The door swung open.", "ドアが開いた。")
                 ]),
            make("flip", "turn over; switch quickly",
                 "ひっくり返す・パッと変える",
                 useCases: ["パンケーキを返す話", "状態を切り替える話"],
                 examples: [
                    ("Flip the pancake.", "パンケーキを返す。"),
                    ("Flip the switch.", "スイッチを入れて。")
                 ]),
            make("wave", "move hand; sway",
                 "手を振る・揺れる",
                 useCases: ["別れの手を振る話"],
                 examples: [
                    ("Wave goodbye.", "バイバイを振る。"),
                    ("She waved at me.", "彼女が手を振ってくれた。")
                 ])
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
                 ]),
            make("wonder", "be curious; ponder",
                 "不思議に思う・〜かなと思う",
                 useCases: ["疑問を投げかけるとき"],
                 examples: [
                    ("I wonder why.", "なぜだろう。"),
                    ("Just wondering.", "ちょっと気になっただけ。")
                 ]),
            make("figure", "think; assume",
                 "〜だろうと思う",
                 useCases: ["推測を述べるとき"],
                 examples: [
                    ("I figure he's late.", "彼は遅刻だろう。"),
                    ("Figure it'll work.", "うまくいくだろう。")
                 ]),
            make("realize", "become aware",
                 "はっと気づく",
                 useCases: ["後から気づく話"],
                 examples: [
                    ("I realized too late.", "遅く気づいた。"),
                    ("Realize the truth.", "真実に気づく。")
                 ]),
            make("recall", "remember",
                 "思い出す",
                 useCases: ["記憶を辿る話"],
                 examples: [
                    ("I can't recall.", "思い出せない。"),
                    ("Do you recall the meeting?", "あの会議覚えてる？")
                 ]),
            make("picture", "visualize; imagine",
                 "想像する・思い浮かべる",
                 useCases: ["イメージしてもらうとき"],
                 examples: [
                    ("Picture this.", "想像してみて。"),
                    ("Picture a beach.", "ビーチを思い浮かべて。")
                 ]),
            make("strike", "occur to suddenly",
                 "急に思い浮かぶ",
                 useCases: ["ふと印象を受ける話"],
                 examples: [
                    ("It struck me as odd.", "変だなと思った。"),
                    ("It struck me suddenly.", "突然思いついた。")
                 ]),
            make("occur to", "come to mind",
                 "ふと思いつく",
                 useCases: ["突然思いつく話"],
                 examples: [
                    ("It occurred to me.", "ふと思った。"),
                    ("It just occurred to me.", "今ふと気づいた。")
                 ]),
            make("chill", "relax",
                 "リラックスする",
                 useCases: ["カジュアルにくつろぐ話"],
                 examples: [
                    ("Just chill.", "落ち着いて。"),
                    ("Chill at home.", "家でゆっくりする。")
                 ])
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
                 ]),
            make("butt in", "interrupt rudely",
                 "割り込む",
                 useCases: ["失礼に話に割り込む話"],
                 examples: [
                    ("Don't butt in!", "割り込まないで！"),
                    ("He butted in.", "彼、口を挟んできた。")
                 ]),
            make("cut off", "interrupt; disconnect",
                 "話を遮る・切断する",
                 useCases: ["話を遮る話", "電話が切れる話"],
                 examples: [
                    ("Don't cut me off.", "話を遮らないで。"),
                    ("The call got cut off.", "電話が切れた。")
                 ]),
            make("shout out", "call out loudly; mention",
                 "大声で呼ぶ・触れる",
                 useCases: ["呼びかける話", "誰かに言及する話"],
                 examples: [
                    ("Shout out if you need help.", "助けが要れば叫んで。"),
                    ("Shout out to my team.", "うちのチームに感謝。")
                 ]),
            make("yell", "shout loudly",
                 "怒鳴る・大声で叫ぶ",
                 useCases: ["怒って叫ぶ話"],
                 examples: [
                    ("Don't yell at me.", "怒鳴らないで。"),
                    ("She yelled across the room.", "彼女、部屋越しに叫んだ。")
                 ]),
            make("drop a hint", "give a subtle suggestion",
                 "ほのめかす",
                 useCases: ["遠回しに伝える話"],
                 examples: [
                    ("She dropped a hint.", "彼女がほのめかした。"),
                    ("Drop a hint about it.", "それとなく言って。")
                 ])
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
                 ]),
            make("grow into", "develop to fit",
                 "成長して〜になる",
                 useCases: ["役割や服装に馴染む話"],
                 examples: [
                    ("Grow into the role.", "役割に馴染む。"),
                    ("She'll grow into the dress.", "そのドレス、いずれ着られるよ。")
                 ]),
            make("build up", "accumulate gradually",
                 "蓄積する・徐々に増える",
                 useCases: ["疲れやストレスが溜まる話"],
                 examples: [
                    ("Stress builds up.", "ストレスが溜まる。"),
                    ("Tension's building up.", "緊張感が高まってる。")
                 ]),
            make("die down", "subside; calm",
                 "静まる・収まる",
                 useCases: ["騒ぎや風が収まる話"],
                 examples: [
                    ("The wind died down.", "風が収まった。"),
                    ("Things died down.", "騒ぎが収まった。")
                 ]),
            make("fade away", "gradually disappear",
                 "消えていく",
                 useCases: ["記憶や音が薄れる話"],
                 examples: [
                    ("Memories fade away.", "記憶は薄れる。"),
                    ("The pain faded away.", "痛みが消えた。")
                 ]),
            make("kick in", "start to take effect",
                 "効き始める・始動する",
                 useCases: ["薬や効果が出始める話"],
                 examples: [
                    ("The medicine kicked in.", "薬が効いてきた。"),
                    ("Adrenaline kicked in.", "アドレナリンが出てきた。")
                 ]),
            make("break out", "suddenly start; escape",
                 "急に発生する・脱出する",
                 useCases: ["災害や戦争が起きる話", "脱獄の話"],
                 examples: [
                    ("A fire broke out.", "火事が発生。"),
                    ("They broke out of jail.", "彼ら、脱獄した。")
                 ])
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
                 ]),
            make("deal with", "handle; manage",
                 "対処する",
                 useCases: ["問題に向き合う話"],
                 examples: [
                    ("Deal with the problem.", "問題に対処。"),
                    ("I'll deal with him.", "彼の対応は俺がやる。")
                 ]),
            make("tackle", "address; confront",
                 "取り組む・立ち向かう",
                 useCases: ["難題に挑む話"],
                 examples: [
                    ("Tackle the issue.", "問題に取り組む。"),
                    ("Tackle it head-on.", "正面から立ち向かう。")
                 ]),
            make("manage", "manage; cope",
                 "なんとかする・管理する",
                 useCases: ["何とか乗り切る話"],
                 examples: [
                    ("I'll manage.", "なんとかする。"),
                    ("Manage the team.", "チームを管理する。")
                 ]),
            make("cope with", "deal with; endure",
                 "対処する・乗り越える",
                 useCases: ["ストレスや困難に対応する話"],
                 examples: [
                    ("Cope with stress.", "ストレスに対処。"),
                    ("How do you cope?", "どう乗り越えてる？")
                 ])
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
                 ])
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
                 ]),
            make("you can tell", "it's obvious",
                 "分かるよね",
                 useCases: ["明白だと伝えるとき"],
                 examples: [
                    ("You can tell he's lying.", "嘘ついてるって分かる。"),
                    ("You can tell she's tired.", "疲れてるの分かるよ。")
                 ]),
            make("you wouldn't believe", "you'd be amazed",
                 "信じられないよ",
                 useCases: ["驚きの話を切り出すとき"],
                 examples: [
                    ("You wouldn't believe what happened.", "何があったか信じられない。"),
                    ("You wouldn't believe the price.", "値段、信じられないよ。")
                 ]),
            make("you might want to", "you should consider",
                 "〜した方がいいかも",
                 useCases: ["やんわり提案するとき"],
                 examples: [
                    ("You might want to leave.", "出た方がいいかも。"),
                    ("You might want to check.", "確認した方がいいかも。")
                 ])
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
                 ]),
            make("that's a shame", "what a pity",
                 "残念",
                 useCases: ["残念な話に共感するとき"],
                 examples: [
                    ("That's a shame.", "残念だね。"),
                    ("Oh, that's a real shame.", "あー、本当に残念。")
                 ]),
            make("that's the spirit", "good attitude",
                 "その意気だ",
                 useCases: ["前向きな姿勢を称えるとき"],
                 examples: [
                    ("That's the spirit!", "その調子！"),
                    ("Yes, that's the spirit.", "うん、その意気だ。")
                 ]),
            make("that's the way", "that's how",
                 "そう、それでいい",
                 useCases: ["上手くやれている時"],
                 examples: [
                    ("That's the way!", "その調子！"),
                    ("That's the way, keep it up.", "それそれ、続けて。")
                 ]),
            make("that's enough", "stop now",
                 "もう十分・やめろ",
                 useCases: ["やめさせるとき"],
                 examples: [
                    ("That's enough!", "もうやめて！"),
                    ("That's enough for today.", "今日はここまで。")
                 ])
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
                 ]),
            make("how nice", "how kind / lovely",
                 "なんて素敵",
                 useCases: ["相手の優しさを称えるとき"],
                 examples: [
                    ("How nice of you!", "親切だね！"),
                    ("How nice!", "素敵！")
                 ]),
            make("how on earth", "in what way (incredulous)",
                 "一体どうやって〜？",
                 useCases: ["驚きと疑問を強く表すとき"],
                 examples: [
                    ("How on earth did you?", "一体どうやって？"),
                    ("How on earth did you find this?", "どうやってこれ見つけた？")
                 ])
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
                 ]),
            make("finish doing", "complete the action",
                 "〜し終える",
                 useCases: ["作業を終える話"],
                 examples: [
                    ("Finish reading.", "読み終える。"),
                    ("Finish eating first.", "まずは食べ終わって。")
                 ]),
            make("enjoy doing", "have fun doing",
                 "〜を楽しむ",
                 useCases: ["趣味や活動を楽しむ話"],
                 examples: [
                    ("Enjoy cooking.", "料理を楽しむ。"),
                    ("I enjoy reading.", "読書が好き。")
                 ]),
            make("avoid doing", "stay away from doing",
                 "〜を避ける",
                 useCases: ["やらないように気をつける話"],
                 examples: [
                    ("Avoid going late.", "遅く行くのを避ける。"),
                    ("Avoid eating sweets.", "甘いものを避ける。")
                 ]),
            make("keep doing", "continue doing",
                 "〜し続ける",
                 useCases: ["継続して何かをする話"],
                 examples: [
                    ("Keep trying.", "試し続けて。"),
                    ("Keep walking.", "歩き続けて。")
                 ])
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
                 ]),
            make("promise to", "commit to do",
                 "〜すると約束",
                 useCases: ["約束を伝えるとき"],
                 examples: [
                    ("Promise to call.", "電話すると約束。"),
                    ("Promise to be on time.", "時間通りに来ると約束する。")
                 ]),
            make("refuse to", "decline to do",
                 "〜を拒む",
                 useCases: ["強く断る話"],
                 examples: [
                    ("Refused to come.", "来るのを拒んだ。"),
                    ("She refused to listen.", "彼女、聞こうとしなかった。")
                 ]),
            make("agree to", "consent to do",
                 "〜に同意",
                 useCases: ["合意して何かをすると伝えるとき"],
                 examples: [
                    ("Agreed to help.", "手伝うと同意。"),
                    ("They agreed to meet.", "会うことに同意した。")
                 ]),
            make("offer to", "volunteer to do",
                 "〜しようと申し出る",
                 useCases: ["親切で申し出る話"],
                 examples: [
                    ("Offered to drive.", "運転を申し出た。"),
                    ("She offered to help.", "彼女、手伝うと申し出た。")
                 ])
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
                 ]),
            make("to be precise", "more accurately",
                 "正確には",
                 useCases: ["数字や時間を正確に伝えるとき"],
                 examples: [
                    ("5pm, to be precise.", "正確には5時。"),
                    ("Three years, to be precise.", "正確に言うと3年。")
                 ]),
            make("to be frank", "honestly speaking",
                 "率直に",
                 useCases: ["遠慮なく本音を言うとき"],
                 examples: [
                    ("To be frank, no.", "率直に言ってノー。"),
                    ("To be frank, I disagree.", "率直に言うと反対。")
                 ]),
            make("to be safe", "as a precaution",
                 "念のため",
                 useCases: ["保険として何かをするとき"],
                 examples: [
                    ("To be safe, take an umbrella.", "念のため傘を。"),
                    ("To be safe, double-check.", "念のため再確認して。")
                 ])
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
                 ]),
            make("or so they say", "or so the saying goes",
                 "〜らしい",
                 useCases: ["伝聞情報を伝えるとき"],
                 examples: [
                    ("It's true, or so they say.", "本当らしい。"),
                    ("Money buys happiness, or so they say.", "金は幸せを買えるらしい。")
                 ]),
            make("and that's that", "and that's final",
                 "それで終わり",
                 useCases: ["議論を打ち切るとき"],
                 examples: [
                    ("No, and that's that.", "ノー、以上。"),
                    ("I said no, and that's that.", "ダメと言ったら終わり。")
                 ]),
            make("whether you like it or not", "regardless of preference",
                 "好むと好まざるとに関わらず",
                 useCases: ["強制力を伝えるとき"],
                 examples: [
                    ("You're going, whether you like it or not.", "嫌でも行くんだよ。"),
                    ("It's happening, whether you like it or not.", "好き嫌い関係なくこうなる。")
                 ])
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
                 ]),
            make("How sweet of you", "what a kind gesture",
                 "なんて優しい",
                 useCases: ["相手の気遣いに感謝するとき"],
                 examples: [
                    ("How sweet of you!", "優しいね！"),
                    ("How sweet of you to remember.", "覚えててくれて優しい。")
                 ]),
            make("How thoughtful", "very considerate",
                 "気が利くね",
                 useCases: ["細やかな気配りを褒めるとき"],
                 examples: [
                    ("How thoughtful!", "気が利くね！"),
                    ("How thoughtful of him.", "彼って気が利く。")
                 ]),
            make("How embarrassing", "very awkward",
                 "恥ずかしい",
                 useCases: ["気まずい状況を表すとき"],
                 examples: [
                    ("How embarrassing!", "恥ずかしい！"),
                    ("How embarrassing for him.", "彼にとって気まずいね。")
                 ]),
            make("How disappointing", "what a letdown",
                 "がっかりだ",
                 useCases: ["期待外れの結果に失望したとき"],
                 examples: [
                    ("How disappointing.", "がっかり。"),
                    ("How disappointing the result was.", "結果はがっかりだった。")
                 ])
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
                 ]),
            make("if anything", "rather; on the contrary",
                 "むしろ・どちらかと言えば",
                 useCases: ["むしろ反対のことを示唆するとき"],
                 examples: [
                    ("If anything, it's better.", "むしろ良くなった。"),
                    ("If anything, he's nicer.", "どちらかと言えば彼の方が優しい。")
                 ]),
            make("if need be", "if necessary",
                 "必要なら",
                 useCases: ["条件付きで対応を申し出るとき"],
                 examples: [
                    ("If need be, I'll go.", "必要なら行く。"),
                    ("Call me if need be.", "必要なら電話して。")
                 ]),
            make("if you must know", "since you insist on asking",
                 "そんなに知りたいなら",
                 useCases: ["しつこく聞かれて渋々答えるとき"],
                 examples: [
                    ("If you must know, I left.", "どうしてもなら、帰った。"),
                    ("If you must know, I said no.", "そんなに知りたいなら、断った。")
                 ]),
            make("if push comes to shove", "if the situation becomes critical",
                 "いざとなれば",
                 useCases: ["最悪の場合の対応を述べるとき"],
                 examples: [
                    ("If push comes to shove, fight.", "いざとなれば戦う。"),
                    ("If push comes to shove, we'll cancel.", "いざとなれば中止する。")
                 ])
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
                 ]),
            make("there's no point", "it's pointless",
                 "意味がない",
                 useCases: ["やっても無駄だと伝えるとき"],
                 examples: [
                    ("There's no point arguing.", "議論しても無駄。"),
                    ("There's no point waiting.", "待っても意味ない。")
                 ]),
            make("there's no telling", "it's impossible to know",
                 "分からない",
                 useCases: ["予測不可能なことを表すとき"],
                 examples: [
                    ("There's no telling what'll happen.", "何が起こるか分からない。"),
                    ("There's no telling when he'll come.", "いつ来るか分からない。")
                 ]),
            make("there's no rush", "no need to hurry",
                 "急がなくていい",
                 useCases: ["相手を急がせないように伝えるとき"],
                 examples: [
                    ("There's no rush.", "ゆっくりでいい。"),
                    ("Take your time, there's no rush.", "ゆっくりどうぞ、急がなくていい。")
                 ]),
            make("there's something about", "there is a certain quality in",
                 "どこか〜なところがある",
                 useCases: ["言葉にできない印象を語るとき"],
                 examples: [
                    ("There's something about him.", "彼にはどこか〜なところがある。"),
                    ("There's something about this place.", "この場所には何かある。")
                 ])
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
                 ]),
            make("it's no use", "it's pointless",
                 "無駄だ",
                 useCases: ["諦めを表すとき"],
                 examples: [
                    ("It's no use crying.", "泣いても無駄。"),
                    ("It's no use trying.", "やっても無駄。")
                 ]),
            make("it's worth it", "it has value",
                 "価値がある",
                 useCases: ["努力や出費に見合うと伝えるとき"],
                 examples: [
                    ("It's worth it.", "その価値ある。"),
                    ("Trust me, it's worth it.", "信じて、価値ある。")
                 ]),
            make("it's beyond me", "I can't understand it",
                 "私には理解できない",
                 useCases: ["理解不能なことに対するとき"],
                 examples: [
                    ("It's beyond me.", "理解不能。"),
                    ("Why he did it is beyond me.", "なぜやったか分からない。")
                 ]),
            make("it's up to you", "your decision",
                 "あなた次第",
                 useCases: ["相手に判断を委ねるとき"],
                 examples: [
                    ("It's up to you.", "あなた次第。"),
                    ("Either way, it's up to you.", "どっちでもあなた次第。")
                 ])
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
                 ]),
            make("make do with", "manage with what is available",
                 "〜で間に合わせる",
                 useCases: ["足りないものでやりくりするとき"],
                 examples: [
                    ("Make do with this.", "これで我慢。"),
                    ("We'll make do with what we have.", "あるもので何とかする。")
                 ]),
            make("have a go at", "give it a try",
                 "試してみる",
                 useCases: ["挑戦してみるよう促すとき"],
                 examples: [
                    ("Have a go at it.", "試してみて。"),
                    ("I'll have a go at fixing it.", "直すのを試してみる。")
                 ])
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
                 ]),
            make("what I mean is", "in other words",
                 "つまり",
                 useCases: ["言い直して説明するとき"],
                 examples: [
                    ("What I mean is, no.", "つまりノー。"),
                    ("What I mean is, it's complicated.", "つまり複雑なんだ。")
                 ]),
            make("what I'm saying is", "the point I'm making is",
                 "言いたいのは",
                 useCases: ["要点を強調して伝えるとき"],
                 examples: [
                    ("What I'm saying is, careful.", "言いたいのは、注意してと。"),
                    ("What I'm saying is, we should wait.", "言いたいのは待つべきってこと。")
                 ]),
            make("what's wrong with", "what is the problem with",
                 "〜の何が悪い？",
                 useCases: ["反論や弁護として使うとき"],
                 examples: [
                    ("What's wrong with that?", "それの何が悪い？"),
                    ("What's wrong with trying?", "試して何が悪い？")
                 ]),
            make("what's the matter", "what is the problem",
                 "どうしたの？",
                 useCases: ["相手の様子を心配して尋ねるとき"],
                 examples: [
                    ("What's the matter?", "どうした？"),
                    ("What's the matter with you?", "どうしたの、君？")
                 ])
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
                 ]),
            make("right now", "at this moment",
                 "今すぐ",
                 useCases: ["即時の対応を求めるとき"],
                 examples: [
                    ("Right now, please.", "今すぐお願い。"),
                    ("I need it right now.", "今すぐ必要。")
                 ]),
            make("just about", "almost; nearly",
                 "ほぼ・もう少しで",
                 useCases: ["完了直前を表すとき"],
                 examples: [
                    ("Just about done.", "ほぼ終わり。"),
                    ("I'm just about ready.", "もう少しで準備完了。")
                 ]),
            make("just barely", "by a very small margin",
                 "ぎりぎり",
                 useCases: ["かろうじて成功したとき"],
                 examples: [
                    ("Just barely made it.", "ぎりぎり間に合った。"),
                    ("Just barely passed.", "ぎりぎり合格。")
                 ]),
            make("way off", "completely wrong; far from correct",
                 "大間違い・大ハズレ",
                 useCases: ["予想や答えが大きく外れているとき"],
                 examples: [
                    ("Way off the mark.", "大ハズレ。"),
                    ("Your guess is way off.", "予想は大外れ。")
                 ])
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
                 ]),
            make("by far", "by a large margin",
                 "圧倒的に",
                 useCases: ["群を抜いていることを強調するとき"],
                 examples: [
                    ("Best by far.", "断然最高。"),
                    ("By far the easiest.", "圧倒的に一番楽。")
                 ]),
            make("in a heartbeat", "instantly; without hesitation",
                 "即座に",
                 useCases: ["迷いなく行動する意志を示すとき"],
                 examples: [
                    ("I'd go in a heartbeat.", "即行く。"),
                    ("She'd say yes in a heartbeat.", "彼女なら即イエス。")
                 ]),
            make("for the life of me", "no matter how hard I try",
                 "どうしても〜できない",
                 useCases: ["何かを思い出せない・できない強調"],
                 examples: [
                    ("Can't remember for the life of me.", "どうしても思い出せない。"),
                    ("For the life of me, I can't find it.", "どうしても見つからない。")
                 ])
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
                 ]),
            make("rip off", "cheat by overcharging",
                 "ぼったくる",
                 useCases: ["不当に高く請求されたとき"],
                 examples: [
                    ("They ripped me off.", "ぼったくられた。"),
                    ("That's a rip-off.", "それぼったくり。")
                 ]),
            make("save up", "accumulate money over time",
                 "貯金する",
                 useCases: ["何かのために少しずつ貯めるとき"],
                 examples: [
                    ("I'm saving up for a car.", "車のため貯金中。"),
                    ("Save up for a rainy day.", "万が一に備えて貯めて。")
                 ]),
            make("bomb", "fail badly",
                 "大失敗する",
                 useCases: ["プレゼンや試験で大コケしたとき"],
                 examples: [
                    ("I bombed the test.", "テスト大失敗。"),
                    ("The show bombed.", "ショーは大コケ。")
                 ]),
            make("fall flat", "fail to achieve the intended effect",
                 "ウケない・失敗する",
                 useCases: ["冗談やアイデアが受けなかったとき"],
                 examples: [
                    ("My joke fell flat.", "冗談が滑った。"),
                    ("The plan fell flat.", "計画は失敗。")
                 ]),
            make("flunk", "fail an exam or course",
                 "落第する",
                 useCases: ["試験や授業で落ちたとき"],
                 examples: [
                    ("I flunked math.", "数学落とした。"),
                    ("Don't flunk the test.", "テスト落ちないで。")
                 ]),
            make("blow it", "miss an opportunity by failing",
                 "しくじる・台無しにする",
                 useCases: ["大事な場面で失敗したとき"],
                 examples: [
                    ("I blew it.", "しくじった。"),
                    ("Don't blow it now.", "今しくじらないで。")
                 ]),
            make("ace", "do extremely well",
                 "完璧にこなす",
                 useCases: ["試験や面接で抜群の成果を出したとき"],
                 examples: [
                    ("I aced the test.", "テスト満点。"),
                    ("She aced the interview.", "面接バッチリ。")
                 ]),
            make("nail it", "do something perfectly",
                 "見事に決める",
                 useCases: ["パフォーマンスや作業を完璧にこなしたとき"],
                 examples: [
                    ("You nailed it!", "完璧！"),
                    ("She nailed the speech.", "スピーチ完璧だった。")
                 ]),
            make("pull out", "withdraw from an event or commitment",
                 "撤退する・手を引く",
                 useCases: ["参加を取りやめるとき"],
                 examples: [
                    ("He pulled out of the deal.", "取引から手を引いた。"),
                    ("I had to pull out.", "降りざるを得なかった。")
                 ])
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
                 ]),
            make("pull myself together", "regain composure",
                 "気を取り直す",
                 useCases: ["落ち込みから立ち直るとき"],
                 examples: [
                    ("I need to pull myself together.", "気を取り直さなきゃ。"),
                    ("Pull yourself together!", "しっかりしろ！")
                 ]),
            make("side with", "support one party in a dispute",
                 "〜の味方をする",
                 useCases: ["争いで誰かを支持するとき"],
                 examples: [
                    ("She sided with me.", "彼女は私の味方をした。"),
                    ("Don't side with him.", "彼の肩を持たないで。")
                 ]),
            make("be behind", "support; be the cause of",
                 "支持する・〜の裏にいる",
                 useCases: ["背後で誰かを支えている、または黒幕であるとき"],
                 examples: [
                    ("I'm behind you.", "応援してる。"),
                    ("Who's behind this?", "誰の仕業？")
                 ]),
            make("break up", "end a romantic relationship",
                 "別れる",
                 useCases: ["カップルが関係を終えるとき"],
                 examples: [
                    ("We broke up.", "別れた。"),
                    ("They broke up last week.", "先週別れた。")
                 ]),
            make("drift apart", "gradually become less close",
                 "疎遠になる",
                 useCases: ["友人や恋人と自然に距離ができたとき"],
                 examples: [
                    ("We drifted apart.", "疎遠になった。"),
                    ("Old friends sometimes drift apart.", "旧友は疎遠になることもある。")
                 ]),
            make("hit it off", "get along well immediately",
                 "意気投合する",
                 useCases: ["初対面で仲良くなれたとき"],
                 examples: [
                    ("We hit it off right away.", "すぐ意気投合した。"),
                    ("They really hit it off.", "彼らは本当に気が合った。")
                 ]),
            make("hit on", "make a romantic advance toward",
                 "口説く・ナンパする",
                 useCases: ["恋愛的にアプローチするとき"],
                 examples: [
                    ("He hit on her at the bar.", "バーで彼女を口説いた。"),
                    ("Are you hitting on me?", "口説いてる？")
                 ]),
            make("make up with", "reconcile after a fight",
                 "仲直りする",
                 useCases: ["喧嘩を終えて関係を修復するとき"],
                 examples: [
                    ("I made up with him.", "彼と仲直りした。"),
                    ("Did you make up with her?", "彼女と仲直りした？")
                 ]),
            make("fall out with", "have a quarrel and stop being friends",
                 "仲違いする",
                 useCases: ["喧嘩して関係が悪化したとき"],
                 examples: [
                    ("I fell out with him.", "彼と仲違いした。"),
                    ("They fell out over money.", "金で仲違いした。")
                 ])
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
                 ]),
            make("determine", "decide firmly; ascertain",
                 "決定する・突き止める",
                 useCases: ["事実を確定したり決断したりするとき"],
                 examples: [
                    ("We need to determine the cause.", "原因を突き止める必要がある。"),
                    ("She determined to leave.", "彼女は去る決意をした。")
                 ]),
            make("have second thoughts", "begin to doubt a decision",
                 "考え直す・迷い始める",
                 useCases: ["決断後に迷いが生じたとき"],
                 examples: [
                    ("I'm having second thoughts.", "考え直してる。"),
                    ("She had second thoughts about it.", "彼女はそれを迷い始めた。")
                 ]),
            make("give it a second thought", "reconsider it",
                 "考え直す",
                 useCases: ["再考を促す、または再考するとき"],
                 examples: [
                    ("Don't give it a second thought.", "気にしないで。"),
                    ("I gave it a second thought.", "考え直した。")
                 ]),
            make("brush aside", "dismiss without consideration",
                 "軽く受け流す",
                 useCases: ["意見や懸念を無視するとき"],
                 examples: [
                    ("He brushed aside my concerns.", "私の懸念を流した。"),
                    ("Don't brush it aside.", "軽く流さないで。")
                 ]),
            make("change my mind", "decide differently",
                 "気が変わる",
                 useCases: ["決めたことを変更するとき"],
                 examples: [
                    ("I changed my mind.", "気が変わった。"),
                    ("Don't change your mind now.", "今さら変えないで。")
                 ]),
            make("spit out", "say something quickly or reluctantly",
                 "吐き出す・早く言う",
                 useCases: ["言いにくいことを促すとき、口から出すとき"],
                 examples: [
                    ("Spit it out!", "早く言って！"),
                    ("He spat out the food.", "食べ物を吐き出した。")
                 ]),
            make("let slip", "reveal accidentally",
                 "うっかり漏らす",
                 useCases: ["秘密を不意に話してしまったとき"],
                 examples: [
                    ("I let slip the secret.", "秘密をうっかり漏らした。"),
                    ("She let it slip.", "彼女がうっかり言った。")
                 ]),
            make("gossip about", "talk maliciously about others",
                 "〜について噂話をする",
                 useCases: ["他人の私生活を話題にするとき"],
                 examples: [
                    ("They gossip about everyone.", "みんなの噂話してる。"),
                    ("Don't gossip about her.", "彼女のこと噂しないで。")
                 ]),
            make("joking apart", "speaking seriously now",
                 "冗談はさておき",
                 useCases: ["軽口の後で本題に戻すとき"],
                 examples: [
                    ("Joking apart, we need to act.", "冗談はさておき、動く必要がある。"),
                    ("Joking apart, I'm worried.", "冗談抜きで心配。")
                 ])
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
                 ]),
            make("scan", "look over quickly; examine systematically",
                 "ざっと見る・走査する",
                 useCases: ["ざっと目を通す、機械で読み取るとき"],
                 examples: [
                    ("I scanned the article.", "記事をざっと読んだ。"),
                    ("Scan the document.", "書類をスキャンして。")
                 ]),
            make("stare at", "look fixedly",
                 "じっと見つめる",
                 useCases: ["凝視するとき"],
                 examples: [
                    ("Don't stare at me.", "じろじろ見ないで。"),
                    ("She stared at the screen.", "画面を凝視した。")
                 ]),
            make("spot check", "carry out a brief inspection",
                 "抜き打ち検査",
                 useCases: ["抜き打ちで確認するとき"],
                 examples: [
                    ("They did a spot check.", "抜き打ち検査をした。"),
                    ("Random spot checks happen daily.", "抜き打ち検査が毎日ある。")
                 ]),
            make("sector", "a distinct part or division",
                 "部門・区域",
                 useCases: ["業界や領域を分類して語るとき"],
                 examples: [
                    ("The tech sector is growing.", "テック業界は成長中。"),
                    ("The private sector hires more.", "民間部門の方が雇う。")
                 ])
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
                 ]),
            make("together with", "along with; in addition to",
                 "〜と一緒に",
                 useCases: ["伴うものを述べるとき"],
                 examples: [
                    ("Together with him, we went.", "彼と一緒に行った。"),
                    ("Send the form together with the fee.", "用紙と費用を一緒に送って。")
                 ])
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
                 ]),
            make("chore", "a routine domestic task",
                 "雑用・家事",
                 useCases: ["家事や雑用を表すとき"],
                 examples: [
                    ("Daily chores.", "日常の家事。"),
                    ("Doing the chores.", "家事をしている。")
                 ]),
            make("routine", "a regular sequence of actions",
                 "日課・お決まり",
                 useCases: ["毎日の決まった習慣を語るとき"],
                 examples: [
                    ("Morning routine.", "朝の日課。"),
                    ("Stick to the routine.", "ルーチンを守る。")
                 ]),
            make("schedule", "a plan of times for events",
                 "予定・スケジュール",
                 useCases: ["予定や時間割を話すとき"],
                 examples: [
                    ("Tight schedule.", "きついスケジュール。"),
                    ("Check the schedule.", "予定を確認して。")
                 ]),
            make("break", "a short rest from work",
                 "休憩・休み",
                 useCases: ["休憩を取るとき"],
                 examples: [
                    ("Take a break.", "休憩する。"),
                    ("A 10-minute break.", "10分休憩。")
                 ]),
            make("work shift", "scheduled work period",
                 "交代・勤務時間",
                 useCases: ["シフト勤務について話すとき"],
                 examples: [
                    ("Night shift.", "夜勤。"),
                    ("My shift starts at 9.", "シフトは9時から。")
                 ]),
            make("commute", "travel between home and work",
                 "通勤・通学",
                 useCases: ["通勤事情を話すとき"],
                 examples: [
                    ("Long commute.", "長い通勤。"),
                    ("My commute is 1 hour.", "通勤に1時間。")
                 ]),
            make("leftovers", "remaining food from a meal",
                 "残り物",
                 useCases: ["食べ残しを話題にするとき"],
                 examples: [
                    ("Eat the leftovers.", "残りを食べる。"),
                    ("Leftovers for lunch.", "昼は残り物。")
                 ]),
            make("stuff", "things in general",
                 "物・こと",
                 useCases: ["漠然と物事を指すとき"],
                 examples: [
                    ("Got stuff to do.", "やることがある。"),
                    ("Pack your stuff.", "荷物まとめて。")
                 ]),
            make("junk", "useless or worthless items",
                 "がらくた・くだらない物",
                 useCases: ["不要な物を表すとき"],
                 examples: [
                    ("Throw out the junk.", "がらくたを捨てる。"),
                    ("Full of junk.", "ガラクタだらけ。")
                 ])
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
                 ]),
            make("acquaintance", "a person known slightly",
                 "知り合い",
                 useCases: ["友達ではない知人について話すとき"],
                 examples: [
                    ("Just an acquaintance.", "ただの知り合い。"),
                    ("An old acquaintance.", "昔の知人。")
                 ]),
            make("roommate", "a person sharing a room",
                 "ルームメイト",
                 useCases: ["同居人について話すとき"],
                 examples: [
                    ("My roommate snores.", "ルームメイトがいびきをかく。"),
                    ("Looking for a roommate.", "ルームメイト募集中。")
                 ]),
            make("classmate", "a person in the same class",
                 "クラスメート",
                 useCases: ["同級生を話題にするとき"],
                 examples: [
                    ("Old classmate.", "昔のクラスメート。"),
                    ("Met a classmate.", "クラスメートに会った。")
                 ]),
            make("boss", "the person in charge",
                 "上司・ボス",
                 useCases: ["上司について話すとき"],
                 examples: [
                    ("My boss is nice.", "上司は親切。"),
                    ("Tell the boss.", "上司に言って。")
                 ]),
            make("rival", "a competitor",
                 "ライバル",
                 useCases: ["競争相手を表すとき"],
                 examples: [
                    ("Long-time rival.", "長年のライバル。"),
                    ("Bitter rivals.", "ガチのライバル。")
                 ]),
            make("fan", "an enthusiastic admirer",
                 "ファン",
                 useCases: ["熱烈な支持者であることを伝えるとき"],
                 examples: [
                    ("Big fan of yours.", "大ファン。"),
                    ("A huge fan.", "ガチファン。")
                 ]),
            make("expert", "a person with deep knowledge",
                 "専門家",
                 useCases: ["特定分野の専門家を指すとき"],
                 examples: [
                    ("An expert in law.", "法律の専門家。"),
                    ("Ask an expert.", "専門家に聞いて。")
                 ]),
            make("rookie", "a beginner; a newcomer",
                 "新人",
                 useCases: ["未経験者を表すとき"],
                 examples: [
                    ("A complete rookie.", "まったくの新人。"),
                    ("Rookie mistake.", "新人ミス。")
                 ]),
            make("fool", "a silly or foolish person",
                 "馬鹿・愚か者",
                 useCases: ["愚かな行動を非難するとき"],
                 examples: [
                    ("Don't be a fool.", "馬鹿なまねするな。"),
                    ("What a fool.", "なんて馬鹿。")
                 ])
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
                 ]),
            make("relief", "easing of distress",
                 "安堵",
                 useCases: ["心配が解消されたとき"],
                 examples: [
                    ("What a relief!", "ほっとした！"),
                    ("A sense of relief.", "安堵感。")
                 ]),
            make("excitement", "a feeling of eager enthusiasm",
                 "興奮",
                 useCases: ["わくわく感を伝えるとき"],
                 examples: [
                    ("Full of excitement.", "興奮でいっぱい。"),
                    ("With excitement.", "ワクワクして。")
                 ]),
            make("boredom", "the state of being bored",
                 "退屈",
                 useCases: ["何もすることがないとき"],
                 examples: [
                    ("Pure boredom.", "完全に退屈。"),
                    ("Out of boredom.", "退屈しのぎに。")
                 ])
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
                 ]),
            make("fuss", "excessive commotion or excitement",
                 "大騒ぎ",
                 useCases: ["些細なことで騒ぐ場面"],
                 examples: [
                    ("Don't make a fuss.", "騒がないで。"),
                    ("What's all the fuss?", "何の騒ぎ？")
                 ]),
            make("drama", "exaggerated trouble or commotion",
                 "もめごと・大げさな騒ぎ",
                 useCases: ["人間関係の揉め事を語るとき"],
                 examples: [
                    ("Too much drama.", "騒ぎすぎ。"),
                    ("I hate drama.", "揉め事は嫌。")
                 ]),
            make("headache", "a troublesome problem",
                 "頭痛・頭の痛い問題",
                 useCases: ["厄介な問題を表すとき"],
                 examples: [
                    ("That's a headache.", "頭の痛い話だ。"),
                    ("A real headache.", "本当に厄介。")
                 ]),
            make("nightmare", "a very bad experience",
                 "悪夢・最悪な経験",
                 useCases: ["最悪の体験を語るとき"],
                 examples: [
                    ("It was a nightmare.", "最悪だった。"),
                    ("A logistical nightmare.", "ロジ面で悪夢。")
                 ]),
            make("pain", "something annoying; distress",
                 "苦痛・面倒",
                 useCases: ["厄介な人や物事に対して"],
                 examples: [
                    ("Such a pain.", "マジで面倒。"),
                    ("He's a pain.", "彼って面倒。")
                 ]),
            make("trick", "a clever method or technique",
                 "手品・コツ",
                 useCases: ["うまくやるコツを伝えるとき"],
                 examples: [
                    ("The trick is to relax.", "コツはリラックス。"),
                    ("Learn the trick.", "コツを覚える。")
                 ]),
            make("point", "the main idea or purpose",
                 "要点・意義",
                 useCases: ["話の要点や意味を問うとき"],
                 examples: [
                    ("What's the point?", "何の意味？"),
                    ("Get to the point.", "要点を言って。")
                 ])
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
                 ]),
            make("respond", "reply or react",
                 "応える",
                 useCases: ["返答や反応をするとき"],
                 examples: [
                    ("Respond quickly.", "すぐに応える。"),
                    ("He didn't respond.", "返事しなかった。")
                 ]),
            make("freeze", "become motionless from shock",
                 "凍る・固まる",
                 useCases: ["驚きで動けなくなったとき"],
                 examples: [
                    ("I froze in shock.", "ショックで固まった。"),
                    ("Freeze!", "動くな！")
                 ]),
            make("panic", "feel sudden uncontrollable fear",
                 "慌てる",
                 useCases: ["焦らないよう声を掛けるとき"],
                 examples: [
                    ("Don't panic!", "慌てないで！"),
                    ("She panicked.", "彼女は慌てた。")
                 ]),
            make("flinch", "make a quick involuntary movement",
                 "びくっとする",
                 useCases: ["驚いて身を縮めるとき"],
                 examples: [
                    ("I flinched.", "びくっとした。"),
                    ("He didn't flinch.", "彼はびくともしなかった。")
                 ]),
            make("brace", "prepare for something difficult",
                 "身構える",
                 useCases: ["心の準備をするとき"],
                 examples: [
                    ("Brace yourself.", "覚悟して。"),
                    ("Brace for impact.", "衝撃に備えて。")
                 ]),
            make("endure", "bear hardship patiently",
                 "耐える",
                 useCases: ["苦痛や困難に耐えるとき"],
                 examples: [
                    ("Endure the pain.", "痛みに耐える。"),
                    ("Hard to endure.", "耐え難い。")
                 ]),
            make("resist", "withstand or oppose",
                 "抵抗する",
                 useCases: ["誘惑や圧力に逆らうとき"],
                 examples: [
                    ("Hard to resist.", "我慢しにくい。"),
                    ("Resist the urge.", "衝動に抗う。")
                 ]),
            make("yield", "give way; submit",
                 "譲る・屈する",
                 useCases: ["圧力に屈する、道を譲るとき"],
                 examples: [
                    ("Yield to pressure.", "プレッシャーに屈する。"),
                    ("Yield the right of way.", "道を譲る。")
                 ])
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
                 ]),
            make("shift", "move; change position or focus",
                 "移す・変える",
                 useCases: ["焦点や立場を変えるとき"],
                 examples: [
                    ("Shift focus.", "焦点を移す。"),
                    ("Shift gears.", "ギアを変える。")
                 ]),
            make("transform", "change form completely",
                 "変身する・大きく変わる",
                 useCases: ["劇的な変化を表すとき"],
                 examples: [
                    ("Transform overnight.", "一夜にして変わる。"),
                    ("Transformed by experience.", "経験で変わった。")
                 ]),
            make("evolve", "develop gradually",
                 "進化する",
                 useCases: ["徐々に発展していく様を表すとき"],
                 examples: [
                    ("The plan evolved.", "計画は進化した。"),
                    ("Tastes evolve.", "好みは変わる。")
                 ]),
            make("switch", "change from one to another",
                 "切り替える",
                 useCases: ["別のものに替えるとき"],
                 examples: [
                    ("Switch jobs.", "仕事を変える。"),
                    ("Switch off.", "電源を切る。")
                 ]),
            make("convert", "change in form or function",
                 "変換する・改宗する",
                 useCases: ["数値や信仰などを切り替えるとき"],
                 examples: [
                    ("Convert dollars to yen.", "ドルを円に。"),
                    ("Convert the file.", "ファイルを変換。")
                 ]),
            make("swap", "exchange one thing for another",
                 "交換する",
                 useCases: ["物や場所を交換するとき"],
                 examples: [
                    ("Let's swap seats.", "席を交換しよう。"),
                    ("Swap stories.", "話を交換する。")
                 ]),
            make("trade", "exchange; engage in commerce",
                 "交換する・取引する",
                 useCases: ["物の取引や交換をするとき"],
                 examples: [
                    ("Trade cards.", "カードを交換。"),
                    ("Trade stocks.", "株を取引。")
                 ]),
            make("alter", "make different; modify",
                 "変える・改める",
                 useCases: ["服や計画を変更するとき"],
                 examples: [
                    ("Alter the dress.", "服を直す。"),
                    ("Alter the plan.", "計画を変更。")
                 ])
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
                 ]),
            make("savor", "taste and enjoy fully",
                 "味わう",
                 useCases: ["じっくり味わうことを表すとき"],
                 examples: [
                    ("Savor every bite.", "一口ずつ味わう。"),
                    ("Savor the moment.", "瞬間を味わう。")
                 ]),
            make("cherish", "hold dear; treasure",
                 "大切にする",
                 useCases: ["思い出や人を大切にするとき"],
                 examples: [
                    ("Cherish memories.", "思い出を大切に。"),
                    ("Cherish your family.", "家族を大切に。")
                 ]),
            make("embrace", "accept willingly; hug",
                 "受け入れる・抱きしめる",
                 useCases: ["変化や考えを受け入れるとき"],
                 examples: [
                    ("Embrace change.", "変化を受け入れる。"),
                    ("Embrace the challenge.", "挑戦を受け入れる。")
                 ]),
            make("explore", "investigate; travel through",
                 "探検する・探る",
                 useCases: ["選択肢や場所を探るとき"],
                 examples: [
                    ("Explore options.", "選択肢を探る。"),
                    ("Explore the city.", "街を探検する。")
                 ])
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
                 ]),
            make("damage", "cause harm to",
                 "ダメージを与える",
                 useCases: ["損傷や悪影響を伝えるとき"],
                 examples: [
                    ("Damaged beyond repair.", "修復不能。"),
                    ("It damaged the wall.", "壁を傷つけた。")
                 ]),
            make("ruin", "spoil completely",
                 "台無しにする",
                 useCases: ["楽しみを台無しにするとき"],
                 examples: [
                    ("Ruin the day.", "一日を台無し。"),
                    ("Don't ruin it.", "台無しにしないで。")
                 ]),
            make("destroy", "put an end to; demolish",
                 "破壊する",
                 useCases: ["物理的・抽象的に破壊するとき"],
                 examples: [
                    ("Destroy the evidence.", "証拠を破壊。"),
                    ("Destroyed by fire.", "火で焼失。")
                 ])
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
                 ]),
            make("support", "give backing to",
                 "支える",
                 useCases: ["精神的・経済的に支えるとき"],
                 examples: [
                    ("Support each other.", "助け合う。"),
                    ("I support you.", "応援してる。")
                 ]),
            make("aid", "provide assistance",
                 "援助する",
                 useCases: ["人道支援などを表すとき"],
                 examples: [
                    ("Aid the victims.", "被害者を支援。"),
                    ("Foreign aid.", "海外援助。")
                 ]),
            make("defend", "protect from attack; argue for",
                 "守る・擁護する",
                 useCases: ["守るまたは弁護するとき"],
                 examples: [
                    ("Defend yourself.", "自分を守って。"),
                    ("Defend the title.", "タイトルを守る。")
                 ]),
            make("protect", "keep safe from harm",
                 "守る",
                 useCases: ["危険から守るとき"],
                 examples: [
                    ("Protect the environment.", "環境を守る。"),
                    ("Protect your eyes.", "目を守って。")
                 ])
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
                 ]),
            make("it breaks my heart", "it makes me very sad",
                 "胸が痛む",
                 useCases: ["辛い場面に立ち会ったとき"],
                 examples: [
                    ("It breaks my heart to see this.", "見ていて辛い。"),
                    ("It breaks my heart to say no.", "断るのが辛い。")
                 ]),
            make("it warms my heart", "it makes me feel happy and touched",
                 "心が温まる",
                 useCases: ["心温まる出来事に対して"],
                 examples: [
                    ("It warms my heart to hear that.", "聞いて温かくなる。"),
                    ("It warms my heart.", "心が温まる。")
                 ]),
            make("it blew my mind", "it astonished me",
                 "衝撃を受けた",
                 useCases: ["強い驚きを表すとき"],
                 examples: [
                    ("It blew my mind!", "衝撃だった！"),
                    ("That movie blew my mind.", "あの映画は衝撃。")
                 ]),
            make("it cracks me up", "it makes me laugh hard",
                 "大笑いさせる",
                 useCases: ["大ウケしたとき"],
                 examples: [
                    ("That cracks me up.", "笑える。"),
                    ("He cracks me up.", "彼マジ笑わせる。")
                 ]),
            make("it drives me up the wall", "it irritates me intensely",
                 "めっちゃイライラする",
                 useCases: ["強い苛立ちを表すとき"],
                 examples: [
                    ("It drives me up the wall.", "めっちゃイライラ。"),
                    ("That noise drives me up the wall.", "あの音マジ無理。")
                 ]),
            make("it tickles me pink", "it delights me greatly",
                 "めっちゃ嬉しい",
                 useCases: ["大喜びを表すとき"],
                 examples: [
                    ("It tickled me pink.", "大喜びだった。"),
                    ("That tickles me pink.", "めっちゃ嬉しい。")
                 ]),
            make("I can't get over it", "I can't stop thinking about it",
                 "信じられない・忘れられない",
                 useCases: ["強い驚きが残るとき"],
                 examples: [
                    ("I can't get over it.", "信じられない。"),
                    ("I still can't get over it.", "まだ忘れられない。")
                 ]),
            make("it rings a bell", "it sounds vaguely familiar",
                 "心当たりがある",
                 useCases: ["うっすら覚えがあるとき"],
                 examples: [
                    ("The name rings a bell.", "名前に聞き覚え。"),
                    ("That rings a bell.", "聞き覚えある。")
                 ]),
            make("it hits home", "it deeply affects me personally",
                 "心に響く・身にしみる",
                 useCases: ["自分事として響いたとき"],
                 examples: [
                    ("That really hit home.", "本当に響いた。"),
                    ("Those words hit home.", "あの言葉、身にしみた。")
                 ])
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
                 ]),
            make("a perfect storm", "a rare combination of bad events",
                 "最悪の事態の重なり",
                 useCases: ["悪条件が重なった状況を表すとき"],
                 examples: [
                    ("A perfect storm of problems.", "問題が重なった。"),
                    ("It was a perfect storm.", "最悪の重なりだった。")
                 ]),
            make("a dark horse", "an unknown competitor with hidden ability",
                 "隠れた実力者",
                 useCases: ["予想外の有力者を表すとき"],
                 examples: [
                    ("He's a dark horse.", "彼は穴馬。"),
                    ("She turned out to be a dark horse.", "彼女が伏兵だった。")
                 ]),
            make("a wild card", "an unpredictable factor",
                 "予測できない要素",
                 useCases: ["読めない要素・人を表すとき"],
                 examples: [
                    ("He's the wild card.", "彼が予測不能要素。"),
                    ("Weather is a wild card.", "天気が読めない。")
                 ]),
            make("a backup plan", "a secondary plan",
                 "バックアップの計画",
                 useCases: ["予備案を持つよう促すとき"],
                 examples: [
                    ("Have a backup plan.", "予備の計画を持って。"),
                    ("We need a backup plan.", "バックアップが必要。")
                 ]),
            make("a game changer", "something that drastically alters things",
                 "状況を一変させるもの",
                 useCases: ["画期的な変化を伝えるとき"],
                 examples: [
                    ("This is a game changer.", "これは画期的。"),
                    ("AI is a game changer.", "AIはゲームチェンジャー。")
                 ]),
            make("a no-show", "someone who fails to appear",
                 "約束をすっぽかす人",
                 useCases: ["来なかった人を話すとき"],
                 examples: [
                    ("He was a no-show.", "すっぽかされた。"),
                    ("Three no-shows today.", "今日3人来なかった。")
                 ]),
            make("a heads-up", "an advance warning",
                 "事前の知らせ",
                 useCases: ["前もって知らせてもらったお礼"],
                 examples: [
                    ("Thanks for the heads-up.", "知らせてくれてありがとう。"),
                    ("Just a heads-up.", "一応お知らせ。")
                 ]),
            make("a stretch", "an exaggeration; far-fetched",
                 "無理がある・大げさ",
                 useCases: ["論理に飛躍があるとき"],
                 examples: [
                    ("That's a stretch.", "それはちょっと無理。"),
                    ("Bit of a stretch.", "ちょっと無理ある。")
                 ]),
            make("a long shot", "something with little chance of success",
                 "望み薄",
                 useCases: ["成功確率が低いことを表すとき"],
                 examples: [
                    ("It's a long shot.", "望み薄だ。"),
                    ("A long shot, but worth trying.", "望み薄だがやる価値はある。")
                 ])
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
                 ]),
            make("now that you mention it", "thinking about what you said",
                 "言われてみれば",
                 useCases: ["相手の指摘で気付いたとき"],
                 examples: [
                    ("Now that you mention it, true.", "言われてみればそう。"),
                    ("Now that you mention it, I forgot.", "言われてみれば忘れてた。")
                 ]),
            make("that reminds me", "that makes me think of",
                 "それで思い出した",
                 useCases: ["話題から連想して思い出したとき"],
                 examples: [
                    ("That reminds me, I called.", "それで思い出した、電話したんだ。"),
                    ("That reminds me of something.", "それで思い出した。")
                 ]),
            make("as I was saying", "to continue what I was saying",
                 "さっき言ったように",
                 useCases: ["遮られた話を再開するとき"],
                 examples: [
                    ("As I was saying, no.", "さっきも言ったがノー。"),
                    ("As I was saying, we should leave.", "さっき言った通り出るべき。")
                 ]),
            make("where was I", "where did I leave off",
                 "どこまで話したっけ？",
                 useCases: ["話を中断後再開するとき"],
                 examples: [
                    ("Anyway, where was I?", "どこまで話したっけ？"),
                    ("Sorry, where was I?", "ごめん、どこまで話したっけ？")
                 ]),
            make("long story short", "to summarize briefly",
                 "手短に言うと",
                 useCases: ["話を短くまとめて伝えるとき"],
                 examples: [
                    ("Long story short, we won.", "手短に言うと勝った。"),
                    ("Long story short, it failed.", "要するに失敗。")
                 ]),
            make("in any case", "regardless; anyway",
                 "いずれにしても",
                 useCases: ["結論を述べるとき"],
                 examples: [
                    ("In any case, thanks.", "いずれにせよ感謝。"),
                    ("In any case, we'll go.", "いずれにせよ行く。")
                 ]),
            make("at any rate", "anyway; in any event",
                 "とにかく",
                 useCases: ["話をまとめるとき"],
                 examples: [
                    ("At any rate, decided.", "とにかく決めた。"),
                    ("At any rate, let's start.", "とにかく始めよう。")
                 ]),
            make("for starters", "to begin with",
                 "まず手始めに",
                 useCases: ["列挙の最初を述べるとき"],
                 examples: [
                    ("For starters, hello.", "まずこんにちは。"),
                    ("For starters, it's expensive.", "まず高い。")
                 ]),
            make("off the top of my head", "without careful thought",
                 "パッと思いつく",
                 useCases: ["即興で思い付きを言うとき"],
                 examples: [
                    ("Off the top of my head, three.", "パッと3つ思いつく。"),
                    ("Off the top of my head, no idea.", "パッとは分からない。")
                 ])
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
                 ]),
            make("vibe", "a feeling or atmosphere",
                 "雰囲気・空気感",
                 useCases: ["場や人の雰囲気を表すとき"],
                 examples: [
                    ("Good vibes only.", "良い雰囲気だけで。"),
                    ("I get weird vibes from him.", "彼から変な空気を感じる。")
                 ]),
            make("gut feeling", "an instinctive belief",
                 "直感・第六感",
                 useCases: ["理屈ではなく直感で判断するとき"],
                 examples: [
                    ("My gut feeling says no.", "直感的にダメ。"),
                    ("Trust your gut feeling.", "直感を信じて。")
                 ]),
            make("crush", "an intense but brief infatuation",
                 "夢中・片思い",
                 useCases: ["誰かに一時的に夢中になっているとき"],
                 examples: [
                    ("I have a crush on her.", "彼女に夢中なんだ。"),
                    ("It's just a crush.", "ただの片思い。")
                 ]),
            make("burnout", "exhaustion from prolonged stress",
                 "燃え尽き症候群",
                 useCases: ["仕事や勉強で疲弊しきった状態を表すとき"],
                 examples: [
                    ("I'm close to burnout.", "燃え尽きそう。"),
                    ("Burnout is real.", "燃え尽きは本当にある。")
                 ]),
            make("baggage", "emotional burdens from the past",
                 "心の重荷・過去の傷",
                 useCases: ["過去のトラウマや感情的負担を表すとき"],
                 examples: [
                    ("He has a lot of baggage.", "彼は心の重荷が多い。"),
                    ("Emotional baggage.", "心の傷。")
                 ]),
            make("closure", "a sense of resolution",
                 "気持ちの区切り",
                 useCases: ["終わったことに対する心の整理を表すとき"],
                 examples: [
                    ("I need closure.", "気持ちの区切りが欲しい。"),
                    ("She found closure.", "彼女は区切りをつけた。")
                 ])
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
                 ]),
            make("favor", "a kind act done for someone",
                 "頼みごと・親切",
                 useCases: ["人に何かをお願いするとき"],
                 examples: [
                    ("Can I ask a favor?", "お願いしていい?"),
                    ("Do me a favor.", "頼みごと聞いて。")
                 ]),
            make("excuse", "an explanation for a fault",
                 "言い訳・口実",
                 useCases: ["失敗や遅刻の理由を述べるとき"],
                 examples: [
                    ("No more excuses.", "もう言い訳しないで。"),
                    ("That's a lame excuse.", "ひどい言い訳。")
                 ]),
            make("apology", "an expression of regret",
                 "謝罪",
                 useCases: ["謝罪の言葉や行為を表すとき"],
                 examples: [
                    ("I owe you an apology.", "謝らないと。"),
                    ("Accept my apology.", "私の謝罪を受け入れて。")
                 ]),
            make("compliment", "an expression of praise",
                 "褒め言葉",
                 useCases: ["相手を褒めるとき"],
                 examples: [
                    ("Thanks for the compliment.", "褒めてくれてありがとう。"),
                    ("Take it as a compliment.", "褒め言葉として受け取って。")
                 ]),
            make("misunderstanding", "a failure to understand correctly",
                 "誤解",
                 useCases: ["話が食い違ったとき"],
                 examples: [
                    ("It was a misunderstanding.", "誤解だった。"),
                    ("Clear up the misunderstanding.", "誤解を解こう。")
                 ])
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
                 ]),
            make("paycheck", "a check for an employee's wages",
                 "給料・給料の小切手",
                 useCases: ["給料日や手取りの話をするとき"],
                 examples: [
                    ("Live paycheck to paycheck.", "ギリギリの生活。"),
                    ("Got my paycheck today.", "今日給料日だった。")
                 ]),
            make("bonus", "an extra payment or perk",
                 "ボーナス・特典",
                 useCases: ["臨時収入や特典について話すとき"],
                 examples: [
                    ("Year-end bonus.", "年末ボーナス。"),
                    ("That's a nice bonus.", "それは嬉しい特典。")
                 ]),
            make("interview", "a formal meeting for evaluation",
                 "面接",
                 useCases: ["仕事や入学の面接について話すとき"],
                 examples: [
                    ("Job interview tomorrow.", "明日面接。"),
                    ("Nail the interview.", "面接決めて。")
                 ]),
            make("resume", "a summary of one's work history",
                 "履歴書",
                 useCases: ["就職活動の書類について話すとき"],
                 examples: [
                    ("Send your resume.", "履歴書を送って。"),
                    ("Update my resume.", "履歴書を更新する。")
                 ]),
            make("promotion", "advancement in rank",
                 "昇進",
                 useCases: ["仕事上の出世について話すとき"],
                 examples: [
                    ("Got a promotion.", "昇進した。"),
                    ("In line for promotion.", "昇進候補。")
                 ]),
            make("budget", "an amount of money planned",
                 "予算",
                 useCases: ["お金の使い道を計画するとき"],
                 examples: [
                    ("On a tight budget.", "予算がきつい。"),
                    ("Stay within budget.", "予算内に収める。")
                 ])
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
                 ]),
            make("groceries", "food and household supplies",
                 "食料品",
                 useCases: ["スーパーで買う日用品を表すとき"],
                 examples: [
                    ("Going to buy groceries.", "食料品買いに行く。"),
                    ("Carry the groceries.", "食料品運んで。")
                 ]),
            make("rent", "regular payment for a place to live",
                 "家賃",
                 useCases: ["家賃の話をするとき"],
                 examples: [
                    ("Pay the rent.", "家賃を払う。"),
                    ("Rent is going up.", "家賃が上がる。")
                 ]),
            make("utilities", "essential household services",
                 "光熱費・公共料金",
                 useCases: ["電気・ガス・水道代を話題にするとき"],
                 examples: [
                    ("Utilities are expensive.", "光熱費が高い。"),
                    ("Rent includes utilities.", "家賃に光熱費込み。")
                 ])
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
                 ]),
            make("trouble", "difficulty or problems",
                 "面倒・トラブル",
                 useCases: ["厄介な状況を表すとき"],
                 examples: [
                    ("In big trouble.", "大ピンチ。"),
                    ("Save you the trouble.", "面倒を省くため。")
                 ]),
            make("disaster", "a complete failure or calamity",
                 "大失敗・大惨事",
                 useCases: ["最悪の結果や災難について話すとき"],
                 examples: [
                    ("It was a total disaster.", "完全な大失敗。"),
                    ("Disaster waiting to happen.", "災難が起きそう。")
                 ]),
            make("setback", "a reversal or check in progress",
                 "後退・つまずき",
                 useCases: ["計画や進捗が妨げられたとき"],
                 examples: [
                    ("A minor setback.", "ちょっとした後退。"),
                    ("Recover from a setback.", "つまずきから立ち直る。")
                 ]),
            make("red flag", "a warning sign",
                 "危険信号",
                 useCases: ["問題の兆候や警戒すべきサインを表すとき"],
                 examples: [
                    ("That's a red flag.", "それは危険信号。"),
                    ("Red flags everywhere.", "あちこちに危険信号。")
                 ]),
            make("dealbreaker", "an issue that ends a negotiation or relationship",
                 "致命的な条件・決定打",
                 useCases: ["交渉や関係を終わらせる決定的な要素を話すとき"],
                 examples: [
                    ("That's a dealbreaker.", "それは決定打。"),
                    ("Lateness is a dealbreaker.", "遅刻は致命的。")
                 ])
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
                 ]),
            make("perk", "an extra benefit or advantage",
                 "特典・福利厚生",
                 useCases: ["仕事や会員サービスの特典を話すとき"],
                 examples: [
                    ("Job perks are great.", "仕事の特典がいい。"),
                    ("That's a nice perk.", "それは嬉しい特典。")
                 ]),
            make("downside", "a disadvantage or drawback",
                 "欠点・マイナス面",
                 useCases: ["物事の悪い面を述べるとき"],
                 examples: [
                    ("The only downside is the price.", "唯一の欠点は値段。"),
                    ("Every job has downsides.", "どんな仕事にも欠点がある。")
                 ]),
            make("upside", "an advantage or positive aspect",
                 "利点・プラス面",
                 useCases: ["物事の良い面を述べるとき"],
                 examples: [
                    ("The upside is the flexibility.", "利点は柔軟さ。"),
                    ("Look on the upside.", "良い面を見て。")
                 ]),
            make("option", "a choice or alternative",
                 "選択肢",
                 useCases: ["可能な選択を話すとき"],
                 examples: [
                    ("Weigh your options.", "選択肢を検討して。"),
                    ("Not an option.", "選択肢にない。")
                 ]),
            make("effort", "vigorous attempt or work",
                 "努力",
                 useCases: ["頑張りや手間について話すとき"],
                 examples: [
                    ("Put in the effort.", "努力する。"),
                    ("Worth the effort.", "努力する価値あり。")
                 ])
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
                 ]),
            make("no offense", "without intending to insult",
                 "悪気はないけど",
                 useCases: ["失礼な発言の前に断りを入れるとき"],
                 examples: [
                    ("No offense, but ~", "悪気はないけど〜"),
                    ("None taken.", "気にしてないよ。")
                 ]),
            make("just saying", "merely stating an opinion",
                 "言ってみただけ",
                 useCases: ["主張をやわらげる時の捨て台詞"],
                 examples: [
                    ("Just saying.", "言ってみただけ。"),
                    ("I'm just saying, ~", "ただ言いたいのは〜")
                 ]),
            make("don't get me wrong", "don't misunderstand",
                 "誤解しないで",
                 useCases: ["否定的なことを言う前に弁解するとき"],
                 examples: [
                    ("Don't get me wrong, I like him.", "誤解しないで、彼好きだよ。"),
                    ("Don't get me wrong, but ~", "誤解しないでほしいけど〜")
                 ])
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
                 ]),
            make("broken", "damaged and no longer working",
                 "壊れた・故障した",
                 useCases: ["物や心の状態が壊れていることを表すとき"],
                 examples: [
                    ("The phone is broken.", "電話が壊れてる。"),
                    ("Broken promises.", "破られた約束。")
                 ]),
            make("blur", "make unclear or indistinct",
                 "ぼかす・かすませる",
                 useCases: ["輪郭や境界をはっきりさせなくするとき"],
                 examples: [
                    ("Blur the background.", "背景をぼかす。"),
                    ("Tears blurred my vision.", "涙で視界がぼやけた。")
                 ]),
            make("path", "a way or track for walking",
                 "小道・進路",
                 useCases: ["歩く道や人生の進路を表すとき"],
                 examples: [
                    ("Follow the path.", "道に沿って進んで。"),
                    ("A different path in life.", "別の人生の道。")
                 ]),
            make("skypath", "an elevated pedestrian walkway",
                 "高架の歩道・スカイパス",
                 useCases: ["建物間を結ぶ高架の通路を表すとき"],
                 examples: [
                    ("Use the skypath to cross.", "スカイパスで渡って。"),
                    ("The skypath connects two buildings.", "スカイパスが二棟をつなぐ。")
                 ]),
            make("sidewalk", "a paved path for pedestrians beside a road",
                 "歩道",
                 useCases: ["車道の脇の歩く道を表すとき"],
                 examples: [
                    ("Walk on the sidewalk.", "歩道を歩いて。"),
                    ("Cracks in the sidewalk.", "歩道のひび。")
                 ]),
            make("footpath", "a narrow path for walking",
                 "小道・歩道",
                 useCases: ["公園や郊外などの細い歩道を表すとき"],
                 examples: [
                    ("A scenic footpath.", "景色のいい小道。"),
                    ("The footpath leads to the lake.", "小道は湖に通じる。")
                 ]),
            make("deserved", "earned because of one's actions",
                 "当然の・ふさわしい",
                 useCases: ["努力や行いに見合った結果を表すとき"],
                 examples: [
                    ("A well-deserved break.", "当然の休息。"),
                    ("Deserved recognition.", "ふさわしい評価。")
                 ]),
            make("pave", "cover a road or path with a hard surface",
                 "舗装する",
                 useCases: ["道路を整備するとき、または土台を作る比喩"],
                 examples: [
                    ("They paved the road.", "道路を舗装した。"),
                    ("Pave the way for change.", "変化への道を開く。")
                 ])
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
                 ]),
            make("in-laws", "relatives by marriage",
                 "義理の家族",
                 useCases: ["配偶者の家族について話すとき"],
                 examples: [
                    ("Meet my in-laws.", "義理の家族に会う。"),
                    ("Dinner with the in-laws.", "義理の家族と夕食。")
                 ]),
            make("bff", "best friend forever",
                 "親友",
                 useCases: ["特別な親友を表すカジュアル略語"],
                 examples: [
                    ("She's my BFF.", "彼女は親友。"),
                    ("My BFF since high school.", "高校からの親友。")
                 ]),
            make("frenemy", "a person who is both friend and rival",
                 "友達のような敵",
                 useCases: ["仲良くも対立もある複雑な関係を表すとき"],
                 examples: [
                    ("She's my frenemy.", "彼女は友敵。"),
                    ("Classic frenemy behavior.", "典型的な友敵的振る舞い。")
                 ]),
            make("newbie", "a newcomer or beginner",
                 "新人・初心者",
                 useCases: ["初心者であることを軽く表すとき"],
                 examples: [
                    ("I'm a newbie here.", "ここでは新人。"),
                    ("Total newbie at coding.", "コードは完全初心者。")
                 ]),
            make("local", "a person who lives in a particular area",
                 "地元の人",
                 useCases: ["観光客と対比して地元住民を表すとき"],
                 examples: [
                    ("Ask the locals.", "地元の人に聞いて。"),
                    ("This is a local spot.", "これは地元の店。")
                 ])
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
                 ]),
            make("comfort zone", "a place or situation where one feels secure",
                 "居心地のいい範囲",
                 useCases: ["挑戦と対比して安全圏を表すとき"],
                 examples: [
                    ("Step out of your comfort zone.", "コンフォートゾーンから出て。"),
                    ("Staying in my comfort zone.", "安全圏にとどまってる。")
                 ]),
            make("peace of mind", "freedom from worry",
                 "心の安らぎ",
                 useCases: ["安心感を保証するとき"],
                 examples: [
                    ("For peace of mind.", "安心のため。"),
                    ("Brings me peace of mind.", "私を安心させる。")
                 ]),
            make("pet peeve", "a particular annoyance",
                 "特に気に障ること",
                 useCases: ["細かいけど自分には特に嫌なことを表すとき"],
                 examples: [
                    ("That's my pet peeve.", "それが私のツボにハマる嫌さ。"),
                    ("My biggest pet peeve.", "一番のイラポイント。")
                 ]),
            make("wake-up call", "an event that prompts reflection",
                 "目を覚まさせる出来事",
                 useCases: ["気付かせてくれる出来事を表すとき"],
                 examples: [
                    ("It was a wake-up call.", "目を覚まされた。"),
                    ("Took it as a wake-up call.", "戒めとして受け止めた。")
                 ]),
            make("soft spot", "a fond feeling for something",
                 "弱み・好きなもの",
                 useCases: ["特定の人や物に弱いことを表すとき"],
                 examples: [
                    ("I have a soft spot for cats.", "猫には弱い。"),
                    ("She has a soft spot for him.", "彼女は彼に弱い。")
                 ])
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
                 ]),
            make("inside joke", "a joke understood only by a particular group",
                 "内輪のジョーク",
                 useCases: ["仲間内だけで分かる冗談を表すとき"],
                 examples: [
                    ("It's an inside joke.", "内輪ネタなんだ。"),
                    ("We have lots of inside jokes.", "内輪ジョークがたくさん。")
                 ]),
            make("cold shoulder", "a deliberately unfriendly attitude",
                 "冷たい態度",
                 useCases: ["わざと無視するような対応を表すとき"],
                 examples: [
                    ("Give the cold shoulder.", "冷たい態度を取る。"),
                    ("Got the cold shoulder.", "冷たくあしらわれた。")
                 ]),
            make("silent treatment", "ignoring someone deliberately",
                 "無視する態度",
                 useCases: ["怒って口をきかない態度を表すとき"],
                 examples: [
                    ("She's giving me the silent treatment.", "彼女に無視されてる。"),
                    ("Stop the silent treatment.", "無視するのやめて。")
                 ]),
            make("shoutout", "a public acknowledgment or greeting",
                 "言及・称賛",
                 useCases: ["特定の人を公の場で称えるとき"],
                 examples: [
                    ("Shoutout to my mom!", "母にシャウトアウト!"),
                    ("Big shoutout to the team.", "チームに大いに感謝。")
                 ]),
            make("throwback", "something from the past brought up again",
                 "懐かしいもの・回想",
                 useCases: ["昔の写真や思い出を共有するとき"],
                 examples: [
                    ("Throwback Thursday.", "懐かしの木曜(SNS用語)。"),
                    ("What a throwback!", "懐かしい!")
                 ])
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
                 ]),
            make("side hustle", "a secondary job for extra income",
                 "副業",
                 useCases: ["本業以外の収入源を表すとき"],
                 examples: [
                    ("My side hustle is freelancing.", "副業はフリーランス。"),
                    ("Start a side hustle.", "副業を始める。")
                 ]),
            make("layoff", "dismissal from employment",
                 "解雇・人員削減",
                 useCases: ["会社都合での解雇を表すとき"],
                 examples: [
                    ("Mass layoffs.", "大量解雇。"),
                    ("Survived the layoff.", "解雇を免れた。")
                 ]),
            make("perks", "benefits provided to employees",
                 "福利厚生・特典",
                 useCases: ["仕事の付加価値を話すとき"],
                 examples: [
                    ("Great perks at this job.", "ここは福利厚生がいい。"),
                    ("Free coffee is one of the perks.", "コーヒー無料は特典の一つ。")
                 ]),
            make("red tape", "excessive bureaucratic procedures",
                 "お役所仕事・煩雑な手続き",
                 useCases: ["手続きの煩雑さに不満を述べるとき"],
                 examples: [
                    ("Too much red tape.", "手続きが多すぎる。"),
                    ("Cut through the red tape.", "面倒な手続きを省く。")
                 ]),
            make("networking", "building professional connections",
                 "人脈作り",
                 useCases: ["仕事関連の人間関係を広げるとき"],
                 examples: [
                    ("Networking events.", "人脈作りのイベント。"),
                    ("Good at networking.", "人脈作りが得意。")
                 ])
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
                 ]),
            make("hangover", "the unpleasant after-effects of drinking",
                 "二日酔い",
                 useCases: ["飲み過ぎの翌日の体調を表すとき"],
                 examples: [
                    ("I have a hangover.", "二日酔いだ。"),
                    ("Bad hangover today.", "今日はひどい二日酔い。")
                 ]),
            make("jet lag", "fatigue after long-distance travel",
                 "時差ぼけ",
                 useCases: ["長距離フライト後の疲れを表すとき"],
                 examples: [
                    ("Still have jet lag.", "まだ時差ぼけ。"),
                    ("Jet lag is killing me.", "時差ぼけがつらい。")
                 ]),
            make("cabin fever", "irritability from being confined indoors",
                 "引きこもりによる退屈・イライラ",
                 useCases: ["長く家にいて落ち着かない状態を表すとき"],
                 examples: [
                    ("Getting cabin fever.", "引きこもりでイライラ。"),
                    ("Cabin fever is setting in.", "閉じ込められたストレスがきた。")
                 ]),
            make("spring cleaning", "thorough cleaning of a home",
                 "大掃除",
                 useCases: ["家を徹底的に掃除する作業を表すとき"],
                 examples: [
                    ("Time for spring cleaning.", "大掃除の時期。"),
                    ("Spring cleaning the closet.", "クローゼットを大掃除。")
                 ]),
            make("lifesaver", "something or someone extremely helpful",
                 "救いの神・とても助かるもの",
                 useCases: ["困っているところを助けてくれた人や物を表すとき"],
                 examples: [
                    ("You're a lifesaver!", "命の恩人!"),
                    ("This app is a lifesaver.", "このアプリ救世主。")
                 ])
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
                 ]),
            make("mishap", "an unlucky accident",
                 "ちょっとした事故・不運",
                 useCases: ["些細なトラブルを表すとき"],
                 examples: [
                    ("A minor mishap.", "ちょっとしたトラブル。"),
                    ("Despite a few mishaps.", "いくつかの不運にもかかわらず。")
                 ]),
            make("blind spot", "an area where vision or judgment is limited",
                 "死角・見落とし",
                 useCases: ["気づきにくい弱点や見えない部分を表すとき"],
                 examples: [
                    ("That's my blind spot.", "そこが私の死角。"),
                    ("Check your blind spot.", "死角を確認して。")
                 ]),
            make("ripple effect", "a spreading consequence",
                 "波及効果",
                 useCases: ["一つの出来事が広く影響を及ぼすとき"],
                 examples: [
                    ("A ripple effect on the market.", "市場への波及効果。"),
                    ("Created a ripple effect.", "波及効果を生んだ。")
                 ]),
            make("last straw", "the final cause of frustration",
                 "我慢の限界",
                 useCases: ["最後の決定打となった出来事を表すとき"],
                 examples: [
                    ("That was the last straw.", "それが限界だった。"),
                    ("The last straw for me.", "私にとっての最後の一押し。")
                 ])
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
                 ]),
            make("trade-off", "a balance between competing factors",
                 "一長一短・引き換え",
                 useCases: ["何かを得るために何かを犠牲にする状況を表すとき"],
                 examples: [
                    ("A classic trade-off.", "典型的なトレードオフ。"),
                    ("Time-money trade-off.", "時間と金のトレードオフ。")
                 ]),
            make("bottom line", "the essential point",
                 "結論・肝心な点",
                 useCases: ["話の核心や最終的な結論を述べるとき"],
                 examples: [
                    ("The bottom line is, we need more time.", "結論として、時間が必要だ。"),
                    ("What's the bottom line?", "結論は?")
                 ]),
            make("ballpark", "an approximate range or figure",
                 "おおよその数字",
                 useCases: ["大体の見積もりを話すとき"],
                 examples: [
                    ("Give me a ballpark figure.", "おおよその数字をちょうだい。"),
                    ("In the right ballpark.", "ほぼ合ってる範囲。")
                 ])
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
                 ]),
            make("close call", "a narrow escape from danger",
                 "危機一髪",
                 useCases: ["危険を辛うじて回避したとき"],
                 examples: [
                    ("That was a close call!", "あぶなかった!"),
                    ("Too close a call.", "ぎりぎりすぎた。")
                 ]),
            make("fresh start", "a new beginning",
                 "新たな出発",
                 useCases: ["心機一転して新しく始めるとき"],
                 examples: [
                    ("Time for a fresh start.", "心機一転の時。"),
                    ("Need a fresh start.", "新たな出発が必要。")
                 ]),
            make("blessing in disguise", "an apparent misfortune that turns out for the best",
                 "災い転じて福となす",
                 useCases: ["悪く見えた出来事が結果的に良かったとき"],
                 examples: [
                    ("It was a blessing in disguise.", "結果的には幸運だった。"),
                    ("Sometimes setbacks are blessings in disguise.", "後退も実は幸運のことがある。")
                 ]),
            make("silver lining", "a positive aspect of a difficult situation",
                 "不幸中の幸い",
                 useCases: ["悪い状況の中の明るい面を見つけるとき"],
                 examples: [
                    ("Find the silver lining.", "明るい面を見つけて。"),
                    ("Every cloud has a silver lining.", "どんな暗雲にも光がある(諺)。")
                 ]),
            make("coincidence", "a remarkable concurrence of events",
                 "偶然",
                 useCases: ["驚くほどタイミングよく起きたことを表すとき"],
                 examples: [
                    ("What a coincidence!", "なんて偶然!"),
                    ("By coincidence.", "偶然にも。")
                 ])
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
                 ]),
            make("hit me up", "contact me",
                 "連絡して",
                 useCases: ["カジュアルに連絡を促すとき(略 HMU)"],
                 examples: [
                    ("Hit me up later.", "あとで連絡してね。"),
                    ("Just HMU when you're free.", "暇な時連絡してね。")
                 ]),
            make("ditch", "abandon plans or someone",
                 "ドタキャン・サボる",
                 useCases: ["予定や人を放棄するとき"],
                 examples: [
                    ("Don't ditch me!", "ドタキャンしないで!"),
                    ("Let's ditch class.", "授業サボろう。")
                 ]),
            make("flake", "someone who flakes out on plans",
                 "ドタキャンする人",
                 useCases: ["約束をよく破る人を表すとき"],
                 examples: [
                    ("She's such a flake.", "彼女マジでドタキャン女王。"),
                    ("Don't be a flake.", "ドタキャンするなよ。")
                 ]),
            make("muck up", "make a mess of",
                 "失敗する・めちゃくちゃにする",
                 useCases: ["やらかして台無しにしたとき(英国寄り)"],
                 examples: [
                    ("I mucked it up.", "やらかした。"),
                    ("Don't muck this up.", "失敗するな。")
                 ]),
            make("ghost", "cut off contact suddenly",
                 "音信不通になる・バックレる",
                 useCases: ["既読スルーや突然連絡を絶つこと"],
                 examples: [
                    ("He ghosted me.", "彼にバックれられた。"),
                    ("Don't ghost me!", "音信不通にしないで!")
                 ]),
            make("dump", "end a romantic relationship",
                 "(恋人を)振る",
                 useCases: ["別れを切り出すとき"],
                 examples: [
                    ("She dumped him.", "彼女が彼を振った。"),
                    ("I got dumped.", "振られた。")
                 ]),
            make("keep in touch", "stay in contact",
                 "連絡を取り合おう",
                 useCases: ["別れ際の挨拶として"],
                 examples: [
                    ("Let's keep in touch!", "連絡取り合おうね!"),
                    ("Keep in touch, OK?", "連絡してね?")
                 ]),
            make("loop in", "include someone in communication",
                 "話の輪に入れる",
                 useCases: ["メールやチャットに人を加えるとき"],
                 examples: [
                    ("Loop me in.", "私も入れて。"),
                    ("I'll loop you in.", "話の輪に入れるね。")
                 ]),
            make("binge-watch", "watch many episodes in a row",
                 "(配信などを)一気見する",
                 useCases: ["シリーズドラマを連続で見るとき"],
                 examples: [
                    ("I binge-watched the whole season.", "1シーズン一気見した。"),
                    ("Perfect binge-watching weather.", "一気見日和。")
                 ])
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
                 ]),
            make("pissed off", "very angry",
                 "めちゃくちゃ怒っている",
                 useCases: ["強い不満や怒りを表すとき"],
                 examples: [
                    ("I'm so pissed off.", "マジでムカつく。"),
                    ("That pissed me off.", "それイラっとした。")
                 ]),
            make("busted", "caught doing something wrong",
                 "バレた・見つかった",
                 useCases: ["悪事や秘密がバレたとき"],
                 examples: [
                    ("Busted!", "バレた!"),
                    ("We got busted.", "見つかっちゃった。")
                 ]),
            make("cringe", "feel embarrassed for others",
                 "ドン引きする・痛々しい",
                 useCases: ["見ていて気まずくなるとき"],
                 examples: [
                    ("That's so cringe.", "それマジで痛い。"),
                    ("I cringed so hard.", "ドン引きした。")
                 ]),
            make("craving", "a strong desire for food",
                 "無性に食べたい気持ち",
                 useCases: ["特定の食べ物が欲しくてたまらないとき"],
                 examples: [
                    ("I have a craving for ramen.", "ラーメン食べたい。"),
                    ("Pizza craving!", "ピザ食べたい!")
                 ]),
            make("hungover", "suffering from a hangover",
                 "二日酔いの",
                 useCases: ["昨夜の飲み過ぎで体調が悪いとき(形容詞)"],
                 examples: [
                    ("I'm so hungover.", "二日酔いがひどい。"),
                    ("Are you hungover?", "二日酔い?")
                 ]),
            make("black out", "lose consciousness or memory",
                 "(飲み過ぎで)記憶をなくす",
                 useCases: ["お酒や疲労で意識・記憶が飛ぶとき"],
                 examples: [
                    ("I blacked out last night.", "昨夜記憶ない。"),
                    ("Don't black out!", "気を失うな!")
                 ]),
            make("I'm dead", "find something hilarious",
                 "笑い死ぬ・面白すぎる",
                 useCases: ["大爆笑して動けない時の口語"],
                 examples: [
                    ("LOL, I'm dead!", "草、笑い死ぬ!"),
                    ("That's so funny, I'm dead.", "面白すぎ、死んだ。")
                 ]),
            make("hype", "intense excitement or buzz",
                 "期待・大騒ぎ",
                 useCases: ["盛り上がりや過剰な期待を表すとき"],
                 examples: [
                    ("Don't believe the hype.", "期待しすぎるな。"),
                    ("So much hype around it.", "盛り上がりがすごい。")
                 ]),
            make("freaking", "darn (mild intensifier)",
                 "めちゃくちゃ(強調)",
                 useCases: ["カジュアルに強調する very の代わり"],
                 examples: [
                    ("That's freaking cool!", "マジでかっこいい!"),
                    ("It's freaking cold.", "めちゃ寒い。")
                 ])
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
                 ]),
            make("savage", "ruthlessly cool or brutal",
                 "容赦ない・尖ってる",
                 useCases: ["辛口な発言や行動に対する褒め言葉"],
                 examples: [
                    ("That comment was savage.", "そのコメント、容赦ない。"),
                    ("She's so savage!", "彼女マジで尖ってる!")
                 ]),
            make("epic", "amazing on a grand scale",
                 "最高・ヤバい",
                 useCases: ["スケールの大きな素晴らしさを表すとき"],
                 examples: [
                    ("That was epic!", "あれは最高だった!"),
                    ("Epic fail.", "大失敗。")
                 ]),
            make("slay", "do something exceptionally well",
                 "最高にキマってる",
                 useCases: ["完璧なパフォーマンスを褒めるとき"],
                 examples: [
                    ("You slayed!", "完璧だったよ!"),
                    ("Slay, queen!", "最高!")
                 ]),
            make("GOAT", "Greatest Of All Time",
                 "史上最高・神",
                 useCases: ["最高峰の人物を称えるとき"],
                 examples: [
                    ("He's the GOAT.", "彼は史上最高。"),
                    ("Messi is the GOAT.", "メッシは神。")
                 ]),
            make("on point", "perfect or just right",
                 "バッチリ・完璧",
                 useCases: ["ピタッと決まっている状態を褒めるとき"],
                 examples: [
                    ("Your outfit is on point!", "コーデバッチリ!"),
                    ("Right on point.", "完璧。")
                 ]),
            make("sharp", "precisely on time",
                 "(時間が)きっちり",
                 useCases: ["時刻をぴったり指定するとき"],
                 examples: [
                    ("Be there at 7 sharp.", "7時きっかりに来て。"),
                    ("Meeting at 9 sharp.", "9時ぴったり会議。")
                 ]),
            make("legit", "genuine; really impressive",
                 "ガチ・本物",
                 useCases: ["本物であることを強調するとき(legitimateの略)"],
                 examples: [
                    ("That's legit.", "ガチだね。"),
                    ("Legit good!", "マジで良い!")
                 ]),
            make("sweet", "great or nice",
                 "いいね・最高",
                 useCases: ["何かを褒めるカジュアルな反応"],
                 examples: [
                    ("Sweet!", "いいね!"),
                    ("That's a sweet car.", "いい車。")
                 ]),
            make("sick", "extremely cool",
                 "ヤバい・かっこいい",
                 useCases: ["スラングで「すごい」を表すとき"],
                 examples: [
                    ("That's sick!", "ヤバい!"),
                    ("Sick moves.", "かっこいい動き。")
                 ])
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
                 ]),
            make("same here", "I feel the same way",
                 "私も同じ",
                 useCases: ["相手の発言に共感するとき"],
                 examples: [
                    ("Same here.", "私も。"),
                    ("A: I'm tired. B: Same here.", "「疲れた」「私も」")
                 ]),
            make("ditto", "the same",
                 "同上・私も同じく",
                 useCases: ["相手の発言に同意するカジュアル表現"],
                 examples: [
                    ("Ditto!", "同感!"),
                    ("Ditto on that.", "それな。")
                 ]),
            make("bet", "agreement or affirmation",
                 "了解・それな",
                 useCases: ["カジュアルに同意・了承を伝えるとき"],
                 examples: [
                    ("Bet!", "了解!"),
                    ("You wanna bet?", "賭ける?")
                 ]),
            make("what's up?", "how are things?",
                 "最近どう?・よぉ",
                 useCases: ["カジュアルな挨拶"],
                 examples: [
                    ("Hey, what's up?", "よぉ、どう?"),
                    ("What's up, dude?", "おう、調子は?")
                 ]),
            make("not much", "nothing in particular",
                 "別に何も",
                 useCases: ["「最近どう?」への定番の返し"],
                 examples: [
                    ("Not much, you?", "別に、君は?"),
                    ("Not much, just chilling.", "別にダラダラしてる。")
                 ]),
            make("my treat", "I'll pay for this",
                 "私のおごり",
                 useCases: ["相手の支払いを引き受けるとき"],
                 examples: [
                    ("It's my treat tonight.", "今夜は私のおごり。"),
                    ("My treat!", "おごるよ!")
                 ]),
            make("go Dutch", "split the bill",
                 "割り勘にする",
                 useCases: ["それぞれが自分の分を払うとき"],
                 examples: [
                    ("Let's go Dutch.", "割り勘にしよう。"),
                    ("We always go Dutch.", "私たちはいつも割り勘。")
                 ]),
            make("no hard feelings", "no resentment",
                 "恨みっこなしね",
                 useCases: ["対立後にわだかまりを残さないとき"],
                 examples: [
                    ("No hard feelings, right?", "恨みっこなしだよね?"),
                    ("OK, no hard feelings.", "うん、悪気はないから。")
                 ]),
            make("that's it", "that's all",
                 "以上・それだけ",
                 useCases: ["話や指示を締めくくるとき"],
                 examples: [
                    ("That's it!", "それだけ!"),
                    ("That's it for today.", "今日はここまで。")
                 ])
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
                 ]),
            make("NBD", "no big deal",
                 "大したことじゃない",
                 useCases: ["軽く流すとき(Not a Big Deal の略)"],
                 examples: [
                    ("NBD, really.", "マジで気にしないで。"),
                    ("It's NBD.", "大したことない。")
                 ]),
            make("TGIF", "Thank God It's Friday",
                 "やっと金曜だ",
                 useCases: ["週末の解放感を表すとき"],
                 examples: [
                    ("TGIF!", "やっと金曜!"),
                    ("Finally, TGIF.", "ついに金曜。")
                 ]),
            make("TMI", "too much information",
                 "情報多すぎ",
                 useCases: ["聞きたくないことを言われたとき"],
                 examples: [
                    ("TMI, dude.", "それは言わなくていい。"),
                    ("Whoa, TMI!", "ちょ、TMI!")
                 ]),
            make("IMO", "in my opinion",
                 "私の意見では",
                 useCases: ["チャットで意見を述べる略語"],
                 examples: [
                    ("IMO, it's overrated.", "個人的には過大評価。"),
                    ("IMO, you should go.", "個人的には行くべき。")
                 ]),
            make("BYOB", "Bring Your Own Beer/Beverage",
                 "飲み物は各自持参で",
                 useCases: ["パーティーの招待で飲み物持参を伝えるとき"],
                 examples: [
                    ("It's a BYOB party.", "飲み物持参パーティー。"),
                    ("BYOB tonight.", "今夜は飲み物持参で。")
                 ]),
            make("ASAP", "as soon as possible",
                 "できるだけ早く",
                 useCases: ["急ぎの対応を頼むとき"],
                 examples: [
                    ("Send it ASAP.", "至急送って。"),
                    ("I need it ASAP.", "急ぎで欲しい。")
                 ]),
            make("sus", "suspicious",
                 "怪しい",
                 useCases: ["ゲームAmong Us から流行ったスラング"],
                 examples: [
                    ("That's sus.", "それ怪しい。"),
                    ("He's acting sus.", "彼の動き怪しい。")
                 ]),
            make("no cap", "no lie; for real",
                 "嘘偽りなし・マジで",
                 useCases: ["強調・本気度を表すZ世代スラング"],
                 examples: [
                    ("No cap, it's the best.", "マジで最高。"),
                    ("That's true, no cap.", "ガチで本当。")
                 ]),
            make("period", "and that's final",
                 "以上・以下なし",
                 useCases: ["議論の余地なしと締めくくるとき"],
                 examples: [
                    ("She's the best, period.", "彼女が最高、以上。"),
                    ("That's the answer, period.", "それが答え、以上。")
                 ])
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
                 ]),
            make("bucks", "dollars",
                 "ドル",
                 useCases: ["カジュアルに金額を表すとき"],
                 examples: [
                    ("It's 5 bucks.", "5ドルだよ。"),
                    ("Got a few bucks?", "何ドルか持ってる?")
                 ]),
            make("grand", "one thousand dollars",
                 "1,000ドル",
                 useCases: ["1000ドル単位で話すとき"],
                 examples: [
                    ("It cost two grand.", "2,000ドルした。"),
                    ("A grand a month.", "月1000ドル。")
                 ]),
            make("chicken", "a coward",
                 "臆病者・チキン",
                 useCases: ["勇気のない人をからかうとき(名詞)"],
                 examples: [
                    ("Don't be a chicken.", "ビビるなよ。"),
                    ("You're such a chicken!", "ほんとチキンだな!")
                 ]),
            make("couch potato", "a lazy TV watcher",
                 "ソファでゴロゴロしてる人",
                 useCases: ["怠惰なテレビ漬けの人を表すとき"],
                 examples: [
                    ("Total couch potato.", "完全なゴロ寝族。"),
                    ("Don't be a couch potato.", "ソファ漬けやめて。")
                 ]),
            make("rip-off", "an overpriced product",
                 "ぼったくり",
                 useCases: ["価格が不当に高いと感じたとき"],
                 examples: [
                    ("What a rip-off!", "ぼったくり!"),
                    ("Total rip-off.", "完全にぼったくり。")
                 ]),
            make("dumpster fire", "a complete disaster",
                 "大惨事・めちゃくちゃな状況",
                 useCases: ["手のつけられない状況を表すとき"],
                 examples: [
                    ("This project is a dumpster fire.", "このプロジェクトは大惨事。"),
                    ("Total dumpster fire.", "完全カオス。")
                 ]),
            make("kudos", "praise; well done",
                 "称賛・よくやった",
                 useCases: ["相手の功績を称えるとき"],
                 examples: [
                    ("Kudos to you!", "お見事!"),
                    ("Kudos for finishing.", "完走お見事。")
                 ]),
            make("I'm down", "I'm in / I'll join",
                 "乗った・行く行く",
                 useCases: ["誘いに快諾するとき"],
                 examples: [
                    ("I'm down for pizza.", "ピザ乗った。"),
                    ("I'm down!", "行く!")
                 ]),
            make("it sucks", "it's terrible",
                 "最悪・がっかり",
                 useCases: ["不満や失望を表すとき"],
                 examples: [
                    ("This sucks.", "最悪。"),
                    ("It sucks, but oh well.", "残念だけど仕方ない。")
                 ])
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
                 ]),
            make("high-key", "openly; obviously",
                 "明らかに・堂々と",
                 useCases: ["低キーの反対、はっきり表すとき"],
                 examples: [
                    ("High-key obsessed.", "明らかにハマってる。"),
                    ("I high-key want this.", "ガチで欲しい。")
                 ]),
            make("flex", "show off",
                 "自慢する・見せびらかす",
                 useCases: ["自分の物や能力を誇示するとき"],
                 examples: [
                    ("Stop flexing.", "自慢やめて。"),
                    ("Weird flex but OK.", "変な自慢だけどまあいいや。")
                 ]),
            make("chillax", "chill out and relax",
                 "落ち着いてリラックスする",
                 useCases: ["chill と relax の混成語、肩の力を抜くとき"],
                 examples: [
                    ("Just chillax!", "落ち着いて!"),
                    ("Chillax, dude.", "リラックスしろよ。")
                 ]),
            make("get a life", "find better things to do",
                 "自分の心配しなよ",
                 useCases: ["余計なお世話への返しなどに使う皮肉"],
                 examples: [
                    ("Get a life!", "大きなお世話!"),
                    ("Seriously, get a life.", "マジで自分の心配しろ。")
                 ]),
            make("shrug", "raise the shoulders to show indifference",
                 "肩をすくめる",
                 useCases: ["「さあね」のジェスチャーや無関心を表すとき"],
                 examples: [
                    ("He just shrugged.", "彼は肩をすくめただけ。"),
                    ("Shrug. Whatever.", "肩すくめ。まあいいや。")
                 ]),
            make("Zzz", "sleeping; sleepy",
                 "眠い・寝ている",
                 useCases: ["眠気や退屈を表す絵文字的表現"],
                 examples: [
                    ("Zzz...", "眠い…"),
                    ("This class is so Zzz.", "この授業眠すぎ。")
                 ]),
            make("hit the gym", "go to the gym",
                 "ジムに行く",
                 useCases: ["運動の予定を伝えるカジュアル表現"],
                 examples: [
                    ("Time to hit the gym.", "ジムの時間。"),
                    ("Let's hit the gym.", "ジム行こう。")
                 ]),
            make("grab a coffee", "go to get a coffee together",
                 "コーヒー飲みに行く",
                 useCases: ["軽い会合や息抜きを誘うとき"],
                 examples: [
                    ("Wanna grab a coffee?", "コーヒーでもどう?"),
                    ("Let's grab a coffee.", "コーヒー行こう。")
                 ]),
            make("rip", "rest in peace; over",
                 "ご冥福を・終わった",
                 useCases: ["カジュアルに「終わった・残念」を表すとき(R.I.P.)"],
                 examples: [
                    ("RIP my phone battery.", "スマホ電池終了。"),
                    ("Rip, that's sad.", "うわ、残念。")
                 ]),
            make("out of nowhere", "suddenly without warning",
                 "突然・どこからともなく",
                 useCases: ["予期せぬ出来事の登場を表すとき"],
                 examples: [
                    ("He appeared out of nowhere.", "彼が突然現れた。"),
                    ("Came out of nowhere.", "どこからともなく来た。")
                 ])
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
                 ]),
            make("behind the scenes", "out of public view",
                 "舞台裏で・水面下で",
                 useCases: ["表に出ない部分や裏の動きを表すとき"],
                 examples: [
                    ("A lot happens behind the scenes.", "舞台裏で色々起きてる。"),
                    ("Behind-the-scenes footage.", "舞台裏映像。")
                 ]),
            make("in parallel", "simultaneously",
                 "並行して・同時に",
                 useCases: ["複数の作業を同時進行させるとき"],
                 examples: [
                    ("Run two tasks in parallel.", "2つを並行して実行。"),
                    ("Working in parallel.", "並行作業中。")
                 ]),
            make("deep dive", "thorough investigation",
                 "深掘り・徹底調査",
                 useCases: ["特定のテーマを詳しく掘り下げるとき"],
                 examples: [
                    ("Let's do a deep dive.", "深掘りしよう。"),
                    ("A deep dive into the data.", "データの徹底分析。")
                 ]),
            make("take action", "act on something",
                 "行動を起こす",
                 useCases: ["決意して行動に移すよう促すとき"],
                 examples: [
                    ("Time to take action.", "行動の時。"),
                    ("Take action now.", "今行動しよう。")
                 ]),
            make("stay tuned", "wait for more information",
                 "乞うご期待・続報を待て",
                 useCases: ["後で続報があると伝えるとき"],
                 examples: [
                    ("Stay tuned for updates.", "続報をお待ちください。"),
                    ("More to come — stay tuned!", "続きあり、お楽しみに!")
                 ]),
            make("keep in the loop", "keep someone informed",
                 "(話の輪に)入れておく",
                 useCases: ["情報共有を続けるよう頼むとき"],
                 examples: [
                    ("Keep me in the loop.", "私にも共有して。"),
                    ("Always keeping us in the loop.", "いつも輪に入れてくれる。")
                 ]),
            make("loop", "communication chain",
                 "話の輪・連絡網",
                 useCases: ["情報共有のチェーンや繰り返しを表すとき"],
                 examples: [
                    ("Out of the loop.", "話に入れていない。"),
                    ("Stuck in a loop.", "ループにハマってる。")
                 ]),
            make("ship it", "release a product",
                 "(商品を)世に出す・リリースする",
                 useCases: ["開発したものを公開するとき(IT・スタートアップ用語)"],
                 examples: [
                    ("Let's ship it!", "リリースしよう!"),
                    ("Ship it Friday.", "金曜リリース。")
                 ]),
            make("next level", "a much higher standard",
                 "ワンランク上・次元が違う",
                 useCases: ["飛び抜けた品質や性能を表すとき"],
                 examples: [
                    ("That's next level.", "別次元。"),
                    ("Take it to the next level.", "次のレベルへ。")
                 ])
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
                 ]),
            make("cry more", "stop complaining",
                 "もっと泣け(嘲り)",
                 useCases: ["不満を訴える相手を皮肉るネットスラング"],
                 examples: [
                    ("Cry more, noob.", "もっと泣け、雑魚。"),
                    ("Lol, cry more.", "草、もっと泣け。")
                 ]),
            make("clown", "a foolish person",
                 "道化・バカ",
                 useCases: ["愚かな行動をした人を皮肉るとき"],
                 examples: [
                    ("Don't be a clown.", "バカやるな。"),
                    ("Total clown.", "完全な道化。")
                 ]),
            make("shitposting", "deliberately low-quality online posting",
                 "煽り・ふざけた投稿(俗)",
                 useCases: ["わざとくだらない投稿をすること"],
                 examples: [
                    ("Stop shitposting.", "煽り投稿やめろ。"),
                    ("Pure shitposting.", "完全に煽り。")
                 ]),
            make("troll", "online provocateur",
                 "荒らし・煽る人",
                 useCases: ["ネットで挑発する人を表すとき"],
                 examples: [
                    ("Don't feed the trolls.", "荒らしに餌を与えるな。"),
                    ("He's just trolling.", "ただ煽ってるだけ。")
                 ]),
            make("hardcore", "extremely intense or devoted",
                 "ガチ・本格派",
                 useCases: ["熱中度や強度が高いものを表すとき"],
                 examples: [
                    ("Hardcore fan.", "ガチファン。"),
                    ("That's hardcore.", "ガチだな。")
                 ]),
            make("corrupt", "morally depraved or dishonest",
                 "腐敗した・汚職にまみれた",
                 useCases: ["政治家や組織の不正を批判するとき"],
                 examples: [
                    ("Corrupt politicians.", "腐敗政治家。"),
                    ("A corrupt system.", "腐敗したシステム。")
                 ]),
            make("hypocrisy", "claiming morals one doesn't have",
                 "偽善",
                 useCases: ["言行不一致を批判するとき"],
                 examples: [
                    ("That's pure hypocrisy.", "完全に偽善。"),
                    ("Call out the hypocrisy.", "偽善を指摘する。")
                 ]),
            make("double standard", "applying different rules unfairly",
                 "二重基準・ダブスタ",
                 useCases: ["相手と自分で基準を変えていることを批判するとき"],
                 examples: [
                    ("That's a double standard.", "それダブスタ。"),
                    ("Stop the double standard.", "二重基準やめて。")
                 ]),
            make("propaganda", "biased information for influence",
                 "プロパガンダ・世論誘導",
                 useCases: ["政府や組織の意図的な宣伝を批判するとき"],
                 examples: [
                    ("Pure propaganda.", "ただのプロパガンダ。"),
                    ("Spreading propaganda.", "プロパガンダを広める。")
                 ])
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
                 ]),
            make("endgame", "final stage",
                 "最終局面・大詰め",
                 useCases: ["勝負や計画の最終段階を表すとき"],
                 examples: [
                    ("This is the endgame.", "ここが大詰め。"),
                    ("What's the endgame?", "最終目標は?")
                 ]),
            make("game over", "it's all done",
                 "終わりだ・詰んだ",
                 useCases: ["勝ち目がない状況を宣言するとき"],
                 examples: [
                    ("Game over, man.", "もう詰みだよ。"),
                    ("If they find out, game over.", "バレたら終わり。")
                 ]),
            make("zero chance", "no possibility at all",
                 "可能性ゼロ",
                 useCases: ["完全否定や絶望的状況を強調するとき"],
                 examples: [
                    ("Zero chance of winning.", "勝ち目ゼロ。"),
                    ("Zero chance, period.", "可能性ゼロ、以上。")
                 ]),
            make("exponential", "growing at increasing rate",
                 "指数関数的な",
                 useCases: ["急成長を表すとき(AIや技術)"],
                 examples: [
                    ("Exponential growth.", "指数関数的成長。"),
                    ("AI is improving exponentially.", "AIは指数関数的に進化中。")
                 ]),
            make("taxpayer", "a person who pays taxes",
                 "納税者",
                 useCases: ["税金で運営されることや市民の負担を語るとき"],
                 examples: [
                    ("Taxpayer money.", "税金。"),
                    ("Hardworking taxpayers.", "勤勉な納税者。")
                 ]),
            make("in the red", "operating at a loss",
                 "赤字で",
                 useCases: ["経営や家計の赤字を表すとき"],
                 examples: [
                    ("We're in the red.", "うちは赤字。"),
                    ("The company is in the red.", "会社は赤字。")
                 ]),
            make("deficit", "a shortfall in revenue or amount",
                 "不足・赤字",
                 useCases: ["経済や予算の赤字、不足を表すとき"],
                 examples: [
                    ("Budget deficit.", "予算赤字。"),
                    ("Calorie deficit.", "カロリー不足(ダイエット用語)。")
                 ]),
            make("margin", "the edge or profit difference",
                 "利益率・余白",
                 useCases: ["利益・余地・差を表すとき"],
                 examples: [
                    ("Profit margin.", "利益率。"),
                    ("Won by a small margin.", "僅差で勝利。")
                 ]),
            make("lucrative", "highly profitable",
                 "儲かる・割のいい",
                 useCases: ["事業・契約が大きな利益をもたらすとき"],
                 examples: [
                    ("A lucrative business.", "儲かるビジネス。"),
                    ("Lucrative deal.", "おいしい契約。")
                 ])
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
                 ]),
            make("concerning", "worrying; troubling",
                 "気がかりな・懸念される",
                 useCases: ["心配すべき状況を表すとき"],
                 examples: [
                    ("That's concerning.", "それは気がかり。"),
                    ("Deeply concerning data.", "深刻なデータ。")
                 ]),
            make("principle", "a fundamental rule or belief",
                 "原則・信念",
                 useCases: ["基本ルールや信条を表すとき"],
                 examples: [
                    ("On principle.", "原則として。"),
                    ("It's a matter of principle.", "信念の問題。")
                 ]),
            make("subtle", "delicately complex; not obvious",
                 "微妙な・繊細な",
                 useCases: ["はっきりせず気づきにくい違いを表すとき"],
                 examples: [
                    ("Subtle difference.", "微妙な違い。"),
                    ("A subtle hint.", "それとなくほのめかす。")
                 ]),
            make("compelling", "evoking strong interest",
                 "説得力のある・引き込まれる",
                 useCases: ["強く引きつけられる議論や物語を表すとき"],
                 examples: [
                    ("A compelling argument.", "説得力のある主張。"),
                    ("Compelling evidence.", "有力な証拠。")
                 ]),
            make("resilient", "able to recover quickly",
                 "回復力のある・しなやかな",
                 useCases: ["困難に強い人や組織を表すとき"],
                 examples: [
                    ("She's so resilient.", "彼女は本当にタフ。"),
                    ("A resilient economy.", "強靭な経済。")
                 ]),
            make("ridiculous", "absurd; unreasonable",
                 "ばかげた・あり得ない",
                 useCases: ["呆れた状況や物事を批判するとき"],
                 examples: [
                    ("That's ridiculous.", "あり得ない。"),
                    ("Ridiculously expensive.", "バカ高い。")
                 ]),
            make("inevitable", "unavoidable",
                 "避けられない・必然の",
                 useCases: ["どうしても起こることを表すとき"],
                 examples: [
                    ("Change is inevitable.", "変化は必然。"),
                    ("It was inevitable.", "避けられなかった。")
                 ]),
            make("candid", "truthful and straightforward",
                 "率直な・包み隠さない",
                 useCases: ["遠慮せず本音で話すことを表すとき"],
                 examples: [
                    ("Be candid with me.", "正直に言って。"),
                    ("A candid conversation.", "率直な対話。")
                 ]),
            make("frank", "open and sincere",
                 "率直な・遠慮のない",
                 useCases: ["遠回しでない直接的な発言を表すとき"],
                 examples: [
                    ("To be frank, ~", "率直に言うと〜"),
                    ("Frank discussion.", "率直な議論。")
                 ]),
            make("eccentric", "unconventional and strange",
                 "風変わりな・型破りな",
                 useCases: ["変わった性格や行動を表すとき"],
                 examples: [
                    ("An eccentric artist.", "型破りな芸術家。"),
                    ("Quite eccentric.", "かなり風変わり。")
                 ])
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
                 ]),
            make("stumble upon", "find by chance",
                 "偶然見つける",
                 useCases: ["探していなかったものを偶然発見するとき"],
                 examples: [
                    ("I stumbled upon a great book.", "良い本に偶然出会った。"),
                    ("Stumbled upon the truth.", "真実に偶然たどり着いた。")
                 ]),
            make("pass through", "go through a place briefly",
                 "通過する・通り抜ける",
                 useCases: ["短時間だけ立ち寄る・通るとき"],
                 examples: [
                    ("Just passing through.", "通り過ぎるだけ。"),
                    ("Pass through customs.", "税関を通過。")
                 ]),
            make("migrate", "move from one place to another",
                 "移住する・(データを)移行する",
                 useCases: ["人・動物・データの移動を表すとき"],
                 examples: [
                    ("Birds migrate south.", "鳥が南へ渡る。"),
                    ("Migrate to a new system.", "新システムへ移行。")
                 ]),
            make("advocate", "publicly support a cause",
                 "提唱する・支持する",
                 useCases: ["主義主張を擁護・推進するとき"],
                 examples: [
                    ("Advocate for change.", "変化を提唱する。"),
                    ("A strong advocate.", "強力な支持者。")
                 ]),
            make("turn a blind eye", "ignore wrongdoing deliberately",
                 "見て見ぬふりをする",
                 useCases: ["不正を意図的に無視するとき"],
                 examples: [
                    ("Turn a blind eye to it.", "見て見ぬふりする。"),
                    ("Don't turn a blind eye.", "見過ごさないで。")
                 ]),
            make("pave the way", "make progress possible",
                 "道を開く",
                 useCases: ["後続のために土台を作るとき"],
                 examples: [
                    ("Pave the way for reform.", "改革への道を開く。"),
                    ("She paved the way.", "彼女が道を切り開いた。")
                 ]),
            make("bite your tongue", "stop yourself from speaking",
                 "言葉を飲み込む",
                 useCases: ["言いたいことを我慢するとき"],
                 examples: [
                    ("Bite your tongue!", "言葉を慎め!"),
                    ("Had to bite my tongue.", "言いたいの我慢した。")
                 ]),
            make("sit tight", "wait patiently",
                 "じっと待つ",
                 useCases: ["動かずに様子を見るよう促すとき"],
                 examples: [
                    ("Just sit tight.", "じっとしてて。"),
                    ("Sit tight, help is coming.", "待ってて、助けが来る。")
                 ]),
            make("hit the nail on the head", "be exactly right",
                 "核心を突く",
                 useCases: ["まさにその通りのことを言い当てたとき"],
                 examples: [
                    ("You hit the nail on the head.", "まさにその通り。"),
                    ("That hits the nail on the head.", "図星。")
                 ])
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
                 ]),
            make("injury", "physical damage to the body",
                 "けが",
                 useCases: ["身体的な負傷を表すとき"],
                 examples: [
                    ("A serious injury.", "重傷。"),
                    ("Recovering from an injury.", "けがから回復中。")
                 ]),
            make("skeleton", "the bony frame; a skeleton crew",
                 "骸骨・骨組み・最小限",
                 useCases: ["骨組みや最小限の構成を表すとき"],
                 examples: [
                    ("A skeleton crew.", "最小限のスタッフ。"),
                    ("Skeleton in the closet.", "隠された秘密(慣用)。")
                 ]),
            make("once in a blue moon", "very rarely",
                 "ごくまれに・めったに〜ない",
                 useCases: ["非常に珍しい出来事を表すとき"],
                 examples: [
                    ("I see him once in a blue moon.", "めったに会わない。"),
                    ("Once in a blue moon, ~", "ごくまれに〜")
                 ]),
            make("stagnant", "not flowing or changing",
                 "停滞した・よどんだ",
                 useCases: ["経済や水などが動かない状態を表すとき"],
                 examples: [
                    ("Stagnant economy.", "停滞する経済。"),
                    ("Stagnant water.", "よどんだ水。")
                 ]),
            make("touch and go", "uncertain; risky",
                 "予断を許さない",
                 useCases: ["どちらに転ぶか分からない緊迫した状況"],
                 examples: [
                    ("It's touch and go.", "予断を許さない。"),
                    ("Things were touch and go.", "ギリギリの状態だった。")
                 ]),
            make("pull strings", "use influence behind the scenes",
                 "コネを使う・裏で動く",
                 useCases: ["影響力を使って物事を動かすとき"],
                 examples: [
                    ("He pulled some strings.", "彼がコネを使った。"),
                    ("Pull strings to get in.", "コネで入る。")
                 ]),
            make("volatile", "liable to change rapidly",
                 "不安定な・変動の激しい",
                 useCases: ["市場や感情が荒れやすい状態を表すとき"],
                 examples: [
                    ("A volatile market.", "不安定な市場。"),
                    ("Volatile temper.", "短気。")
                 ]),
            make("spill", "let liquid fall out; reveal a secret",
                 "こぼす・(秘密を)漏らす",
                 useCases: ["液体をこぼす、または情報を漏らすとき"],
                 examples: [
                    ("Don't spill the coffee.", "コーヒーこぼさないで。"),
                    ("Spill the tea.", "秘密を漏らせ(俗)。")
                 ]),
            make("spoilage", "the process of going bad",
                 "腐敗・劣化",
                 useCases: ["食品などが傷んで使えなくなることを表すとき"],
                 examples: [
                    ("Food spoilage.", "食品の腐敗。"),
                    ("Reduce spoilage.", "劣化を減らす。")
                 ]),
            make("plausible", "seeming reasonable or probable",
                 "もっともらしい・あり得る",
                 useCases: ["説明や説が筋が通っていることを表すとき"],
                 examples: [
                    ("A plausible explanation.", "もっともらしい説明。"),
                    ("Sounds plausible.", "あり得そう。")
                 ]),
            make("unprecedented", "never done or seen before",
                 "前例のない・空前の",
                 useCases: ["史上初の出来事や規模を表すとき"],
                 examples: [
                    ("Unprecedented growth.", "空前の成長。"),
                    ("An unprecedented event.", "前例のない事態。")
                 ])
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
                 ]),
            make("get sth right", "do or understand correctly",
                 "正しく行う・正しく理解する",
                 useCases: ["正しい結果や認識にたどり着くとき"],
                 examples: [
                    ("Let me get this right.", "確認させて。"),
                    ("Got it right the first time.", "一発で正解。")
                 ]),
            make("at the end of", "by the end of a period",
                 "〜の終わりに",
                 useCases: ["期間や場所の終点を表すとき"],
                 examples: [
                    ("At the end of the day.", "結局のところ(慣用)。"),
                    ("At the end of the street.", "通りの突き当たり。")
                 ]),
            make("at the age of", "when one was a certain age",
                 "〜歳のときに",
                 useCases: ["年齢を指定して出来事を語るとき"],
                 examples: [
                    ("At the age of 18.", "18歳のときに。"),
                    ("Started college at the age of 20.", "20歳で大学を始めた。")
                 ]),
            make("for the most part", "mostly; generally",
                 "大部分は・概ね",
                 useCases: ["大筋を述べるときの控えめな断り"],
                 examples: [
                    ("For the most part, it works.", "大体は機能する。"),
                    ("True for the most part.", "概ねその通り。")
                 ]),
            make("slip my mind", "be forgotten",
                 "うっかり忘れる",
                 useCases: ["うっかり忘れたことを謝罪・説明するとき"],
                 examples: [
                    ("It slipped my mind.", "うっかり忘れてた。"),
                    ("Sorry, it just slipped my mind.", "ごめん、つい忘れた。")
                 ]),
            make("dwell on", "think about something for too long",
                 "くよくよ考える・こだわる",
                 useCases: ["過去の失敗などを引きずるとき"],
                 examples: [
                    ("Don't dwell on it.", "くよくよしないで。"),
                    ("Stop dwelling on the past.", "過去にこだわるな。")
                 ]),
            make("second-guess", "doubt or reconsider a decision",
                 "あとから疑う・推測し直す",
                 useCases: ["決断を後から疑うとき"],
                 examples: [
                    ("Don't second-guess yourself.", "自分を疑わないで。"),
                    ("I keep second-guessing my choices.", "選択を疑い続けてる。")
                 ]),
            make("go the extra mile", "make a special effort",
                 "ひと手間かける・特別に頑張る",
                 useCases: ["求められた以上の努力をするとき"],
                 examples: [
                    ("She always goes the extra mile.", "彼女はいつも余計に頑張る。"),
                    ("Go the extra mile for clients.", "顧客のために一歩踏み込む。")
                 ]),
            make("play it by ear", "decide as the situation develops",
                 "臨機応変にやる",
                 useCases: ["計画を立てず状況に合わせて判断するとき"],
                 examples: [
                    ("Let's play it by ear.", "成り行きでいこう。"),
                    ("We'll play it by ear.", "臨機応変にする。")
                 ])
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
                 ]),
            make("leverage", "use to maximum advantage",
                 "活用する・てこ入れする",
                 useCases: ["持っている資源を有効活用するとき"],
                 examples: [
                    ("Leverage your skills.", "スキルを活用して。"),
                    ("Leverage social media.", "SNSを活用する。")
                 ]),
            make("optimize", "make as effective as possible",
                 "最適化する",
                 useCases: ["効率や性能を最大化するとき"],
                 examples: [
                    ("Optimize for speed.", "スピードを最適化。"),
                    ("Optimize the process.", "プロセスを最適化する。")
                 ]),
            make("elaborate", "explain in more detail",
                 "詳しく説明する",
                 useCases: ["相手にもっと詳細を求めるとき"],
                 examples: [
                    ("Could you elaborate?", "詳しく説明してくれる?"),
                    ("Let me elaborate.", "もう少し詳しく言うと。")
                 ]),
            make("implement", "put into effect",
                 "実施する・導入する",
                 useCases: ["計画や方針を実行に移すとき"],
                 examples: [
                    ("Implement the new policy.", "新方針を導入する。"),
                    ("Fully implemented.", "完全に実装済み。")
                 ]),
            make("facilitate", "make easier to do",
                 "促進する・容易にする",
                 useCases: ["プロセスや議論をスムーズにするとき"],
                 examples: [
                    ("Facilitate the discussion.", "議論を促進する。"),
                    ("Tools that facilitate learning.", "学習を促進するツール。")
                 ]),
            make("see eye to eye", "agree completely",
                 "意見が完全に一致する",
                 useCases: ["主に否定形で意見の食い違いを表現するとき"],
                 examples: [
                    ("We don't see eye to eye.", "意見が合わない。"),
                    ("We see eye to eye on this.", "この件は意見が一致。")
                 ]),
            make("output", "the amount produced",
                 "生産量・出力",
                 useCases: ["生産・処理の結果を表すとき"],
                 examples: [
                    ("Increase output.", "生産量を上げる。"),
                    ("High-quality output.", "高品質な出力。")
                 ]),
            make("consistency", "the quality of being stable",
                 "一貫性・継続性",
                 useCases: ["習慣やブランドの安定感を語るとき"],
                 examples: [
                    ("Consistency is key.", "一貫性が鍵。"),
                    ("Lack of consistency.", "一貫性の欠如。")
                 ])
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
                 ]),
            make("mindset", "a person's mental attitude",
                 "心構え・物の見方",
                 useCases: ["考え方や姿勢を表すとき"],
                 examples: [
                    ("Growth mindset.", "成長マインドセット。"),
                    ("Change your mindset.", "考え方を変えて。")
                 ]),
            make("discipline", "self-control; a field of study",
                 "規律・自己鍛錬・専門分野",
                 useCases: ["継続的な努力や学問領域を表すとき"],
                 examples: [
                    ("Self-discipline is key.", "自己鍛錬が鍵。"),
                    ("A different discipline.", "別の分野。")
                 ]),
            make("by memory", "without notes or aid",
                 "記憶で・暗記で",
                 useCases: ["何も見ずに思い出して言うとき"],
                 examples: [
                    ("I know it by memory.", "暗記してる。"),
                    ("Recite by memory.", "暗唱する。")
                 ]),
            make("take it for granted", "assume without appreciation",
                 "当たり前と思う",
                 useCases: ["感謝を忘れて当然視するとき"],
                 examples: [
                    ("Don't take it for granted.", "当たり前と思わないで。"),
                    ("We take freedom for granted.", "自由を当然視してる。")
                 ]),
            make("grant", "give formally; allow",
                 "授ける・与える・認める",
                 useCases: ["公式に許可・助成・付与するとき"],
                 examples: [
                    ("Grant permission.", "許可を与える。"),
                    ("Research grant.", "研究助成金。")
                 ]),
            make("cut corners", "do something cheaply or quickly",
                 "手抜きする・近道する",
                 useCases: ["手間や費用を省いて雑にやるとき"],
                 examples: [
                    ("Don't cut corners.", "手抜きしないで。"),
                    ("They cut corners on safety.", "安全面で手を抜いた。")
                 ]),
            make("under the weather", "feeling slightly ill",
                 "体調が悪い",
                 useCases: ["軽い不調を婉曲的に伝えるとき"],
                 examples: [
                    ("I'm feeling under the weather.", "ちょっと体調が悪い。"),
                    ("A bit under the weather today.", "今日は少し調子が悪い。")
                 ]),
            make("read between the lines", "find hidden meaning",
                 "行間を読む",
                 useCases: ["言外の意味を察するとき"],
                 examples: [
                    ("Read between the lines.", "行間を読んで。"),
                    ("If you read between the lines, ~", "行間を読めば〜")
                 ])
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
                 ]),
            make("correct", "right; free from error",
                 "正しい・訂正する",
                 useCases: ["事実や答えが合っていることを表すとき"],
                 examples: [
                    ("That's correct.", "正解。"),
                    ("Please correct me.", "訂正してください。")
                 ]),
            make("as a matter of fact", "in actuality",
                 "実は・実際のところ",
                 useCases: ["相手の予想に反する情報を伝えるとき"],
                 examples: [
                    ("As a matter of fact, I do know him.", "実は彼を知ってる。"),
                    ("As a matter of fact, you're right.", "実際、君は正しい。")
                 ]),
            make("in that sense", "from that perspective",
                 "その意味では",
                 useCases: ["特定の観点に絞って述べるとき"],
                 examples: [
                    ("In that sense, yes.", "その意味ではイエス。"),
                    ("In that sense, we agree.", "その意味では一致。")
                 ]),
            make("for instance", "for example",
                 "例えば",
                 useCases: ["具体例を挙げるとき"],
                 examples: [
                    ("For instance, take Japan.", "例えば日本を考えてみよう。"),
                    ("Many cities, for instance Tokyo.", "多くの都市、例えば東京。")
                 ]),
            make("technically", "strictly according to facts",
                 "厳密には・テクニカルに言うと",
                 useCases: ["細かい事実関係を強調するとき"],
                 examples: [
                    ("Technically, that's true.", "厳密にはそれは正しい。"),
                    ("Technically, you're right.", "技術的には合ってる。")
                 ]),
            make("literally", "in a literal sense; actually",
                 "文字通り・マジで",
                 useCases: ["強調する時の口語(本来の意味と俗な強調の両方)"],
                 examples: [
                    ("I literally cried.", "マジで泣いた。"),
                    ("Literally everyone.", "文字通り全員。")
                 ]),
            make("my understanding is that", "I believe / I assume that",
                 "私の理解では〜だ",
                 useCases: ["自分の理解を慎重に提示するとき"],
                 examples: [
                    ("My understanding is that we agreed.", "私の理解では合意したと。"),
                    ("My understanding is that it starts at 9.", "9時開始と理解している。")
                 ]),
            make("good to know", "thanks for the information",
                 "知れてよかった・参考になる",
                 useCases: ["情報を受け取ったときのリアクション"],
                 examples: [
                    ("Good to know!", "それはいい情報。"),
                    ("Good to know, thanks!", "知れてよかった、ありがとう!")
                 ]),
            make("how does that sound", "what do you think of that",
                 "それでどうかな・どう思う?",
                 useCases: ["提案の感触を尋ねるとき"],
                 examples: [
                    ("Friday at 3 — how does that sound?", "金曜3時、どう?"),
                    ("How does that sound to you?", "それで君はどう思う?")
                 ])
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
                 ]),
            make("prioritize", "treat as more important",
                 "優先する",
                 useCases: ["何かを他より優先順位を上げるとき"],
                 examples: [
                    ("Prioritize your health.", "健康を優先して。"),
                    ("Let's prioritize this task.", "このタスクを優先しよう。")
                 ]),
            make("up to", "depending on; until; capable of",
                 "〜次第・〜まで・〜にかかっている",
                 useCases: ["責任・限度・進行中の活動を表すとき"],
                 examples: [
                    ("It's up to you.", "あなた次第。"),
                    ("What are you up to?", "何してるの?")
                 ]),
            make("demanding", "requiring much effort",
                 "要求の多い・大変な",
                 useCases: ["仕事や人が手のかかる状態を表すとき"],
                 examples: [
                    ("A demanding job.", "厳しい仕事。"),
                    ("She's very demanding.", "彼女は要求が多い。")
                 ]),
            make("solid", "reliable; well-built; impressive",
                 "しっかりした・確かな・最高の",
                 useCases: ["信頼性や完成度を称えるとき"],
                 examples: [
                    ("A solid plan.", "しっかりした計画。"),
                    ("Solid work!", "いい仕事!")
                 ]),
            make("sustainable", "able to be maintained",
                 "持続可能な",
                 useCases: ["環境・経営・習慣が長続きすることを表すとき"],
                 examples: [
                    ("Sustainable energy.", "持続可能なエネルギー。"),
                    ("Not sustainable.", "持続できない。")
                 ]),
            make("let sth go", "stop holding on to",
                 "(物事を)手放す・忘れる",
                 useCases: ["執着を手放したり許したりするとき"],
                 examples: [
                    ("Let it go.", "もう忘れて。"),
                    ("Hard to let it go.", "手放すのが難しい。")
                 ]),
            make("native", "born in a place; one's first language",
                 "ネイティブの・生まれつきの",
                 useCases: ["出身や母語を表すとき"],
                 examples: [
                    ("Native speaker.", "ネイティブスピーカー。"),
                    ("Native to Japan.", "日本原産。")
                 ])
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
                 ]),
            make("interchangeable", "able to be used in place of each other",
                 "交換可能な・互いに置き換えられる",
                 useCases: ["2つの語や物が同じように使えるとき"],
                 examples: [
                    ("These words are interchangeable.", "これらの語は置き換え可能。"),
                    ("Interchangeable parts.", "互換性のある部品。")
                 ]),
            make("pros and cons", "arguments for and against",
                 "長所と短所",
                 useCases: ["判断のため両面を比較するとき"],
                 examples: [
                    ("Weigh the pros and cons.", "長所と短所を比較する。"),
                    ("List the pros and cons.", "メリットとデメリットを列挙。")
                 ]),
            make("make a difference", "have a significant effect",
                 "違いを生む・影響を与える",
                 useCases: ["行動が結果に影響することを強調するとき"],
                 examples: [
                    ("You can make a difference.", "あなたが変えられる。"),
                    ("It really made a difference.", "本当に違いを生んだ。")
                 ]),
            make("haven't thought about", "haven't considered",
                 "考えてもみなかった",
                 useCases: ["想定外の話題について考えたことがないと答えるとき"],
                 examples: [
                    ("I haven't thought about it.", "考えたことなかった。"),
                    ("Haven't thought about that yet.", "まだ考えてない。")
                 ])
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
                 ]),
            make("green flag", "a positive sign in a relationship",
                 "好材料・好印象のサイン",
                 useCases: ["red flag(危険信号)の反対、良い兆候を表すとき"],
                 examples: [
                    ("Big green flag!", "完全に好印象!"),
                    ("That's a green flag.", "それは良いサイン。")
                 ]),
            make("goosebumps", "raised bumps on skin from emotion",
                 "鳥肌",
                 useCases: ["感動や恐怖などで肌が反応した時"],
                 examples: [
                    ("I got goosebumps.", "鳥肌立った。"),
                    ("Pure goosebumps moment.", "完全に鳥肌もの。")
                 ]),
            make("ick", "a sudden feeling of repulsion",
                 "急に冷める感じ・キモい瞬間",
                 useCases: ["デート相手などに急に幻滅したときのZ世代スラング"],
                 examples: [
                    ("That gave me the ick.", "それで一気に冷めた。"),
                    ("Major ick.", "完全にキモい。")
                 ]),
            make("soulmate", "a perfectly compatible partner",
                 "ソウルメイト・運命の人",
                 useCases: ["心から通じ合える相手を表すとき"],
                 examples: [
                    ("She's my soulmate.", "彼女は運命の人。"),
                    ("Looking for a soulmate.", "ソウルメイトを探してる。")
                 ]),
            make("brainrot", "low-quality content that dulls thinking",
                 "脳を腐らせるコンテンツ",
                 useCases: ["中毒性の低俗ネットコンテンツを表すZ世代用語"],
                 examples: [
                    ("Pure brainrot.", "完全に脳が腐る。"),
                    ("Stop watching brainrot.", "脳腐りコンテンツを見るのやめて。")
                 ]),
            make("nerd", "an enthusiast or studious person",
                 "オタク・勉強好き",
                 useCases: ["特定分野に熱中する人を表すとき(時に親愛・時に揶揄)"],
                 examples: [
                    ("Total nerd.", "完全にオタク。"),
                    ("Math nerd.", "数学オタク。")
                 ]),
            make("point of view", "a particular perspective",
                 "視点・観点",
                 useCases: ["意見や見方の角度を述べるとき"],
                 examples: [
                    ("From my point of view, ~", "私の視点では〜"),
                    ("Different point of view.", "別の視点。")
                 ])
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
                 ]),
            make("dip", "a small drop in price or quantity",
                 "値下がり・浸ける",
                 useCases: ["株価や数値の一時的低下、または食べ物を浸す動作"],
                 examples: [
                    ("Buy the dip.", "値下がりで買え(投資用語)。"),
                    ("Dip it in sauce.", "ソースに浸して。")
                 ]),
            make("legacy media", "traditional news outlets",
                 "既存大手メディア",
                 useCases: ["新興ネットメディアと対比して旧来のテレビ・新聞を指すとき"],
                 examples: [
                    ("Don't trust legacy media.", "既存メディアを信じるな。"),
                    ("Legacy media is dying.", "オールドメディアは終わりつつある。")
                 ]),
            make("free speech", "freedom of expression",
                 "言論の自由",
                 useCases: ["表現や発言の自由を語るとき"],
                 examples: [
                    ("Defend free speech.", "言論の自由を守れ。"),
                    ("Free speech matters.", "言論の自由は大事。")
                 ]),
            make("whip", "a fast strike or stir vigorously",
                 "鞭打つ・素早く混ぜる・(政党の)党鞭",
                 useCases: ["強く叩く・かき混ぜる動作、また政治の党議拘束役"],
                 examples: [
                    ("Whip the cream.", "クリームを泡立てる。"),
                    ("Party whip.", "党の党鞭(議員)。")
                 ]),
            make("blind", "unable to see; lacking perception",
                 "盲目の・見えない",
                 useCases: ["視覚障害、または比喩で偏った見方を表すとき"],
                 examples: [
                    ("Color blind.", "色盲。"),
                    ("Blind to the truth.", "真実に対して盲目。")
                 ]),
            make("spotlight", "intense focus or attention",
                 "脚光・スポットライト",
                 useCases: ["注目を浴びている状態を表すとき"],
                 examples: [
                    ("In the spotlight.", "脚光を浴びて。"),
                    ("Shine a spotlight on the issue.", "問題に光を当てる。")
                 ]),
            make("insulate", "protect from heat, cold, or impact",
                 "断熱する・隔離する",
                 useCases: ["熱・寒さ・影響などから守るとき"],
                 examples: [
                    ("Insulate the house.", "家を断熱する。"),
                    ("Insulated from criticism.", "批判から守られている。")
                 ])
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
                 ]),
            make("a big fan of", "really enjoy or admire",
                 "〜の大ファン",
                 useCases: ["強い好みや支持を表すとき"],
                 examples: [
                    ("I'm a big fan of jazz.", "ジャズの大ファン。"),
                    ("Not a big fan of horror.", "ホラーはあまり好きじゃない。")
                 ]),
            make("strongly believe", "have a firm conviction",
                 "強く信じる",
                 useCases: ["意見や信念を断固として表明するとき"],
                 examples: [
                    ("I strongly believe in this.", "これを強く信じている。"),
                    ("We strongly believe it works.", "うまくいくと強く信じている。")
                 ]),
            make("couldn't agree more", "completely agree",
                 "全く同感",
                 useCases: ["相手の意見に100%賛同するとき"],
                 examples: [
                    ("I couldn't agree more.", "全く同感。"),
                    ("Couldn't agree more on that.", "それは完全に同意。")
                 ]),
            make("valid", "well-founded; reasonable",
                 "妥当な・正当な",
                 useCases: ["意見や懸念がもっともだと認めるとき"],
                 examples: [
                    ("That's a valid point.", "それは妥当な意見。"),
                    ("Your feelings are valid.", "君の気持ちは正当。")
                 ]),
            make("be with you on sth", "agree with you about",
                 "(その件で)君に同意する",
                 useCases: ["相手の意見に共感を示すとき"],
                 examples: [
                    ("I'm with you on that.", "それに関しては同意。"),
                    ("Totally with you on this.", "それなら完全に賛成。")
                 ]),
            make("that figures", "that makes sense",
                 "やっぱりね・そうだろうな",
                 useCases: ["予想通りの結果に対する反応"],
                 examples: [
                    ("That figures!", "やっぱりね!"),
                    ("Late again? That figures.", "また遅刻?だろうね。")
                 ]),
            make("can relate to", "be able to identify with",
                 "共感できる・同じ経験がある",
                 useCases: ["他人の状況や気持ちに共感するとき"],
                 examples: [
                    ("I can relate to that.", "それ分かるわ。"),
                    ("Can totally relate.", "めっちゃ共感。")
                 ]),
            make("moving forward", "from now on",
                 "今後は・これから",
                 useCases: ["今後の方針を述べる時のビジネス表現"],
                 examples: [
                    ("Moving forward, we'll be more careful.", "今後は気をつけます。"),
                    ("Moving forward with the plan.", "計画を進めていく。")
                 ]),
            make("before I forget", "while it's still on my mind",
                 "忘れないうちに",
                 useCases: ["重要なことを思い出して伝えるとき"],
                 examples: [
                    ("Before I forget, you owe me $10.", "忘れないうちに、10ドル貸してる。"),
                    ("Oh, before I forget, ~", "忘れないうちに〜")
                 ])
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
                 ]),
            make("term", "a word or expression for something specific",
                 "用語・言葉",
                 useCases: ["特定の言葉を話題にするとき"],
                 examples: [
                    ("Technical term.", "専門用語。"),
                    ("In simple terms, ~", "簡単に言うと〜")
                 ]),
            make("literally means", "the literal meaning is",
                 "文字通りの意味は〜",
                 useCases: ["語源や直訳を説明するとき"],
                 examples: [
                    ("'Karoshi' literally means death from overwork.", "「過労死」は文字通り働きすぎによる死を意味する。"),
                    ("It literally means 'cherry blossom'.", "文字通り「桜」を意味する。")
                 ]),
            make("master", "become highly skilled at",
                 "習得する・極める",
                 useCases: ["スキルや言語を完全に身につけるとき"],
                 examples: [
                    ("Master a new language.", "新しい言語を習得する。"),
                    ("Master the basics first.", "まず基礎を極めて。")
                 ]),
            make("differentiate", "distinguish between things",
                 "区別する・差別化する",
                 useCases: ["違いを明確にするとき"],
                 examples: [
                    ("Differentiate the two.", "2つを区別する。"),
                    ("Differentiate your brand.", "ブランドを差別化する。")
                 ]),
            make("tell apart", "distinguish between similar things",
                 "見分ける",
                 useCases: ["似たものの違いを見抜くとき"],
                 examples: [
                    ("I can't tell them apart.", "見分けがつかない。"),
                    ("Hard to tell apart.", "区別が難しい。")
                 ]),
            make("incorporate", "include as part of a whole",
                 "取り入れる・組み込む",
                 useCases: ["要素を全体に組み入れるとき"],
                 examples: [
                    ("Incorporate feedback.", "フィードバックを取り入れる。"),
                    ("Incorporate exercise into your day.", "日常に運動を組み込む。")
                 ]),
            make("focus", "concentrate attention",
                 "集中する・焦点",
                 useCases: ["注意を集中するときや、ある一点を強調するとき"],
                 examples: [
                    ("Focus on the goal.", "目標に集中。"),
                    ("My main focus is health.", "私の最大の焦点は健康。")
                 ]),
            make("track sth", "monitor or follow progress",
                 "追跡する・記録する",
                 useCases: ["進捗や数値を継続的に管理するとき"],
                 examples: [
                    ("Track your spending.", "支出を記録する。"),
                    ("Track the package.", "荷物を追跡する。")
                 ]),
            make("progress", "forward movement; improvement",
                 "進捗・進歩",
                 useCases: ["前進や成長を表すとき"],
                 examples: [
                    ("Making progress.", "進展してる。"),
                    ("Track your progress.", "進捗を記録する。")
                 ])
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
                 ]),
            make("step out", "leave briefly",
                 "ちょっと外す・出る",
                 useCases: ["短時間だけ場を離れるとき"],
                 examples: [
                    ("I need to step out for a sec.", "ちょっと席を外すね。"),
                    ("She stepped out for lunch.", "彼女は昼食に出てる。")
                 ]),
            make("set sth", "place or arrange something",
                 "設置する・設定する",
                 useCases: ["物を置く、設定する動作を表すとき"],
                 examples: [
                    ("Set the table.", "テーブルセッティング。"),
                    ("Set a goal.", "目標を設定。")
                 ]),
            make("recharge", "restore energy or power",
                 "充電する・元気を取り戻す",
                 useCases: ["電子機器の充電や、人がリフレッシュするとき"],
                 examples: [
                    ("Recharge my phone.", "スマホを充電する。"),
                    ("I need to recharge.", "リフレッシュが必要。")
                 ]),
            make("come across as", "give the impression of being",
                 "〜の印象を与える・〜のように見える",
                 useCases: ["人の振る舞いがどう映るかを語るとき"],
                 examples: [
                    ("He comes across as arrogant.", "彼は傲慢に見える。"),
                    ("She came across as friendly.", "彼女は親しみやすく見えた。")
                 ]),
            make("keep up", "maintain the pace or continue",
                 "ついていく・続ける",
                 useCases: ["相手や状況に遅れずに進むとき"],
                 examples: [
                    ("Keep up the good work!", "その調子で頑張って!"),
                    ("Can't keep up.", "ついていけない。")
                 ]),
            make("move on to", "shift to the next thing",
                 "(次の話題などに)進む",
                 useCases: ["別の話題やタスクに移るとき"],
                 examples: [
                    ("Let's move on to the next topic.", "次の話題に移ろう。"),
                    ("Moving on to step 2.", "ステップ2に進む。")
                 ]),
            make("vibrant", "full of energy and color",
                 "活気のある・鮮やかな",
                 useCases: ["街・色・雰囲気が生き生きしていることを表すとき"],
                 examples: [
                    ("A vibrant city.", "活気ある街。"),
                    ("Vibrant colors.", "鮮やかな色。")
                 ]),
            make("sophisticated", "refined; complex",
                 "洗練された・高度な",
                 useCases: ["品の良さや高度さを表すとき"],
                 examples: [
                    ("A sophisticated design.", "洗練されたデザイン。"),
                    ("Sophisticated taste.", "洗練された趣味。")
                 ]),
            make("break the ice", "ease initial awkwardness",
                 "場の緊張をほぐす",
                 useCases: ["初対面や気まずい場面で会話のきっかけを作るとき"],
                 examples: [
                    ("Break the ice with a joke.", "冗談で場を和ませる。"),
                    ("Who's going to break the ice?", "誰が口火を切る?")
                 ]),
            make("blink", "open and shut eyes quickly",
                 "まばたきする",
                 useCases: ["目をパチパチさせる動作、または瞬く間の比喩"],
                 examples: [
                    ("Don't blink.", "瞬きしないで。"),
                    ("In the blink of an eye.", "あっという間に。")
                 ])
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
                 ]),
            make("vicious cycle", "self-reinforcing harmful pattern",
                 "悪循環",
                 useCases: ["悪い状況が悪化を呼ぶ繰り返しを表すとき"],
                 examples: [
                    ("Break the vicious cycle.", "悪循環を断ち切る。"),
                    ("Stuck in a vicious cycle.", "悪循環から抜け出せない。")
                 ]),
            make("tipping point", "a critical moment of change",
                 "転換点・臨界点",
                 useCases: ["大きな変化が始まる瞬間を表すとき"],
                 examples: [
                    ("Reached the tipping point.", "臨界点に達した。"),
                    ("This is the tipping point.", "ここが転換点。")
                 ]),
            make("safety net", "a system that protects against loss",
                 "安全網・セーフティネット",
                 useCases: ["社会保障や保険のように万一に備える仕組み"],
                 examples: [
                    ("Social safety net.", "社会的セーフティネット。"),
                    ("A financial safety net.", "経済的な安全網。")
                 ]),
            make("disposable", "intended to be thrown away",
                 "使い捨ての・処分可能な",
                 useCases: ["一度使って捨てる物や、自由に使える資源を表すとき"],
                 examples: [
                    ("Disposable cups.", "使い捨てコップ。"),
                    ("Disposable income.", "可処分所得。")
                 ]),
            make("income", "money received from work or investments",
                 "収入・所得",
                 useCases: ["お金の受け取りを表すとき"],
                 examples: [
                    ("Monthly income.", "月収。"),
                    ("Increase your income.", "収入を増やす。")
                 ]),
            make("gap", "an opening or disparity",
                 "隙間・格差・空白",
                 useCases: ["物理的な隙間や能力・収入の差を表すとき"],
                 examples: [
                    ("Income gap.", "所得格差。"),
                    ("Mind the gap.", "隙間にご注意(駅放送)。")
                 ]),
            make("brain drain", "loss of talented people to other places",
                 "頭脳流出",
                 useCases: ["優秀人材が国外や別組織へ流れる現象を表すとき"],
                 examples: [
                    ("The brain drain to Silicon Valley.", "シリコンバレーへの頭脳流出。"),
                    ("Reverse the brain drain.", "頭脳流出を逆転させる。")
                 ]),
            make("burden", "a heavy load or responsibility",
                 "重荷・負担",
                 useCases: ["重い責任や心理的負担を表すとき"],
                 examples: [
                    ("A heavy burden.", "重い負担。"),
                    ("Don't burden yourself.", "自分を追い詰めないで。")
                 ]),
            make("gray area", "an unclear or ambiguous situation",
                 "グレーゾーン・曖昧な領域",
                 useCases: ["善悪や合法違法の境界が不明確な状況"],
                 examples: [
                    ("That's a gray area.", "それはグレーゾーン。"),
                    ("A legal gray area.", "法的なグレーゾーン。")
                 ])
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
                 ]),
            make("gem", "something or someone of great value",
                 "宝石・隠れた逸品",
                 useCases: ["素晴らしい人や物、隠れた名作を表すとき"],
                 examples: [
                    ("A hidden gem.", "隠れた名所。"),
                    ("She's a real gem.", "彼女は本当に素晴らしい人。")
                 ]),
            make("gray out", "become temporarily disabled or faded",
                 "(画面が)グレーアウトする・一時的に意識が遠のく",
                 useCases: ["UIで無効化される、または立ちくらみの状態"],
                 examples: [
                    ("The button is grayed out.", "ボタンがグレーアウトしてる。"),
                    ("I grayed out for a moment.", "一瞬意識が遠のいた。")
                 ]),
            make("party", "a person or group in an agreement",
                 "当事者・関係者",
                 useCases: ["契約や訴訟の関係者を表すとき(法的・ビジネス用語)"],
                 examples: [
                    ("Third party.", "第三者。"),
                    ("Both parties agreed.", "両当事者が合意した。")
                 ]),
            make("out of pocket", "paying with one's own money",
                 "自腹で・連絡が取れない",
                 useCases: ["自費負担、または連絡不能な状態を表すとき"],
                 examples: [
                    ("Paid out of pocket.", "自腹で払った。"),
                    ("I'll be out of pocket today.", "今日は連絡取れない。")
                 ]),
            make("benchmark", "a standard to compare against",
                 "基準・指標・ベンチマーク",
                 useCases: ["比較のための標準を設定するとき"],
                 examples: [
                    ("Industry benchmark.", "業界基準。"),
                    ("Set a benchmark.", "基準を設定する。")
                 ]),
            make("record", "a documented account or fastest result",
                 "記録・録音",
                 useCases: ["記録を保管・更新するとき、または録音するとき"],
                 examples: [
                    ("Break the record.", "記録を破る。"),
                    ("On the record.", "公式に。")
                 ]),
            make("incentive", "something that motivates action",
                 "誘因・インセンティブ",
                 useCases: ["動機付けや報酬を表すとき"],
                 examples: [
                    ("Financial incentive.", "金銭的インセンティブ。"),
                    ("Provide an incentive.", "誘因を提供する。")
                 ]),
            make("asset", "a valuable thing or quality",
                 "資産・財産・強み",
                 useCases: ["お金や能力など価値のあるものを表すとき"],
                 examples: [
                    ("A valuable asset.", "貴重な資産。"),
                    ("She's an asset to the team.", "彼女はチームの財産。")
                 ]),
            make("liability", "a debt or burden",
                 "負債・厄介者",
                 useCases: ["金銭的負債や、足を引っ張る存在を表すとき"],
                 examples: [
                    ("Assets and liabilities.", "資産と負債。"),
                    ("He's a liability.", "彼はお荷物。")
                 ])
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
                 ]),
            make("sweeten", "make more attractive",
                 "甘くする・(取引を)魅力的にする",
                 useCases: ["飲食物を甘くする、または取引条件を良くするとき"],
                 examples: [
                    ("Sweeten the deal.", "取引条件を良くする。"),
                    ("Sweeten my coffee.", "コーヒーを甘くする。")
                 ]),
            make("string", "a series; a thin cord",
                 "ひも・連続・条件",
                 useCases: ["紐の意味、連続するもの、または「条件付き」の比喩"],
                 examples: [
                    ("A string of wins.", "連勝。"),
                    ("No strings attached.", "条件なし。")
                 ]),
            make("swindle", "cheat someone out of money",
                 "騙し取る・詐取する",
                 useCases: ["詐欺で金銭をだまし取るとき"],
                 examples: [
                    ("She was swindled.", "彼女は騙された。"),
                    ("A swindle of millions.", "数百万の詐欺。")
                 ]),
            make("balance sth", "keep in equilibrium",
                 "〜のバランスを取る",
                 useCases: ["時間・お金・物理的な釣り合いを保つとき"],
                 examples: [
                    ("Balance work and life.", "仕事と生活を両立。"),
                    ("Balance the books.", "帳簿を均衡させる。")
                 ]),
            make("conclude", "bring to an end; reach a decision",
                 "結論を出す・終結する",
                 useCases: ["話や調査を締めくくり、判断を下すとき"],
                 examples: [
                    ("Conclude the meeting.", "会議を締めくくる。"),
                    ("I conclude that ~", "〜と結論する。")
                 ]),
            make("compromise", "settle by mutual concession",
                 "妥協する・妥協案",
                 useCases: ["双方が譲り合って合意するとき"],
                 examples: [
                    ("Reach a compromise.", "妥協に達する。"),
                    ("Don't compromise on quality.", "品質では妥協するな。")
                 ]),
            make("resort to", "use as a last option",
                 "(最後の手段として)頼る",
                 useCases: ["望ましくない手段に頼らざるを得ないとき"],
                 examples: [
                    ("Resort to violence.", "暴力に訴える。"),
                    ("Had to resort to begging.", "懇願に頼るしかなかった。")
                 ]),
            make("plate", "a flat dish; a license plate",
                 "皿・ナンバープレート",
                 useCases: ["食器や車のナンバー、責任の量の比喩"],
                 examples: [
                    ("Clean your plate.", "皿をきれいに食べて。"),
                    ("A lot on my plate.", "やることが山積み。")
                 ]),
            make("tag", "label or mark; identify in a post",
                 "タグ・(SNSで)タグ付けする",
                 useCases: ["値札やラベル、またはSNSで誰かを言及するとき"],
                 examples: [
                    ("Price tag.", "値札。"),
                    ("Tag me in the photo.", "写真にタグ付けして。")
                 ])
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
                 ]),
            make("naughty", "mischievous; misbehaving",
                 "いたずらな・行儀の悪い",
                 useCases: ["子供のいたずら、または大人のいかがわしさを表すとき"],
                 examples: [
                    ("Naughty kids.", "いたずらっ子。"),
                    ("Naughty boy!", "悪い子!")
                 ]),
            make("gut", "the intestines; instinct",
                 "腸・本能・直感",
                 useCases: ["内臓を指す、または本能・度胸の比喩"],
                 examples: [
                    ("Trust your gut.", "直感を信じて。"),
                    ("Takes guts.", "度胸が要る。")
                 ]),
            make("thumb", "the short thick finger",
                 "親指",
                 useCases: ["親指、または「経験則」のような比喩"],
                 examples: [
                    ("Thumbs up!", "親指立てて(いいね)!"),
                    ("Rule of thumb.", "経験則。")
                 ]),
            make("comfort food", "food that gives emotional comfort",
                 "心が落ち着く食べ物",
                 useCases: ["懐かしくて気持ちが安らぐ料理を表すとき"],
                 examples: [
                    ("Ramen is my comfort food.", "ラーメンは私のソウルフード。"),
                    ("Need some comfort food.", "癒し系の食事が欲しい。")
                 ]),
            make("work in progress", "something still being developed",
                 "進行中・未完成",
                 useCases: ["完成していない作業や自己改善を表すとき"],
                 examples: [
                    ("It's a work in progress.", "まだ作業中。"),
                    ("I'm a work in progress.", "私は成長途中。")
                 ]),
            make("uphill", "going up a slope; difficult",
                 "上り坂の・困難な",
                 useCases: ["物理的な上り坂や、苦戦している状況を表すとき"],
                 examples: [
                    ("An uphill battle.", "苦戦・困難な戦い。"),
                    ("Uphill climb.", "上り坂。")
                 ]),
            make("battle", "a fight or struggle",
                 "戦い・闘争",
                 useCases: ["物理的な戦闘や、困難との奮闘を表すとき"],
                 examples: [
                    ("Battle for survival.", "生存をかけた戦い。"),
                    ("An uphill battle.", "困難な戦い。")
                 ]),
            make("cushion", "a soft pad; to soften impact",
                 "クッション・衝撃を和らげる",
                 useCases: ["物理的クッション、または衝撃緩和の比喩"],
                 examples: [
                    ("Sit on the cushion.", "クッションに座って。"),
                    ("Cushion the blow.", "衝撃を和らげる。")
                 ]),
            make("wheel", "a circular object that turns",
                 "車輪・ハンドル",
                 useCases: ["車輪や運転席のハンドルを表すとき"],
                 examples: [
                    ("Behind the wheel.", "ハンドルを握って。"),
                    ("Reinvent the wheel.", "車輪の再発明をする(無駄な努力)。")
                 ])
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
                 ]),
            make("page turner", "a very engaging book",
                 "読みだしたら止まらない本",
                 useCases: ["夢中になって読んでしまう小説などを表すとき"],
                 examples: [
                    ("A real page turner.", "本当のページターナー。"),
                    ("This novel is a page turner.", "この小説は止まらない。")
                 ]),
            make("flop", "a complete failure",
                 "大失敗・コケる",
                 useCases: ["映画や商品が興行・売上で失敗したとき"],
                 examples: [
                    ("Box office flop.", "興行的大コケ。"),
                    ("The launch was a flop.", "ローンチは失敗。")
                 ]),
            make("overrated", "rated more highly than deserved",
                 "過大評価された",
                 useCases: ["評判ほど良くないと感じるものを表すとき"],
                 examples: [
                    ("Overrated movie.", "過大評価の映画。"),
                    ("Honestly, overrated.", "正直、過大評価。")
                 ]),
            make("cult", "a small devoted following",
                 "カルト的な・熱狂的支持",
                 useCases: ["熱狂的なファンの少ない集団を表すとき"],
                 examples: [
                    ("Cult classic.", "カルト的名作。"),
                    ("Has a cult following.", "熱狂的ファンを持つ。")
                 ]),
            make("classic", "a timeless example of excellence",
                 "古典・定番・典型的な",
                 useCases: ["時代を超えて愛される作品や物を表すとき"],
                 examples: [
                    ("A classic film.", "定番映画。"),
                    ("Classic mistake.", "典型的なミス。")
                 ]),
            make("discrepancy", "an inconsistency",
                 "食い違い・不一致",
                 useCases: ["データや証言の不整合を表すとき"],
                 examples: [
                    ("A discrepancy in the data.", "データの不一致。"),
                    ("Explain the discrepancy.", "食い違いを説明して。")
                 ]),
            make("prerequisite", "something required beforehand",
                 "前提条件・必須要件",
                 useCases: ["何かを始める前に必要な条件を表すとき"],
                 examples: [
                    ("Math is a prerequisite.", "数学が必須。"),
                    ("Meet the prerequisites.", "前提条件を満たす。")
                 ]),
            make("last resort", "a final option",
                 "最後の手段",
                 useCases: ["他の選択肢が尽きた時の最後の選択肢"],
                 examples: [
                    ("As a last resort.", "最後の手段として。"),
                    ("Surgery is the last resort.", "手術は最終手段。")
                 ]),
            make("catalyst", "something that triggers change",
                 "触媒・きっかけ",
                 useCases: ["変化や事件のきっかけを表すとき"],
                 examples: [
                    ("A catalyst for change.", "変化のきっかけ。"),
                    ("The event was the catalyst.", "あの出来事が触媒となった。")
                 ])
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
                 ]),
            make("early bird", "a person who gets up early",
                 "早起きの人",
                 useCases: ["朝型の人を表すとき"],
                 examples: [
                    ("I'm an early bird.", "私は朝型。"),
                    ("Early bird catches the worm.", "早起きは三文の徳。")
                 ]),
            make("night owl", "a person who stays up late",
                 "夜型の人",
                 useCases: ["夜遅くまで起きている人を表すとき"],
                 examples: [
                    ("I'm a night owl.", "私は夜型。"),
                    ("Night owls work better at night.", "夜型は夜に冴える。")
                 ]),
            make("homebody", "a person who prefers being at home",
                 "インドア派",
                 useCases: ["外出より家にいるのが好きな人を表すとき"],
                 examples: [
                    ("I'm a total homebody.", "完全なインドア派。"),
                    ("She's a homebody.", "彼女は家にいるのが好き。")
                 ]),
            make("backseat", "a non-driver who tells the driver what to do",
                 "後部座席・口出しする人",
                 useCases: ["物理的な後ろの席や、口出しばかりする態度"],
                 examples: [
                    ("Sit in the backseat.", "後部座席に座って。"),
                    ("Don't be a backseat driver.", "口出しドライバーやめて。")
                 ]),
            make("overthink", "think about too much",
                 "考えすぎる",
                 useCases: ["些細なことを延々と考えてしまうとき"],
                 examples: [
                    ("Don't overthink it.", "考えすぎないで。"),
                    ("I tend to overthink.", "考えすぎる癖がある。")
                 ]),
            make("copycat", "a person who imitates others",
                 "真似ばかりする人",
                 useCases: ["他人の真似をする人を批判するとき"],
                 examples: [
                    ("Stop being a copycat.", "真似ばかりしないで。"),
                    ("That's a copycat product.", "それは模倣品。")
                 ]),
            make("blood", "the red liquid; family lineage",
                 "血・血筋",
                 useCases: ["身体の血液、または家系・気質の比喩"],
                 examples: [
                    ("It's in my blood.", "血に流れてる。"),
                    ("Blood is thicker than water.", "血は水よりも濃い。")
                 ]),
            make("alien", "a foreigner; from another planet",
                 "外国人・宇宙人・異質な",
                 useCases: ["異質なものや宇宙人を表すとき"],
                 examples: [
                    ("Alien concept.", "馴染みのない概念。"),
                    ("Resident alien.", "在留外国人(法律用語)。")
                 ])
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
                 ]),
            make("backlog", "a build-up of unfinished work",
                 "未処理の山・バックログ",
                 useCases: ["溜まった仕事やタスクを表すとき"],
                 examples: [
                    ("Clear the backlog.", "未処理を片付ける。"),
                    ("Big backlog of emails.", "メールが大量に未処理。")
                 ]),
            make("second opinion", "another expert's view",
                 "別の専門家の意見",
                 useCases: ["医療やビジネスで別の見解を求めるとき"],
                 examples: [
                    ("Get a second opinion.", "セカンドオピニオンをもらう。"),
                    ("I'd like a second opinion.", "別の意見も聞きたい。")
                 ]),
            make("afterthought", "an idea added later",
                 "後付け・思い付き",
                 useCases: ["主な計画の後で付け加えたものを表すとき"],
                 examples: [
                    ("Just an afterthought.", "単なる後付け。"),
                    ("Added as an afterthought.", "思い付きで追加。")
                 ]),
            make("brainwave", "a sudden bright idea",
                 "ひらめき・名案",
                 useCases: ["突然いいアイデアが浮かんだとき"],
                 examples: [
                    ("I had a brainwave!", "ひらめいた!"),
                    ("Great brainwave.", "素晴らしい名案。")
                 ]),
            make("paralysis", "inability to act or decide",
                 "麻痺・決断不能",
                 useCases: ["身体や思考が動けない状態を表すとき"],
                 examples: [
                    ("Analysis paralysis.", "分析しすぎて動けない状態。"),
                    ("Temporary paralysis.", "一時的な麻痺。")
                 ]),
            make("brain fog", "mental cloudiness",
                 "頭がぼーっとする・思考の靄",
                 useCases: ["集中できない・考えがまとまらない状態"],
                 examples: [
                    ("Bad brain fog today.", "今日は頭がぼーっとする。"),
                    ("Brain fog from lack of sleep.", "睡眠不足で思考が霧。")
                 ]),
            make("mental block", "inability to think or remember",
                 "思考停止・思い出せない状態",
                 useCases: ["何も思い浮かばない状態を表すとき"],
                 examples: [
                    ("I have a mental block.", "頭が真っ白。"),
                    ("Hit a mental block.", "思考停止に陥った。")
                 ]),
            make("sort out", "organize or resolve",
                 "整理する・解決する",
                 useCases: ["物事を整理したり問題を片付けるとき"],
                 examples: [
                    ("Sort out the papers.", "書類を整理する。"),
                    ("Let's sort this out.", "これを解決しよう。")
                 ])
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
                 ]),
            make("hide", "conceal from view",
                 "隠す・隠れる",
                 useCases: ["物理的または感情的に隠す動作"],
                 examples: [
                    ("Hide and seek.", "かくれんぼ。"),
                    ("Don't hide your feelings.", "気持ちを隠さないで。")
                 ]),
            make("steal", "take without permission",
                 "盗む・こっそり取る",
                 useCases: ["物理的な窃盗、または比喩的な「奪う」"],
                 examples: [
                    ("Don't steal!", "盗むな!"),
                    ("Steal the show.", "場をさらう。")
                 ]),
            make("flush", "redden; clean with water",
                 "(顔が)赤くなる・水で流す",
                 useCases: ["顔が紅潮する、またはトイレを流すなど"],
                 examples: [
                    ("Flush the toilet.", "トイレを流して。"),
                    ("Flush with embarrassment.", "恥ずかしさで赤面。")
                 ]),
            make("sock", "a foot covering",
                 "靴下",
                 useCases: ["足を保護する衣類を表すとき"],
                 examples: [
                    ("Put on your socks.", "靴下を履いて。"),
                    ("A pair of socks.", "靴下一足。")
                 ]),
            make("spray", "a fine mist of liquid",
                 "スプレー・噴霧する",
                 useCases: ["液体を細かく噴き出すとき"],
                 examples: [
                    ("Spray bottle.", "スプレーボトル。"),
                    ("Spray the plants.", "植物に水を吹きかけて。")
                 ]),
            make("shortcoming", "a weakness or fault",
                 "欠点・短所",
                 useCases: ["人や物の弱点を表すとき"],
                 examples: [
                    ("Admit your shortcomings.", "短所を認めて。"),
                    ("Despite his shortcomings.", "彼の欠点にもかかわらず。")
                 ]),
            make("oppression", "prolonged cruel treatment",
                 "抑圧・圧政",
                 useCases: ["権力による不当な支配を表すとき"],
                 examples: [
                    ("Fight oppression.", "抑圧と戦う。"),
                    ("Under oppression.", "圧政下で。")
                 ]),
            make("nest egg", "savings set aside for the future",
                 "蓄え・へそくり",
                 useCases: ["将来のために貯めたお金を表すとき"],
                 examples: [
                    ("Build a nest egg.", "蓄えを作る。"),
                    ("My retirement nest egg.", "老後の資金。")
                 ])
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
                 ]),
            make("pleasure", "a feeling of happy satisfaction",
                 "喜び・楽しみ",
                 useCases: ["楽しみや満足感を表すとき"],
                 examples: [
                    ("My pleasure!", "どういたしまして!"),
                    ("Pure pleasure.", "純粋な喜び。")
                 ]),
            make("communal", "shared by a community",
                 "共同の・共有の",
                 useCases: ["共同体やシェアの状態を表すとき"],
                 examples: [
                    ("Communal kitchen.", "共有キッチン。"),
                    ("Communal living.", "共同生活。")
                 ]),
            make("ending", "the final part",
                 "結末・エンディング",
                 useCases: ["話や物事の終わりを表すとき"],
                 examples: [
                    ("Happy ending.", "ハッピーエンド。"),
                    ("The ending was sad.", "結末は悲しかった。")
                 ]),
            make("entertain", "amuse; consider an idea",
                 "楽しませる・(案を)検討する",
                 useCases: ["人を楽しませる、または考えを巡らすとき"],
                 examples: [
                    ("Entertain the guests.", "客をもてなす。"),
                    ("Entertain the idea.", "アイデアを検討する。")
                 ]),
            make("under control", "being managed properly",
                 "管理下にある・コントロールできている",
                 useCases: ["状況が制御されていることを伝えるとき"],
                 examples: [
                    ("Everything's under control.", "全部コントロール内。"),
                    ("Keep it under control.", "制御を保って。")
                 ]),
            make("aside", "to one side; apart from",
                 "脇に・別として",
                 useCases: ["脇へ寄せる、または「冗談はさておき」のように"],
                 examples: [
                    ("Step aside.", "脇に寄って。"),
                    ("Joking aside, ~", "冗談はさておき〜")
                 ]),
            make("gratitude", "a feeling of thankfulness",
                 "感謝の気持ち",
                 useCases: ["心からの感謝を表すとき"],
                 examples: [
                    ("Express gratitude.", "感謝を表す。"),
                    ("Deep gratitude.", "深い感謝。")
                 ]),
            make("hint", "a slight indication",
                 "ヒント・ほのめかし",
                 useCases: ["微妙に示唆する、または手がかりを与えるとき"],
                 examples: [
                    ("Give me a hint.", "ヒントちょうだい。"),
                    ("A subtle hint.", "それとなくほのめかす。")
                 ])
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
                 ]),
            make("lock down", "restrict movement strictly",
                 "封鎖する・ロックダウン",
                 useCases: ["施設や地域への出入り制限を表すとき"],
                 examples: [
                    ("The city is on lock down.", "街はロックダウン中。"),
                    ("Lock down the building.", "建物を封鎖する。")
                 ]),
            make("deport", "expel from a country",
                 "国外追放する",
                 useCases: ["不法移民や違反者を国外退去させるとき"],
                 examples: [
                    ("Deport illegal immigrants.", "不法移民を国外退去。"),
                    ("Risk of being deported.", "国外追放のリスク。")
                 ]),
            make("citizen", "a legally recognized national",
                 "市民・国民",
                 useCases: ["国家の構成員を表すとき"],
                 examples: [
                    ("Japanese citizen.", "日本国民。"),
                    ("Citizens' rights.", "市民の権利。")
                 ]),
            make("discrimination", "unfair treatment based on category",
                 "差別",
                 useCases: ["性別・人種などによる不当な扱いを表すとき"],
                 examples: [
                    ("Racial discrimination.", "人種差別。"),
                    ("Fight discrimination.", "差別と戦う。")
                 ]),
            make("agency", "an organization or office",
                 "代理店・機関",
                 useCases: ["特定の業務を担う組織を表すとき"],
                 examples: [
                    ("Travel agency.", "旅行代理店。"),
                    ("Government agency.", "政府機関。")
                 ]),
            make("confirm", "verify or make certain",
                 "確認する・確定する",
                 useCases: ["情報や予約の正しさを確かめるとき"],
                 examples: [
                    ("Please confirm your reservation.", "予約をご確認ください。"),
                    ("Confirmed!", "確認済み!")
                 ]),
            make("enemy", "a hostile opponent",
                 "敵",
                 useCases: ["敵対する相手を表すとき"],
                 examples: [
                    ("Make an enemy.", "敵を作る。"),
                    ("Public enemy.", "公敵。")
                 ]),
            make("dismantle", "take apart or abolish",
                 "解体する・廃止する",
                 useCases: ["機械や組織を分解・廃止するとき"],
                 examples: [
                    ("Dismantle the system.", "システムを解体する。"),
                    ("Dismantle the machine.", "機械を分解する。")
                 ]),
            make("adopt sth", "take up or formally accept",
                 "(方針などを)採用する・養子にする",
                 useCases: ["方針・習慣・子供などを正式に受け入れるとき"],
                 examples: [
                    ("Adopt a new policy.", "新方針を採用。"),
                    ("Adopt a child.", "子供を養子にする。")
                 ])
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
                 ]),
            make("pointless", "having no purpose",
                 "無意味な",
                 useCases: ["無駄な努力や議論を表すとき"],
                 examples: [
                    ("It's pointless.", "意味がない。"),
                    ("A pointless argument.", "無意味な議論。")
                 ]),
            make("profession", "a paid occupation requiring training",
                 "職業・専門職",
                 useCases: ["専門知識を要する仕事を表すとき"],
                 examples: [
                    ("What's your profession?", "ご職業は?"),
                    ("Teaching profession.", "教職。")
                 ]),
            make("intention", "an aim or plan",
                 "意図・目的",
                 useCases: ["何かをするつもりを表すとき"],
                 examples: [
                    ("Good intentions.", "良い意図。"),
                    ("I have no intention of leaving.", "辞める気はない。")
                 ]),
            make("disappear", "stop being visible",
                 "消える・姿を消す",
                 useCases: ["物や人がいなくなるとき"],
                 examples: [
                    ("It disappeared!", "消えた!"),
                    ("She just disappeared.", "彼女は突然いなくなった。")
                 ]),
            make("cosmetic", "relating to appearance; superficial",
                 "化粧の・表面的な",
                 useCases: ["美容関連、または見せかけだけの変更を表すとき"],
                 examples: [
                    ("Cosmetic surgery.", "美容整形。"),
                    ("Just cosmetic changes.", "表面的な変更のみ。")
                 ]),
            make("remarkably", "in a striking way",
                 "驚くほど・目立って",
                 useCases: ["際立った特徴を強調するとき"],
                 examples: [
                    ("Remarkably similar.", "驚くほど似てる。"),
                    ("Remarkably well.", "目覚ましく上手。")
                 ]),
            make("rise", "go up; increase",
                 "上がる・上昇",
                 useCases: ["価格・温度・人気などが上がるとき、または日の出"],
                 examples: [
                    ("Prices rise.", "値段が上がる。"),
                    ("The sun rises.", "日が昇る。")
                 ]),
            make("charming", "delightfully attractive",
                 "魅力的な",
                 useCases: ["人や場所の魅力を褒めるとき"],
                 examples: [
                    ("A charming village.", "魅力的な村。"),
                    ("He's so charming.", "彼は魅力的。")
                 ]),
            make("stalk", "follow secretly; pursue obsessively",
                 "つけ回す・ストーキングする",
                 useCases: ["人をひそかに追跡する不健全な行動"],
                 examples: [
                    ("Stop stalking me.", "つけ回さないで。"),
                    ("She felt stalked.", "つけ回されていると感じた。")
                 ])
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
                 ]),
            make("nostalgia", "sentimental longing for the past",
                 "ノスタルジア・懐かしさ",
                 useCases: ["昔を思い出す感傷的な気持ちを表すとき"],
                 examples: [
                    ("A wave of nostalgia.", "懐かしさの波。"),
                    ("Pure nostalgia.", "純粋な郷愁。")
                 ]),
            make("in tears", "crying",
                 "泣いている",
                 useCases: ["涙を流している状態を表すとき"],
                 examples: [
                    ("She was in tears.", "彼女は泣いていた。"),
                    ("Left them in tears.", "彼らを泣かせた。")
                 ]),
            make("magical", "wonderfully enchanting",
                 "魔法のような・素晴らしい",
                 useCases: ["うっとりするほど素敵な瞬間を表すとき"],
                 examples: [
                    ("A magical moment.", "魔法のような瞬間。"),
                    ("It felt magical.", "魔法のようだった。")
                 ]),
            make("thankful", "grateful",
                 "感謝している",
                 useCases: ["感謝の気持ちを表すとき"],
                 examples: [
                    ("I'm thankful for you.", "君に感謝してる。"),
                    ("Be thankful.", "感謝の気持ちを忘れずに。")
                 ]),
            make("mentally", "in terms of the mind",
                 "精神的に",
                 useCases: ["心の状態や準備について話すとき"],
                 examples: [
                    ("Mentally exhausted.", "精神的に疲れた。"),
                    ("Mentally prepared.", "心の準備ができている。")
                 ]),
            make("prepared", "ready in advance",
                 "準備された",
                 useCases: ["事前準備ができている状態を表すとき"],
                 examples: [
                    ("Always be prepared.", "常に備えあれ。"),
                    ("I'm well prepared.", "しっかり準備できてる。")
                 ]),
            make("good old days", "the past remembered fondly",
                 "懐かしい古き良き時代",
                 useCases: ["楽しかった昔を懐かしむとき"],
                 examples: [
                    ("The good old days.", "古き良き時代。"),
                    ("Miss the good old days.", "あの頃が懐かしい。")
                 ]),
            make("bless my ears", "what a wonderful sound to hear",
                 "耳に心地いい・なんと嬉しい言葉",
                 useCases: ["心地よい音や嬉しい言葉に感動するとき"],
                 examples: [
                    ("Bless my ears!", "なんと嬉しい音!"),
                    ("That voice blesses my ears.", "あの声が耳に心地いい。")
                 ])
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
                 ]),
            make("break into pieces", "shatter into fragments",
                 "粉々に砕ける・壊れる",
                 useCases: ["物理的にも比喩的にも粉々に砕ける状況"],
                 examples: [
                    ("It broke into pieces.", "粉々になった。"),
                    ("My heart broke into pieces.", "心がバラバラになった。")
                 ]),
            make("tear down", "demolish",
                 "取り壊す・打ち砕く",
                 useCases: ["建物や信念を破壊するとき"],
                 examples: [
                    ("Tear down the wall.", "壁を取り壊す。"),
                    ("Tear down barriers.", "壁を打ち壊す。")
                 ]),
            make("all-nighter", "stay up all night",
                 "徹夜",
                 useCases: ["一晩中起きて勉強や仕事をしたとき"],
                 examples: [
                    ("Pulled an all-nighter.", "徹夜した。"),
                    ("Need an all-nighter.", "徹夜が必要。")
                 ]),
            make("relieve", "ease pain or stress",
                 "和らげる・軽減する",
                 useCases: ["痛み・ストレス・負担を減らすとき"],
                 examples: [
                    ("Relieve stress.", "ストレスを和らげる。"),
                    ("Relieve the pressure.", "プレッシャーを軽減。")
                 ]),
            make("trigger", "cause a reaction",
                 "引き金になる・誘発する",
                 useCases: ["反応・感情・記憶などを引き起こすとき"],
                 examples: [
                    ("Trigger memories.", "記憶を呼び起こす。"),
                    ("Pull the trigger.", "引き金を引く。")
                 ]),
            make("die at peace", "pass away peacefully",
                 "安らかに死ぬ",
                 useCases: ["穏やかな最期を表すとき"],
                 examples: [
                    ("She died at peace.", "彼女は安らかに亡くなった。"),
                    ("May he die at peace.", "彼が安らかに逝けますように。")
                 ]),
            make("reminder", "something that helps you remember",
                 "リマインダー・思い出させるもの",
                 useCases: ["忘れないように促す通知や品物を表すとき"],
                 examples: [
                    ("Set a reminder.", "リマインダーを設定。"),
                    ("Friendly reminder.", "親切なお知らせ。")
                 ]),
            make("journey", "a long trip or process",
                 "旅・道のり",
                 useCases: ["物理的な旅や人生の歩みを表すとき"],
                 examples: [
                    ("A long journey.", "長い旅。"),
                    ("Life is a journey.", "人生は旅。")
                 ])
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
                 ]),
            make("remote", "far away; controlled from a distance",
                 "遠隔の・人里離れた",
                 useCases: ["距離が遠い場所、またはリモートワークなど"],
                 examples: [
                    ("Remote work.", "リモートワーク。"),
                    ("A remote village.", "辺鄙な村。")
                 ]),
            make("pixel art", "digital art made of pixels",
                 "ピクセルアート",
                 useCases: ["ドット絵の作品やレトロゲーム風グラフィックを表すとき"],
                 examples: [
                    ("Love pixel art.", "ピクセルアート大好き。"),
                    ("Pixel art game.", "ドット絵ゲーム。")
                 ]),
            make("well done", "cooked thoroughly; nicely accomplished",
                 "ウェルダン・お見事",
                 useCases: ["肉の焼き加減や仕事の褒め言葉として"],
                 examples: [
                    ("Steak well done, please.", "ステーキはウェルダンで。"),
                    ("Well done!", "お見事!")
                 ]),
            make("soundtrack", "music for a film or show",
                 "サウンドトラック",
                 useCases: ["映画やゲームの音楽を表すとき"],
                 examples: [
                    ("Movie soundtrack.", "映画のサントラ。"),
                    ("Great soundtrack.", "サントラが素晴らしい。")
                 ]),
            make("for a sec", "for a short moment",
                 "ちょっとだけ・一瞬",
                 useCases: ["短い時間を表すカジュアル口語(for a second の略)"],
                 examples: [
                    ("Wait for a sec.", "ちょっと待って。"),
                    ("Step out for a sec.", "ちょっと外す。")
                 ]),
            make("personal", "relating to one individual privately",
                 "個人的な",
                 useCases: ["プライベートで重要なことを表すとき"],
                 examples: [
                    ("Don't take it personal.", "個人攻撃と受け取らないで。"),
                    ("Personal experience.", "個人的な経験。")
                 ]),
            make("uncontrollable", "impossible to control",
                 "制御不能な",
                 useCases: ["抑えきれない感情や行動を表すとき"],
                 examples: [
                    ("Uncontrollable laughter.", "止まらない笑い。"),
                    ("It became uncontrollable.", "手に負えなくなった。")
                 ]),
            make("tunnel", "an underground passage",
                 "トンネル",
                 useCases: ["地下や山を貫く通路、または比喩的な道のり"],
                 examples: [
                    ("Through the tunnel.", "トンネルを通って。"),
                    ("Light at the end of the tunnel.", "トンネルの先の光(希望の比喩)。")
                 ])
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
                 ]),
            make("coziness", "a feeling of warm comfort",
                 "ぬくもり・居心地のよさ",
                 useCases: ["温かくくつろげる雰囲気そのものを名詞で表すとき"],
                 examples: [
                    ("The coziness of home.", "家のぬくもり。"),
                    ("Pure coziness.", "純粋な居心地のよさ。")
                 ]),
            make("immense", "extremely large; vast",
                 "計り知れない・莫大な",
                 useCases: ["規模や感情が極めて大きいことを表すとき"],
                 examples: [
                    ("Immense pressure.", "計り知れないプレッシャー。"),
                    ("An immense ocean.", "果てしない海。")
                 ]),
            make("overwhelming", "very strong or intense",
                 "圧倒的な・押し寄せる",
                 useCases: ["感情や物量に圧倒される様子を表すとき"],
                 examples: [
                    ("Overwhelming support.", "圧倒的な支持。"),
                    ("Feeling overwhelmed.", "押しつぶされそう。")
                 ]),
            make("melancholic", "feeling pensive sadness",
                 "もの悲しい・憂愁の",
                 useCases: ["静かで深い悲しみを表すとき"],
                 examples: [
                    ("A melancholic mood.", "もの悲しい気分。"),
                    ("Melancholic music.", "憂いのある音楽。")
                 ]),
            make("sadness", "the feeling of being sad",
                 "悲しみ",
                 useCases: ["悲しい気持ちそのものを表すとき"],
                 examples: [
                    ("A wave of sadness.", "悲しみの波。"),
                    ("Pure sadness.", "純粋な悲しみ。")
                 ]),
            make("hold it together", "stay composed under stress",
                 "気をしっかり保つ",
                 useCases: ["崩れそうな感情をなんとか抑えるとき"],
                 examples: [
                    ("Try to hold it together.", "踏ん張って。"),
                    ("I can barely hold it together.", "ギリギリ持ちこたえてる。")
                 ]),
            make("sob", "cry noisily",
                 "むせび泣く",
                 useCases: ["激しく泣くときに"],
                 examples: [
                    ("She sobbed quietly.", "彼女は静かに泣いた。"),
                    ("Burst into sobs.", "泣き崩れた。")
                 ])
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
                 ]),
            make("unmatched", "having no equal",
                 "比類のない・並ぶものがない",
                 useCases: ["他を寄せ付けない優れた品質を表すとき"],
                 examples: [
                    ("Unmatched quality.", "比類なき品質。"),
                    ("Her skill is unmatched.", "彼女の腕は他にいない。")
                 ]),
            make("nonstop", "without stopping",
                 "ノンストップの・休みなしの",
                 useCases: ["途切れず続く動作や直行便を表すとき"],
                 examples: [
                    ("Nonstop flight.", "直行便。"),
                    ("Working nonstop.", "ぶっ通しで働く。")
                 ]),
            make("oddly", "in a strange way",
                 "奇妙にも・不思議と",
                 useCases: ["普通とは違った印象や感覚を表すとき"],
                 examples: [
                    ("Oddly satisfying.", "妙に気持ちいい。"),
                    ("Oddly enough, ~", "奇妙なことに〜")
                 ]),
            make("profound", "very great or deep",
                 "深い・深遠な",
                 useCases: ["感動や影響が深いことを表すとき"],
                 examples: [
                    ("Profound impact.", "深い影響。"),
                    ("Profound silence.", "深い沈黙。")
                 ]),
            make("shiny", "reflecting light brightly",
                 "ピカピカの・光沢のある",
                 useCases: ["光を反射して輝いている物を表すとき"],
                 examples: [
                    ("Shiny new car.", "ピカピカの新車。"),
                    ("Shiny hair.", "ツヤツヤの髪。")
                 ]),
            make("intact", "undamaged; complete",
                 "無傷の・そのままの",
                 useCases: ["元の状態で保たれているものを表すとき"],
                 examples: [
                    ("Still intact.", "まだ無傷。"),
                    ("Reputation intact.", "評判は守られた。")
                 ]),
            make("simpler", "easier or more straightforward",
                 "よりシンプルな・もっと簡単な",
                 useCases: ["より単純化した表現を提案するとき(simpleの比較級)"],
                 examples: [
                    ("Make it simpler.", "もっとシンプルにして。"),
                    ("Life was simpler then.", "あの頃はもっとシンプルだった。")
                 ])
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
                 ]),
            make("stay up", "remain awake",
                 "夜更かしする・起きている",
                 useCases: ["遅くまで寝ないでいることを表すとき"],
                 examples: [
                    ("Stay up late.", "夜更かしする。"),
                    ("Stayed up till 3am.", "3時まで起きてた。")
                 ]),
            make("instantly", "immediately",
                 "瞬時に・即座に",
                 useCases: ["時間をかけず即座に起きる動作を表すとき"],
                 examples: [
                    ("Reply instantly.", "即返事して。"),
                    ("Instantly fell asleep.", "瞬時に眠った。")
                 ]),
            make("hunt", "search for or pursue",
                 "狩りをする・探し回る",
                 useCases: ["獲物や物を必死に探すときの動詞・名詞"],
                 examples: [
                    ("Job hunt.", "就活。"),
                    ("Hunt for clues.", "手がかりを探す。")
                 ]),
            make("simultaneously", "at the same time",
                 "同時に",
                 useCases: ["複数のことが平行して起きるとき(フォーマル)"],
                 examples: [
                    ("Happen simultaneously.", "同時に起きる。"),
                    ("Work on two things simultaneously.", "2つを同時に進める。")
                 ]),
            make("responsibility", "the state of being accountable",
                 "責任",
                 useCases: ["役割や義務を表すとき"],
                 examples: [
                    ("Take responsibility.", "責任を取る。"),
                    ("Heavy responsibility.", "重い責任。")
                 ]),
            make("bangs", "hair cut to hang over the forehead",
                 "前髪",
                 useCases: ["額にかかる前髪のヘアスタイルを表すとき(米)"],
                 examples: [
                    ("Cut my bangs.", "前髪を切る。"),
                    ("I love your bangs.", "前髪かわいい。")
                 ])
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
                 ]),
            make("icon", "a symbol or famous figure",
                 "象徴・偶像・アイコン",
                 useCases: ["時代を代表する有名人や象徴的な物を表すとき"],
                 examples: [
                    ("Style icon.", "ファッションアイコン。"),
                    ("Cultural icon.", "文化的象徴。")
                 ]),
            make("hit me in the feels", "deeply move emotionally",
                 "心にグサッとくる",
                 useCases: ["強く感情を揺さぶられたときの口語表現"],
                 examples: [
                    ("That song hit me in the feels.", "あの曲、心にグッときた。"),
                    ("Hit me right in the feels.", "もろ心に来た。")
                 ]),
            make("sunshine", "bright sunlight; a cheerful person",
                 "日差し・元気の源",
                 useCases: ["太陽の光、または明るい人を比喩で表すとき"],
                 examples: [
                    ("Lots of sunshine today.", "今日は日差したっぷり。"),
                    ("You're my sunshine.", "君は私の元気の源。")
                 ]),
            make("lasting", "continuing to exist or be effective",
                 "長続きする・永続的な",
                 useCases: ["影響や効果が長く続くものを表すとき"],
                 examples: [
                    ("Lasting impression.", "強い印象。"),
                    ("Lasting friendship.", "長続きする友情。")
                 ]),
            make("era", "a long period of historical time",
                 "時代",
                 useCases: ["歴史区分や個人の人生段階を表すとき"],
                 examples: [
                    ("The end of an era.", "ある時代の終わり。"),
                    ("My college era.", "大学時代。")
                 ]),
            make("chuckle", "laugh softly",
                 "クスクス笑う",
                 useCases: ["静かに笑うときの動詞・名詞"],
                 examples: [
                    ("He chuckled to himself.", "彼は一人クスッと笑った。"),
                    ("A soft chuckle.", "静かな笑い。")
                 ]),
            make("preoccupy", "occupy someone's thoughts",
                 "頭から離れない・心を奪う",
                 useCases: ["何かに気を取られている状態を表すとき"],
                 examples: [
                    ("Preoccupied with work.", "仕事で頭がいっぱい。"),
                    ("Don't let it preoccupy you.", "それに気を取られないで。")
                 ])
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
                 ]),
            make("on demand", "available when wanted",
                 "オンデマンドで・要求に応じて",
                 useCases: ["必要な時にすぐ利用できることを表すとき"],
                 examples: [
                    ("Video on demand.", "オンデマンド動画。"),
                    ("Available on demand.", "要望に応じて利用可。")
                 ]),
            make("in working condition", "still functioning",
                 "稼働状態で・使える状態で",
                 useCases: ["機械や物がまだ正常に動くことを表すとき"],
                 examples: [
                    ("Still in working condition.", "まだ動く状態。"),
                    ("Keep it in working condition.", "使える状態で保って。")
                 ]),
            make("bit by bit", "little by little",
                 "少しずつ",
                 useCases: ["徐々に進む様子を表すとき"],
                 examples: [
                    ("Bit by bit, it improved.", "少しずつ良くなった。"),
                    ("Learn bit by bit.", "少しずつ学ぶ。")
                 ]),
            make("footage", "filmed video material",
                 "映像・フッテージ",
                 useCases: ["記録映像やビデオ素材を表すとき"],
                 examples: [
                    ("Security footage.", "防犯カメラ映像。"),
                    ("Behind-the-scenes footage.", "舞台裏映像。")
                 ]),
            make("background", "a person's history or visual back area",
                 "背景・経歴",
                 useCases: ["人の経歴、または画像・場面の背景を表すとき"],
                 examples: [
                    ("Cultural background.", "文化的背景。"),
                    ("Blurry background.", "ぼやけた背景。")
                 ]),
            make("rural", "characteristic of the countryside",
                 "田舎の・地方の",
                 useCases: ["都会の対比で田舎を表すとき"],
                 examples: [
                    ("Rural area.", "地方・田舎。"),
                    ("Rural life.", "田舎暮らし。")
                 ]),
            make("as I mentioned earlier", "as previously stated",
                 "先ほど述べたように",
                 useCases: ["プレゼンや会議で前述を再度参照するとき"],
                 examples: [
                    ("As I mentioned earlier, ~", "先ほどお伝えしたように〜"),
                    ("As I mentioned earlier in the report.", "報告で先述したように。")
                 ])
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
                 ]),
            make("strand", "a single thread; leave stranded",
                 "(髪などの)一筋・取り残す",
                 useCases: ["髪や糸の一本、または身動き取れない状態を表すとき"],
                 examples: [
                    ("A strand of hair.", "髪の一筋。"),
                    ("Stranded at the airport.", "空港で足止め。")
                 ]),
            make("flood", "an overflow of water; overwhelm",
                 "洪水・殺到",
                 useCases: ["水の氾濫、または情報や感情が押し寄せるとき"],
                 examples: [
                    ("Flash flood.", "鉄砲水。"),
                    ("Flood of messages.", "メッセージが殺到。")
                 ]),
            make("flow", "move steadily; the steady movement",
                 "流れる・流れ",
                 useCases: ["液体・人・情報の継続的な動きを表すとき"],
                 examples: [
                    ("Cash flow.", "キャッシュフロー。"),
                    ("Go with the flow.", "流れに身を任せて。")
                 ]),
            make("foster", "encourage development of; bring up as one's own",
                 "育む・里親になる",
                 useCases: ["考え・関係・文化を促進する、または里親として育てる"],
                 examples: [
                    ("Foster creativity.", "創造性を育む。"),
                    ("Foster a child.", "里子を育てる。")
                 ]),
            make("touch down", "land on a surface",
                 "着陸する・タッチダウン",
                 useCases: ["飛行機が着陸する、またはアメフトの得点を表すとき"],
                 examples: [
                    ("The plane touched down.", "飛行機が着陸した。"),
                    ("Score a touchdown.", "タッチダウンを決める。")
                 ]),
            make("patrol", "guard or move around an area regularly",
                 "巡回する・パトロール",
                 useCases: ["警官や警備員が見回るとき"],
                 examples: [
                    ("Police patrol.", "警察のパトロール。"),
                    ("On patrol.", "巡回中。")
                 ])
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
                 ]),
            make("on repeat", "playing repeatedly",
                 "リピート再生で・何度も",
                 useCases: ["同じ曲や動画を繰り返し再生するとき"],
                 examples: [
                    ("Song on repeat.", "リピート再生。"),
                    ("Watching it on repeat.", "何度も観てる。")
                 ]),
            make("time has flown by", "time has passed very quickly",
                 "時が飛ぶように過ぎた",
                 useCases: ["振り返って早かったと感じるとき"],
                 examples: [
                    ("Wow, time has flown by!", "わぁ、もうこんなに経った!"),
                    ("Time has flown by since then.", "あれから時間があっという間。")
                 ]),
            make("warmth", "the quality of being warm",
                 "温かさ・ぬくもり",
                 useCases: ["物理的・感情的な温もりを表すとき"],
                 examples: [
                    ("Feel the warmth.", "温かさを感じる。"),
                    ("Warmth of family.", "家族のぬくもり。")
                 ]),
            make("sentiment", "a thought or feeling",
                 "感情・心情",
                 useCases: ["心からの気持ちや世論を表すとき"],
                 examples: [
                    ("Public sentiment.", "世論・国民感情。"),
                    ("Nice sentiment.", "素敵な気持ちだね。")
                 ]),
            make("take a moment", "pause briefly",
                 "ちょっと時間を取る",
                 useCases: ["立ち止まって考える・気持ちを落ち着けるとき"],
                 examples: [
                    ("Take a moment to relax.", "ちょっと一息ついて。"),
                    ("Let's take a moment.", "少し時間を取ろう。")
                 ]),
            make("leave an impression", "be memorable",
                 "印象を残す",
                 useCases: ["人や物が記憶に残るとき"],
                 examples: [
                    ("Leave a lasting impression.", "強い印象を残す。"),
                    ("She left an impression on me.", "彼女が私に印象を残した。")
                 ]),
            make("until my last breath", "until I die",
                 "最後の息まで・死ぬまで",
                 useCases: ["生涯にわたる強い決意や愛情を表すとき"],
                 examples: [
                    ("I'll fight until my last breath.", "息絶えるまで戦う。"),
                    ("Love you until my last breath.", "死ぬまで愛してる。")
                 ]),
            make("go back in time", "return to the past",
                 "過去に戻る",
                 useCases: ["過去をやり直したい願望や懐古を表すとき"],
                 examples: [
                    ("I wish I could go back in time.", "過去に戻れたらいいのに。"),
                    ("Go back in time and ~", "時を戻して〜")
                 ])
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
                 ]),
            make("fix on", "focus attention on",
                 "〜に注目する・固定する",
                 useCases: ["視線や考えをそこに据えるとき"],
                 examples: [
                    ("Her eyes were fixed on him.", "彼女の視線は彼に釘付け。"),
                    ("Fix on a goal.", "目標を見据える。")
                 ]),
            make("fool around", "behave playfully or waste time",
                 "ふざける・遊び回る",
                 useCases: ["真面目にせず遊んでいるとき"],
                 examples: [
                    ("Stop fooling around.", "ふざけるのやめて。"),
                    ("We fooled around all day.", "一日中遊び回った。")
                 ]),
            make("go and move on", "leave and move forward",
                 "去って前進する・忘れて進む",
                 useCases: ["過去を断ち切って次へ進むとき"],
                 examples: [
                    ("Time to go and move on.", "去って前へ進む時。"),
                    ("Just go and move on.", "もう忘れて進もう。")
                 ]),
            make("unknowingly", "without being aware",
                 "知らずに・無自覚に",
                 useCases: ["気づかないうちに何かをしたとき"],
                 examples: [
                    ("Unknowingly broke the rule.", "知らずに規則を破った。"),
                    ("Unknowingly helped them.", "知らぬ間に助けていた。")
                 ]),
            make("spiral", "wind in a curve; deteriorate",
                 "螺旋・悪化する",
                 useCases: ["渦巻き状の動きや、状況が悪化するとき"],
                 examples: [
                    ("Downward spiral.", "悪循環。"),
                    ("Spiral out of control.", "制御不能になる。")
                 ]),
            make("stump", "confuse or baffle",
                 "困らせる・行き詰まらせる",
                 useCases: ["難問で困惑させるとき"],
                 examples: [
                    ("That stumped me.", "それで詰まった。"),
                    ("Don't get stumped.", "つまずかないで。")
                 ]),
            make("distort", "twist out of shape; misrepresent",
                 "歪める・捻じ曲げる",
                 useCases: ["形や事実を歪曲するとき"],
                 examples: [
                    ("Distort the truth.", "真実を捻じ曲げる。"),
                    ("Distorted image.", "歪んだイメージ。")
                 ]),
            make("fracture", "break or crack",
                 "骨折する・ひびが入る",
                 useCases: ["骨折や物・関係のひびを表すとき"],
                 examples: [
                    ("Fracture a bone.", "骨折する。"),
                    ("A fractured relationship.", "ひびの入った関係。")
                 ])
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
                 ]),
            make("membrane", "a thin layer of tissue",
                 "膜",
                 useCases: ["細胞膜や薄い層を表すとき"],
                 examples: [
                    ("Cell membrane.", "細胞膜。"),
                    ("Mucous membrane.", "粘膜。")
                 ]),
            make("backdrop", "the scenery behind",
                 "背景・舞台幕",
                 useCases: ["舞台や写真、出来事の背景を表すとき"],
                 examples: [
                    ("Mountain backdrop.", "山を背景に。"),
                    ("Against this backdrop.", "この背景の中で。")
                 ]),
            make("fluorescent", "emitting glowing light",
                 "蛍光の・蛍光灯の",
                 useCases: ["蛍光ペンや蛍光灯など発光するものを表すとき"],
                 examples: [
                    ("Fluorescent light.", "蛍光灯。"),
                    ("Fluorescent yellow.", "蛍光イエロー。")
                 ]),
            make("now that", "given the fact that",
                 "〜である今は・〜したからには",
                 useCases: ["新しい状況を踏まえて結論を述べるとき"],
                 examples: [
                    ("Now that I think about it, ~", "考えてみれば〜"),
                    ("Now that you're here, let's start.", "君が来たから始めよう。")
                 ]),
            make("flawless", "without any flaw",
                 "完璧な・欠点のない",
                 useCases: ["申し分のない品質や見た目を表すとき"],
                 examples: [
                    ("Flawless performance.", "完璧なパフォーマンス。"),
                    ("Flawless skin.", "完璧な肌。")
                 ]),
            make("blanket", "a thick cover; covering broadly",
                 "毛布・全体的な",
                 useCases: ["寝具の毛布、または広範囲をカバーする比喩"],
                 examples: [
                    ("Warm blanket.", "暖かい毛布。"),
                    ("Blanket statement.", "ひとくくりの発言。")
                 ]),
            make("cooked", "prepared by heat; (slang) done for",
                 "調理された・(俗)終わった",
                 useCases: ["料理の状態、またはスラングで「終わった・ヤバい」"],
                 examples: [
                    ("Cooked rice.", "炊いたお米。"),
                    ("I'm cooked!", "もう終わった!")
                 ]),
            make("fishing", "the activity of catching fish",
                 "釣り・釣りをすること",
                 useCases: ["趣味としての釣りや「探りを入れる」比喩"],
                 examples: [
                    ("Go fishing.", "釣りに行く。"),
                    ("Fishing for compliments.", "褒められたがる。")
                 ])
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
                 ]),
            make("live up to", "fulfill or match expectations",
                 "(期待に)応える",
                 useCases: ["評判や期待に見合うものを表すとき"],
                 examples: [
                    ("Live up to the hype.", "前評判に応える。"),
                    ("Live up to expectations.", "期待に応える。")
                 ]),
            make("add up", "make sense; total to",
                 "辻褄が合う・合計する",
                 useCases: ["話の筋が通る、または数字の合計を表すとき"],
                 examples: [
                    ("That doesn't add up.", "辻褄が合わない。"),
                    ("It all adds up.", "全部つながる。")
                 ]),
            make("filter", "remove unwanted parts; selectively pass",
                 "ろ過する・フィルター",
                 useCases: ["物理的な濾過、または情報を選別するとき"],
                 examples: [
                    ("Filter the water.", "水を濾す。"),
                    ("Apply a photo filter.", "写真にフィルターをかける。")
                 ]),
            make("score", "earn points; get something good",
                 "得点する・うまく手に入れる",
                 useCases: ["試合の得点、または「ゲット」のスラング"],
                 examples: [
                    ("Score a goal.", "ゴールを決める。"),
                    ("Scored tickets!", "チケット手に入れた!")
                 ]),
            make("peak", "the highest point",
                 "頂点・最盛期",
                 useCases: ["物事の最高点や絶頂期を表すとき"],
                 examples: [
                    ("Peak performance.", "ピークパフォーマンス。"),
                    ("Reach the peak.", "頂点に達する。")
                 ]),
            make("ever told", "have ever said to someone",
                 "今までに〜と言われた",
                 useCases: ["過去に誰かから言われた経験を尋ねるとき"],
                 examples: [
                    ("Best advice I've ever told.", "私が言った中で最高の助言。"),
                    ("Have I ever told you ~?", "今までに〜って話したっけ?")
                 ])
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
                 ]),
            make("greatest", "the most outstanding",
                 "最も偉大な・最高の",
                 useCases: ["史上最高や最も優れたものを表すとき"],
                 examples: [
                    ("The greatest of all time.", "史上最高。"),
                    ("My greatest love.", "私の最愛。")
                 ]),
            make("heartfelt", "deeply sincere",
                 "心からの",
                 useCases: ["感情がこもった言葉や行動を表すとき"],
                 examples: [
                    ("Heartfelt apology.", "心からの謝罪。"),
                    ("Heartfelt thanks.", "心からの感謝。")
                 ]),
            make("as light", "as a lightly as; light as ~",
                 "〜と同じくらい軽い",
                 useCases: ["軽さを比較するとき(as light as a feather など)"],
                 examples: [
                    ("As light as a feather.", "羽根のように軽い。"),
                    ("As light as air.", "空気のように軽やか。")
                 ]),
            make("youth", "the period of being young",
                 "若さ・青春",
                 useCases: ["若い時期や若者を表すとき"],
                 examples: [
                    ("In my youth.", "若い頃に。"),
                    ("The youth of today.", "今の若者。")
                 ]),
            make("adolescence", "the transitional stage to adulthood",
                 "思春期・青年期",
                 useCases: ["子供から大人への移行期を表すとき"],
                 examples: [
                    ("Adolescence is tough.", "思春期は大変。"),
                    ("Late adolescence.", "青年期後半。")
                 ]),
            make("kindness", "the quality of being kind",
                 "優しさ・親切",
                 useCases: ["他人への思いやりや親切な行為を表すとき"],
                 examples: [
                    ("Act of kindness.", "親切な行為。"),
                    ("Kindness goes a long way.", "優しさは大きな力を持つ。")
                 ])
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
                 ]),
            make("be done with", "have finished or had enough",
                 "〜を終える・〜にうんざり",
                 useCases: ["完了、または見限るとき"],
                 examples: [
                    ("I'm done with homework.", "宿題終わった。"),
                    ("Done with this drama.", "この騒ぎはもう終わり。")
                 ]),
            make("design", "create a plan or pattern",
                 "デザインする・設計する",
                 useCases: ["見た目や仕組みを計画的に作るとき"],
                 examples: [
                    ("Design a logo.", "ロゴをデザインする。"),
                    ("Designed by ~", "〜が設計。")
                 ]),
            make("remake", "make again or anew",
                 "作り直す・リメイク",
                 useCases: ["映画やゲームなどを新しく作り直すとき"],
                 examples: [
                    ("Remake of the classic.", "名作のリメイク。"),
                    ("Let's remake it.", "作り直そう。")
                 ]),
            make("remembering", "calling to mind",
                 "思い出すこと",
                 useCases: ["記憶を呼び起こす行為そのものを表すとき"],
                 examples: [
                    ("Remembering the past.", "過去を思い出すこと。"),
                    ("Just remembering you.", "君を思い出しているだけ。")
                 ]),
            make("adore", "love deeply",
                 "とても愛する・崇拝する",
                 useCases: ["強い愛情や敬愛を表すとき"],
                 examples: [
                    ("I adore her.", "彼女が大好き。"),
                    ("Adored by fans.", "ファンに愛されている。")
                 ]),
            make("injure", "cause physical harm",
                 "怪我をさせる",
                 useCases: ["人や動物に身体的損傷を与えるとき(動詞)"],
                 examples: [
                    ("Injured in the accident.", "事故で負傷。"),
                    ("Don't injure yourself.", "怪我しないで。")
                 ]),
            make("feature", "highlight as a special attribute",
                 "特徴・取り上げる",
                 useCases: ["特徴の名詞や、何かを目立たせる動詞として"],
                 examples: [
                    ("Key feature.", "重要な特徴。"),
                    ("Featuring a special guest.", "特別ゲストを迎えて。")
                 ]),
            make("sprinkle", "scatter in small amounts",
                 "振りかける・少しまく",
                 useCases: ["塩や砂糖を散らす、または雨が小降りなとき"],
                 examples: [
                    ("Sprinkle salt.", "塩を振る。"),
                    ("A light sprinkle of rain.", "小雨。")
                 ]),
            make("plus", "in addition; positive aspect",
                 "プラス・しかも",
                 useCases: ["追加の利点や情報を述べるとき"],
                 examples: [
                    ("Plus, it's free!", "しかも無料!"),
                    ("A definite plus.", "明らかなプラス。")
                 ])
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
                 ]),
            make("recipe", "instructions for preparing food",
                 "レシピ・処方",
                 useCases: ["料理の手順や成功の秘訣を表すとき"],
                 examples: [
                    ("Family recipe.", "家伝のレシピ。"),
                    ("Recipe for disaster.", "失敗の元(慣用)。")
                 ]),
            make("fun fact", "an interesting bit of trivia",
                 "ちょっとした豆知識",
                 useCases: ["雑学やトリビアを紹介するとき"],
                 examples: [
                    ("Fun fact: ~", "豆知識: 〜"),
                    ("Here's a fun fact.", "ちょっとした豆知識。")
                 ]),
            make("unreal", "amazing; not real",
                 "信じられない・非現実的な",
                 useCases: ["驚くほど素晴らしい、または非現実的なものを表すとき"],
                 examples: [
                    ("That's unreal!", "信じられない!"),
                    ("Unreal beauty.", "現実離れした美しさ。")
                 ]),
            make("every single", "absolutely every one",
                 "〜の一つ一つ全て",
                 useCases: ["漏れなく全部であることを強調するとき"],
                 examples: [
                    ("Every single day.", "毎日欠かさず。"),
                    ("Every single one.", "一つ残らず。")
                 ]),
            make("permanent", "lasting indefinitely",
                 "永続的な",
                 useCases: ["変わらず長く続くものを表すとき"],
                 examples: [
                    ("Permanent job.", "正社員。"),
                    ("Permanent change.", "永続的な変化。")
                 ]),
            make("next up", "the next thing to come",
                 "次は・お次は",
                 useCases: ["順番が来た次の人や物を紹介するとき"],
                 examples: [
                    ("Next up: dessert.", "お次はデザート。"),
                    ("Next up on the list.", "リストの次。")
                 ]),
            make("badge", "an emblem or mark of achievement",
                 "バッジ・記章",
                 useCases: ["所属や達成を示すバッジを表すとき"],
                 examples: [
                    ("Wear the badge.", "バッジを着ける。"),
                    ("Badge of honor.", "名誉のバッジ。")
                 ]),
            make("from the beginning", "from the start",
                 "最初から",
                 useCases: ["ある時点を起点に説明するとき"],
                 examples: [
                    ("Tell me from the beginning.", "最初から話して。"),
                    ("Knew it from the beginning.", "最初から知ってた。")
                 ]),
            make("worth", "having value; deserving of",
                 "〜の価値がある・値する",
                 useCases: ["価値や見合った価値があることを表すとき"],
                 examples: [
                    ("Worth a try.", "試す価値あり。"),
                    ("Net worth.", "純資産。")
                 ])
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
                 ]),
            make("change up", "alter or vary",
                 "変える・刷新する",
                 useCases: ["日常やルーティンを変えるとき"],
                 examples: [
                    ("Change up the routine.", "ルーティンを変える。"),
                    ("Let's change it up.", "刷新しよう。")
                 ]),
            make("obtain", "acquire or get",
                 "得る・入手する",
                 useCases: ["努力や手続きで何かを手に入れるとき"],
                 examples: [
                    ("Obtain a permit.", "許可を取得する。"),
                    ("Information was obtained.", "情報を入手した。")
                 ]),
            make("reward", "give in recognition of effort",
                 "報酬・報いる",
                 useCases: ["努力や貢献に対する見返りを表すとき"],
                 examples: [
                    ("Hard work has its rewards.", "努力は報われる。"),
                    ("Reward yourself.", "自分にご褒美を。")
                 ]),
            make("glorify", "give praise or higher honor",
                 "美化する・賛美する",
                 useCases: ["過度に持ち上げる、または神聖視するとき"],
                 examples: [
                    ("Glorify violence.", "暴力を美化する。"),
                    ("Glorified version.", "美化された姿。")
                 ]),
            make("trash sth", "throw away; criticize harshly",
                 "捨てる・酷評する",
                 useCases: ["物を捨てる、または激しく批判するとき"],
                 examples: [
                    ("Trash the old papers.", "古い書類を捨てる。"),
                    ("Critics trashed the movie.", "批評家が映画を酷評した。")
                 ]),
            make("start all over", "begin again from scratch",
                 "最初からやり直す",
                 useCases: ["完全にゼロから再スタートするとき"],
                 examples: [
                    ("Let's start all over.", "最初からやり直そう。"),
                    ("Start all over again.", "もう一度ゼロから。")
                 ]),
            make("be cool with", "be okay with",
                 "〜で大丈夫・〜に異論ない",
                 useCases: ["何かを了承する・受け入れるカジュアル表現"],
                 examples: [
                    ("I'm cool with that.", "それでいいよ。"),
                    ("Are you cool with this plan?", "この案で大丈夫?")
                 ]),
            make("you gotta", "you have to",
                 "君は〜しなきゃ",
                 useCases: ["くだけた口語で「〜すべき」を伝えるとき"],
                 examples: [
                    ("You gotta try this.", "これは試さなきゃ。"),
                    ("You gotta be kidding.", "冗談だろう。")
                 ]),
            make("saved", "rescued; stored",
                 "救われた・保存された",
                 useCases: ["助けられた、または記録として保存された状態"],
                 examples: [
                    ("You saved me!", "助かった!"),
                    ("Files are saved.", "ファイルは保存済み。")
                 ])
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
                 ]),
            make("unnecessarily", "in a way that is not needed",
                 "不必要に",
                 useCases: ["余計にしている度合いを表すとき"],
                 examples: [
                    ("Unnecessarily complicated.", "無駄に複雑。"),
                    ("Don't worry unnecessarily.", "余計に心配しないで。")
                 ]),
            make("consuming", "using up; taking time/attention",
                 "消費する・時間/注意を奪う",
                 useCases: ["時間や精神を多く費やすことを表すとき"],
                 examples: [
                    ("Time-consuming.", "時間がかかる。"),
                    ("All-consuming passion.", "全てを注ぐ情熱。")
                 ]),
            make("that would be", "that is going to be / that's likely",
                 "それは〜だね・〜になる",
                 useCases: ["想定や答えを述べるとき"],
                 examples: [
                    ("That would be great!", "それいいね!"),
                    ("That would be a mistake.", "それは間違いになる。")
                 ]),
            make("great", "excellent; very good",
                 "素晴らしい・偉大な",
                 useCases: ["賛辞や量の多さを表すとき"],
                 examples: [
                    ("That's great!", "素晴らしい!"),
                    ("Great achievement.", "偉大な功績。")
                 ]),
            make("effect", "a change produced by action",
                 "効果・影響",
                 useCases: ["原因の結果として生じる変化を表すとき"],
                 examples: [
                    ("Side effect.", "副作用。"),
                    ("Take effect.", "効力を発する。")
                 ]),
            make("dumb", "stupid; unable to speak",
                 "馬鹿げた・口がきけない",
                 useCases: ["愚かさを表すスラング、または無言を表すとき"],
                 examples: [
                    ("That's so dumb.", "それマジで馬鹿げてる。"),
                    ("Dumbfounded.", "唖然とした。")
                 ]),
            make("brutal", "savage; harsh",
                 "残忍な・容赦のない",
                 useCases: ["過酷さや厳しさを表すとき"],
                 examples: [
                    ("Brutal workout.", "ハードなトレーニング。"),
                    ("Brutal honesty.", "残酷な正直さ。")
                 ]),
            make("as a whole", "considered all together",
                 "全体として",
                 useCases: ["全体を一つの単位として捉えるとき"],
                 examples: [
                    ("Society as a whole.", "社会全体として。"),
                    ("Looking at it as a whole.", "全体として見ると。")
                 ]),
            make("mutant", "an organism with a mutation",
                 "突然変異体・ミュータント",
                 useCases: ["生物学的な変異体、またはフィクションの変身者"],
                 examples: [
                    ("Mutant virus.", "変異ウイルス。"),
                    ("X-Men are mutants.", "X-メンは変異体。")
                 ])
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
                 ]),
            make("I guess it depends on sth", "it varies depending on",
                 "それは〜次第かな",
                 useCases: ["条件次第で答えが変わるとき"],
                 examples: [
                    ("I guess it depends on the price.", "値段次第かな。"),
                    ("It depends on the weather.", "天気次第。")
                 ]),
            make("I have a body / brain", "I also need physical/mental care",
                 "私にも体/脳がある(同じ人間だ)",
                 useCases: ["自分も人間として扱われたい・休みたいと訴えるとき"],
                 examples: [
                    ("I have a body too — let me rest.", "私だって体があるんだ、休ませて。"),
                    ("I have a brain — let me think.", "私にも頭があるんだから考えさせて。")
                 ]),
            make("not as easy as it looks", "harder than it appears",
                 "見た目ほど簡単じゃない",
                 useCases: ["簡単そうに見えるが実は難しいことを言うとき"],
                 examples: [
                    ("It's not as easy as it looks.", "見た目ほど簡単じゃない。"),
                    ("Trust me, not as easy as it looks.", "本当に、見かけほど楽じゃない。")
                 ]),
            make("I can't function without sth", "I rely heavily on something",
                 "〜なしじゃやっていけない",
                 useCases: ["何かが生活や仕事に不可欠だと強調するとき"],
                 examples: [
                    ("I can't function without coffee.", "コーヒーなしじゃ動けない。"),
                    ("Can't function without my phone.", "スマホなしじゃ生きられない。")
                 ])
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
                 ]),
            make("confess", "admit something privately",
                 "告白する・白状する",
                 useCases: ["秘密や罪を打ち明けるとき"],
                 examples: [
                    ("He confessed his love.", "彼は愛を告白した。"),
                    ("Confess your sins.", "罪を告白して。")
                 ]),
            make("flirt", "behave amorously without serious intent",
                 "イチャつく・気を引く",
                 useCases: ["恋愛感情を匂わせる振る舞いを表すとき"],
                 examples: [
                    ("Stop flirting!", "ナンパやめて!"),
                    ("She's flirting with him.", "彼女、彼と楽しそうに話してる。")
                 ]),
            make("take opportunity", "use a chance",
                 "機会を利用する",
                 useCases: ["訪れた好機を活かすとき"],
                 examples: [
                    ("Take this opportunity to ~", "この機会に〜"),
                    ("She took the opportunity.", "彼女はチャンスをものにした。")
                 ]),
            make("climb", "go up by gripping or stepping",
                 "登る・上昇する",
                 useCases: ["物理的に登る、または順位・価値が上がるとき"],
                 examples: [
                    ("Climb the mountain.", "山を登る。"),
                    ("Climb the ranks.", "出世の階段を登る。")
                 ]),
            make("thrust", "push with force",
                 "強く押す・突き出す",
                 useCases: ["物理的に強く押す、または比喩的に立場を押し付けるとき"],
                 examples: [
                    ("Thrust the door open.", "ドアを押し開ける。"),
                    ("Thrust into the spotlight.", "脚光を浴びさせられる。")
                 ]),
            make("come down", "descend; fall (price, rain etc.)",
                 "降りる・下がる",
                 useCases: ["物理的に降りる、価格が下がる、雨が降るときなど"],
                 examples: [
                    ("Come down from there.", "そこから降りて。"),
                    ("Prices are coming down.", "値段が下がってる。")
                 ]),
            make("wear sth", "have on the body",
                 "(衣服などを)身につける",
                 useCases: ["服や装飾品を着用するとき"],
                 examples: [
                    ("Wear a mask.", "マスクをして。"),
                    ("She wears glasses.", "彼女はメガネをかけている。")
                 ])
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
                 ]),
            make("grounded", "well-balanced; punished by staying home",
                 "地に足のついた・外出禁止",
                 useCases: ["安定した性格、または外出禁止のお仕置きを表すとき"],
                 examples: [
                    ("She's so grounded.", "彼女は地に足が着いてる。"),
                    ("You're grounded!", "外出禁止だよ!")
                 ]),
            make("getting adjective", "becoming (adj) - going through a change",
                 "〜になりつつある(get + 形容詞)",
                 useCases: ["状態がだんだん変わっていくときの構文(getting tired等)"],
                 examples: [
                    ("Getting tired.", "疲れてきた。"),
                    ("It's getting cold.", "寒くなってきた。")
                 ]),
            make("guilt-trip", "make someone feel guilty",
                 "罪悪感を抱かせる",
                 useCases: ["相手を遠回しに責めて罪の意識を持たせるとき"],
                 examples: [
                    ("Stop guilt-tripping me.", "罪悪感を植え付けないで。"),
                    ("Classic guilt trip.", "典型的な罪悪感攻撃。")
                 ]),
            make("tipsy", "slightly drunk",
                 "ほろ酔いの",
                 useCases: ["軽くお酒が入った気持ちのいい状態を表すとき"],
                 examples: [
                    ("Feeling tipsy.", "ほろ酔い気分。"),
                    ("A bit tipsy.", "ちょっと酔ってる。")
                 ]),
            make("random", "happening without pattern",
                 "ランダムな・脈絡のない",
                 useCases: ["脈絡なく起こることや、知らない人を指すとき"],
                 examples: [
                    ("That's so random!", "脈絡なさすぎ!"),
                    ("Some random guy.", "知らない男性。")
                 ]),
            make("obviously", "clearly; evidently",
                 "明らかに・当然",
                 useCases: ["明白なことを強調するとき"],
                 examples: [
                    ("Obviously, yes.", "当然イエス。"),
                    ("Obviously upset.", "明らかに怒ってる。")
                 ]),
            make("all good", "everything is fine",
                 "全部大丈夫・問題ない",
                 useCases: ["「気にしないで」「全然OK」のカジュアル返答"],
                 examples: [
                    ("It's all good.", "全部OK。"),
                    ("All good, no worries.", "大丈夫、気にしないで。")
                 ])
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
                 ]),
            make("I was like", "I sort of said/thought",
                 "私は〜って感じだった",
                 useCases: ["自分の発言や反応を再現するカジュアル表現"],
                 examples: [
                    ("I was like, no way!", "私『嘘でしょ!』って感じ。"),
                    ("She was like, whatever.", "彼女『どうでもいい』って感じ。")
                 ]),
            make("in my dream", "in my imagination only",
                 "私の夢の中で・空想で",
                 useCases: ["夢で起きたこと、または願望を表すとき"],
                 examples: [
                    ("In my dream, I could fly.", "夢の中で空を飛べた。"),
                    ("Only in my dream.", "夢の中だけの話。")
                 ]),
            make("all this", "everything happening here",
                 "これ全部・このすべて",
                 useCases: ["目の前の状況や物事をひとくくりに指すとき"],
                 examples: [
                    ("After all this, you quit?", "ここまで来て辞めるの?"),
                    ("All this is for you.", "これ全部君のため。")
                 ]),
            make("I have not", "I haven't (formal)",
                 "私はまだ〜していない",
                 useCases: ["I haven't のフォーマル/強調形"],
                 examples: [
                    ("I have not decided yet.", "まだ決めていません。"),
                    ("No, I have not.", "いいえ、していません。")
                 ]),
            make("if you ever need", "should you ever require",
                 "もし必要があれば",
                 useCases: ["将来の援助を申し出るとき"],
                 examples: [
                    ("If you ever need help, call me.", "助けが必要なら電話して。"),
                    ("If you ever need anything ~", "何かあったら〜")
                 ]),
            make("as you can see", "as is visible",
                 "ご覧の通り",
                 useCases: ["プレゼンや説明で見えている内容を指すとき"],
                 examples: [
                    ("As you can see, sales are up.", "ご覧の通り売上が上昇。"),
                    ("As you can see in the chart, ~", "図の通り〜")
                 ]),
            make("this is how you do it", "here's the method",
                 "こうやってやるんだよ",
                 useCases: ["やり方を実演しながら教えるとき"],
                 examples: [
                    ("Watch — this is how you do it.", "見て、こうやるんだ。"),
                    ("This is how you do it properly.", "正しいやり方はこう。")
                 ])
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
                 ]),
            make("apartment", "a self-contained housing unit",
                 "アパート・マンション(米)",
                 useCases: ["集合住宅の一区画を表すとき"],
                 examples: [
                    ("My apartment is small.", "うちのアパートは狭い。"),
                    ("Apartment hunting.", "物件探し中。")
                 ]),
            make("rest of", "the remaining part",
                 "残りの〜",
                 useCases: ["全体から一部を除いた残りを表すとき"],
                 examples: [
                    ("The rest of the day.", "残りの一日。"),
                    ("Rest of the world.", "世界の他の地域。")
                 ]),
            make("farm", "land for growing crops or raising animals",
                 "農場・農業",
                 useCases: ["農地や動物を育てる場所を表すとき"],
                 examples: [
                    ("On the farm.", "農場で。"),
                    ("Farm to table.", "農場から食卓へ。")
                 ]),
            make("spare time", "free time",
                 "暇な時間・自由時間",
                 useCases: ["仕事や義務の合間に空いた時間を表すとき"],
                 examples: [
                    ("In my spare time, I read.", "暇な時は本を読む。"),
                    ("Got any spare time?", "暇ある?")
                 ]),
            make("apparently", "seemingly; it appears that",
                 "どうやら・聞くところによると",
                 useCases: ["伝聞や見た目から判断するとき"],
                 examples: [
                    ("Apparently, he's coming.", "どうやら彼は来る。"),
                    ("Apparently not.", "違うらしい。")
                 ]),
            make("everything is clear", "all is understood",
                 "全部はっきりしている・了解",
                 useCases: ["状況・指示が完全に分かったときに返事として"],
                 examples: [
                    ("Everything is clear, thanks.", "全部分かりました、ありがとう。"),
                    ("Now everything is clear.", "もう全部はっきりした。")
                 ])
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
                 ]),
            make("contain", "include or hold within",
                 "含む・抑える",
                 useCases: ["要素が含まれている、または感情・拡散を抑え込むとき"],
                 examples: [
                    ("This contains nuts.", "ナッツが入ってる。"),
                    ("Contain the spread.", "拡散を抑える。")
                 ]),
            make("buyout", "purchase of a company or stake",
                 "買収・買い取り",
                 useCases: ["企業や株主の持ち分を全て買い取るとき"],
                 examples: [
                    ("Management buyout.", "MBO・経営陣による買収。"),
                    ("A buyout offer.", "買収提案。")
                 ]),
            make("enterprise", "a business or initiative",
                 "企業・事業",
                 useCases: ["大規模なビジネスや組織を表すとき"],
                 examples: [
                    ("Free enterprise.", "自由企業制。"),
                    ("Enterprise software.", "企業向けソフト。")
                 ]),
            make("institute", "an organization for promoting a cause",
                 "機関・協会・(制度を)導入する",
                 useCases: ["研究機関や、制度の導入を表すとき"],
                 examples: [
                    ("Research institute.", "研究機関。"),
                    ("Institute a new policy.", "新方針を導入。")
                 ]),
            make("estate", "extensive land or real property",
                 "地所・遺産",
                 useCases: ["不動産や遺された財産を表すとき"],
                 examples: [
                    ("Real estate.", "不動産。"),
                    ("Family estate.", "一族の所有地・遺産。")
                 ]),
            make("section", "a distinct part",
                 "区画・部門",
                 useCases: ["文書・建物・組織の一部を表すとき"],
                 examples: [
                    ("Section 5.", "第5節。"),
                    ("Sports section.", "スポーツ欄。")
                 ]),
            make("team up", "join forces with",
                 "チームを組む・協力する",
                 useCases: ["共通の目的のために協力するとき"],
                 examples: [
                    ("Team up with him.", "彼と組もう。"),
                    ("Let's team up!", "協力しよう!")
                 ])
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
                 ]),
            make("provoke", "stimulate or anger",
                 "挑発する・引き起こす",
                 useCases: ["反応や怒りを引き起こすとき"],
                 examples: [
                    ("Don't provoke him.", "彼を挑発するな。"),
                    ("Provoke a response.", "反応を引き出す。")
                 ]),
            make("select", "carefully choose",
                 "選ぶ・選抜する",
                 useCases: ["候補から慎重に選び抜くとき"],
                 examples: [
                    ("Select an option.", "選択肢を選んで。"),
                    ("Selected for the team.", "チームに選抜された。")
                 ]),
            make("buy into", "accept as true; invest in",
                 "(考えを)信じる・投資する",
                 useCases: ["人の意見や計画を受け入れるとき"],
                 examples: [
                    ("I don't buy into that.", "それは信じない。"),
                    ("Buy into the company.", "会社に出資する。")
                 ]),
            make("be into V-ing", "be enthusiastic about doing",
                 "〜することにハマっている",
                 useCases: ["何かの活動に夢中であることを表すとき"],
                 examples: [
                    ("I'm into running these days.", "最近ランニングにハマってる。"),
                    ("She's into baking.", "彼女はお菓子作りにハマってる。")
                 ]),
            make("go out of one's way", "make a special effort",
                 "わざわざ〜する",
                 useCases: ["普段の範囲を超えて努力するとき"],
                 examples: [
                    ("He went out of his way to help.", "彼はわざわざ助けてくれた。"),
                    ("Don't go out of your way.", "無理しないで。")
                 ]),
            make("destine", "intend or set apart for a purpose",
                 "運命づける・予定する",
                 useCases: ["運命や予定として何かが定められているとき"],
                 examples: [
                    ("Destined for greatness.", "偉大なる運命。"),
                    ("Destined to fail.", "失敗の運命。")
                 ])
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
                 ]),
            make("speak of the devil", "the person being talked about appears",
                 "うわさをすれば",
                 useCases: ["話題にしていた人が現れた瞬間に使う決まり文句"],
                 examples: [
                    ("Speak of the devil!", "うわさをすれば!"),
                    ("Well, speak of the devil — there he is.", "うわさをすれば本人登場。")
                 ]),
            make("get something out of my system", "release pent-up urges",
                 "(欲求などを)発散する・スッキリさせる",
                 useCases: ["やりたいことや言いたいことを一旦やって気を済ますとき"],
                 examples: [
                    ("I had to get it out of my system.", "発散しなきゃ気が済まなかった。"),
                    ("Get the anger out of your system.", "怒りを発散して。")
                 ]),
            make("when it rains it pours", "troubles come all at once",
                 "降れば土砂降り(悪いことは重なる)",
                 useCases: ["不運が立て続けに起こる状況を表すとき"],
                 examples: [
                    ("Lost my keys, then my wallet — when it rains, it pours.", "鍵失くした、財布も。本当に重なる時は重なる。"),
                    ("When it rains, it pours.", "悪いことは続くもの。")
                 ]),
            make("pick your brain", "ask someone for their ideas",
                 "(知恵を)拝借する・意見を聞く",
                 useCases: ["相手の専門知識やアイデアを聞きたいとき"],
                 examples: [
                    ("Can I pick your brain?", "ちょっと知恵を貸してくれる?"),
                    ("Let me pick your brain about ~", "〜について意見を聞かせて。")
                 ]),
            make("go the whole nine yards", "do everything possible",
                 "とことんやる・完全にやり遂げる",
                 useCases: ["全力で取り組むことを表すとき"],
                 examples: [
                    ("She went the whole nine yards.", "彼女は徹底的にやり切った。"),
                    ("Let's go the whole nine yards.", "とことんやろう。")
                 ]),
            make("never mind", "forget it; don't worry",
                 "気にしないで・なんでもない",
                 useCases: ["前言を撤回したり相手を安心させたりするとき"],
                 examples: [
                    ("Never mind, it's fine.", "気にしないで、大丈夫。"),
                    ("Never mind what I said.", "今のは忘れて。")
                 ]),
            make("kidding", "joking",
                 "冗談を言っている",
                 useCases: ["冗談だと伝えるとき"],
                 examples: [
                    ("Just kidding!", "冗談だよ!"),
                    ("Are you kidding me?", "冗談だろ?")
                 ])
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
                 ]),
            make("right back", "returning very soon",
                 "すぐ戻る・すぐにそちらへ",
                 useCases: ["短時間で戻ることを伝えるとき"],
                 examples: [
                    ("I'll be right back.", "すぐ戻る。"),
                    ("Right back at you!", "そっちこそ!")
                 ]),
            make("in real life", "in actual reality (not online)",
                 "現実世界では・リアルでは",
                 useCases: ["ネット・ゲームの中と対比して実世界を指すとき(IRL)"],
                 examples: [
                    ("Meet in real life.", "リアルで会う。"),
                    ("He's nice in real life.", "彼、実生活ではいい人。")
                 ]),
            make("for your information", "just so you know (FYI)",
                 "ご参考までに・念のため",
                 useCases: ["情報を提供する前置き、または軽い反論として"],
                 examples: [
                    ("For your information, I was busy.", "念のため、忙しかったんだ。"),
                    ("FYI, the meeting moved.", "ご参考まで、会議が移動。")
                 ]),
            make("reference", "a source or mention",
                 "参考・言及・推薦",
                 useCases: ["資料・推薦状・話題の参照を表すとき"],
                 examples: [
                    ("For reference.", "参考までに。"),
                    ("Cultural reference.", "文化的な言及。")
                 ]),
            make("insomnia", "inability to sleep",
                 "不眠症",
                 useCases: ["眠れない症状を表すとき"],
                 examples: [
                    ("Suffer from insomnia.", "不眠症に悩む。"),
                    ("Bad case of insomnia.", "ひどい不眠。")
                 ]),
            make("imagination", "the faculty of forming ideas",
                 "想像力",
                 useCases: ["創造的に思い描く力を表すとき"],
                 examples: [
                    ("Use your imagination.", "想像力を使って。"),
                    ("Wild imagination.", "豊かな想像力。")
                 ]),
            make("intuition", "instinctive understanding",
                 "直感",
                 useCases: ["理屈ではなく感覚で理解する能力を表すとき"],
                 examples: [
                    ("Trust your intuition.", "直感を信じて。"),
                    ("Woman's intuition.", "女の直感。")
                 ])
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
                 ]),
            make("aim for", "set as a goal",
                 "〜を目指す",
                 useCases: ["目標を定めて努力するとき"],
                 examples: [
                    ("Aim for the top.", "頂上を目指せ。"),
                    ("Aim for excellence.", "卓越を目指す。")
                 ]),
            make("examine", "inspect closely",
                 "詳しく調べる・診察する",
                 useCases: ["医療や調査で精査するとき"],
                 examples: [
                    ("Examine the evidence.", "証拠を精査する。"),
                    ("Doctor examined me.", "医者に診てもらった。")
                 ]),
            make("halt", "bring to an abrupt stop",
                 "停止する・中止する",
                 useCases: ["動きや活動を急に止めるとき"],
                 examples: [
                    ("Halt the production.", "生産を停止する。"),
                    ("Come to a halt.", "停止する。")
                 ]),
            make("suspend", "stop temporarily; hang",
                 "一時停止する・吊るす",
                 useCases: ["業務や決定を一時保留する、または物を吊るすとき"],
                 examples: [
                    ("Suspend the meeting.", "会議を中断する。"),
                    ("Suspended from school.", "停学処分。")
                 ]),
            make("amplify", "increase the volume or effect",
                 "増幅する・強化する",
                 useCases: ["音や影響を大きくするとき"],
                 examples: [
                    ("Amplify the sound.", "音を大きくする。"),
                    ("Amplify the message.", "メッセージを広める。")
                 ]),
            make("boil", "heat to bubbling point",
                 "沸騰させる・茹でる",
                 useCases: ["水や液体を沸かす、または感情の比喩"],
                 examples: [
                    ("Boil the water.", "お湯を沸かす。"),
                    ("Blood was boiling.", "血が煮えくり返った。")
                 ]),
            make("polish", "make shiny by rubbing; refine",
                 "磨く・洗練させる",
                 useCases: ["物を磨く、または文章・技術を洗練するとき"],
                 examples: [
                    ("Polish the shoes.", "靴を磨く。"),
                    ("Polish your speech.", "スピーチを洗練させる。")
                 ]),
            make("hike", "a long walk; to raise sharply",
                 "ハイキング・(価格を)引き上げる",
                 useCases: ["長距離の散歩や、料金の値上げを表すとき"],
                 examples: [
                    ("Go on a hike.", "ハイキングに行く。"),
                    ("Price hike.", "値上げ。")
                 ]),
            make("photograph", "an image; to take a picture",
                 "写真・写真を撮る",
                 useCases: ["記念や記録の写真を表すとき"],
                 examples: [
                    ("Family photograph.", "家族写真。"),
                    ("Photograph the scenery.", "景色を撮影。")
                 ])
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
                 ]),
            make("brand new", "completely new",
                 "新品の・真新しい",
                 useCases: ["買ったばかり、または完全に新しいものを表すとき"],
                 examples: [
                    ("Brand new car.", "新車。"),
                    ("Brand new feature.", "新機能。")
                 ]),
            make("chilly", "moderately cold",
                 "肌寒い",
                 useCases: ["寒すぎず少し涼しい気温を表すとき"],
                 examples: [
                    ("A chilly morning.", "肌寒い朝。"),
                    ("It's chilly outside.", "外は肌寒い。")
                 ]),
            make("freezing", "extremely cold",
                 "凍えるほど寒い",
                 useCases: ["極めて寒い気温を表すとき"],
                 examples: [
                    ("It's freezing!", "凍えるほど寒い!"),
                    ("Freezing temperatures.", "氷点下の気温。")
                 ]),
            make("dim", "not bright",
                 "薄暗い・薄い",
                 useCases: ["光が弱い、または認識が薄いことを表すとき"],
                 examples: [
                    ("Dim lights.", "薄暗い照明。"),
                    ("A dim memory.", "おぼろげな記憶。")
                 ]),
            make("squishy", "soft and easily squashed",
                 "ぐにゃぐにゃの・ぷにぷにの",
                 useCases: ["柔らかくて押し潰せる感触を表すとき"],
                 examples: [
                    ("Squishy toy.", "ぷにぷにのおもちゃ。"),
                    ("Squishy texture.", "ぷにぷにした感触。")
                 ]),
            make("rock hard", "extremely hard",
                 "石のように硬い",
                 useCases: ["非常に硬い物の質感を表すとき"],
                 examples: [
                    ("Rock hard muscles.", "石のような筋肉。"),
                    ("Rock hard bread.", "カチカチのパン。")
                 ]),
            make("striking", "very noticeable; impressive",
                 "印象的な・目を引く",
                 useCases: ["際立つ美しさや特徴を表すとき"],
                 examples: [
                    ("Striking beauty.", "目を引く美しさ。"),
                    ("Striking similarity.", "驚くほど似てる。")
                 ]),
            make("graceful", "moving with elegance",
                 "優雅な",
                 useCases: ["上品で美しい動きや態度を表すとき"],
                 examples: [
                    ("Graceful dancer.", "優雅なダンサー。"),
                    ("Graceful movement.", "優美な動き。")
                 ]),
            make("terrible", "extremely bad",
                 "ひどい・最悪な",
                 useCases: ["強い不快感や悪さを表すとき"],
                 examples: [
                    ("Terrible weather.", "最悪な天気。"),
                    ("I feel terrible.", "気分が最悪。")
                 ])
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
                 ]),
            make("apron", "a protective garment worn over clothes",
                 "エプロン",
                 useCases: ["料理や作業時に衣服を守る前掛けを表すとき"],
                 examples: [
                    ("Wear an apron.", "エプロンを着けて。"),
                    ("Chef's apron.", "シェフのエプロン。")
                 ]),
            make("can opener", "a tool for opening cans",
                 "缶切り",
                 useCases: ["缶詰を開ける道具"],
                 examples: [
                    ("Use the can opener.", "缶切りを使って。"),
                    ("Electric can opener.", "電動缶切り。")
                 ]),
            make("buff", "polish; a fan or muscular person",
                 "磨く・愛好家・筋肉質の",
                 useCases: ["磨く動作、ファン、または鍛えられた体を表すとき"],
                 examples: [
                    ("Buff the floor.", "床を磨く。"),
                    ("History buff.", "歴史愛好家。")
                 ]),
            make("dehumidifier", "a device that removes moisture from air",
                 "除湿機",
                 useCases: ["湿度を下げる家電を表すとき"],
                 examples: [
                    ("Run the dehumidifier.", "除湿機を稼働。"),
                    ("Need a dehumidifier.", "除湿機が必要。")
                 ]),
            make("outlet", "an electrical socket; a means of release",
                 "コンセント・はけ口",
                 useCases: ["電源差込口、または感情の発散先を表すとき"],
                 examples: [
                    ("Plug into the outlet.", "コンセントに差して。"),
                    ("Creative outlet.", "創造的なはけ口。")
                 ]),
            make("square", "a four-sided shape with equal sides",
                 "正方形・四角",
                 useCases: ["幾何学的な形や町の広場を表すとき"],
                 examples: [
                    ("Town square.", "町の広場。"),
                    ("Draw a square.", "正方形を描いて。")
                 ]),
            make("triangle", "a three-sided shape",
                 "三角形",
                 useCases: ["三辺の図形や三角関係を表すとき"],
                 examples: [
                    ("Draw a triangle.", "三角形を描いて。"),
                    ("Love triangle.", "三角関係。")
                 ]),
            make("cube", "a six-sided 3D shape",
                 "立方体・キューブ",
                 useCases: ["立体的な六面体を表すとき"],
                 examples: [
                    ("Ice cube.", "氷のキューブ。"),
                    ("Rubik's cube.", "ルービックキューブ。")
                 ]),
            make("cubicle", "a small partitioned space",
                 "間仕切りの個室・キュービクル",
                 useCases: ["オフィスの仕切られた個人スペースを表すとき"],
                 examples: [
                    ("Office cubicle.", "オフィスのキュービクル。"),
                    ("Stuck in a cubicle.", "個室作業漬け。")
                 ])
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
                 ]),
            make("saute", "fry briefly over high heat",
                 "ソテーする",
                 useCases: ["フライパンで短時間に炒める調理"],
                 examples: [
                    ("Saute the onions.", "玉ねぎをソテー。"),
                    ("Saute in butter.", "バターでソテー。")
                 ]),
            make("crayfish", "a freshwater crustacean",
                 "ザリガニ",
                 useCases: ["淡水に住む甲殻類を表すとき"],
                 examples: [
                    ("Catch crayfish.", "ザリガニを獲る。"),
                    ("Crayfish boil.", "ザリガニ茹で(料理)。")
                 ]),
            make("parrot", "a colorful talking bird",
                 "オウム",
                 useCases: ["話す鳥、または「人の言葉を繰り返す」比喩"],
                 examples: [
                    ("Talking parrot.", "おしゃべりオウム。"),
                    ("Don't parrot me.", "オウム返しするな。")
                 ]),
            make("equal", "the same in quantity or status",
                 "等しい・平等な",
                 useCases: ["量や立場が同じであることを表すとき"],
                 examples: [
                    ("Equal rights.", "平等な権利。"),
                    ("All men are equal.", "人は皆平等。")
                 ])
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
                 ]),
            make("infamous", "well-known for a bad reason",
                 "悪名高い",
                 useCases: ["悪い意味で有名なものを表すとき"],
                 examples: [
                    ("Infamous criminal.", "悪名高い犯罪者。"),
                    ("Infamous for ~", "〜で悪名高い。")
                 ]),
            make("epidemic", "a widespread outbreak of disease",
                 "(病気の)流行・蔓延",
                 useCases: ["特定地域で病気が広がる状況を表すとき"],
                 examples: [
                    ("Flu epidemic.", "インフル流行。"),
                    ("An epidemic of obesity.", "肥満の蔓延。")
                 ]),
            make("career", "a chosen occupation",
                 "キャリア・職業",
                 useCases: ["長期的な職業人生を表すとき"],
                 examples: [
                    ("Career path.", "キャリアパス。"),
                    ("Career change.", "転職。")
                 ]),
            make("height", "the measurement from base to top",
                 "高さ・身長",
                 useCases: ["人の身長や物の高さを表すとき"],
                 examples: [
                    ("What's your height?", "身長は?"),
                    ("Height of the building.", "建物の高さ。")
                 ]),
            make("indigenous", "originating naturally in a region",
                 "先住の・原産の",
                 useCases: ["先住民や原産の動植物を表すとき"],
                 examples: [
                    ("Indigenous people.", "先住民。"),
                    ("Indigenous to Japan.", "日本原産の。")
                 ])
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
                 ]),
            make("there is no way", "it's impossible that",
                 "〜のはずがない・ありえない",
                 useCases: ["強く否定するとき"],
                 examples: [
                    ("There is no way I'd do that.", "そんなことするわけない。"),
                    ("There's no way!", "ありえない!")
                 ]),
            make("I wonder if", "I'm not sure whether",
                 "〜かしら・〜だろうか",
                 useCases: ["控えめに疑問や推測を表すとき"],
                 examples: [
                    ("I wonder if it'll rain.", "雨かなぁ。"),
                    ("I wonder if she's home.", "彼女家にいるかな。")
                 ]),
            make("out of curiosity", "because I'm curious",
                 "好奇心から・ちょっと興味で",
                 useCases: ["余計な質問を控えめにする前置き"],
                 examples: [
                    ("Out of curiosity, how old are you?", "ちょっと興味なんだけど、何歳?"),
                    ("Just out of curiosity, ~", "好奇心からだけど〜")
                 ]),
            make("if that makes sense", "if that's clear",
                 "意味通じてれば・分かるかな",
                 useCases: ["説明後に相手の理解を確認するとき"],
                 examples: [
                    ("It's complicated, if that makes sense.", "複雑だけど、伝わるかな。"),
                    ("If that makes sense at all.", "もし通じてれば。")
                 ]),
            make("If I were to do", "if I happened to do",
                 "もし仮に〜するとしたら",
                 useCases: ["可能性の低い仮定をするとき"],
                 examples: [
                    ("If I were to quit, ~", "仮に辞めるとしたら〜"),
                    ("If I were to choose, ~", "選ぶとしたら〜")
                 ]),
            make("it's said that", "people say that",
                 "〜と言われている",
                 useCases: ["伝聞・通説を伝えるとき"],
                 examples: [
                    ("It's said that he's rich.", "彼は金持ちと言われている。"),
                    ("It's said that ~", "〜と言われている。")
                 ]),
            make("let's say", "suppose; for example",
                 "例えば・仮に",
                 useCases: ["仮定や例示の前置きとして"],
                 examples: [
                    ("Let's say it costs $100.", "例えば100ドルとすると。"),
                    ("Let's say you're right.", "仮に君が正しいとして。")
                 ]),
            make("more like", "actually more accurately",
                 "どちらかというと・むしろ",
                 useCases: ["相手の発言を訂正したり言い直したりするとき"],
                 examples: [
                    ("Tired? More like exhausted.", "疲れた?いや、ヘトヘトだよ。"),
                    ("It's more like blue than green.", "緑というよりは青。")
                 ])
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
                 ]),
            make("is worth V-ing", "deserves doing",
                 "〜する価値がある",
                 useCases: ["何かが価値のあることを表すとき"],
                 examples: [
                    ("This book is worth reading.", "この本は読む価値あり。"),
                    ("Worth trying.", "試す価値あり。")
                 ]),
            make("without V-ing", "not doing",
                 "〜せずに",
                 useCases: ["動作なしの状態を表すとき"],
                 examples: [
                    ("Without asking.", "尋ねずに。"),
                    ("Without saying a word.", "一言も言わずに。")
                 ]),
            make("with sth C", "with object + complement",
                 "〜を…の状態で(付帯状況)",
                 useCases: ["with + 目的語 + 補語の付帯状況構文"],
                 examples: [
                    ("With his eyes closed.", "目を閉じたまま。"),
                    ("With dinner ready.", "夕食ができた状態で。")
                 ]),
            make("What I like about sth", "the thing I appreciate is",
                 "〜について好きなのは",
                 useCases: ["人や物の好きな点を強調するとき"],
                 examples: [
                    ("What I like about him is his honesty.", "彼の好きなところは正直さ。"),
                    ("What I like about this place is the view.", "この場所の良さは景色。")
                 ]),
            make("when it comes to", "regarding; concerning",
                 "〜のこととなると",
                 useCases: ["特定の話題に焦点を絞るとき"],
                 examples: [
                    ("When it comes to cooking, she's the best.", "料理となると彼女が一番。"),
                    ("When it comes to money, ~", "お金のこととなると〜")
                 ]),
            make("be going to have to do", "will need to do",
                 "〜しなければならなくなる",
                 useCases: ["将来必要になるであろう行動を予測するとき"],
                 examples: [
                    ("You're going to have to leave.", "出なきゃならなくなるよ。"),
                    ("We're going to have to decide soon.", "そろそろ決めなきゃ。")
                 ]),
            make("the reason V-ing", "the cause of doing",
                 "〜する理由",
                 useCases: ["動名詞の前に置いて理由を表す構文"],
                 examples: [
                    ("The reason for crying.", "泣いている理由。"),
                    ("The reason for asking.", "尋ねる理由。")
                 ])
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
                 ]),
            make("what is called", "the thing referred to as",
                 "いわゆる〜",
                 useCases: ["俗に呼ばれる名称を紹介するとき"],
                 examples: [
                    ("This is what is called a vibe.", "これがいわゆる「雰囲気」。"),
                    ("It's what is called a classic.", "いわゆる定番。")
                 ]),
            make("fair point", "a reasonable argument",
                 "それは一理ある",
                 useCases: ["相手の意見を認めるとき"],
                 examples: [
                    ("Fair point.", "なるほど。"),
                    ("That's a fair point.", "一理ある。")
                 ]),
            make("more about", "additional information about",
                 "〜についてもっと",
                 useCases: ["話題の詳細を求める/提供するとき"],
                 examples: [
                    ("Tell me more about it.", "もっと教えて。"),
                    ("More about that later.", "詳しくは後ほど。")
                 ]),
            make("in general", "broadly speaking",
                 "一般的に・概して",
                 useCases: ["広く一般論を述べるとき"],
                 examples: [
                    ("In general, this is true.", "一般的に言って真実。"),
                    ("People in general.", "一般的な人々。")
                 ]),
            make("process", "a series of actions; treat formally",
                 "プロセス・処理する",
                 useCases: ["手順や情報・感情を処理することを表すとき"],
                 examples: [
                    ("Long process.", "長いプロセス。"),
                    ("Process the data.", "データを処理する。")
                 ]),
            make("instead", "in place of that",
                 "代わりに",
                 useCases: ["別の選択肢を提示するとき"],
                 examples: [
                    ("Tea instead of coffee.", "コーヒーじゃなくお茶を。"),
                    ("Go home instead.", "代わりに帰る。")
                 ]),
            make("if that works for you", "if it suits you",
                 "それで都合よければ",
                 useCases: ["提案を控えめに伝えるとき"],
                 examples: [
                    ("Friday at 3, if that works for you.", "金曜3時で都合よければ。"),
                    ("If that works for you, let me know.", "都合よければ教えて。")
                 ])
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
                 ]),
            make("go through sth", "examine or experience",
                 "〜に目を通す・〜を経験する",
                 useCases: ["書類などを精査するとき、または辛い経験"],
                 examples: [
                    ("Go through the report.", "報告書を読み込む。"),
                    ("Go through tough times.", "辛い時期を経験する。")
                 ]),
            make("clarify sth", "make clearer",
                 "〜を明確にする",
                 useCases: ["曖昧な点をはっきりさせるとき"],
                 examples: [
                    ("Clarify the point.", "要点を明確にする。"),
                    ("Let me clarify.", "明確にさせて。")
                 ]),
            make("just to confirm", "to verify briefly",
                 "念のため確認すると",
                 useCases: ["情報を再確認する前置きとして"],
                 examples: [
                    ("Just to confirm, 3 PM?", "念のため、3時で?"),
                    ("Just to confirm the schedule.", "予定の確認まで。")
                 ]),
            make("due", "expected by a certain time",
                 "期日の・〜の予定",
                 useCases: ["締切や予定日を表すとき"],
                 examples: [
                    ("Report due Friday.", "金曜が期日の報告書。"),
                    ("Due in May.", "5月予定。")
                 ]),
            make("meet up", "gather together",
                 "会う・集まる",
                 useCases: ["友人や同僚と落ち合うとき"],
                 examples: [
                    ("Let's meet up tomorrow.", "明日会おう。"),
                    ("Meet up at 5.", "5時に集合。")
                 ]),
            make("have a conflict", "have a scheduling clash",
                 "(予定が)かぶる",
                 useCases: ["既に他の予定があり都合がつかないとき"],
                 examples: [
                    ("I have a conflict that day.", "その日は予定がかぶる。"),
                    ("Sorry, have a conflict.", "ごめん、予定が重なってる。")
                 ]),
            make("assist sb with", "help someone with",
                 "〜を手伝う",
                 useCases: ["何かを手伝う依頼や申し出をするとき"],
                 examples: [
                    ("Can you assist me with this?", "これ手伝ってくれる?"),
                    ("Happy to assist you with anything.", "何でも喜んでお手伝い。")
                 ]),
            make("collaborate", "work jointly on",
                 "共同で取り組む",
                 useCases: ["協力してプロジェクトを進めるとき"],
                 examples: [
                    ("Collaborate on a project.", "プロジェクトで協力する。"),
                    ("Let's collaborate.", "一緒にやろう。")
                 ]),
            make("my part", "the portion belonging to me",
                 "私の分担・私の部分",
                 useCases: ["責任や役割の自分の分を指すとき"],
                 examples: [
                    ("I did my part.", "自分の分はやった。"),
                    ("That's my part of the job.", "それが私の仕事分。")
                 ])
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
                 ]),
            make("talk to sb about sth", "discuss with someone",
                 "(人)と(物事)について話す",
                 useCases: ["特定の話題について誰かと話すとき"],
                 examples: [
                    ("Talk to him about it.", "彼にそのこと話して。"),
                    ("Need to talk to you about something.", "ちょっと話があるんだ。")
                 ]),
            make("bother sb", "trouble or annoy someone",
                 "〜の邪魔をする・困らせる",
                 useCases: ["相手の手間や時間を取らせるとき"],
                 examples: [
                    ("Sorry to bother you.", "邪魔してごめん。"),
                    ("Don't bother him.", "彼を邪魔しないで。")
                 ]),
            make("interrupt", "break the continuity of",
                 "中断する・口を挟む",
                 useCases: ["会話や作業を遮るとき"],
                 examples: [
                    ("Sorry to interrupt.", "話の腰折ってごめん。"),
                    ("Don't interrupt me.", "邪魔しないで。")
                 ]),
            make("see your point", "understand your view",
                 "言いたいこと分かる",
                 useCases: ["相手の論理を理解したと示すとき"],
                 examples: [
                    ("I see your point.", "なるほど。"),
                    ("I see your point, but ~", "言いたいことは分かるけど〜")
                 ]),
            make("before we end", "before we wrap up",
                 "終わる前に",
                 useCases: ["会議や通話を締めくくる前に話を残すとき"],
                 examples: [
                    ("Before we end, any questions?", "終わる前に質問は?"),
                    ("One last thing before we end.", "終わる前に最後に一つ。")
                 ]),
            make("later", "at some time afterward",
                 "後で・じゃあね",
                 useCases: ["時間的に後、または別れの挨拶"],
                 examples: [
                    ("Talk later.", "また後で。"),
                    ("See you later!", "じゃあね!")
                 ]),
            make("swamped", "overwhelmed with work",
                 "仕事に追われている",
                 useCases: ["業務でいっぱいいっぱいの状態を表すとき"],
                 examples: [
                    ("I'm swamped right now.", "今めっちゃ忙しい。"),
                    ("Totally swamped this week.", "今週は完全に手一杯。")
                 ]),
            make("can it", "stop talking; (also: container)",
                 "黙れ・止めて",
                 useCases: ["うるさい人を黙らせる強めの口語、または「缶詰にする」"],
                 examples: [
                    ("Can it!", "黙れ!"),
                    ("Just can it, please.", "もう静かにして。")
                 ]),
            make("run behind", "be late or delayed",
                 "予定より遅れている",
                 useCases: ["スケジュールが押しているとき"],
                 examples: [
                    ("Running behind today.", "今日は予定が押してる。"),
                    ("We're running behind schedule.", "予定より遅れてる。")
                 ])
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
                 ]),
            make("do well", "perform successfully",
                 "うまくやる・成績がいい",
                 useCases: ["仕事や試験で成果を出すとき"],
                 examples: [
                    ("He's doing well.", "彼は順調。"),
                    ("Hope you do well!", "うまくいくといいね!")
                 ]),
            make("it's time to do", "the moment has come to",
                 "そろそろ〜する時間だ",
                 useCases: ["行動を開始する時を促すとき"],
                 examples: [
                    ("It's time to go.", "もう行く時間。"),
                    ("It's time to make a change.", "変える時。")
                 ]),
            make("guess", "estimate or suppose",
                 "推測する・たぶん",
                 useCases: ["確信なく予想するとき"],
                 examples: [
                    ("I guess so.", "たぶんね。"),
                    ("Guess what!", "聞いて!")
                 ]),
            make("sounds like a plan", "that's a good plan",
                 "それでいこう・いい案",
                 useCases: ["相手の提案に賛同するとき"],
                 examples: [
                    ("Sounds like a plan!", "それでいこう!"),
                    ("Yeah, sounds like a plan.", "うん、それいいね。")
                 ]),
            make("tied up", "busy with something",
                 "手が離せない・予定が詰まっている",
                 useCases: ["忙しくて対応できないことを伝えるとき"],
                 examples: [
                    ("I'm tied up at the moment.", "今手が離せない。"),
                    ("Tied up all day.", "一日中忙しい。")
                 ]),
            make("call it a day", "stop working for the day",
                 "今日はここまでにする",
                 useCases: ["作業や仕事を切り上げるとき"],
                 examples: [
                    ("Let's call it a day.", "今日はここまでにしよう。"),
                    ("I'm calling it a day.", "もう切り上げる。")
                 ]),
            make("my thing", "what I personally enjoy or do",
                 "私の得意・好きな分野",
                 useCases: ["自分の得意分野や好みを表すとき"],
                 examples: [
                    ("Not really my thing.", "あんまり私の好みじゃない。"),
                    ("That's my thing.", "それ私の得意分野。")
                 ]),
            make("fingers crossed", "hoping for good luck",
                 "うまくいきますように・幸運を祈って",
                 useCases: ["願掛けや幸運を祈るときの口語表現"],
                 examples: [
                    ("Fingers crossed!", "うまくいきますように!"),
                    ("Keep your fingers crossed for me.", "祈ってて。")
                 ])
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
                 ]),
            make("play", "engage in activity for enjoyment",
                 "遊ぶ・演奏する・(役を)演じる",
                 useCases: ["遊び、演奏、演技などを表すとき"],
                 examples: [
                    ("Play the piano.", "ピアノを弾く。"),
                    ("Kids play outside.", "子供たちは外で遊ぶ。")
                 ]),
            make("cheat", "act dishonestly; be unfaithful",
                 "ズルする・カンニングする・浮気する",
                 useCases: ["不正行為や裏切りを表すとき"],
                 examples: [
                    ("Don't cheat.", "ズルしないで。"),
                    ("He cheated on her.", "彼が彼女を裏切った。")
                 ]),
            make("involved", "actively engaged in",
                 "関わっている・複雑な",
                 useCases: ["何かに巻き込まれている、または込み入っている状態"],
                 examples: [
                    ("Get involved.", "関わる。"),
                    ("It's complicated and involved.", "複雑で込み入ってる。")
                 ]),
            make("beat", "defeat; hit rhythmically",
                 "打ち負かす・拍子・脈動",
                 useCases: ["勝つこと、または音や心臓のリズムを表すとき"],
                 examples: [
                    ("Beat the record.", "記録を破る。"),
                    ("Heart beat.", "心臓の鼓動。")
                 ]),
            make("juggle", "balance multiple tasks; toss objects",
                 "ジャグリング・複数を同時にこなす",
                 useCases: ["仕事や責任を複数同時に処理するとき"],
                 examples: [
                    ("Juggle work and family.", "仕事と家庭を両立。"),
                    ("Juggle three balls.", "ボール3つでジャグリング。")
                 ]),
            make("tingle", "feel a slight prickling sensation",
                 "ピリピリする・ゾクゾクする",
                 useCases: ["皮膚がピリピリしたり期待で興奮する感覚"],
                 examples: [
                    ("Tingling sensation.", "ピリピリ感。"),
                    ("Tingled with excitement.", "ゾクゾクするほどワクワクした。")
                 ]),
            make("toggle", "switch between two states",
                 "切り替える・トグル",
                 useCases: ["設定やスイッチをON/OFF切り替えるとき"],
                 examples: [
                    ("Toggle the switch.", "スイッチを切り替える。"),
                    ("Toggle between modes.", "モードを切り替える。")
                 ]),
            make("trust", "believe in reliability",
                 "信頼する・信頼",
                 useCases: ["人や情報を信用するとき"],
                 examples: [
                    ("Trust me.", "信じて。"),
                    ("Build trust.", "信頼を築く。")
                 ]),
            make("have access", "be able to use or enter",
                 "アクセスできる・利用できる",
                 useCases: ["情報・施設・サービスを使える権限を表すとき"],
                 examples: [
                    ("Have access to the data.", "データにアクセスできる。"),
                    ("No access to the building.", "建物に入れない。")
                 ])
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
                 ]),
            make("method", "a way of doing something",
                 "方法・手段",
                 useCases: ["特定のやり方や手順を表すとき"],
                 examples: [
                    ("Best method.", "最良の方法。"),
                    ("Scientific method.", "科学的手法。")
                 ]),
            make("mostly", "for the most part",
                 "ほとんど・大体は",
                 useCases: ["大部分を占めることを表すとき"],
                 examples: [
                    ("Mostly true.", "ほぼ本当。"),
                    ("Mostly sunny.", "おおむね晴れ。")
                 ]),
            make("talent", "natural skill or ability",
                 "才能",
                 useCases: ["生まれつきの能力や、才能ある人を表すとき"],
                 examples: [
                    ("Hidden talent.", "隠れた才能。"),
                    ("Show your talent.", "才能を見せて。")
                 ]),
            make("at that time", "in that period of the past",
                 "その当時・あの頃",
                 useCases: ["過去の特定の時期を指すとき"],
                 examples: [
                    ("At that time, we were young.", "あの頃は若かった。"),
                    ("At that time, no one knew.", "当時は誰も知らなかった。")
                 ]),
            make("controversy", "disagreement or dispute",
                 "論争・物議",
                 useCases: ["意見が激しく対立する問題を表すとき"],
                 examples: [
                    ("Cause controversy.", "物議を醸す。"),
                    ("Major controversy.", "大きな論争。")
                 ]),
            make("conservative", "averse to change; cautious",
                 "保守的な・控えめな",
                 useCases: ["伝統や慎重さを重んじる姿勢を表すとき"],
                 examples: [
                    ("Conservative estimate.", "控えめな見積もり。"),
                    ("Conservative views.", "保守的な考え。")
                 ]),
            make("elite", "the most powerful or skilled group",
                 "エリート・選ばれた層",
                 useCases: ["上流階級や精鋭層を表すとき"],
                 examples: [
                    ("The elite few.", "選ばれし少数。"),
                    ("Elite athletes.", "一流選手。")
                 ]),
            make("shadow", "a dark shape from blocked light",
                 "影",
                 useCases: ["物が光を遮ってできる影、または影のように付き添うこと"],
                 examples: [
                    ("Cast a shadow.", "影を落とす。"),
                    ("Shadow of doubt.", "疑いの影。")
                 ])
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
                 ]),
            make("this is something that", "this is a thing which",
                 "これは〜なものだ",
                 useCases: ["重要な内容を切り出すときの前置き"],
                 examples: [
                    ("This is something that matters.", "これは重要なこと。"),
                    ("This is something that needs attention.", "これは注目すべき事柄。")
                 ]),
            make("I might be, but", "I could be (something), but",
                 "(自信なく)〜かもしれないけど",
                 useCases: ["控えめに意見を表明するときの前置き"],
                 examples: [
                    ("I might be wrong, but ~", "間違ってるかもしれないけど〜"),
                    ("I might be biased, but I think so.", "偏ってるかもしれないけど、そう思う。")
                 ]),
            make("all about sth", "centered on something",
                 "〜が全て・〜こそが重要",
                 useCases: ["何かを最重要視する強調表現"],
                 examples: [
                    ("Life is all about choices.", "人生は選択が全て。"),
                    ("It's all about timing.", "タイミングが全て。")
                 ]),
            make("standpoint", "a particular point of view",
                 "観点・立場",
                 useCases: ["特定の視点から議論するとき"],
                 examples: [
                    ("From my standpoint, ~", "私の観点では〜"),
                    ("Different standpoint.", "別の視点。")
                 ])
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
                 ]),
            make("on the fence", "undecided",
                 "決めかねている・どっちつかず",
                 useCases: ["2つの選択肢の間で迷っている状態"],
                 examples: [
                    ("I'm on the fence about it.", "それについては迷ってる。"),
                    ("Still on the fence.", "まだ決められない。")
                 ]),
            make("in your court", "your turn to act",
                 "あなたの番・判断はそちら次第",
                 useCases: ["決断や行動を相手に委ねるとき(the ball is in your court)"],
                 examples: [
                    ("The ball's in your court.", "君次第だよ。"),
                    ("It's in your court now.", "もうそっちの番。")
                 ]),
            make("shell", "the hard outer covering; a casing",
                 "殻・外殻",
                 useCases: ["卵や貝、または感情的な殻を表すとき"],
                 examples: [
                    ("Crack the shell.", "殻を割る。"),
                    ("Come out of your shell.", "殻を破って。")
                 ]),
            make("shelter", "a place of safety",
                 "避難所・保護施設",
                 useCases: ["雨風・危険から守る場所、または動物保護施設"],
                 examples: [
                    ("Take shelter.", "避難する。"),
                    ("Animal shelter.", "動物保護施設。")
                 ]),
            make("parade", "a public procession",
                 "パレード・行進",
                 useCases: ["祝祭などで行われる行進、または比喩で並べ立てる"],
                 examples: [
                    ("Watch the parade.", "パレードを見る。"),
                    ("Don't rain on my parade.", "私の楽しみを台無しにしないで。")
                 ])
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
                 ]),
            make("intelligent", "having mental ability",
                 "知的な・頭のいい",
                 useCases: ["賢さや判断力を表すとき"],
                 examples: [
                    ("Intelligent person.", "頭のいい人。"),
                    ("Intelligent decision.", "賢明な判断。")
                 ]),
            make("grave", "serious; a burial site",
                 "深刻な・墓",
                 useCases: ["重大な状況、または埋葬場所を表すとき"],
                 examples: [
                    ("A grave situation.", "深刻な状況。"),
                    ("Visit the grave.", "お墓参り。")
                 ]),
            make("massive", "very large and heavy",
                 "巨大な・大規模な",
                 useCases: ["とても大きいものや規模の大きさを表すとき"],
                 examples: [
                    ("Massive building.", "巨大な建物。"),
                    ("Massive impact.", "甚大な影響。")
                 ]),
            make("huge", "extremely large",
                 "巨大な・とても大きな",
                 useCases: ["大きさや重要度の高さを表すとき"],
                 examples: [
                    ("Huge difference.", "大きな違い。"),
                    ("Huge fan.", "大ファン。")
                 ]),
            make("narrow", "small in width",
                 "狭い・細い",
                 useCases: ["幅が狭い物理的状態や限定された範囲を表すとき"],
                 examples: [
                    ("Narrow street.", "狭い道。"),
                    ("Narrow escape.", "間一髪の脱出。")
                 ]),
            make("pointy", "having a sharp point",
                 "とがった",
                 useCases: ["先が尖った物や顔立ちを表すとき"],
                 examples: [
                    ("Pointy shoes.", "先のとがった靴。"),
                    ("Pointy ears.", "とがった耳。")
                 ]),
            make("lame", "unimpressive; (literally) limping",
                 "つまらない・(俗)ダサい",
                 useCases: ["面白くない・残念な、または身体的な不自由を表すとき"],
                 examples: [
                    ("That's so lame.", "ダサい。"),
                    ("A lame excuse.", "ひどい言い訳。")
                 ])
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
                 ]),
            make("leave it to", "rely on someone to handle it",
                 "〜に任せる",
                 useCases: ["特定の人なら絶対やってくれると信頼するとき"],
                 examples: [
                    ("Leave it to me.", "任せて。"),
                    ("Leave it to her.", "彼女に任せて。")
                 ]),
            make("be on sth", "be using or taking",
                 "〜を服用中・〜中",
                 useCases: ["薬・ダイエット・職務などに従事中であるとき"],
                 examples: [
                    ("She's on medication.", "彼女は薬を飲んでいる。"),
                    ("I'm on a diet.", "ダイエット中。")
                 ]),
            make("it is what it is", "accept the situation as it stands",
                 "そういうもんだ・仕方ない",
                 useCases: ["変えられない現実を受け入れる諦め交じりの表現"],
                 examples: [
                    ("It is what it is.", "そういうもんだ。"),
                    ("Well, it is what it is.", "まあ、仕方ない。")
                 ]),
            make("agree to disagree", "accept difference of opinion",
                 "意見の相違を認める",
                 useCases: ["議論を平和的に終える方法"],
                 examples: [
                    ("Let's agree to disagree.", "意見の相違として終わりにしよう。"),
                    ("We agreed to disagree.", "意見が合わないと受け入れた。")
                 ]),
            make("big deal", "an important matter",
                 "大した事・大事",
                 useCases: ["重要さを強調、または逆に皮肉で「大したことない」"],
                 examples: [
                    ("Big deal!", "大したことない!(皮肉)"),
                    ("It's a big deal.", "重要なことだ。")
                 ]),
            make("keep sb pp", "keep someone in a state (past participle)",
                 "(人)を〜のままにしておく",
                 useCases: ["keep + 人 + 過去分詞 の構文(keep me posted など)"],
                 examples: [
                    ("Keep me posted.", "進捗教えて。"),
                    ("Keep me informed.", "情報をください。")
                 ]),
            make("you never know", "something unexpected may happen",
                 "何が起きるかわからない",
                 useCases: ["将来の不確実性を示すとき"],
                 examples: [
                    ("You never know.", "何が起こるか分からない。"),
                    ("You never know what'll happen.", "何が起きるか分からないよ。")
                 ])
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
                 ]),
            make("give me a break", "stop bothering me; be reasonable",
                 "いい加減にして・勘弁してよ",
                 useCases: ["相手のしつこさや無理な要求に対する不満"],
                 examples: [
                    ("Oh give me a break!", "もう勘弁して!"),
                    ("Give me a break, will you?", "ちょっと許してよ。")
                 ]),
            make("sure thing", "of course; no problem",
                 "もちろん・了解",
                 useCases: ["快諾するときのカジュアル表現"],
                 examples: [
                    ("Sure thing!", "もちろん!"),
                    ("Sure thing, I got it.", "了解、任せて。")
                 ]),
            make("take care of yourself", "look after your wellbeing",
                 "体に気をつけて",
                 useCases: ["別れ際に相手の健康を気遣うとき"],
                 examples: [
                    ("Take care of yourself!", "体に気をつけて!"),
                    ("Take care of yourself, OK?", "お大事にね。")
                 ]),
            make("watch out", "be careful; beware",
                 "気をつけて・注意",
                 useCases: ["危険を警告するとき"],
                 examples: [
                    ("Watch out!", "危ない!"),
                    ("Watch out for the car!", "車に気をつけて!")
                 ]),
            make("second to none", "unsurpassed; the best",
                 "誰にも劣らない",
                 useCases: ["最高峰の品質や能力を称えるとき"],
                 examples: [
                    ("Their service is second to none.", "サービスは他に並ぶものなし。"),
                    ("Second to none in quality.", "品質では誰にも負けない。")
                 ]),
            make("have a look", "take a quick glance",
                 "見てみる・チェックする",
                 useCases: ["軽く何かを確認するとき(英国寄り)"],
                 examples: [
                    ("Have a look at this.", "これ見てみて。"),
                    ("I'll have a look.", "ちょっと見てみる。")
                 ])
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
                 ]),
            make("be sure", "be certain or confident",
                 "確かである・必ず〜する",
                 useCases: ["確信を伝える、または念を押すとき"],
                 examples: [
                    ("Be sure to call.", "必ず電話して。"),
                    ("Are you sure?", "本当に?")
                 ]),
            make("be sick of", "be tired of; fed up with",
                 "〜にうんざりしている",
                 useCases: ["何かに飽き飽きしているとき"],
                 examples: [
                    ("I'm sick of this.", "もうこれにうんざり。"),
                    ("Sick of waiting.", "待つのにうんざり。")
                 ]),
            make("can live with", "be able to accept",
                 "我慢できる・受け入れられる",
                 useCases: ["不満はあるが許容できることを表すとき"],
                 examples: [
                    ("I can live with that.", "それでよし。"),
                    ("Something I can live with.", "受け入れられること。")
                 ]),
            make("take sth as", "interpret as; regard as",
                 "〜と受け取る・とらえる",
                 useCases: ["相手の発言や行動を特定の意味で解釈するとき"],
                 examples: [
                    ("Take it as a compliment.", "褒め言葉として受け取って。"),
                    ("Take that as a yes.", "それはイエスと受け取る。")
                 ]),
            make("confused", "unable to think clearly",
                 "混乱した・困惑した",
                 useCases: ["状況や説明が分からないとき"],
                 examples: [
                    ("I'm confused.", "よく分からない。"),
                    ("Confused look.", "困惑した表情。")
                 ]),
            make("tricky", "difficult to deal with",
                 "扱いが難しい・厄介な",
                 useCases: ["微妙で慎重を要する事柄を表すとき"],
                 examples: [
                    ("Tricky question.", "厄介な質問。"),
                    ("A tricky situation.", "難しい状況。")
                 ])
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
                 ]),
            make("unity", "the state of being united",
                 "団結・一体感",
                 useCases: ["人々や集団がまとまっている状態を表すとき"],
                 examples: [
                    ("Strength in unity.", "団結に力あり。"),
                    ("National unity.", "国民の団結。")
                 ]),
            make("care", "serious attention; concern",
                 "ケア・気遣い",
                 useCases: ["世話や注意を払うこと、または気にかけることを表すとき"],
                 examples: [
                    ("Take care.", "気をつけて。"),
                    ("Health care.", "医療。")
                 ]),
            make("care for", "look after; like",
                 "〜の世話をする・〜が好き",
                 useCases: ["人や物の世話、または好み(やや改まった)を表すとき"],
                 examples: [
                    ("Care for the elderly.", "高齢者の世話をする。"),
                    ("Would you care for some tea?", "お茶はいかが?")
                 ]),
            make("modernize", "make more modern",
                 "近代化する・現代風にする",
                 useCases: ["設備や考えを最新化するとき"],
                 examples: [
                    ("Modernize the system.", "システムを近代化する。"),
                    ("Modernize the kitchen.", "キッチンをリフォーム。")
                 ]),
            make("thrive", "prosper; flourish",
                 "繁栄する・うまく育つ",
                 useCases: ["事業や生物が良好に成長するとき"],
                 examples: [
                    ("Business is thriving.", "ビジネスが繁盛している。"),
                    ("Children thrive on love.", "子供は愛で育つ。")
                 ]),
            make("it has never been", "it has not previously been",
                 "今までこれほど〜だったことはない",
                 useCases: ["過去にない状態を強調する構文(It has never been + 形容詞)"],
                 examples: [
                    ("It has never been easier.", "今ほど簡単な時はない。"),
                    ("It has never been more important.", "今ほど重要な時はない。")
                 ]),
            make("border", "a line separating areas",
                 "国境・境界",
                 useCases: ["国や地域、または抽象的な境目を表すとき"],
                 examples: [
                    ("Cross the border.", "国境を越える。"),
                    ("Border between countries.", "国の境。")
                 ]),
            make("borderline", "on the boundary; ambiguous",
                 "境界線・どっちつかずの",
                 useCases: ["明確な区分の境目や、ぎりぎりの状態を表すとき"],
                 examples: [
                    ("Borderline case.", "境界線上のケース。"),
                    ("Borderline acceptable.", "ぎりぎり許容範囲。")
                 ]),
            make("in the history of", "at any time in the history",
                 "〜の歴史の中で",
                 useCases: ["史上初・史上最高などを強調するとき"],
                 examples: [
                    ("Best in the history of the team.", "チーム史上最高。"),
                    ("First time in the history of Japan.", "日本史上初。")
                 ]),
            make("privilege", "a special right or advantage",
                 "特権・名誉",
                 useCases: ["特別な権利や恵まれた立場を表すとき"],
                 examples: [
                    ("It's a privilege.", "光栄です。"),
                    ("Check your privilege.", "自分の特権を自覚しろ(現代的批判)。")
                 ])
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
                 ]),
            make("scale up", "increase in size or scope",
                 "規模を拡大する",
                 useCases: ["事業や生産を大きくするとき"],
                 examples: [
                    ("Scale up the production.", "生産規模を拡大。"),
                    ("Time to scale up.", "拡大の時。")
                 ]),
            make("scale", "size; weighing instrument; climb",
                 "規模・尺度・体重計",
                 useCases: ["大きさの度合い、または測定器・登る動作"],
                 examples: [
                    ("Large scale project.", "大規模プロジェクト。"),
                    ("Step on the scale.", "体重計に乗って。")
                 ]),
            make("dialogue", "a conversation between two or more",
                 "対話・会話",
                 useCases: ["建設的な意見交換や脚本のセリフを表すとき"],
                 examples: [
                    ("Open dialogue.", "開かれた対話。"),
                    ("Dialogue between cultures.", "文化間の対話。")
                 ]),
            make("overall", "in general; in total",
                 "全体として・全般的に",
                 useCases: ["総合的な評価や全体像を述べるとき"],
                 examples: [
                    ("Overall, it's good.", "全体的に良い。"),
                    ("Overall winner.", "総合優勝。")
                 ]),
            make("consciousness", "awareness; state of being awake",
                 "意識・自覚",
                 useCases: ["意識ある状態や問題意識を表すとき"],
                 examples: [
                    ("Lose consciousness.", "意識を失う。"),
                    ("Social consciousness.", "社会意識。")
                 ]),
            make("earth", "the planet; soil",
                 "地球・土",
                 useCases: ["惑星としての地球、または土壌を表すとき"],
                 examples: [
                    ("Save the earth.", "地球を救え。"),
                    ("Down to earth.", "地に足が着いた。")
                 ]),
            make("advancing", "moving forward; progressing",
                 "前進している・進歩している",
                 useCases: ["技術や軍が前進している様子を表すとき"],
                 examples: [
                    ("Advancing technology.", "進歩する技術。"),
                    ("Advancing age.", "老いていく年齢。")
                 ]),
            make("man-made", "created by humans, not natural",
                 "人工の・人造の",
                 useCases: ["自然ではなく人間が作ったものを表すとき"],
                 examples: [
                    ("Man-made lake.", "人工湖。"),
                    ("Man-made disaster.", "人災。")
                 ]),
            make("humanoid", "having a human form",
                 "ヒューマノイド・人型",
                 useCases: ["人間に似たロボットやキャラクターを表すとき"],
                 examples: [
                    ("Humanoid robot.", "人型ロボット。"),
                    ("Humanoid alien.", "人型エイリアン。")
                 ]),
            make("optimistic", "hopeful about the future",
                 "楽観的な",
                 useCases: ["明るい未来を信じる姿勢を表すとき"],
                 examples: [
                    ("Optimistic outlook.", "楽観的な見通し。"),
                    ("Stay optimistic.", "楽観的でいよう。")
                 ]),
            make("humanity", "human beings as a whole; kindness",
                 "人類・人間性",
                 useCases: ["人類全体や人間らしさを表すとき"],
                 examples: [
                    ("All of humanity.", "全人類。"),
                    ("Show humanity.", "人間性を見せて。")
                 ])
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
                 ]),
            make("associate", "connect mentally; a colleague",
                 "関連付ける・仲間・連想する",
                 useCases: ["物事を結びつける、または同僚を表すとき"],
                 examples: [
                    ("Associate with success.", "成功と結びつける。"),
                    ("Business associate.", "ビジネス仲間。")
                 ]),
            make("artificial", "made by humans; not natural",
                 "人工の・人為的な",
                 useCases: ["自然ではなく人間が作った物を表すとき"],
                 examples: [
                    ("Artificial intelligence.", "人工知能。"),
                    ("Artificial flavors.", "人工香料。")
                 ]),
            make("getaway", "an escape; a holiday",
                 "逃走・休暇",
                 useCases: ["逃げる手段、または短い旅行を表すとき"],
                 examples: [
                    ("Weekend getaway.", "週末の小旅行。"),
                    ("Quick getaway.", "素早い逃走。")
                 ]),
            make("warn", "give notice of danger",
                 "警告する・注意する",
                 useCases: ["危険や問題を事前に知らせるとき"],
                 examples: [
                    ("Warn the public.", "市民に警告する。"),
                    ("I warned you.", "言ったでしょ。")
                 ]),
            make("counterpart", "someone equivalent in role",
                 "対応する人・相手",
                 useCases: ["他国・他組織で同じ役割を持つ人を表すとき"],
                 examples: [
                    ("Japanese counterpart.", "日本側の担当者。"),
                    ("Meet his counterpart.", "対応する役職者と会う。")
                 ]),
            make("manipulate", "control or influence skillfully",
                 "操作する・(人を)操る",
                 useCases: ["物理的に動かす、または不正に影響を及ぼすとき"],
                 examples: [
                    ("Manipulate the data.", "データを操作する。"),
                    ("Manipulate people.", "人を操る。")
                 ]),
            make("persuade", "cause to believe or act",
                 "説得する",
                 useCases: ["相手に行動や考えを変えさせるとき"],
                 examples: [
                    ("Persuade him to come.", "彼を説得して来させる。"),
                    ("Hard to persuade.", "説得しにくい。")
                 ]),
            make("capacity", "the ability to hold or do",
                 "容量・能力",
                 useCases: ["収容量や処理能力、または役割を表すとき"],
                 examples: [
                    ("Full capacity.", "満員・最大容量。"),
                    ("In what capacity?", "どんな立場で?")
                 ]),
            make("specifically", "in a precise manner",
                 "具体的に・特に",
                 useCases: ["対象を限定して述べるとき"],
                 examples: [
                    ("Specifically designed for ~", "〜のために特別設計。"),
                    ("Specifically, I mean ~", "具体的には〜")
                 ]),
            make("point to", "indicate; suggest",
                 "〜を指し示す・示唆する",
                 useCases: ["証拠が結論を指し示すような場面で使う"],
                 examples: [
                    ("Evidence points to him.", "証拠が彼を指している。"),
                    ("Point to the door.", "ドアを指さして。")
                 ]),
            make("influence", "the capacity to affect",
                 "影響・影響を与える",
                 useCases: ["他者や状況を変える力を表すとき"],
                 examples: [
                    ("Under the influence.", "影響下で・酒気帯び。"),
                    ("Influence the outcome.", "結果に影響する。")
                 ]),
            make("election", "the process of voting",
                 "選挙",
                 useCases: ["政治家や代表を選ぶ投票を表すとき"],
                 examples: [
                    ("Presidential election.", "大統領選挙。"),
                    ("Win the election.", "選挙に勝つ。")
                 ])
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
                 ]),
            make("scenery", "the natural features of a landscape",
                 "景色・風景",
                 useCases: ["旅行先や場面の美しい景色を表すとき"],
                 examples: [
                    ("Mountain scenery.", "山の景色。"),
                    ("Enjoy the scenery.", "景色を楽しむ。")
                 ]),
            make("insight", "a deep understanding",
                 "洞察・気づき",
                 useCases: ["物事の本質を見抜く力や鋭い視点を表すとき"],
                 examples: [
                    ("Valuable insight.", "貴重な洞察。"),
                    ("Gain insight.", "洞察を得る。")
                 ]),
            make("critical", "extremely important; analytical",
                 "極めて重要な・批判的な",
                 useCases: ["決定的な重要性や厳しい分析を表すとき"],
                 examples: [
                    ("Critical situation.", "深刻な状況。"),
                    ("Critical thinking.", "批判的思考。")
                 ]),
            make("formidable", "inspiring respect through size or skill",
                 "手強い・恐ろしい",
                 useCases: ["相手や課題が大きく圧倒的なとき"],
                 examples: [
                    ("A formidable opponent.", "手強い相手。"),
                    ("Formidable challenge.", "難題。")
                 ]),
            make("infrastructure", "basic systems supporting society",
                 "インフラ・基盤",
                 useCases: ["道路・電力・通信などの社会基盤を表すとき"],
                 examples: [
                    ("Public infrastructure.", "公共インフラ。"),
                    ("Build infrastructure.", "基盤を構築。")
                 ]),
            make("transition", "the process of changing",
                 "移行・変化",
                 useCases: ["ある状態から別の状態へ移るとき"],
                 examples: [
                    ("Smooth transition.", "スムーズな移行。"),
                    ("In transition.", "移行期にある。")
                 ])
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
                 ]),
            make("flat", "level; without slope; (also) apartment",
                 "平らな・平坦な・アパート(英)",
                 useCases: ["平らな表面、または英国式の集合住宅"],
                 examples: [
                    ("Flat surface.", "平らな面。"),
                    ("Rent a flat.", "アパートを借りる(英)。")
                 ]),
            make("match", "be equal to; pair up; a contest",
                 "合う・試合・マッチ",
                 useCases: ["何かが釣り合う、または試合を表すとき"],
                 examples: [
                    ("Perfect match.", "ぴったり。"),
                    ("Tennis match.", "テニスの試合。")
                 ]),
            make("fit", "be the right size; in shape",
                 "合う・体型が良い",
                 useCases: ["サイズが合う、または健康で引き締まっている状態"],
                 examples: [
                    ("These shoes fit.", "この靴ぴったり。"),
                    ("Stay fit.", "健康を保って。")
                 ]),
            make("ban sth", "officially prohibit",
                 "〜を禁止する",
                 useCases: ["政府や組織が公式に禁止するとき"],
                 examples: [
                    ("Ban smoking.", "喫煙を禁止する。"),
                    ("Banned from the site.", "サイトから締め出された。")
                 ]),
            make("stack", "a neat pile; to arrange in piles",
                 "積み重ねる・山",
                 useCases: ["物を積み上げる、または比喩で「山積み」"],
                 examples: [
                    ("Stack of books.", "本の山。"),
                    ("Stack up against ~", "〜と比較する。")
                 ]),
            make("dilute", "make weaker by adding water",
                 "薄める・希釈する",
                 useCases: ["液体や効果を薄めるとき"],
                 examples: [
                    ("Dilute the juice.", "ジュースを薄める。"),
                    ("Diluted message.", "薄まったメッセージ。")
                 ])
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
                 ]),
            make("adoption", "the act of taking up an idea or child",
                 "採用・養子縁組",
                 useCases: ["方針や子供を正式に受け入れるとき"],
                 examples: [
                    ("Adoption of new technology.", "新技術の採用。"),
                    ("Pet adoption.", "ペットの里親。")
                 ]),
            make("for good", "permanently",
                 "永久に・これっきり",
                 useCases: ["変化や別れが続くことを強調するとき"],
                 examples: [
                    ("Gone for good.", "永久に去った。"),
                    ("Quit for good.", "きっぱり辞める。")
                 ]),
            make("application", "the act of applying; a request",
                 "応用・申請・アプリ",
                 useCases: ["活用、申込、ソフトウェアなどを表すとき"],
                 examples: [
                    ("Job application.", "求職申請。"),
                    ("Practical application.", "実用的な応用。")
                 ]),
            make("diffusion", "the spreading of something",
                 "拡散・浸透",
                 useCases: ["物質・情報・文化などが広がるとき"],
                 examples: [
                    ("Diffusion of innovation.", "イノベーションの普及。"),
                    ("Gas diffusion.", "気体の拡散。")
                 ]),
            make("eventually", "in the end",
                 "結局・最終的に",
                 useCases: ["時間を経て最終的に何かが起こるとき"],
                 examples: [
                    ("Eventually, things worked out.", "最終的にうまくいった。"),
                    ("He'll come around eventually.", "そのうち彼も納得する。")
                 ]),
            make("mere", "nothing more than",
                 "ただの・ほんの",
                 useCases: ["量や重要度が少ないことを強調するとき"],
                 examples: [
                    ("A mere coincidence.", "ただの偶然。"),
                    ("Mere seconds away.", "ほんの数秒先。")
                 ])
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
                 ]),
            make("survive", "continue to live or exist",
                 "生き延びる・乗り切る",
                 useCases: ["危機や困難を切り抜けるとき"],
                 examples: [
                    ("Survive the storm.", "嵐を生き延びる。"),
                    ("Hard to survive.", "生き残るのが難しい。")
                 ]),
            make("express", "convey thoughts; rapid",
                 "表現する・急行の",
                 useCases: ["気持ちや考えを伝える、または急行列車を表すとき"],
                 examples: [
                    ("Express your feelings.", "気持ちを表現して。"),
                    ("Express train.", "急行列車。")
                 ]),
            make("terminate", "bring to an end",
                 "終了する・解雇する",
                 useCases: ["契約・雇用・プロセスを終わらせるとき"],
                 examples: [
                    ("Terminate the contract.", "契約を解除する。"),
                    ("Employment was terminated.", "雇用が終了した。")
                 ]),
            make("abandon", "give up completely",
                 "放棄する・見捨てる",
                 useCases: ["人や物を見捨てたり計画を放棄するとき"],
                 examples: [
                    ("Abandon ship!", "船を放棄しろ!"),
                    ("Don't abandon hope.", "希望を捨てないで。")
                 ]),
            make("choke", "block the airway; struggle to breathe",
                 "窒息する・喉を詰まらせる",
                 useCases: ["呼吸困難になる、または感情で喉が詰まるとき"],
                 examples: [
                    ("Choke on food.", "食べ物で詰まる。"),
                    ("Choke up.", "感極まる。")
                 ]),
            make("lodge", "stay temporarily; file a complaint",
                 "宿泊する・(苦情を)申し立てる",
                 useCases: ["臨時の宿泊、または公的に苦情を提出するとき"],
                 examples: [
                    ("Lodge a complaint.", "苦情を申し立てる。"),
                    ("Lodge for the night.", "一晩宿泊する。")
                 ])
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
                 ]),
            make("darkness", "the absence of light",
                 "暗闇・暗さ",
                 useCases: ["物理的な暗さや心の闇を表すとき"],
                 examples: [
                    ("In darkness.", "暗闇の中で。"),
                    ("Darkness of the soul.", "魂の闇。")
                 ]),
            make("ubiquitous", "present everywhere",
                 "至るところにある・遍在する",
                 useCases: ["どこにでも見られる物事を表すとき"],
                 examples: [
                    ("Ubiquitous smartphones.", "スマホはどこにでも。"),
                    ("Ubiquitous in modern life.", "現代生活で偏在的。")
                 ]),
            make("universal", "applicable to all cases",
                 "普遍的な・万国の",
                 useCases: ["どこでも誰にでも当てはまるものを表すとき"],
                 examples: [
                    ("Universal truth.", "普遍的な真実。"),
                    ("Universal remote.", "汎用リモコン。")
                 ]),
            make("view", "what can be seen; an opinion",
                 "眺め・見解",
                 useCases: ["景色や意見を表すとき"],
                 examples: [
                    ("Great view.", "素晴らしい眺め。"),
                    ("In my view, ~", "私の見解では〜")
                 ]),
            make("explosion", "a violent burst",
                 "爆発",
                 useCases: ["物理的な爆発や急増を表すとき"],
                 examples: [
                    ("Loud explosion.", "大きな爆発音。"),
                    ("Explosion of growth.", "爆発的成長。")
                 ]),
            make("tiny", "very small",
                 "とても小さい",
                 useCases: ["非常に小さいものを表すとき"],
                 examples: [
                    ("Tiny insect.", "小さな虫。"),
                    ("Tiny detail.", "細かな詳細。")
                 ])
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
                 ]),
            make("highlight", "draw attention to; the best part",
                 "強調する・ハイライト",
                 useCases: ["重要部分を目立たせる、または最高の瞬間を表すとき"],
                 examples: [
                    ("Highlight the key points.", "要点を強調する。"),
                    ("Highlight of the trip.", "旅のハイライト。")
                 ]),
            make("shake", "move quickly back and forth",
                 "振る・揺れる・握手する",
                 useCases: ["物理的な揺れや、握手・震えを表すとき"],
                 examples: [
                    ("Shake hands.", "握手する。"),
                    ("The earth shakes.", "地面が揺れる。")
                 ]),
            make("listen to", "pay attention to sound or advice",
                 "〜を聴く・〜の話を聞く",
                 useCases: ["音楽や人の意見に耳を傾けるとき"],
                 examples: [
                    ("Listen to music.", "音楽を聴く。"),
                    ("Listen to your heart.", "心の声を聴いて。")
                 ]),
            make("approach sth", "come near; tackle",
                 "〜に近づく・〜に取り組む",
                 useCases: ["物理的に近づく、または問題に取り掛かるとき"],
                 examples: [
                    ("Approach the problem.", "問題に取り組む。"),
                    ("Approach with care.", "慎重に近づく。")
                 ]),
            make("be viewed as", "be regarded as",
                 "〜と見なされる",
                 useCases: ["世間や他者からの評価・見方を述べるとき"],
                 examples: [
                    ("Viewed as a leader.", "リーダーと見なされる。"),
                    ("Often viewed as ~", "〜と見なされがち。")
                 ]),
            make("lifestyle", "a way of living",
                 "ライフスタイル・生活様式",
                 useCases: ["人々の暮らし方や習慣を表すとき"],
                 examples: [
                    ("Healthy lifestyle.", "健康的なライフスタイル。"),
                    ("Lifestyle changes.", "生活スタイルの変化。")
                 ])
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
                 ]),
            make("tip", "a piece of advice; small reward; pointed end",
                 "ヒント・チップ・先端",
                 useCases: ["助言、サービスへの心づけ、または物の先を表すとき"],
                 examples: [
                    ("Helpful tip.", "役立つコツ。"),
                    ("Leave a tip.", "チップを置いて。")
                 ]),
            make("import sth", "bring goods from abroad",
                 "〜を輸入する",
                 useCases: ["外国から商品や文化を取り入れるとき"],
                 examples: [
                    ("Import wine.", "ワインを輸入する。"),
                    ("Imported from Japan.", "日本から輸入。")
                 ]),
            make("compatible", "able to exist or work together",
                 "互換性のある・気の合う",
                 useCases: ["機器同士、または人同士の相性を表すとき"],
                 examples: [
                    ("Compatible with iPhone.", "iPhone対応。"),
                    ("Compatible personalities.", "気の合う性格。")
                 ]),
            make("practical", "concerned with actual use",
                 "実用的な・現実的な",
                 useCases: ["机上の理論ではなく実際に役立つことを表すとき"],
                 examples: [
                    ("Practical advice.", "実用的な助言。"),
                    ("Practical approach.", "現実的なアプローチ。")
                 ]),
            make("engaging", "charming and attractive",
                 "魅力的な・引き込まれる",
                 useCases: ["興味を引きつけ続ける内容や人物を表すとき"],
                 examples: [
                    ("Engaging story.", "引き込まれる物語。"),
                    ("Engaging speaker.", "魅力的な話し手。")
                 ]),
            make("ongoing", "continuing to happen",
                 "進行中の・継続中の",
                 useCases: ["進行している作業や状況を表すとき"],
                 examples: [
                    ("Ongoing project.", "進行中のプロジェクト。"),
                    ("Ongoing issue.", "継続中の問題。")
                 ]),
            make("hospitality", "friendly reception of guests",
                 "おもてなし・接客",
                 useCases: ["温かい迎え入れや接客業界を表すとき"],
                 examples: [
                    ("Japanese hospitality.", "日本のおもてなし。"),
                    ("Hospitality industry.", "ホスピタリティ産業。")
                 ]),
            make("gesture", "a motion of the hands or body",
                 "ジェスチャー・身振り",
                 useCases: ["手振りや好意の表れを表すとき"],
                 examples: [
                    ("Hand gesture.", "手のジェスチャー。"),
                    ("Nice gesture.", "気の利いた配慮。")
                 ]),
            make("recap", "summarize the main points",
                 "要約・おさらい",
                 useCases: ["前回の内容を簡潔にまとめるとき"],
                 examples: [
                    ("Quick recap.", "サッと振り返り。"),
                    ("Let me recap.", "おさらいさせて。")
                 ])
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
                 ]),
            make("detach", "separate from",
                 "切り離す・取り外す",
                 useCases: ["物理的に離す、または感情的に距離を置くとき"],
                 examples: [
                    ("Detach the cable.", "ケーブルを外す。"),
                    ("Detach emotionally.", "感情的に距離を置く。")
                 ]),
            make("inject", "introduce a fluid; add an element",
                 "注射する・注入する",
                 useCases: ["液体を体内に入れる、または要素を加えるとき"],
                 examples: [
                    ("Inject the medicine.", "薬を注射する。"),
                    ("Inject energy.", "活力を吹き込む。")
                 ]),
            make("factual", "based on facts",
                 "事実に基づく",
                 useCases: ["客観的な事実であることを強調するとき"],
                 examples: [
                    ("Factual report.", "事実に基づく報告。"),
                    ("Factual error.", "事実誤認。")
                 ]),
            make("factor in", "include as a consideration",
                 "考慮に入れる",
                 useCases: ["計算や判断に要素を加えるとき"],
                 examples: [
                    ("Factor in shipping.", "送料を考慮に入れる。"),
                    ("Factor in fatigue.", "疲労を計算に入れる。")
                 ]),
            make("keep sth flowing", "maintain continuous movement",
                 "〜を流し続ける",
                 useCases: ["会話・物資・お金などが滞らないようにするとき"],
                 examples: [
                    ("Keep the conversation flowing.", "会話を続ける。"),
                    ("Keep cash flowing.", "現金の流れを保つ。")
                 ]),
            make("generate", "produce or create",
                 "生み出す・発生させる",
                 useCases: ["電力や収入、アイデアを生み出すとき"],
                 examples: [
                    ("Generate electricity.", "電力を発電。"),
                    ("Generate ideas.", "アイデアを生む。")
                 ]),
            make("by extension", "as a logical consequence",
                 "延長線上で・つまり",
                 useCases: ["論理的に派生する結論や対象を示すとき"],
                 examples: [
                    ("And by extension, his family.", "ひいては彼の家族も。"),
                    ("By extension, we benefit.", "結果として我々も恩恵を受ける。")
                 ]),
            make("encourage", "give support and confidence",
                 "励ます・促進する",
                 useCases: ["人を励ましたり、行動を後押しするとき"],
                 examples: [
                    ("Encourage creativity.", "創造性を促進。"),
                    ("Encourage your team.", "チームを励まして。")
                 ])
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
                 ]),
            make("quotation", "a passage cited from someone",
                 "引用・見積もり",
                 useCases: ["有名な引用句、または価格の見積もりを表すとき"],
                 examples: [
                    ("Famous quotation.", "有名な引用句。"),
                    ("Request a quotation.", "見積もりを依頼する。")
                 ]),
            make("status", "the position or condition of something",
                 "地位・状態・ステータス",
                 useCases: ["社会的立場や物事の現状を表すとき"],
                 examples: [
                    ("Social status.", "社会的地位。"),
                    ("Status update.", "近況・更新情報。")
                 ])
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
                 ]),
            make("all things considered", "taking everything into account",
                 "全てを考慮すると",
                 useCases: ["全体的な評価を述べるとき"],
                 examples: [
                    ("All things considered, it went well.", "総合的に見てうまくいった。"),
                    ("All things considered, we did our best.", "全てを考えると最善を尽くした。")
                 ]),
            make("without a doubt", "with absolute certainty",
                 "間違いなく",
                 useCases: ["確信を強く伝えるとき"],
                 examples: [
                    ("Without a doubt, the best.", "間違いなく最高。"),
                    ("Without a doubt, he'll come.", "間違いなく彼は来る。")
                 ]),
            make("mood swing", "an abrupt change in emotion",
                 "気分の浮き沈み・感情の波",
                 useCases: ["感情が急変することを表すとき"],
                 examples: [
                    ("Bad mood swing.", "気分の落ち込み。"),
                    ("Hormonal mood swings.", "ホルモンによる気分の波。")
                 ]),
            make("gut check", "a moment of honest self-evaluation",
                 "自問自答・覚悟の確認",
                 useCases: ["自分の決意や本気度を確かめるとき"],
                 examples: [
                    ("Time for a gut check.", "自問自答の時。"),
                    ("Gut check moment.", "決意を試される瞬間。")
                 ]),
            make("ego", "a person's sense of self-importance",
                 "エゴ・自尊心",
                 useCases: ["自我や自己評価について話すとき"],
                 examples: [
                    ("Big ego.", "プライドが高い。"),
                    ("Bruise the ego.", "プライドを傷つける。")
                 ]),
            make("bottleneck", "a point of congestion or obstruction",
                 "ボトルネック・障害",
                 useCases: ["処理速度や進捗を遅らせている要因を表すとき"],
                 examples: [
                    ("Identify the bottleneck.", "ボトルネックを特定する。"),
                    ("Major bottleneck.", "大きな障害。")
                 ]),
            make("track record", "the past performance of someone",
                 "実績・経歴",
                 useCases: ["これまでの成果や信頼性を語るとき"],
                 examples: [
                    ("Solid track record.", "確かな実績。"),
                    ("Proven track record.", "証明済みの実績。")
                 ]),
            make("microscope", "an instrument for viewing tiny things",
                 "顕微鏡",
                 useCases: ["細かな観察や徹底的な精査の比喩にも使う"],
                 examples: [
                    ("Under a microscope.", "顕微鏡で観察・徹底調査されて。"),
                    ("Through a microscope.", "顕微鏡を通して。")
                 ]),
            make("micromanagement", "controlling every small detail",
                 "マイクロマネジメント・細かい管理",
                 useCases: ["上司が細部まで口出しする管理スタイルを批判するとき"],
                 examples: [
                    ("Stop the micromanagement.", "細かく口出しするのやめて。"),
                    ("Hate micromanagement.", "細かい管理が嫌い。")
                 ]),
            make("redundant", "no longer needed; excessive",
                 "余分な・冗長な・解雇された(英)",
                 useCases: ["不要な要素、または英国で「解雇」を意味するとき"],
                 examples: [
                    ("Redundant information.", "余分な情報。"),
                    ("Made redundant.", "解雇された(英)。")
                 ]),
            make("commonplace", "ordinary; widespread",
                 "ありふれた・日常的な",
                 useCases: ["特別ではなく一般的なことを表すとき"],
                 examples: [
                    ("Commonplace issue.", "ありふれた問題。"),
                    ("Now commonplace.", "今や日常的。")
                 ])
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
                 ]),
            make("get stuck", "become unable to move forward",
                 "行き詰まる・はまる",
                 useCases: ["物理的・精神的に進めない状況"],
                 examples: [
                    ("I got stuck in traffic.", "渋滞にはまった。"),
                    ("Stuck on a problem.", "問題で詰まってる。")
                 ]),
            make("branch out", "expand into new areas",
                 "新分野に乗り出す・枝分かれする",
                 useCases: ["新たな試みや分野に挑戦するとき"],
                 examples: [
                    ("Branch out into design.", "デザイン分野に進出。"),
                    ("Time to branch out.", "新分野へ進む時。")
                 ]),
            make("hold back", "restrain; withhold",
                 "抑える・控える",
                 useCases: ["感情や情報を抑えるとき"],
                 examples: [
                    ("Don't hold back.", "遠慮しないで。"),
                    ("Hold back tears.", "涙をこらえる。")
                 ]),
            make("keep sth going", "maintain momentum",
                 "〜を続ける・勢いを保つ",
                 useCases: ["何かを止めずに継続させたいとき"],
                 examples: [
                    ("Keep the conversation going.", "会話を続けよう。"),
                    ("Keep it going!", "その調子!")
                 ]),
            make("try out", "test or audition",
                 "試してみる・オーディションを受ける",
                 useCases: ["新しい物や活動を試すとき"],
                 examples: [
                    ("Try out a new recipe.", "新レシピを試す。"),
                    ("Try out for the team.", "チームのトライアウトを受ける。")
                 ]),
            make("pull sth out of", "extract from",
                 "〜から〜を引き出す",
                 useCases: ["物理的に取り出す、または比喩的に引き出すとき"],
                 examples: [
                    ("Pull a rabbit out of a hat.", "帽子からウサギを出す。"),
                    ("Pull yourself out of bed.", "ベッドから自分を引きずり出す。")
                 ]),
            make("putting sth aside", "setting something to one side",
                 "〜を脇に置く・保留する",
                 useCases: ["他のことを後回しにして集中するとき"],
                 examples: [
                    ("Putting that aside, ~", "それは脇に置いておいて〜"),
                    ("Putting differences aside.", "意見の相違を脇に置いて。")
                 ]),
            make("boil down", "be reduced to the essence",
                 "煮詰める・要するに〜になる",
                 useCases: ["複雑な話を本質に絞るとき"],
                 examples: [
                    ("It boils down to money.", "結局は金の問題。"),
                    ("Boil down the data.", "データを集約する。")
                 ]),
            make("transition into", "move into a new state",
                 "〜へ移行する",
                 useCases: ["状態やキャリアが切り替わるとき"],
                 examples: [
                    ("Transition into a new role.", "新しい役割に移る。"),
                    ("Transition into adulthood.", "大人へ移行する。")
                 ])
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
                 ]),
            make("choice", "an act of selecting; an option",
                 "選択・選択肢",
                 useCases: ["決断や複数ある選択肢を表すとき"],
                 examples: [
                    ("Tough choice.", "難しい選択。"),
                    ("Your choice.", "君の選択次第。")
                 ]),
            make("ultimate", "the best or most extreme",
                 "究極の・最終的な",
                 useCases: ["最高峰や最終形を表すとき"],
                 examples: [
                    ("Ultimate goal.", "究極の目標。"),
                    ("Ultimate experience.", "究極の体験。")
                 ]),
            make("tier", "a level in a hierarchy",
                 "層・段階",
                 useCases: ["料金プランやランクの区分を表すとき"],
                 examples: [
                    ("Top tier.", "トップクラス。"),
                    ("Three-tier system.", "三段階のシステム。")
                 ]),
            make("material", "matter; relevant content",
                 "材料・素材・資料",
                 useCases: ["物質や教材、議論の素材を表すとき"],
                 examples: [
                    ("Raw material.", "原材料。"),
                    ("Reading material.", "読み物。")
                 ]),
            make("a pass", "permission or skip; an attempt",
                 "パス・見送り",
                 useCases: ["許可証、または「今回は遠慮する」というスラング"],
                 examples: [
                    ("I'll take a pass.", "今回は遠慮しとく。"),
                    ("A free pass.", "免除パス。")
                 ]),
            make("dead-end", "no possibility of progress",
                 "行き止まり・将来性のない",
                 useCases: ["袋小路の道や、見込みのない仕事を表すとき"],
                 examples: [
                    ("Dead-end street.", "行き止まりの道。"),
                    ("Dead-end job.", "将来性のない仕事。")
                 ]),
            make("reaction", "a response to something",
                 "反応",
                 useCases: ["出来事や言葉に対する人の反応を表すとき"],
                 examples: [
                    ("Strong reaction.", "強い反応。"),
                    ("Reaction time.", "反応時間。")
                 ]),
            make("mirror", "a reflective surface; reflect",
                 "鏡・反映する",
                 useCases: ["鏡像、または比喩的に反映する状態を表すとき"],
                 examples: [
                    ("Look in the mirror.", "鏡を見て。"),
                    ("Mirror the trend.", "傾向を映し出す。")
                 ]),
            make("magic", "the use of supernatural power",
                 "魔法・マジック",
                 useCases: ["奇跡的な力や見事な技を表すとき"],
                 examples: [
                    ("Like magic.", "まるで魔法のよう。"),
                    ("Magic trick.", "手品。")
                 ])
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
                 ]),
            make("the very next day", "the day immediately after",
                 "翌日すぐ・その翌日",
                 useCases: ["何かが起きた直後の日を強調するとき"],
                 examples: [
                    ("The very next day, he called.", "翌日にすぐ彼は電話してきた。"),
                    ("The very next day, everything changed.", "翌日にはすべてが変わった。")
                 ]),
            make("this stuff", "this kind of thing",
                 "こういうもの・このもの",
                 useCases: ["目の前の物事や状況を漠然と指すとき"],
                 examples: [
                    ("Don't drink this stuff.", "このやつ飲むなよ。"),
                    ("This stuff is amazing!", "これすごい!")
                 ]),
            make("can literally feel", "physically perceive (intensified)",
                 "本当に感じることができる",
                 useCases: ["強い感覚や感情を強調するとき"],
                 examples: [
                    ("I can literally feel my heart racing.", "心臓のドキドキを本当に感じる。"),
                    ("Can literally feel the cold.", "寒さがリアルに伝わる。")
                 ]),
            make("depressed", "feeling severe sadness",
                 "落ち込んだ・抑うつの",
                 useCases: ["悲しみや無気力な状態を表すとき"],
                 examples: [
                    ("Feeling depressed.", "落ち込んでる。"),
                    ("Clinically depressed.", "うつ病の。")
                 ]),
            make("for free", "without payment",
                 "無料で",
                 useCases: ["お金を払わずに何かを得るとき"],
                 examples: [
                    ("Got it for free.", "無料で手に入れた。"),
                    ("For free!", "無料で!")
                 ]),
            make("bio", "a short biography",
                 "経歴・プロフィール",
                 useCases: ["SNSやプロフィール欄の自己紹介文を表すとき"],
                 examples: [
                    ("Check my bio.", "プロフィール見て。"),
                    ("Short bio.", "簡単な経歴。")
                 ]),
            make("premise", "a basis for argument or work",
                 "前提・原則",
                 useCases: ["議論や物語の出発点を表すとき"],
                 examples: [
                    ("Movie premise.", "映画の前提設定。"),
                    ("Faulty premise.", "誤った前提。")
                 ]),
            make("silence", "the absence of sound",
                 "沈黙・静けさ",
                 useCases: ["無音や口を閉ざした状態を表すとき"],
                 examples: [
                    ("Awkward silence.", "気まずい沈黙。"),
                    ("Silence is golden.", "沈黙は金。")
                 ])
        ]
    }
}
