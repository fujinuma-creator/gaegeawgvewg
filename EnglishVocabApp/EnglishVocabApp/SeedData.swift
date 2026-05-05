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
}
