public class Favorite {
    private var filmsList : [Film] = []
    
    public func getFilms() -> Array<Film> { return self.filmsList }
    public func addFilm(_ film: Film) { self.filmsList.append(film) }
}
