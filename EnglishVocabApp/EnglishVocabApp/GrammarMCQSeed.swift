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
        )
    ]
}
