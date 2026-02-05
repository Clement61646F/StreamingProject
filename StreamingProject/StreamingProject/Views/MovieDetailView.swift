import SwiftUI
import SwiftData

struct MovieDetailView: View {
    // Variable en entrée de type Film (c'est une classe que j'ai faite)
    let film: Film

    @ObservedObject var authVM: AuthViewModel
    @StateObject private var vm = MovieViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // Image du film en grand
                AsyncImage(
                    url: URL(string: "https://image.tmdb.org/t/p/w500\(film.getImage)")
                ) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .clipped()

                // Titre du film
                Text(film.getTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Description du film
                Text(film.getDescription)
                    .font(.body)
                    .padding(.horizontal)

                // Bouton Ajouter aux favoris
                Button(action: {
                    print(film)
                }) {
                    Text("Ajouter aux favoris")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

            }
        }
        .navigationTitle("Détail du film")
        .navigationBarTitleDisplayMode(.inline)
    }
}
