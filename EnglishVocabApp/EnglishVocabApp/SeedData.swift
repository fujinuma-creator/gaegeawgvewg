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
}
