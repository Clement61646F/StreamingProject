import Foundation

class ProfileViewModel: ObservableObject {

    @Published var username: String
    @Published var email: String

    private var user: User

    init(user: User) {
        self.user = user
        self.username = user.username
        self.email = user.email
    }

    func saveProfile() {
        user.username = username
        user.email = email
    }
}
