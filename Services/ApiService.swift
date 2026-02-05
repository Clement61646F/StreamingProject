struct MoviesResponse : DECodable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let original_language : String
    let original_title : String
    let overview : String
    let title : String
    let vote_average : Double
}

let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MjdiMzkwZjAyZTczY2YzZWYzZGI5MzgzODg4NjZiNSIsIm5iZiI6MTc3MDI4NTM4Ny43NTQsInN1YiI6IjY5ODQ2OTRiZjhmNWZiZWZkYTM2MzM4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FMzzldr2Zq6ukHp5HYhJru5njntRL-_NpKCNTUNR9zI"

func fetchMovieAPI() async throws -> [Movie] {
    let url = URL(string : "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)")
    let (data, response) = try await URLSession.shared.data(from : url)
    let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
    return decoded.results
}
