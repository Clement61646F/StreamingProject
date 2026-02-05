import SwiftUI

struct MainAppView: View {

    @ObservedObject var authVM: AuthViewModel

    var body: some View {
        TabView {

            MovieDetailView(authVM: authVM)
                .tabItem {
                    Label("Films", systemImage: "film")
                }

            ProfileView(authVM: authVM)
                .tabItem {
                    Label("Profil", systemImage: "person.crop.circle")
                }
        }
    }
}
