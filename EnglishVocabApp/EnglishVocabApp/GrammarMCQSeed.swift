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
        )
    ]
}
