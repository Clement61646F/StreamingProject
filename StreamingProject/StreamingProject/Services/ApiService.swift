import Foundation

public struct MovieResponse: Decodable {
    let results: [Movie]
}

public struct Movie: Codable, Identifiable {
    public let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let title: String
    let poster_path: String?
    let vote_average: Double
}

extension Movie {
    var posterURL: URL? {
        guard let poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
}


private let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MjdiMzkwZjAyZTczY2YzZWYzZGI5MzgzODg4NjZiNSIsIm5iZiI6MTc3MDI4NTM4Ny43NTQsInN1YiI6IjY5ODQ2OTRiZjhmNWZiZWZkYTM2MzM4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FMzzldr2Zq6ukHp5HYhJru5njntRL-_NpKCNTUNR9zI"

public func fetchMovieAPI() async throws -> [Movie] {
    guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie") else {
        return []
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else {
        throw URLError(.badServerResponse)
    }

    let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
    return decoded.results
}

