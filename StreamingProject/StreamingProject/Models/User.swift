public class User: Identifiable {
    let Id: Int
    let username: String
    let email: String
    var favorites: Favorite?

    init(id: Int, username: String, email: String) {
        self.Id = id
        self.username = username
        self.email = email
    }
    
    public func getId() -> Int { return self.Id }
    
    public func getUsername() -> String { return self.username }
    
    public func getEmail() -> String { return self.email }
    
    public func getFilms() -> Favorite? { return self.favorites ?? nil }
}
