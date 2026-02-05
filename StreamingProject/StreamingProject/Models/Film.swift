class Film {
    private var Id : Int
    private var title : String
    private var description : String
    private var image : String
    private var note : Double
    
    init(Id: Int, title: String, description: String, image: String, note: Double) {
        self.Id = Id
        self.title = title
        self.description = description
        self.image = image
        self.note = note
    }
    
    public func getId() -> Int { return self.Id }
    public func getTitle() -> String { return self.title }
    public func getDescription() -> String { return self.description }
    public func getImage() -> String { return self.description }
    public func getNote() -> Double { return self.note }
}
