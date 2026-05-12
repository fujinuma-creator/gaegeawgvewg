import SwiftUI

struct CompletedView: View {
    let onReset: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Text("🎉")
                .font(.system(size: 60))
                .padding(.bottom, 4)
            Text("今日の復習は完了しました！")
                .font(.system(size: 18, weight: .bold))
            Text("明日もがんばろう！")
                .font(.system(size: 14))
                .foregroundColor(.secondary)

            Button(action: onReset) {
                Text("今日の復習をリセット")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
                    .padding(.top, 16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(40)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.top, 40)
    }
}
