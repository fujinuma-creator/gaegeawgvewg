import Foundation

/// One grammar lesson topic. The static `title` and `explanation` ship
/// with the app so users have content to read even before any AI
/// generation runs.
struct GrammarTopic: Hashable, Identifiable {
    let id: String
    let title: String
    let summary: String
    let explanation: String
}

enum GrammarTopicSeed {
    static let topics: [GrammarTopic] = [
        GrammarTopic(
            id: "nouns",
            title: "名詞",
            summary: "Nouns",
            explanation: """
            名詞は人・物・場所・概念を表す語。可算名詞と不可算名詞に分かれます。

            ・可算名詞: 単数は a/an を付け、複数は語尾に -s/-es (a book / books)
            ・不可算名詞: 液体・気体・抽象概念・物質 (water, information, advice)。a/an・複数形は不可
            ・集合名詞: family, team。単数扱いと複数扱いの両方あり
            ・固有名詞: 人名・地名は大文字始まり (Tokyo, Mike)
            ・抽象名詞: love, happiness は通常不可算
            ・much / a lot of は不可算名詞、many / a few は可算名詞と組む
            """
        ),
        GrammarTopic(
            id: "verbs",
            title: "動詞",
            summary: "Verbs",
            explanation: """
            動詞は動作・状態を表す中核要素。be動詞・一般動詞・助動詞に大別されます。

            ・3単現の s: He works (主語が3人称単数・現在形) / I work, They work
            ・規則動詞: 過去・過去分詞は -ed (walk → walked)
            ・不規則動詞: go-went-gone, see-saw-seen など暗記必須
            ・他動詞は目的語を取る (I made it)、自動詞は取らない (I slept)
            ・状態動詞 (know, love, belong) は通常進行形にしない
            ・句動詞: 動詞+前置詞/副詞 (look up, give up) で意味が変わる
            """
        ),
        GrammarTopic(
            id: "adjectives",
            title: "形容詞",
            summary: "Adjectives",
            explanation: """
            形容詞は名詞や代名詞を修飾します。位置と語順に注意。

            ・限定用法: 名詞の前 (a beautiful flower)
            ・叙述用法: be動詞などの後 (She is happy)
            ・語順: 意見 → サイズ → 年齢 → 形 → 色 → 国籍 → 素材 (a beautiful small old round red Japanese wooden box)
            ・分詞形容詞: -ing は能動 (an exciting game)、-ed は受動 (an excited fan)
            ・the + 形容詞: 「〜な人々」(the rich, the young)
            ・比較変化を持つ形容詞は比較・最上級も学ぶ
            """
        ),
        GrammarTopic(
            id: "adverbs",
            title: "副詞",
            summary: "Adverbs",
            explanation: """
            副詞は動詞・形容詞・他の副詞・文全体を修飾します。

            ・形容詞 + ly で副詞化 (slow → slowly)、ただし fast/hard/late はそのまま副詞
            ・頻度副詞 (always/usually/often/sometimes/never): be動詞の後、一般動詞の前
            ・程度副詞 (very/quite/rather/extremely): 形容詞・副詞の前
            ・場所・時の副詞は文末が基本
            ・文修飾副詞 (honestly, fortunately): 文頭でカンマ区切り
            ・hardly / scarcely / rarely は否定の意味を含む
            """
        ),
        GrammarTopic(
            id: "sentencePatterns",
            title: "文型",
            summary: "Sentence Patterns",
            explanation: """
            英語の基本5文型 (S=主語 V=動詞 O=目的語 C=補語)。

            ・第1文型 SV: I sleep.
            ・第2文型 SVC: She is a doctor. / He looks tired. (S=Cの関係)
            ・第3文型 SVO: I read books.
            ・第4文型 SVOO: I gave him a book. (人 + 物の語順)
            ・第5文型 SVOC: We call him Tom. / I found it interesting. (O=Cの関係)
            ・SVOO は前置詞句に書き換え可: I gave a book to him.
            """
        ),
        GrammarTopic(
            id: "tense",
            title: "時制",
            summary: "Tenses",
            explanation: """
            英語の時制は「時+相」の組合せ。基本12種類。

            ・現在形: 習慣・一般的真理 (I work in Tokyo / Water boils at 100°C)
            ・過去形: 過去の一回的事実 (I went there yesterday)
            ・未来形: will / be going to (will=その場の決定、be going to=既定の予定)
            ・進行形 be + -ing: その瞬間の進行中の動作 (I am working)
            ・過去進行形: was/were + -ing
            ・状態動詞 (know, like) は通常進行形不可
            """
        ),
        GrammarTopic(
            id: "perfectTense",
            title: "完了形",
            summary: "Perfect Tense",
            explanation: """
            完了形は have/had + 過去分詞。「過去のある時点までの完了・経験・継続・結果」を表します。

            ・現在完了: have/has + pp。過去から現在までの繋がり
              - 完了: I have just finished it.
              - 経験: I've been to Paris.
              - 継続: I have lived here for 5 years.
              - 結果: He has lost his key. (今もない)
            ・過去完了: had + pp。過去のある時点よりさらに前
            ・未来完了: will have + pp。未来のある時点までに完了する動作
            ・現在完了進行形 have been -ing: ずっと続いている動作
            """
        ),
        GrammarTopic(
            id: "modals",
            title: "助動詞",
            summary: "Modal Verbs",
            explanation: """
            助動詞は本動詞に意味を加える。後ろは必ず動詞の原形。

            ・can/could: 能力・許可・可能性 (I can swim / Could you help?)
            ・may/might: 許可・推量 (You may go / It might rain)
            ・must: 義務・強い推量 (You must wait / He must be tired)
            ・should: 義務・助言 (You should rest)
            ・will/would: 意志・推量・過去の習慣
            ・have to: 必要性 (must とほぼ同義だが過去・未来形を作れる)
            ・助動詞 + have + pp: 過去への推量・後悔 (should have done = するべきだった)
            """
        ),
        GrammarTopic(
            id: "passive",
            title: "受動態",
            summary: "Passive Voice",
            explanation: """
            受動態は be + 過去分詞。動作を受ける側を主語にしたい時に使う。

            ・基本: The book was written by him.
            ・能動の目的語が受動の主語になる
            ・行為者が不明・不特定なら by は省略 (English is spoken here)
            ・SVOO の受動: He gave me a book → I was given a book / A book was given to me
            ・SVOC の受動: 補語は残る (He was elected president)
            ・群動詞の受動: He was looked after by Mary. (前置詞も忘れずに)
            ・進行形受動: be being + pp / 完了形受動: have been + pp
            """
        ),
        GrammarTopic(
            id: "infinitive",
            title: "不定詞",
            summary: "Infinitive",
            explanation: """
            to + 動詞の原形。名詞・形容詞・副詞用法があります。

            ・名詞用法: To learn English is fun. / I want to go.
            ・形容詞用法: I have something to do. (名詞を後置修飾)
            ・副詞用法: I came here to study. (目的) / glad to see you (感情の原因)
            ・原形不定詞: 知覚動詞 (see/hear) や使役動詞 (make/let/have) の後 (I saw him run)
            ・疑問詞 + to: how to swim, what to do
            ・意味上の主語は for + 名詞: It's hard for me to do it.
            ・seem to / appear to / happen to などの構文
            """
        ),
        GrammarTopic(
            id: "gerund",
            title: "動名詞",
            summary: "Gerund",
            explanation: """
            動詞の -ing 形を名詞として使うのが動名詞。

            ・主語: Swimming is fun.
            ・目的語: I enjoy reading.
            ・前置詞の目的語: I'm good at cooking. / I'm interested in learning.
            ・動名詞のみを取る動詞: enjoy, finish, mind, avoid, give up, suggest, admit
            ・不定詞のみを取る動詞: want, hope, decide, promise, agree
            ・両方OKだが意味が違う: remember/forget/try/stop
              - I stopped smoking (やめた) vs I stopped to smoke (吸うために止まった)
            """
        ),
        GrammarTopic(
            id: "participle",
            title: "分詞",
            summary: "Participle",
            explanation: """
            現在分詞 (-ing) は能動・進行、過去分詞 (-ed/不規則) は受動・完了の意味。

            ・形容詞用法: a sleeping baby (寝ている赤ん坊) / a broken window (壊れた窓)
            ・後置修飾: 名詞 + 分詞句 (the man standing there / the book written in English)
            ・分詞 + 名詞: 単独なら前、句なら後
            ・知覚・使役の補語: I saw him crying. / I had my hair cut.
            ・分詞構文 (次のトピック) も同じ仕組み
            ・現在分詞 vs 動名詞: 同じ -ing でも、形容詞的なら分詞、名詞的なら動名詞
            """
        ),
        GrammarTopic(
            id: "participialConstruction",
            title: "分詞構文",
            summary: "Participial Construction",
            explanation: """
            分詞構文は副詞節 (when/because/if/while…) を分詞句で簡潔に表現する形。

            ・時: Walking down the street, I met him. (= When I was walking…)
            ・原因・理由: Being tired, I went to bed. (= Because I was tired)
            ・条件: Turning right, you'll see it. (= If you turn right)
            ・付帯状況: She sat there, reading a book.
            ・受動の分詞構文: Written in haste, the report has errors. (= Because it was written…)
            ・完了形の分詞構文: Having finished it, I went home.
            ・否定: 文頭に Not を置く (Not knowing what to say…)
            """
        ),
        GrammarTopic(
            id: "comparison",
            title: "比較",
            summary: "Comparison",
            explanation: """
            比較は 原級 / 比較級 / 最上級 の3段階。

            ・原級: as 〜 as ... (She is as tall as Tom)
            ・比較級: 短い形容詞 + er、長い形容詞は more + 形容詞 (taller / more beautiful)
            ・最上級: -est / most、前に the (the tallest / the most beautiful)
            ・不規則変化: good-better-best, bad-worse-worst, many/much-more-most
            ・the 比較級, the 比較級: 「〜すればするほど…」(The more you read, the more you learn)
            ・no 比較級 than = not as 〜 as: 「〜と同じくらい〜ない」
            ・差を表す: much/far + 比較級 (much taller)
            """
        ),
        GrammarTopic(
            id: "number",
            title: "単数・複数",
            summary: "Singular & Plural",
            explanation: """
            主語と動詞の数の一致 (subject-verb agreement) は最重要。

            ・規則的複数: -s/-es (book/books, box/boxes, baby/babies)
            ・不規則複数: man/men, child/children, foot/feet, mouse/mice
            ・単複同形: sheep, deer, fish, species
            ・常に複数扱い: scissors, glasses, pants, jeans
            ・一見複数だが単数扱い: news, mathematics, the United States
            ・each / every / either / neither + 単数名詞 + 単数動詞
            ・a number of + 複数 (動詞は複数) / the number of + 複数 (動詞は単数)
            """
        ),
        GrammarTopic(
            id: "relativePronouns",
            title: "関係代名詞",
            summary: "Relative Pronouns",
            explanation: """
            関係代名詞は2文を1文にまとめる接続要素。先行詞 + 関係代名詞 + 関係節。

            ・who: 先行詞が人 (主格・目的格)
            ・whom: 人の目的格 (現代英語では who でも可)
            ・which: 物・動物
            ・that: 人・物どちらも (制限用法のみ)
            ・whose: 所有格 (the man whose car is red)
            ・what: 先行詞を含む = the thing(s) which (What you said is true)
            ・制限用法 (限定): カンマなし。情報を絞り込む
            ・非制限用法: カンマあり。補足情報。that は不可
            ・目的格は省略可: the book (which) I read
            """
        ),
        GrammarTopic(
            id: "relativeAdverbs",
            title: "関係副詞",
            summary: "Relative Adverbs",
            explanation: """
            関係副詞は「前置詞 + 関係代名詞」の代わりに使う。

            ・when: 時 (the day when I met him = on which)
            ・where: 場所 (the place where I live = at/in which)
            ・why: 理由 (the reason why he left = for which)
            ・how: 方法 (the way how は不可、how / the way の片方のみ)
            ・関係副詞は文中で副詞の働きをする (= 副詞句の代わり)
            ・先行詞が time/place/reason のときに対応する関係副詞を選ぶ
            ・関係副詞は省略可能なことがある (the day I met him)
            """
        ),
        GrammarTopic(
            id: "conjunctions",
            title: "接続詞",
            summary: "Conjunctions",
            explanation: """
            接続詞は語・句・節を結ぶ。等位接続詞と従位接続詞に分かれます。

            ・等位接続詞 (FANBOYS): for, and, nor, but, or, yet, so
            ・相関接続詞: both A and B / either A or B / neither A nor B / not only A but also B
            ・従位接続詞 (時): when, while, before, after, until, since, as soon as
            ・原因・理由: because, since, as
            ・譲歩: although, though, even if, even though
            ・条件: if, unless, as long as, provided (that)
            ・that 節: 名詞節を導く (I think that …)
            ・whether/if 節: 〜かどうか
            """
        ),
        GrammarTopic(
            id: "prepositions",
            title: "前置詞",
            summary: "Prepositions",
            explanation: """
            前置詞は名詞・代名詞の前に置き、時・場所・方向などを示します。

            ・時 in: 月・年・季節 (in May, in 2020) / on: 曜日・日付 (on Monday) / at: 時刻 (at 5)
            ・場所 in: 内部 (in the room) / on: 接触 (on the table) / at: 地点 (at the door)
            ・方向: to (到達点), into (中へ), from (起点), through (通り抜け)
            ・期間: for + 期間長さ / since + 起点 / during + 特定期間
            ・手段: by car, with a knife (道具)
            ・群前置詞: in front of, instead of, because of, in spite of
            ・動詞・形容詞との結びつき: depend on, be afraid of は丸ごと暗記
            """
        ),
        GrammarTopic(
            id: "subjunctive",
            title: "仮定法",
            summary: "Subjunctive Mood",
            explanation: """
            事実と異なる仮定や願望を表現。動詞の時制が現実より一段過去にずれます。

            ・仮定法過去 (現在の事実に反する): If I were rich, I would buy it.
              - if 節: 過去形 (be は were)、主節: would/could/might + 原形
            ・仮定法過去完了 (過去の事実に反する): If I had known, I would have called.
              - if 節: had + pp、主節: would/could/might have + pp
            ・I wish + 仮定法: I wish I had more time.
            ・as if / as though + 仮定法: He acts as if he were rich.
            ・倒置: Were I rich (= If I were rich), Had I known (= If I had known)
            """
        ),
        GrammarTopic(
            id: "negation",
            title: "否定",
            summary: "Negation",
            explanation: """
            否定の形と部分否定・全体否定の区別がポイント。

            ・全体否定: not / no / never / none (まったく〜ない)
            ・部分否定: not all / not always / not every (すべて〜ではない)
            ・二重否定: 二度否定すると肯定 (I can't not go = I have to go)
            ・hardly / scarcely / rarely / seldom: 「ほとんど〜ない」(否定の意味を含む)
            ・neither A nor B: A も B も〜ない
            ・否定疑問: Don't you …? の答えは内容で決める (Yes = する / No = しない)
            ・no longer / not 〜 anymore: もはや〜ない
            """
        ),
        GrammarTopic(
            id: "emphasis",
            title: "強調",
            summary: "Emphasis",
            explanation: """
            特定要素を目立たせる言い方。

            ・It is 〜 that ...: 強調構文 (It was John that broke the window)
            ・do/does/did + 原形: 動詞を強調 (I do love you)
            ・very / so / really / extremely: 形容詞・副詞を強める
            ・the very + 名詞: まさにその〜 (the very thing I wanted)
            ・倒置による強調: Never have I seen / Only then did I realize
            ・what + 強調名詞句: What a beautiful day! (感嘆文)
            ・on earth / in the world: 疑問詞の強調 (Who on earth did this?)
            """
        ),
        GrammarTopic(
            id: "ellipsis",
            title: "省略",
            summary: "Ellipsis",
            explanation: """
            重複する語句を省いて簡潔に。

            ・接続詞節での省略: When (I was) young, I lived in Tokyo.
            ・to 不定詞の省略 (代不定詞): I want to go but I don't have to (go).
            ・関係代名詞の省略: 目的格の who/which/that (the book (which) I bought)
            ・that 節の that: 動詞 (think, say) の後では省略可
            ・繰り返しの省略: Tom can run faster than Mary (can run).
            ・So am I / Neither do I: 同意の短縮表現
            ・Why not? / How come? のような会話的省略
            """
        ),
        GrammarTopic(
            id: "reportedSpeech",
            title: "話法",
            summary: "Reported Speech",
            explanation: """
            直接話法 → 間接話法 (伝達話法) への変換。時制と代名詞のずらしに注意。

            ・直接: He said, "I am tired."
            ・間接: He said (that) he was tired. (時制が過去にずれる)
            ・現在 → 過去、過去 → 過去完了、will → would
            ・代名詞: I → he/she、my → his/her、we → they
            ・時の副詞: today → that day、tomorrow → the next day、yesterday → the day before
            ・疑問文: He asked if/whether … / He asked what …
            ・命令文: He told me to do it. / He told me not to do it.
            ・普遍真理は時制をずらさない (He said the earth is round)
            """
        ),
        GrammarTopic(
            id: "articles",
            title: "冠詞",
            summary: "Articles",
            explanation: """
            a/an (不定冠詞)・the (定冠詞)・無冠詞 (zero article) の使い分け。

            ・a/an: 初出・不特定の可算名詞単数 (I saw a dog)
            ・the: 既出・特定・話者と聞き手の双方が分かるもの (the dog I saw)
            ・the + 楽器名 (play the piano)、the + 形容詞 (the rich)
            ・無冠詞: 食事 (have breakfast)、交通手段 (by bus)、抽象概念 (love is)
            ・固有名詞は通常無冠詞 (Tokyo, Mike) だが河川・海・山脈は the (the Nile)
            ・the + 単数名詞: 種族全体 (The dog is loyal)
            ・国名: the United States, the Netherlands (複数形・連邦の名は the)
            """
        )
    ]
}
