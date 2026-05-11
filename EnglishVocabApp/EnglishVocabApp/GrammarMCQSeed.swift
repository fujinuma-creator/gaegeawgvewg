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
        )
    ]
}
