import SwiftUI
import SwiftData

struct MovieListView : View {
    @ObservedObject var authVM: AuthViewModel
    @StateObject private var vm = MovieViewModel()

    var body: some View {
        NavigationView {
            Group {
                if vm.isLoading {
                    ProgressView()
                } else if let error = vm.errorMessage {
                    Text(error)
                } else {
                    List(vm.movies) { movie in
                        HStack(alignment: .top, spacing: 12) {

                            AsyncImage(url: movie.posterURL) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 80, height: 120)

                                case .success(let image):
                                    ZStack(alignment: .bottomTrailing) {

                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 120)
                                            .clipped()
                                            .cornerRadius(8)

                                        Button {
                                            MovieDetailView(
                                                film: movie,
                                                authVM: authVM
                                            )
                                        }
                                        .padding(6)
                                    }

                                case .failure:
                                    Image(systemName: "photo")
                                        .frame(width: 80, height: 120)

                                @unknown default:
                                    EmptyView()
                                }
                            }

                            VStack(alignment: .leading, spacing: 6) {
                                Text(movie.title)
                                    .font(.headline)

                                Text(movie.overview)
                                    .font(.caption)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
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

