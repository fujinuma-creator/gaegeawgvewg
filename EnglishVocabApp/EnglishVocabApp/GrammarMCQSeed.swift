import Foundation

/// Hand-curated 4-choice grammar questions. Add new entries to
/// `questions` over time — IDs must remain stable so user progress
/// (which choice they picked) keeps mapping to the right question.
enum GrammarMCQSeed {

    static let questions: [GrammarQuestion] = [
        GrammarQuestion(
            id: "q201",
            question: "I'm really ___ jazz music. I listen to it every day.",
            choices: ["fond at", "fond of", "fond with", "fond for"],
            correctIndex: 1,
            translation: "「ジャズが本当に好きで、毎日聴いている」",
            explanation: """
            ・be fond of ~ は「〜が好き」の固定表現。前置詞は必ず of
            ・後ろに動詞が来る場合は -ing形 にする(× be fond of to listen / ○ be fond of listening)
            ・like より穏やかで愛着のこもった響き。love ほど強烈ではない
            ・「習慣的に好き」「長く愛している」というニュアンス。家族や子供にも使う
            ・口語では love / like の方が頻出。be fond of はやや上品で知的な印象
            """
        ),
        GrammarQuestion(
            id: "q202",
            question: "Come ___ — you can see the whole city!",
            choices: ["up here", "here up", "up to here", "over up"],
            correctIndex: 0,
            translation: "「こっちに上がってきて — 街全体が見えるよ!」",
            explanation: """
            ・up here = 「ここの上に・こちらの上に」副詞句で語順は固定
            ・up + here/there : 上の場所を指す
            ・down + here/there : 下の場所
            ・over + here/there : 「こちら/あちら」(離れた場所)
            ・Come up here = 屋上・山の上・2階などから呼ぶ
            ・"How's the weather up there?" は「そっち(北の地域・上の階)の天気は?」
            """
        ),
        GrammarQuestion(
            id: "q203",
            question: "This coffee is ___ hot ___ drink right now.",
            choices: ["too / to", "so / to", "very / to", "too / for"],
            correctIndex: 0,
            translation: "「このコーヒーは熱すぎて今は飲めない」",
            explanation: """
            ・too + 形容詞/副詞 + to + 動詞 = 「〜すぎて…できない」(否定的)
            ・too hot to drink = 熱すぎて飲めない、too tired to walk = 疲れすぎて歩けない
            ・否定の意味を含むので not は不要(× too hot not to drink)
            ・"You're too kind!" はお世辞への返し(親切すぎますよ!)
            ・"Never too late to start." = 始めるのに遅すぎることはない
            ・so ~ that 構文との違い: too to は不可能、so that は強調
            """
        ),
        GrammarQuestion(
            id: "q204",
            question: "Water is ___ for life — humans can't survive more than a few days without it.",
            choices: ["essence", "essential", "essentially", "essentialize"],
            correctIndex: 1,
            translation: "「水は生命にとって不可欠だ — 人間は水なしでは数日も生きられない」",
            explanation: """
            ・essential = 「不可欠な・極めて重要な」形容詞
            ・be essential for + 名詞/動名詞 : 〜にとって不可欠
            ・be essential to + 名詞 : 〜に欠かせない
            ・It's essential that ~ : 〜が極めて重要だ(that節内は仮定法現在)
            ・important より強く「これがないと成り立たない」のニュアンス
            ・the bare essentials = 最低限必要なもの(旅行や引越しで頻出)
            ・口語では crucial / vital / critical も同じニュアンス
            """
        ),
        GrammarQuestion(
            id: "q205",
            question: "That movie ___ me ___ for an hour. It was so sad.",
            choices: ["made / cry", "made / to cry", "make / cried", "made / crying"],
            correctIndex: 0,
            translation: "「あの映画は私を1時間泣かせた。とても悲しかった」",
            explanation: """
            ・make + 人 + 動詞の原形 = 「人に〜させる」(使役構文)
            ・動詞は原形のみ。to不定詞や -ing は不可
            ・let / have も同じく原形を取る、get + 人 + to V は to 不定詞
            ・"You make me happy." / "He made me laugh." / "Don't make me wait."
            ・受動態にすると to が復活する: I was made to wait.(待たされた)
            ・試験で狙われる定番ポイント
            """
        ),
        GrammarQuestion(
            id: "q206",
            question: "Take your time — we have ___ time.",
            choices: ["plenty", "plenty of", "plenty for", "plenty with"],
            correctIndex: 1,
            translation: "「ゆっくりでいいよ — 時間はたっぷりある」",
            explanation: """
            ・plenty of = 「たくさんの」可算・不可算どちらでも使える便利な表現
            ・plenty of time / plenty of people / plenty of money
            ・a lot of は単に量が多い、plenty of は「必要十分以上に余裕がある」ニュアンス
            ・"No rush, plenty of time." は相手を安心させる定番
            ・"Plenty of fish in the sea." = 失恋した人への慰めの決まり文句
            ・ポジティブなニュアンスで余裕を示す表現
            """
        ),
        GrammarQuestion(
            id: "q207",
            question: "___ my dog can do this trick — it's that easy.",
            choices: ["Although", "Even", "However", "Despite"],
            correctIndex: 1,
            translation: "「うちの犬でさえこの芸ができる — それくらい簡単だ」",
            explanation: """
            ・even = 「〜さえ・〜すら」強調の副詞。意外性を強調
            ・even + 主語/even if + 文/even though + 文/even so
            ・"Even I can do it." / "Even better!" / "I don't even care."
            ・"Don't even think about it." は強い禁止
            ・位置で焦点が変わる:
            ・Even John came(ジョンさえ来た) / John even came(来ることまで) / John came even on Sunday
            ・ネイティブは強調したい部分の直前に置く
            """
        ),
        GrammarQuestion(
            id: "q208",
            question: "You should call your mom ___.",
            choices: ["more often", "often more", "much often", "very often"],
            correctIndex: 0,
            translation: "「もっと頻繁にお母さんに電話するべきだ」",
            explanation: """
            ・often の比較級は more often(× oftener は古風で使わない)
            ・less often / most often / as often as
            ・"More often than not, he's late." = 大抵彼は遅れる(決まり文句)
            ・"Hope to see you more often." = もっと会いたいね
            ・強調: much more often / a lot more often / far more often(フォーマル)
            ・often の発音は /ˈɔːfən/ または /ˈɔːftən/ 両方可、米では t を発音しないことが多い
            """
        ),
        GrammarQuestion(
            id: "q209",
            question: "It's hard ___ me ___ understand this.",
            choices: ["of / to", "for / to", "to / for", "on / to"],
            correctIndex: 1,
            translation: "「これを理解するのは私には難しい」",
            explanation: """
            ・It is + 形容詞 + for + 人 + to + 動詞 = 「人にとって〜することは…だ」
            ・for + 人 が意味上の主語、to + 動詞 が真主語
            ・状況・性質を表す形容詞(hard, easy, important, possible)→ for
            ・人の性格を表す形容詞(kind, nice, foolish, careless)→ of
            ・例: It's nice of you to come.(来てくれて優しいね = 人格評価)
            ・口語では for me to は自分の立場を強調するときによく使う
            """
        ),
        GrammarQuestion(
            id: "q210",
            question: "___ you said yesterday was really helpful.",
            choices: ["That", "What", "Which", "Who"],
            correctIndex: 1,
            translation: "「昨日あなたが言ったことはとても役に立った」",
            explanation: """
            ・What + 主語 + 動詞 = 「〜なこと/もの」関係代名詞 what の名詞節
            ・what = the thing(s) that と置き換え可能
            ・"What I want is rest." / "That's what I mean." / "Do what you want."
            ・決まり文句: That's what friends are for. / What goes around comes around.
            ・口語で強調や決意を表すのに頻出
            ・"What I want is ~" は相手にはっきり伝えるときの定番
            """
        ),
        GrammarQuestion(
            id: "q211",
            question: "I ___ my homework ___.",
            choices: ["haven't done / yet", "didn't do / yet", "haven't did / yet", "don't done / yet"],
            correctIndex: 0,
            translation: "「まだ宿題をやっていない」",
            explanation: """
            ・現在完了形の否定 = haven't / hasn't + 過去分詞
            ・yet(まだ)と組み合わせるのが定番
            ・過去形との違い: I didn't do it(過去の事実) vs I haven't done it yet(今も未完了)
            ・"Haven't seen you in ages!" = 久しぶり!(再会の挨拶)
            ・"Have you eaten yet?" = もう食べた?
            ・会話では haven't / hasn't はほぼ必ず短縮(発音 /ˈhævənt/)
            """
        ),
        GrammarQuestion(
            id: "q212",
            question: "I won't go ___ you come with me.",
            choices: ["if", "when", "unless", "until"],
            correctIndex: 2,
            translation: "「あなたが一緒に来ないなら、私は行かない」",
            explanation: """
            ・unless = 「〜しない限り・〜でないなら」(= if ... not)
            ・Unless you come = If you don't come
            ・"I'll go unless it rains." / "Unless I'm wrong, ~"
            ・現在・未来の条件にのみ使う。過去の仮定や反実仮想には不可
            ・× Unless I had known, I would have come.
            ・○ If I had known, I would have come.
            ・否定的な条件を簡潔に伝える便利な接続詞
            """
        ),
        GrammarQuestion(
            id: "q213",
            question: "I looked ___ for my keys, but I can't find them.",
            choices: ["everywhere", "anywhere", "somewhere", "nowhere"],
            correctIndex: 0,
            translation: "「鍵をあちこち探したけれど、見つからない」",
            explanation: """
            ・everywhere = 「いたるところで・どこでも」(肯定)
            ・anywhere = どこかに・どこにも(疑問・否定)
            ・somewhere = どこかに(肯定)、nowhere = どこにもない(否定)
            ・"I've been everywhere." / "Everywhere I go, ~"
            ・頻出フレーズ: in the middle of nowhere(何もない田舎)
            ・get nowhere / going nowhere = 進展しない
            ・口語では場所の比喩としても使う: This conversation is going nowhere.
            """
        ),
        GrammarQuestion(
            id: "q214",
            question: "Have you seen my phone ___?",
            choices: ["everywhere", "anywhere", "somewhere", "nowhere"],
            correctIndex: 1,
            translation: "「どこかで私のスマホを見ませんでしたか?」",
            explanation: """
            ・anywhere は主に 疑問文・否定文 で使う
            ・疑問: Have you seen it anywhere? / 否定: I can't find it anywhere.
            ・肯定では「どこでも自由に」: You can sit anywhere.
            ・somewhere は肯定文で「どこかに」(場所が決まっている感じ)
            ・"Anywhere is fine." = どこでもいい
            ・"I'd go anywhere with you." = 君となら世界中どこへでも
            ・anywhere from 10 to 20 = 10〜20の範囲で(数の幅を示す)
            """
        ),
        GrammarQuestion(
            id: "q215",
            question: "I'll call him ___ he's home.",
            choices: ["to see if", "for seeing if", "to see whether", "Both A and C"],
            correctIndex: 3,
            translation: "「彼が家にいるかどうか確かめるために電話する」",
            explanation: """
            ・to see if / whether = 「〜かどうか確かめるために」目的の不定詞
            ・to see if + 文 / to see whether + 文 ほぼ同じ意味
            ・whether の方が少しフォーマル
            ・"Let me check to see if it's open." / "I called to see if you needed help."
            ・頻出パターン: Let's see if ~ / Just to see if ~ / Curious to see if ~
            ・「とりあえず確認のために」というニュアンスで会話に頻出
            """
        ),
        GrammarQuestion(
            id: "q216",
            question: "___ my friends speak Spanish.",
            choices: ["Many of", "Many", "Much of", "Lots"],
            correctIndex: 0,
            translation: "「私の友人の多くがスペイン語を話す」",
            explanation: """
            ・many of + the/my/these + 複数名詞 = 「(特定の集団のうち)多くの〜」
            ・Many people like jazz(一般) vs Many of my friends came(特定の集団から)
            ・"Many of us agree." / "Many of these are broken."
            ・much は不可算名詞(time, water, money)、many は可算名詞
            ・口語では a lot of が多いが、フォーマルでは many of がよく使われる
            ・"Many of you may know ~" はプレゼンの定番表現
            """
        ),
        GrammarQuestion(
            id: "q217",
            question: "___ John ___ Mary came to the party.",
            choices: ["Either / or", "Neither / nor", "Both / and", "Not / but"],
            correctIndex: 1,
            translation: "「ジョンもメアリーもパーティーに来なかった」",
            explanation: """
            ・neither A nor B = 「AもBも〜ない」強い否定
            ・either A or B = 「AかBのどちらか」
            ・動詞は B(後ろの名詞)に合わせるのが原則
            ・Neither John nor his friends are here.(friends に合わせて are)
            ・"Neither do I." / "Me neither."(同意の否定)
            ・"That's neither here nor there." = それは無関係(決まり文句)
            ・Me neither は Me too の否定版
            """
        ),
        GrammarQuestion(
            id: "q218",
            question: "We can ___ walk ___ take the bus. It's up to you.",
            choices: ["neither / nor", "either / or", "both / and", "not / but"],
            correctIndex: 1,
            translation: "「歩いてもバスに乗ってもいい。あなた次第」",
            explanation: """
            ・either A or B = 「AかBのどちらか」二者択一
            ・動詞は B(後ろ)に合わせる
            ・"Either way works." = どちらでも構わない
            ・"It's either you or me." = 君か僕かだ
            ・否定文の最後で either: "I don't like it either."(私も好きじゃない)
            ・重要フレーズ: either way / one or the other / take it or leave it
            ・口語では either way が「どちらでもいい」の万能表現
            """
        ),
        GrammarQuestion(
            id: "q219",
            question: "I'm ___ tired today.",
            choices: ["little", "a little bit", "bit", "some little"],
            correctIndex: 1,
            translation: "「今日はちょっと疲れている」",
            explanation: """
            ・a little bit = 「ちょっと・少し」口語的で柔らかい強調
            ・a little bit + 形容詞 / a little bit of + 名詞
            ・段階: a tiny bit < a little bit < a bit(英) < kind of < somewhat(フォーマル)
            ・"Just a little bit." / "A little bit of everything."
            ・婉曲表現として: a little bit expensive(高すぎると言いにくいとき)
            ・直接的な表現を避けるために頻出
            """
        ),
        GrammarQuestion(
            id: "q220",
            question: "I ___ someone ___ my name.",
            choices: ["heard / call", "heard / to call", "hear / called", "heard / calling"],
            correctIndex: 0,
            translation: "「誰かが私の名前を呼ぶのが聞こえた」",
            explanation: """
            ・hear + 人 + V原形 = 「〜するのを最後まで聞く」(完了したアクション)
            ・hear + 人 + V-ing = 「〜しているのを聞く」(進行中)
            ・I heard him sing(一曲全部) vs I heard him singing(歌っている途中)
            ・同じパターン: see / watch / feel / notice + 人 + V/V-ing
            ・"I heard you talking." = 君が話してるのが聞こえた(やや非難)
            ・受動態では to が復活: I was heard to call his name.(試験頻出)
            ・※ 選択肢 D の calling もネイティブには自然
            """
        ),
        GrammarQuestion(
            id: "q221",
            question: "___ some milk in the fridge, but ___ no eggs.",
            choices: ["There is / there are", "There are / there is", "It is / they are", "There has / there has"],
            correctIndex: 0,
            translation: "「冷蔵庫に牛乳はあるけれど、卵はない」",
            explanation: """
            ・there is + 単数/不可算 / there are + 複数
            ・不可算名詞(water, milk, time, money, information, advice, news)→ there is
            ・可算複数(books, people, eggs, problems)→ there are
            ・要注意の不可算: furniture / advice / news / equipment
            ・"There's no time." / "There are too many people."
            ・口語の短縮: there is → there's(必ず短縮)
            ・※ "There's three of us." はネイティブもよく言うが、文法的には are が正
            """
        ),
        GrammarQuestion(
            id: "q222",
            question: "A: I'm a teacher. ___? B: I work at a bank.",
            choices: ["And you", "You also", "Are you", "What you"],
            correctIndex: 0,
            translation: "「A: 私は教師です。あなたは? B: 銀行員です」",
            explanation: """
            ・And you? = 「あなたは?」相手に同じ質問を返す定番
            ・And you?(中立) / What about you?(カジュアル) / How about you?(提案にも)
            ・"I'm good. And you?" / "I love jazz. What about you?"
            ・ネイティブは自分の話だけして終わらず、必ず相手に返す
            ・これがないと「自己中」と思われがち
            ・And you? / What about you? を入れるだけで会話が長く続く
            """
        ),
        GrammarQuestion(
            id: "q223",
            question: "\"Let's go to the beach!\" \"___ great!\"",
            choices: ["Sound", "Sounds", "Is sounding", "Sounded"],
            correctIndex: 1,
            translation: "「『海に行こう!』『いいね!』」",
            explanation: """
            ・(That) sounds + 形容詞 = 「〜だね」提案や情報への反応
            ・主語 That は省略可
            ・Sounds good! / Sounds great! / Sounds fun! / Sounds like a plan!
            ・"Sounds about right." = その通りだと思う
            ・同パターン: looks / feels / seems / tastes / smells + 形容詞
            ・sounds like + 名詞/文: "Sounds like a great idea." / "Sounds like he's tired."
            ・Sounds good! は OK の上位互換として超頻出
            """
        ),
        GrammarQuestion(
            id: "q224",
            question: "I'm ___ ___ this project. Let's move on.",
            choices: ["done / with", "doing / with", "done / about", "finished / for"],
            correctIndex: 0,
            translation: "「このプロジェクトはもう終わった。次に進もう」",
            explanation: """
            ・be done with ~ = 「〜を終えた・〜にうんざりした」口語表現
            ・2つの意味: 完了(I'm done with my homework) / うんざり(I'm done with him)
            ・"Are you done?" / "I'm done!" / "Done deal."
            ・"I'm done with this conversation." = この会話はもう終わり(怒り気味)
            ・I'm finished(フォーマル) vs I'm done(カジュアル)
            ・口語では I'm done が圧倒的に頻出
            """
        ),
        GrammarQuestion(
            id: "q225",
            question: "I need to ___ my hair ___ before the wedding.",
            choices: ["cut / get", "get / cut", "getting / cut", "get / cutting"],
            correctIndex: 1,
            translation: "「結婚式の前に髪を切ってもらう必要がある」",
            explanation: """
            ・get + 物 + 過去分詞 = 「〜してもらう・〜される」
            ・典型例: get my hair cut / get my car fixed / get my eyes checked / get something done
            ・have + 物 + 過去分詞 も同じ意味だがやや改まった
            ・"Get it done." / "Need to get this finished."
            ・被害も表せる: I got my wallet stolen.(財布を盗まれた)
            ・have(フォーマル) vs get(カジュアル) → 口語では get が頻出
            """
        ),
        GrammarQuestion(
            id: "q226",
            question: "We ___ the roof ___ last week.",
            choices: ["had / repaired", "had / repairing", "having / repaired", "have / repair"],
            correctIndex: 0,
            translation: "「先週、屋根を修理してもらった」",
            explanation: """
            ・have + 物 + 過去分詞 = 「〜してもらう」使役構文(ややフォーマル)
            ・典型例: have the car serviced / have a tooth pulled / have a meal delivered
            ・"I had my hair done." / "We're having the kitchen renovated."
            ・被害も表せる: I had my bag stolen.(バッグを盗まれた)
            ・ビジネス・プロの仕事 → have、日常 → get が頻出
            ・get と意味は同じだが、have の方がフォーマル
            """
        ),
        GrammarQuestion(
            id: "q227",
            question: "___ his brother, John is very quiet.",
            choices: ["Unlike", "Unlikely", "Dislike", "Not like"],
            correctIndex: 0,
            translation: "「彼の兄(弟)と違って、ジョンはとても静かだ」",
            explanation: """
            ・unlike + 名詞 = 「〜と違って」前置詞
            ・"Unlike me, she's confident." / "Unlike yesterday, today is sunny."
            ・文頭・文中・文末いずれも可
            ・反対語: like + 名詞 = 「〜と同じく」
            ・"Like his brother, John is quiet."(兄と同様、ジョンは静か)
            ・「予想を裏切る」ニュアンスで比較・対比を強調する
            """
        ),
        GrammarQuestion(
            id: "q228",
            question: "It's ___ ___ rain today — the sky is clear.",
            choices: ["unlikely / to", "unlike / to", "unlikely / for", "not likely / for"],
            correctIndex: 0,
            translation: "「今日は雨が降りそうにない — 空は晴れている」",
            explanation: """
            ・unlikely(形容詞) = 「ありそうもない・〜しそうにない」
            ・be unlikely to + 動詞 / It's unlikely that + 文
            ・"He's unlikely to come." / "Highly unlikely."
            ・段階: very likely > likely > unlikely > highly unlikely > no way(口語)
            ・unlike(前置詞)と unlikely(形容詞)の混同に注意
            ・語末の -ly が形容詞を作っている
            """
        ),
        GrammarQuestion(
            id: "q229",
            question: "I ___ really busy ___.",
            choices: ["was / lately", "am / lately", "have been / lately", "had been / lately"],
            correctIndex: 2,
            translation: "「最近本当に忙しい」",
            explanation: """
            ・I've been + 形容詞/-ing + lately = 「最近〜だ・〜している」
            ・現在完了進行形は過去から現在まで継続している状態を表す
            ・"I've been busy lately." / "I've been thinking about you."
            ・組合せる時間表現: lately / recently / for a while / for the past few weeks
            ・近況の定番: "What have you been up to?" / "How have you been?"
            ・「最近・ここのところ」のニュアンス
            """
        ),
        GrammarQuestion(
            id: "q230",
            question: "Have you seen John ___?",
            choices: ["late", "lately", "later", "the late"],
            correctIndex: 1,
            translation: "「最近ジョンに会った?」",
            explanation: """
            ・lately = 「最近・近頃」副詞、主に現在完了形と一緒に
            ・late(遅い/遅く)、lately(最近)、later(後で)を混同しない
            ・"I haven't slept well lately." / "Seen any good movies lately?"
            ・lately は主に現在完了、recently は過去形・現在完了どちらも
            ・○ I saw him recently. / △ I saw him lately.
            ・○ I've seen him lately/recently 両方OK
            """
        ),
        GrammarQuestion(
            id: "q231",
            question: "First, let's discuss budget. ___, we'll vote on the proposal.",
            choices: ["Last of all", "The last", "Lastly only", "At final"],
            correctIndex: 0,
            translation: "「まず予算を話し合おう。最後に提案について投票する」",
            explanation: """
            ・last of all = 「最後の最後に」強い終結感
            ・first of all(まず最初に) / last of all(最後に) / above all(何よりも)
            ・"First of all, thank you. Last of all, congratulations."
            ・使い分け: finally(ついに) / lastly(最後に) / last of all(最後の最後に強調) / in conclusion(結論として)
            ・スピーチの最後に "Last of all, I'd like to thank ~" でまとまり感
            ・フォーマルな締めくくり表現
            """
        ),
        GrammarQuestion(
            id: "q232",
            question: "\"___ the party tonight?\" \"Yes, I am.\"",
            choices: ["Are you going to", "Do you go to", "Will you go", "You going"],
            correctIndex: 0,
            translation: "「『今夜のパーティーに行くの?』『うん、行く』」",
            explanation: """
            ・Are you going to + 動詞原形/場所 = 「〜するつもり?/〜に行くの?」
            ・going to + 動詞原形(計画・意図) / going to + 場所(物理的に行く)
            ・going to V = 計画・意図(I'm going to call him 電話するつもり = 決めてる)
            ・will V = 今決めた・予測(I'll call him 電話する = その場で決定)
            ・口語短縮: going to → gonna(発音上)
            ・書く時は going to、話す時は gonna が自然
            """
        ),
        GrammarQuestion(
            id: "q233",
            question: "\"___ call you later, OK?\"",
            choices: ["I'll", "I'm gonna", "I'm going", "Both A and B"],
            correctIndex: 3,
            translation: "「後で電話するね、いい?」",
            explanation: """
            ・I'm gonna ~ は I'm going to ~ の口語短縮形、超頻出
            ・書き言葉: I'm going to call、話し言葉: I'm gonna call /ˈaɪmˈɡʌnə/
            ・"I'm gonna grab coffee." / "Gonna go now." / "You gonna eat that?"
            ・似た短縮: wanna(want to)/gotta(got to)/gimme(give me)/lemme(let me)
            ・dunno(don't know)/kinda(kind of)/sorta(sort of)
            ・will との違い: I'll call(その場で決めた) vs I'm gonna call(前から決めてた)
            """
        ),
        GrammarQuestion(
            id: "q234",
            question: "\"Which book do you want?\" \"___.\"",
            choices: ["This", "This one", "This it", "The this"],
            correctIndex: 1,
            translation: "「『どの本が欲しい?』『これ』」",
            explanation: """
            ・this one = 「これ」one は前述の名詞の代わりに使う代名詞
            ・this one / that one / these (ones) / those (ones)
            ・"I'll take this one." / "Not that one — this one."
            ・代名詞 one は具体名詞の繰り返しを避けるため: I want a red one.
            ・"Got a smaller one?" / "Just this one." / "Not this one."
            ・買い物・選択の場面で必須
            """
        ),
        GrammarQuestion(
            id: "q235",
            question: "This is ___ ___ interesting than the last one.",
            choices: ["much / more", "way / more", "very / more", "more / way"],
            correctIndex: 0,
            translation: "「これは前のよりずっと面白い」",
            explanation: """
            ・比較級を強める副詞: much / way / a lot / far
            ・much + 比較級(中立) / way + 比較級(口語強調) / a lot + 比較級(カジュアル) / far + 比較級(やや改まった)
            ・"Way better!" / "Way too expensive." / "Way more fun."
            ・way の口語用法: Way to go!(よくやった!)/ No way!(まさか) / By the way(ところで)
            ・フォーマルな強調: significantly / considerably / substantially
            ・※ 選択肢 B "way / more" もネイティブには自然
            """
        ),
        GrammarQuestion(
            id: "q236",
            question: "This situation ___ immediate action.",
            choices: ["calls at", "calls for", "calls to", "calls about"],
            correctIndex: 1,
            translation: "「この状況は早急な行動を必要としている」",
            explanation: """
            ・call for + 名詞 = 「〜を必要とする・求める」句動詞
            ・主な意味: 必要とする(The recipe calls for sugar.) / 求める(Call for help.) / ふさわしい(This calls for celebration!)
            ・"That calls for a drink!" = 乾杯だ!
            ・call の句動詞: call off(中止) / call up(電話) / call on(訪問) / call back(折り返し) / call out(批判)
            ・"This calls for ~" は乾杯やパーティーを提案するときの定番
            """
        ),
        GrammarQuestion(
            id: "q237",
            question: "___ ___ better to wait until tomorrow?",
            choices: ["Wouldn't it / be", "Would it not / be", "Isn't it / be", "Wouldn't / it"],
            correctIndex: 0,
            translation: "「明日まで待った方がよくない?」",
            explanation: """
            ・Wouldn't it be better to + 動詞 = 「〜した方がよくない?」婉曲な提案(仮定法)
            ・"Wouldn't it be nice to go?" / "Wouldn't it be great if ~?"
            ・提案の婉曲表現 強い順:
            ・You should ~(直接) → You'd better ~(少し強) → Why don't we ~?(提案)
            ・→ Wouldn't it be better to ~?(婉曲) → Maybe we could ~?(最も控えめ)
            ・自分の意見を押し付けず、相手に考えさせる効果。ビジネスや人間関係で重宝
            """
        ),
        GrammarQuestion(
            id: "q238",
            question: "___ you make perfect coffee.",
            choices: ["This is what", "This is how", "This how is", "How this is"],
            correctIndex: 1,
            translation: "「こうやって完璧なコーヒーを淹れる」",
            explanation: """
            ・This is how + 主語 + 動詞 = 「こうやって〜する」説明・実演の構文
            ・"This is how it works." / "That's how I met her." / "That's how it is."
            ・how は「方法」を表す関係副詞、独立して名詞節を作る
            ・類似: This is what I mean. / That's why I came. / This is when it happened. / That's where we met.
            ・料理動画・チュートリアルで頻出
            ・説明や物語で「こうやって〜」と展開するのに最適
            """
        ),
        GrammarQuestion(
            id: "q239",
            question: "Can I ___ ___ the manager, please?",
            choices: ["speak / to", "speak / about", "talk / for", "say / to"],
            correctIndex: 0,
            translation: "「マネージャーとお話しできますか?」",
            explanation: """
            ・speak to + 人 = 「〜と話す」電話や直接対話で
            ・"Can I speak to Mr. Smith?"(電話の鉄板)
            ・speak to(英国式・一般的) / speak with(米国式・よりフォーマル)
            ・"I need to speak to you." はやや真剣な響き
            ・"Speak to me!" = 何か言って!(沈黙への苛立ち)
            ・"I need to speak to you about ~" は「真剣な話がある」と切り出すフレーズ
            """
        ),
        GrammarQuestion(
            id: "q240",
            question: "I'd like to ___ ___ our new project.",
            choices: ["speak / to", "speak / about", "speak / at", "speak / of"],
            correctIndex: 1,
            translation: "「私たちの新しいプロジェクトについて話したい」",
            explanation: """
            ・speak about + 話題 = 「〜について話す」
            ・speak of + 話題 = 〜について言う(ややフォーマル)
            ・speak to + 人 = 〜と話す
            ・"Speaking of which ~" = そう言えば〜
            ・"Speak of the devil!" = うわさをすれば!(決まり文句)
            ・"Nothing to speak of." = 大したことではない
            ・ビジネスでは speak about、日常では talk about が一般的
            """
        ),
        GrammarQuestion(
            id: "q241",
            question: "What are you guys ___ ___?",
            choices: ["talking / about", "talking / on", "saying / about", "speaking / for"],
            correctIndex: 0,
            translation: "「君たち何の話してるの?」",
            explanation: """
            ・talk about + 話題 = 「〜について話す」(超頻出・カジュアル)
            ・talk to/with + 人 = 〜と話す
            ・"What are you talking about?" は驚き・困惑の鉄板
            ・"Now you're talking!" = そうこなくっちゃ!
            ・"Talk about + 名詞!" は「まさに〜だ!」の感嘆: Talk about lucky!
            ・"Speaking of which ~" = そう言えば〜
            ・speak(改まった) vs talk(カジュアル・双方向)
            """
        ),
        GrammarQuestion(
            id: "q242",
            question: "I need to ___ ___ you about something important.",
            choices: ["talk / to", "talk / about", "speak / for", "say / to"],
            correctIndex: 0,
            translation: "「大事な話があるんだ」",
            explanation: """
            ・talk to + 人 = 「〜と話す」(カジュアル・超頻出)
            ・talk with + 人 = 〜と話し合う(やや改まった)
            ・"Can I talk to you?" / "We need to talk."(やや重い)
            ・"I'm not talking to you." = もう口きかない(怒り)
            ・別れ際の定番: "Talk to you later."
            ・電話の決まり文句: "Who am I talking to?"
            ・日常会話ではほぼ talk to を使う
            """
        ),
        GrammarQuestion(
            id: "q243",
            question: "This will take a few hours, ___ ___ all day.",
            choices: ["if / not", "when / not", "but / not", "and / not"],
            correctIndex: 0,
            translation: "「これには数時間、もしかして一日中かかるかも」",
            explanation: """
            ・if not = 「もしそうでなければ・〜ないにせよ」条件節の省略形
            ・「もしそうでないなら」: "Are you coming? If not, let me know."
            ・「〜ないにせよ」: "It'll take hours, if not days."
            ・「〜でなければ何だ?」(反語): "If not now, when?"
            ・"Good, if not great." / "Difficult, if not impossible."
            ・"Most, if not all." = ほとんど、いや全てかも
            ・「控えめに見積もって〜、もしかして〜」の幅を持たせる表現
            """
        ),
        GrammarQuestion(
            id: "q244",
            question: "I ___ wanted to say thanks.",
            choices: ["just", "only", "merely", "Both A and B"],
            correctIndex: 3,
            translation: "「ただお礼が言いたかっただけ」",
            explanation: """
            ・just は多義的で口語超頻出: ただ〜だけ/ちょうど/今しがた/まさに
            ・"Just a moment." / "Just in time." / "I just got here."
            ・"Just stop it!" = 強調「もうやめてよ!」
            ・口語決まり文句: Just kidding / Just saying / Just relax / Just because
            ・要求や発言をやわらげる効果が大: Wait!(強) vs Just wait(柔らかい)
            ・only も「ただ〜だけ」の意味で使えるため両方正解
            ・口語では just がより自然
            """
        ),
        GrammarQuestion(
            id: "q245",
            question: "___ ___ for the bus, I read a book.",
            choices: ["While / waiting", "Where / waiting", "When / wait", "While / wait"],
            correctIndex: 0,
            translation: "「バスを待っている間、本を読んだ」",
            explanation: """
            ・while + V-ing = 「〜している間に」(主語と be動詞の省略)
            ・While waiting = While I was waiting
            ・主語が主節と同じ場合に省略可能
            ・"While cooking, I listen to music." / "While driving, don't text."
            ・while(接続詞 + 節/V-ing) vs during(前置詞 + 名詞)
            ・○ During the meeting / × While the meeting
            ・"While you're at it, ~" = そのついでに〜(便利な口語表現)
            """
        ),
        GrammarQuestion(
            id: "q246",
            question: "I ate the ___ pizza by myself.",
            choices: ["all", "every", "whole", "total"],
            correctIndex: 2,
            translation: "「ピザを一人で丸ごと食べた」",
            explanation: """
            ・whole = 「全体の・丸ごと」単数の可算名詞を修飾
            ・the whole + 単数名詞 = 〜全体
            ・"The whole story." / "The whole point." / "A whole new world."
            ・all + 複数/不可算 vs whole + 単数
            ・口語の万能フレーズ: the whole thing(全体)
            ・"I missed the whole thing." / "Forget the whole thing."
            ・強調の重複: the whole entire ~
            """
        ),
        GrammarQuestion(
            id: "q247",
            question: "We spent the ___ day at the beach.",
            choices: ["entire", "entirely", "every", "all"],
            correctIndex: 0,
            translation: "「一日中ビーチで過ごした」",
            explanation: """
            ・entire = 「全体の・全部の」whole とほぼ同じだがやや改まった強調
            ・the entire + 単数名詞 = 〜全体
            ・whole(一般・カジュアル) vs entire(改まった・強調)
            ・"The entire room was silent." / "My entire life ~"
            ・よく組む名詞: entire family / entire collection / entire population
            ・副詞形 entirely: "Not entirely true." / "I entirely agree."
            ・プレゼンや書き言葉で強調したいときは entire の方が映える
            """
        ),
        GrammarQuestion(
            id: "q248",
            question: "I'd like coffee, ___.",
            choices: ["as well", "as much", "too well", "so well"],
            correctIndex: 0,
            translation: "「私もコーヒーをお願い」",
            explanation: """
            ・as well = 「〜も」文末表現、too よりやや改まった
            ・also(文中・改まった) / too(文末・カジュアル) / as well(文末・やや改まった)
            ・"He came as well." / "Why not invite Tom as well?"
            ・区別: as well(単独) vs as well as + 名詞(〜と同様に・〜だけでなく)
            ・"He speaks French as well as Spanish."
            ・might as well / may as well = どうせなら〜(諦め混じり)
            ・イギリス英語では as well が too より頻出
            """
        ),
        GrammarQuestion(
            id: "q249",
            question: "___, prevention is better than cure.",
            choices: ["In many cases", "Many in cases", "In case many", "On many cases"],
            correctIndex: 0,
            translation: "「多くの場合、予防は治療に勝る」",
            explanation: """
            ・in many cases = 「多くの場合」フォーマル寄りの副詞句
            ・in most cases / in some cases / in this case
            ・"In many cases, it works." / "In most cases, yes."
            ・"Just in case." = 念のため
            ・"Bring a coat, just in case." / "in case of fire" / "in case of emergency"
            ・類似: often / generally / usually / as a rule(概して)
            ・ビジネスやプレゼンで論じる時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q250",
            question: "I didn't ___ ___ ___. What a surprise!",
            choices: ["see / it / coming", "saw / it / coming", "see / coming / it", "seen / it / come"],
            correctIndex: 0,
            translation: "「予想外だった!何という驚き!」",
            explanation: """
            ・see + 物 + coming = 「〜を予測する・予感する」口語表現
            ・"I didn't see that coming!" = 予想外!
            ・"I saw it coming a mile away." = はるか前から予測してた
            ・"We should have seen this coming." = 予測すべきだった
            ・類似表現: Out of the blue / Caught me off guard / Came out of nowhere
            ・別れ・解雇・サプライズ・悪い知らせなどショッキングな出来事に頻出
            ・「気配を察する」というニュアンスで日常会話に欠かせない
            """
        ),
        GrammarQuestion(
            id: "q251",
            question: "___ ___ until you reach the corner.",
            choices: ["Keep / walking", "Keep / walk", "Keep / to walk", "Keeping / walk"],
            correctIndex: 0,
            translation: "「角に着くまで歩き続けて」",
            explanation: """
            ・keep + V-ing = 「〜し続ける」継続表現
            ・keep on + V-ing = 〜し続ける(強調)
            ・"Keep going!" / "Keep trying." / "Don't keep me waiting." / "Keep it up!"
            ・励まし: "Keep at it." / "Keep your head up."
            ・keep + 形容詞: Keep quiet / Keep calm
            ・keep + 名詞 + 形容詞: "Keep the door open."
            ・continue to V(フォーマル) vs keep V-ing(口語的)
            """
        ),
        GrammarQuestion(
            id: "q252",
            question: "I love fruits ___ ___ apples and oranges.",
            choices: ["such / as", "such / like", "like / as", "as / such"],
            correctIndex: 0,
            translation: "「リンゴやオレンジのような果物が好き」",
            explanation: """
            ・such as = 「〜のような」具体例の列挙(フォーマル)
            ・like + 例 = 〜のような(カジュアル)
            ・"Fruits such as apples"(書き言葉) vs "Fruits like apples"(話し言葉)
            ・"colors such as red, blue, and green"
            ・口語では like がほぼ常用、エッセイやレポートでは such as
            ・派生表現: as such = そのため・それ自体(次問詳述)
            """
        ),
        GrammarQuestion(
            id: "q253",
            question: "He's the boss, and ___ ___, he makes the final decisions.",
            choices: ["such / as", "as / such", "like / that", "so / much"],
            correctIndex: 1,
            translation: "「彼はボスで、そういうわけで最終決定を下す」",
            explanation: """
            ・as such = 「そのため・それ自体・そういうわけで」フォーマルな接続副詞
            ・「結果」: "As such, we proceed."
            ・「限定」: "It's not a problem as such." = それ自体は問題ではない
            ・"He's not a teacher as such, but he teaches." = 厳密には教師じゃないが教えている
            ・such as(例の導入) vs as such(結論) ── 語順で意味が全く逆転
            ・フォーマルな結論: therefore / thus / hence / as such
            ・アカデミックな英語で頻出
            """
        ),
        GrammarQuestion(
            id: "q254",
            question: "I'm ___ sorry for what happened.",
            choices: ["genuine", "generous", "genuinely", "genuinity"],
            correctIndex: 2,
            translation: "「起きてしまったことを心からお詫びします」",
            explanation: """
            ・genuinely = 「心から・本当に」副詞、誠実さを強調
            ・really(カジュアル・多用) vs genuinely(誠実さ強調・改まった) vs truly(フォーマル)
            ・"I'm genuinely sorry." / "Genuinely surprised." / "Genuinely interested."
            ・効果的な場面: 謝罪・興味の表明・称賛
            ・"Genuinely impressive!" = 本当に素晴らしい
            ・genuine(形容詞): genuine smile / genuine concern / genuine leather
            ・お世辞ではなく本心からを強調したい時に
            """
        ),
        GrammarQuestion(
            id: "q255",
            question: "___ ___ your weekend?",
            choices: ["How / was", "How / is", "What / was", "How / it was"],
            correctIndex: 0,
            translation: "「週末はどうだった?」",
            explanation: """
            ・How was + 名詞? = 「〜はどうだった?」過去の経験を尋ねる定番
            ・"How was your day?" / "How was the trip?" / "How was it?"
            ・返答例: Pretty good! / Not bad. / Could've been better. / Awesome! / Tiring.
            ・類似: How's it going?(現在) / How are things? / How did it go?(出来事)
            ・区別: How is ~?(現在) / How was ~?(過去) / How will ~ be?(未来)
            ・"How was your weekend?" は月曜の朝の英語圏の挨拶代わり
            """
        ),
        GrammarQuestion(
            id: "q256",
            question: "___ ___ on a tropical beach right now.",
            choices: ["Imagine / be", "Imagine / to be", "Imagine / being", "Imagined / be"],
            correctIndex: 2,
            translation: "「今、南国のビーチにいることを想像してみて」",
            explanation: """
            ・imagine + V-ing = 「〜することを想像する」動名詞を取る
            ・imagine + 名詞 / + that 節 も可
            ・"Imagine being rich!" / "Can you imagine living abroad?"
            ・動名詞のみを取る動詞: enjoy / avoid / finish / suggest / consider / mind / miss
            ・口語の感嘆: "Just imagine!" / "Can you imagine?" / "I can't imagine."
            ・驚きや空想を表現するときに頻出
            """
        ),
        GrammarQuestion(
            id: "q257",
            question: "You ___ ___ tired after such a long flight.",
            choices: ["must / be", "must / been", "must / have", "have / been"],
            correctIndex: 0,
            translation: "「こんなに長いフライトの後、お疲れでしょう」",
            explanation: """
            ・must be + 形容詞 = 「〜に違いない」現在の推量
            ・must have + 過去分詞 = 「〜だったに違いない」過去の推量
            ・"You must be tired." / "That must be expensive."
            ・must の二大用法: 義務 vs 推量
            ・推量の確信度: must(90%+) > should(70%) > might/may(50%) > could(40%)
            ・過去の推量: "He must have left." / "It must have been hard."
            ・「お察しします」のニュアンスで気遣いを表す表現
            """
        ),
        GrammarQuestion(
            id: "q258",
            question: "Are you ___ ___ the exam?",
            choices: ["ready / for", "ready / to", "prepared / about", "ready / with"],
            correctIndex: 0,
            translation: "「試験の準備はできた?」",
            explanation: """
            ・ready for + 名詞 = 「〜の準備ができている」
            ・ready to + 動詞 = 〜する準備ができている
            ・"Ready for the trip?" / "I'm ready for anything." / "Ready for bed?"
            ・"Ready for breakfast?"(名詞) vs "Ready to eat?"(動詞)
            ・決まり文句: "Ready or not, here I come!"(かくれんぼ)
            ・派生: all set / good to go / primed and ready
            ・"Ready?" は「もう行ける?」の超頻出表現
            """
        ),
        GrammarQuestion(
            id: "q259",
            question: "___ ___ shouldn't be made hastily.",
            choices: ["Such / decisions", "Decisions / such", "These / such", "Such / decision"],
            correctIndex: 0,
            translation: "「そのような決定は急いで下すべきではない」",
            explanation: """
            ・such + 複数/不可算名詞 = 「そのような〜」
            ・such a + 単数可算名詞: "Such a beautiful day!"
            ・"Such decisions"(複数) / "Such information"(不可算) / "Such a decision"(単数)
            ・強調: "Such fun!" / "Such style!" / "Such talent!"
            ・so + 形容詞(so beautiful) vs such a + 形容詞 + 名詞(such a beautiful day)
            ・口語の感嘆: "Such a ~!" は「なんて〜!」の鉄板
            """
        ),
        GrammarQuestion(
            id: "q260",
            question: "I'd be ___ ___ help you with this.",
            choices: ["delighted / to", "delighted / for", "delight / to", "delight / for"],
            correctIndex: 0,
            translation: "「喜んでお手伝いいたします」",
            explanation: """
            ・be delighted to + 動詞 = 「喜んで〜する」フォーマル寄り
            ・"I'd be delighted to come." / "Delighted to meet you."
            ・喜びの強度: happy < pleased < delighted < thrilled < over the moon < stoked
            ・ビジネス頻出: "We're delighted to announce ~" / "Delighted to have you on board."
            ・招待や提案を快諾する時、フォーマルさを保ちつつ熱意を伝える最適表現
            """
        ),
        GrammarQuestion(
            id: "q261",
            question: "\"Wanna grab dinner tomorrow?\" \"___ ___!\"",
            choices: ["I'd / love to", "I love / it", "I'm / loving", "I'd / like for"],
            correctIndex: 0,
            translation: "「『明日ご飯どう?』『ぜひ!』」",
            explanation: """
            ・I'd love to = 「ぜひしたい」超頻出の快諾表現(I would love to の短縮)
            ・"I'd love to!" / "I'd love to come." / "I'd love to try."
            ・丁寧な断り: "I'd love to, but I'm busy." / "I'd love to, but I have plans."
            ・強度: I'd like to < I'd love to < I'd be delighted to
            ・口語カジュアル: "Love to!" / "Sure, why not!" / "Sounds great!"
            ・誘いに対する応答として最重要表現の一つ
            """
        ),
        GrammarQuestion(
            id: "q262",
            question: "___ ___ he forgot our meeting.",
            choices: ["It seems / that", "It seemed / that", "Seems / it", "That seems"],
            correctIndex: 0,
            translation: "「彼は会議を忘れたようだ」",
            explanation: """
            ・It seems that + 文 = 「〜のようだ」間接的な推量
            ・It seems + 形容詞 / It seems like + 名詞/文 も可
            ・"It seems that he's late." / "It seems like rain." / "It seems impossible."
            ・口語では that がよく省略: "It seems he forgot." / "Seems he forgot."(it も省略)
            ・類似: It appears that(フォーマル) / It looks like(カジュアル) / Apparently
            ・確信度: It must be(強) > It seems(中) > It could be(弱)
            ・"Seems about right." / "It seems so." / "So it seems."
            """
        ),
        GrammarQuestion(
            id: "q263",
            question: "\"He doesn't like my haircut.\" \"___?\"",
            choices: ["Who cares", "Who caring", "Whose care", "Who about"],
            correctIndex: 0,
            translation: "「『彼が私の髪型を気に入らないって』『どうでもいいじゃん』」",
            explanation: """
            ・Who cares? = 「誰が気にする?」=「気にしない・どうでもいい」反語的口語
            ・"Who cares what he thinks?" / "Who cares anyway?"
            ・段階: I don't mind(柔らかい) → I don't care(中立) → Who cares?(強い) → As if I care!(皮肉)
            ・注意: 相手の悩みに対して使うとデリカシー欠落: A: I lost my keys. B: Who cares? ← 失礼
            ・軽い話題や自虐の場面で使うのが安全
            ・派生: What does it matter? / So what? / Big deal.
            """
        ),
        GrammarQuestion(
            id: "q264",
            question: "This is the place ___ ___ ___.",
            choices: ["where / we / met", "we / where / met", "where / met / we", "we / met / where"],
            correctIndex: 0,
            translation: "「ここが私たちが出会った場所だ」",
            explanation: """
            ・where + 主語 + 動詞 = 場所を表す関係副詞
            ・the place where SV / the city where SV / the country where SV
            ・"This is where I work." / "Tokyo is where I grew up."
            ・関係副詞 where = in/at which と置き換え可
            ・先行詞なしでも使える: "Show me where to go." / "That's where you're wrong."
            ・口語の決まり文句: "Where I come from ~" / "Where I'm from ~"
            ・文化の違いを語る時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q265",
            question: "I'm learning Spanish, and I'm ___ ___ French.",
            choices: ["also / studying", "studying / also", "also / study", "study / also"],
            correctIndex: 0,
            translation: "「スペイン語を学んでいて、フランス語も勉強している」",
            explanation: """
            ・be動詞 + also + ~ / also + 一般動詞 / 助動詞 + also + V
            ・"I'm also studying French." / "He's also coming."
            ・also(中立・フォーマル) / too(文末・カジュアル) / as well(文末・やや改まった)
            ・"I also like coffee." / "I like coffee too." / "I like coffee as well." 全て同じ
            ・文頭の Also: "Also, we need bread."(それと、パンも要る)
            ・進行形と組み合わせる時の語順を間違えやすいので注意
            """
        ),
        GrammarQuestion(
            id: "q266",
            question: "The man ___ ___ ___ the meeting was late.",
            choices: ["who / led / yesterday", "which / led / yesterday", "who / leading / yesterday", "was / led / yesterday"],
            correctIndex: 0,
            translation: "「昨日会議を進行した男性は遅刻した」",
            explanation: """
            ・先行詞(人) + who + 動詞 = 関係代名詞 who、人を後ろから説明
            ・"The girl who called me." / "Anyone who agrees." / "People who travel."
            ・who(主格) vs whom(目的格・フォーマル・古め)
            ・口語では whom はあまり使わず who か that で代用
            ・目的格は省略可能: "The man I met." / "The book I read."
            ・"Whoever wins gets the prize." / "I'm the one who called."
            """
        ),
        GrammarQuestion(
            id: "q267",
            question: "I ___ ___ where my keys are.",
            choices: ["have no / clue", "have a / clue", "don't have / clue", "am not / clue"],
            correctIndex: 0,
            translation: "「鍵がどこにあるかさっぱり分からない」",
            explanation: """
            ・have no clue = 「全く分からない」強い否定の口語表現
            ・"I have no clue." / "No clue!" / "Not a clue." / "He doesn't have a clue."
            ・段階: not sure(弱) < don't know(中) < no idea(強) < no clue(強・口語) < Beats me(カジュアル)
            ・clue(手がかり)の他: "Got a clue?" / "Give me a clue." / "He's clueless."
            ・派生: clueless(形容詞・何も分かっていない) "Totally clueless."
            ・困った時、答えに窮した時のリアクション
            """
        ),
        GrammarQuestion(
            id: "q268",
            question: "___ ___ my friends came to the party.",
            choices: ["None / of", "No / of", "Not / of", "Nothing / of"],
            correctIndex: 0,
            translation: "「友達の誰もパーティーに来なかった」",
            explanation: """
            ・none of + 限定された名詞 = 「〜のうち一人/一つも〜ない」強い否定
            ・"None of us agree." / "None of this matters."
            ・"None of your business." = お前に関係ない(決まり文句)
            ・動詞の一致: 正式には単数、口語では複数も可
            ・no + 名詞(一般) vs none of + 限定名詞(特定の集団から)
            ・"None other than ~" = 他ならぬ〜 / "Second to none." = 誰にも劣らない(最高)
            ・"None for me, thanks." = 私はいらない、ありがとう
            """
        ),
        GrammarQuestion(
            id: "q269",
            question: "\"What did you do today?\" \"___ much.\"",
            choices: ["Anything", "Nothing", "Something", "Everything"],
            correctIndex: 1,
            translation: "「『今日何した?』『大したことしてない』」",
            explanation: """
            ・Nothing much. = 別に何も(近況の返事の鉄板)
            ・"Nothing's wrong." / "It's nothing." = 大したことない
            ・nothing to + V: "Nothing to do." / "Nothing to say." / "Nothing to worry about."
            ・強調: Nothing at all / Absolutely nothing / Sweet nothing(甘い囁き)
            ・"A: Thank you so much! B: Oh, it's nothing." = いえいえ、大したことじゃない
            ・「気にしないで」のニュアンスで応答に頻出
            """
        ),
        GrammarQuestion(
            id: "q270",
            question: "This is ___ ___ ___ big as that one.",
            choices: ["twice / as / as", "two / times / as", "twice / more / than", "two / as / as"],
            correctIndex: 0,
            translation: "「これはあれの2倍の大きさだ」",
            explanation: """
            ・twice as + 形容詞 + as = 「〜の2倍…」倍数比較
            ・three times as + 形容詞 + as = 〜の3倍…
            ・half as + 形容詞 + as = 〜の半分の…
            ・"Twice as big." / "Three times as expensive." / "Half as long."
            ・2倍 = twice、3倍以上 = times(× two times は通常 twice を使う)
            ・口語: "Twice the size." / "Twice the price." / "Twice the fun."
            ・「半分」「2倍」を表現する時の必須パターン
            """
        ),
        GrammarQuestion(
            id: "q271",
            question: "This is the ___ day of my week.",
            choices: ["busy", "busier", "busiest", "most busy"],
            correctIndex: 2,
            translation: "「今週で一番忙しい日だ」",
            explanation: """
            ・busy の最上級は busiest(-y で終わる形容詞は y → i + est)
            ・happy → happiest / easy → easiest / pretty → prettiest
            ・短い形容詞: -est、長い形容詞: most、不規則: good→best / bad→worst
            ・"The busiest day." / "The busiest time of year."
            ・最上級の強調: by far the busiest / easily the busiest / the very busiest
            ・「これまでで一番〜」を表現する時の基本
            """
        ),
        GrammarQuestion(
            id: "q272",
            question: "___ ___ me, I prefer coffee over tea.",
            choices: ["As / for", "For / me", "About / for", "As / to"],
            correctIndex: 0,
            translation: "「私はと言えば、紅茶よりコーヒーが好き」",
            explanation: """
            ・as for + 名詞/代名詞 = 「〜については・〜に関して言えば」話題転換
            ・"As for me, I'm fine." / "As for tomorrow, I'm free."
            ・類似: about / regarding / with regard to(フォーマル) / when it comes to
            ・区別: "As for me"(話題切り替え) vs "About me"(中立) vs "When it comes to me"(強調)
            ・通常は文頭で話題を切り替える
            ・複数の話題を扱う時に「次は〜については」と切り替える便利な表現
            """
        ),
        GrammarQuestion(
            id: "q273",
            question: "This is ___ ___ the best restaurant in town.",
            choices: ["by / far", "by / much", "of / far", "much / by"],
            correctIndex: 0,
            translation: "「ここは町で圧倒的に最高のレストランだ」",
            explanation: """
            ・by far = 「はるかに・圧倒的に」最上級や比較級を強める
            ・"By far the best." / "By far the most expensive." / "Better by far."
            ・強さ: by far > far > much > a lot > slightly > a bit
            ・位置: by far + 最上級(by far the best) / 比較級 + by far(better by far) 両方可
            ・口語: Easily the best / Hands down the best / By a long shot
            ・「他とは段違い」を伝える鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q274",
            question: "I ___ ___ ___ for two hours and I'm exhausted.",
            choices: ["have / been / running", "had / been / running", "am / running / been", "have / been / run"],
            correctIndex: 0,
            translation: "「2時間走り続けてヘトヘトだ」",
            explanation: """
            ・have been + V-ing = 現在完了進行形「ずっと〜している」
            ・had been + V-ing = 過去完了進行形「ずっと〜していた」
            ・"I've been running for two hours." / "She's been working hard."
            ・have V-ed(状態的) vs have been V-ing(動作的・継続強調)
            ・状態動詞は進行形不可: × I've been knowing him. ○ I've known him.
            ・時間表現: for + 期間 / since + 起点 / all day / lately / recently
            ・"Have you been working out?" / "I've been meaning to call."
            """
        ),
        GrammarQuestion(
            id: "q275",
            question: "I haven't seen him ___ last summer.",
            choices: ["for", "since", "from", "by"],
            correctIndex: 1,
            translation: "「去年の夏以来、彼に会っていない」",
            explanation: """
            ・since + 過去の時点/節 = 「〜以来・〜から」起点
            ・for + 期間(for two hours) vs since + 起点(since 2020)
            ・"I haven't seen her since Monday." / "Since when?" = いつから?(驚き)
            ・"Ever since ~" = 〜以来ずっと
            ・他の意味: 理由「〜なので」(Since you're here, let's start.)
            ・組合せ: long since(とっくに) / since then / since birth
            ・現在完了形と頻繁にペアになる
            """
        ),
        GrammarQuestion(
            id: "q276",
            question: "The book is ___ the table.",
            choices: ["on", "in", "at", "above"],
            correctIndex: 0,
            translation: "「本は机の上にある」",
            explanation: """
            ・on = 「〜の上に(接触している)」前置詞
            ・主な意味: 接触(on the table) / 日付(on Monday) / 乗り物(on the train) / 状態(on fire) / メディア(on TV)
            ・"On the way." / "On time." / "On purpose." / "On sale."
            ・場所の前置詞: at(地点) / in(内部) / on(表面) / above(真上) / over(覆う) / under(真下)
            ・口語フレーズ: on me(私のおごり) / on the house(店のサービス) / on board(賛成・乗船)
            ・前置詞は感覚的に覚える必要があり、ネイティブの直感が問われる
            """
        ),
        GrammarQuestion(
            id: "q277",
            question: "I'll go to the party ___ ___ it rains.",
            choices: ["how / even", "even / if", "even / when", "how / when"],
            correctIndex: 1,
            translation: "「たとえ雨が降っても、パーティーに行く」",
            explanation: """
            ・even if + 仮定 = 「たとえ〜でも」(雨かどうか分からない)
            ・even though + 事実 = 〜にもかかわらず(実際に雨が降っている)
            ・"Even if it rains, we'll go." / "Even if you ask, no."
            ・パターン: Even if you're right ~ / Even if I had time ~ / Even if it costs more ~
            ・even + 接続詞/前置詞: even when / even after / even before
            ・「条件に関わらず〜する」という強い意志を表現
            """
        ),
        GrammarQuestion(
            id: "q278",
            question: "___ ___ ___ ___ president will face many challenges.",
            choices: ["The / one / who / becomes", "Who / the / one / becomes", "The / who / one / becomes", "Becomes / the / one / who"],
            correctIndex: 0,
            translation: "「大統領になる人は多くの困難に直面するだろう」",
            explanation: """
            ・the one who + V = 「〜する人」関係代名詞構文
            ・"The one who called." / "I'm the one who did it."
            ・強調: "You're the one!" / "He's the one I love." / "She's not the one."
            ・「運命の人」: the one(恋愛) / the right one / the chosen one
            ・口語応用: "Are you the one who called?" / "The one who pays decides."
            ・人を特定して説明する基本構文
            """
        ),
        GrammarQuestion(
            id: "q279",
            question: "I don't have ___ ___ ___ penny.",
            choices: ["even / a / single", "only / a / single", "just / one / single", "even / one / and"],
            correctIndex: 0,
            translation: "「一銭たりとも持っていない」",
            explanation: """
            ・not + even a single + 名詞 = 「たった一つも〜ない」強い否定の強調
            ・"Not even a single penny." / "Not even a single word." / "Not a single one."
            ・段階: no penny(中立) < not a single penny(強) < not even a single penny(最強)
            ・"not a single soul"(一人も) / "not a single drop"(一滴も) / "not a single moment"(一瞬たりとも)
            ・"Every single + 名詞" = 〜の一つ一つ全て(逆の強調)
            ・「全く〜ない」を強調する時の最終兵器
            """
        ),
        GrammarQuestion(
            id: "q280",
            question: "I have ___ ___ ___ 5 dollars in my wallet.",
            choices: ["no / more / than", "not / more / than", "no / less / than", "no / much / than"],
            correctIndex: 0,
            translation: "「財布にはたった5ドルしかない」",
            explanation: """
            ・no more than + 数 = 「たった〜(しかない)」少なさを強調
            ・no less than + 数 = 〜も(多さを強調)
            ・not more than = 〜以下(中立) / not less than = 〜以上(中立)
            ・比較: no more than 10(たった10・不満) / not more than 10(10以下・中立的上限)
            ・no less than 10(10も・驚き) / not less than 10(10以上・中立的下限)
            ・"No more than 5 dollars." / "No less than 100 people."
            ・主観的ニュアンスを伝える比較表現、フォーマル英語で頻出
            """
        ),
        GrammarQuestion(
            id: "q281",
            question: "This document is ___ ___ ___ — please keep it safe.",
            choices: ["of / great / importance", "of / great / important", "at / great / importance", "with / great / importance"],
            correctIndex: 0,
            translation: "「この書類は非常に重要なので、大切に保管してください」",
            explanation: """
            ・of + 形容詞 + 抽象名詞 = 「〜な性質を持つ」形容詞句として機能
            ・of importance = important / of value = valuable / of use = useful / of interest = interesting
            ・段階: of little/no/some/great/vital/utmost importance
            ・"This is important." (中立) vs "This is of great importance." (フォーマル強調)
            ・"of interest to ~" / "of great value" / "of help" も同じパターン
            ・ビジネス・公的文書: Matters of importance / Issues of concern / Topics of interest
            ・口語では important / valuable が自然、書き言葉で効果的
            """
        ),
        GrammarQuestion(
            id: "q282",
            question: "That was an ___ disaster!",
            choices: ["absolutely", "absolute", "absolution", "absolved"],
            correctIndex: 1,
            translation: "「あれはまったくの大失敗だった!」",
            explanation: """
            ・absolute(形容詞) = 「完全な・絶対的な」名詞の前で強調
            ・absolutely(副詞) = 完全に〜・絶対に〜(形容詞/動詞を修飾)
            ・"An absolute disaster!" / "An absolute mess." / "An absolute nightmare."
            ・"The absolute truth." / "An absolute genius."
            ・ネガティブな名詞と組んで感情を強める: absolute chaos / absolute waste
            ・"Absolutely!" (強い同意) / "Absolutely not!" / "I absolutely love it."
            ・驚き・不満・称賛を強める時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q283",
            question: "The cat jumped ___ the table.",
            choices: ["on", "onto", "into", "to"],
            correctIndex: 1,
            translation: "「猫は机の上に飛び乗った」",
            explanation: """
            ・onto = 「〜の上へ(動き)」方向 + 接触面
            ・on(静止) vs onto(移動): "The book is on the table." vs "Put the book onto the table."
            ・"Jump onto the bed." / "Climb onto the roof." / "Step onto the stage."
            ・比喩: "I'm onto you." = お前の魂胆は分かってる
            ・"Moving onto the next topic." = 次の話題に移る
            ・"You're onto something." = 君は何かを掴んでる
            ・口語: "Hold onto your hat!" / "Hold onto this." / "Get onto it!"
            """
        ),
        GrammarQuestion(
            id: "q284",
            question: "She walked ___ the room and sat down.",
            choices: ["on", "onto", "into", "to"],
            correctIndex: 2,
            translation: "「彼女は部屋に入って座った」",
            explanation: """
            ・into = 「〜の中へ(動き)」方向 + 内部
            ・in(状態) vs into(移動): "Stay in the room." vs "Go into the room."
            ・比喩: "I'm into jazz."(ハマってる) / "Turn it into gold."(変える) / "Run into him."(偶然会う)
            ・"Cut it into pieces." / "Get into the habit of ~"
            ・口語: "I'm not into it." / "Are you into him?" / "Look into it." / "Get into trouble."
            ・覚え方: onto = on + to(上面に移動) / into = in + to(内部に移動)
            ・英会話で "I'm really into ~" は「ハマってる」の鉄板
            """
        ),
        GrammarQuestion(
            id: "q285",
            question: "He walked ___ the door slowly.",
            choices: ["towards", "to", "at", "in"],
            correctIndex: 0,
            translation: "「彼はゆっくりとドアの方へ歩いた」",
            explanation: """
            ・towards(英)/toward(米) = 「〜の方へ」方向のみ(到達は含まない)
            ・to(到達点)との違い: "Go to the door."(まで行く) vs "Walk towards the door."(の方へ)
            ・比喩: "His attitude towards work." / "Looking towards the future."
            ・"Her attitude towards him." / "Working towards a goal." / "Towards the end of the day."
            ・towards(英) / toward(米) どちらも正しい
            ・口語: "Towards me." / "Towards the end." / "Step towards ~"
            ・「向かっている途中」を強調する時に便利
            """
        ),
        GrammarQuestion(
            id: "q286",
            question: "I found my keys ___ the cushion.",
            choices: ["under", "underneath", "below", "Both A and B"],
            correctIndex: 3,
            translation: "「クッションの下に鍵を見つけた」",
            explanation: """
            ・underneath = 「〜の下に(隠れて)」under とほぼ同じだが「覆われている」ニュアンスが強い
            ・under(真下・最も一般的) / underneath(覆われ・隠れ) / below(位置関係) / beneath(フォーマル・文学的)
            ・"Underneath the bed." / "Hide underneath the blanket."
            ・比喩: "Underneath it all, he's kind." / "Underneath his rough exterior."
            ・"Deep down underneath." = 心の奥深くで
            ・"Underneath my coat I wear a sweater." = コートの下にセーター
            ・「外から見えないもの」を指す時に上品な選択
            """
        ),
        GrammarQuestion(
            id: "q287",
            question: "I can't go to the party — I'm tired, ___ ___, I don't know anyone there.",
            choices: ["and / besides", "and / beside", "but / besides", "so / beside"],
            correctIndex: 0,
            translation: "「パーティーに行けない — 疲れてるし、それに誰も知り合いがいない」",
            explanation: """
            ・and besides = 「その上・しかも」理由を追加する接続表現
            ・"I'm tired. Besides, I have work." / "Besides, who cares?"
            ・besides の意味: 「その上」(追加) / 「〜以外に」(除外)
            ・"No one besides me knows." = 私以外誰も知らない
            ・要注意: besides(その上・〜以外に) vs beside(〜のそばに) → s の有無で意味が変わる
            ・"Besides me"(私以外にも) vs "Beside me"(私のそばに)
            ・「言い訳を重ねる」時の決まりパターン、説得力が増す
            """
        ),
        GrammarQuestion(
            id: "q288",
            question: "She was sitting ___ me on the bench.",
            choices: ["besides", "beside", "by side", "along"],
            correctIndex: 1,
            translation: "「彼女はベンチで私のそばに座っていた」",
            explanation: """
            ・beside = 「〜のそばに・〜の横に」物理的な位置関係
            ・"Sit beside me." / "The dog is beside the bed." / "Walk beside her."
            ・比喩「比較すれば」: "Beside her, I look small."
            ・決まり文句「我を忘れて」: "He was beside himself with joy." / "Beside herself with grief."
            ・beside(〜のそばに) vs besides(その上・〜以外に) ── s の有無で意味が全く変わる
            ・類似: next to / by / alongside
            ・口語: "Right beside me." / "Sit beside me." / "Stand beside her."
            """
        ),
        GrammarQuestion(
            id: "q289",
            question: "Please put your phone ___ and listen.",
            choices: ["aside", "beside", "outside", "inside"],
            correctIndex: 0,
            translation: "「スマホを脇に置いて聞いて」",
            explanation: """
            ・aside = 「脇に・わきに」主要な場所から離れた位置
            ・put ~ aside / set ~ aside / step aside
            ・"Put it aside." / "Set aside some money." / "Take him aside."(内緒話)
            ・"Joking aside" / "Kidding aside" = 冗談はさておき
            ・"Aside from that" = それを除けば / "Aside from the cost" = 費用は別にして
            ・"Set aside time" / "Set aside money" = 取っておく
            ・beside(前置詞・〜のそばに) / aside(副詞・脇に) / besides(副詞・その上)
            ・「除外」「保留」「保管」の3つのニュアンス
            """
        ),
        GrammarQuestion(
            id: "q290",
            question: "Please take your feet ___ the table.",
            choices: ["off", "of", "out", "from"],
            correctIndex: 0,
            translation: "「机から足をどけて」",
            explanation: """
            ・off + 物 = 「〜から離れて」接触からの分離
            ・"Get off the bed!" / "Take your hands off!" / "Stay off the grass."
            ・多様な意味: 離れる(get off the bus) / 電源切る(turn off) / 休み(day off) / 割引(20% off) / 出発(I'm off!)
            ・重要句動詞: take off / get off / show off / call off / put off / kick off / back off / pay off
            ・"Off the top of my head" / "Off the record" / "Off and on"
            ・「接触からの離脱」が基本イメージ、多様な意味に派生
            """
        ),
        GrammarQuestion(
            id: "q291",
            question: "I have a lot of ___ to do today.",
            choices: ["thing", "things", "stuff", "stuffs"],
            correctIndex: 2,
            translation: "「今日やることがたくさんある」",
            explanation: """
            ・stuff = 「物・こと(漠然と)」不可算名詞、複数形にしない(× stuffs)
            ・"I have stuff to do." / "That's good stuff!" / "Move your stuff." / "Old stuff."
            ・things(可算・個別) vs stuff(不可算・漠然)
            ・"I bought some things."(個別) vs "I bought some stuff."(いろいろ)
            ・口語: "and stuff" / "and all that stuff" / "stuff like that"
            ・"good stuff" / "strong stuff" / "the real stuff"
            ・"I know stuff." / "Tell me stuff."
            ・動詞用法: "Stuff it into the bag." / "I'm stuffed!" = 満腹!
            """
        ),
        GrammarQuestion(
            id: "q292",
            question: "He's ___ ___ ___ called me yesterday.",
            choices: ["the / one / who", "one / who / the", "the / who / one", "who / one / the"],
            correctIndex: 0,
            translation: "「昨日電話してきたのは彼だ」",
            explanation: """
            ・the one who + V = 「〜する人」関係代名詞構文、特定の一人を指す
            ・"I'm the one who called." / "You're the one I love." / "He's the one who can help."
            ・強調パターン: 普通(I called you) → 強調(I'm the one who called you)
            ・運命的: "Is she the one?" / "He's not the one."
            ・応用: the only one who / the first one who / the last one who
            ・関係詞: 人→who/that / 物→which/that / 場所→where / 時→when / 理由→why
            ・"I'm the one paying!" / "You're the one to blame."
            """
        ),
        GrammarQuestion(
            id: "q293",
            question: "There are two cakes. ___ ___ do you want?",
            choices: ["Which / one", "What / one", "Which / it", "That / one"],
            correctIndex: 0,
            translation: "「ケーキが2つある。どっちが欲しい?」",
            explanation: """
            ・Which one = 「どれ・どちら」選択疑問、限られた選択肢から
            ・Which(限定された選択肢) vs What(自由に選ぶ)
            ・"Which one do you like?" / "Which one is yours?"
            ・買い物: "Which one should I buy?" / "Which one is on sale?"
            ・"Which one would you prefer?" / "Pick which one you like."
            ・"Which one? / This one or that one? / Either one is fine."
            ・応答: This one / That one / Either / Both / Neither
            """
        ),
        GrammarQuestion(
            id: "q294",
            question: "___ ___, we'll all be using AI for everything.",
            choices: ["Before / long", "Long / before", "Soon / long", "Quickly / before"],
            correctIndex: 0,
            translation: "「まもなく、私たちは全てにAIを使うようになるだろう」",
            explanation: """
            ・before long = 「まもなく・近いうちに」近い未来
            ・"Before long, you'll see." / "Things will improve before long."
            ・段階: soon(最一般) / shortly(フォーマル) / in a bit(カジュアル) / in no time / any minute now
            ・混同注意: before long(まもなく・未来) vs long before(〜よりずっと前に・過去)
            ・"Before long, he came."(まもなく) vs "Long before he came, I had left."(ずっと前)
            ・文頭・文中・文末どこでも配置可
            ・予測や予言で使うと知的に響く
            """
        ),
        GrammarQuestion(
            id: "q295",
            question: "Let's meet ___ ___ the movie.",
            choices: ["right / after", "just / before", "right / behind", "soon / after"],
            correctIndex: 0,
            translation: "「映画のすぐ後に会おう」",
            explanation: """
            ・right after = 「〜のすぐ後」、right が「すぐ」を強調
            ・time: right after / right before / right now / right away
            ・place: right here / right there / right next to / right behind
            ・direction: right in front of / right above / right below
            ・"Right after work." / "Right after class." / "Right after this."
            ・"Right after dinner." / "I'll be right back." / "Right then and there."
            ・right の他: 正しい(That's right) / 右(Turn right) / 権利(Human rights)
            ・時間を強調する「すぐ」を表す重要副詞
            """
        ),
        GrammarQuestion(
            id: "q296",
            question: "It's freezing ___ ___ — let's go back inside.",
            choices: ["out / here", "on / here", "out / there", "here / out"],
            correctIndex: 0,
            translation: "「こっちの外は凍えるくらい寒い — 中に戻ろう」",
            explanation: """
            ・out here = 「こっちの外で(話者がいる外)」
            ・vs out there(離れた外で) / vs in here(こっちの中) / vs in there(そっちの中)
            ・シリーズ: up here / down here / out here / in here / over here / back here
            ・"It's cold out here." / "Out here in the countryside." / "Come out here."
            ・"It's beautiful out here."(自分が外) vs "It's dangerous out there."(離れた外)
            ・比喩: "Out there in the world." / "Somewhere out there."
            ・"What are you doing out here?" / "It's a jungle out there."
            ・話者の視点を意識して使い分ける
            """
        ),
        GrammarQuestion(
            id: "q297",
            question: "He's not answering. ___ ___ been disconnected.",
            choices: ["It / might've", "It / might", "It / mighty", "It / may"],
            correctIndex: 0,
            translation: "「彼は応答しない。電話が切れたかもしれない」",
            explanation: """
            ・might've = might have の短縮形「〜したかもしれない」過去の推量
            ・"It might've been him." / "I might've left it home." / "We might've missed it."
            ・確信度: must've(90%) > should've(後悔) > might've/could've(50%)
            ・発音: might've /ˈmaɪtəv/ → 「ハ」音がほぼ消えて「マイタブ」と聞こえる
            ・書き言葉: might have(正式) / might've(短縮) / × might of(誤り・音が同じだが綴り違い)
            ・"Could've been worse." / "Should've known." / "Would've helped."
            ・過去への推量・後悔を表現する重要構文
            """
        ),
        GrammarQuestion(
            id: "q298",
            question: "I ___ ___ studied harder for the test.",
            choices: ["should / have", "should / had", "would / have", "might / have"],
            correctIndex: 0,
            translation: "「テストのためにもっと勉強しておくべきだった」",
            explanation: """
            ・should have + 過去分詞 = 「〜すべきだった(のにしなかった)」後悔・非難
            ・shouldn't have + 過去分詞 = 〜すべきじゃなかった
            ・"I should've studied." / "You should've called." / "She should've known better."
            ・自分への後悔 / 相手への非難 / 過去の予想 の3用法
            ・発音: should've /ˈʃʊdəv/
            ・"should've known better" / "should've seen it coming"
            ・× I should have went. / ○ I should have gone.(過去分詞)
            ・返事: A: Why didn't you come? B: I should've.
            ・「後悔」を表す英語の最重要表現
            """
        ),
        GrammarQuestion(
            id: "q299",
            question: "Let's go to the park, ___ ___?",
            choices: ["shall / we", "will / we", "shall / I", "do / we"],
            correctIndex: 0,
            translation: "「公園に行きましょうか?」",
            explanation: """
            ・shall we? = 「〜しましょうか?」提案の付加疑問、Let's の文に付ける
            ・"Let's begin, shall we?" / "Let's eat, shall we?" / "Shall we go?"
            ・shall の用法: 提案(Shall we dance?) / 意志確認(Shall I help?) / 強い意志・法的義務(We shall overcome.)
            ・will(一般的・普段使い) vs shall(提案・意志確認・やや古風で英国寄り)
            ・米国口語では shall はあまり使われず、Let's ~ や Should we ~? が一般的
            ・丁寧さ・上品さを出したい時に効果的
            """
        ),
        GrammarQuestion(
            id: "q300",
            question: "Things are tough enough ___ ___ ___ — don't make it worse.",
            choices: ["as / it / is", "as / they / are", "as / it / does", "like / it / is"],
            correctIndex: 0,
            translation: "「ただでさえ事態は十分厳しいんだ — もっと悪くしないで」",
            explanation: """
            ・as it is = 「現状のままで・そのままで」/ 「ただでさえ」(困難の強調)
            ・3用法: 現状(I'll leave it as it is.) / ただでさえ(It's hard enough as it is.) / 実情は(As it is, I have work.)
            ・"Things are bad enough as it is." / "Leave it as it is."
            ・"As it is, we can't afford it." = 実情として、買う余裕はない
            ・区別: as it is(現在) / as it was(過去) / as is(販売「現状渡し・無保証」)
            ・"I have enough on my plate as it is." = ただでさえ手一杯
            ・困難や状況の重さを訴える時の知的表現
            """
        ),
        GrammarQuestion(
            id: "q301",
            question: "___ ___ you could lend me your car this weekend?",
            choices: ["Any / chance", "Some / chance", "What / chance", "Have / chance"],
            correctIndex: 0,
            translation: "「今週末、車を貸してもらえる可能性ある?」",
            explanation: """
            ・Any chance + 文? = 「〜できる可能性ある?」「もしかして〜できる?」丁寧な依頼
            ・Any chance + 主語 + 動詞? / Any chance of + V-ing
            ・"Any chance you could help?" / "Any chance of a discount?"
            ・丁寧さ: Help me(命令) < Can you help(普通) < Could you help(丁寧) < Any chance you could ~(謙虚) < Would you mind(最丁寧)
            ・「相手に断られる可能性を認めている」謙虚さで強要しない
            ・応答: Sure, no problem / I'm afraid not / Maybe, let me think
            ・ビジネスでも日常でも使える鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q302",
            question: "This is ___ ___ ___ ever had!",
            choices: ["the / best / I've", "the / better / I've", "a / best / I've", "the / best / I'd"],
            correctIndex: 0,
            translation: "「これはこれまで食べた中で最高だ!」",
            explanation: """
            ・the best (that) I've + 過去分詞 = 「これまでで最高の〜」経験を踏まえた最上級
            ・"The best meal I've ever had." / "The worst experience I've ever had."
            ・that はほぼ常に省略可能
            ・ever は「これまでに」を強調する副詞
            ・"the best book I've ever read" / "the most beautiful place I've ever been"
            ・応用: "the first time I've ever ~" / "one of the best ~ I've ever"
            ・口語感嘆: "Best ever!" / "Worst day ever." / "Best decision I've ever made."
            """
        ),
        GrammarQuestion(
            id: "q303",
            question: "___ ___ tried Japanese food before?",
            choices: ["Have / you", "Did / you", "Are / you", "Do / you"],
            correctIndex: 0,
            translation: "「これまでに日本食を食べたことある?」",
            explanation: """
            ・Have you + 過去分詞 (+ before)? = 「〜したことある?」現在完了の疑問形
            ・"Have you ever been to Japan?" / "Have you tried this?"
            ・Have you ~(現在の状態・経験) vs Did you ~(過去の事実)
            ・時間表現: ever(経験) / yet(完了) / already / just
            ・返答: Yes, I have / No, I haven't / Not yet / Yes, many times
            ・"Have you eaten?" は中華系挨拶でも使う
            ・経験・完了を尋ねる最重要疑問形
            """
        ),
        GrammarQuestion(
            id: "q304",
            question: "___ ___ is the damage?",
            choices: ["How / bad", "How / badly", "What / bad", "Why / bad"],
            correctIndex: 0,
            translation: "「被害はどのくらいひどい?」",
            explanation: """
            ・How + 形容詞 + 主語 + 動詞? = 「どのくらい〜?」程度を尋ねる疑問
            ・"How bad?" / "How big?" / "How long?" / "How far?"
            ・How tall / old / wide / heavy / expensive / serious / busy
            ・How + 副詞: How fast? / How well? / How often?
            ・"How bad is it?" / "How bad can it be?" / "How bad do you want it?"
            ・感嘆にも: "How sad!" / "How nice!" / "How embarrassing!"
            ・「程度」を確認する万能パターン
            """
        ),
        GrammarQuestion(
            id: "q305",
            question: "After that scandal, his career ___ ___ ___.",
            choices: ["is / done / for", "was / done / by", "is / done / to", "was / doing / for"],
            correctIndex: 0,
            translation: "「あのスキャンダル後、彼のキャリアはもう終わりだ」",
            explanation: """
            ・be done for = 「破滅する・もうダメだ」修復不可能な状態
            ・"We're done for!" / "His career is done for." / "If they find out, I'm done for."
            ・done の3用法: 完了(I'm done) / うんざり(I'm done with this) / 破滅(I'm done for)
            ・類似: toast(I'm toast!) / cooked(I'm cooked!) / screwed(粗) / in deep trouble
            ・"Looks like we're done for." / "His political career is done for."
            ・通常 for がついて初めて「破滅」の意味になる
            ・絶望的な状況のドラマチックな口語表現
            """
        ),
        GrammarQuestion(
            id: "q306",
            question: "The product was made ___ ___ ___ safety regulations.",
            choices: ["in / accordance / with", "on / accordance / with", "by / accordance / with", "at / accordance / for"],
            correctIndex: 0,
            translation: "「その製品は安全規則に従って作られた」",
            explanation: """
            ・in accordance with + 名詞 = 「〜に従って・〜に準じて」フォーマル
            ・"In accordance with the law." / "In accordance with company policy." / "In accordance with your wishes."
            ・段階: as per > in accordance with > in line with > according to > based on > following
            ・区別: in accordance with(規則に従う行動) vs according to(情報源「〜によると」)
            ・類似フォーマル: in conformity with / in compliance with / pursuant to(法律用語)
            ・契約書、規約、ビジネスメールで多用
            """
        ),
        GrammarQuestion(
            id: "q307",
            question: "___ ___ the weather forecast, it'll snow tomorrow.",
            choices: ["According / to", "According / for", "In accordance / with", "Accordingly / with"],
            correctIndex: 0,
            translation: "「天気予報によると、明日は雪が降るそうだ」",
            explanation: """
            ・according to + 情報源 = 「〜によると」情報の出所
            ・"According to the news." / "According to the data."
            ・注意: 自分自身を情報源にできない → × According to me / ○ In my opinion
            ・段階: According to ~ / Based on ~ / As reported by ~ / Sources say / They say / Rumor has it
            ・"According to him" / "According to plan" / "Each according to their ability."
            ・対象: the news / report / survey / experts / data / sources / witnesses
            ・プレゼン・記事: "According to studies, ~" / "According to statistics, ~"
            """
        ),
        GrammarQuestion(
            id: "q308",
            question: "I thought he'd be late, and ___ ___, he arrived an hour late.",
            choices: ["sure / enough", "true / enough", "surely / enough", "for / sure"],
            correctIndex: 0,
            translation: "「彼は遅れると思ってたら、案の定1時間遅刻した」",
            explanation: """
            ・sure enough = 「案の定・予想通り」予測の的中
            ・"Sure enough, he was late." / "Sure enough, it rained." / "And sure enough, ~"
            ・段階: sure enough(口語) / as expected / predictably(フォーマル) / of course / as I thought
            ・区別: sure enough(案の定・確認) vs surely(きっと・強調)
            ・"Sure enough, he came." vs "He'll surely come."
            ・派生: fair enough / strangely enough / funnily enough / oddly enough
            ・「やっぱりね」「思った通り」の鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q309",
            question: "___ ___ ___, he tried his best.",
            choices: ["To / be / fair", "For / being / fair", "To / fair / be", "For / be / fair"],
            correctIndex: 0,
            translation: "「公平に言って、彼は最善を尽くした」",
            explanation: """
            ・To be fair, + 文 = 「公平に言って・正直に言うと」バランスを取るつなぎ
            ・批判や否定的な意見の後にバランスを取るために使う
            ・"He's lazy, but to be fair, he's been sick."
            ・同類: To be honest / To be fair / To be frank / To be precise / To be safe / To tell the truth
            ・"To be fair, you didn't ask." / "In fairness ~" (より改まった)
            ・フォーマル版: In all fairness / To give credit where credit's due
            ・英国では文末にも: "He's not bad, to be fair."
            ・議論や評価で「バランスの取れた視点」を示す上品な表現
            """
        ),
        GrammarQuestion(
            id: "q310",
            question: "She has ___ ___ ___ humor that I love.",
            choices: ["a / sense / of", "the / sense / for", "some / sense / of", "a / sensing / of"],
            correctIndex: 0,
            translation: "「彼女には私が大好きなユーモアセンスがある」",
            explanation: """
            ・a sense of + 名詞 = 「〜の感覚・〜のセンス」重要な慣用パターン
            ・sense of humor / duty / belonging / urgency / purpose / pride / accomplishment / relief / responsibility / direction / timing / style
            ・比喩: common sense(常識) / sixth sense(第六感) / make sense(理にかなう) / come to one's senses(正気に戻る)
            ・"He has a great sense of humor." / "She has no sense of style." / "They have a strong sense of duty."
            ・フォーマル: a profound sense of / a strong sense of / a keen sense of
            ・人や場所の特性を表現する必須パターン
            """
        ),
        GrammarQuestion(
            id: "q311",
            question: "All good things must ___ ___ ___ ___.",
            choices: ["come / to / an / end", "come / to / the / end", "go / to / an / end", "come / for / an / end"],
            correctIndex: 0,
            translation: "「良いことには必ず終わりがある」",
            explanation: """
            ・come to an end = 「終わる・終了する」フォーマル寄り、finish の上品版
            ・"All good things come to an end." (諺) / "The era came to an end."
            ・段階: end(中立) / finish / come to an end(フォーマル) / wrap up(口語) / conclude(フォーマル) / draw to a close(文学的)
            ・派生: put an end to ~ / bring to an end / bring something to an end
            ・"Our journey has come to an end." / "Long marriage came to an end."
            ・ビジネス: "Today's session has come to an end." / "Our partnership has come to an end."
            ・文末や結語で使うと文章に重みが出る
            """
        ),
        GrammarQuestion(
            id: "q312",
            question: "He didn't waste ___ ___ ___ minute.",
            choices: ["even / a / single", "only / a / single", "just / one / and", "even / one / from"],
            correctIndex: 0,
            translation: "「彼は一分たりとも無駄にしなかった」",
            explanation: """
            ・not + even a single + 名詞 = 「たった一つも〜ない」最強の否定強調
            ・段階: no(弱) < not any(中) < not a single(強) < not even a single(最強)
            ・組合せ: not even a single drop/moment/soul/penny/word/complaint/mistake
            ・対の表現: every single + 名詞(〜の一つ一つ全て): every single day / every single one
            ・"She didn't shed a single tear." / "He gave us not even a single chance."
            ・"Not a single soul came." / "Without a single complaint." / "Every single time."
            ・絶対否定や絶対肯定を強調する重要表現
            """
        ),
        GrammarQuestion(
            id: "q313",
            question: "There's some doubt ___ ___ whether he'll come.",
            choices: ["as / to", "up / to", "due / to", "for / to"],
            correctIndex: 0,
            translation: "「彼が来るかどうかについて疑問が残る」",
            explanation: """
            ・as to + 名詞/wh-節 = 「〜について・〜に関して」フォーマルな前置詞句
            ・"Doubts as to his honesty." / "No idea as to where he is." / "As to your question, ~"
            ・段階: as to(高) / with regard to(高) / regarding(中〜高) / about(低) / on(低)
            ・"Questions as to ~" / "Uncertainty as to ~" / "Decisions as to ~"
            ・"No clue as to who did it." / "Doubts as to how it works."
            ・区別: about(カジュアル) vs as to(フォーマル・書き言葉)
            ・日常会話では about / on、ビジネス文書や論文で使うと知的
            """
        ),
        GrammarQuestion(
            id: "q314",
            question: "___ ___ tomorrow, the new policy will take effect.",
            choices: ["As / of", "As / for", "As / to", "On / of"],
            correctIndex: 0,
            translation: "「明日から、新しい方針が施行される」",
            explanation: """
            ・as of + 日付/時間 = 「〜から(起点)・〜の時点で(基準時点)」フォーマル
            ・2用法: 起点(As of January 1st, prices increase.) / 時点(As of today, no decisions made.)
            ・"As of next Monday." / "As of today." / "As of now."
            ・類似: as of / from / starting / effective / beginning
            ・ビジネス: "Effective as of ~" / "As of the latest report" / "Valid as of ~"
            ・"As of yet" = 現在まで(まだ): "As of yet, no answer."
            ・"As of now" / "As of late" / "As of writing"
            """
        ),
        GrammarQuestion(
            id: "q315",
            question: "___ ___ need any help, please call me.",
            choices: ["Should / you", "Would / you", "If / you", "Could / you"],
            correctIndex: 0,
            translation: "「万一助けが必要なら、お電話ください」",
            explanation: """
            ・Should + 主語 + V, ~ = 「もし〜なら」仮定法倒置のフォーマル表現(If you should V の倒置)
            ・"Should you have any questions, contact us." / "Should you need help, let me know."
            ・3つの倒置: Should you ~(万一) / Were I you ~(私なら) / Had I known ~(知ってたら)
            ・段階: Should you ~(高・書き言葉) / If you should ~(中) / If you ~(普通)
            ・ビジネス頻出: "Should you require further information, ~" / "Should you wish to ~"
            ・倒置することで「万一〜なら」の控えめな仮定を表す
            ・公式メールやアナウンスで知的な印象
            """
        ),
        GrammarQuestion(
            id: "q316",
            question: "Please submit the report ___ Friday.",
            choices: ["by", "until", "at", "for"],
            correctIndex: 0,
            translation: "「金曜日までに報告書を提出してください」",
            explanation: """
            ・by + 時間/日付 = 「〜までに(期限)」完了の期限
            ・区別: by(期限・完了点) vs until(継続の終点)
            ・"Submit by Friday."(期限) vs "Wait until Friday."(継続)
            ・"Finish by tomorrow." / "Done by 5 PM." / "Reply by the end of the day."
            ・by の他: 手段(by car) / 行為者(by him) / そばに(by the window) / 差(by 10 points) / 単位(by the hour)
            ・"by the end of the day" / "by then" / "by now"
            ・"By the time + 主語 + 動詞" = 〜する頃には
            ・ビジネス: by EOD(End of Day) / by EOW / by the deadline
            """
        ),
        GrammarQuestion(
            id: "q317",
            question: "She helped me, and I gave her some chocolates ___ ___.",
            choices: ["in / return", "for / return", "on / return", "at / return"],
            correctIndex: 0,
            translation: "「彼女が助けてくれたので、お返しにチョコレートをあげた」",
            explanation: """
            ・in return = 「お返しに・見返りとして」
            ・in return for + 名詞 = 〜のお返しに
            ・"Help me, and I'll help you in return." / "In return for your kindness." / "I expect nothing in return."
            ・類似: in return / in exchange / as a reward / to repay / in gratitude
            ・"Asking nothing in return." / "I owe you one."
            ・"Many happy returns!"(誕生日のお祝い) / "Return to sender" / "Point of no return"
            ・ビジネス: "In return for our services" / "In return for your loyalty"
            ・互恵関係を表現する時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q318",
            question: "Take a few days ___ work and rest.",
            choices: ["off", "of", "on", "from"],
            correctIndex: 0,
            translation: "「数日仕事を休んで、休息を取って」",
            explanation: """
            ・take + 時間 + off + 場所/仕事 = 「〜を休んで時間を取る」
            ・"Take time off work." / "Day off" / "I'm off today." / "Take a week off."
            ・off の3用法: 離れる(get off the bus) / 休み(day off) / 割引(50% off)
            ・"Off the top of my head" / "Off the record" / "Off the chart" / "Off the hook" / "Off the cuff"
            ・"off duty" / "off limits" / "off topic" / "off course" / "off balance"
            ・"I'm off!" / "Off you go." / "Show off"
            ・「分離・除外」を表す重要前置詞
            """
        ),
        GrammarQuestion(
            id: "q319",
            question: "\"Did you finish the project?\" \"___ ___ ___.\"",
            choices: ["Not / even / close", "No / even / close", "Not / very / close", "Not / close / even"],
            correctIndex: 0,
            translation: "「『プロジェクト終わった?』『全然』」",
            explanation: """
            ・not even close = 「全然違う・全然及ばない」強い否定の口語
            ・段階: not really(弱) < not exactly(中) < not at all(強) < not even close(最強) < no way
            ・"Not even close!" / "Not even close to finished." / "Not even close to the truth."
            ・派生: "Close, but no cigar." = 惜しい、でも違う / "So close!" / "Way off."
            ・フォーマル: Far from it / Nothing like ~
            ・"Are we there yet? Not even close." / "Done? Not even close."
            ・強調: Not even remotely close / Nowhere near
            ・予想や見込みが外れた時の決まり文句
            """
        ),
        GrammarQuestion(
            id: "q320",
            question: "\"Do you know him?\" \"Not personally, but I ___ ___ him.\"",
            choices: ["know / of", "know / about", "know / for", "know / from"],
            correctIndex: 0,
            translation: "「『彼を知ってる?』『個人的にではないけど、聞いたことはある』」",
            explanation: """
            ・know of + 人/名詞 = 「〜のことを知っている(個人的にではなく)」間接的な認識
            ・区別: know + 人(個人的) / know of + 人(名前を聞いた) / know about + 人(情報を持っている)
            ・"I know him."(友人) vs "I know of him."(有名人など) vs "I know about him."(詳しい)
            ・"I know of a good restaurant." / "Not that I know of."
            ・"Not that I know of." = 私の知る限り違う(自信なく否定)
            ・フォーマル: To my knowledge ~ / As far as I know ~
            ・知識のレベルと自信の度合いを精密に表現
            """
        ),
        GrammarQuestion(
            id: "q321",
            question: "___ ___ ___ ___ ___ waiting any longer.",
            choices: ["There / is / no / point / in", "It / has / no / point / in", "There / is / not / point / of", "There / is / any / point / on"],
            correctIndex: 0,
            translation: "「もう待っても意味がない」",
            explanation: """
            ・There's no point in + V-ing = 「〜しても無駄・〜する意味がない」
            ・What's the point of + V-ing = 〜する意味は?
            ・"There's no point in arguing." / "No point in worrying." / "What's the point?"
            ・段階: There's no point(理性的) / It's no use(諦め) / It's pointless(強い) / A waste of time / In vain(フォーマル)
            ・組合せ: crying/worrying/arguing/waiting/trying/complaining
            ・"There's no point crying over spilled milk." = 覆水盆に返らず
            ・フォーマル: "There is little point in ~" / "It serves no purpose to ~"
            ・励まし・諦めの両方に使える万能フレーズ
            """
        ),
        GrammarQuestion(
            id: "q322",
            question: "I finally ___ ___ ___ meet my favorite author yesterday.",
            choices: ["got / to / meet", "got / for / meet", "get / to / meeting", "got / meet / to"],
            correctIndex: 0,
            translation: "「昨日ついに、大好きな作家に会えた」",
            explanation: """
            ・get to + V (原形) = 「〜できる機会を得る・〜する機会に恵まれる」幸運な機会
            ・"I got to meet him." / "Do I get to come?" / "Never got to try it."
            ・2意味: 機会(I got to travel.) / 到達(Get to the point.)
            ・対比: have to V(義務) vs get to V(機会・幸運)
            ・"I have to work."(義務) vs "I got to work."(幸運)
            ・"Do I get to choose?" / "I never got to thank her."
            ・派生: getting to know / get to it! / get to grips with
            ・「機会を得る」と「到達する」の多義的で重要な表現
            """
        ),
        GrammarQuestion(
            id: "q323",
            question: "He's ___ ___ ___ ___ ___ singer than an actor.",
            choices: ["more / of / a / singer / than", "more / a / singer / than", "much / of / singer / than", "most / of / a / than"],
            correctIndex: 0,
            translation: "「彼は俳優というより歌手だ」",
            explanation: """
            ・more of a + 名詞 + than ~ = 「〜というよりむしろ〜」性質や役割の比較
            ・"He's more of a singer than an actor." / "It's more of a hobby than a job."
            ・通常の比較級は形容詞、この構文は名詞を比較
            ・反対: less of a X than Y
            ・"I'm more of a coffee person." / "He's more of a thinker than a doer."
            ・"more of a ~ kind of person": "I'm more of a morning person."
            ・冠詞 a が必須(× more singer)
            ・"More of a maybe." / "Not so much a X as a Y."(同義の別表現)
            ・フォーマル: rather than(He's a singer rather than an actor.)
            """
        ),
        GrammarQuestion(
            id: "q324",
            question: "We have a lot ___ ___.",
            choices: ["in / common", "on / common", "by / common", "at / common"],
            correctIndex: 0,
            translation: "「私たちは共通点が多い」",
            explanation: """
            ・have ~ in common = 「〜の共通点がある」
            ・have + 量 + in common / in common with + 人
            ・"We have a lot in common." / "Nothing in common." / "Something in common with you."
            ・組合せ: a lot / something / nothing / little / much in common
            ・他の用法: common interests / common goal / common ground / common sense / common knowledge / common area
            ・"We hit it off — we have a lot in common." / "Nothing in common with each other."
            ・"have ~ in common with + 人" : "I have a lot in common with my dad."
            ・フォーマル: share commonalities / similar features / parallel characteristics
            """
        ),
        GrammarQuestion(
            id: "q325",
            question: "\"I love Italian food.\" \"___ ___ ___, let's go to that new place.\"",
            choices: ["Speaking / of / which", "Speak / about / which", "Talking / about / what", "About / which / speak"],
            correctIndex: 0,
            translation: "「『イタリア料理大好き』『そう言えば、あの新しい店に行こう』」",
            explanation: """
            ・Speaking of which, + 文 = 「そう言えば・関連して」話題の自然な転換
            ・"Speaking of which, did you call?" / "Speaking of food, I'm hungry." / "Speaking of John, where is he?"
            ・直前に言及されたことから自然に話題を発展させる
            ・Speaking of + 名詞: Speaking of work / Speaking of weather / Speaking of money
            ・類似: That reminds me of ~ / Now that you mention it ~ / Come to think of it ~
            ・フォーマル: On that topic ~ / Regarding which ~ / Pertaining to that ~
            ・"Speaking of which, what about lunch?" / "Speaking of which, I owe you money."
            ・会話を自然につなぐ万能フレーズ
            """
        ),
        GrammarQuestion(
            id: "q326",
            question: "___ ___ ___ ___, we'll find a solution.",
            choices: ["One / way / or / another", "Some / way / or / another", "Any / way / or / another", "One / way / or / other"],
            correctIndex: 0,
            translation: "「何としても、解決策を見つけよう」",
            explanation: """
            ・One way or another, + 文 = 「何としても・どうにかして」強い決意
            ・"One way or another, I'll do it." / "We'll get there one way or another."
            ・段階: somehow(何となく) < one way or another(何かしらの方法) < whatever it takes(必要なこと全て) < come hell or high water(何があっても・最強) < at all costs
            ・「方法は分からないが結果は確実」というニュアンス
            ・"We'll figure it out one way or another." / "They'll catch him one way or another."
            ・区別: one way or another(中立) vs whatever it takes(強い決意)
            ・派生: one way or the other = どちらにせよ
            ・困難な状況で諦めない姿勢を示す決まり文句
            """
        ),
        GrammarQuestion(
            id: "q327",
            question: "You can eat ___ you want.",
            choices: ["whatever", "whoever", "wherever", "whenever"],
            correctIndex: 0,
            translation: "「好きなものを何でも食べていいよ」",
            explanation: """
            ・whatever + (主語) + 動詞 = 「〜するものは何でも」「何を〜しようと」複合関係代名詞
            ・2用法: 〜するものは何でも(Take whatever you need) / 何を〜しようと(Whatever you say, I won't change)
            ・"Eat whatever you want." / "Whatever happens, stay calm." / "Do whatever you like."
            ・口語: "Whatever you say." / "Whatever it takes." / "Whatever works." / "Whatever the case."
            ・単独 Whatever. = 「どうでもいい」(やや投げやり・失礼なので使用に注意)
            ・"whatever" ≒ "no matter what"(互換可能)
            ・ビジネス: "Whatever the outcome, ~" / "Whatever your needs, we'll help."
            """
        ),
        GrammarQuestion(
            id: "q328",
            question: "There's ___ to hide in this small room.",
            choices: ["nowhere", "somewhere", "anywhere", "everywhere"],
            correctIndex: 0,
            translation: "「この狭い部屋には隠れる場所がない」",
            explanation: """
            ・nowhere = 「どこにもない・どこにも〜ない」否定の場所副詞
            ・nowhere to + V = 〜する場所がない
            ・"Nowhere to go." / "Nowhere to be found." / "We're going nowhere."(進展なし)
            ・"In the middle of nowhere" = 何もない辺鄙な場所
            ・"Out of nowhere" = どこからともなく
            ・"Nowhere near" = 全然届かない / "Nowhere to be seen" = どこにも見当たらない
            ・nowhere to sit / nowhere to run / nowhere to go
            ・"He appeared out of nowhere." / "We're in the middle of nowhere."
            """
        ),
        GrammarQuestion(
            id: "q329",
            question: "You can sit ___ you like.",
            choices: ["anywhere", "nowhere", "somewhere", "everywhere"],
            correctIndex: 0,
            translation: "「好きなところに座って」",
            explanation: """
            ・anywhere = 「どこにでも・どこかに」場所の代名詞・副詞
            ・3用法: 疑問(Have you seen it anywhere?) / 否定(I can't find it anywhere.) / 肯定(Sit anywhere = どこでも)
            ・"Go anywhere." / "Anywhere is fine." / "I'd go anywhere with you."
            ・○ I left it somewhere.(具体的) / × I left it anywhere.
            ・"anywhere in the world" / "anywhere on earth" / "anywhere from 10 to 20"(範囲)
            ・"I'd go anywhere for you." / "Anywhere but here."
            ・"We're not getting anywhere." / "That won't get you anywhere."
            ・区別: anywhere(選択肢の一つ) vs everywhere(全部の場所)
            """
        ),
        GrammarQuestion(
            id: "q330",
            question: "I want to find ___ ___ ___ I can study quietly.",
            choices: ["any / place / where", "any / place / which", "some / place / who", "every / place / what"],
            correctIndex: 0,
            translation: "「静かに勉強できる場所をどこか見つけたい」",
            explanation: """
            ・any place where + 主語 + 動詞 = 「〜できる場所ならどこでも」関係副詞構文
            ・any(自由・無制限) vs some(具体的・限定)
            ・"Any place where it's quiet." / "Some place where we can talk." / "A place where I belong."
            ・関係副詞: where(場所) / when(時) / why(理由) / how(方法)
            ・"a place to relax" / "a place where I can study" — that/where は省略可
            ・"Know any place where they serve good coffee?" / "Any place where it's not crowded."
            ・"Some place where I can be alone."
            ・フォーマル: a location/venue/spot where ~
            """
        ),
        GrammarQuestion(
            id: "q331",
            question: "We need to find a solution ___ ___ wins.",
            choices: ["where / everyone", "which / everyone", "where / no one", "what / everyone"],
            correctIndex: 0,
            translation: "「全員が勝つ(Win-Win)な解決策を見つける必要がある」",
            explanation: """
            ・場所以外の名詞 + where + SV = 「〜という状況の〜」関係副詞の応用(抽象的な「場所」)
            ・"situation/case/moment where + SV"
            ・"A situation where you win." / "A case where it works." / "A moment where time stops."
            ・抽象用法: scenario/stage/position/circumstances/point/moment/time where ~
            ・"I'm at a point where I can't continue." / "We're at a stage where decisions matter."
            ・"find a way where ~" / "create an environment where ~" / "a relationship where ~"
            ・ビジネス: "A scenario where everyone wins." / "Look for opportunities where we can grow."
            ・区別: where(場所・状況の関係副詞) vs which(物の関係代名詞)
            """
        ),
        GrammarQuestion(
            id: "q332",
            question: "You can choose ___ one you like.",
            choices: ["whichever", "whoever", "whatever", "however"],
            correctIndex: 0,
            translation: "「好きなのをどれでも選んでいいよ」",
            explanation: """
            ・whichever + 名詞 = 「どちらでも・〜のうちどれでも」選択肢からの自由選択
            ・"Take whichever you like." / "Whichever way works." / "Whichever comes first."
            ・区別: whichever(限られた選択肢から具体的) vs whatever(無制限・抽象的)
            ・"Eat whichever you want."(選択肢) vs "Eat whatever you want."(無制限)
            ・"Whichever comes first" / "Whichever way you look at it" / "Whichever way it goes"
            ・"Pick whichever." / "Whichever works for you." / "Whichever is cheaper."
            ・選択肢の数: either(2つ) / whichever(2つ以上・具体) / whatever(無制限)
            ・「決断を委ねる」: "Whichever you decide." / "Whichever feels right."
            """
        ),
        GrammarQuestion(
            id: "q333",
            question: "___ ___ ___ hard I try, I can't do it.",
            choices: ["No / matter / how", "Not / matter / how", "No / how / matter", "None / matter / how"],
            correctIndex: 0,
            translation: "「どんなに頑張ってもできない」",
            explanation: """
            ・No matter how + 形容詞/副詞 + 主語 + 動詞 = 「どんなに〜しても」譲歩
            ・"No matter how hard, I'll try." / "No matter how late, call me." / "No matter how cold, we go."
            ・バリエーション: no matter how/what/where/when/who/which/why
            ・"no matter how hard/long/cold/slowly/fast/much/many times"
            ・"No matter what, I love you." / "No matter what happens." / "No matter what people say."
            ・互換: no matter how ≒ however / no matter what ≒ whatever
            ・"However hard you try" / "However much you pay"
            ・"No matter how far you go, I'll find you." 強い決意・愛情を表現
            """
        ),
        GrammarQuestion(
            id: "q334",
            question: "___ ___ ___ ___, we need more time.",
            choices: ["As / I / mentioned / earlier", "Like / I / mentioned / before", "As / mentioned / I / earlier", "Both A and B"],
            correctIndex: 3,
            translation: "「先ほど述べたように、もっと時間が必要だ」",
            explanation: """
            ・As I mentioned earlier = 「前述したように・先ほど述べたように」フォーマル
            ・As I mentioned + 時間 / As I said + 時間
            ・フォーマル度: As I mentioned earlier(高・プレゼン) > As I said before(中) > Like I said(口語) > You know what I said
            ・過去への言及: "as I mentioned earlier/before" / "as previously mentioned"(最フォーマル)
            ・再確認: "as we discussed" / "as you saw" / "as you know"
            ・口語: "Like I said earlier" / "As I was saying" / "Going back to what I said"
            ・フォーマル版: "As previously stated" / "As outlined above" / "As indicated earlier"
            ・ビジネスメール: "As I mentioned in my last email ~" / "As per our previous discussion ~"
            """
        ),
        GrammarQuestion(
            id: "q335",
            question: "___ ___ ___ price, this is a great deal.",
            choices: ["In / terms / of", "On / terms / of", "By / terms / of", "For / terms / of"],
            correctIndex: 0,
            translation: "「価格の点で、これはお買い得だ」",
            explanation: """
            ・In terms of + 名詞 = 「〜の点で・〜に関して」観点・側面を表すフォーマル
            ・"In terms of price." / "In terms of quality." / "In terms of speed."
            ・"In terms of price, it's cheap." / "Good in terms of quality." / "Worse in terms of cost."
            ・類似: in terms of / regarding / with respect to / when it comes to / as far as ~ is concerned
            ・区別: in terms of(客観的観点) vs when it comes to(主観的)
            ・ビジネス: "In terms of ROI ~" / "In terms of efficiency ~" / "In terms of scalability ~"
            ・"In broad terms" / "In real terms" / "In simple terms" / "In no uncertain terms"
            ・「〜の観点では」をフォーマルに伝える鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q336",
            question: "All her efforts were ___ ___.",
            choices: ["in / vain", "for / vain", "at / vain", "on / vain"],
            correctIndex: 0,
            translation: "「彼女のすべての努力は無駄に終わった」",
            explanation: """
            ・in vain = 「無駄に・むなしく」フォーマル寄りの慣用句
            ・"All in vain." / "Tried in vain." / "Not in vain."
            ・段階: in vain(文学的) / a waste of time(カジュアル) / for nothing(不満) / pointless(強い) / futile(フォーマル)
            ・「無駄じゃない」(前向き): "His sacrifice was not in vain."
            ・「無駄に終わった」(過去): All in vain / Tried in vain / Searched in vain
            ・"try in vain to + V" = 〜しようとして無駄に終わる
            ・特殊用法: "Take someone's name in vain" = 〜の名をみだりに口にする
            ・区別: in vain(副詞句・無駄に) vs vain(形容詞・虚栄心の強い / 無駄な)
            ・努力が報われなかった残念さ・悲しみを含む文学的響き
            """
        ),
        GrammarQuestion(
            id: "q337",
            question: "We're still ___ ___ ___ our old friends.",
            choices: ["in / contact / with", "on / contact / with", "by / contact / with", "at / contact / with"],
            correctIndex: 0,
            translation: "「私たちは昔の友達と今も連絡を取り合っている」",
            explanation: """
            ・in contact with + 人 = 「〜と連絡を取って・〜と接触して」
            ・keep in contact / lose contact / get in contact
            ・"I'm in contact with him." / "Stay in contact." / "Lost contact with her."
            ・類似: in contact with(やや改まった) / in touch with(カジュアル)
            ・"Stay in touch!"(最も口語的) / "Keep in contact."(やや改まった)
            ・連絡が途絶える: lose contact / out of contact / fall out of touch
            ・他の用法: physical/eye contact / contact list / contact information
            ・ビジネス: "Please contact us." / "We'll be in contact soon." / "Stay in contact with the client."
            ・人間関係維持の慣用句、別れ際の挨拶に頻出
            """
        ),
        GrammarQuestion(
            id: "q338",
            question: "She's ___ ___ lot of pressure at work.",
            choices: ["under / a", "under / on", "on / a", "under / for"],
            correctIndex: 0,
            translation: "「彼女は仕事で大きなプレッシャーを受けている」",
            explanation: """
            ・under + 名詞 = 「〜の下に・〜の影響下で」抽象的な「影響」も表す
            ・物理: under the table/bed
            ・状態: under pressure/stress/attack/arrest
            ・進行: under construction/investigation/review/discussion/repair
            ・未満: under $20 / under 18
            ・"under the weather" = 体調不良 / "under the radar" = 目立たないように
            ・"under your nose" = すぐ目の前で / "under the table" = こっそりと・賄賂で
            ・"Under no circumstances." = どんな状況でも〜ない(強い否定)
            ・フォーマル: under the auspices/leadership/supervision of ~
            ・ビジネス: Under new management / Under different ownership
            """
        ),
        GrammarQuestion(
            id: "q339",
            question: "I'm ___ ___ finished with the report.",
            choices: ["just / about", "just / over", "almost / about", "just / to"],
            correctIndex: 0,
            translation: "「報告書はほぼ終わりかけている」",
            explanation: """
            ・just about = 「ほぼ・ほとんど」(almost と同じ) / 「まさに〜しようとしている」(be just about to V)
            ・"Just about done." / "Just about ready." / "Just about every day."
            ・"I'm just about to leave." / "Just about to call you."
            ・段階: just about(口語) / almost(中立) / nearly / practically / virtually / roughly
            ・"just about everyone/everything/every time/now/ready/finished/here/there"
            ・"Just about right!" / "Just about perfect." / "Just about killed me."
            ・"just about anyone/anything/anywhere" = ほぼ誰でも/何でも/どこでも
            ・強調: "just about every single day" / "just about as much"
            ・カジュアルな「ほぼ〜」「まさに〜」の鉄板
            """
        ),
        GrammarQuestion(
            id: "q340",
            question: "This book is ___ ___ finding yourself.",
            choices: ["all / about", "all / for", "all / of", "all / with"],
            correctIndex: 0,
            translation: "「この本は自分自身を見つけることが全てだ」",
            explanation: """
            ・all about + 名詞/動名詞 = 「〜が全てである・〜について全て」強調表現
            ・"Life is all about choices." / "It's all about timing." / "That's what it's all about."
            ・3用法: 強調・本質 / 詳しく知っている / 特性・特徴
            ・"Tell me all about it." / "I know all about that." / "He's all about success."
            ・"That's what it's all about!" / "Life is all about ~" / "It's all about ~"
            ・"It's not all about you." / "Life isn't all about money."
            ・"what + S + be + all about": "That's what life is all about."
            ・区別: about(中立・〜について) vs all about(強調・〜が全て)
            ・哲学的・励まし的なメッセージで頻出
            """
        ),
        GrammarQuestion(
            id: "q341",
            question: "Would you like ___ cup of coffee?",
            choices: ["another", "other", "others", "the other"],
            correctIndex: 0,
            translation: "「もう一杯コーヒーいかが?」",
            explanation: """
            ・another = an + other、必ず単数の名詞の前で使う「もう一つの・別の」
            ・コーヒーのおかわりを勧めたり、別の選択肢を提示したりする時の定番
            ・不特定の「もう一つ」を指す
            ・"Have another." / "Let's try another approach."
            ・類義: one more(数の追加) / a different(違いを強調)
            ・3つ以上の中から1つを選ぶ時は another、2つのうち残り1つは the other
            ・冠詞 a と組合せて使わない(× a another) — 既に a が含まれる
            """
        ),
        GrammarQuestion(
            id: "q342",
            question: "I have two brothers — one lives in Tokyo and ___ lives in London.",
            choices: ["the other", "another", "others", "other one"],
            correctIndex: 0,
            translation: "「兄弟が2人いて、1人は東京、もう1人はロンドンに住んでいる」",
            explanation: """
            ・2つのうち「一方」と「もう一方」をセットで言う時は one ~ the other
            ・the がつくのは2つしかない時に残りが自動的に特定されるから
            ・手袋、靴、双子、二択など「2つ1組」の話で頻出
            ・3つ以上から1つ選ぶ時は another を使う
            ・"One is red, the other is blue." / "On the one hand ~, on the other hand ~"
            ・類義: the second(順序) / the remaining one(残りの方)
            ・「2つ目で最後」のニュアンス
            """
        ),
        GrammarQuestion(
            id: "q343",
            question: "Some people like coffee, ___ prefer tea.",
            choices: ["others", "other", "another", "the other"],
            correctIndex: 0,
            translation: "「コーヒーが好きな人もいれば、紅茶を好む人もいる」",
            explanation: """
            ・Some ~ others = 「ある人は〜、他の人は〜」2つのグループを対比する定型
            ・others は「他の人たち(不特定の複数)」を指す代名詞
            ・意見・好み・行動の違いを語る時に頻出
            ・the others にすると「残りの全員」と特定される(ニュアンス変化)
            ・"Some say yes, others say no." / "Help others." / "Be kind to others."
            ・類義: some people(一部の人々) / the rest(残りの人々・特定)
            ・other(形容詞) vs others(代名詞・複数) の違いに注意
            """
        ),
        GrammarQuestion(
            id: "q344",
            question: "___ ___ ___, be honest with yourself.",
            choices: ["Above / all / else", "Over / all / else", "Beyond / all / else", "On / all / else"],
            correctIndex: 0,
            translation: "「何よりもまず、自分自身に正直でいなさい」",
            explanation: """
            ・above all else = 「何よりも大切なのは・とりわけ」強調表現
            ・アドバイスや人生の教訓を伝える時に使う
            ・"色々あるけど、結局これが一番"というニュアンス
            ・above all だけでも同じ意味だが、else を加えるとさらに強調
            ・"Above all else, be kind." / "Above all else, stay safe."
            ・類義: most importantly(最も重要なのは) / first and foremost(何よりもまず)
            ・スピーチやエッセイの締めくくりで効果的
            """
        ),
        GrammarQuestion(
            id: "q345",
            question: "I love ___ ___ ___ smiles.",
            choices: ["the / way / she", "the / how / she", "that / way / she", "the / way / how"],
            correctIndex: 0,
            translation: "「彼女の笑い方が好きだ」",
            explanation: """
            ・the way + 主語 + 動詞 = 「〜のやり方・〜する様子」
            ・how と同じ意味だが、口語では the way の方が圧倒的に頻出
            ・誰かの振る舞い・話し方・笑顔などを描写する時の定番
            ・"I love the way you laugh." / "The way he talks." / "The way it works."
            ・類義: how + SV(やや改まった) / the manner in which(フォーマル)
            ・※ the way how は誤り(重複)、片方だけ使う
            ・人や物の特徴を語る時の万能パターン
            """
        ),
        GrammarQuestion(
            id: "q346",
            question: "Good ingredients ___ ___ a great meal.",
            choices: ["make / for", "make / up", "make / of", "make / from"],
            correctIndex: 0,
            translation: "「良い材料が素晴らしい食事を作る」",
            explanation: """
            ・make for + 名詞 = 「〜の役に立つ・〜を生み出す」要因が結果を生むニュアンス
            ・料理・人間関係・状況の評価で頻出
            ・"Honesty makes for a good relationship." / "These conditions make for a great day."
            ・類義: lead to(〜につながる) / contribute to(〜に貢献する)
            ・他の make + 前置詞: make up(構成する/化粧する) / make of(〜製) / make from(〜から作る)
            ・原因→結果を表す時に便利な表現
            """
        ),
        GrammarQuestion(
            id: "q347",
            question: "I was born ___ March 15th, 1995.",
            choices: ["on", "in", "at", "by"],
            correctIndex: 0,
            translation: "「1995年3月15日に生まれた」",
            explanation: """
            ・特定の日付には on を使う(ルール)
            ・日付・曜日・特定の日(誕生日、記念日など)はすべて on
            ・"on March 15" / "on my birthday" / "on Christmas Day"
            ・月や年だけなら in(in March, in 1995)、時刻なら at(at 3pm)
            ・3つのルール: at(時刻) / on(日付・曜日) / in(月・年・季節)
            ・類義: on the day of / during(期間)
            ・特定の日 → on は絶対ルール
            """
        ),
        GrammarQuestion(
            id: "q348",
            question: "Let's meet ___ Monday.",
            choices: ["on", "in", "at", "by"],
            correctIndex: 0,
            translation: "「月曜日に会いましょう」",
            explanation: """
            ・曜日の前は必ず on を使う
            ・on Monday(月曜日に) / on Mondays(毎週月曜・複数形は習慣)
            ・"See you on Friday." / "I work on weekdays."
            ・会話では "See you Monday." のように on を省略することもあるが、文法的には on が正
            ・類義: every Monday(毎週月曜) / next Monday(次の月曜)
            ・on the weekend(米) / at the weekend(英) の違い
            ・曜日 → on は基本ルール
            """
        ),
        GrammarQuestion(
            id: "q349",
            question: "___ ___ ___ he forgot the meeting.",
            choices: ["It / appears / that", "It / appears / for", "That / appears / it", "Appears / it / that"],
            correctIndex: 0,
            translation: "「彼は会議を忘れたようだ」",
            explanation: """
            ・It appears that + 文 = 「〜のようだ・〜らしい」フォーマル寄りの推量
            ・It seems that とほぼ同じだが、appears の方がやや改まった
            ・確信は持てないが状況から判断して「〜らしい」と伝える時
            ・ビジネスメールや改まった会話に最適
            ・"It appears that they are running late."
            ・口語では that 省略可: "It appears he forgot."
            ・類義: It seems that(最も一般的) / Apparently(口語・どうやら)
            """
        ),
        GrammarQuestion(
            id: "q350",
            question: "He changed his mind ___ ___ ___ ___.",
            choices: ["at / the / last / moment", "on / the / last / moment", "in / the / last / moment", "by / the / last / moment"],
            correctIndex: 0,
            translation: "「彼は土壇場で気が変わった」",
            explanation: """
            ・at the last moment = 「ぎりぎりで・土壇場で」慣用句
            ・ドラマチックな転換やぎりぎりの決断を表す時に使う
            ・"土壇場でキャンセル" / "最後の最後で気が変わった"
            ・前置詞は at で固定
            ・"He decided at the last moment." / "Always at the last moment!"
            ・類義: at the last minute(ぎりぎり・同義) / in the nick of time(間一髪・ポジティブ寄り)
            ・緊張感のあるシチュエーションに最適
            """
        ),
        GrammarQuestion(
            id: "q351",
            question: "He should arrive ___ ___.",
            choices: ["anytime / now", "any / time", "some / time", "every / time"],
            correctIndex: 0,
            translation: "「彼はもうすぐ着くはずだ」",
            explanation: """
            ・anytime now = 「もうすぐ・今にも」口語表現
            ・何かが起こる直前の期待感を表す
            ・"He'll be here anytime now." / "It should start anytime now."
            ・any minute now とほぼ同じ意味で交換可能
            ・類義: any minute now(今にも) / soon(まもなく・中立)
            ・「待ち望んでいる」ニュアンスが込められている
            ・スペース無し anytime と空けて any time 両方あるが、副詞「いつでも」の意味では anytime が標準
            """
        ),
        GrammarQuestion(
            id: "q352",
            question: "The train should be here ___ ___.",
            choices: ["any / minute", "some / minute", "every / minute", "no / minute"],
            correctIndex: 0,
            translation: "「電車はもうすぐ来るはずだ」",
            explanation: """
            ・any minute (now) = 「今にも・もうすぐ」
            ・電車・人の到着、出来事の発生など、間もなく起こることを伝える定番
            ・any second(今すぐ) / any moment(その瞬間にも) も同じパターン
            ・"He'll arrive any minute now." / "It could happen any moment."
            ・類義: any moment(今その瞬間にも) / at any time(いつでも)
            ・緊迫感や期待感を出せる表現
            ・通常 now を付けて "any minute now" で使う
            """
        ),
        GrammarQuestion(
            id: "q353",
            question: "Let me ___ ___ to the airport.",
            choices: ["take / you", "bring / you", "carry / you", "get / you"],
            correctIndex: 0,
            translation: "「空港まで送らせて」",
            explanation: """
            ・take + 人 + to + 場所 = 「人を〜へ連れて行く」話し手から離れる方向の移動
            ・"空港まで送るよ" / "子供を学校に連れて行く"
            ・bring は逆に「こちらへ連れてくる」(注意)
            ・"Take me with you." / "I'll take you home." / "Take her to the doctor."
            ・類義: drive(車で送る) / escort(案内する・フォーマル)
            ・take vs bring: 視点が離れるか近づくかで使い分け
            ・"Can you take this to John?"(向こうへ) vs "Can you bring this to me?"(こちらへ)
            """
        ),
        GrammarQuestion(
            id: "q354",
            question: "Do you ___ ___ ___ know his number?",
            choices: ["by / any / chance", "on / any / chance", "at / any / chance", "in / any / chance"],
            correctIndex: 0,
            translation: "「もしかして彼の電話番号知ってる?」",
            explanation: """
            ・by any chance = 「もしかして・ひょっとして」控えめな質問表現
            ・相手にプレッシャーをかけずに尋ねたい時に使う
            ・「もしかして知ってる?」「ひょっとして空いてる?」ダメ元で聞きたい時
            ・文末でも文中でも使える
            ・"Are you free tonight, by any chance?" / "By any chance, do you have a pen?"
            ・類義: happen to(たまたま〜する・同じ用法) / perhaps(フォーマル)
            ・ビジネスでも日常でも丁寧な印象を与える
            """
        ),
        GrammarQuestion(
            id: "q355",
            question: "___ ___ ___ he'll be late again.",
            choices: ["The / chances / are", "The / chance / are", "A / chance / is", "Chance / are / the"],
            correctIndex: 0,
            translation: "「彼はまた遅刻するだろう」",
            explanation: """
            ・The chances are (that) + 文 = 「おそらく〜だろう・〜の可能性が高い」口語
            ・probably のもう少し砕けたバージョン
            ・推測や予想を伝える時。that はほぼ省略
            ・"Chances are he'll forget." / "The chances are it'll rain."
            ・「経験則からの予測」ニュアンス
            ・類義: chances are(the も省略可) / most likely(おそらく)
            ・"What are the chances?" = 「ありえるか?」と確率を尋ねる定番
            """
        ),
        GrammarQuestion(
            id: "q356",
            question: "___ ___ been a long day.",
            choices: ["It / has", "It / had", "It / have", "That / has"],
            correctIndex: 0,
            translation: "「長い一日だった」",
            explanation: """
            ・It has been + 形容詞/期間 = 「〜だった」現在完了形
            ・今この瞬間まで続いている状況を述べる時に使う
            ・"長い一日だった" / "久しぶりだね"
            ・"It's been" と短縮されることがほとんど
            ・"It's been ages!" / "It's been a while." / "It has been challenging."
            ・類義: It's been(短縮形・口語) / It was(過去形・完全に終わった話)
            ・感想や経過時間を伝える定番
            """
        ),
        GrammarQuestion(
            id: "q357",
            question: "___ ___ ___ more communication in this team.",
            choices: ["There / should / be", "There / will / be", "There / has / be", "That / should / be"],
            correctIndex: 0,
            translation: "「このチームにはもっとコミュニケーションがあるべきだ」",
            explanation: """
            ・There should be + 名詞 = 「〜があるべきだ」理想や提案
            ・現状への改善要求や望ましい状態を表現
            ・"There should be more rules." / "There should be transparency."
            ・should で「義務・推奨」のニュアンス
            ・類義: There ought to be(やや古風) / We need(直接的)
            ・提案やアドバイスをやわらかく表現する時に最適
            ・ビジネス会議や議論で頻出
            """
        ),
        GrammarQuestion(
            id: "q358",
            question: "___ ___ ___ a meeting tomorrow.",
            choices: ["There / will / be", "There / is / be", "There / has / be", "That / will / be"],
            correctIndex: 0,
            translation: "「明日会議があるだろう」",
            explanation: """
            ・There will be + 名詞 = 「〜があるだろう」未来の存在文
            ・予定・予測・約束を伝える時に使う
            ・"明日会議がある" / "変化があるだろう"
            ・"There will be changes." / "There will be a party."
            ・類義: There's going to be(口語) / We will have(別の言い方)
            ・ビジネスでも日常でも頻出
            ・告知やアナウンスの定番表現
            """
        ),
        GrammarQuestion(
            id: "q359",
            question: "___ ___ ___ all morning.",
            choices: ["It's / been / raining", "It / is / raining", "It / was / raining", "It / rained"],
            correctIndex: 0,
            translation: "「朝からずっと雨が降っている」",
            explanation: """
            ・It's been + V-ing = 「ずっと〜している」現在完了進行形
            ・過去のある時点から今まで続いている動作を強調
            ・"朝からずっと雨が降ってる" / "ずっと考えてた"
            ・It has been raining の短縮形(口語ではほぼ短縮形)
            ・"It's been snowing for hours." / "I've been waiting all day."
            ・類義: It has been ~ing(書き言葉) / It's still ~ing(継続強調)
            ・継続性を伝える重要な時制
            """
        ),
        GrammarQuestion(
            id: "q360",
            question: "She loves jazz, ___ ___ ___ ___ she plays it daily.",
            choices: ["so / much / so / that", "so / much / as / that", "too / much / so / that", "such / much / so / that"],
            correctIndex: 0,
            translation: "「彼女はジャズが大好きで、毎日演奏するほどだ」",
            explanation: """
            ・so much so that + 文 = 「あまりに〜なので…」程度の強調
            ・前の文を受けて「それほどまでに〜だから」と結果を導く
            ・"すごくジャズが好きで、毎日聴くほど" のように強い程度から結果へ
            ・"He's brilliant, so much so that everyone admires him."
            ・書き言葉や少し改まった会話で頻出
            ・類義: to the point that(〜するほどに) / so much that(とても〜なので)
            ・前の主張を強調して具体例を続ける時に効果的
            """
        ),
        GrammarQuestion(
            id: "q361",
            question: "___ ___ it helpful to read every day.",
            choices: ["I've / found", "I / find", "I'm / found", "I / found"],
            correctIndex: 0,
            translation: "「毎日読書することが役立つと感じている」",
            explanation: """
            ・I've found + 目的語 + 形容詞/補語 = 「〜だと分かった・経験から〜と感じている」
            ・過去から今までの経験を通じて得た気づきを伝える
            ・"毎日読書するのが役立つと分かった" / "彼は信頼できると思っている"
            ・"I've found this approach effective." / "I've found him very helpful."
            ・類義: I've realized(気づいた) / I've learned(学んだ)
            ・経験に基づく結論を述べる定番
            ・「ずっとそう感じていて、今も」というニュアンス
            """
        ),
        GrammarQuestion(
            id: "q362",
            question: "___ ___ ___ quit my job.",
            choices: ["I've / decided / to", "I / decided / to", "I'm / deciding / to", "I've / decide / to"],
            correctIndex: 0,
            translation: "「仕事を辞めることに決めた」",
            explanation: """
            ・I've decided to + 動詞原形 = 「〜することに決めた」現在完了形
            ・決断した瞬間からその決意が現在も続いているニュアンス
            ・I decided to(過去形)よりも「今もその気持ち」が伝わる
            ・重大な決断や報告を伝える時の鉄板
            ・"I've decided to move abroad." / "She's decided to start her own business."
            ・類義: I've made up my mind to / I've chosen to
            ・決意表明の最強表現
            """
        ),
        GrammarQuestion(
            id: "q363",
            question: "___ ___ ___ understand French.",
            choices: ["I'm / starting / to", "I / start / to", "I'm / start / to", "I / started / to"],
            correctIndex: 0,
            translation: "「フランス語が分かるようになってきた」",
            explanation: """
            ・I'm starting to + 動詞原形 = 「〜し始めている」変化が今まさに進行中
            ・"フランス語が分かるようになってきた" / "彼が好きになってきた"
            ・徐々に状態が変わっていく感覚を表現
            ・気づきや成長を伝える時に最適
            ・"I'm starting to like it here." / "She's starting to feel better."
            ・類義: I'm beginning to(やや改まった) / I'm getting to(〜するようになる)
            ・"start" は動作の開始、"start + ing" / "start + to" 両方OK(若干ニュアンス差)
            """
        ),
        GrammarQuestion(
            id: "q364",
            question: "Let's ___ the meeting now.",
            choices: ["begin", "began", "begun", "beginning"],
            correctIndex: 0,
            translation: "「では会議を始めましょう」",
            explanation: """
            ・begin + 名詞/動名詞 = 「〜を始める」start よりやや改まった
            ・会議・授業・プロジェクトなど公式に何かをスタートさせる時に自然
            ・Let's begin は会議や授業の開始の定番
            ・"Let's begin our journey." / "We'll begin shortly."
            ・類義: start(最も一般的) / kick off(カジュアル)
            ・Let's の後は必ず動詞原形(× Let's began)
            ・begin-began-begun の不規則変化
            """
        ),
        GrammarQuestion(
            id: "q365",
            question: "I like ___ coffee ___ tea.",
            choices: ["both / and", "both / or", "either / and", "neither / and"],
            correctIndex: 0,
            translation: "「コーヒーも紅茶も両方好きだ」",
            explanation: """
            ・both A and B = 「AもBも両方」並列表現
            ・2つとも好き・両方該当することを強調
            ・"コーヒーも紅茶も好き" / "彼も彼女も来た"
            ・A と B は同じ品詞(名詞同士・形容詞同士)にする
            ・"Both happy and sad." / "Both you and I know this."
            ・類義: A as well as B / not only A but also B(強調)
            ・他の選択肢: either/or(どちらか) / neither/nor(両方否定)
            """
        ),
        GrammarQuestion(
            id: "q366",
            question: "You're wearing your shirt ___ ___.",
            choices: ["inside / out", "outside / in", "inside / in", "out / inside"],
            correctIndex: 0,
            translation: "「シャツを裏返しに着てるよ」",
            explanation: """
            ・inside out = 「裏返しに・裏表逆に」慣用表現
            ・服を間違えて着た時の定番表現
            ・比喩で「徹底的に」: know something inside out = 〜を熟知している
            ・"He knows this city inside out." / "Turn it inside out."
            ・類義: upside down(上下逆さま) / backwards(前後逆)
            ・完全な理解を表す時にも使える比喩
            ・固定語順(× outside in は誤り)
            """
        ),
        GrammarQuestion(
            id: "q367",
            question: "Stop ___ ___! Don't move.",
            choices: ["right / there", "just / there", "on / there", "at / there"],
            correctIndex: 0,
            translation: "「そこで止まれ!動くな!」",
            explanation: """
            ・right there = 「まさにそこに・ちょうどそこで」
            ・right が「ちょうど・まさに」と位置を強調
            ・"そこで止まって!" / "ほら、そこだよ"
            ・特定の場所を指差すような時に使う
            ・"It's right there." / "Wait right there."
            ・同パターン: right here(まさにここ) / right now(まさに今) / right after(すぐ後)
            ・類義: right here(まさにここ) / just there(ちょうどそこ)
            ・位置・時間を強調する right の用法
            """
        ),
        GrammarQuestion(
            id: "q368",
            question: "The weather is ___ cold today.",
            choices: ["rather", "very much", "too many", "so very"],
            correctIndex: 0,
            translation: "「今日はけっこう寒い」",
            explanation: """
            ・rather + 形容詞 = 「かなり〜・なかなか〜」控えめな強調
            ・very(とても)より少し抑えた印象、英国英語で特によく使う
            ・「すごく寒い」だと大げさ → 「けっこう寒いね」と上品に
            ・"It's rather difficult." / "Rather nice, isn't it?"
            ・類義: quite(けっこう・英) / pretty(かなり・米)
            ・直接的すぎる表現を避ける英国的な感覚
            ・rather like = むしろ好き、I'd rather = むしろ〜したい(別用法)
            """
        ),
        GrammarQuestion(
            id: "q369",
            question: "I try to exercise ___ ___ ___ I can.",
            choices: ["as / much / as", "so / much / as", "too / much / as", "more / much / than"],
            correctIndex: 0,
            translation: "「できる限り運動するようにしている」",
            explanation: """
            ・as much as ~ = 「〜と同じくらい多く・〜できるだけ」同等比較
            ・量や程度の比較。「できるだけ運動する」「君と同じくらい愛してる」
            ・可算名詞には as many as、不可算名詞には as much as
            ・"I love you as much as you love me." / "Drink as much as you can."
            ・類義: as many as(可算) / as much as possible(可能な限り)
            ・否定形: not as much as(〜ほどではない)
            ・限界や同等性を表す重要な比較構文
            """
        ),
        GrammarQuestion(
            id: "q370",
            question: "The traffic today wasn't ___ ___ ___ yesterday.",
            choices: ["as / bad / as", "so / bad / as", "too / bad / as", "more / bad / than"],
            correctIndex: 0,
            translation: "「今日の渋滞は昨日ほどひどくなかった」",
            explanation: """
            ・as bad as ~ = 「〜と同じくらい悪い」ネガティブな同等比較
            ・否定形 not as bad as = 「思ったほど悪くない」(慰めの場面で頻出)
            ・"見た目ほど悪くない" / "予想したほどひどくなかった"
            ・"It's not as bad as it looks." / "Not as bad as I thought."
            ・類義: just as bad as(強調・全く同じ) / worse than(比較級)
            ・マイナスの程度を比較する時に
            ・口語: so bad as は古風、現代では as bad as
            """
        ),
        GrammarQuestion(
            id: "q371",
            question: "This box is ___ ___ ___ ___ the other one.",
            choices: ["twice / as / heavy / as", "two / times / as / heavy", "twice / so / heavy / as", "two / heavy / than"],
            correctIndex: 0,
            translation: "「この箱はもう一つの2倍重い」",
            explanation: """
            ・twice as + 形容詞 + as = 「〜の2倍…」倍数比較の基本
            ・2倍 = twice / 3倍以上 = three times を使う
            ・"Twice as big." / "Twice as fast." / "Twice as expensive."
            ・類義: three times as ~ as / double the size of
            ・two times as は通常 twice に置き換える
            ・物理的な大きさ、値段、時間など何でも比較できる
            ・"This costs twice as much as that one."
            """
        ),
        GrammarQuestion(
            id: "q372",
            question: "This bottle holds ___ ___ ___ ___ water as the big one.",
            choices: ["one / fourth / as / much", "one / fourth / as / many", "one / quarter / as / few", "one / four / as / much"],
            correctIndex: 0,
            translation: "「このボトルは大きい方の4分の1の水しか入らない」",
            explanation: """
            ・one fourth as + much/many + as = 「〜の4分の1の…」分数比較
            ・water は不可算名詞 → as much / 可算名詞なら as many
            ・one fourth = a quarter(同じ意味)、時間やお金では quarter が頻出
            ・"quarter past three" = 3時15分
            ・"half as much as" = 〜の半分の量
            ・類義: a quarter as much as / half as much as
            ・分数表現: half / one third / two thirds / one fourth / three quarters
            """
        ),
        GrammarQuestion(
            id: "q373",
            question: "Stay ___ — it's freezing outside.",
            choices: ["inside", "outside", "onto", "into"],
            correctIndex: 0,
            translation: "「中にいて、外は凍えるほど寒いから」",
            explanation: """
            ・inside = 「中に・内側に」副詞・前置詞・名詞として使える万能語
            ・「外と対比して中」を強調。in より「内と外の対比」を意識
            ・"Come inside!" / "Stay inside." / "Inside the box."
            ・比喩: deep inside(心の奥底で)
            ・類義: indoors(屋内に・副詞) / within(〜の内部に・フォーマル)
            ・"What's inside?" = 中身は何?
            """
        ),
        GrammarQuestion(
            id: "q374",
            question: "The kids are playing ___.",
            choices: ["outside", "inside", "onto", "overhead"],
            correctIndex: 0,
            translation: "「子供たちは外で遊んでいる」",
            explanation: """
            ・outside = 「外に・外側に」inside の反対
            ・屋外で何かをしている時の定番
            ・比喩: "think outside the box" = 既存の枠を超えて考える
            ・"Wait outside." / "Outside the house." / "It's cold outside."
            ・類義: outdoors(屋外で・副詞) / out(外に・カジュアル)
            ・前置詞としても: outside the building(建物の外で)
            ・「外で遊ぶ」「外で待つ」など物理的な外を表す基本表現
            """
        ),
        GrammarQuestion(
            id: "q375",
            question: "He ran ___ ___ the building when he heard the alarm.",
            choices: ["out / of", "outside / of", "onto / to", "over / of"],
            correctIndex: 0,
            translation: "「警報を聞いて彼は建物から走り出た」",
            explanation: """
            ・out of + 名詞 = 「〜から外へ」動きを伴う離脱
            ・outside(外で・場所)との違いは、out of には「動き」がある
            ・"Get out of here!" / "out of bed" / "out of the room"
            ・状態・動機も表す: out of stock(在庫切れ) / out of curiosity(好奇心から) / out of breath(息切れ)
            ・out of order(故障中) / out of work(失業中) / out of control(制御不能)
            ・類義: from(一般的) / away from(離れて)
            ・動きを伴う多義的な重要表現
            """
        ),
        GrammarQuestion(
            id: "q376",
            question: "She has worked ___ some great artists.",
            choices: ["alongside", "along", "inside", "outside"],
            correctIndex: 0,
            translation: "「彼女は素晴らしいアーティストたちと協力して働いてきた」",
            explanation: """
            ・alongside = 「〜と並んで・〜と協力して」対等な立場で一緒に
            ・work alongside(協力して働く) / stand alongside(並んで立つ)
            ・連帯感を出したい時に使うと知的な印象
            ・beside(そばに)より能動的な関係性を示す
            ・"They fought alongside their allies." / "Working alongside experts."
            ・類義: side by side with(並んで・同義) / together with(〜と一緒に)
            ・ビジネスや報道で頻出する協力関係の表現
            """
        ),
        GrammarQuestion(
            id: "q377",
            question: "This project is ___ my expertise.",
            choices: ["beyond", "below", "above", "under"],
            correctIndex: 0,
            translation: "「このプロジェクトは私の専門外だ」",
            explanation: """
            ・beyond + 名詞 = 「〜を超えて」物理的にも抽象的にも「超越」
            ・「専門外」「理解を超える」「期待以上」など限界の外を示す
            ・beyond belief(信じられない) / beyond compare(比類なき) / beyond doubt(疑いの余地なく)
            ・"beyond my control" / "beyond my reach" / "beyond expectations"
            ・類義: past(〜を過ぎて) / outside the scope of(〜の範囲外)
            ・over より知的・フォーマルな響き
            ・強調表現でも頻出
            """
        ),
        GrammarQuestion(
            id: "q378",
            question: "The clouds gathered ___.",
            choices: ["overhead", "above", "over", "up"],
            correctIndex: 0,
            translation: "「雲が頭上に集まってきた」",
            explanation: """
            ・overhead = 「頭上に・上空に」自分の頭の真上という具体的な位置
            ・空や天井方向を見上げる場面で使う
            ・"A plane flew overhead." / "Clouds gathered overhead."
            ・名詞: overhead costs(諸経費・ビジネス)
            ・類義: above(より上に・位置関係) / up above(上の方に・口語)
            ・直接頭上 → overhead、漠然と上 → above
            ・ドラマチックな場面描写に適する
            """
        ),
        GrammarQuestion(
            id: "q379",
            question: "The kids ran ___ ___ the park.",
            choices: ["all / over", "all / above", "over / all", "all / on"],
            correctIndex: 0,
            translation: "「子供たちは公園のあちこちを走り回った」",
            explanation: """
            ・all over + 場所 = 「〜中・あちこちで」広範囲
            ・「世界中(all over the world)」「公園のあちこち」
            ・"It's all over." = もう終わった
            ・"all over again" = もう一度最初から
            ・everywhere より「広く散らばっている」感が強い
            ・類義: everywhere(どこでも) / throughout(〜全体に・フォーマル)
            ・"All over the place." = あちこちに・乱雑に
            """
        ),
        GrammarQuestion(
            id: "q380",
            question: "The plane flew ___ the clouds.",
            choices: ["above", "over", "on", "up"],
            correctIndex: 0,
            translation: "「飛行機は雲の上を飛んだ」",
            explanation: """
            ・above + 名詞 = 「〜より上に」位置関係を表す
            ・over(覆う)との違い: above は「上の方にある」だけで接触や覆いを示さない
            ・"above sea level" / "above average" / "above all"(何よりも)
            ・"above and beyond" = 期待以上に
            ・類義: higher than(〜より高い) / over(〜の上に・接触・覆い)
            ・抽象的な「より上」も表す: above average(平均以上)
            ・重要フレーズ多数の前置詞
            """
        ),
        GrammarQuestion(
            id: "q381",
            question: "The temperature dropped ___ zero.",
            choices: ["below", "over", "above", "under"],
            correctIndex: 0,
            translation: "「気温は氷点下に下がった」",
            explanation: """
            ・below + 名詞 = 「〜より下に・〜以下に」above の反対
            ・under(下に潜る)との違い: below は「位置関係としての下」
            ・「氷点下」「平均以下」「期待以下」など数値や水準を下回る時
            ・"below zero" / "below average" / "below sea level"
            ・"see below" = 下記参照(ビジネス文書の定番)
            ・類義: under(下に・接触・覆い) / beneath(下に・フォーマル)
            ・数値や階層の下を表す時に
            """
        ),
        GrammarQuestion(
            id: "q382",
            question: "He ___ come to the party tonight.",
            choices: ["won't", "wouldn't", "didn't", "hasn't"],
            correctIndex: 0,
            translation: "「彼は今夜のパーティーには来ないだろう」",
            explanation: """
            ・won't = will not の短縮形「〜しないだろう・〜する意志がない」
            ・日常会話ではほぼ短縮形を使う
            ・未来の否定 / 強い拒絶(やらない!) / 物の「動かない・効かない」も表す
            ・"The door won't open." = ドアが開かない
            ・"I won't tell anyone." = 誰にも言わない
            ・類義: will not(強調・フォーマル) / am/is/are not going to(〜する予定がない)
            ・意志の否定が核心
            """
        ),
        GrammarQuestion(
            id: "q383",
            question: "The company ___ ___ tolerate any misconduct.",
            choices: ["will / not", "won't / not", "does / not", "would / not"],
            correctIndex: 0,
            translation: "「当社は不正行為を一切容認しない」",
            explanation: """
            ・will not = won't のフォーマル版、意志の強さを強調
            ・短縮しないことで「絶対に〜しない」という固い決意を表す
            ・公式声明、契約書、重要な宣言で頻出
            ・"We will not tolerate ~"(〜は容認しません) — ビジネスや政治演説の定番
            ・普段の会話なら won't で十分
            ・類義: won't(短縮・カジュアル) / refuse to(さらに強い・拒否)
            ・正式な決意表明
            """
        ),
        GrammarQuestion(
            id: "q384",
            question: "___ ___ please pass the salt?",
            choices: ["Would / you", "Did / you", "Will / you", "Could / you"],
            correctIndex: 0,
            translation: "「塩を取っていただけますか?」",
            explanation: """
            ・Would you + 動詞? = 「〜してくれますか?」丁寧な依頼の定番
            ・Can you? より丁寧、Could you? とほぼ同じ丁寧さ
            ・レストラン、職場、知らない人への依頼など丁寧さが必要な場面で
            ・"Would you like ~?" は提案の鉄板表現(〜はいかがですか?)
            ・"Would you mind ~ing?" は最も丁寧な依頼
            ・類義: Could you(同等の丁寧さ) / Would you mind ~ing(最丁寧)
            ・ビジネスの基本依頼表現
            """
        ),
        GrammarQuestion(
            id: "q385",
            question: "I'll help you ___ ___ ___ ___ ___.",
            choices: ["as / much / as / I / can", "so / much / as / I / can", "too / much / as / I / can", "as / many / as / I / can"],
            correctIndex: 0,
            translation: "「できる限りお手伝いします」",
            explanation: """
            ・as much as I can = 「できるだけ・できる限り」慣用句
            ・自分の能力の限界内で最大限というニュアンス
            ・「できるだけ手伝う」「可能な限り頑張る」など、努力を約束する時の鉄板
            ・help は不可算扱い → much / 可算名詞なら as many as I can
            ・"I'll do as much as I can." / "Eat as much as you can."
            ・類義: as much as possible(可能な限り) / to the best of my ability(全力で・フォーマル)
            ・努力を約束する時の重要表現
            """
        ),
        GrammarQuestion(
            id: "q386",
            question: "This shirt is ___ ___ ___ yours.",
            choices: ["the / same / as", "the / same / like", "a / same / as", "the / same / than"],
            correctIndex: 0,
            translation: "「このシャツはあなたのと同じだ」",
            explanation: """
            ・the same as + 名詞 = 「〜と同じ」完全な同一性
            ・similar to(似ている)と違い、全く同じことを強調
            ・「いつもと同じ」「以前と同じ」など日常で多用
            ・返事: Same here.(私も同じ) / Same to you.(そちらも) — 便利
            ・"Just the same as before." / "Exactly the same as mine."
            ・類義: identical to(完全に一致・フォーマル) / just like(〜と同じ・口語)
            ・the は必須、as と組合せる(× the same than)
            """
        ),
        GrammarQuestion(
            id: "q387",
            question: "___ ___ a problem with your order.",
            choices: ["There / is", "It / has", "There / has", "That / is"],
            correctIndex: 0,
            translation: "「あなたの注文に問題があります」",
            explanation: """
            ・There is/are + 名詞 = 「〜がある・いる」存在文の基本構文
            ・新しい情報を導入する時に使う
            ・単数・不可算 → there is / 複数 → there are
            ・口語では there's と短縮(複数でも there's を使うことがある)
            ・"There is a problem." / "There are many options." / "There's no time."
            ・類義: There exists(〜が存在する・フォーマル) / We have(別の言い方)
            ・存在を伝える時の絶対基本構文
            """
        ),
        GrammarQuestion(
            id: "q388",
            question: "\"Where is John?\" \"He ___ ___ at the office.\"",
            choices: ["could / be", "is / be", "might / been", "can / been"],
            correctIndex: 0,
            translation: "「『ジョンはどこ?』『オフィスにいるかも』」",
            explanation: """
            ・could be + 形容詞/場所 = 「〜かもしれない」中立的な推量
            ・確信度は50%くらい、「あり得る」というニュアンス
            ・「家にいるかも」「正しいかも」など
            ・"Could be worse." = もっと悪くなり得た(慰め)
            ・"Could be better." = もっと良くなり得る(不満)
            ・"It could be him." / "Could be true."
            ・類義: might be(〜かもしれない・やや弱い) / may be(中立)
            ・推量の鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q389",
            question: "She knew ___ ___ detail of the case.",
            choices: ["every / single", "every / and", "each / single", "any / single"],
            correctIndex: 0,
            translation: "「彼女はその事件の一つ一つの詳細を知っていた」",
            explanation: """
            ・every single + 単数名詞 = 「一つ一つすべて」完全な強調
            ・every だけより「漏れなく・例外なく」のニュアンスが強い
            ・"細部一つ残らず知っている" / "毎日欠かさず"
            ・"every single day" / "every single one" / "every single time"
            ・称賛、苛立ち、決意などドラマチックな場面に最適
            ・類義: each and every(一人一人すべて) / every last(最後の一つまで)
            ・感情の重みを込めた強調表現
            """
        ),
        GrammarQuestion(
            id: "q390",
            question: "You can go by train or by bus — ___ ___, you'll get there.",
            choices: ["either / way", "any / way", "some / way", "both / way"],
            correctIndex: 0,
            translation: "「電車でもバスでも、どちらでも着くよ」",
            explanation: """
            ・either way = 「どちらにせよ・どちらでも」口語表現
            ・2つの選択肢どちらでも結果が同じことを示す
            ・「どっちでも着く」「どちらにせよ決めよう」
            ・anyway(とにかく)と似ているが、either way は2つの選択肢を踏まえての結論
            ・"Either way works for me." / "Either way, I'm in."
            ・類義: whichever way(どちらの方法でも) / anyhow(とにかく・カジュアル)
            ・選択肢を踏まえた結論を示す万能フレーズ
            """
        ),
        GrammarQuestion(
            id: "q391",
            question: "___ ___ been to Paris before.",
            choices: ["I've / never", "I / never", "I've / not", "I'm / never"],
            correctIndex: 0,
            translation: "「これまでパリに行ったことがない」",
            explanation: """
            ・I've never + 過去分詞 = 「今までに一度も〜したことがない」現在完了の否定
            ・never = 「これまで一度もない」経験の完全否定
            ・生まれてから今までの経験を語る
            ・"I've never seen that before." / "I've never been so happy."
            ・類義: I haven't ever(やや堅い) / I've yet to(まだ〜していない・フォーマル)
            ・初体験を強調する時の鉄板
            ・"Never have I ever ~" は倒置の強調形
            """
        ),
        GrammarQuestion(
            id: "q392",
            question: "___ ___ ___ all morning.",
            choices: ["I've / been / studying", "I / am / studying", "I / was / studied", "I / studied"],
            correctIndex: 0,
            translation: "「朝からずっと勉強している」",
            explanation: """
            ・I've been + V-ing = 現在完了進行形「過去から今までずっと〜している」
            ・継続性を強調するのが特徴
            ・"朝からずっと勉強してる" / "最近忙しくしてる"
            ・"I've been working hard." / "She's been studying for hours."
            ・現在完了 I've studied(完了・経験) vs 進行形(継続)
            ・類義: I have been ~ing(短縮なし・書き言葉) / I've been + 名詞(状態)
            ・動作が続いている感覚を伝える
            """
        ),
        GrammarQuestion(
            id: "q393",
            question: "The hotel is cheap. ___, the location is perfect.",
            choices: ["Moreover", "However", "Nevertheless", "Otherwise"],
            correctIndex: 0,
            translation: "「ホテルは安い。さらに、立地も完璧だ」",
            explanation: """
            ・Moreover = 「さらに・その上」フォーマルな追加情報のつなぎ語
            ・同類の情報を加える時。ポジティブな情報の積み重ねに最適
            ・ビジネス文書、エッセイ、プレゼンで頻出
            ・会話では Plus / On top of that の方が自然
            ・"Moreover, the staff was excellent." / "The plan is feasible. Moreover, it's cost-effective."
            ・類義: Furthermore(さらに・フォーマル) / In addition(加えて・中立)
            ・対比: However(しかし) / Otherwise(さもなければ)
            """
        ),
        GrammarQuestion(
            id: "q394",
            question: "He ___ ___ paying for dinner.",
            choices: ["insisted / on", "insisted / for", "insisted / to", "insisted / about"],
            correctIndex: 0,
            translation: "「彼は夕食代を払うと言って譲らなかった」",
            explanation: """
            ・insist on + 名詞/動名詞 = 「〜を主張する・強く言い張る」前置詞は on で固定
            ・「夕食代を払うと言って譲らない」「自分のやり方にこだわる」
            ・後ろは必ず名詞または動名詞(-ing)、不定詞は使えない
            ・"She insisted on coming with us." / "He insisted on his innocence."
            ・類義: demand(強く要求) / be adamant about(断固たる・フォーマル)
            ・強い主張や譲らない姿勢を表す
            ・insist that 節も可: "He insisted that I take it."(仮定法現在)
            """
        ),
        GrammarQuestion(
            id: "q395",
            question: "The food was ___ ___.",
            choices: ["pretty / good", "pretty / well", "very / well", "pretty / better"],
            correctIndex: 0,
            translation: "「料理はけっこう美味しかった」",
            explanation: """
            ・pretty + 形容詞 = 「かなり〜・けっこう〜」口語的な強調
            ・very ほど強くなく、控えめだが肯定的
            ・「けっこう美味しい」「まあまあいい」
            ・アメリカ英語で特によく使う
            ・"Pretty good!" / "Pretty cool." / "Pretty easy."
            ・pretty good(けっこう良い) vs pretty well(けっこう上手に・副詞修飾)
            ・類義: fairly(まあまあ・中立) / quite(けっこう・英)
            ・形容詞 good を修飾 → pretty good が正解(× pretty well)
            """
        ),
        GrammarQuestion(
            id: "q396",
            question: "___, are you really going to quit?",
            choices: ["Seriously", "Serious", "In serious", "Seriousness"],
            correctIndex: 0,
            translation: "「マジで?本当に辞めるの?」",
            explanation: """
            ・Seriously = 「真面目に・本気で」副詞
            ・文頭で「マジで?本気?」と相手の発言の真意を確認する口語
            ・Seriously? 単独で「マジで?」
            ・"Seriously, ~" で話題を真剣モードに切り替える
            ・"Seriously, I love it." / "Seriously? No way!"
            ・類義: Really?(本当に?) / For real?(マジで?・カジュアル)
            ・驚き、疑問、強調などのニュアンスを伴う
            ・take ~ seriously = 〜を真面目に受け取る
            """
        ),
        GrammarQuestion(
            id: "q397",
            question: "He's busy at work, ___ ___ ___ studying for his exam.",
            choices: ["on / top / of", "on / the / top", "at / top / of", "in / top / of"],
            correctIndex: 0,
            translation: "「仕事で忙しいうえに、試験勉強もある」",
            explanation: """
            ・on top of + 名詞 = 「〜に加えて・〜の上に」
            ・物理的に「上に」だけでなく、プラスαの状況を表す比喩
            ・「仕事で忙しい、その上勉強もある」 — 負担や状況の積み重ね
            ・"On top of everything else, ~" / "On top of that, ~"
            ・"On top of the world." = 最高の気分(慣用句)
            ・"On top of things." = 把握している
            ・類義: in addition to(〜に加えて・フォーマル) / plus(その上・カジュアル)
            """
        ),
        GrammarQuestion(
            id: "q398",
            question: "She walked ___ ___ ___ in the room.",
            choices: ["back / and / forth", "forth / and / back", "back / and / front", "from / and / to"],
            correctIndex: 0,
            translation: "「彼女は部屋を行ったり来たりした」",
            explanation: """
            ・back and forth = 「行ったり来たり・往復して」慣用句
            ・順序固定で forth and back とは言わない
            ・物理的な往復だけでなく、議論やメールのやり取りでも使う
            ・"Walking back and forth." / "Emails back and forth."
            ・動作の反復や非効率さを表すニュアンスも
            ・類義: to and fro(古風) / up and down(上下・縦の往復)
            ・"Back and forth, back and forth." — 強調の反復
            """
        ),
        GrammarQuestion(
            id: "q399",
            question: "Trends ___ ___ ___, but classics stay.",
            choices: ["come / and / go", "go / and / come", "come / or / go", "come / and / leave"],
            correctIndex: 0,
            translation: "「流行は来ては去るが、定番は残る」",
            explanation: """
            ・come and go = 「来ては去る・現れては消える」慣用句
            ・順序固定で語順を変えない
            ・流行、人々、感情、痛みなど一時的なものを表現
            ・"Trends come and go." / "Pain comes and goes."
            ・人生の無常や変化を語る時にも詩的に使える
            ・"Easy come, easy go." = 簡単に得たものは簡単に失う(諺)
            ・類義: come and pass(過ぎ去る) / fluctuate(変動・フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q400",
            question: "___ ___ ___ ___ ___ on this decision for weeks.",
            choices: ["I've / been / back / and / forth", "I / am / back / and / forth", "I / went / back / and / forth", "I'm / been / back / and / forth"],
            correctIndex: 0,
            translation: "「この決定について何週間も迷っている」",
            explanation: """
            ・I've been back and forth = 「ずっと迷っている・行ったり来たり」
            ・back and forth を現在完了進行形と組合せて長期間の迷いや往復を表す
            ・「何週間も決められない」「決断に揺れ動いている」
            ・"I've been back and forth on this." / "We've been back and forth all day."
            ・優柔不断な状況や物理的な往復の継続
            ・類義: I've been torn(引き裂かれている) / I've been undecided(決められない)
            ・決断に迷う時の鉄板表現
            """
        ),
        GrammarQuestion(
            id: "q401",
            question: "I see him ___ ___ ___ ___.",
            choices: ["once / in / a / while", "one / in / a / while", "once / at / a / while", "once / on / the / while"],
            correctIndex: 0,
            translation: "「彼にはたまに会う」",
            explanation: """
            ・once in a while = 「たまに・時々」慣用句
            ・頻度の低さを表す口語的表現
            ・「たまに会う」「時々連絡する」
            ・sometimes(時々)より頻度がさらに低い、rarely(めったに〜ない)よりは多い
            ・"I treat myself once in a while." / "Once in a while it's nice to relax."
            ・類義: every now and then(同義) / occasionally(時折・フォーマル)
            ・完全に途絶えてもいない関係や習慣を表す
            """
        ),
        GrammarQuestion(
            id: "q402",
            question: "___ ___ start, you can't stop.",
            choices: ["Once / you", "When / you", "Since / you", "Until / you"],
            correctIndex: 0,
            translation: "「いったん始めたら、止められない」",
            explanation: """
            ・Once + 主語 + 動詞 = 「いったん〜すると・〜したら」接続詞
            ・when(〜する時)より「一度〜してしまえば」のニュアンスが強い
            ・「始めたら止まらない」「慣れたら簡単」
            ・"Once you try it, you'll love it." / "Once I make up my mind, that's it."
            ・動作の開始後の状態を強調
            ・類義: as soon as(〜するとすぐに) / after(〜の後で)
            ・条件と時間の両方の意味を併せ持つ便利な接続詞
            """
        ),
        GrammarQuestion(
            id: "q403",
            question: "The party ___ ___ to be a huge success.",
            choices: ["turned / out", "turned / on", "turned / into", "turned / over"],
            correctIndex: 0,
            translation: "「パーティーは結果的に大成功だった」",
            explanation: """
            ・turn out + to be/形容詞 = 「結果として〜になる・〜だと判明する」
            ・予想と違った結果や最終的に明らかになった事実を伝える
            ・「結果的に大成功」「実は彼が正しかった」
            ・"It turned out to be a mistake." / "She turned out to be wonderful."
            ・"How did it turn out?" = どうなった?(頻出)
            ・類義: end up(結局〜になる・カジュアル) / prove to be(〜だと判明・フォーマル)
            ・ストーリーの結末や意外な展開を語る時の鉄板
            ・他: turn on(つける) / turn into(変える) / turn over(裏返す)
            """
        ),
        GrammarQuestion(
            id: "q404",
            question: "___ ___ ___ decide to move?",
            choices: ["What / made / you", "Why / made / you", "How / made / you", "What / makes / you"],
            correctIndex: 0,
            translation: "「何があなたに引っ越そうと決めさせたの?(なぜ引っ越そうと?)」",
            explanation: """
            ・What made you + 動詞原形? = 「なぜ〜したの?」動機を尋ねる
            ・Why did you ~? と同じ意味だが、より柔らかく好奇心を込めた印象
            ・相手の決断や選択の背景を知りたい時に
            ・"What made you choose this?" / "What made you change your mind?"
            ・類義: Why did you(直接的) / What inspired you to(ポジティブ)
            ・興味を示しつつ尋ねられる
            ・made + you = 使役、後ろは動詞原形
            """
        ),
        GrammarQuestion(
            id: "q405",
            question: "___ ___ ___ here today?",
            choices: ["What / brought / you", "Who / brought / you", "Why / brought / you", "How / brought / you"],
            correctIndex: 0,
            translation: "「何があなたを今日ここに連れてきたの?(どうしてここに?)」",
            explanation: """
            ・What brought you + 場所? = 「なぜここに?」来訪の理由を尋ねる
            ・"Why are you here?" より丁寧で好奇心のあるニュアンス
            ・初対面や久しぶりの再会で使うと自然
            ・「何の用事で?」「どうしてここに?」
            ・"What brings you here?"(現在形・今の理由)
            ・類義: What brings you(現在) / What's the occasion?(何の機会で?)
            ・柔らかく聞ける丁寧な質問
            """
        ),
        GrammarQuestion(
            id: "q406",
            question: "We'll discuss this ___ ___.",
            choices: ["later / on", "later / in", "after / on", "more / later"],
            correctIndex: 0,
            translation: "「これについては後ほど話し合おう」",
            explanation: """
            ・later on = 「後で・後ほど」口語表現
            ・later 単独でも「後で」だが、later on は「もう少し後で」の具体的な感覚
            ・"未来のある時点を曖昧に指す"
            ・"Talk later on." / "We'll see later on."
            ・ビジネスでも日常でも使える便利なフレーズ
            ・相手に時間を与える時に重宝
            ・類義: afterwards(後で・フォーマル) / in a bit(ちょっとしたら・カジュアル)
            """
        ),
        GrammarQuestion(
            id: "q407",
            question: "The ___ ___ people agreed with the decision.",
            choices: ["majority / of", "major / of", "most / of", "many / of"],
            correctIndex: 0,
            translation: "「大多数の人が決定に賛成した」",
            explanation: """
            ・the majority of + 名詞 = 「〜の大多数・過半数」フォーマル
            ・most of より「半分以上」という数値的なニュアンスが明確
            ・アンケート、投票、世論などの統計的な文脈で頻出
            ・"大多数が賛成した" / "多くの人が反対"
            ・"The majority of voters supported it." / "The vast majority agreed."
            ・類義: most of(一般的) / the bulk of(大部分・フォーマル)
            ・集団の中の優勢な部分を表現する時に
            ・反対: the minority of(少数派)
            """
        ),
        GrammarQuestion(
            id: "q408",
            question: "I did it ___.",
            choices: ["myself", "by my", "for me", "my own"],
            correctIndex: 0,
            translation: "「自分でやった」",
            explanation: """
            ・myself = 再帰代名詞「自分自身で・自分を」
            ・文末で使うと「他人の助けなしで」を強調
            ・「自分でやった」「自分で作った」
            ・"I made it myself." / "She did it herself."
            ・by myself(一人で) / myself 単独は「自分の手で」と能動性強調
            ・類義: by myself(一人で・孤独感) / on my own(自力で・独立性)
            ・myself, yourself, himself, herself, itself, ourselves, yourselves, themselves
            """
        ),
        GrammarQuestion(
            id: "q409",
            question: "She ___ ___ help.",
            choices: ["asked / for", "asked / to", "asked / about", "asked / on"],
            correctIndex: 0,
            translation: "「彼女は助けを求めた」",
            explanation: """
            ・ask for + 名詞 = 「〜を求める・〜を頼む」前置詞は for で固定
            ・"Ask for help." / "Ask for directions." / "Ask for the bill."
            ・ask about ~(〜について尋ねる)とは意味が違う
            ・レストランやお店でのリクエストにも使える
            ・"Ask for water, please." / "She asked for a raise."
            ・類義: request(要請・フォーマル) / demand(要求・強い)
            ・何かを欲しいと頼む時に使う
            """
        ),
        GrammarQuestion(
            id: "q410",
            question: "___ ___ ___ go for a walk?",
            choices: ["Why / don't / we", "Why / not / we", "How / don't / we", "What / don't / we"],
            correctIndex: 0,
            translation: "「散歩に行きませんか?」",
            explanation: """
            ・Why don't we + 動詞原形? = 「〜しませんか?・〜しよう」提案表現
            ・直訳の「なぜしないの?」ではなく軽い誘いの定型句
            ・Let's ~ よりも丁寧で、相手の意見を尊重するニュアンス
            ・"Why don't we try?" / "Why don't we meet tomorrow?"
            ・"Why don't you ~?" = 「〜してみては?」相手への提案
            ・類義: Let's(直接的) / How about ~ing?(〜するのはどう?)
            ・友達や同僚への気軽な提案で頻出
            """
        ),
        GrammarQuestion(
            id: "q411",
            question: "The rain ___ ___ ___ cancel the picnic.",
            choices: ["forced / us / to", "forced / us / for", "forced / to / us", "forced / us / on"],
            correctIndex: 0,
            translation: "「雨のせいでピクニックを中止せざるを得なかった」",
            explanation: """
            ・force + 人 + to + 動詞原形 = 「人に強制的に〜させる」
            ・意志に反して何かをさせられるニュアンス
            ・「雨で中止せざるを得なかった」「無理やり決断させられた」
            ・"He forced me to apologize." / "Don't force yourself."
            ・受動態 be forced to ~(〜せざるを得ない)も頻出
            ・類義: compel + 人 + to(余儀なくさせる・フォーマル) / make + 人 + V(より一般的)
            ・強い圧力や状況による強制を表す
            """
        ),
        GrammarQuestion(
            id: "q412",
            question: "I can't wait ___ ___.",
            choices: ["any / longer", "some / longer", "more / longer", "no / longer"],
            correctIndex: 0,
            translation: "「もうこれ以上待てない」",
            explanation: """
            ・any longer = 「もうこれ以上〜ない」否定文と組合せ
            ・我慢の限界を表す時の定番
            ・「もう待てない」「もう続けられない」
            ・"I can't stand it any longer." / "Won't be needed any longer."
            ・anymore(もう〜ない)とほぼ同じだが、any longer は時間の継続を強調
            ・類義: anymore(同義) / no longer(肯定文で使う・「もはや〜ない」)
            ・"No longer needed."(肯定文) vs "Not needed any longer."(否定文) — 位置と形が違う
            """
        ),
        GrammarQuestion(
            id: "q413",
            question: "I want ___ ___ coffee — I've had enough.",
            choices: ["no / more", "no / less", "not / more", "any / more"],
            correctIndex: 0,
            translation: "「もうコーヒーはいらない、十分飲んだ」",
            explanation: """
            ・no more + 名詞 = 「もう〜はいらない・これ以上〜なし」
            ・完全な拒否や終了を表す
            ・「もうコーヒーはいい」「もう議論はやめよう」
            ・"No more excuses!" = 言い訳はもうやめろ!
            ・"No more drama." / "No more questions."
            ・強い禁止や決別を伝える時にも使える
            ・類義: no further(これ以上〜ない・フォーマル) / that's enough(もう十分)
            """
        ),
        GrammarQuestion(
            id: "q414",
            question: "She earned $10,000, ___ ___ than her boss.",
            choices: ["no / less", "no / more", "not / less", "any / less"],
            correctIndex: 0,
            translation: "「彼女は1万ドル、上司に劣らず稼いだ」",
            explanation: """
            ・no less than + 数値/名詞 = 「〜も・〜と同じくらい」驚きや感心を込めて
            ・「上司と同じくらい稼いだ」のように、少なくない多さを強調
            ・"No less than $10,000."(なんと1万ドルも)
            ・"No less than 100 people came."
            ・フォーマル寄りの強調表現
            ・類義: as much as(〜も) / a whopping(なんと・カジュアル)
            ・no more than(たった・少ない) vs no less than(も・多い) ── 対の関係
            """
        ),
        GrammarQuestion(
            id: "q415",
            question: "The trip took ___ ___ an hour.",
            choices: ["less / than", "more / than", "fewer / than", "least / than"],
            correctIndex: 0,
            translation: "「旅行は1時間もかからなかった」",
            explanation: """
            ・less than + 数値 = 「〜未満・〜より少なく」比較表現
            ・不可算名詞や時間・距離に使う
            ・「1時間未満」「20ドル未満」
            ・"Less than an hour." / "Less than $20." / "Less than 10 minutes."
            ・可算名詞には fewer than(より少ない)を使うのが正式
            ・口語では less than が混用されることも多い
            ・類義: fewer than(可算名詞) / under(〜未満・口語)
            """
        ),
        GrammarQuestion(
            id: "q416",
            question: "___ ___ you can come tomorrow.",
            choices: ["I / hope", "I / wish", "I'm / hoping", "I / hoped"],
            correctIndex: 0,
            translation: "「明日来られるといいな」",
            explanation: """
            ・I hope + 文 = 「〜だといいな」実現可能なことへの期待
            ・I wish との違い: hope(現実的な希望) / wish(実現困難な願望)
            ・"明日来られるといいな" / "うまくいきますように"
            ・"I hope so." / "I hope not." / "I hope you're well."
            ・that 節の that は省略可
            ・類義: I'm hoping(進行形で強調) / I trust(やや改まった)
            ・ポジティブで前向きな期待を伝える時に
            """
        ),
        GrammarQuestion(
            id: "q417",
            question: "___ ___ I had more time.",
            choices: ["I / wish", "I / hope", "I / wished", "I'm / wishing"],
            correctIndex: 0,
            translation: "「もっと時間があったらなあ」",
            explanation: """
            ・I wish + 過去形/仮定法 = 「〜だったらなあ」現実と違うことへの願望
            ・I wish I had(〜があれば) / I wish I were(〜であれば)など過去形を使う
            ・実現困難または不可能な願望
            ・"I wish I could fly." / "I wish I were younger."
            ・I hope(実現可能な期待) vs I wish(実現困難) — 時制と意味で明確に違う
            ・類義: If only(〜だったらなあ・強い後悔) / I'd love to(できればしたい・前向き)
            ・後悔や憧れを表現
            """
        ),
        GrammarQuestion(
            id: "q418",
            question: "___ ___ leave, please lock the door.",
            choices: ["Before / you", "After / you", "Until / you", "Since / you"],
            correctIndex: 0,
            translation: "「出かける前に、ドアに鍵をかけてね」",
            explanation: """
            ・Before + 主語 + 動詞 = 「〜する前に」接続詞
            ・動作の順序を明確にする時に
            ・「出かける前に」「決める前に」
            ・"Before you go ~" / "Before I forget" / "Before it's too late"
            ・会話やビジネスメールで頻出
            ・類義: prior to(〜の前に・フォーマル) / earlier than(〜より早く)
            ・注意喚起や指示にも使える便利な接続詞
            """
        ),
        GrammarQuestion(
            id: "q419",
            question: "Sorry, I'm busy now. Can we talk ___ ___?",
            choices: ["another / time", "other / time", "more / time", "some / time"],
            correctIndex: 0,
            translation: "「ごめん、今忙しい。また今度話せる?」",
            explanation: """
            ・another time = 「また今度・別の時に」
            ・今は無理だが将来的にというニュアンスを丁寧に伝える
            ・誘いを断る時の社交辞令としても使える
            ・「また今度ね」「別の機会に」
            ・"Let's do it another time." / "Maybe another time."
            ・完全な拒否ではなく、可能性を残す柔らかい言い回し
            ・類義: some other time(また別の時に) / later(後で・カジュアル)
            ・相手を傷つけずに済む配慮の表現
            """
        ),
        GrammarQuestion(
            id: "q420",
            question: "___ ___ stay home tonight.",
            choices: ["I'd / rather", "I'm / rather", "I / rather", "I've / rather"],
            correctIndex: 0,
            translation: "「今夜は家にいたい」",
            explanation: """
            ・I'd rather + 動詞原形 = 「〜したい・〜の方がいい」控えめな好み
            ・I would rather の短縮形
            ・「むしろ〜したい」というニュアンスで、強くない好みを丁寧に
            ・"I'd rather not."(〜したくない・丁寧な断り)
            ・"I'd rather walk." / "I'd rather stay quiet."
            ・I'd rather A than B = BよりAしたい
            ・類義: I'd prefer to(〜の方がいい・フォーマル) / I'd rather not(できれば〜したくない)
            ・丁寧な断りの定番
            """
        ),
        GrammarQuestion(
            id: "q421",
            question: "I don't want to ___ ___ ___ their argument.",
            choices: ["get / involved / in", "get / involve / in", "be / involved / on", "get / involved / for"],
            correctIndex: 0,
            translation: "「彼らの議論に巻き込まれたくない」",
            explanation: """
            ・get involved in + 名詞 = 「〜に関わる・〜に巻き込まれる」前置詞は in で固定
            ・「議論に巻き込まれる」「プロジェクトに関わる」
            ・主体的または受動的な関与を表す
            ・"Get involved in the community." / "Don't get involved in their fight."
            ・"don't want to get involved" = 関わりたくない(トラブルから距離を置く)
            ・類義: be part of(〜の一部になる) / engage in(〜に従事する・フォーマル)
            ・人間関係やトラブルの話で頻出
            """
        ),
        GrammarQuestion(
            id: "q422",
            question: "The bill comes to $50 ___.",
            choices: ["altogether", "all together", "together all", "totally"],
            correctIndex: 0,
            translation: "「お会計は合計50ドルです」",
            explanation: """
            ・altogether(1語) = 「合計で・完全に」副詞
            ・2語の all together は「皆一緒に」と意味が違うので注意
            ・「合計50ドル」「完全に違う」
            ・"That's $50 altogether." / "It's altogether different."
            ・"Not altogether wrong." = 完全には間違ってない
            ・類義: in total(合計で・中立) / completely(完全に・程度)
            ・1語と2語で全く別の意味になる典型
            """
        ),
        GrammarQuestion(
            id: "q423",
            question: "Let's start ___ ___ ___.",
            choices: ["from / the / beginning", "on / the / beginning", "at / the / beginning", "since / the / beginning"],
            correctIndex: 0,
            translation: "「最初から始めよう」",
            explanation: """
            ・from the beginning = 「最初から・初めから」前置詞は from(起点)
            ・「最初からやり直そう」「最初から知っていた」
            ・"From the very beginning." / "I knew from the beginning."
            ・at the beginning(最初の段階で・冒頭で)とニュアンスが少し違う
            ・"At the beginning of the year"(年初に) vs "From the beginning"(初めから)
            ・類義: from the start(同義) / right from the get-go(最初から・カジュアル)
            ・ある時点を起点に語る時に
            """
        ),
        GrammarQuestion(
            id: "q424",
            question: "Are you ___ ___ help us?",
            choices: ["willing / to", "wanting / to", "willing / for", "will / to"],
            correctIndex: 0,
            translation: "「私たちを手伝う気はある?」",
            explanation: """
            ・be willing to + 動詞原形 = 「進んで〜する・〜する意思がある」
            ・強制ではなく自主的な意志を表す
            ・「手伝う気はある?」「協力する用意がある」
            ・want to(〜したい)よりも控えめで「気持ちはある」のニュアンス
            ・"I'm willing to listen." / "She's willing to try."
            ・類義: ready to(準備ができている) / prepared to(用意がある・フォーマル)
            ・ビジネスでも日常でも便利な表現
            """
        ),
        GrammarQuestion(
            id: "q425",
            question: "\"Do you mind if I open the window?\" \"___ ___ ___.\"",
            choices: ["Not / at / all", "No / at / all", "Not / in / all", "Not / for / all"],
            correctIndex: 0,
            translation: "「『窓を開けてもいい?』『全然構いません』」",
            explanation: """
            ・Not at all = 「全然構わない・どういたしまして」完全否定の慣用句
            ・Do you mind ~?(〜してもいい?)への返答として肯定的に
            ・お礼への返答: "Thanks." → "Not at all."(どういたしまして)
            ・直訳の「全然〜ない」だが、丁寧な反応として定着
            ・"Not at all, please."(どうぞどうぞ)
            ・類義: No problem(問題ない・カジュアル) / You're welcome(どういたしまして)
            ・※ Do you mind ~? に Yes と答えると「気にする = 嫌だ」になるので注意
            """
        ),
        GrammarQuestion(
            id: "q426",
            question: "___ ___ ___ with this problem for hours.",
            choices: ["I've / been / struggling", "I / am / struggling", "I / struggled / been", "I've / struggled / been"],
            correctIndex: 0,
            translation: "「何時間もこの問題に悩んでいる」",
            explanation: """
            ・I've been struggling = 「ずっと苦戦している・悩んでいる」現在完了進行形
            ・過去から今までずっと続いている困難を強調
            ・「何時間も悩んでる」「ずっと苦しんでいる」
            ・"I've been struggling with English." / "She's been struggling at work."
            ・長期的な苦労や葛藤を伝える時に
            ・類義: I've been having trouble(困っている) / I've been wrestling with(格闘している・改まった)
            ・仕事、勉強、感情の問題などで頻出
            """
        ),
        GrammarQuestion(
            id: "q427",
            question: "He started exercising ___ ___ ___ ___ lose weight.",
            choices: ["as / a / way / to", "as / way / to", "for / a / way / to", "by / a / way / to"],
            correctIndex: 0,
            translation: "「彼は痩せる方法として運動を始めた」",
            explanation: """
            ・as a way to + 動詞原形 = 「〜する方法として・〜するために」
            ・目的や手段を表す
            ・「痩せるために運動を始めた」「ストレス解消の方法として読書をする」
            ・"As a way to relax." / "As a way to make money."
            ・何かをする目的・手段を説明する時に
            ・類義: in order to(〜するために・フォーマル) / as a means of ~ing(〜する手段として)
            ・具体的な手段を強調するニュアンス
            """
        ),
        GrammarQuestion(
            id: "q428",
            question: "___ ___ ___ ___ you had a great time!",
            choices: ["It / sounds / as / if", "It / sounds / like / it", "It / sounds / as / that", "It / sound / as / if"],
            correctIndex: 0,
            translation: "「楽しかったみたいだね!」",
            explanation: """
            ・It sounds as if + 文 = 「〜のように聞こえる・〜のようだ」
            ・相手の話から得た印象を伝える時に
            ・「楽しかったみたいだね」「疲れているみたいだね」
            ・"It sounds as if she's upset." / "It sounds as if you're tired."
            ・共感を込めて反応する時に最適
            ・It sounds like ~ も同じ意味で口語ではこちらが頻出
            ・類義: It sounds like(カジュアル) / It seems that(中立)
            """
        ),
        GrammarQuestion(
            id: "q429",
            question: "This deal sounds ___ ___ ___ be true.",
            choices: ["too / good / to", "so / good / to", "very / good / to", "too / good / for"],
            correctIndex: 0,
            translation: "「この話、うますぎて本当とは思えない」",
            explanation: """
            ・too good to be true = 「うますぎて本当とは思えない」慣用句
            ・too + 形容詞 + to + 動詞原形 = 「〜すぎて…できない」の構文
            ・詐欺やうますぎる話に対して警戒を示す時の鉄板表現
            ・"If it sounds too good to be true, it probably is."(諺)
            ・否定的な意味を含むので注意
            ・類義: sounds fishy(怪しい・口語) / seems suspicious(疑わしい)
            ・"too + 形 + to + V" は否定不要(× too good not to be true)
            """
        ),
        GrammarQuestion(
            id: "q430",
            question: "Let's ___ ___ ___ chat before the meeting.",
            choices: ["have / a / quick", "make / a / quick", "do / a / quick", "take / a / quick"],
            correctIndex: 0,
            translation: "「会議の前にちょっと話そう」",
            explanation: """
            ・have a quick + 名詞 = 「ちょっと〜する・手短に〜する」口語表現
            ・quick が「短時間で済む」ニュアンスを加える
            ・「ちょっと話そう」「軽く一杯」「サッと確認」
            ・"Let's have a quick lunch." / "Have a quick look."
            ・have は経験・行為を表す動詞として汎用的
            ・類義: have a brief / grab a quick(カジュアル)
            ・時間をかけずに何かをする時に便利
            """
        ),
        GrammarQuestion(
            id: "q431",
            question: "___ ___! How's it going?",
            choices: ["Hey / there", "Hi / there", "Hello / there", "すべて正解"],
            correctIndex: 3,
            translation: "「やあ!元気?」",
            explanation: """
            ・Hey there / Hi there / Hello there = いずれも親しみのカジュアルな挨拶
            ・there は特定の場所を指すのではなく、呼びかけの軽い添え物
            ・テキスト、SNS、友達への気軽な挨拶で多用
            ・Hey there(最もカジュアル) / Hi there(中立) / Hello there(やや丁寧)
            ・相手との距離を縮める効果
            ・類義: What's up?(最もカジュアル) / Howdy(米南部)
            ・"Well hello there!" = ちょっと驚き混じりの挨拶
            """
        ),
        GrammarQuestion(
            id: "q432",
            question: "Try doing the steps ___ ___.",
            choices: ["in / reverse", "on / reverse", "by / reverse", "at / reverse"],
            correctIndex: 0,
            translation: "「手順を逆にやってみて」",
            explanation: """
            ・in reverse = 「逆順に・逆方向に」順序や方向の逆転
            ・「手順を逆にやる」「車をバックする」
            ・"Do it in reverse." / "Put the car in reverse."
            ・比喩: life in reverse(人生を逆から)
            ・"in reverse order" = 逆順で
            ・類義: backwards(後ろ向きに) / in the opposite order(反対の順序で)
            ・シンプルで便利な前置詞句
            """
        ),
        GrammarQuestion(
            id: "q433",
            question: "___ ___ ___ ___, I feel completely happy.",
            choices: ["In / this / very / moment", "On / this / very / moment", "At / this / very / moment", "Both A and C"],
            correctIndex: 3,
            translation: "「まさに今この瞬間、完全に幸せだと感じる」",
            explanation: """
            ・at this very moment / in this very moment = 「まさに今この瞬間」強調
            ・very を加えることで「まさに・ちょうど」と瞬間を強調
            ・at の方が一般的、in も使われる
            ・"At this very moment, history is being made."
            ・現在の瞬間の特別さを強調する時に詩的・感情的に使う
            ・類義: right now(まさに今・口語) / at this very instant(まさにこの瞬間・フォーマル)
            ・スピーチやドラマで効果的な表現
            """
        ),
        GrammarQuestion(
            id: "q434",
            question: "I'll call you ___ ___ ___ I arrive.",
            choices: ["as / soon / as", "so / soon / as", "as / fast / as", "as / quick / as"],
            correctIndex: 0,
            translation: "「着いたらすぐ電話するね」",
            explanation: """
            ・as soon as + 主語 + 動詞 = 「〜するとすぐに・〜したらすぐ」接続詞
            ・動作の直後を強調
            ・「着いたらすぐ電話する」「分かり次第連絡する」
            ・時制注意: 未来のことでも as soon as の後は現在形(× as soon as I will arrive)
            ・"As soon as he comes, tell me." / "I'll do it as soon as possible."
            ・"as soon as possible (ASAP)" = できるだけ早く(超頻出)
            ・類義: the moment(〜した瞬間に) / immediately after(直後に・フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q435",
            question: "You can stay ___ ___ ___ you want.",
            choices: ["as / long / as", "so / long / as", "as / longer / as", "until / long / as"],
            correctIndex: 0,
            translation: "「君が望む限りいていいよ」",
            explanation: """
            ・as long as + 主語 + 動詞 = 2つの意味
            ・①「〜する限り」(条件) / ②「〜する間ずっと」(期間)
            ・「望む限りいていい」「君が来るなら行く」
            ・"As long as you're happy." / "Stay as long as you like."
            ・条件と期間の両方を表現できる便利な接続詞
            ・類義: provided that(〜という条件で・フォーマル) / so long as(同義)
            ・文脈で意味を判断する
            """
        ),
        GrammarQuestion(
            id: "q436",
            question: "___ ___ ___ I know, he's still in town.",
            choices: ["As / far / as", "So / far / as", "As / much / as", "As / long / as"],
            correctIndex: 0,
            translation: "「私が知る限り、彼はまだ町にいる」",
            explanation: """
            ・as far as + 主語 + 動詞 = 「〜する限りでは・〜の範囲では」情報や認識の限界
            ・「私が知る限り」「私が見る限り」断定を避けて控えめに意見を述べる
            ・"As far as I know" / "As far as I'm concerned" / "As far as I can tell"
            ・「私の知る限り」(自信を弱めて発言)
            ・類義: to my knowledge(フォーマル) / from what I can tell(私が判断する限り)
            ・「責任回避」の効果もある慎重な表現
            ・※ as far as ... is concerned = 〜に関する限りでは
            """
        ),
        GrammarQuestion(
            id: "q437",
            question: "He talked ___ ___ ___ for hours.",
            choices: ["on / and / on", "over / and / over", "and / and / on", "up / and / on"],
            correctIndex: 0,
            translation: "「彼は何時間も延々と話し続けた」",
            explanation: """
            ・on and on = 「延々と・続けて」慣用句
            ・動作や話が長く続くことを強調、しばしばうんざりするニュアンス
            ・"He went on and on about his job." / "It just keeps going on and on."
            ・go on and on(延々と続く) / talk on and on(延々と話す)で頻出
            ・類義: endlessly(延々と・フォーマル) / non-stop(止まらずに・口語)
            ・反復・退屈さを表すドラマチックな表現
            ・"over and over"(何度も繰り返し)とは別物
            """
        ),
        GrammarQuestion(
            id: "q438",
            question: "Let's settle this ___ ___ ___ ___.",
            choices: ["once / and / for / all", "one / and / for / all", "once / for / and / all", "once / and / to / all"],
            correctIndex: 0,
            translation: "「これをきっぱり決着させよう」",
            explanation: """
            ・once and for all = 「きっぱりと・最終的に」慣用句
            ・長引いていた問題を完全に解決するニュアンス
            ・「これで終わりにしよう」「決着をつけよう」
            ・"Let's end this once and for all."
            ・強い決意や最終決定を表す
            ・順序は固定で変えられない
            ・類義: definitively(決定的に・フォーマル) / for good(永久に・カジュアル)
            ・議論や争いに終止符を打つ時の定番
            """
        ),
        GrammarQuestion(
            id: "q439",
            question: "Please be ___ ___ for the meeting.",
            choices: ["on / time", "in / time", "at / time", "for / time"],
            correctIndex: 0,
            translation: "「会議には時間通りに来てください」",
            explanation: """
            ・on time = 「時間通りに・予定通りに」遅刻も早すぎもしない、ぴったりの時刻
            ・in time(間に合って)とは違うので注意
            ・on time(時刻に正確) vs in time(締切などに間に合う)
            ・"The train arrived on time." / "He's always on time."
            ・"in time for the meeting"(会議に間に合って) — 別の意味
            ・類義: punctual(時間厳守・フォーマル形容詞) / in time(間に合って・締切前)
            ・電車、会議、約束で「時間厳守」を表す時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q440",
            question: "___ hearing the news, she cried.",
            choices: ["Upon", "On", "At", "Both A and B"],
            correctIndex: 3,
            translation: "「ニュースを聞いた途端、彼女は泣いた」",
            explanation: """
            ・upon + 名詞/動名詞 = 「〜する時・〜するとすぐに」フォーマル寄り
            ・on と意味は同じだが、upon の方が改まった印象
            ・両方正解だが、upon は書き言葉、契約書、文学的表現で頻出
            ・"Upon arrival, please report to the front desk."
            ・"On hearing the news"(中立) / "Upon hearing the news"(やや改まった)
            ・類義: on ~ing(中立) / as soon as(口語)
            ・ある動作の直後の出来事を表す
            """
        ),
        GrammarQuestion(
            id: "q441",
            question: "We can't be in two places ___ ___ ___ ___.",
            choices: ["at / the / same / time", "on / the / same / time", "in / the / same / time", "for / the / same / time"],
            correctIndex: 0,
            translation: "「同時に二箇所にはいられない」",
            explanation: """
            ・at the same time = 「同時に・一方で」
            ・物理的な同時性と論理的な対比の両方に使える
            ・「同時に二箇所にはいられない」「一方で〜とも言える」
            ・"At the same time, we should consider ~"(議論で相反する意見を導入)
            ・"They arrived at the same time."(物理的同時)
            ・文頭で使うと「とはいえ」「同時に〜だが」のニュアンス
            ・類義: simultaneously(同時に・フォーマル) / meanwhile(一方で・つなぎ語)
            """
        ),
        GrammarQuestion(
            id: "q442",
            question: "___ ___ ___ eating pizza tonight.",
            choices: ["I / feel / like", "I / feel / for", "I / feel / to", "I'm / feeling / on"],
            correctIndex: 0,
            translation: "「今夜はピザが食べたい気分」",
            explanation: """
            ・I feel like + 名詞/動名詞 = 「〜したい気分・〜が食べたい」口語表現
            ・今の気分や欲求を表す時の定番
            ・「ピザが食べたい気分」「映画見たい気分」
            ・"I feel like coffee." / "I feel like going home."
            ・I feel like + 文(〜のような気がする)とは別の意味
            ・"I feel like I'm being watched." = 見られている気がする
            ・類義: I'm in the mood for(同義) / I want to(直接的)
            ・文脈で2つの意味を使い分ける
            """
        ),
        GrammarQuestion(
            id: "q443",
            question: "___ ___ work hard usually succeed.",
            choices: ["People / who", "People / which", "People / they", "People / what"],
            correctIndex: 0,
            translation: "「努力する人はたいてい成功する」",
            explanation: """
            ・people who + 動詞 = 「〜する人々」関係代名詞構文
            ・who は人を先行詞に取る関係代名詞
            ・「頑張る人」「成功する人」など、人物の特性を語る
            ・"People who travel learn more." / "People who care about quality."
            ・口語では who を that で代用することも多いが、人には who が標準
            ・類義: those who(やや改まった) / anyone who(〜する人なら誰でも)
            ・後ろから人を説明する基本構文
            """
        ),
        GrammarQuestion(
            id: "q444",
            question: "___ wins gets the prize.",
            choices: ["Whoever", "Whatever", "Whichever", "Wherever"],
            correctIndex: 0,
            translation: "「勝った人が賞をもらう」",
            explanation: """
            ・Whoever + 動詞 = 「〜する人は誰でも」複合関係代名詞
            ・不特定の人を指す
            ・「勝った人が賞をもらう」「来た人を歓迎する」
            ・"Whoever you are, ~" / "Whoever did this, ~"
            ・anyone who ~ と同じ意味だが、whoever は一語で簡潔
            ・譲歩の意味(誰が〜しても)でも使える
            ・類義: anyone who(〜する人は誰でも) / no matter who(誰が〜しても)
            ・whoever / whatever / whichever / wherever / whenever / however のセット
            """
        ),
        GrammarQuestion(
            id: "q445",
            question: "I bought ___ ___ ___ for $20.",
            choices: ["the / whole / lot", "the / all / lot", "the / whole / total", "all / the / lot"],
            correctIndex: 0,
            translation: "「全部20ドルで買った」",
            explanation: """
            ・the whole lot = 「全部・一括して」口語表現、英国英語で特に頻出
            ・まとめて全てというニュアンス
            ・「全部で20ドル」「全員で行く」
            ・"I'll take the whole lot." / "The whole lot of them came."
            ・ひとまとまりの量や数を強調
            ・類義: the whole thing(全部・中立) / all of it(その全て)
            ・人にも物にも使える便利な表現
            """
        ),
        GrammarQuestion(
            id: "q446",
            question: "___ ___ ___ ___ finish it tonight.",
            choices: ["I'm / gonna / try / to", "I / am / try / to", "I'm / going / try / to", "I / try / gonna / to"],
            correctIndex: 0,
            translation: "「今夜終わらせようと頑張る」",
            explanation: """
            ・I'm gonna try to + 動詞原形 = 「〜しようと頑張る・〜してみる」口語
            ・gonna = going to の話し言葉短縮形
            ・意志と努力を控えめに表現
            ・「今夜終わらせようと頑張る」「やってみる」
            ・"I'm gonna try to help." / "Gonna try my best."
            ・確約せずに試みを伝えるニュアンス
            ・書く時は I'm going to try to が正式
            ・類義: I'll try to(〜してみる) / I'll do my best to(全力で〜する)
            """
        ),
        GrammarQuestion(
            id: "q447",
            question: "I ___ ___ ___ ___ for your help.",
            choices: ["can't / thank / you / enough", "can / thank / you / enough", "can't / thanks / you / enough", "can't / thank / you / too"],
            correctIndex: 0,
            translation: "「あなたの助けにどんなに感謝してもしきれない」",
            explanation: """
            ・can't thank you enough = 「感謝してもしきれない」深い感謝の慣用句
            ・Thank you だけでは足りない感謝の気持ちを伝える時の最強表現
            ・"I really can't thank you enough." / "We can't thank you enough for everything."
            ・フォーマルでもカジュアルでも使えるが、心からの感謝を込めて
            ・類義: I really appreciate it(本当に感謝・フォーマル) / Thanks a million(本当にありがとう・カジュアル)
            ・大切な相手や恩人への感謝表明に最適
            """
        ),
        GrammarQuestion(
            id: "q448",
            question: "I'm ___ ___ ___ ___.",
            choices: ["in / my / late / twenties", "on / my / late / twenties", "at / my / late / twenties", "in / a / late / twenty"],
            correctIndex: 0,
            translation: "「私は20代後半だ」",
            explanation: """
            ・in my late twenties = 「20代後半」年齢表現
            ・early / mid / late で世代の前半・中盤・後半を表す
            ・early twenties(20代前半) / mid twenties(20代半ば) / late twenties(20代後半)
            ・thirties, forties など他の年代でも同じパターン
            ・"She's in her mid-thirties." / "He's in his early forties."
            ・具体的な年齢を言いたくない時に便利
            ・類義: late 20s(同じ・数字表記) / pushing 30(もうすぐ30歳・口語)
            ・年齢の十年単位は複数形 + s
            """
        ),
        GrammarQuestion(
            id: "q449",
            question: "Our vacation plans are still ___ ___ ___ ___.",
            choices: ["up / in / the / air", "on / in / the / air", "up / on / the / air", "up / for / the / air"],
            correctIndex: 0,
            translation: "「私たちの休暇の予定はまだ未定だ」",
            explanation: """
            ・up in the air = 「未定の・宙ぶらりんの」慣用句
            ・まだ決まっていない不確実な状態
            ・「予定がまだ未定」「決断保留中」
            ・"Plans are up in the air." / "Everything is still up in the air."
            ・決定が下せない、複数の要因が絡み合っている状況
            ・類義: undecided(未決定・フォーマル) / unsettled(未解決の)
            ・ビジネスや日常で「状況不明」を伝える時に便利
            """
        ),
        GrammarQuestion(
            id: "q450",
            question: "There was ___ ___ ___ people at the concert.",
            choices: ["a / mass / of", "the / mass / of", "a / many / of", "a / much / of"],
            correctIndex: 0,
            translation: "「コンサートには大勢の人がいた」",
            explanation: """
            ・a mass of + 名詞 = 「大量の・大勢の」
            ・大きな集まりや塊を表す
            ・「大勢の人」「大量の情報」
            ・"A mass of data." / "A mass of confusion."
            ・a lot of より「圧倒的な量」というドラマチックなニュアンス
            ・類義: a great deal of(多くの・不可算) / a huge crowd of(大群の・人)
            ・フォーマル寄りで、書き言葉やニュースで頻出
            ・masses of(口語) も同じ意味で使える
            """
        ),
        GrammarQuestion(
            id: "q451",
            question: "You ___ ___ ___ the weather.",
            choices: ["were / right / about", "were / right / on", "are / right / for", "were / correct / about"],
            correctIndex: 0,
            translation: "「天気についての君の予想は当たってた」",
            explanation: """
            ・be right about + 名詞 = 「〜について正しい・〜の予想が当たる」前置詞は about で固定
            ・「天気の予想が当たった」「彼について正しかった」
            ・"You were right about him." / "I was right about that."
            ・判断や予測が正しかったことを認める時に
            ・"You were right."(君が正しかった) — 認める場面で頻出
            ・類義: be correct about(フォーマル) / be spot on about(的確・カジュアル)
            ・素直に相手を認める表現
            """
        ),
        GrammarQuestion(
            id: "q452",
            question: "Add a ___ ___ sugar.",
            choices: ["spoonful / of", "spoon / of", "spoonful / for", "spoon / for"],
            correctIndex: 0,
            translation: "「砂糖をスプーン一杯入れて」",
            explanation: """
            ・a spoonful of + 名詞 = 「スプーン一杯の〜」量表現
            ・-ful = 「いっぱい分」を意味する接尾辞
            ・handful(一握り) / mouthful(一口) / cupful(一杯分) / armful(腕一杯分)
            ・"A handful of nuts." / "A mouthful of food."
            ・"A spoonful of sugar helps the medicine go down."(歌詞でも有名)
            ・レシピや料理の場面で頻出
            ・類義: a tablespoon of(大さじ一杯) / a teaspoon of(小さじ一杯)
            """
        ),
        GrammarQuestion(
            id: "q453",
            question: "I'm ___ ___ tired today.",
            choices: ["sort / of", "sort / for", "kind / for", "some / of"],
            correctIndex: 0,
            translation: "「今日はちょっと疲れてる」",
            explanation: """
            ・sort of = 「ちょっと・なんとなく」控えめな表現
            ・kind of と同じ意味で、断定を避けるクッション語
            ・「ちょっと疲れた」「なんとなく好き」
            ・"I sort of like it." / "It's sort of weird."
            ・口語では sorta /ˈsɔːrtə/ と発音されることも
            ・kind of(カインダ) と同様、ネイティブの会話で多用
            ・類義: kind of(同義) / a bit(少し・英国寄り)
            ・強い表現を和らげる役割
            """
        ),
        GrammarQuestion(
            id: "q454",
            question: "___ ___ ___ ___ ___, I haven't seen him in a while.",
            choices: ["Come / to / think / of / it", "Coming / to / think / of / it", "Come / for / think / of / it", "Come / to / thinking / of / it"],
            correctIndex: 0,
            translation: "「そういえば、しばらく彼に会っていない」",
            explanation: """
            ・come to think of it = 「そういえば・考えてみると」慣用句
            ・会話の途中で何かを思い出した時に使う
            ・「そう言われてみれば」など、ふと気づいたことを切り出す定番
            ・文頭で使うことが多く、思考の方向転換を示す
            ・"Come to think of it, I never asked her name."
            ・類義: now that you mention it(言われてみれば) / speaking of which(そう言えば)
            ・口語で会話を自然に展開するときの便利な表現
            ・固定表現で語順は変えない
            """
        ),
        GrammarQuestion(
            id: "q455",
            question: "___ ___ is your daughter?",
            choices: ["How / old", "What / old", "How / age", "What / age"],
            correctIndex: 0,
            translation: "「娘さんは何歳ですか?」",
            explanation: """
            ・How old + be動詞 + 主語? = 「〜は何歳?」年齢を尋ねる基本疑問
            ・直訳「どれくらい古い?」だが、年齢の質問として定着
            ・物の年代を聞く時にも使える(建物が築何年か等)
            ・返事: "She's five (years old)." / "About 30."
            ・"How old is this house?" / "How old were you then?"
            ・類義: What age(やや改まった) / How many years old(冗長)
            ・※ What's your age? は失礼に響くことがあるので注意
            """
        ),
        GrammarQuestion(
            id: "q456",
            question: "___ ___ is the building?",
            choices: ["How / tall", "What / tall", "How / height", "How / high"],
            correctIndex: 0,
            translation: "「その建物はどれくらい高い?」",
            explanation: """
            ・How tall + be動詞 + 主語? = 「〜はどれくらい背が高い?」
            ・tall は縦に伸びた物体(人、建物、木)に使う
            ・how high(どれくらい高い位置・標高)とは違う
            ・mountains は high、人や建物は tall を使い分け
            ・返事: "It's 100 meters tall." / "He's six feet tall."
            ・"How tall are you?" / "How tall is the tower?"
            ・類義: how high(高さ・位置) / what's the height of(フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q457",
            question: "___ ___ ___ get there without a car?",
            choices: ["How / will / you", "What / will / you", "Why / will / you", "How / you / will"],
            correctIndex: 0,
            translation: "「車なしでどうやってそこに行くの?」",
            explanation: """
            ・How will you + 動詞原形? = 「どうやって〜するつもり?」方法・手段の未来疑問
            ・how(方法) + will you(未来の意思)
            ・「車なしでどう行く?」「どう乗り切るつもり?」
            ・"How will you handle this?" / "How will you manage?"
            ・挑戦的・心配のニュアンスを含むことも
            ・類義: How do you plan to(具体的計画) / How are you going to(同義)
            ・相手の戦略を尋ねる時の表現
            """
        ),
        GrammarQuestion(
            id: "q458",
            question: "___ ___ ___ fire, use the stairs.",
            choices: ["In / case / of", "On / case / of", "At / case / of", "For / case / of"],
            correctIndex: 0,
            translation: "「火災の場合は階段を使ってください」",
            explanation: """
            ・in case of + 名詞 = 「〜の場合には・〜の際は」
            ・緊急時の指示や注意書きで頻出
            ・「火災の場合」「緊急事態」など起こり得る状況への対応
            ・"In case of emergency, call 911." / "In case of rain, stay inside."
            ・in case + 文(〜の場合に備えて)とは少し違う
            ・"Take an umbrella in case it rains."(備え・節)
            ・"In case of rain, ..."(状況・名詞)
            ・類義: in the event of(フォーマル) / should there be(もし〜があれば・フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q459",
            question: "I'll wait ___ you come back.",
            choices: ["until", "by", "for", "on"],
            correctIndex: 0,
            translation: "「君が戻るまで待つよ」",
            explanation: """
            ・until + 主語 + 動詞 = 「〜するまで(ずっと)」接続詞・前置詞
            ・動作や状態の継続を表す
            ・「君が戻るまで待つ」「終わるまで頑張る」
            ・by(〜までに・期限)とは違うので注意
            ・until = 継続 / by = 期限
            ・"Wait until tomorrow."(継続) vs "Finish by tomorrow."(期限)
            ・"Until further notice." = 追って通知あるまで
            ・類義: till(カジュアル・同義) / up to(〜まで・時間・量)
            """
        ),
        GrammarQuestion(
            id: "q460",
            question: "We met ___ ___ ___ ___ the year.",
            choices: ["at / the / end / of", "in / the / end / of", "on / the / end / of", "by / the / end / of"],
            correctIndex: 0,
            translation: "「私たちは年末に出会った」",
            explanation: """
            ・at the end of + 名詞 = 「〜の終わりに・〜の末に」特定の時間・場所の終点
            ・「年末に」「映画の終わりに」「通りの突き当たりに」
            ・前置詞は at(地点・終点)
            ・"At the end of the day."(一日の終わりに・比喩で「結局のところ」)
            ・"At the end of the street." / "At the end of the chapter."
            ・in the end(最終的に・結論)と混同しやすいが、at the end of は具体的な終わりを指す
            ・類義: by the end of(〜の終わりまでに・期限) / toward the end of(〜の終わり頃に)
            """
        ),
        GrammarQuestion(
            id: "q461",
            question: "___ ___ ___, we decided to stay home.",
            choices: ["In / the / end", "At / the / end", "On / the / end", "By / the / end"],
            correctIndex: 0,
            translation: "「結局のところ、私たちは家にいることに決めた」",
            explanation: """
            ・In the end = 「最終的に・結局のところ」慣用句
            ・長い議論や試行錯誤の末の結論を表す
            ・「いろいろあったけど結局家にいた」「最後にはみんな納得した」
            ・at the end of ~(具体的な終点)と違い、in the end は結末・結論を強調
            ・"In the end, it all worked out." / "In the end, what matters is family."
            ・文頭で使うことが多い
            ・類義: eventually(最終的に・フォーマル) / finally(ついに・待ち望んだ結果)
            ・物語の締めくくりや人生の教訓を伝える時に
            """
        ),
        GrammarQuestion(
            id: "q462",
            question: "We ___ ___ ___ at a fancy restaurant.",
            choices: ["ended / up / eating", "ended / up / to / eat", "end / up / ate", "ended / on / eating"],
            correctIndex: 0,
            translation: "「私たちは結局高級レストランで食事することになった」",
            explanation: """
            ・end up + V-ing = 「結局〜することになる」
            ・予想外の結果や意図しなかった結末を表す
            ・「結局高級レストランで食べた」「結局買ってしまった」
            ・動詞は必ず -ing 形に
            ・"We ended up staying late." / "I ended up buying it."
            ・end up + 形容詞/場所 の形も: end up tired(結局疲れる) / end up at home(結局家にいる)
            ・類義: wind up + ~ing(同義) / eventually + V(最終的に〜する)
            ・口語で頻出の重要表現
            """
        ),
        GrammarQuestion(
            id: "q463",
            question: "This phone was ___ ___ ___.",
            choices: ["a / good / deal", "a / good / sale", "the / good / deal", "a / better / deal"],
            correctIndex: 0,
            translation: "「このスマホはいい買い物だった」",
            explanation: """
            ・a good deal = 「お買い得・いい取引」価格に対して価値が高い
            ・「いい買い物だった」「お得な取引」
            ・"What a good deal!" / "Got a great deal on it."
            ・a great deal(すごくお得) はさらに強調
            ・a good deal of + 名詞(かなりの量の〜)は別の意味(量を表す)なので注意
            ・"a good deal of money" = かなりのお金(量)
            ・類義: a great deal(非常にお得) / a steal(めっちゃ安い・口語)
            ・ショッピングやビジネスで頻出
            """
        ),
        GrammarQuestion(
            id: "q464",
            question: "I was completely ___ when I heard the news.",
            choices: ["speechless", "speakless", "wordless", "silentless"],
            correctIndex: 0,
            translation: "「そのニュースを聞いた時、完全に言葉を失った」",
            explanation: """
            ・speechless = 「言葉を失った・絶句した」形容詞
            ・強い感情で言葉が出ない状態を表す
            ・speech + less(スピーチがない)で構成
            ・驚き、感動、ショック、怒りなどで何も言えなくなる状況
            ・「ニュースを聞いて絶句した」「彼の優しさに言葉を失った」
            ・"I'm speechless!" / "Left me speechless."
            ・ポジティブにもネガティブにも使える
            ・類義: at a loss for words(言葉に詰まる) / stunned(衝撃で呆然)
            ・※ speakless / wordless / silentless は誤り(正しい単語ではない)
            """
        ),
        GrammarQuestion(
            id: "q465",
            question: "I'm ___ ___ the store. Need anything?",
            choices: ["off / to", "out / to", "on / to", "off / for"],
            correctIndex: 0,
            translation: "「お店に行ってくるよ。何か必要?」",
            explanation: """
            ・be off to + 場所 = 「〜へ出発する・〜へ向かう」口語表現
            ・今まさに出かけるニュアンス
            ・「店に行ってくる」「学校に向かう」
            ・"I'm off to work." / "Off to the gym!"
            ・文末で: "I'm off!" = 行ってきます!
            ・"気軽な出発" を表す英語らしい言い回し
            ・類義: heading to(同義) / leaving for(フォーマル)
            ・"Off you go!" = さあ行って!(送り出し)
            """
        ),
        GrammarQuestion(
            id: "q466",
            question: "You ___ ___ ___ bring an umbrella today.",
            choices: ["may / need / to", "may / need / for", "may / needing / to", "might / need / for"],
            correctIndex: 0,
            translation: "「今日は傘を持っていく必要があるかもしれない」",
            explanation: """
            ・may need to + 動詞原形 = 「〜する必要があるかもしれない」
            ・可能性 + 必要性を組み合わせた表現
            ・may(〜かも) + need to(〜する必要がある)で柔らかい忠告
            ・「傘が必要かも」「準備しといた方がいいかも」
            ・"You may need to wait." / "We may need to change plans."
            ・類義: might need to(より控えめ) / should probably(より直接的)
            ・断定を避けた優しい助言
            """
        ),
        GrammarQuestion(
            id: "q467",
            question: "I ___ come to the party — I'm not sure yet.",
            choices: ["might", "must", "should", "can"],
            correctIndex: 0,
            translation: "「パーティーに行くかもしれない、まだ分からない」",
            explanation: """
            ・might + 動詞原形 = 「〜かもしれない」控えめな可能性
            ・may よりも可能性が低めで、不確実性を強調
            ・「行くかもしれない」「ダメかもしれない」
            ・"I might call you later." / "She might know the answer."
            ・会話では may より頻出
            ・might have + 過去分詞 = 「〜したかも」(過去の推量)
            ・類義: may(やや確信度が高い) / could(中立)
            ・"I'm not sure" との相性が良い
            """
        ),
        GrammarQuestion(
            id: "q468",
            question: "I ___ ___ come, but I was sick.",
            choices: ["would / have", "will / have", "would / had", "had / would"],
            correctIndex: 0,
            translation: "「行こうと思ったのに、病気だった」",
            explanation: """
            ・would have + 過去分詞 = 「〜したのに(しなかった)」仮定法過去完了
            ・過去の事実に反する仮定や後悔を表す
            ・「行ったのに(実際は行けなかった)」「電話したのに(しなかった)」
            ・会話では would've /ˈwʊdəv/ と短縮
            ・"I would have helped." / "She would have come."
            ・類義: could have + 過去分詞(〜できたのに) / should have + 過去分詞(〜すべきだった)
            ・実現しなかった過去を語る時の重要構文
            """
        ),
        GrammarQuestion(
            id: "q469",
            question: "___ ___ like some coffee?",
            choices: ["Would / you", "Will / you", "Do / you", "Could / you"],
            correctIndex: 0,
            translation: "「コーヒーはいかがですか?」",
            explanation: """
            ・Would you like + 名詞? = 「〜はいかがですか?」丁寧な提案・申し出
            ・Do you want ~?(欲しい?)より丁寧、レストランや接客で頻出
            ・「コーヒーいかが?」「お代わりいかが?」
            ・Would you like to + 動詞?(〜したい?)も同じパターン
            ・"Would you like a drink?" / "Would you like to sit down?"
            ・類義: Would you care for(より改まった) / Do you want(カジュアル)
            ・相手を思いやる丁寧な表現
            """
        ),
        GrammarQuestion(
            id: "q470",
            question: "___ ___ help me with this?",
            choices: ["Will / you", "Are / you", "Would / you", "Do / you"],
            correctIndex: 0,
            translation: "「これ手伝ってくれる?」",
            explanation: """
            ・Will you + 動詞原形? = 「〜してくれる?」依頼または未来の意思
            ・Would you? より直接的でカジュアル
            ・「手伝ってくれる?」「明日来る?」
            ・命令形に近いニュアンスもある
            ・目上の人や知らない人には Would you? の方が無難
            ・親しい間柄では Will you? で十分
            ・類義: Can you(同じく依頼) / Could you(より丁寧)
            ・"Will you marry me?" のようなプロポーズの定番でもある
            """
        ),
        GrammarQuestion(
            id: "q471",
            question: "___ ___ have a seat?",
            choices: ["Won't / you", "Will / you", "Do / you", "Aren't / you"],
            correctIndex: 0,
            translation: "「お座りになりませんか?」",
            explanation: """
            ・Won't you + 動詞原形? = 「〜しませんか?」丁寧な勧め
            ・直訳「〜しないの?」ではなく、相手を温かく誘うニュアンス
            ・「お座りになりませんか?」「一緒に来ませんか?」
            ・おもてなしや誘いで使う、やや古風で改まった印象
            ・"Won't you join us?" / "Won't you come in?"
            ・上品な接客や歓迎の場面で頻出
            ・類義: Why don't you(提案) / Please(最もシンプル)
            """
        ),
        GrammarQuestion(
            id: "q472",
            question: "___ ___ tell anyone, I promise.",
            choices: ["I / won't", "I'm / not", "I / can't", "I / don't"],
            correctIndex: 0,
            translation: "「誰にも言わないと約束する」",
            explanation: """
            ・I won't + 動詞原形 = 「〜しない・〜するつもりはない」
            ・will not の短縮形、意志の否定や約束
            ・「誰にも言わない」「諦めない」
            ・"I won't forget." / "I won't let you down."
            ・物に対して: "The door won't open."(動かない・作動しない)
            ・I won't は会話で頻出、書き言葉では I will not の方が丁寧
            ・類義: I will not(強調・フォーマル) / I refuse to(強い拒否)
            """
        ),
        GrammarQuestion(
            id: "q473",
            question: "___ ___ ___ speak three languages.",
            choices: ["I / am / able / to", "I / can / able / to", "I / am / able / for", "I / will / able / to"],
            correctIndex: 0,
            translation: "「私は3か国語を話すことができる」",
            explanation: """
            ・be able to + 動詞原形 = 「〜できる」can とほぼ同じ意味
            ・現在・未来・過去すべての時制で使える柔軟さ(can には未来形がない)
            ・「3か国語話せる」「仕事を完了できる」
            ・"will be able to" / "was able to" / "have been able to"
            ・フォーマル寄りで、書き言葉や改まった場面で頻出
            ・類義: can(カジュアル・同義) / be capable of ~ing(フォーマル)
            ・"I was able to finish it."(過去にできた) は I could finish よりも明確
            """
        ),
        GrammarQuestion(
            id: "q474",
            question: "___ ___ find my keys this morning.",
            choices: ["I / couldn't", "I / can't", "I / didn't / can", "I / haven't"],
            correctIndex: 0,
            translation: "「今朝、鍵が見つからなかった」",
            explanation: """
            ・I couldn't + 動詞原形 = 「〜できなかった」could not の短縮形
            ・過去にできなかったことを表す
            ・「鍵が見つからなかった」「眠れなかった」
            ・"I couldn't sleep last night." / "We couldn't agree."
            ・"I couldn't agree more." = 強く同意します(決まり文句)
            ・仮定法では「〜できないだろう」の意味にもなる
            ・類義: I wasn't able to(フォーマル) / I failed to(強い失敗感)
            """
        ),
        GrammarQuestion(
            id: "q475",
            question: "I ___ ___ he'll come tomorrow.",
            choices: ["wonder / if", "wonder / that", "wondered / for", "wonder / about"],
            correctIndex: 0,
            translation: "「彼が明日来るかな」",
            explanation: """
            ・I wonder if + 文 = 「〜かしら・〜だろうか」控えめな疑問
            ・心の中で考えていることを表す
            ・「明日来るかな」「正しいかな」
            ・I wonder + wh-節 も可: I wonder why ~ / I wonder what ~
            ・"I was wondering if you could ~" = 〜してもらえないかな(丁寧な依頼)
            ・"I wonder if it's true." / "I wonder why she's late."
            ・類義: I'm not sure if(〜か分からない) / I'm curious about(気になる)
            ・丁寧に質問する時の鉄板
            """
        ),
        GrammarQuestion(
            id: "q476",
            question: "The cafe is ___ the bank and the post office.",
            choices: ["between", "among", "middle", "center"],
            correctIndex: 0,
            translation: "「カフェは銀行と郵便局の間にある」",
            explanation: """
            ・between A and B = 「AとBの間に」前置詞
            ・2つの物・人・場所の間を指す
            ・「銀行と郵便局の間」「君と私の間で」
            ・3つ以上の中だと among(〜の中で)が正式だが、口語では between でもOK
            ・"between us" = ここだけの話
            ・"between you and me" = 内緒の話
            ・類義: in the middle of(真ん中で) / among(3つ以上の中で)
            ・"between a rock and a hard place" = 板挟み(慣用句)
            """
        ),
        GrammarQuestion(
            id: "q477",
            question: "He finally arrived. ___ ___ ___ ___!",
            choices: ["Better / late / than / never", "Better / lately / than / never", "Late / better / than / never", "Better / late / for / never"],
            correctIndex: 0,
            translation: "「彼がやっと到着した。遅くてもしないよりまし!」",
            explanation: """
            ・Better late than never = 「遅くてもしないよりまし」諺
            ・遅れた行動を肯定する時の慰めや励まし
            ・「遅くなったけど来てくれただけありがたい」
            ・「諦めるよりは遅くてもやろう」
            ・新しいことを始めるのに遅すぎることはない、という前向きなメッセージ
            ・日常会話、教訓、自己啓発で頻出
            ・類義: at least you came(来てくれただけまし) / it's never too late(遅すぎることはない)
            ・固定表現で語順は変えない
            """
        ),
        GrammarQuestion(
            id: "q478",
            question: "The taxi is waiting ___ ___.",
            choices: ["right / outside", "just / outside", "right / on", "Both A and B"],
            correctIndex: 3,
            translation: "「タクシーがすぐ外で待っているよ」",
            explanation: """
            ・right outside = 「すぐ外に・真ん前に」right が「すぐ・まさに」と位置を強調
            ・just outside も同じ意味で交換可能
            ・「タクシーがすぐ外で待ってる」「ドアのすぐ前」
            ・距離の近さを伝える時に
            ・"Right outside the door." / "Just outside the building."
            ・同パターン: right here(まさにここ) / right there(まさにそこ) / right next to(すぐ隣)
            ・類義: right by(すぐそばに)
            ・両方の選択肢が正解(right と just はどちらも強調)
            """
        ),
        GrammarQuestion(
            id: "q479",
            question: "You ___ ___ more water every day.",
            choices: ["should / drink", "should / to / drink", "should / drinking", "shoulds / drink"],
            correctIndex: 0,
            translation: "「毎日もっと水を飲むべきだ」",
            explanation: """
            ・should + 動詞原形 = 「〜すべき・〜した方がいい」忠告・推奨
            ・must(〜しなければならない)より柔らかく、強制力が弱い
            ・「水を飲むべき」「もっと寝た方がいい」
            ・助動詞の後は必ず動詞の原形(to は不要)
            ・"You should rest." / "We should leave now."
            ・類義: ought to(やや古風・フォーマル) / had better(警告的)
            ・相手のためのアドバイスで頻出
            """
        ),
        GrammarQuestion(
            id: "q480",
            question: "You ___ ___ told me earlier!",
            choices: ["could / have", "could / had", "would / had", "can / have"],
            correctIndex: 0,
            translation: "「もっと早く教えてくれてもよかったのに!」",
            explanation: """
            ・could have + 過去分詞 = 「〜できたのに(しなかった)」仮定法過去完了
            ・過去にできたが実際はしなかったことへの非難や後悔
            ・「もっと早く言えたじゃない」「電話できたのに」
            ・会話では could've /ˈkʊdəv/ と短縮
            ・"You could have called." / "I could have helped."
            ・類義: could've(短縮形) / might have(〜したかも・推量)
            ・should have(〜すべきだった)と並んで頻出
            """
        ),
        GrammarQuestion(
            id: "q481",
            question: "I ___ ___ studied harder for the test.",
            choices: ["should / have", "should / had", "should / would", "had / should"],
            correctIndex: 0,
            translation: "「テストのためにもっと勉強すべきだった」",
            explanation: """
            ・should have + 過去分詞 = 「〜すべきだった(のにしなかった)」後悔・反省
            ・過去の行動に対する「ああすればよかった」
            ・「もっと勉強すべきだった」「早く起きるべきだった」
            ・会話では should've /ˈʃʊdəv/ と短縮
            ・"I should have called you." / "She should have stayed."
            ・自分への後悔にも他人への非難にも使える
            ・類義: should've(口語) / ought to have(フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q482",
            question: "___ ___ ___ ___ some tea?",
            choices: ["Would / you / care / for", "Would / you / care / about", "Will / you / care / for", "Could / you / care / for"],
            correctIndex: 0,
            translation: "「お茶はいかがですか?」",
            explanation: """
            ・Would you care for + 名詞? = 「〜はいかがですか?」最も丁寧な提案
            ・Would you like ~? より改まった印象
            ・上品なレストランやおもてなしの場で頻出
            ・「お茶はいかが?」「デザートをご用意しますか?」
            ・"Would you care for a drink?" / "Care for a snack?"
            ・接客やフォーマルな場で使うと品が出る
            ・類義: Would you like(中立) / May I offer you(最高に丁寧)
            ・※ care about = 〜を気にかける(別意味)
            """
        ),
        GrammarQuestion(
            id: "q483",
            question: "___ ___ ___ lie to my parents.",
            choices: ["I / refuse / to", "I / refuse / for", "I'm / refuse / to", "I / refused / for"],
            correctIndex: 0,
            translation: "「両親に嘘をつくことを拒否する」",
            explanation: """
            ・I refuse to + 動詞原形 = 「〜することを拒否する」強い拒絶
            ・I won't ~ よりも強く、断固として〜しないという決意
            ・「親に嘘はつかない」「諦めない」
            ・"I refuse to give up." / "He refused to answer."
            ・信念や原則に基づく拒否を伝える時に
            ・後ろは必ず動詞の原形
            ・類義: I won't(中立) / I have no intention of ~ing(フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q484",
            question: "___ ___ ___ finish the project on time.",
            choices: ["I / failed / to", "I / fail / to", "I'm / failed / to", "I / failed / for"],
            correctIndex: 0,
            translation: "「期限内にプロジェクトを終わらせることができなかった」",
            explanation: """
            ・I failed to + 動詞原形 = 「〜できなかった・〜することに失敗した」
            ・I couldn't ~ よりも失敗の重みや責任感を強調
            ・「期限内に終えられなかった」「約束を守れなかった」
            ・"He failed to deliver." / "We failed to notice."
            ・フォーマル寄りで、ビジネスや報告書で頻出
            ・※ 試験の不合格 fail the test は別の用法(他動詞)
            ・類義: I wasn't able to(中立) / I couldn't manage to(やや砕けた)
            """
        ),
        GrammarQuestion(
            id: "q485",
            question: "I ___ ___ ___ attend the meeting yesterday.",
            choices: ["wasn't / able / to", "wasn't / able / for", "didn't / able / to", "couldn't / able / to"],
            correctIndex: 0,
            translation: "「昨日は会議に出席できなかった」",
            explanation: """
            ・wasn't able to + 動詞原形 = 「〜できなかった」couldn't のフォーマル版
            ・過去にできなかった具体的な出来事を表す
            ・「会議に出られなかった」「電話できなかった」
            ・"I wasn't able to come." / "She wasn't able to finish."
            ・couldn't よりも一回限りの過去の不可能を明確にする時に好まれる
            ・書き言葉や報告書で頻出
            ・類義: couldn't(口語) / failed to(失敗感が強い)
            """
        ),
        GrammarQuestion(
            id: "q486",
            question: "It's ___ ___ ___ to start learning.",
            choices: ["never / too / late", "not / too / late", "never / late / too", "never / so / late"],
            correctIndex: 0,
            translation: "「学び始めるのに遅すぎることはない」",
            explanation: """
            ・It's never too late to + 動詞原形 = 「〜するのに遅すぎることはない」前向きな励まし
            ・年齢、タイミング、機会などを言い訳にしている人を励ます時に
            ・「学び始めるのに遅すぎることはない」「夢を諦めるな」
            ・"It's never too late to change." / "Never too late to start over."
            ・自己啓発や応援メッセージで頻出
            ・順序は固定
            ・類義: better late than never(遅くてもしないよりまし) / the time is now(強い励まし)
            """
        ),
        GrammarQuestion(
            id: "q487",
            question: "___ ___, we tried our best.",
            choices: ["At / least", "On / least", "In / least", "For / least"],
            correctIndex: 0,
            translation: "「少なくとも、私たちは最善を尽くした」",
            explanation: """
            ・At least = 「少なくとも・せめて」最低限の評価や慰め
            ・「最善は尽くした」「せめて来てくれた」
            ・"At least try." / "At least it didn't rain."
            ・ネガティブな状況でもポジティブな面を見つける時に
            ・数値にも: at least 10 people(少なくとも10人)
            ・文頭でも文中でも使える
            ・類義: at the very least(最低でも・強調) / at any rate(とにかく・フォーマル)
            """
        ),
        GrammarQuestion(
            id: "q488",
            question: "The store is ___ ___ the station.",
            choices: ["right / by", "right / on", "right / at", "right / for"],
            correctIndex: 0,
            translation: "「その店は駅のすぐそばにある」",
            explanation: """
            ・right by + 場所 = 「〜のすぐそばに」
            ・right が「まさに・ちょうど」と強調、by が「〜のそばに」
            ・「駅のすぐ横」「家のすぐ近く」
            ・"Right by the door." / "It's right by my house."
            ・距離の近さを伝える時に
            ・類義: right next to(すぐ隣・同義) / just by(すぐそばに)
            ・近接を表す重要な前置詞句
            """
        ),
        GrammarQuestion(
            id: "q489",
            question: "___, he agreed to help us.",
            choices: ["Eventually", "Sudden", "Immediately", "Currently"],
            correctIndex: 0,
            translation: "「最終的に、彼は私たちを手伝うことに同意した」",
            explanation: """
            ・Eventually = 「最終的に・結局」副詞
            ・長い時間や過程を経た末の結果を表す
            ・「時間はかかったが、結局〜」というニュアンス
            ・「やっと同意してくれた」「最終的にうまくいった」
            ・"Eventually, things worked out." / "He'll eventually understand."
            ・finally(待ち望んだ結果)と似ているが、eventually は時間の経過と必然性を強調
            ・類義: finally(待望感) / in the end(結局・カジュアル)
            ・文頭、文中で使う
            """
        ),
        GrammarQuestion(
            id: "q490",
            question: "The park is ___ the street from my house.",
            choices: ["across", "cross", "over", "through"],
            correctIndex: 0,
            translation: "「公園は私の家の通りの向かい側にある」",
            explanation: """
            ・across + 場所 = 「〜を横切って・〜の向こう側に」前置詞
            ・横断する動きまたは反対側の位置
            ・「通りの向かい側」「川を渡って」
            ・"across from ~" = 〜の向かい側(よく使うパターン)
            ・"Walk across the street." / "The bakery is across the street."
            ・動詞 cross(横切る)の前置詞版
            ・through(〜を通って・貫通)とは違うので注意
            ・類義: on the other side of(向こう側) / opposite(反対側)
            """
        ),
        GrammarQuestion(
            id: "q491",
            question: "The cafe is ___ the bank.",
            choices: ["opposite", "across", "front", "over"],
            correctIndex: 0,
            translation: "「カフェは銀行の向かい側にある」",
            explanation: """
            ・opposite + 名詞 = 「〜の向かい側に・〜の正反対に」
            ・正面で向かい合う位置関係
            ・「銀行の向かい」「彼女の正面に座る」
            ・"Sit opposite me." / "The hotel is opposite the park."
            ・across from ~ と同じ意味だが、opposite の方が完全に正対しているニュアンス
            ・形容詞・名詞・前置詞として使える多機能語
            ・"the opposite direction" = 反対方向
            ・類義: across from(米国寄り) / facing(動詞・分詞)
            """
        ),
        GrammarQuestion(
            id: "q492",
            question: "You're holding the map ___ ___.",
            choices: ["upside / down", "up / downside", "downside / up", "down / side / up"],
            correctIndex: 0,
            translation: "「地図を逆さまに持ってるよ」",
            explanation: """
            ・upside down = 「上下逆さま・逆さに」慣用句
            ・上下が反転している状態
            ・「地図を逆さに持ってる」「写真が逆さま」
            ・"The picture is upside down." / "Hang it upside down."
            ・比喩: "turn my life upside down" = 人生がひっくり返る(大きな変化や混乱)
            ・順序は固定で down upside とは言わない
            ・類義: inverted(逆さの・フォーマル) / inside out(裏返しに・向きが違う)
            """
        )
    ]
}
