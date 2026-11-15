# -*- coding: utf-8 -*-
"""Shadowing sentences for the 発音 → シャドウイング tab.

Each entry: (id, english, japanese, [発音のコツ ...]).
The id is also the audio file name: ShadowingAudio/shadow_<id>.m4a
(optional word timings: ShadowingAudio/shadow_<id>.json).
Run build.py to regenerate ShadowingSeed.swift (IPA via espeak-ng, British RP).
"""

SENTENCES = [
    ("s01", "She came up with a great idea.", "彼女はすごくいいアイデアを思いついた。", [
        "came up with は1語のようにつなげて「ケイマップウィズ」。came の m が up の母音にくっつきます。",
        "great idea は t が次の母音へ流れて「グレイタイディア」。",
        "強く読むのは great と i-DE-a。with や a は弱く短く。",
    ]),
    ("s02", "Let's put off the meeting until next week.", "会議は来週まで延期しよう。", [
        "put off は t が母音に挟まれて「プトフ」。イギリス英語では t を軽くはっきり、アメリカ英語ではラ行のように聞こえます。",
        "next week は next の t を飲み込んで「ネクスウィーク」。",
        "the は弱く /ðə/。舌先を歯に軽く当てるだけで十分です。",
    ]),
    ("s03", "I think I need to go to the ER. I hurt my leg pretty badly.", "救急に行かなきゃ。足をかなりひどく痛めた。", [
        "need to は d と t が続くので、d は舌を当てて止めるだけ「ニートゥ」。",
        "ER はアルファベット読み /iː ˈɑː/「イーアー」。イギリス英語では r を読みません。",
        "hurt my は t を飲み込んで「ハーッマイ」。pretty badly は気持ちを込めて強めに。",
    ]),
    ("s04", "Okay, let's get you checked out. Better to be safe.", "じゃあ診てもらおう。念のためにね。", [
        "get you は t と y が混ざって「ゲッチュ」。",
        "checked out は -ed の /t/ が次の母音とつながり「チェックタウト」。",
        "Better はイギリス英語では t をはっきり /ˈbetə/。語尾の r は読みません。",
    ]),
    ("s05", "Could you help me with this? It won't take long.", "これ手伝ってもらえる？すぐ終わるから。", [
        "Could you は d と y が混ざって「クッジュ」。",
        "help me の p は唇を閉じるだけで、破裂させずに me へ。",
        "won't /wəʊnt/「ウォウント」と want /wɒnt/「ウォント」を区別。t が続くので最初の t は止めるだけ。",
    ]),
    ("s06", "Honestly, I didn't expect it to be this good.", "正直、こんなに良いとは思わなかった。", [
        "Honestly の h は発音しません /ˈɒnɪstli/「オネストリ」。",
        "didn't expect it は n と t が次の母音につながって「ディドゥネクスペクティット」。",
        "this good を強く、少しゆっくり言うと気持ちが伝わります。",
    ]),
    ("s07", "Can I pay by card, or is it cash only?", "カードで払えますか、それとも現金だけですか？", [
        "Can I は「キャナイ」とつなげます。",
        "or is it は、イギリス英語でも次が母音のときだけ r が現れて「オーリズィット」（リンキング R）。",
        "選択の疑問文なので card で上げ、only で下げます。",
    ]),
    ("s08", "Sorry, I didn't catch that. Could you say it again?", "すみません、聞き取れませんでした。もう一度言ってもらえますか？", [
        "catch that は ch のあと、舌先を歯に当てて th へ。",
        "say it again は全部つなげて「セイイタゲン」。",
        "again はイギリス英語で /əˈɡen/「アゲン」と /əˈɡeɪn/「アゲイン」の両方が使われます。",
    ]),
    ("s09", "I'm running a bit late. I'll be there in ten minutes.", "ちょっと遅れてる。10分で着くよ。", [
        "running a bit は「ラニンガビット」とつなげます。",
        "bit late の t は止めるだけ。I'll /aɪl/ は短く。",
        "ten minutes は n と m がなめらかにつながり、minutes の t は軽く。",
    ]),
    ("s10", "That sounds brilliant. Count me in!", "いいね。私も入れて！", [
        "brilliant は l が2回。舌先を上の歯ぐきにしっかり付けます。",
        "Count me in は t が落ちて「カウンミーイン」。",
        "強く言うのは in（Count me IN!）。",
    ]),
    ("s11", "Would you mind closing the window? It's a bit chilly.", "窓を閉めてもらえますか？ちょっと寒くて。", [
        "Would you は d と y が混ざって「ウッジュ」。",
        "mind closing の d は止めるだけ。",
        "It's a bit は「イッツァビット」。chilly は ch と l をはっきり。",
    ]),
    ("s12", "I've been to London twice, but I've never seen the Tower Bridge open.", "ロンドンには2回行ったけど、タワーブリッジが開くのは見たことがない。", [
        "London は /ˈlʌndən/「ランドン」。最初の母音は「ア」に近い /ʌ/。",
        "been はイギリス英語では /biːn/ と伸ばすことが多いです。",
        "Tower /ˈtaʊə/ の r は読みません。twice, but のところで一息入れます。",
    ]),
    ("s13", "If I were you, I'd take the job.", "私だったら、その仕事を受けるな。", [
        "If I は「イファイ」とつなげます。",
        "were は弱く /wə/。were you で「ワユ」。",
        "I'd take は d を止めて「アイッテイク」。job で下げて言い切ります。",
    ]),
    ("s14", "Let's grab a coffee and catch up sometime this week.", "今週どこかでコーヒーでも飲んで近況を話そう。", [
        "grab a は「グラバ」、catch up は「キャッチャップ」とつなげます。",
        "coffee and は and が弱く /ən/ になり「コフィアン」。",
        "coffee はイギリス英語で /ˈkɒfi/「コフィー」。最初の母音は短い「オ」。",
    ]),
    ("s15", "I'm afraid I can't make it tomorrow. Something's come up.", "残念だけど明日は行けない。用事ができちゃって。", [
        "can't はイギリス英語で /kɑːnt/「カーント」。can /kən/ とは母音の長さで区別します。",
        "make it は「メイキット」、come up は「カマップ」とつなげます。",
        "I'm afraid はていねいに断るときの前置き。柔らかく下げて言います。",
    ]),
    ("s16", "Thanks for your help. I really appreciate it.", "手伝ってくれてありがとう。本当に感謝してる。", [
        "Thanks の th は舌先を歯に当てて息を出す /θ/。「サ」にならないように。",
        "for your は弱く /fə jə/「ファヨ」。",
        "appreciate it は「アプリーシエイティット」とつなげ、really に気持ちを込めます。",
    ]),
    ("s17", "What do you want to do this weekend?", "今週末は何をしたい？", [
        "What do you は弱く速く「ワッドゥユ」、さらに崩れて「ワッジュ」。",
        "want to はイギリス英語では /wɒnt tə/「ウォントゥ」。wanna はアメリカ寄りです。",
        "weekend はイギリス英語では後ろに強勢 week-END。",
    ]),
    ("s18", "Do you know where the nearest station is?", "一番近い駅がどこか知っていますか？", [
        "Do you は弱く「ジュ」に近くなります。",
        "where the は r を読まずに「ウェアザ」。nearest は /ˈnɪərɪst/。",
        "間接疑問なので、文末の is は上げすぎず軽く。",
    ]),
    ("s19", "I'll have a flat white, please.", "フラットホワイトをお願いします。", [
        "I'll have a は「アイルハヴァ」とつなげます。",
        "flat white は t を止めて「フラッワイト」。",
        "please は柔らかく、少し上げ気味に言うと感じがいいです。",
    ]),
    ("s20", "It's not a big deal. Don't worry about it.", "大したことないよ。気にしないで。", [
        "not a はイギリス英語では t をはっきり「ノッタ」。",
        "Don't worry は t が落ちて「ドウンワリ」。",
        "about it は「アバウティット」とつなげます。",
    ]),
    ("s21", "Could I get the bill, please?", "お会計をお願いできますか？", [
        "Could I は「クダイ」とつなげます。",
        "get the の t は止めるだけで、すぐ th へ。",
        "bill の l は語末の暗い l。「ビル」より「ビォ」に近く聞こえます。",
    ]),
    ("s22", "I'm looking forward to seeing you.", "会えるのを楽しみにしています。", [
        "looking の g はほとんど聞こえず「ルッキン」。",
        "forward /ˈfɔːwəd/ は r を読みません。to は弱く /tə/。",
        "seeing you は「スィーインギュー」とつなげます。",
    ]),
    ("s23", "How long have you been learning English?", "英語をどれくらい勉強しているの？", [
        "How long の ng は舌の奥を上あごに付けたまま、g を破裂させません。",
        "have you は「ハヴュ」、been は弱く /bɪn/。",
        "learning の /ɜː/ は口を大きく開けず、こもった「アー」。",
    ]),
    ("s24", "Sorry to bother you, but do you have a minute?", "お邪魔してすみません、少しお時間ありますか？", [
        "bother の th は声を出す /ð/。舌先を歯に当てて震わせます。",
        "do you have a は「ジュハヴァ」とつなげます。",
        "minute は /ˈmɪnɪt/「ミニット」。最後の t は軽く。",
    ]),
    ("s25", "I didn't mean to upset you.", "あなたを怒らせるつもりはなかった。", [
        "didn't mean は t を落として「ディドゥンミーン」。",
        "mean to は n から t へ舌の位置はそのまま。",
        "upset you は t と y が混ざって「アップセッチュー」。",
    ]),
    ("s26", "The train was cancelled, so I had to take a taxi.", "電車が運休になったので、タクシーに乗るしかなかった。", [
        "cancelled はイギリスのつづり。発音は /ˈkænsəld/「キャンセォド」。",
        "had to は d を止めて「ハットゥ」。was は弱く /wəz/。",
        "take a taxi は「テイカタクシ」とつなげます。",
    ]),
    ("s27", "Let me know if you need anything else.", "ほかに何か必要なら言ってね。", [
        "Let me は t を止めて「レッミー」。",
        "need anything は d が次の母音とつながり「ニーデニシング」。",
        "else の l は暗い l。舌先を上に付けたまま s へ。",
    ]),
    ("s28", "That's exactly what I was thinking.", "まさにそう思ってた。", [
        "That's exactly は「ザッツィグザクトリ」とつなげます。",
        "what I は「ウォタイ」。was は弱く /wəz/。",
        "thinking の th は息だけの /θ/。exactly を一番強く。",
    ]),
    ("s29", "Could you speak a bit more slowly, please?", "もう少しゆっくり話してもらえますか？", [
        "speak a bit は「スピーカビット」とつなげます。",
        "more slowly はイギリス英語では r を読まず「モースロウリ」。",
        "slowly は l が2回。舌先をしっかり上に付けます。",
    ]),
    ("s30", "I'm not sure, but I'll find out and get back to you.", "よく分からないけど、調べて折り返し連絡するね。", [
        "not sure の t は止めるだけ。sure /ʃɔː/ は「ショー」。",
        "find out は d が次の母音につながり「ファインダウト」。",
        "get back to you は t を止めて「ゲッバックトゥユ」。to は弱く。",
    ]),

    # ── 録音（インタビュー・ドラマ）で実際に使われていた、短い日常表現 ──
    ("s31", "Thank you for joining us.", "ご参加ありがとうございます。", [
        "Thank の th は舌先を歯に当てて息を出す /θ/。",
        "joining us は「ジョイニンガス」とつなげます。",
        "司会が最初に言う決まり文句。joining を一番強く。",
    ]),
    ("s32", "Thanks for having me.", "呼んでくれてありがとう。", [
        "for は弱く /fə/。「ファ」と短く。",
        "having の h は弱くなり、me まで一息で。",
        "招かれた側の定番の返事。Thanks と having を強く読みます。",
    ]),
    ("s33", "That would be wonderful.", "それは素晴らしいね。", [
        "That would は t を止めて「ザッウッド」。would の l は読みません。",
        "wonderful は /ˈwʌndəfəl/。最初の母音は「ア」に近い /ʌ/。",
        "強く読むのは WON-derful。語尾は弱く短く。",
    ]),
    ("s34", "I was just trying to be useful.", "ただ役に立ちたかっただけなんだ。", [
        "was は弱く /wəz/、to も弱く /tə/。",
        "just trying は t が重なるので、just の t は止めるだけ。",
        "useful は /ˈjuːsfəl/。「ユースフォ」のように語尾の l は暗く。",
    ]),
    ("s35", "We really need to make sure it goes right.", "うまくいくように、しっかり確かめないと。", [
        "need to は d を止めて「ニートゥ」。",
        "make sure it は「メイクショーリット」とつなげます（イギリス英語でも母音の前では r が現れます）。",
        "really と right の r は、舌先をどこにも付けずに。",
    ]),
    ("s36", "That's the most important thing right now.", "今はそれが一番大事なことだよ。", [
        "most important は t が次の母音につながり「モウスティンポータント」。",
        "important の真ん中の t は、のどで止めるだけでも自然です。",
        "thing の ng は舌の奥を上あごに付けたまま、g を破裂させません。",
    ]),
    ("s37", "We'll talk about this later.", "この話はまたあとで。", [
        "We'll は /wiːl/ を短く「ウィォ」。",
        "talk about は「トーカバウト」。talk の l は読みません。",
        "about this は t を止めて、すぐ th へ。",
    ]),
    ("s38", "What did you just say?", "今なんて言ったの？", [
        "What did you は「ワッディジュ」と一気に。did you は「ディジュ」。",
        "just say は t が落ちて「ジャッセイ」。",
        "驚きを込めるときは just と say を強く、最後を上げます。",
    ]),
    ("s39", "What do you mean?", "どういう意味？", [
        "What do you は弱く速く「ワッドゥユ」→「ワッジュ」。",
        "mean を長めに /miːn/、口を横に引きます。",
        "強く読むのは mean。文末は下げます。",
    ]),
    ("s40", "I don't understand.", "分からないな。", [
        "don't understand は t が落ちて「ドウナンダスタンド」とつながります。",
        "understand の強勢は最後 un-der-STAND。",
        "語尾の d は軽く止めるだけ。",
    ]),
    ("s41", "That's what I want to do.", "それが私のやりたいことなんだ。", [
        "what I は「ウォタイ」とつなげます。",
        "want to は t を1回だけ「ウォントゥ」。to は弱く /tə/。",
        "強く読むのは That's と do。",
    ]),
    ("s42", "But only if you agree.", "でも、あなたが賛成してくれるならね。", [
        "But only は「バットウンリ」。only は /ˈəʊnli/「オウンリ」。",
        "if you は弱く「イフュ」。",
        "agree は後ろに強勢 a-GREE。gr は一気に。",
    ]),
    ("s43", "We have other options.", "ほかにも選択肢はあるよ。", [
        "other の th は声を出す /ð/。舌先を歯に当てて震わせます。",
        "other options は、イギリス英語でも r が現れて「アザロプションズ」。",
        "options は /ˈɒpʃənz/。p は唇を閉じるだけで sh へ。",
    ]),
    ("s44", "I think this is the best one.", "これが一番いいと思う。", [
        "think と this で th が続きます。息だけの /θ/ と声を出す /ð/ を区別。",
        "this is は「ディスィズ」とつなげます。",
        "best one は t を止めて「ベスワン」。",
    ]),
    ("s45", "I get that, I really do.", "それは分かるよ、本当に。", [
        "get that は t を止めて、すぐ th へ「ゲッザット」。",
        "really do の do をはっきり強く。気持ちを込めるところです。",
        "コンマで軽く間を置きます。",
    ]),
    ("s46", "I would do anything for you.", "あなたのためなら何でもするよ。", [
        "would do は d が重なるので1回だけ「ウッドゥー」。",
        "anything は /ˈeniθɪŋ/。th で舌先を歯に当てます。",
        "for you は弱く /fə juː/。強く読むのは anything。",
    ]),
    ("s47", "You've got to stop asking.", "もうその話を聞くのはやめて。", [
        "got to は「ゴットゥ」。くだけると「ガッタ」に近くなります。",
        "stop asking は p が次の母音につながり「ストッパースキン」。",
        "asking はイギリス英語で /ˈɑːskɪŋ/「アースキン」と伸ばします。",
    ]),
    ("s48", "Do you really think you'll be happy?", "本当にそれで幸せになれると思う？", [
        "Do you は弱く「ジュ」。",
        "you'll は /juːl/ を短く「ユォ」。",
        "happy の h はしっかり息を出し、/æ/ は口を横に開いて「エァ」。",
    ]),
    ("s49", "Trust me, I wouldn't say it if I didn't mean it.", "信じて。本気じゃなかったら言わないよ。", [
        "Trust me は t が落ちて「トラスミー」。",
        "say it if I は「セイイティファイ」と全部つなげます。",
        "wouldn't、didn't の t は止めるだけ。mean it は「ミーニット」。",
    ]),
    ("s50", "The important thing is we're on the same page.", "大事なのは、私たちの考えが同じだってこと。", [
        "thing is は「スィンギズ」とつなげます。",
        "we're on は「ウィアロン」。on the same page は「同じ考えである」という決まり文句。",
        "same page は m で唇を閉じてから p へ。",
    ]),
    ("s51", "Let me tell you about the plan.", "計画について話させて。", [
        "Let me は t を止めて「レッミー」。",
        "tell you about は「テリュアバウト」とつなげます。",
        "plan の /æ/ は口を横に開いて「プレァン」。",
    ]),
    ("s52", "I think it's going to work out.", "うまくいくと思うよ。", [
        "going to は弱く速く。くだけた会話では gonna「ガナ」になります。",
        "work out は「ワーカウト」とつなげます。work は /wɜːk/、口をあまり開けないこもった音。",
        "walk /wɔːk/ と混同しないように注意。",
    ]),
    ("s53", "Come on, it'll just take a second.", "お願い、すぐ済むから。", [
        "Come on は「カモン」とつなげます。",
        "it'll は「イトォ」。t のあとすぐ暗い l。",
        "just take は t が1つになり「ジャステイク」。take a は「テイカ」。",
    ]),
    ("s54", "I'm sorry, what's happening?", "ごめん、何が起きてるの？", [
        "sorry はイギリス英語で /ˈsɒri/「ソリ」。短い「オ」です。",
        "what's happening は「ウォッツハプニン」。happening は2音節のように短く。",
        "聞き返すときは文末を上げ気味に。",
    ]),
    ("s55", "I don't think we want to do that.", "それはやめておいたほうがいいと思う。", [
        "don't think は t を止めて th へ。",
        "want to do は「ウォントゥドゥー」。to は弱く。",
        "やんわり反対する言い方。that を軽く下げて終わります。",
    ]),
]
