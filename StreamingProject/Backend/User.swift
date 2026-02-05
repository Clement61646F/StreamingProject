class User {
    private var Id : Int
    private var username : String
    private var email : String
    private var password : String
    private var favorites : Favorite? = nil
    
    init(Id: Int, username: String, email : String, password: String) {
        self.Id = Id
        self.username = username
        self.email = email
        self.password = password
    }
    
    public func getId() -> Int { return self.Id }
    
    public func getUsername() -> String { return self.username }
    
    public func getEmail() -> String { return self.email }
    
    public func getPassword() -> String { return self.password }
    
    public func getFilms() -> Favorite? { return self.favorites ?? nil }
}
