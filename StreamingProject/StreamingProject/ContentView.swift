import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()

    var body: some View {
        if authVM.isAuthenticated {
            MovieDetailView(authVM: authVM)
        } else {
            LoginView(authVM: authVM)
        }
    }
}

#Preview("Iphone 17") {
    ContentView()
}
