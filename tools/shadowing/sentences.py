# -*- coding: utf-8 -*-
"""Shadowing sentences for the 発音 → シャドウイング tab.

Every sentence is taken word for word from the learner's own recordings and
is played in that original voice (tools/shadowing/clips.json holds where it
is). Sentences without original audio are not used.

Each entry: (id, english, japanese, [発音のコツ ...]).
The id is also the audio file name: ShadowingAudio/shadow_<id>.m4a
(optional word timings: ShadowingAudio/shadow_<id>.json).
Run build.py to regenerate ShadowingSeed.swift (IPA via espeak-ng, British RP).
"""

SENTENCES = [
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
    ("s34", "I really was just trying to be useful.", "本当に、ただ役に立ちたかっただけなんだ。", [
        "really was just は弱く速く。was は /wəz/、just の t は trying の前で止めるだけ。",
        "trying to be は「トライイントゥビ」。to は弱く /tə/。",
        "useful は /ˈjuːsfəl/。「ユースフォ」のように語尾の l は暗く。",
    ]),
    ("s35", "We really need to make sure it goes right.", "うまくいくように、しっかり確かめないと。", [
        "need to は d を止めて「ニートゥ」。",
        "make sure it は「メイクショーリット」とつなげます（イギリス英語でも母音の前では r が現れます）。",
        "really と right の r は、舌先をどこにも付けずに。",
    ]),
    ("s36", "That's the most important thing, I think, right now.", "今はそれが一番大事なことだと思う。", [
        "most important は t が次の母音につながり「モウスティンポータント」。",
        "thing の ng は舌の奥を上あごに付けたまま、g を破裂させません。",
        "I think は挟み込みの言葉なので、低く軽く言ってから right now を強めます。",
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
    ("s48", "You really think you'll be happy?", "本当にそれで幸せになれると思う？", [
        "Do を省いた口語の疑問文。語順は平叙文のまま、文末を上げて質問にします。",
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
    ("s52", "I think it's gonna work out.", "うまくいくと思うよ。", [
        "gonna は going to のくだけた形で「ガナ」。弱く速く言います。",
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
