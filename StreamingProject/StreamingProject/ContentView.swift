import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    @State private var isShowingRegister = false

    var body: some View {
        if authVM.isAuthenticated {
            MainAppView(authVM: authVM)
        } else {
            VStack {
                if isShowingRegister {
                    RegisterView(authVM: authVM)

                    Button("Déjà un compte ? Connexion") {
                        isShowingRegister = false
                    }
                } else {
                    LoginView(authVM: authVM)

                    Button("Pas de compte ? Inscription") {
                        isShowingRegister = true
                    }
                }
            }
            .padding()
        }
    }
}


#Preview("Iphone 17") {
    ContentView()
}

