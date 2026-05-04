import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var apiKey: String = ""
    @State private var showSavedToast = false
    @State private var revealKey = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    if revealKey {
                        TextField("AIzaSy...", text: $apiKey)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .font(.system(.body, design: .monospaced))
                    } else {
                        SecureField("AIzaSy...", text: $apiKey)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .font(.system(.body, design: .monospaced))
                    }
                    Toggle("キーを表示", isOn: $revealKey)
                        .font(.subheadline)
                } header: {
                    Text("Gemini API キー")
                } footer: {
                    Text("https://aistudio.google.com/apikey で発行できます。キーは端末の Keychain に暗号化して保存されます。")
                }

                Section {
                    Button {
                        save()
                    } label: {
                        HStack {
                            Spacer()
                            Text("保存")
                                .bold()
                            Spacer()
                        }
                    }
                    .disabled(apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

                    Button(role: .destructive) {
                        clearKey()
                    } label: {
                        HStack {
                            Spacer()
                            Text("キーを削除")
                            Spacer()
                        }
                    }
                }

                Section {
                    Link("Google AI Studio で API キーを発行",
                         destination: URL(string: "https://aistudio.google.com/apikey")!)
                } footer: {
                    Text("無料枠（個人用なら使い切ることはほぼありません）。クレジットカードを登録しなければ自動課金は発生しません。")
                }
            }
            .navigationTitle("設定")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("閉じる") { dismiss() }
                }
            }
            .alert("保存しました", isPresented: $showSavedToast) {
                Button("OK", role: .cancel) {}
            }
            .onAppear {
                apiKey = KeychainHelper.get(SecretKey.geminiAPIKey) ?? ""
            }
        }
    }

    private func save() {
        let trimmed = apiKey.trimmingCharacters(in: .whitespacesAndNewlines)
        KeychainHelper.set(trimmed, for: SecretKey.geminiAPIKey)
        showSavedToast = true
    }

    private func clearKey() {
        KeychainHelper.set(nil, for: SecretKey.geminiAPIKey)
        apiKey = ""
        showSavedToast = true
    }
}

#Preview {
    SettingsView()
}
