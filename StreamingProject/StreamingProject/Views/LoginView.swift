import SwiftUICore
import SwiftUI

struct LoginView: View {
    @ObservedObject var authVM: AuthViewModel

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Connexion")
                .font(.largeTitle)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("Mot de passe", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Se connecter") {
                authVM.login(email: email, password: password)
            }
        }
        .padding()
    }
}

