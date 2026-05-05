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
    }

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
}
