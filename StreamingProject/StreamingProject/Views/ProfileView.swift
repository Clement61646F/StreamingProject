import SwiftUI

struct ProfileView: View {

    @ObservedObject var authVM: AuthViewModel
    @StateObject private var profileVM: ProfileViewModel

    init(authVM: AuthViewModel) {
        self.authVM = authVM
        _profileVM = StateObject(
            wrappedValue: ProfileViewModel(user: authVM.currentUser!)
        )
    }

    var body: some View {
        VStack(spacing: 20) {

            Text("Profil")
                .font(.largeTitle)

            TextField("Nom d'utilisateur", text: $profileVM.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $profileVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            Button("Sauvegarder") {
                profileVM.saveProfile()
            }
            .padding(.top)

            Divider().padding(.vertical)

            Button("Se déconnecter") {
                authVM.logout()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}
