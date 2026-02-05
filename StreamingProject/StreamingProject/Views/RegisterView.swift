import SwiftUI

struct RegisterView: View {
    @ObservedObject var authVM: AuthViewModel
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Inscription")
                .font(.largeTitle)
            
            TextField("Nom d'utilisateur", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Mot de passe", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Confirmer le mot de passe", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Button("S'inscrire") {
                registerUser()
            }
        }
        .padding()
    }
    
    func registerUser() {
        // Vérification simple
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            errorMessage = "Tous les champs sont requis."
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Les mots de passe ne correspondent pas."
            return
        }
        
        // Création d'un nouvel utilisateur (simulation)
        let newUser = User(id: Int.random(in: 2...1000), username: username, email: email)
        authVM.currentUser = newUser
        authVM.isAuthenticated = true
    }
}
