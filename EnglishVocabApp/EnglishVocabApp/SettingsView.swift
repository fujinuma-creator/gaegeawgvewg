import SwiftUI
import UniformTypeIdentifiers

/// 9. 設定
struct SettingsView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var purchases: PurchaseManager
    @State private var showPaywall = false
    @Binding var path: NavigationPath

    @State private var apiKey: String = ""
    @State private var showKey = false
    @State private var testing = false
    @State private var testMessage: String? = nil
    @State private var testOK = false
    @State private var showResetAlert = false
    @State private var csvURL: URL? = nil
    @State private var backupURL: URL? = nil
    @State private var importing = false
    @State private var importMessage: String? = nil

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    ScreenTopBar { path.removeLast() }
                    ScreenHeaderCard(title: "設定", tagline: "", image: "hdr_settings", imageHeight: 60)
                        .padding(.bottom, 6)

                    SectionLabel(text: "購入")
                    purchaseCard
                    SectionLabel(text: "音声").padding(.top, 10)
                    voiceCard
                    SectionLabel(text: "例文の作成（AI）").padding(.top, 10)
                    aiCard
                    SectionLabel(text: "学習").padding(.top, 10)
                    studyCard
                    SectionLabel(text: "データ").padding(.top, 10)
                    dataCard
                    Text("Lingro 英語 1.0.0")
                        .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                        .frame(maxWidth: .infinity).padding(.top, 10)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear { loadKey() }
        .sheet(isPresented: $showPaywall) { PaywallView().environmentObject(purchases) }
        .onChange(of: store.csvExportableWords.map(\.id)) { _, _ in csvURL = nil }
        .onChange(of: settings.provider) { _, _ in loadKey(); testMessage = nil }
        .alert("学習記録をリセットしますか？", isPresented: $showResetAlert) {
            Button("リセット", role: .destructive) { store.resetProgress() }
            Button("キャンセル", role: .cancel) {}
        } message: { Text("復習の段階・回数・連続日数がすべて消えます。単語は残ります。") }
    }

    // MARK: 購入

    private var purchaseCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(purchases.statusText).font(LFont.heading(14))
                    .foregroundStyle(purchases.access == .expired ? Palette.stageRed : Palette.text)
                Spacer()
                if purchases.access != .purchased {
                    Button { showPaywall = true } label: { Text(purchases.access == .notStarted ? "無料で試す" : "フル版 \(purchases.priceText)") }
                        .buttonStyle(GreenButtonStyle(fullWidth: false))
                }
            }
            if purchases.access != .purchased {
                Button { Task { await purchases.restore() } } label: {
                    Text("購入を復元").font(LFont.caption(12)).foregroundStyle(Palette.text).underline()
                }
                .buttonStyle(.plain)
            }
        }
        .sketchCard(padding: 14)
        .alert("お知らせ", isPresented: Binding(get: { purchases.message != nil && !showPaywall }, set: { if !$0 { purchases.message = nil } })) {
            Button("OK", role: .cancel) {}
        } message: { Text(purchases.message ?? "") }
    }

    // MARK: 音声

    private var voiceCard: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("英語の種類").font(LFont.heading(14)).foregroundStyle(Palette.text)
                    Text(SpeechManager.shared.voiceDescription(for: settings.accent))
                        .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                }
                Spacer()
                Menu {
                    ForEach(EnglishAccent.allCases) { a in
                        Button {
                            settings.accent = a
                            SpeechManager.shared.stop()
                            SpeechManager.shared.speak("Hello, how are you?")
                        } label: {
                            if a == settings.accent {
                                Label("\(a.flag) \(a.label)", systemImage: "checkmark")
                            } else {
                                Text("\(a.flag) \(a.label)")
                            }
                        }
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text("\(settings.accent.flag) \(settings.accent.label)")
                        Image(systemName: "chevron.down").font(.system(size: 10, weight: .bold))
                    }
                    .font(LFont.heading(13)).foregroundStyle(Palette.text)
                    .padding(.vertical, 6).padding(.horizontal, 10)
                    .background(ZStack {
                        Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                        Rectangle().fill(Palette.paper)
                        Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
                    })
                }
            }
            .padding(.vertical, 8)
            Text("きれいな声にするには iPhone の 設定 → アクセシビリティ → 読み上げコンテンツ → 声 → 英語 で「拡張」「プレミアム」の声をダウンロードしてください。")
                .font(LFont.caption(10)).foregroundStyle(Palette.faint)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 6)
            SketchDivider(dashed: true)
            settingRow("読み上げの速さ") {
                HStack(spacing: 10) {
                    Slider(value: $settings.speechRate, in: 0.5...1.2, step: 0.1, onEditingChanged: { editing in
                        if !editing { SpeechManager.shared.stop(); SpeechManager.shared.speak("Good morning.") }
                    })
                    .tint(Palette.green)
                    .frame(width: 130)
                    Text(String(format: "%.1f×", settings.speechRate)).font(LFont.heading(13)).foregroundStyle(Palette.text)
                }
            }
            SketchDivider(dashed: true)
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("答えを見たら自動で読み上げる").font(LFont.heading(14)).foregroundStyle(Palette.text)
                    Text("フラッシュカード・会話。同じボタンを2回続けて押すと 0.25 倍速").font(LFont.caption(11)).foregroundStyle(Palette.subText)
                }
                Spacer()
                Toggle("", isOn: $settings.autoSpeak).labelsHidden().tint(Palette.green)
            }
            .padding(.vertical, 10)
        }
        .sketchCard(padding: 14)
    }

    // MARK: 例文の作成（AI）

    private var aiCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            settingRow("使うサービス") {
                segmented(AIProvider.allCases.map { $0.rawValue }, selected: settings.provider.rawValue) {
                    if let p = AIProvider(rawValue: $0) { settings.provider = p }
                }
            }
            SketchDivider(dashed: true)
            Text("APIキー").font(LFont.heading(14)).foregroundStyle(Palette.text)
            HStack(spacing: 8) {
                Group {
                    if showKey {
                        TextField("sk-…", text: $apiKey)
                    } else {
                        SecureField("sk-…", text: $apiKey)
                    }
                }
                .font(.system(size: 14, design: .monospaced))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(.vertical, 8).padding(.horizontal, 10)
                .background(Palette.paper)
                .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1.3))
                .onChange(of: apiKey) { _, v in
                    KeychainHelper.set(v, for: settings.provider.keychainKey)
                }
                Button { showKey.toggle() } label: { Text(showKey ? "隠す" : "表示") }
                    .buttonStyle(OutlineButtonStyle(fullWidth: false))
            }
            if let msg = testMessage {
                HStack(spacing: 5) {
                    Circle().fill(testOK ? Palette.green : Palette.stageRed).frame(width: 7, height: 7)
                    Text(msg).font(LFont.caption(12)).foregroundStyle(testOK ? Palette.green : Palette.stageRed)
                }
            } else if let d = settings.keyVerifiedAt, !apiKey.isEmpty {
                HStack(spacing: 5) {
                    Circle().fill(Palette.green).frame(width: 7, height: 7)
                    Text("保存済み・接続を確認しました（\(d.shortJa)）").font(LFont.caption(12)).foregroundStyle(Palette.green)
                }
            }
            HStack(spacing: 10) {
                Button { Task { await test() } } label: {
                    HStack(spacing: 6) {
                        if testing { ProgressView().controlSize(.mini) }
                        Text(testing ? "確認中…" : "接続テスト")
                    }
                }
                .buttonStyle(OutlineButtonStyle(fullWidth: false))
                .disabled(testing || apiKey.isEmpty)
                Button {
                    apiKey = ""; KeychainHelper.delete(settings.provider.keychainKey); testMessage = nil; settings.keyVerifiedAt = nil
                } label: {
                    Text("キーを削除").foregroundStyle(Palette.stageRed)
                }
                .buttonStyle(OutlineButtonStyle(fullWidth: false))
            }
            keyHelp
            Text("キーはこの端末のキーチェーンにだけ保存され、外部には送信しません。")
                .font(LFont.caption(11)).foregroundStyle(Palette.subText)
            SketchDivider(dashed: true)
            settingRow("1回に作る例文の数") {
                segmented(["1", "3", "5"], selected: "\(settings.examplesPerRun)") { settings.examplesPerRun = Int($0) ?? 3 }
            }
            settingRow("例文のくだけ具合") {
                segmented(Casualness.allCases.map { $0.rawValue }, selected: settings.casualness.rawValue) {
                    if let c = Casualness(rawValue: $0) { settings.casualness = c }
                }
            }
        }
        .sketchCard(padding: 14)
    }

    private var keyHelp: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("キーの取得はこちら").font(LFont.caption(12)).foregroundStyle(Palette.subText)
            ForEach(AIProvider.allCases) { p in
                HStack(spacing: 8) {
                    HStack(spacing: 3) {
                        Text(p.rawValue).font(LFont.heading(12)).foregroundStyle(Palette.text)
                        if p == settings.provider { Circle().fill(Palette.green).frame(width: 5, height: 5) }
                    }
                    .frame(width: 60, alignment: .leading)
                    Link(destination: URL(string: "https://" + p.keyURL)!) {
                        HStack(spacing: 4) {
                            Text(p.keyURL).font(LFont.caption(12)).underline()
                            Spacer()
                            Image(systemName: "arrow.up.right").font(.system(size: 10, weight: .bold))
                        }
                        .foregroundStyle(Palette.stageBlue)
                    }
                }
            }
        }
        .padding(10)
        .background(Palette.cream.opacity(0.7))
        .overlay(Rectangle().strokeBorder(Palette.ink.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [4, 3])))
    }

    // MARK: 学習

    private var studyCard: some View {
        VStack(spacing: 0) {
            HStack {
                Text("ホームのひとこと").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                TextField("毎日、語学", text: $settings.motto)
                    .font(LFont.body(14)).foregroundStyle(Palette.text)
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: 170)
                    .padding(.vertical, 6).padding(.horizontal, 8)
                    .background(Palette.paper)
                    .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
            }
            .padding(.vertical, 8)
            SketchDivider(dashed: true)
            HStack {
                Text("1日の復習の上限").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                Menu {
                    ForEach([20, 50, 100, 0], id: \.self) { n in
                        Button(n == 0 ? "制限なし" : "\(n)語") { settings.dailyLimit = n }
                    }
                } label: {
                    HStack(spacing: 6) {
                        Text(settings.dailyLimitLabel).font(LFont.body(14)).foregroundStyle(Palette.subText)
                        Image(systemName: "chevron.right").font(.system(size: 11, weight: .bold)).foregroundStyle(Palette.subText)
                    }
                }
            }
            .padding(.vertical, 10)
            SketchDivider(dashed: true)
            HStack {
                Text("復習の通知").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                Toggle("", isOn: $settings.notifyEnabled).labelsHidden().tint(Palette.green)
                    .onChange(of: settings.notifyEnabled) { _, _ in store.scheduleNotification(settings: settings) }
                if settings.notifyEnabled {
                    DatePicker("", selection: notifyTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: settings.notifyHour) { _, _ in store.scheduleNotification(settings: settings) }
                        .onChange(of: settings.notifyMinute) { _, _ in store.scheduleNotification(settings: settings) }
                }
            }
            .padding(.vertical, 6)
        }
        .sketchCard(padding: 14)
    }

    private var notifyTime: Binding<Date> {
        Binding(
            get: {
                Calendar.current.date(bySettingHour: settings.notifyHour, minute: settings.notifyMinute, second: 0, of: Date()) ?? Date()
            },
            set: { d in
                settings.notifyHour = Calendar.current.component(.hour, from: d)
                settings.notifyMinute = Calendar.current.component(.minute, from: d)
            }
        )
    }

    // MARK: データ

    private var dataCard: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("データは端末の中だけに保存されます（アカウント不要）。アプリを更新しても消えません。機種変更やアプリ削除の前には、バックアップを書き出してください。")
                    .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                    .fixedSize(horizontal: false, vertical: true)
                Text("自分で追加した単語: \(store.userWordCount)語")
                    .font(LFont.caption(11)).foregroundStyle(Palette.text)
            }
            .padding(.vertical, 8)
            SketchDivider(dashed: true)
            HStack {
                Text("バックアップを書き出す").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                if let url = backupURL {
                    ShareLink(item: url) {
                        Label("保存先を選ぶ", systemImage: "square.and.arrow.up")
                            .font(LFont.caption(12)).foregroundStyle(Palette.green)
                    }
                } else {
                    Button { backupURL = store.exportBackup() } label: {
                        Text("作成").font(LFont.heading(13)).foregroundStyle(Palette.green)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.vertical, 10)
            SketchDivider(dashed: true)
            HStack {
                Text("バックアップから復元").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                Button { importing = true } label: {
                    Text("ファイルを選ぶ").font(LFont.heading(13)).foregroundStyle(Palette.green)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 10)
            .fileImporter(isPresented: $importing, allowedContentTypes: [.json]) { result in
                switch result {
                case .success(let url):
                    do {
                        let (n, added) = try store.importBackup(from: url)
                        importMessage = "\(n)語を復元しました（新しく追加 \(added)語）"
                    } catch {
                        importMessage = "このファイルは読み込めませんでした"
                    }
                case .failure:
                    importMessage = "ファイルを開けませんでした"
                }
            }
            if let m = importMessage {
                Text(m).font(LFont.caption(12)).foregroundStyle(Palette.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 6)
            }
            SketchDivider(dashed: true)
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("単語をCSVで書き出す").font(LFont.heading(14)).foregroundStyle(Palette.text)
                    Text("チェックした単語・自分で追加した単語（\(store.csvExportableWords.count)語）の 英語／発音記号／日本語")
                        .font(LFont.caption(10)).foregroundStyle(Palette.subText)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                if !purchases.canExportCSV {
                    Button { showPaywall = true } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "lock.fill").font(.system(size: 11, weight: .bold))
                            Text("フル版").font(LFont.caption(12))
                        }
                        .foregroundStyle(Palette.subText)
                    }
                    .buttonStyle(.plain)
                } else if let url = csvURL {
                    ShareLink(item: url) {
                        Image(systemName: "square.and.arrow.up").font(.system(size: 14, weight: .bold)).foregroundStyle(Palette.green)
                    }
                } else {
                    Button { csvURL = store.exportCSV() } label: {
                        Text("作成").font(LFont.heading(13))
                            .foregroundStyle(store.csvExportableWords.isEmpty ? Palette.faint : Palette.green)
                    }
                    .buttonStyle(.plain)
                    .disabled(store.csvExportableWords.isEmpty)
                }
            }
            .padding(.vertical, 10)
            SketchDivider(dashed: true)
            HStack {
                Text("学習記録をリセット").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Spacer()
                Button { showResetAlert = true } label: {
                    Text("リセット").font(LFont.heading(14)).foregroundStyle(Palette.stageRed)
                }
                .buttonStyle(.plain)
            }
            .padding(.vertical, 10)
        }
        .sketchCard(padding: 14)
    }

    // MARK: helpers

    private func settingRow<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        HStack {
            Text(title).font(LFont.heading(14)).foregroundStyle(Palette.text)
            Spacer()
            content()
        }
        .padding(.vertical, 8)
    }

    private func segmented(_ options: [String], selected: String, onSelect: @escaping (String) -> Void) -> some View {
        HStack(spacing: 6) {
            ForEach(options, id: \.self) { o in
                Button { onSelect(o) } label: {
                    Text(o)
                        .font(LFont.heading(13))
                        .foregroundStyle(o == selected ? .white : Palette.text)
                        .padding(.vertical, 6).padding(.horizontal, 11)
                        .background(ZStack {
                            Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                            Rectangle().fill(o == selected ? Palette.green : Palette.paper)
                            Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
                        })
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func loadKey() {
        apiKey = KeychainHelper.get(settings.provider.keychainKey) ?? ""
    }

    private func test() async {
        testing = true
        defer { testing = false }
        do {
            try await AIService.testConnection(provider: settings.provider)
            testOK = true
            settings.keyVerifiedAt = Date()
            testMessage = "接続できました（\(Date().shortJa)）"
        } catch {
            testOK = false
            testMessage = error.localizedDescription
        }
    }
}
