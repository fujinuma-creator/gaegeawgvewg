import Foundation

/// Additional vocabulary added in batch updates. Returned by `WordStore.seedWords()`
/// alongside the original mockup-derived seeds. New seeds are merged into existing
/// users' libraries on launch (preserving review progress on words they already had).
enum SeedData {

    static var additionalWords: [Word] {
        return phrasalVerbs + idioms + adjectives + verbs + nouns
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
}
