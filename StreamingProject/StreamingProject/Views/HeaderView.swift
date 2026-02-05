import SwiftUI

struct HeaderView: View {

    let onProfile: () -> Void
    let onFavorites: () -> Void
    let onLogout: () -> Void

    var body: some View {
        HStack {
            Button(action: onProfile) {
                Image(systemName: "person.crop.circle")
                    .font(.title2)
            }

            Spacer()

            Button(action: onFavorites) {
                Image(systemName: "heart.fill")
                    .font(.title2)
            }

            Spacer()

            Button(action: onLogout) {
                Image(systemName: "power")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.systemGray6))
    }
}
