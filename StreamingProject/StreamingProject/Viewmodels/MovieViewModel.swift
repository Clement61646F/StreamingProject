import Foundation


class MovieViewModel: ObservableObject {

    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchMovies() async {
        isLoading = true
        do {
            movies = try await fetchMovieAPI()
        } catch {
            errorMessage = "Erreur réseau"
        }
        isLoading = false
    }
}
