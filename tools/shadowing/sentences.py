# -*- coding: utf-8 -*-
"""Shadowing passages for the 発音 → シャドウイング tab.

Every passage is taken word for word from the learner's own recordings
(A: interview, about 5 min / B: drama episode, about 18 min) and is played
in that original voice. tools/shadowing/clips.json holds where each one is;
the cut audio lives in EnglishVocabApp/EnglishVocabApp/ShadowingAudio.

Each entry: (id, english, japanese, [発音のコツ ...]).
Run build.py to regenerate ShadowingSeed.swift (IPA via espeak-ng, British RP).
"""

SENTENCES = [
    ("p01", "Well, first of all, I think if somebody is doing something that is useful to the rest of society, I think that's a good thing.",
     "まず第一に、誰かが社会の役に立つことをしているなら、それは良いことだと思う。", [
        "first of all は「ファーストヴォール」とつなげ、ひとかたまりで言います。",
        "is doing something that is useful は弱い語（is, that）を軽く流し、doing と useful を強めます。",
        "rest of society は「レストヴソサイエティ」。of は弱く /əv/。",
        "息継ぎは society のあと。I think that's a good thing は下げて言い切ります。",
    ]),
    ("p02", "So we want to spend the time today talking about your view of the future and what people should work on.",
     "今日は、未来についてのあなたの考えと、人々が何に取り組むべきかを話したいと思います。", [
        "want to spend は want の t を止めて「ウォントゥスペンド」。to は弱く。",
        "talking about は「トーキンガバウト」とつなげます。talk の l は読みません。",
        "view of the future は「ヴューアヴザフューチャー」。of the は弱く速く。",
        "work on は「ワーコン」とつなげ、最後の on を少し強めて終えます。",
    ]),
    ("p03", "If you were 22 today, what would the five problems that you would think about working on be?",
     "もし今日あなたが22歳だったら、取り組みたいと思う5つの問題は何ですか？", [
        "If you were は弱く速く「イフユワ」。仮定法なので were を使います。",
        "22 は twenty-two。twenty の t はイギリス英語ではっきり発音します。",
        "what would は「ワッウッド」と t を止めます。",
        "最後の be は疑問の締めくくり。working on be と続けて下げます。",
    ]),
    ("p04", "If you can actually solve genetic diseases, if you can prevent dementia or Alzheimer's or something like that with genetic reprogramming, that would be wonderful.",
     "もし遺伝性の病気を本当に治せたら、遺伝子の書き換えで認知症やアルツハイマー病などを防げたら、素晴らしいことだ。", [
        "If you can が2回繰り返されるリズムをまねます。can は弱く /kən/。",
        "genetic は /dʒəˈnetɪk/。真ん中の ne に強勢。",
        "dementia は /dɪˈmenʃə/、Alzheimer's は /ˈæltshaɪməz/。",
        "something like that で一度下げ、that would be wonderful で気持ちを込めて締めます。",
    ]),
    ("p05", "Well, I think first of all, I should say that I do not expect to be involved in all these things.",
     "まず言っておくと、これらすべてに自分が関わるとは思っていません。", [
        "I should say that は弱く速く。should は /ʃəd/。",
        "do not と分けて言うことで「〜しない」を強調しています。not を強めます。",
        "involved in all は「インヴォルヴディノール」とつなげます。",
        "話し言葉の速さなので、まず 0.5 倍でリズムをつかむのがおすすめです。",
    ]),
    ("p06", "I'm sure everyone could use the extra help since this year's heist was so spur of the moment and no one had time to plan anything too complicated.",
     "今年の大会は急に決まったから、みんな手助けがほしいはず。複雑な計画を立てる時間なんて誰もなかったしね。",[
        "could use は「〜があると助かる」。could は弱く /kəd/。",
        "spur of the moment は「その場の思いつき」。「スパーラヴザモーメント」とつなげます。",
        "no one had time は no one を強め、had は弱く。",
        "anything too complicated は too を強く伸ばして皮肉っぽく言います。",
    ]),
    ("p07", "But I don't get it. Why don't you want us to be on the same team? Because, Amy, no one can know that we're working together. And Charles will never be suspicious because he'll be so excited to be your teammate.",
     "でも分からない。どうして同じチームになりたくないの？／だって、エイミー、僕たちが組んでるって誰にも知られちゃいけないんだ。それにチャールズは君と組めて大喜びするから、絶対に怪しまないよ。", [
        "2人の会話です。前半の質問と後半の説明で声の調子が変わるところもまねます。",
        "don't get it は t を止めて「ドンゲッティット」。",
        "Why don't you は「ワイドンチュ」。t と y が混ざって「チュ」になります。",
        "working together は「ワーキントゥゲザー」。suspicious は /səˈspɪʃəs/。",
    ]),
    ("p08", "Well, for weeks we've been trying to figure out how you can do your new job and still have us be there for Mac as much as we want. And I really think this is it.",
     "何週間も、君が新しい仕事をしながら、僕たちが望むだけマックのそばにいられる方法を考えてきたよね。これがその答えだと本気で思うんだ。", [
        "we've been trying to は弱く速く「ウィヴビントライイントゥ」。",
        "figure out は「フィガラウト」とつなげます。",
        "as much as は「アズマッチャズ」。2つの as は弱く /əz/。",
        "this is it は「ディスィズィット」。最後の it を強めて言い切ります。",
    ]),
    ("p09", "Look, you know I was scared about having kids because I didn't want to be like my dad. But if I do this, I have a chance to be the exact opposite. And I don't want Mac to ever feel the way I felt growing up.",
     "ほら、僕が父親みたいになりたくなくて、子どもを持つのが怖かったのは知ってるよね。でもこうすれば、正反対になれるチャンスがある。マックには、僕が子どもの頃に感じたような思いを絶対させたくないんだ。", [
        "scared about は「スケアダバウト」とつなげます。",
        "didn't want to は t が重なるので「ディドゥンウォントゥ」。",
        "exact opposite は「イグザクタポズィット」。exact の t が次の母音に流れます。",
        "the way I felt growing up は感情を込めて、ゆっくり下げて終えます。",
    ]),
    ("p10", "Now, all I care about is what's best for our family. And, Ames, this is it. I mean, you've earned this incredible opportunity. You can't do it halfway. It's too important.",
     "今は家族にとって一番いいことしか考えてない。エイムズ、これなんだよ。だって君はこのすごいチャンスを勝ち取ったんだ。中途半端にはできない。大事すぎるよ。", [
        "all I care about は「オーライケアラバウト」とつなげます。",
        "what's best は t を止めて「ウォッツベスト」。",
        "can't はイギリス英語で /kɑːnt/「カーント」。can と区別して強く。",
        "短い文が続くので、文ごとに区切ってリズムよく言います。too important の too を強めます。",
    ]),
    ("p11", "You really think you'll be happy? I don't want you to give up your dream job just for me. I have a new dream job now. Trust me, I wouldn't say it if I didn't mean it.",
     "本当にそれで幸せになれると思う？私のためだけに夢の仕事をあきらめてほしくない。／今は新しい夢の仕事があるんだ。信じて、本気じゃなかったら言わないよ。", [
        "2人の会話です。最初の質問は Do を省いた口語の疑問文で、文末を上げます。",
        "want you to は「ウォンチュトゥ」。t と y が混ざります。",
        "give up は「ギヴァップ」とつなげます。",
        "say it if I は「セイイティファイ」。didn't mean it は「ディドゥンミーニット」。",
    ]),
    ("p12", "Because in order for this to work, we absolutely have to win the first leg of the heist. It doubles our chances.",
     "これをうまくいかせるには、大会の第1ラウンドは絶対に勝たないといけない。そうすればチャンスが倍になる。", [
        "in order for this to work はひとかたまり。for と to は弱く。",
        "absolutely は /ˌæbsəˈluːtli/。lu に強勢を置いて強調します。",
        "have to はイギリス英語でも「ハフトゥ」と f の音になります。",
        "doubles our は「ダブルザウア」とつなげます。",
    ]),
    ("p13", "And since I'm not competing, I've agreed to help out. I designed the first part of the heist to be a scavenger hunt through memorable moments from the last eight years.",
     "それに私は参加しないから、手伝うことにしたの。第1部は、この8年の思い出の場面をめぐる宝探しにしたわ。", [
        "help out は「ヘルパウト」とつなげます。",
        "first part は t が重なるので最初の t は止めるだけ「ファースパート」。",
        "scavenger hunt は /ˈskævɪndʒə hʌnt/。scav を強く。",
        "last eight years は「ラーステイトイヤーズ」。last の t が eight へつながります。",
    ]),
    ("p14", "Well, a vending machine code is usually a letter followed by a double-digit number.",
     "自動販売機の番号は、ふつうアルファベット1文字に2桁の数字が続くんだよ。", [
        "vending machine は vending に強勢。machine は /məˈʃiːn/。",
        "usually は /ˈjuːʒuəli/。「ユージュアリ」の ʒ は「ジュ」を柔らかく。",
        "letter はイギリス英語で t をはっきり /ˈletə/。",
        "followed by a は「フォロウドバイア」と弱く速く流します。",
    ]),
    ("p15", "It felt like it was great for the heist, and it's also just such a wonderful way to flex on you guys how rich I am now.",
     "大会にぴったりだと思ったし、今どれだけお金持ちか、あんたたちに見せびらかすのにもすごくいい方法だしね。", [
        "felt like it was は「フェルトライキットワズ」と一気に。",
        "such a wonderful way は such a を「サッチャ」とつなげます。",
        "flex on は「見せびらかす」というくだけた言い方。「フレクソン」とつなげます。",
        "how rich I am now は気取った調子で、rich を強く伸ばします。",
    ]),
    ("p16", "You left of your own volition. We each spent meaningful time with you. We were incredibly supportive.",
     "あなたは自分の意思で辞めたのよ。みんなそれぞれあなたと有意義な時間を過ごしたし、すごく応援してたじゃない。", [
        "of your own は「オヴヨーロウン」とつなげます。",
        "volition は /vəˈlɪʃən/。v は下唇を軽くかみます。",
        "spent meaningful は t を止めて「スペンミーニングフル」。",
        "incredibly supportive は 2語とも強く、皮肉っぽく言うのがポイントです。",
    ]),
    ("p17", "In a difficult job, it's vital to give people a chance to blow off some steam. That's just good leadership, Bob. I was sure you'd be angry. I figured this interview was over.",
     "大変な仕事では、みんなに息抜きの機会を与えることが欠かせない。それが良いリーダーシップってもんだよ、ボブ。／きっと怒られると思ってました。面接は終わりだと思ったんです。", [
        "2人の会話です。前半は落ち着いた上司、後半はほっとした部下の調子です。",
        "blow off some steam は「ストレスを発散する」。「ブロウオフサムスティーム」。",
        "I was sure you'd be は弱く速く「アイワズショーユドゥビ」。",
        "interview was over は「インタヴューワゾウヴァ」とつなげます。",
    ]),
    ("p18", "Mac's done with daycare, so we had the babysitter bring him by so we could say hi. Because we're going to be home late tonight.",
     "マックの保育園が終わったから、ベビーシッターに連れてきてもらって、ちょっと顔を見に来たの。今夜は帰りが遅くなるから。", [
        "done with は「ダンウィズ」。daycare は day に強勢。",
        "bring him by は him の h が落ちて「ブリンギムバイ」。",
        "so we could say hi は軽く明るく。could は弱く /kəd/。",
        "going to be home late は going to を速く弱く言います。",
    ]),
    ("p19", "Okay, so this truck is a fortress on wheels, and we are not getting in there without an intricate plan.",
     "いい？このトラックは走る要塞なの。綿密な計画なしには入れないわ。", [
        "fortress on wheels は「フォートレソンウィールズ」とつなげます。",
        "we are not と縮めずに言うことで強い否定になっています。not を強く。",
        "getting in there は「ゲティンインゼア」。",
        "intricate は /ˈɪntrɪkət/。最初の in に強勢。",
    ]),
    ("p20", "We're not gonna force our way into an armored vehicle. We'll need to use our brains in the end.",
     "装甲車に力ずくで入るのは無理だ。結局は頭を使うしかない。", [
        "gonna は going to のくだけた形で「ガナ」。",
        "force our way into は「フォーサウェイイントゥ」とつなげます。",
        "armored vehicle は「アーマドヴィークル」。イギリスのつづりは armoured。",
        "in the end は「インディエンド」。end を強めて締めます。",
    ]),
    ("p21", "You made me meet with a fake person just so you can trick me into sitting out the heist? That interview was important. It's my shot to become captain.",
     "大会に参加させないために、偽物の人と会わせたっていうのか？あの面接は大事だったんだぞ。署長になるチャンスなんだ。", [
        "怒って問い詰める調子です。made と fake を強く言います。",
        "meet with a は「ミートウィザ」とつなげます。",
        "sitting out は「スィティンガウト」。sit out は「参加しない」。",
        "It's my shot は「チャンス」。shot を強く、captain は /ˈkæptɪn/。",
    ]),
    ("p22", "Then why was he in a fake office? Oh, Terry, he just relocated to make room for the new reform unit on the sixth floor. It's a temporary space.",
     "じゃあ、なんで偽物のオフィスにいたんだ？／ああテリー、6階の新しい改革部署の場所を空けるために、移動しただけよ。仮の場所なの。", [
        "2人の会話です。最初の疑問文は why を強く、文末を下げます。",
        "fake office は「フェイコフィス」とつなげます。",
        "make room for は「スペースを空ける」。「メイクルームフォ」。",
        "sixth floor は th が続いて難しい音。/sɪksθ/ をゆっくり練習します。",
    ]),
]
