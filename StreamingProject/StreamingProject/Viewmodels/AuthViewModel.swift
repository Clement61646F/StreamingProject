import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User? = nil

    func login(email: String, password: String) {
        if email == "TEST" && password == "1234" {
            let user = User(id: 1, username: "TestUser", email: email)
            self.currentUser = user
            self.isAuthenticated = true
        }
    }

    func logout() {
        self.currentUser = nil
        self.isAuthenticated = false
    }
}
