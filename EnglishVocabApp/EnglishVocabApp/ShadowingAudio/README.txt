シャドウイング用の音声を入れるフォルダです（Xcode では青いフォルダ＝そのまま同梱）。

  shadow_s01.m4a  … 文 s01 の音声（m4a / mp3 / wav / caf）
  shadow_s01.json … 任意。各単語の開始時刻（秒）の配列。例: [0.12, 0.35, 0.58, 0.80, 1.02, 1.10]
                    単語の数は ShadowingSeed.swift の英文をスペースで区切った数と同じにする。
                    無い場合は単語の長さから自動で推定します。

ファイルが無い文は、iPhone の読み上げ音声で再生されます。
文の一覧と ID は tools/shadowing/sentences.py を参照。
