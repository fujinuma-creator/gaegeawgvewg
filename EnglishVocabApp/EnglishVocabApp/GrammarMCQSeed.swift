import Foundation

/// Hand-curated 4-choice grammar questions. Add new entries to
/// `questions` over time — IDs must remain stable so user progress
/// (which choice they picked) keeps mapping to the right question.
enum GrammarMCQSeed {

    static let questions: [GrammarQuestion] = [
        GrammarQuestion(
            id: "q01",
            question: "Hardly ___ the conference room when the fire alarm went off.",
            choices: ["I had entered", "had I entered", "I have entered", "did I enter"],
            correctIndex: 1,
            translation: "「会議室に入るやいなや火災報知器が鳴った」",
            explanation: """
            ・Hardly...when... で「〜するやいなや」の決まった型
            ・Hardly が文頭に来ると、否定的な意味の語が前に出るので疑問文みたいに語順がひっくり返る(倒置)
            ・「入った」のは「鳴った」より前の出来事 → 過去より前は 過去完了形 (had + 過去分詞)
            ・だから had I entered の語順になる
            """
        ),
        GrammarQuestion(
            id: "q02",
            question: "The new policy will come into ___ on January 1st.",
            choices: ["action", "effect", "practice", "operation"],
            correctIndex: 1,
            translation: "「新しい方針は1月1日に施行される」",
            explanation: """
            ・come into effect = 「(法律・規則が)施行される」の決まり文句
            ・醤油とわさびのように、英語にも決まったセット(コロケーション)がある
            ・法律・規則が「効力を持つ」と言いたいときは必ずこの形
            ・come into action は誤り、operation は機械の稼働で使う
            """
        ),
        GrammarQuestion(
            id: "q03",
            question: "___ for the timely intervention of the paramedics, the patient would not have survived.",
            choices: ["If it were not", "Had it not been", "Were it not", "If not"],
            correctIndex: 1,
            translation: "「救急隊員の処置がなかったら患者は助からなかっただろう」",
            explanation: """
            ・後半が "would not have survived" → 過去の事実と反対を言う 仮定法過去完了
            ・「もし〜がなかったら(過去)」は If it had not been for ~
            ・フォーマルな書き方では if を省略して語順を倒置 → Had it not been for
            ・現在の話なら Were it not for だが、ここは過去なので不適
            """
        ),
        GrammarQuestion(
            id: "q04",
            question: "The committee's decision was met ___ widespread criticism from the public.",
            choices: ["by", "from", "with", "against"],
            correctIndex: 2,
            translation: "「委員会の決定は世間からの批判を受けた」",
            explanation: """
            ・be met with ~ = 「〜を受ける、〜に直面する」の決まった型
            ・批判・賛同・抵抗・拍手など「反応」を受けるときは必ず with
            ・日本語の「〜と出会う」の「と」に近い感覚
            ・by(行為者)じゃないのは、「批判によって」ではなく「批判と」だから
            """
        ),
        GrammarQuestion(
            id: "q05",
            question: "Researchers have found a strong ___ between sleep deprivation and cognitive decline.",
            choices: ["connection", "correlation", "relation", "association"],
            correctIndex: 1,
            translation: "「睡眠不足と認知機能低下の間に強い相関がある」",
            explanation: """
            ・4つとも「関係」だが用途が違う
            ・correlation = 統計的な相関(数字で示せる関係)。研究・データの専門用語
            ・connection は日常的なつながり、association は心理的な連想
            ・「研究者がデータから発見」という学術的文脈なので correlation が最適
            """
        ),
        GrammarQuestion(
            id: "q06",
            question: "___ his lack of experience, he was appointed as the project leader.",
            choices: ["Despite of", "In spite", "Notwithstanding", "Although"],
            correctIndex: 2,
            translation: "「経験不足にもかかわらず、彼はプロジェクトリーダーに任命された」",
            explanation: """
            ・「〜にもかかわらず」+ 名詞 を表すフォーマル語が Notwithstanding
            ・Despite of は誤り(of は不要)、In spite は of がないと不完全
            ・Although は「主語+動詞」の節を取るので、後ろの "his lack" (名詞) と合わない
            ・後ろが名詞か節かで、使える語が決まる
            """
        ),
        GrammarQuestion(
            id: "q07",
            question: "The findings of the study ___ serious doubt on the previous theory.",
            choices: ["cast", "threw", "made", "put"],
            correctIndex: 0,
            translation: "「研究結果は従来の理論に深刻な疑問を投げかけた」",
            explanation: """
            ・cast doubt on ~ = 「〜に疑問を投げかける」の決まった型
            ・cast は「投げる」の意味だが、過去形も cast(変化なし)
            ・throw doubt も使えるが、書き言葉では cast が標準
            ・make doubt, put doubt とは言わない
            """
        ),
        GrammarQuestion(
            id: "q08",
            question: "Not only ___ the deadline, but he also exceeded all expectations.",
            choices: ["he met", "did he meet", "he did meet", "met he"],
            correctIndex: 1,
            translation: "「彼は締め切りを守っただけでなく、期待をも上回った」",
            explanation: """
            ・Not only...but also... = 「〜だけでなく〜も」
            ・Not only が文頭に来ると否定的な副詞句なので倒置(疑問文の語順)になる
            ・一般動詞 met を倒置するには、do/does/did を借りてくる必要がある
            ・過去のことなので did → did he meet の語順
            """
        ),
        GrammarQuestion(
            id: "q09",
            question: "The professor's argument was so ___ that even his critics had to concede.",
            choices: ["compelling", "compelled", "compulsive", "compulsory"],
            correctIndex: 0,
            translation: "「教授の議論はあまりに説得力があり、批判者でさえ認めざるを得なかった」",
            explanation: """
            ・compelling = 説得力のある、人を引きつける(良い意味)
            ・compelled = 強制された(過去分詞)
            ・compulsive = 強迫的な、抑えられない(病的)
            ・compulsory = 義務的な、強制の(法律やルール) ※全部似た見た目だが意味は別物
            """
        ),
        GrammarQuestion(
            id: "q10",
            question: "___ the rising costs, the project remains economically viable.",
            choices: ["Considering", "Regarding", "Concerning", "Following"],
            correctIndex: 0,
            translation: "「コスト上昇を考慮しても、このプロジェクトは経済的に成立する」",
            explanation: """
            ・Considering ~ = 「〜を考慮すると」(分詞構文の慣用表現)
            ・後半が「それでも成立する」という結論なので、「考慮すれば」が文意に合う
            ・Regarding/Concerning は「〜に関して」(話題の提示)で、文意に合わない
            ・Following は「〜の後で」(時間)
            """
        ),
        GrammarQuestion(
            id: "q11",
            question: "The government has been ___ pressure to address the housing crisis.",
            choices: ["under", "upon", "within", "beneath"],
            correctIndex: 0,
            translation: "「政府は住宅危機に対処するよう圧力を受けている」",
            explanation: """
            ・be under pressure = 「圧力を受けている」の決まった型
            ・圧力という重いものに「下にいる」イメージ → under
            ・be under attack(攻撃を受けている)、be under control(制御されている) も同じ感覚
            ・upon, within, beneath はこの慣用句では使わない
            """
        ),
        GrammarQuestion(
            id: "q12",
            question: "___ I known about the meeting, I would have rearranged my schedule.",
            choices: ["If", "Had", "Should", "Were"],
            correctIndex: 1,
            translation: "「会議のことを知っていたら、スケジュールを調整したのに」",
            explanation: """
            ・後半 "would have rearranged" → 仮定法過去完了
            ・通常は "If I had known" だが、フォーマルな書き方では if を省略して語順倒置
            ・had が前に出て Had I known の形
            ・Should/Were も倒置形だが、それぞれ別の意味の仮定法で使う(時制が合わない)
            """
        ),
        GrammarQuestion(
            id: "q13",
            question: "The data ___ that climate change is accelerating at an unprecedented rate.",
            choices: ["suggests", "implies", "indicates", "All of the above"],
            correctIndex: 3,
            translation: "「データは気候変動が前例ない速度で加速していることを示している」",
            explanation: """
            ・データが何かを「示す」と言うとき、3つとも使える
            ・suggest = 示唆する(やや控えめ)
            ・imply = ほのめかす(間接的に示す)
            ・indicate = 指し示す(明確に示す)
            ・ニュアンスは少し違うが、データを主語にした学術文ではどれも自然
            """
        ),
        GrammarQuestion(
            id: "q14",
            question: "The senator was forced to ___ his earlier statement after the backlash.",
            choices: ["retract", "refrain", "reflect", "refute"],
            correctIndex: 0,
            translation: "「上院議員は反発を受けて以前の発言を撤回せざるを得なかった」",
            explanation: """
            ・retract = (発言・約束を) 撤回する、引っ込める
            ・refrain = 控える(refrain from -ing で「〜するのを控える」)
            ・reflect = 反映する、熟考する
            ・refute = 反論する(自分の発言ではなく相手の主張に反論)
            ・似た re- で始まるが意味は全然違う
            """
        ),
        GrammarQuestion(
            id: "q15",
            question: "___ harder, she might have passed the entrance exam.",
            choices: ["Studied she", "She had studied", "Had she studied", "If she would have studied"],
            correctIndex: 2,
            translation: "「もっと一生懸命勉強していたら、入試に受かっていたかもしれない」",
            explanation: """
            ・後半 "might have passed" → 仮定法過去完了
            ・通常は "If she had studied" → if 省略の倒置で Had she studied
            ・a) Studied she は語順がデタラメ
            ・d) If S would have は標準英語では誤り(would は主節にしか使わない)
            """
        ),
        GrammarQuestion(
            id: "q16",
            question: "The new evidence calls ___ question the validity of the original findings.",
            choices: ["in", "into", "on", "for"],
            correctIndex: 1,
            translation: "「新しい証拠は元の研究結果の妥当性に疑問を投げかける」",
            explanation: """
            ・call ~ into question = 「〜の妥当性を疑う」の決まった型
            ・「疑問の中へ呼び込む」イメージで into
            ・call on = 求める、訪問する
            ・call for = 必要とする、要求する
            ・同じ call でも前置詞で意味が変わる
            """
        ),
        GrammarQuestion(
            id: "q17",
            question: "Such ___ his dedication that he worked through the holidays.",
            choices: ["is", "was", "had been", "it was"],
            correctIndex: 1,
            translation: "「彼の献身ぶりは並外れていて、休日も働き通した」",
            explanation: """
            ・Such was + 名詞 + that... = 「あまりに〜だったので…」の倒置構文
            ・元は "His dedication was such that..." → Such を強調して文頭に出すと was が前に来る
            ・文の後半が "worked"(過去形)なので、時制を合わせて was
            ・This was such a great experience that... の such と同じ用法
            """
        ),
        GrammarQuestion(
            id: "q18",
            question: "The treaty seeks to ___ tensions between the two nations.",
            choices: ["alleviate", "aggravate", "allocate", "accumulate"],
            correctIndex: 0,
            translation: "「その条約は両国間の緊張を緩和することを目指している」",
            explanation: """
            ・alleviate = 緩和する、和らげる(ease と同じ)
            ・aggravate = 悪化させる(まさに正反対！要注意)
            ・allocate = 割り当てる(予算など)
            ・accumulate = 蓄積する
            ・「条約 = 緊張を和らげるためのもの」と意味で考えると alleviate が自然
            """
        ),
        GrammarQuestion(
            id: "q19",
            question: "___ further research is conducted, we cannot draw definitive conclusions.",
            choices: ["Until", "Unless", "Provided that", "As long as"],
            correctIndex: 1,
            translation: "「さらなる研究がなされない限り、決定的な結論は出せない」",
            explanation: """
            ・Unless = if not(〜しない限り)
            ・a) Until だと「研究がなされるまでずっと結論できない」→ 研究後はOKという意味になり不自然
            ・c) Provided that(〜という条件で)、d) As long as(〜である限り) は肯定の条件で文意が逆
            ・「研究なしには無理」という否定の条件を表すのは Unless
            """
        ),
        GrammarQuestion(
            id: "q20",
            question: "The proposal was rejected ___ the grounds that it lacked sufficient evidence.",
            choices: ["in", "on", "by", "for"],
            correctIndex: 1,
            translation: "「その提案は十分な証拠が欠けているという理由で却下された」",
            explanation: """
            ・on the grounds that ~ = 「〜という理由で」の決まった型
            ・grounds は「根拠、理由」の意味(複数形で使う)
            ・「根拠の上に立って判断する」イメージで on
            ・in/by/for では使わない、丸ごと暗記する慣用句
            """
        ),
        GrammarQuestion(
            id: "q22",
            question: "The minister ___ to comment on the ongoing investigation.",
            choices: ["refused", "refrained", "declined", "denied"],
            correctIndex: 2,
            translation: "「大臣は進行中の捜査についてコメントを控えた」",
            explanation: """
            ・decline to do = 「丁重に断る、(コメントを)控える」
            ・refuse は「強く拒否する」で攻撃的なニュアンス → 政治家が公式の場で使うと角が立つ
            ・refrain from -ing は形が違う(to 不定詞は取らない)
            ・deny は「否定する」で「コメントを否定する」では意味が通らない
            """
        ),
        GrammarQuestion(
            id: "q23",
            question: "___ the harsh weather conditions, the climbers reached the summit.",
            choices: ["Although", "Because of", "In spite of", "Owing to"],
            correctIndex: 2,
            translation: "「厳しい天候にもかかわらず、登山者たちは頂上に到達した」",
            explanation: """
            ・In spite of + 名詞 = 「〜にもかかわらず」(despite と同義)
            ・Although は接続詞で、後ろは「主語+動詞」の節 → ここは名詞句なので不可
            ・Because of / Owing to は「〜のために(原因)」で逆の意味
            ・名詞句が続くか節が続くかで使い分ける
            """
        ),
        GrammarQuestion(
            id: "q24",
            question: "Little ___ that his decision would change the course of history.",
            choices: ["he knew", "did he know", "he did know", "knew he"],
            correctIndex: 1,
            translation: "「自分の決断が歴史の流れを変えるとは、彼はほとんど知らなかった」",
            explanation: """
            ・Little が文頭に来ると否定的な意味なので倒置(疑問文の語順)
            ・一般動詞 know なので do/does/did を借りてくる必要がある
            ・過去のことなので did → did he know
            ・Little did I know that... は物語の冒頭で「まさかとは思わなかった」とよく使う
            """
        ),
        GrammarQuestion(
            id: "q25",
            question: "The court ruled that the company was ___ for the damages.",
            choices: ["liable", "reliable", "likable", "viable"],
            correctIndex: 0,
            translation: "「裁判所はその会社が損害について責任を負うと判決した」",
            explanation: """
            ・liable for ~ = 「〜について法的責任がある」(法律用語)
            ・reliable = 信頼できる(全く別の意味)
            ・likable = 好感の持てる
            ・viable = 実現可能な
            ・似たスペルだが意味は完全に別物。法律の文脈なら liable
            """
        ),
        GrammarQuestion(
            id: "q26",
            question: "The new evidence ___ the defendant's claim of innocence.",
            choices: ["supports", "substantiates", "sustains", "suspends"],
            correctIndex: 1,
            translation: "「新しい証拠は被告の無罪主張を裏付ける」",
            explanation: """
            ・substantiate = (証拠で)裏付ける、立証する(法律・学術で頻出)
            ・support は「支持する」で意味は近いが弱い。証拠が「立証」するなら substantiate
            ・sustain = 支え続ける、被る(損害を)
            ・suspend = 一時停止する
            ・「証拠が主張を裏付ける」の決まった言い回し
            """
        ),
        GrammarQuestion(
            id: "q27",
            question: "The researcher's findings ___ light on a previously misunderstood phenomenon.",
            choices: ["cast", "put", "shed", "gave"],
            correctIndex: 2,
            translation: "「研究者の発見は、以前は誤解されていた現象に光を当てた」",
            explanation: """
            ・shed light on ~ = 「〜を解明する、明らかにする」の決まった型
            ・shed は「(光や涙を)流す、注ぐ」の意味、過去形も shed(変化なし)
            ・cast/put/give light という言い方はない
            ・「光を当てる」=「明らかにする」の比喩。研究や調査の文脈で頻出
            """
        ),
        GrammarQuestion(
            id: "q28",
            question: "The two theories are not mutually ___; both can be true simultaneously.",
            choices: ["excluding", "exclusive", "excluded", "exclusion"],
            correctIndex: 1,
            translation: "「2つの理論は相互排他的ではなく、両方が同時に真でありうる」",
            explanation: """
            ・mutually exclusive = 「相互排他的な」(片方が真ならもう片方は偽)の決まった型
            ・数学・論理学・統計でよく使う専門用語
            ・excluding = 〜を除いて(前置詞)
            ・excluded = 除外された(過去分詞)
            ・exclusion = 名詞「除外」
            ・mutually(副詞) + 形容詞 の形なので b
            """
        ),
        GrammarQuestion(
            id: "q29",
            question: "The CEO emphasized the need to ___ a culture of innovation.",
            choices: ["foster", "foster up", "raise", "breed"],
            correctIndex: 0,
            translation: "「CEOはイノベーション文化を育む必要性を強調した」",
            explanation: """
            ・foster = (考え・関係・文化などを)育む、促進する
            ・foster は単独で他動詞、up は不要
            ・raise は「子供を育てる」「資金を集める」で文化には使わない
            ・breed は「動物を繁殖させる」で人間社会の文化には不自然
            ・foster a culture / foster relationships は定番のコロケーション
            """
        ),
        GrammarQuestion(
            id: "q30",
            question: "___ in the 19th century, this technique is still used today.",
            choices: ["Developing", "Developed", "Having developed", "Develop"],
            correctIndex: 1,
            translation: "「19世紀に開発されたこの技術は、今日でも使われている」",
            explanation: """
            ・主語 this technique は「開発される側」 → 受動の意味なので 過去分詞 Developed
            ・Developing(現在分詞)だと「開発している」になり、技術が自分で開発する意味で不自然
            ・Having developed は完了の能動 → これも「自分で開発した」意味
            ・分詞構文では、主語との関係(する側か、される側か)で現在分詞か過去分詞かを決める
            """
        ),
        GrammarQuestion(
            id: "q31",
            question: "The economy is showing signs of ___ after years of recession.",
            choices: ["recovery", "recover", "recovering", "recovered"],
            correctIndex: 0,
            translation: "「経済は長年の不況の後、回復の兆しを見せている」",
            explanation: """
            ・前置詞 of の後ろは名詞または動名詞 → recover(動詞原形)は不可
            ・signs of + 名詞 のコロケーション → recovery(名詞)が自然
            ・signs of recovering(動名詞)も文法的にはOKだが、決まった言い回しでは recovery
            ・「兆候」を表すときは sign of + 名詞形を覚える
            """
        ),
        GrammarQuestion(
            id: "q32",
            question: "The proposal was ___ rejected by the board members.",
            choices: ["unanimous", "unanimously", "unanimity", "unanimousness"],
            correctIndex: 1,
            translation: "「その提案は理事会メンバーによって満場一致で却下された」",
            explanation: """
            ・動詞 rejected(過去分詞) を修飾するので副詞 → unanimously
            ・unanimous = 形容詞「満場一致の」
            ・unanimity = 名詞「満場一致」
            ・d) unanimousness はそもそも単語として一般的でない
            ・動詞を修飾する → 副詞(-ly) というルールの基本問題
            """
        ),
        GrammarQuestion(
            id: "q33",
            question: "The findings have far-reaching ___ for public policy.",
            choices: ["effects", "affects", "implications", "influences"],
            correctIndex: 2,
            translation: "「その発見は公共政策に対して広範な意味合いを持つ」",
            explanation: """
            ・implications = (将来的な)影響、含意、意味合い(まだ起きていない、潜在的な影響)
            ・effects は「実際に起きた結果」で、未来の話には少しずれる
            ・affects は動詞(影響を与える)で名詞ではない → 文法的に不可
            ・influences は「(人や物の)影響力」でやや弱い
            ・far-reaching implications は学術論文で頻出のコロケーション
            """
        ),
        GrammarQuestion(
            id: "q34",
            question: "Scarcely ___ the door when the phone started ringing.",
            choices: ["I had closed", "had I closed", "I closed", "did I close"],
            correctIndex: 1,
            translation: "「ドアを閉めるやいなや電話が鳴り始めた」",
            explanation: """
            ・Scarcely...when... = 「〜するやいなや」(Hardly...when... と同じ)
            ・Scarcely が文頭にある否定語なので倒置 → 助動詞 had が前に出る
            ・「閉めた」のは「鳴り始めた」より前 → 過去完了 had + 過去分詞
            ・closed → had I closed の語順になる
            """
        ),
        GrammarQuestion(
            id: "q35",
            question: "The committee ___ the proposal at length before reaching a decision.",
            choices: ["discussed about", "discussed", "discussed on", "discussed over"],
            correctIndex: 1,
            translation: "「委員会は決定に至る前に提案を長時間議論した」",
            explanation: """
            ・discuss は他動詞 → 直接目的語を取る、前置詞は不要
            ・日本語の「〜について議論する」につられて about を付けるのは典型的なミス
            ・"talk about ~" は◯ だが "discuss about ~" は ✗
            ・mention/marry/enter/reach なども同様に前置詞を付けない他動詞
            """
        ),
        GrammarQuestion(
            id: "q36",
            question: "Under no circumstances ___ enter the restricted area.",
            choices: ["you should", "should you", "you must", "you can"],
            correctIndex: 1,
            translation: "「いかなる状況でも、その制限区域に立ち入ってはならない」",
            explanation: """
            ・Under no circumstances が文頭に来ると否定語句なので倒置
            ・助動詞(should/must/will/can)が主語の前に出る → should you
            ・a) c) d) は語順が普通のままで倒置していない → 文法的に誤り
            ・警告・注意書きでよく見る構文。「決して〜してはいけない」を強調
            """
        ),
        GrammarQuestion(
            id: "q37",
            question: "The decline in sales can be ___ to the recent economic downturn.",
            choices: ["attributed", "contributed", "distributed", "substituted"],
            correctIndex: 0,
            translation: "「売上の減少は最近の景気後退に起因すると考えられる」",
            explanation: """
            ・be attributed to ~ = 「〜のせいだとされる、〜に起因する」(原因を示す決まった型)
            ・contributed to は「〜に貢献する」で正反対の意味
            ・distributed は「配布される」
            ・substituted は「置き換えられる」
            ・似た -bute 系の単語だが意味は全く違う
            """
        ),
        GrammarQuestion(
            id: "q38",
            question: "The professor advised us to ___ from making hasty conclusions.",
            choices: ["avoid", "prevent", "refrain", "decline"],
            correctIndex: 2,
            translation: "「教授は早急な結論を出すのを控えるよう私たちに助言した」",
            explanation: """
            ・refrain from -ing = 「〜することを控える」の決まった型
            ・avoid は前置詞 from を取らない → "avoid making" なら正しい
            ・prevent は「prevent A from -ing」(AがBするのを防ぐ)で構文が違う
            ・decline は to 不定詞を取る(decline to do)
            ・各動詞で取る前置詞・形が決まっているので注意
            """
        ),
        GrammarQuestion(
            id: "q39",
            question: "The new policy will have a ___ impact on small businesses.",
            choices: ["profound", "profuse", "prosperous", "prolonged"],
            correctIndex: 0,
            translation: "「新しい方針は中小企業に深刻な影響を与えるだろう」",
            explanation: """
            ・profound impact = 「深刻な/重大な影響」の定番コロケーション
            ・profuse = 大量の(汗・お礼など)
            ・prosperous = 繁栄している(国・ビジネス)
            ・prolonged = 長引いた(期間)
            ・似た pro- で始まるが、impact と組み合わさるのは profound のみ
            """
        ),
        GrammarQuestion(
            id: "q40",
            question: "The conclusions of the report were ___ with the government's official stance.",
            choices: ["consistent", "at odds", "compatible", "in line"],
            correctIndex: 1,
            translation: "「報告書の結論は政府の公式見解と食い違っていた」",
            explanation: """
            ・at odds with ~ = 「〜と対立して、食い違って」の決まった型
            ・consistent with / compatible with / in line with はすべて「〜と一致している」で逆の意味
            ・文の「However や対比」のヒントがなくても、文脈で対立か一致かを読み取る
            ・odds は「対立、不一致」の意味で複数形で使う
            """
        ),
        GrammarQuestion(
            id: "q41",
            question: "___ harder, you would have caught the train.",
            choices: ["If you ran", "Should you run", "Had you run", "Were you to run"],
            correctIndex: 2,
            translation: "「もっと早く走っていたら、電車に間に合っただろう」",
            explanation: """
            ・後半 "would have caught" → 過去の事実と反対を言う仮定法過去完了
            ・通常は "If you had run" → if 省略の倒置で Had you run
            ・a) If you ran は仮定法過去で、後半の時制と合わない
            ・d) Were you to run は未来のことを仮定する形
            """
        ),
        GrammarQuestion(
            id: "q42",
            question: "The decision rests ___ the board of directors.",
            choices: ["on", "at", "with", "for"],
            correctIndex: 2,
            translation: "「その決定は取締役会次第である」",
            explanation: """
            ・rest with ~ = 「(決定・責任が)〜にある、〜次第である」の決まった型
            ・「決定権は誰の手にあるか」を表す慣用表現
            ・rest on は「〜に基づく、〜にかかっている(物理的・抽象的支え)」で別の意味
            ・It rests with you to decide. のように責任の所在を示すときに使う
            """
        ),
        GrammarQuestion(
            id: "q43",
            question: "The new manager is keen ___ improving team morale.",
            choices: ["to", "on", "for", "about"],
            correctIndex: 1,
            translation: "「新しいマネージャーはチームの士気向上に熱心だ」",
            explanation: """
            ・be keen on -ing = 「〜することに熱心である」
            ・be keen + to不定詞 も使えるが「-ing」のときは必ず on
            ・be interested in と同じ感覚で in の代わりに on を取る
            ・be fond of -ing(好き)、be good at -ing(得意)など、形容詞ごとに前置詞が決まっている
            """
        ),
        GrammarQuestion(
            id: "q44",
            question: "The teacher made the students ___ the essay again.",
            choices: ["to write", "writing", "write", "written"],
            correctIndex: 2,
            translation: "「先生は生徒たちにエッセイをもう一度書かせた」",
            explanation: """
            ・make + 人 + 動詞原形 = 「(人に)〜させる」(使役動詞)
            ・make/let/have の使役動詞は to を付けない動詞原形を取る
            ・受動態にするときだけ to が復活する → "were made to write"
            ・同じ「させる」でも force/get は to 不定詞を取る(force them to write)
            """
        ),
        GrammarQuestion(
            id: "q45",
            question: "___ as he is, he never boasts about his achievements.",
            choices: ["Successful", "Successful though", "Although successful", "Despite successful"],
            correctIndex: 1,
            translation: "「彼は成功しているが、自分の業績を自慢することはない」",
            explanation: """
            ・形容詞 + though + S + V = 「〜だけれども」の倒置構文(古風だがフォーマル)
            ・通常の "Though he is successful" を "Successful though he is" と倒置
            ・as でも同じ構文が可能 → "Successful as he is"
            ・c) は語順が違う(Although + S + V が普通)
            ・d) Despite は名詞が後ろに来る前置詞、形容詞単独は不可
            """
        ),
        GrammarQuestion(
            id: "q46",
            question: "The new evidence brought ___ a major shift in public opinion.",
            choices: ["up", "on", "about", "out"],
            correctIndex: 2,
            translation: "「新しい証拠が世論の大きな変化を引き起こした」",
            explanation: """
            ・bring about ~ = 「〜を引き起こす、もたらす」(変化・結果の発生)
            ・bring up は「(子供を)育てる、(話題を)持ち出す」
            ・bring on は「(病気・トラブルを)招く」(やや否定的)
            ・bring out は「(性質を)引き出す、出版する」
            ・同じ bring でも前置詞で意味が大きく変わる典型例
            """
        ),
        GrammarQuestion(
            id: "q47",
            question: "The report needs ___ before the deadline.",
            choices: ["finishing", "to finish", "to be finished", "being finished"],
            correctIndex: 2,
            translation: "「その報告書は締め切り前に完成させる必要がある」",
            explanation: """
            ・主語 the report は「完成させられる側」 → 受動の意味が必要
            ・need + to be 過去分詞 = 「〜される必要がある」
            ・実は a) finishing も正解とされる(need + -ing で受動の意味になる特殊用法)
            ・ただし4択の中で文法的に明確に正しいのは c) to be finished
            ・"The report needs finishing." も口語では使うが、書き言葉なら c が安全
            """
        ),
        GrammarQuestion(
            id: "q48",
            question: "She is ___ than her sister.",
            choices: ["more taller", "more tall", "taller", "tallest"],
            correctIndex: 2,
            translation: "「彼女は姉(妹)より背が高い」",
            explanation: """
            ・1音節の短い形容詞(tall, big, fast など)は -er を付けて比較級
            ・2音節以上の長い形容詞(beautiful, important など)は more を前に置く
            ・比較級に more と -er を両方付けるのは誤り(二重比較級)
            ・than があるので比較級が必要 → 最上級の tallest は不可
            """
        ),
        GrammarQuestion(
            id: "q49",
            question: "He ran fast ___ catch up with the others.",
            choices: ["for", "so as to", "so that", "in order"],
            correctIndex: 1,
            translation: "「彼は他の人に追いつくために速く走った」",
            explanation: """
            ・so as to + 動詞原形 = 「〜するために」(目的)
            ・in order to + 動詞原形 も同じ意味だが、in order だけでは不完全
            ・so that は「主語+動詞」の節を取る → "so that he could catch up"
            ・for + 動名詞(for catching up)も理論上可能だが、目的を表すなら so as to が標準
            """
        ),
        GrammarQuestion(
            id: "q50",
            question: "The weather was ___ that we had to cancel the picnic.",
            choices: ["so bad", "such bad", "too bad", "very bad"],
            correctIndex: 0,
            translation: "「天気がとても悪かったので、ピクニックを中止せざるを得なかった」",
            explanation: """
            ・so + 形容詞 + that + 結果 = 「あまりに〜なので…」
            ・such を使うなら "such bad weather that..."(such + 形容詞 + 名詞 + that)
            ・too bad だと「残念だ」の意味になる、または「〜すぎて…できない」の構文(too...to)
            ・very bad は強調するだけで that 節と結びつかない
            """
        ),
        GrammarQuestion(
            id: "q51",
            question: "The minister was accused ___ misusing public funds.",
            choices: ["for", "with", "of", "about"],
            correctIndex: 2,
            translation: "「大臣は公金を不正に使用したとして非難された」",
            explanation: """
            ・be accused of -ing = 「〜したとして非難される/告発される」
            ・罪・非難の内容を示すときは of
            ・似た blame は "blame A for B"(A をBで責める)で前置詞が違う
            ・be guilty of, be suspected of, be convicted of も同じく of を取る(罪の内容)
            """
        ),
        GrammarQuestion(
            id: "q52",
            question: "___ surprised me most was his calm reaction.",
            choices: ["That", "It", "What", "Which"],
            correctIndex: 2,
            translation: "「私を最も驚かせたのは、彼の冷静な反応だった」",
            explanation: """
            ・What = 「〜こと/もの」(先行詞を含む関係代名詞)
            ・主語の位置で「〜こと」を表すには What を使う
            ・That は接続詞では使えるが、ここでは主語にならない
            ・It は形式主語で使えるが、後ろの構造が違う(It was his calm reaction that surprised me most.)
            ・Which は先行詞が必要
            """
        ),
        GrammarQuestion(
            id: "q53",
            question: "The boss had me ___ overtime last night.",
            choices: ["to work", "worked", "work", "working"],
            correctIndex: 2,
            translation: "「上司は昨夜、私に残業させた」",
            explanation: """
            ・have + 人 + 動詞原形 = 「(人に)〜させる、〜してもらう」(使役動詞)
            ・make/let/have は to なしの動詞原形を取る
            ・have + 物 + 過去分詞 なら "have my hair cut"(髪を切ってもらう)で形が違う
            ・working(現在分詞)を使うと「〜している状態にしておく」の意味で文意が変わる
            """
        ),
        GrammarQuestion(
            id: "q54",
            question: "We had no choice ___ accept their offer.",
            choices: ["but to", "but", "than", "than to"],
            correctIndex: 0,
            translation: "「私たちは彼らの申し出を受け入れる以外に選択肢がなかった」",
            explanation: """
            ・have no choice but to + 動詞原形 = 「〜する以外に選択肢がない」の決まった型
            ・but は「〜以外」の意味で、後ろに to 不定詞を取るのが正解
            ・"no choice but" だけで動詞原形を直接取らない
            ・"no choice than" は誤り。比較の than ではない
            """
        ),
        GrammarQuestion(
            id: "q55",
            question: "The book is well worth ___.",
            choices: ["to read", "reading", "read", "being read"],
            correctIndex: 1,
            translation: "「その本は読む価値が十分にある」",
            explanation: """
            ・be worth + -ing = 「〜する価値がある」の決まった型
            ・worth は形容詞だが、後ろは必ず動名詞(-ing)
            ・主語が「読まれる側」だが、worth + -ing は能動の形のまま受動の意味を表す特殊な用法
            ・"be worth being read" は使わない(冗長で誤り)
            ・This place is worth visiting. なども同じパターン
            """
        ),
        GrammarQuestion(
            id: "q56",
            question: "___ leaving the office, he realized he had forgotten his keys.",
            choices: ["On", "At", "In", "By"],
            correctIndex: 0,
            translation: "「オフィスを出るとき、彼は鍵を忘れたことに気づいた」",
            explanation: """
            ・On + -ing = 「〜するとすぐに、〜するときに」(同時または直後の動作)
            ・= "When he was leaving the office..." と同じ意味
            ・フォーマルな書き言葉でよく使われる構文
            ・At/In/By + 動名詞ではこの意味にならない
            ・Upon + -ing も同じ意味で使える(より固い表現)
            """
        ),
        GrammarQuestion(
            id: "q57",
            question: "I'd rather you ___ tell anyone about this.",
            choices: ["don't", "won't", "didn't", "wouldn't"],
            correctIndex: 2,
            translation: "「あなたにこのことを誰にも話してほしくない」",
            explanation: """
            ・would rather + 主語 + 過去形 = 「(主語に)〜してほしい/してほしくない」(仮定法)
            ・現在の希望でも過去形を使うのが特徴(仮定法のルール)
            ・"I'd rather + 動詞原形"(I'd rather not tell)は「自分が」したくない場合
            ・主語が変わる(you)ときは過去形(didn't)を取る
            ・I wish you didn't... と同じ感覚
            """
        ),
        GrammarQuestion(
            id: "q58",
            question: "The teacher insisted that the student ___ the assignment immediately.",
            choices: ["submits", "submit", "submitted", "would submit"],
            correctIndex: 1,
            translation: "「先生は生徒がすぐに課題を提出することを強く求めた」",
            explanation: """
            ・insist that + 主語 + 動詞原形 = 「〜するよう強く求める」(仮定法現在)
            ・提案・要求・主張の動詞(insist/suggest/demand/recommend/propose)は that 節で動詞原形を取る
            ・主語が三人称単数(the student)でも -s を付けない
            ・イギリス英語では "should submit" の形も使う
            ・※ insist が「主張する(事実)」の意味なら通常の時制でOK(He insisted that he was right.)
            """
        ),
        GrammarQuestion(
            id: "q59",
            question: "___ is no point in arguing with him.",
            choices: ["That", "It", "There", "This"],
            correctIndex: 2,
            translation: "「彼と議論しても意味がない」",
            explanation: """
            ・There is no point in -ing = 「〜しても意味がない」の決まった型
            ・There is(was)で「〜が存在する/ない」を表す存在文
            ・It is no point は誤り。It is no use -ing(〜しても無駄)とは混同しないこと
            ・"There's no point in worrying."(心配しても仕方ない)など日常会話でも頻出
            """
        ),
        GrammarQuestion(
            id: "q60",
            question: "The harder he tried, ___ he became.",
            choices: ["the frustrated", "more frustrated", "the more frustrated", "the frustrating"],
            correctIndex: 2,
            translation: "「努力すればするほど、彼はますます苛立つようになった」",
            explanation: """
            ・The 比較級..., the 比較級... = 「〜すればするほど〜」の構文
            ・後半も必ず "the + 比較級" の形にする → the more frustrated
            ・frustrated(苛立った)は2音節以上なので more を付けて比較級
            ・frustrating(イライラさせる)は感情を引き起こす側 → 主語(he)が「苛立つ側」なので frustrated が正しい
            ・The more, the better.(多ければ多いほど良い)が最もシンプルな例
            """
        ),
        GrammarQuestion(
            id: "q61",
            question: "It is imperative that every employee ___ the new safety guidelines.",
            choices: ["follows", "follow", "followed", "is following"],
            correctIndex: 1,
            translation: "「全従業員が新しい安全規則に従うことが極めて重要だ」",
            explanation: """
            ・It is essential / imperative / necessary that + S + 動詞原形 = 仮定法現在
            ・要求・必要性・提案を表す形容詞の後の that 節では、主語が三人称単数でも -s を付けない
            ・insist/suggest/demand/recommend などの動詞でも同じルール
            ・イギリス英語では "should follow" の形も使う
            """
        ),
        GrammarQuestion(
            id: "q62",
            question: "The man ___ by the window is our new manager.",
            choices: ["stand", "stood", "standing", "was standing"],
            correctIndex: 2,
            translation: "「窓のそばに立っている男性が私たちの新しいマネージャーだ」",
            explanation: """
            ・短縮関係詞節 (reduced relative clause)
            ・元の文 "The man who is standing by the window..." から who is を省略した形
            ・能動の意味なら現在分詞 (-ing)、受動の意味なら過去分詞
            ・書き言葉でよく見る省略パターン。文を簡潔にする効果がある
            """
        ),
        GrammarQuestion(
            id: "q63",
            question: "The bridge ___ in 1890 is still in use today.",
            choices: ["building", "builds", "built", "was built"],
            correctIndex: 2,
            translation: "「1890年に建設されたその橋は今日もなお使われている」",
            explanation: """
            ・短縮関係詞節の受動バージョン
            ・元の文 "The bridge which was built in 1890..." から which was を省略
            ・主語 the bridge は「建設される側」 → 受動 → 過去分詞 built
            ・問題62と同じ構文だが、能動か受動かで分詞が変わる点を区別
            """
        ),
        GrammarQuestion(
            id: "q64",
            question: "___ was John who broke the window, not Mary.",
            choices: ["That", "It", "There", "This"],
            correctIndex: 1,
            translation: "「窓を割ったのはジョンだ、メアリーじゃない」",
            explanation: """
            ・It is/was X that ~ = 強調構文 (cleft sentence)
            ・元の文 "John broke the window" の John を強調するために It was と that で挟む
            ・強調する部分が人なら that の代わりに who も使える(It was John who broke...)
            ・「他の誰かじゃなくて〜なんだ」と特定したいときの定番表現
            """
        ),
        GrammarQuestion(
            id: "q65",
            question: "Only after the meeting ended ___ the seriousness of the situation.",
            choices: ["we realized", "did we realize", "we did realize", "realize we"],
            correctIndex: 1,
            translation: "「会議が終わってからやっと、私たちは事態の深刻さに気づいた」",
            explanation: """
            ・Only + 副詞句が文頭 に来ると倒置(疑問文の語順)
            ・一般動詞 realize なので do/does/did を借りてくる必要がある
            ・過去のことなので did → did we realize
            ・Only after / Only when / Only by はすべて同じ倒置パターン
            """
        ),
        GrammarQuestion(
            id: "q66",
            question: "Never ___ such a breathtaking view before.",
            choices: ["I have seen", "have I seen", "I had seen", "did I see"],
            correctIndex: 1,
            translation: "「こんなに息を呑むような景色は今まで見たことがない」",
            explanation: """
            ・Never が文頭の否定語句として倒置を引き起こす
            ・"before" があるので「今までに」の意味 → 経験を表す現在完了形が自然
            ・助動詞 have が主語の前に出る → have I seen
            ・Never have I... は劇的な強調表現で、感動を伝えるときに使う
            """
        ),
        GrammarQuestion(
            id: "q67",
            question: "___ for your help, I would never have finished on time.",
            choices: ["Without", "Except", "But for", "Apart from"],
            correctIndex: 2,
            translation: "「あなたの助けがなかったら、時間通りに終えられなかっただろう」",
            explanation: """
            ・But for ~ = 「もし〜がなかったら」(=Without)
            ・後半の "would never have finished" が仮定法過去完了 → 過去の事実と反対の仮定
            ・Without でも文法的にはOK だが、選択肢にあれば But for が IELTS で問われやすい
            ・"But for the rain, we would have gone hiking." のようにフォーマルに使う
            """
        ),
        GrammarQuestion(
            id: "q68",
            question: "Neither he nor his colleagues ___ aware of the new policy.",
            choices: ["is", "were", "was", "has been"],
            correctIndex: 1,
            translation: "「彼も彼の同僚たちも新しい方針について知らなかった」",
            explanation: """
            ・Neither A nor B / Either A or B では、動詞は B(後ろ側) に合わせる
            ・B = his colleagues(複数) → 動詞は were
            ・もし語順が "Neither his colleagues nor he" だったら → was(he に合わせる)
            ・主語と動詞の一致(subject-verb agreement)の応用ルール
            """
        ),
        GrammarQuestion(
            id: "q69",
            question: "The committee will decide ___ to approve the proposal or not.",
            choices: ["if", "whether", "that", "what"],
            correctIndex: 1,
            translation: "「委員会は提案を承認するかどうかを決定する」",
            explanation: """
            ・whether + to不定詞 = 「〜するかどうか」(if は to不定詞と一緒に使えない)
            ・"decide if to approve" は文法的に誤り
            ・whether は or not と組み合わせて使える(whether...or not)
            ・動詞 decide / wonder / consider の後では whether が標準
            """
        ),
        GrammarQuestion(
            id: "q70",
            question: "He talks ___ he knew everything about the subject.",
            choices: ["like", "as if", "so that", "such as"],
            correctIndex: 1,
            translation: "「彼はその話題について何でも知っているかのように話す」",
            explanation: """
            ・as if / as though = 「まるで〜かのように」
            ・事実と異なることを言うときは仮定法 → 後ろは過去形 (knew)
            ・実際は「全部は知らない」という事実への反対 → 仮定法過去
            ・口語では like も使うが、フォーマルなライティングでは as if が標準
            """
        ),
        GrammarQuestion(
            id: "q71",
            question: "Suppose you ___ the lottery, how would you spend the money?",
            choices: ["win", "won", "will win", "would win"],
            correctIndex: 1,
            translation: "「もし宝くじに当たったら、お金をどう使う?」",
            explanation: """
            ・Suppose / Supposing = If と同じ意味で条件を導く
            ・後半 "how would you spend" が仮定法過去 → 前半も過去形 won
            ・現実にはまだ起きていないことを仮定するので、現在形ではなく過去形を使うのがポイント
            ・会話で「もし〜だったら?」と聞きたいときの自然な表現
            """
        ),
        GrammarQuestion(
            id: "q72",
            question: "It's high time we ___ this old computer.",
            choices: ["replace", "are replacing", "replaced", "had replaced"],
            correctIndex: 2,
            translation: "「もうこの古いパソコンを買い替える時期だ」",
            explanation: """
            ・It's (high) time + S + 過去形 = 「もう〜してもいい頃だ」(まだしていないことへの催促)
            ・仮定法の特殊な使い方で、現在の話なのに過去形を使う
            ・"It's about time" もほぼ同じ意味
            ・過去完了 had replaced は「もうとっくに〜しているべきだった」という更に強い催促
            """
        ),
        GrammarQuestion(
            id: "q73",
            question: "You ___ better leave now, or you'll miss the bus.",
            choices: ["had", "have", "would", "should"],
            correctIndex: 0,
            translation: "「今すぐ出発した方がいい、さもないとバスを逃す」",
            explanation: """
            ・had better + 動詞原形 = 「〜した方がいい」(警告・忠告のニュアンス)
            ・should より強く、「そうしないと困るぞ」という含みがある
            ・短縮形 'd better で会話でよく使う(You'd better hurry.)
            ・否定形は had better not + 動詞原形(not の位置に注意)
            """
        ),
        GrammarQuestion(
            id: "q74",
            question: "By the time the rescue team arrived, the climbers ___ for over six hours.",
            choices: ["waited", "had waited", "had been waiting", "were waiting"],
            correctIndex: 2,
            translation: "「救助隊が到着したときには、登山者たちは6時間以上も待ち続けていた」",
            explanation: """
            ・過去のある時点(救助到着)までの 継続 を表す → 過去完了進行形 had been + -ing
            ・"for over six hours" という期間表現が継続のヒント
            ・過去完了 had waited でも通じるが、「待ち続けていた」の継続感は進行形の方が強い
            ・現在完了進行形(have been -ing)の過去版と覚える
            """
        ),
        GrammarQuestion(
            id: "q75",
            question: "This time tomorrow, I ___ on a beach in Okinawa.",
            choices: ["will lie", "will be lying", "am lying", "lie"],
            correctIndex: 1,
            translation: "「明日の今頃、私は沖縄のビーチで横になっているだろう」",
            explanation: """
            ・未来進行形 will be + -ing = 未来のある時点で進行中の動作
            ・"This time tomorrow / At 3 p.m. tomorrow" のように特定の未来時点が示される
            ・will lie だと「横になる」という動作の発生だけを示し、進行のニュアンスがない
            ・「未来のあのとき、こんなことしてるだろうな」と想像するときの構文
            """
        ),
        GrammarQuestion(
            id: "q76",
            question: "He ___ at the meeting now; his car is in the parking lot.",
            choices: ["might be", "must be", "should be", "could have been"],
            correctIndex: 1,
            translation: "「彼は今会議に出ているに違いない、車が駐車場にあるから」",
            explanation: """
            ・must be + 場所/-ing = 現在の状況からの 強い推量「〜しているに違いない」
            ・状況証拠(車がある)から確信を持って推測している → must
            ・might be は「かもしれない(弱い推量)」、should be は「〜のはず(期待)」
            ・could have been は過去の可能性で時制が合わない
            """
        ),
        GrammarQuestion(
            id: "q77",
            question: "I'm getting my car ___ next week.",
            choices: ["repair", "repaired", "repairing", "to repair"],
            correctIndex: 1,
            translation: "「来週、車を修理してもらう予定だ」",
            explanation: """
            ・get + 物 + 過去分詞 = 「〜してもらう」(have と同じ意味で口語的)
            ・物 (my car) は「修理される側」 → 過去分詞 repaired
            ・have my car repaired と get my car repaired はほぼ同じ意味
            ・get の方がカジュアル、have は中立的
            """
        ),
        GrammarQuestion(
            id: "q78",
            question: "Could you tell me ___ ?",
            choices: ["where is the post office", "where the post office is", "where does the post office is", "is where the post office"],
            correctIndex: 1,
            translation: "「郵便局はどこか教えてもらえますか?」",
            explanation: """
            ・間接疑問文 では、疑問文の語順を 平叙文の語順 に戻す
            ・直接 "Where is the post office?" → 間接 "where the post office is"(主語+動詞)
            ・Could you tell me / Do you know / I wonder などの後ろは間接疑問文
            ・日本人がよく間違えるポイント。is/does の位置に注意
            """
        ),
        GrammarQuestion(
            id: "q79",
            question: "So beautiful ___ the painting that everyone stopped to admire it.",
            choices: ["was", "it was", "it is", "did it be"],
            correctIndex: 0,
            translation: "「その絵はあまりに美しかったので、誰もが立ち止まって見とれた」",
            explanation: """
            ・So + 形容詞 + 倒置 + that... = 「あまりに〜なので…」の強調構文
            ・普通の "The painting was so beautiful that..." の so beautiful を文頭に出すと倒置
            ・be動詞が主語の前に出る → was the painting の語順
            ・Such was + 名詞 + that... と並ぶフォーマルな強調表現
            """
        ),
        GrammarQuestion(
            id: "q80",
            question: "I saw the thief ___ out of the window and disappear into the crowd.",
            choices: ["jump", "jumped", "to jump", "jumps"],
            correctIndex: 0,
            translation: "「私はその泥棒が窓から飛び降り、群衆の中に消えるのを見た」",
            explanation: """
            ・知覚動詞 (see/hear/watch/feel) + 目的語 + 動詞原形 = 動作の最初から最後まで全体を見る
            ・to不定詞は使わない(知覚動詞のルール)
            ・-ing 形を使うと「進行中の一部を見た」というニュアンスに変わる(see him jumping = 飛んでいる途中を見た)
            ・"and disappear" と動詞原形が並列されているので、jump も同じ形が自然
            """
        ),
        GrammarQuestion(
            id: "q82",
            question: "The data must be interpreted ___ caution.",
            choices: ["in", "by", "with", "on"],
            correctIndex: 2,
            translation: "「そのデータは慎重に解釈されなければならない」",
            explanation: """
            ・with caution / with care / with confidence = 「〜を持って、〜に」(様態を表す with)
            ・「慎重さを伴って」というイメージ
            ・handle with care(取り扱い注意)も同じパターン
            ・in/by/on ではこの意味にならない
            """
        ),
        GrammarQuestion(
            id: "q83",
            question: "The new policy aims ___ reducing inequality.",
            choices: ["to", "at", "for", "on"],
            correctIndex: 1,
            translation: "「新しい方針は不平等の削減を目指している」",
            explanation: """
            ・aim at + 動名詞 = 「〜することを目指す」
            ・aim + to不定詞 (aim to reduce) も正しいが、-ing が来るときは at
            ・"be aimed at -ing" の受動形でも at を使う
            ・矢を「的に向ける(at)」イメージで覚える
            """
        ),
        GrammarQuestion(
            id: "q84",
            question: "He spoke so quietly that I could ___ hear him.",
            choices: ["almost", "hardly", "nearly", "mostly"],
            correctIndex: 1,
            translation: "「彼があまりに静かに話したので、ほとんど聞き取れなかった」",
            explanation: """
            ・hardly = 「ほとんど〜ない」(否定の意味を含む副詞)
            ・"I could hardly hear" = 聞き取れない状態に近い
            ・almost/nearly は「もう少しで〜する」(肯定的)で意味が逆
            ・hardly の文には not を付けない(二重否定になる)
            """
        ),
        GrammarQuestion(
            id: "q85",
            question: "The teacher explained the rule ___ that everyone could understand.",
            choices: ["so", "such", "in such a way", "in a such way"],
            correctIndex: 2,
            translation: "「先生は誰もが理解できるような形でそのルールを説明した」",
            explanation: """
            ・in such a way that ~ = 「〜するような方法で」の決まった型
            ・語順は in + such + a + 形容詞(なし) + way + that
            ・d) in a such way は語順が誤り(such が a の後ろには来ない)
            ・so + 形容詞 + that の構文とは別物。手段・方法を表すときに使う
            """
        ),
        GrammarQuestion(
            id: "q86",
            question: "The proposal was rejected, ___ was disappointing for the team.",
            choices: ["that", "what", "it", "which"],
            correctIndex: 3,
            translation: "「提案は却下され、それはチームにとって残念なことだった」",
            explanation: """
            ・非制限用法の関係代名詞 which = 前の文全体を受ける
            ・「提案が却下されたこと」全体を受けて「それは残念だった」と続ける
            ・that は非制限用法では使えない(コンマの後は which)
            ・what は先行詞を含むので、ここでは構造的に合わない
            """
        ),
        GrammarQuestion(
            id: "q87",
            question: "___ the truth, I would have told you.",
            choices: ["If I knew", "Did I know", "Had I known", "Knowing"],
            correctIndex: 2,
            translation: "「真実を知っていたら、あなたに話していただろう」",
            explanation: """
            ・後半 "would have told" → 仮定法過去完了
            ・通常は "If I had known" → if 省略の倒置で Had I known
            ・a) If I knew は仮定法過去で、後半の時制と合わない
            ・倒置パターンは IELTS Writing でフォーマルさを出す定番テクニック
            """
        ),
        GrammarQuestion(
            id: "q88",
            question: "The interview consisted ___ three parts.",
            choices: ["in", "of", "with", "from"],
            correctIndex: 1,
            translation: "「その面接は3つのパートで構成されていた」",
            explanation: """
            ・consist of ~ = 「〜から成る」(全体が部分から構成される)
            ・consist in は「(本質が)〜にある」で別の意味(Happiness consists in simple things.)
            ・be made up of / be composed of も同じ意味
            ・受動態にしないこと(× be consisted of)
            """
        ),
        GrammarQuestion(
            id: "q89",
            question: "I'm having difficulty ___ the new software.",
            choices: ["to use", "for using", "using", "with use"],
            correctIndex: 2,
            translation: "「新しいソフトウェアの使い方に苦労している」",
            explanation: """
            ・have difficulty (in) -ing = 「〜するのに苦労する」の決まった型
            ・in は省略可能、to不定詞は不可
            ・have trouble -ing / have a hard time -ing も同じパターン
            ・動名詞を取る慣用表現として一括で覚える
            """
        ),
        GrammarQuestion(
            id: "q90",
            question: "The price of houses has risen ___ the past decade.",
            choices: ["since", "for", "over", "from"],
            correctIndex: 2,
            translation: "「家の価格はここ10年にわたって上昇してきた」",
            explanation: """
            ・over the past + 期間 = 「過去〜の間にわたって」(変化・推移を表す)
            ・since + 過去の時点(since 2010)、for + 期間(for 10 years)とは形が違う
            ・統計やデータの説明で頻出 → IELTS Task 1(グラフ説明)で必須表現
            ・"in the past decade" も使えるが、変化の動詞には over がより自然
            """
        ),
        GrammarQuestion(
            id: "q91",
            question: "___ the heavy rain, the match was postponed.",
            choices: ["Because", "Due to", "Since", "As"],
            correctIndex: 1,
            translation: "「大雨のため、試合は延期された」",
            explanation: """
            ・Due to / Owing to + 名詞 = 「〜のために」(原因)
            ・Because / Since / As は接続詞で、後ろは「主語+動詞」の節を取る
            ・後ろが名詞句(the heavy rain)なので前置詞句が必要 → Due to
            ・Because of も同じ意味で名詞を取る前置詞句
            """
        ),
        GrammarQuestion(
            id: "q92",
            question: "He acted as ___ he were the boss.",
            choices: ["though", "for", "so", "like"],
            correctIndex: 0,
            translation: "「彼はまるで自分が上司であるかのように振る舞った」",
            explanation: """
            ・as though / as if = 「まるで〜かのように」
            ・事実と異なる仮定 → 仮定法過去で were を使う(was でも口語ではOK)
            ・like も口語では使われるが、フォーマルなライティングでは as though が標準
            ・as for は「〜については」で別の意味
            """
        ),
        GrammarQuestion(
            id: "q93",
            question: "___ exhausted, she continued working until midnight.",
            choices: ["Although", "Despite", "In spite", "Even"],
            correctIndex: 0,
            translation: "「疲れ切っていたが、彼女は真夜中まで働き続けた」",
            explanation: """
            ・Although + (S+V) = 「〜だけれども」(接続詞)
            ・"Although (she was) exhausted" の she was が省略された分詞構文的な形
            ・Despite/In spite of は名詞を取る前置詞句で、形容詞単独は不可
            ・Even だけでは接続詞にならない(Even though なら可)
            """
        ),
        GrammarQuestion(
            id: "q94",
            question: "The new manager is responsible ___ overseeing the whole project.",
            choices: ["of", "for", "to", "about"],
            correctIndex: 1,
            translation: "「新しいマネージャーはプロジェクト全体の監督に責任を負っている」",
            explanation: """
            ・be responsible for ~ = 「〜に責任がある」の定型
            ・of/to/about は使わない
            ・for の後ろは名詞または動名詞(-ing)
            ・似た responsibility(名詞)も "responsibility for ~" で同じ前置詞
            """
        ),
        GrammarQuestion(
            id: "q95",
            question: "___ make matters worse, the train was delayed by an hour.",
            choices: ["For", "In", "To", "By"],
            correctIndex: 2,
            translation: "「さらに悪いことに、電車が1時間遅れた」",
            explanation: """
            ・To make matters worse = 「さらに悪いことに」(独立不定詞の慣用句)
            ・状況がさらに悪化したことを述べる前置きフレーズ
            ・to不定詞が文頭で文全体を修飾する慣用表現の一つ
            ・似たフレーズ: To tell the truth(実を言うと), To be honest(正直に言うと)
            """
        ),
        GrammarQuestion(
            id: "q96",
            question: "The book ___ I borrowed from the library was very informative.",
            choices: ["what", "who", "that", "whose"],
            correctIndex: 2,
            translation: "「図書館から借りた本はとても役立つ内容だった」",
            explanation: """
            ・先行詞 the book(物) + 目的格関係代名詞 → that または which
            ・which も正解だが、選択肢にないので that
            ・what は先行詞を含むので、the book と一緒には使えない
            ・関係代名詞の目的格は省略も可能(The book I borrowed...)
            """
        ),
        GrammarQuestion(
            id: "q97",
            question: "___ the recent changes, the company is performing better than ever.",
            choices: ["Because", "Despite", "Although", "Thanks to"],
            correctIndex: 3,
            translation: "「最近の変化のおかげで、会社はかつてないほど好調だ」",
            explanation: """
            ・Thanks to ~ = 「〜のおかげで」(良い結果の原因を示す前置詞句)
            ・Because は接続詞で名詞は取らない
            ・Despite は「にもかかわらず」で、後半の「好調」とは因果関係が逆
            ・Although は接続詞で、節を取る
            ・文意(良い結果)から「おかげで」が最適
            """
        ),
        GrammarQuestion(
            id: "q98",
            question: "The committee will reach a decision ___ the end of this week.",
            choices: ["until", "by", "on", "in"],
            correctIndex: 1,
            translation: "「委員会は今週末までに決定に達するだろう」",
            explanation: """
            ・by + 時点 = 「〜までに」(期限・締め切り)
            ・until は「〜までずっと(継続)」で、決定という瞬間的行為には合わない
            ・「いつまでに完了するか」を示すときは必ず by
            ・問30と同じ by/until の使い分け、IELTSでは超頻出
            """
        ),
        GrammarQuestion(
            id: "q99",
            question: "___ all the candidates I interviewed, she was the most impressive.",
            choices: ["From", "Of", "Among", "Between"],
            correctIndex: 1,
            translation: "「面接した全候補者の中で、彼女が最も印象的だった」",
            explanation: """
            ・Of + all + 複数名詞 = 「すべての〜の中で」(最上級と組み合わせる定型)
            ・Among も「〜の中で」だが、最上級と一緒なら Of が標準
            ・Between は2つの間に限定される(候補者は複数なので不可)
            ・From は出発点を示す前置詞で、選択の中での比較には使わない
            """
        ),
        GrammarQuestion(
            id: "q100",
            question: "I wish I ___ more time to study English when I was younger.",
            choices: ["have", "had", "have had", "had had"],
            correctIndex: 3,
            translation: "「若いとき、もっと英語を勉強する時間があればよかったのに」",
            explanation: """
            ・I wish + 仮定法過去完了 (had + 過去分詞) = 過去のことへの後悔
            ・「(過去に)〜だったらよかったのに」 → 過去の事実と反対
            ・現在のことなら "I wish I had more time"(仮定法過去)
            ・when I was younger という過去の時点が出ているので、もう一段階前の過去 → 過去完了
            """
        ),
        GrammarQuestion(
            id: "q101",
            question: "The professor's lecture was so confusing that ___ of the students could follow it.",
            choices: ["some", "many", "few", "a few"],
            correctIndex: 2,
            translation: "「教授の講義はあまりに分かりにくかったので、ついていける学生はほとんどいなかった」",
            explanation: """
            ・few = 「ほとんど〜ない」(否定的なニュアンス)
            ・a few = 「少しはある」(肯定的なニュアンス) → "a" の有無で意味が逆転
            ・文脈「分かりにくかった」→ ついていけない学生が多い → 否定の few
            ・little / a little も同じ関係(little=ほとんどない、a little=少しある)で不可算名詞用
            """
        ),
        GrammarQuestion(
            id: "q102",
            question: "___ being tired, he kept working until the project was finished.",
            choices: ["Although", "Even", "Despite", "Because"],
            correctIndex: 2,
            translation: "「疲れているにもかかわらず、彼はプロジェクトが終わるまで働き続けた」",
            explanation: """
            ・Despite + 動名詞(-ing) = 「〜にもかかわらず」
            ・Despite は前置詞 → 後ろは名詞または動名詞(節は不可)
            ・Although は接続詞 → 後ろは「主語+動詞」(Although he was tired なら可)
            ・in spite of being tired も同じ意味で言い換え可能
            """
        ),
        GrammarQuestion(
            id: "q103",
            question: "He gave me ___ advice that I followed it immediately.",
            choices: ["so good", "so a good", "such good", "such a good"],
            correctIndex: 2,
            translation: "「彼があまりにいい助言をくれたので、私はすぐに従った」",
            explanation: """
            ・such + 形容詞 + 不可算名詞 + that = 「あまりに〜なので…」
            ・advice は 不可算名詞 なので a/an は付かない → such a good は誤り
            ・可算名詞なら "such a good idea that..." と a が必要
            ・so なら "so good that I followed it immediately" だが、advice 自体を修飾するときは such
            """
        ),
        GrammarQuestion(
            id: "q104",
            question: "The new system enables us ___ work more efficiently.",
            choices: ["to", "for", "in", "of"],
            correctIndex: 0,
            translation: "「新しいシステムによって、私たちはより効率的に働けるようになる」",
            explanation: """
            ・enable + 人 + to + 動詞原形 = 「(人が)〜できるようにする」
            ・enable は必ず to不定詞を取る、他の前置詞は不可
            ・同じ構文を取る動詞: allow / permit / encourage / persuade / advise + 人 + to do
            ・似た意味の make + 人 + 動詞原形(to なし)とは形が違う
            """
        ),
        GrammarQuestion(
            id: "q105",
            question: "The report was ___ short notice, so it contains some errors.",
            choices: ["on", "at", "in", "by"],
            correctIndex: 1,
            translation: "「その報告書は急ぎで作られたので、いくつか誤りがある」",
            explanation: """
            ・at short notice = 「急な通知で、急ぎで」(時間的余裕がない状態)
            ・「直前の通知時点で」→ 時点を表す at
            ・on/in/by では使わない、丸ごと暗記する慣用句
            ・似た表現: at the last minute(土壇場で), in advance(前もって)
            """
        ),
        GrammarQuestion(
            id: "q106",
            question: "He's been studying English ___ he was a child.",
            choices: ["for", "since", "from", "during"],
            correctIndex: 1,
            translation: "「彼は子供の頃から英語を勉強し続けている」",
            explanation: """
            ・since + 過去の時点(節も可) = 「〜以来ずっと」
            ・ここでは "he was a child" という節が時点を表す → since
            ・for は 期間 と組み合わせる(for 20 years)
            ・from は「〜から」だが、現在完了とは相性が悪い
            ・現在完了進行形 has been -ing と since はセットで覚える
            """
        ),
        GrammarQuestion(
            id: "q107",
            question: "The conference was attended by ___ 500 delegates.",
            choices: ["almost of", "nearly", "most of", "much"],
            correctIndex: 1,
            translation: "「その会議には500人近くの代表が出席した」",
            explanation: """
            ・nearly + 数字 = 「ほぼ〜、〜近く」(数字をやや下回る)
            ・nearly 500 = 「500に近い数(490など)」
            ・almost も同じ意味で使えるが、almost of という形は誤り(almost + 名詞は基本不可)
            ・most of は「〜の大部分」で意味が違う
            ・much は不可算名詞用、500 のような可算には使わない
            """
        ),
        GrammarQuestion(
            id: "q108",
            question: "___ surprise was so great that I couldn't speak.",
            choices: ["My", "Mine", "Me", "The"],
            correctIndex: 0,
            translation: "「驚きがあまりに大きくて、私は言葉を失った」",
            explanation: """
            ・名詞 surprise の前に置く所有格 → My(所有格)
            ・mine は所有代名詞(単独で「私のもの」を意味し、後ろに名詞は来ない)
            ・me は目的格、the は所有を示せない
            ・「驚きの程度を表す感情の所有」では my/his/her などを名詞の前に置く
            """
        ),
        GrammarQuestion(
            id: "q109",
            question: "___ studying hard, she failed the entrance exam.",
            choices: ["Although", "Despite", "In spite of", "Because of"],
            correctIndex: 2,
            translation: "「一生懸命勉強したにもかかわらず、彼女は入試に落ちた」",
            explanation: """
            ・In spite of + 動名詞 = 「〜にもかかわらず」
            ・Despite も同じ意味で置き換え可能だが、選択肢になければ In spite of
            ・Although は接続詞で後ろに節が必要 → studying(動名詞単独)とは合わない
            ・Because of は「〜のために(原因)」で逆の意味
            """
        ),
        GrammarQuestion(
            id: "q110",
            question: "The doctor recommended that he ___ smoking immediately.",
            choices: ["stops", "stop", "stopped", "will stop"],
            correctIndex: 1,
            translation: "「医者は彼が直ちに喫煙をやめるよう勧めた」",
            explanation: """
            ・recommend / suggest / insist / demand + that + S + 動詞原形 = 仮定法現在
            ・主語が三人称単数(he)でも -s を付けない → stop
            ・提案・要求を表す動詞の that 節では時制に関係なく動詞原形
            ・イギリス英語では "should stop" の形でもOK
            """
        ),
        GrammarQuestion(
            id: "q111",
            question: "I'd appreciate it ___ you could send me the document by tomorrow.",
            choices: ["when", "if", "that", "whether"],
            correctIndex: 1,
            translation: "「明日までに書類を送っていただけるとありがたいのですが」",
            explanation: """
            ・I'd appreciate it if you could ~ = 「〜していただけると幸いです」(丁寧な依頼の決まった型)
            ・仮定法 could を使うことで丁寧さを出す
            ・it は形式目的語で、後ろの if 節を指す
            ・ビジネスメールで頻出の定型表現
            """
        ),
        GrammarQuestion(
            id: "q112",
            question: "The company has ___ a significant increase in profits this year.",
            choices: ["made", "seen", "given", "put"],
            correctIndex: 1,
            translation: "「その会社は今年、利益の大幅な増加を経験した」",
            explanation: """
            ・see + an increase / a decrease / a rise / a decline = 「〜を経験する」
            ・主語が組織や時期で、変化を「経験・記録する」ときに使うコロケーション
            ・This year has seen a rise in unemployment.(今年は失業率の上昇があった)
            ・made/given/put では同じ意味にならない
            ・IELTS Writing Task 1(グラフ説明)で必須の表現
            """
        ),
        GrammarQuestion(
            id: "q113",
            question: "___ as the best player in the team, he felt a great responsibility.",
            choices: ["Choosing", "Chosen", "Having chosen", "To choose"],
            correctIndex: 1,
            translation: "「チームで最高の選手に選ばれて、彼は大きな責任を感じた」",
            explanation: """
            ・主語 he は「選ばれる側」 → 受動の意味 → 過去分詞 Chosen
            ・= "Because he was chosen as the best player..." の分詞構文
            ・Choosing(現在分詞)は能動で「自分が選んでいる」意味になり不自然
            ・分詞構文では、主語との関係(する側/される側)で現在分詞か過去分詞かを決める
            """
        ),
        GrammarQuestion(
            id: "q114",
            question: "He must have left already; ___ , his car is gone.",
            choices: ["however", "therefore", "nevertheless", "after all"],
            correctIndex: 3,
            translation: "「彼はもう帰ったに違いない。なんと言っても車がないのだから」",
            explanation: """
            ・after all = 「結局、何といっても、なにしろ」(根拠を補足するときの接続副詞)
            ・however は逆接、therefore は結論、nevertheless は逆接
            ・「車がない」が「帰ったに違いない」の根拠を補強する文脈 → after all が最適
            ・文頭で「結局のところ〜」と理由を示すときの定番
            """
        ),
        GrammarQuestion(
            id: "q115",
            question: "The new product is ___ to be launched next month.",
            choices: ["due", "due to", "about", "supposed"],
            correctIndex: 0,
            translation: "「新製品は来月発売予定だ」",
            explanation: """
            ・be due to + 動詞原形 = 「〜する予定である」(スケジュール上の予定)
            ・選択肢 b) due to を選ぶと "be due to to be" となり to が重複 → 誤り
            ・be about to do は「まさに〜しようとしている」(直前の行動)で時間感覚が違う
            ・be supposed to do も「〜するはず」だが、こちらはやや義務・期待感のニュアンス
            """
        ),
        GrammarQuestion(
            id: "q116",
            question: "Not until I read the book ___ understand the author's perspective.",
            choices: ["I did", "did I", "I had", "had I"],
            correctIndex: 1,
            translation: "「その本を読んで初めて、著者の視点を理解した」",
            explanation: """
            ・Not until + 節 + 倒置 = 「〜して初めて…した」
            ・Not until が文頭の否定句 → 主節で倒置 → did I understand
            ・一般動詞 understand なので do/does/did を使う
            ・過去のことなので did → did I understand
            ・これは Only when と同じパターンの倒置
            """
        ),
        GrammarQuestion(
            id: "q117",
            question: "The students were asked to ___ their own opinions in the essay.",
            choices: ["make", "express", "say", "tell"],
            correctIndex: 1,
            translation: "「生徒たちはエッセイで自分の意見を述べるよう求められた」",
            explanation: """
            ・express one's opinion = 「意見を述べる」の決まったコロケーション
            ・make / say / tell + opinion とは普通言わない
            ・似た表現: voice an opinion(意見を表明する), share an opinion(意見を共有する)
            ・give an opinion も使えるが、ここでは選択肢にない
            """
        ),
        GrammarQuestion(
            id: "q118",
            question: "___ his age, he is remarkably energetic.",
            choices: ["Although", "For", "Despite of", "Even"],
            correctIndex: 1,
            translation: "「年齢の割には、彼は非常に元気だ」",
            explanation: """
            ・for + 名詞 = 「〜の割には」(基準・期待値との比較を表す前置詞)
            ・For his age = 年齢を基準として考えると
            ・He is tall for a Japanese man.(日本人の男性としては背が高い)
            ・Despite of は誤り(of は不要)、Although は節を取るので名詞単独とは合わない
            """
        ),
        GrammarQuestion(
            id: "q119",
            question: "The team worked ___ the night to finish the project.",
            choices: ["through", "during", "by", "until"],
            correctIndex: 0,
            translation: "「チームはプロジェクトを終わらせるために夜通し働いた」",
            explanation: """
            ・through the night = 「夜通し、夜を通して」(始めから終わりまで)
            ・through は「〜を貫いて、最初から最後まで」のイメージ
            ・during the night は「夜の間に」(時間帯を示すだけ)で「ずっと」のニュアンスが薄い
            ・by the night は意味不明、until the night は「夜まで」(夜以前)で意味が違う
            """
        ),
        GrammarQuestion(
            id: "q120",
            question: "The article suggests that the policy ___ reconsidered.",
            choices: ["is", "was", "be", "being"],
            correctIndex: 2,
            translation: "「その記事はその方針が再考されるべきだと示唆している」",
            explanation: """
            ・suggest that + S + (should) + 動詞原形 = 仮定法現在
            ・受動態でも同じルール → "(should) be reconsidered" の should を省略した形
            ・主語が三人称単数でも、時制が過去でも、原形 be を使う
            ・提案・要求の動詞 (suggest/recommend/insist/demand/propose) の that 節では基本ルール
            ・※「(事実を)示唆する」意味なら通常時制(The data suggests that ... is wrong.)
            """
        ),
        GrammarQuestion(
            id: "q121",
            question: "___ prevented him from attending the meeting was a sudden illness.",
            choices: ["That", "It", "What", "Which"],
            correctIndex: 2,
            translation: "「彼が会議に出席できなかったのは突然の病気のためだった」",
            explanation: """
            ・What = 「〜こと/もの」(先行詞を含む関係代名詞)
            ・文の主語の位置で「〜こと」を表すには What を使う
            ・= "The thing which prevented him..." と言い換え可能
            ・That は接続詞、It は形式主語の構文(It was X that...)、Which は先行詞が必要
            """
        ),
        GrammarQuestion(
            id: "q122",
            question: "The new evidence ___ doubt on the original theory.",
            choices: ["puts", "makes", "throws", "gives"],
            correctIndex: 2,
            translation: "「新しい証拠が元の理論に疑問を投げかける」",
            explanation: """
            ・throw doubt on ~ = 「〜に疑問を投げかける」のコロケーション
            ・問7の cast doubt on と同じ意味で、こちらは throw を使う
            ・put / make / give doubt とは言わない
            ・「疑問を投げる」というイメージで throw / cast の動詞を選ぶ
            """
        ),
        GrammarQuestion(
            id: "q123",
            question: "Rarely ___ such dedication in young employees these days.",
            choices: ["we see", "do we see", "we do see", "seen we"],
            correctIndex: 1,
            translation: "「最近の若手社員にこれほどの献身を見ることは滅多にない」",
            explanation: """
            ・Rarely / Seldom が文頭の否定的副詞 → 倒置(疑問文の語順)
            ・一般動詞 see なので do/does/did を借りてくる
            ・現在のことなので do → do we see
            ・Hardly ever, Scarcely ever も同じ倒置パターン
            """
        ),
        GrammarQuestion(
            id: "q124",
            question: "The success of the campaign owes much ___ social media.",
            choices: ["for", "on", "to", "with"],
            correctIndex: 2,
            translation: "「キャンペーンの成功は SNS によるところが大きい」",
            explanation: """
            ・owe A to B = 「A は B のおかげである」
            ・「成功はSNSに負っている」の感覚で前置詞 to
            ・I owe my success to my parents.(私の成功は両親のおかげ)
            ・thanks to / due to と同じく to を取る感謝・原因の表現
            """
        ),
        GrammarQuestion(
            id: "q125",
            question: "The committee is ___ the verge of reaching an agreement.",
            choices: ["at", "in", "on", "by"],
            correctIndex: 2,
            translation: "「委員会は合意に達する寸前である」",
            explanation: """
            ・on the verge of ~ = 「〜の瀬戸際で、まさに〜しようとして」
            ・on the brink of も同じ意味で言い換え可能
            ・the verge は「縁、瀬戸際」の意味で、「縁の上に立っている」イメージ → on
            ・後ろは名詞または動名詞(-ing)を取る
            """
        ),
        GrammarQuestion(
            id: "q126",
            question: "He decided to take the job, ___ the long commute.",
            choices: ["although", "despite of", "regardless of", "because of"],
            correctIndex: 2,
            translation: "「彼は長い通勤距離にかかわらず、その仕事を引き受けることを決めた」",
            explanation: """
            ・regardless of ~ = 「〜にかかわらず、〜を考慮せずに」
            ・「気にしない」というニュアンスで譲歩を表す
            ・although は接続詞で節を取る、despite of は誤り(of 不要)
            ・because of は逆の意味(原因を示す)
            ・似た表現: irrespective of(同じく「〜に関係なく」)
            """
        ),
        GrammarQuestion(
            id: "q127",
            question: "The new factory will ___ over 200 jobs in the region.",
            choices: ["make", "create", "build", "put"],
            correctIndex: 1,
            translation: "「新しい工場はその地域で200以上の雇用を創出する」",
            explanation: """
            ・create jobs = 「雇用を創出する」の決まったコロケーション
            ・make jobs / build jobs / put jobs とは言わない
            ・似た表現: generate employment, provide opportunities
            ・IELTS Writing(社会・経済トピック)で頻出
            """
        ),
        GrammarQuestion(
            id: "q128",
            question: "The two countries are working together ___ a long-standing dispute.",
            choices: ["for solving", "at solving", "to resolve", "by resolve"],
            correctIndex: 2,
            translation: "「両国は長年の紛争を解決するために協力している」",
            explanation: """
            ・to + 動詞原形 = 「〜するために」(目的を表す不定詞)
            ・"work together to do" の形で目的を示すのが最も自然
            ・"work on solving" なら可だが、選択肢にはない
            ・resolve a dispute(紛争を解決する)は decisive な解決を表すコロケーション
            ・by resolve は誤り(by の後ろに動詞原形は来ない)
            """
        ),
        GrammarQuestion(
            id: "q129",
            question: "The government should take action to ___ the gap between rich and poor.",
            choices: ["shorten", "reduce", "bridge", "cut"],
            correctIndex: 2,
            translation: "「政府は貧富の差を埋めるための行動を取るべきだ」",
            explanation: """
            ・bridge the gap = 「(差・ギャップを)埋める、橋渡しをする」のコロケーション
            ・bridge は名詞「橋」だが動詞で「橋渡しをする」の意味
            ・reduce the gap も使えるが、bridge の方が「橋を架けて両者をつなぐ」イメージで具体的
            ・shorten/cut the gap とは普通言わない
            ・IELTS Writing(社会問題)で頻出
            """
        ),
        GrammarQuestion(
            id: "q130",
            question: "___ is no doubt that climate change is a serious issue.",
            choices: ["It", "That", "There", "This"],
            correctIndex: 2,
            translation: "「気候変動が深刻な問題であることに疑いはない」",
            explanation: """
            ・There is no doubt that ~ = 「〜であることに疑いはない」の決まった型
            ・存在文 There is/are の応用
            ・It is no doubt は誤り。It is true that ~ などとは構文が違う
            ・主張を強調する際の常套句、IELTS Writing でも使える定型表現
            """
        ),
        GrammarQuestion(
            id: "q131",
            question: "The proposal is worth ___ further discussion.",
            choices: ["of", "for", "to", "at"],
            correctIndex: 0,
            translation: "「その提案はさらなる議論に値する」",
            explanation: """
            ・選択肢の中で最も近いのは of(worthy of の感覚)
            ・本来 worth は前置詞なしで名詞/-ing を直接取る: worth further discussion
            ・worthy of + 名詞 なら of が必須(worthy of consideration)
            ・worth と worthy は似て非なる単語。微妙な違いに注意
            """
        ),
        GrammarQuestion(
            id: "q132",
            question: "He had hardly begun his speech ___ the audience started clapping.",
            choices: ["than", "when", "before", "while"],
            correctIndex: 1,
            translation: "「彼がスピーチを始めるかどうかのうちに、聴衆は拍手を始めた」",
            explanation: """
            ・Hardly...when... または Scarcely...when... = 「〜するかしないかのうちに」
            ・No sooner...than... と区別 → こちらは than を取る
            ・before / while ではこの意味の構文にならない
            ・倒置形(Hardly had he begun...when...)も同じ意味だが、ここでは通常の語順
            """
        ),
        GrammarQuestion(
            id: "q133",
            question: "The new policy will be implemented ___ January 2027.",
            choices: ["at", "in", "on", "by"],
            correctIndex: 1,
            translation: "「新しい方針は2027年1月に実施される」",
            explanation: """
            ・in + 月/年/季節 = 月名や年と組み合わせる前置詞
            ・at + 時刻、on + 日付/曜日、in + 月/年/世紀 のルール
            ・by January なら「1月までに(期限)」で別の意味
            ・in January 2027 で「2027年の1月に」
            """
        ),
        GrammarQuestion(
            id: "q134",
            question: "The minister announced that taxes ___ next year.",
            choices: ["will rise", "would rise", "rise", "had risen"],
            correctIndex: 1,
            translation: "「大臣は来年税金が上がると発表した」",
            explanation: """
            ・時制の一致: 主節が過去(announced)なら、従属節の will → would
            ・間接話法のルール: 主節の時制に合わせて従属節も一段階過去にする
            ・元の発言は "Taxes will rise." → 報告すると "...announced that taxes would rise."
            ・「来年」が主節時点から見て未来であっても、文法上は would を使う
            """
        ),
        GrammarQuestion(
            id: "q135",
            question: "___ of the candidates was qualified for the position.",
            choices: ["Both", "All", "Neither", "Few"],
            correctIndex: 2,
            translation: "「候補者のどちらも、その役職に適任ではなかった」",
            explanation: """
            ・Neither + of + 複数名詞 + 単数動詞 = 「(2人/2つの)どちらも〜ない」
            ・was(単数動詞)があるので、複数扱いの選択肢は不可
            ・Neither は2つを否定するときに使い、単数動詞を取る(現代英語では複数も許容)
            ・Both / All は複数動詞 were を取る → was と合わない
            ・Few は複数扱い → "Few of the candidates were"
            """
        ),
        GrammarQuestion(
            id: "q136",
            question: "The new manager has a reputation ___ being strict but fair.",
            choices: ["of", "for", "to", "with"],
            correctIndex: 1,
            translation: "「新しいマネージャーは厳しいが公平だという評判がある」",
            explanation: """
            ・have a reputation for ~ = 「〜という評判がある」のコロケーション
            ・for の後ろは名詞または動名詞(-ing)
            ・「〜で知られている」の意味で be known for ~ も同じパターン
            ・of/to/with は使わない
            ・似た表現: be famous for(良い意味), be notorious for(悪い意味)
            """
        ),
        GrammarQuestion(
            id: "q137",
            question: "Despite the fact ___ he was tired, he kept working.",
            choices: ["of", "which", "that", "what"],
            correctIndex: 2,
            translation: "「疲れているという事実にもかかわらず、彼は働き続けた」",
            explanation: """
            ・the fact that + 節 = 「〜という事実」(同格の that)
            ・the fact / the idea / the news などの抽象名詞の後で内容を説明する that
            ・which は関係代名詞で、後ろの節が不完全になる必要があるが、ここでは完全な文
            ・of は前置詞で節を取らない、what は先行詞を含むので不可
            ・Despite + 名詞句 全体で「〜という事実にもかかわらず」
            """
        ),
        GrammarQuestion(
            id: "q138",
            question: "___ is widely believed that exercise improves mental health.",
            choices: ["That", "It", "There", "This"],
            correctIndex: 1,
            translation: "「運動は精神的健康を改善すると広く信じられている」",
            explanation: """
            ・形式主語の It + 真主語(that 節) の構文
            ・直訳すると「(後ろの内容)は広く信じられている」
            ・It is said that / It is believed that / It is reported that などの定型
            ・That を文頭に置くと "That exercise improves..." となり、長すぎる主語で不自然
            ・IELTS Writing で意見を客観的に述べるときの定番表現
            """
        ),
        GrammarQuestion(
            id: "q139",
            question: "He is ___ to arrive any minute now.",
            choices: ["waited", "waiting", "expected", "about"],
            correctIndex: 2,
            translation: "「彼は今すぐにでも到着することになっている」",
            explanation: """
            ・be expected to + 動詞原形 = 「〜すると予想されている、〜することになっている」
            ・主語が「予想される側」 → 受動態の expected
            ・be supposed to / be due to も似た意味だが、expected は「予測・期待」のニュアンス
            ・about は be about to do(まさに〜しようとしている)で形が違う(to が必要)
            ・waited / waiting では文意が通らない
            """
        ),
        GrammarQuestion(
            id: "q140",
            question: "The decision will be made ___ the merits of each case.",
            choices: ["by", "on", "for", "with"],
            correctIndex: 1,
            translation: "「決定は各ケースの利点に基づいてなされる」",
            explanation: """
            ・on the basis of ~ や based on ~ の応用
            ・"on the merits of ~" = 「〜の利点・本質に基づいて」
            ・判断・決定の根拠を示すときの on
            ・by/for/with では、この意味を表せない
            ・法律・ビジネス文書で頻出のフォーマルな前置詞用法
            """
        ),
        GrammarQuestion(
            id: "q141",
            question: "I'll meet you at ___ corner of Fifth Avenue and 42nd Street.",
            choices: ["a", "the", "(no article)", "some"],
            correctIndex: 1,
            translation: "「5番街と42番街の角で会いましょう」",
            explanation: """
            ・the corner of A and B = 「A と B の角」(具体的に特定された角)
            ・5番街と42番街が交わる「あの角」と特定できる → the
            ・a corner だと「(どこかの)角」になり、待ち合わせ場所が曖昧
            ・street/road も同様に "the street where I live"(住んでいる通り)のように特定すれば the
            """
        ),
        GrammarQuestion(
            id: "q142",
            question: "She's the woman ___ I was telling you about yesterday.",
            choices: ["that", "what", "which", "whose"],
            correctIndex: 0,
            translation: "「昨日話していた女性って彼女のことだよ」",
            explanation: """
            ・先行詞 the woman(人) + 目的格関係代名詞 → that または who(m)
            ・口語では who/whom より that が頻出、または省略する(She's the woman I was telling you about.)
            ・which は物が先行詞のとき、whose は所有格、what は先行詞を含む
            ・前置詞 about が文末に残る形は会話で超頻出 → about whom は堅すぎる
            """
        ),
        GrammarQuestion(
            id: "q143",
            question: "Could you turn ___ the music? I'm trying to sleep.",
            choices: ["off", "up", "down", "in"],
            correctIndex: 2,
            translation: "「音楽の音を下げてくれない?寝ようとしてるんだ」",
            explanation: """
            ・turn down = 音量を下げる
            ・turn off = 完全に消す → 「下げる」より強い
            ・turn up = 音量を上げる(逆)
            ・turn in = 提出する/寝る
            ・文脈「寝ようとしている」+ 音楽はかかっている状態 → 完全に消すか下げるかだが、「下げて」と頼むのが自然
            """
        ),
        GrammarQuestion(
            id: "q144",
            question: "I haven't seen him ___ ages.",
            choices: ["since", "for", "from", "during"],
            correctIndex: 1,
            translation: "「彼にはずいぶん長いこと会っていない」",
            explanation: """
            ・for ages = 「長いこと、ずっと」(口語の決まったフレーズ)
            ・ages は「(長い)期間」を表す → 期間には for
            ・since は「特定の時点から」(since last week)で、ages のような漠然とした期間とは合わない
            ・"It's been ages since I saw him."(最後に会ってからずいぶん経つ)では since が使えるが、構文が違う
            """
        ),
        GrammarQuestion(
            id: "q145",
            question: "Can you pick ___ some milk on your way home?",
            choices: ["out", "off", "up", "in"],
            correctIndex: 2,
            translation: "「帰りに牛乳買ってきてくれる?」",
            explanation: """
            ・pick up = (店で物を)買う、ついでに手に入れる、(人を)迎えに行く
            ・口語で超頻出。"I'll pick you up at 7."(7時に迎えに行く)も同じ pick up
            ・pick out = 選び出す
            ・pick off = (1つずつ)取り除く
            ・「ついでに買ってくる」は pick up が定番
            """
        ),
        GrammarQuestion(
            id: "q146",
            question: "There's ___ bottle of wine in the fridge. ___ bottle is for tonight's dinner.",
            choices: ["the / A", "a / The", "a / A", "the / The"],
            correctIndex: 1,
            translation: "「冷蔵庫にワインのボトルがある。そのボトルは今夜の夕食用だ」",
            explanation: """
            ・冠詞の基本ルール: 初出は a、再登場は the
            ・1文目: 初めて話題に出す → a bottle(まだ特定されていない)
            ・2文目: もう話題に出ているそのボトル → The bottle(特定されている)
            ・会話・文章の流れで「あれね」と分かるかどうかで判断する
            """
        ),
        GrammarQuestion(
            id: "q147",
            question: "I'm not really ___ jazz. I prefer rock music.",
            choices: ["on", "at", "into", "for"],
            correctIndex: 2,
            translation: "「ジャズはあまり好きじゃないんだ。ロックの方が好き」",
            explanation: """
            ・be into ~ = 「〜にハマっている、〜が好き」(口語)
            ・趣味・興味を表すときの定番表現
            ・be on ~ は「〜の上に」(物理的)、be at ~ は「〜にいる」(場所)
            ・"I'm really into K-pop."(K-popにハマってる)のように使う
            ・like より熱量が伝わるカジュアルな表現
            """
        ),
        GrammarQuestion(
            id: "q148",
            question: "Sorry, I can't make it tonight. Can we ___?",
            choices: ["take a break", "take a rain check", "call it off", "put it off"],
            correctIndex: 1,
            translation: "「今夜は無理なんだ。また今度にしてくれる?」",
            explanation: """
            ・take a rain check = 「(誘いを)また今度に延ばす」(口語の決まったイディオム)
            ・元々は野球の雨天順延チケットから来た表現
            ・call it off = キャンセルする(完全に取り消し)、put it off = 延期する(日付未定)
            ・rain check は「またの機会に」のニュアンスで、誘ってくれた相手への配慮を示す
            ・ネイティブとの会話で使えると印象が良い表現
            """
        ),
        GrammarQuestion(
            id: "q149",
            question: "I ran ___ my old teacher at the supermarket yesterday.",
            choices: ["over", "out", "into", "after"],
            correctIndex: 2,
            translation: "「昨日スーパーで昔の先生にばったり会った」",
            explanation: """
            ・run into ~ = 「〜に偶然出会う」(=bump into)
            ・計画していなかった偶然の出会いを表す
            ・run over = 車でひく、run out = 使い切る、run after = 追いかける
            ・"I ran into an old friend." は会話で頻出
            ・似た表現: come across(偶然見つける/出会う)
            """
        ),
        GrammarQuestion(
            id: "q150",
            question: "The thing ___ bothers me most is his lack of punctuality.",
            choices: ["what", "that", "who", "whose"],
            correctIndex: 1,
            translation: "「一番気になるのは、彼の時間にルーズなところだ」",
            explanation: """
            ・先行詞 The thing(物) + 主格関係代名詞 → that または which
            ・口語では that が圧倒的に頻出
            ・what は先行詞を含むので、The thing what は誤り(二重に「もの」を表すことになる)
            ・"The thing that bothers me..." と "What bothers me..." はどちらも正しいが、先行詞 The thing がある場合は that/which
            """
        ),
        GrammarQuestion(
            id: "q151",
            question: "It's not the money I care about; it's ___ principle of the thing.",
            choices: ["a", "the", "(no article)", "some"],
            correctIndex: 1,
            translation: "「お金が問題なんじゃない、これは原則の問題なんだ」",
            explanation: """
            ・the principle of the thing = 「(その件の)原則の問題」(口語の決まった言い回し)
            ・抽象名詞 principle に the を付けるのは、文脈で特定の原則を指しているから
            ・"It's the thought that counts."(気持ちが大切)などと同様、決まったフレーズでは the が定着している
            ・不可算名詞でも、文脈で特定されれば the を取るのが冠詞の基本ルール
            """
        ),
        GrammarQuestion(
            id: "q152",
            question: "Whatever you do, don't bring ___ politics at the dinner table.",
            choices: ["on", "over", "up", "out"],
            correctIndex: 2,
            translation: "「何があっても、夕食の席で政治の話を持ち出さないで」",
            explanation: """
            ・bring up = (話題を)持ち出す、(子供を)育てる
            ・会話の文脈で「話題を出す」意味が定着
            ・bring on = 引き起こす、bring over = 持ってくる、bring out = 引き出す/出版する
            ・"Don't bring that up again."(その話また持ち出さないで)も同じ用法
            ・"raise a topic" でも同じ意味だが、bring up の方が口語的
            """
        ),
        GrammarQuestion(
            id: "q153",
            question: "I have ___ headache. Do you have ___ aspirin?",
            choices: ["(no article) / an", "a / (no article)", "the / an", "a / the"],
            correctIndex: 1,
            translation: "「頭痛がする。アスピリンある?」",
            explanation: """
            ・have a headache = 頭痛がする(数えられる症状として a が付く)
            ・aspirin は不可算名詞として扱われる(薬として漠然とした意味) → 冠詞なし
            ・同様に: have a cold(風邪をひいている)、have a fever(熱がある)
            ・でも have flu / have cancer は無冠詞(深刻な病気は不可算扱い)
            ・病気の冠詞は決まりがあるので個別に覚える
            """
        ),
        GrammarQuestion(
            id: "q154",
            question: "I'll catch ___ with you later. I have to run now.",
            choices: ["on", "up", "out", "over"],
            correctIndex: 1,
            translation: "「後で連絡するね。もう行かなきゃ」",
            explanation: """
            ・catch up with ~ = 「〜と近況を話す、〜に追いつく」
            ・久しぶりの友人に「最近どう?」と話すときに使う
            ・"Let's catch up over coffee."(コーヒーでも飲みながら近況話そう)
            ・catch on = 流行る、理解する; catch out = (誤りを)見抜く
            ・口語で頻出の友人間の表現
            """
        ),
        GrammarQuestion(
            id: "q155",
            question: "He's the kind of person ___ always thinks of others first.",
            choices: ["what", "which", "who", "whose"],
            correctIndex: 2,
            translation: "「彼は常に他人のことを最初に考えるタイプの人だ」",
            explanation: """
            ・先行詞 person(人) + 主格関係代名詞 → who または that
            ・口語でも書き言葉でも who が標準
            ・which は物の先行詞、whose は所有格、what は先行詞を含む
            ・"the kind of person who ~"(〜するようなタイプの人)は人物描写の定番表現
            """
        ),
        GrammarQuestion(
            id: "q156",
            question: "Can you keep ___ eye on my bag while I go to the bathroom?",
            choices: ["(no article)", "an", "the", "some"],
            correctIndex: 1,
            translation: "「トイレに行ってる間、私のバッグ見ててくれる?」",
            explanation: """
            ・keep an eye on ~ = 「〜を見張る、注意して見ておく」(イディオム)
            ・eye が母音発音で始まるので an
            ・慣用句なので「片目だけ」という意味ではなく、「注意を向ける」の比喩
            ・似た表現: have an eye for(〜を見る目がある)、turn a blind eye(見て見ぬふりをする)
            ・イディオム内の冠詞は決まっているので丸ごと暗記
            """
        ),
        GrammarQuestion(
            id: "q157",
            question: "I'm sorry, I didn't mean ___ you.",
            choices: ["upset", "upsetting", "to upset", "for upsetting"],
            correctIndex: 2,
            translation: "「ごめん、君を怒らせるつもりじゃなかったんだ」",
            explanation: """
            ・mean to + 動詞原形 = 「〜するつもりである」
            ・"didn't mean to" = 「〜するつもりじゃなかった」(謝罪・弁明の定番)
            ・mean + -ing は「〜を意味する」で意味が違う(Missing the train means waiting an hour. = 電車を逃すことは1時間待つことを意味する)
            ・同じ動詞でも to不定詞か動名詞かで意味が変わる典型例
            """
        ),
        GrammarQuestion(
            id: "q158",
            question: "Let's go to ___ bed. It's already past midnight.",
            choices: ["the", "a", "(no article)", "some"],
            correctIndex: 2,
            translation: "「もう寝よう。もう真夜中過ぎだよ」",
            explanation: """
            ・go to bed = 寝る(無冠詞の決まった表現)
            ・bed が「寝る場所」ではなく「寝る行為」を表す抽象的な意味のとき → 無冠詞
            ・同様: go to school(通学する)、go to church(礼拝に行く)、go to work(仕事に行く)
            ・"go to the bed" は物理的に「ベッドに行く」(座るためなど)で意味が違う
            ・「行為」を表すときは無冠詞、「物理的な物」を表すときは the/a
            """
        ),
        GrammarQuestion(
            id: "q159",
            question: "You can't have ___ cake and eat it.",
            choices: ["a", "the", "some", "your"],
            correctIndex: 3,
            translation: "「いいとこ取りはできないよ」",
            explanation: """
            ・have your cake and eat it (too) = 「いいとこ取りをする」(両立しないことを両方やろうとする)
            ・慣用句で your が固定(状況に応じて my/his も可)
            ・直訳:「ケーキを持っていて、しかも食べる」 → 持ち続けることと食べてしまうことは両立しない
            ・a/the/some では成立しないイディオム
            ・会話で「都合よく考えてるよ」と諭すときに使う
            """
        ),
        GrammarQuestion(
            id: "q160",
            question: "The food was ___ this restaurant gets a Michelin star.",
            choices: ["so good", "so good that", "such good", "such good that"],
            correctIndex: 1,
            translation: "「料理がとても美味しくて、このレストランがミシュラン星を取るのも納得だ」",
            explanation: """
            ・so + 形容詞 + that + 結果 = 「あまりに〜なので…」
            ・food は不可算名詞 → such を使うなら "such good food that"(such + 形容詞 + 名詞)
            ・形容詞 good 単独を強調するなら so good that
            ・a) は that がなく結果節とつながらない、c)d) は food が必要なのに省略
            ・口語でも頻出の構文「so...that...」
            """
        )
    ]
}
