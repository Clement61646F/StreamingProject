import Foundation
@MainActor
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

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject private var vm = MovieViewModel()

    var body: some View {
        NavigationView {
            Group {
                if vm.isLoading {
                    ProgressView()
                } else if let error = vm.errorMessage {
                    Text(error)
                } else {
                    List(vm.movies, id: \.id) { movie in
                        Text(movie.title)
                    }
                }
            }
            .navigationTitle("Movies")
        }
        .task {
            await vm.fetchMovies()
        }
    }
}

#Preview("iPhone 17") {
    ContentView()
}
