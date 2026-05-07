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
        )
    ]
}
