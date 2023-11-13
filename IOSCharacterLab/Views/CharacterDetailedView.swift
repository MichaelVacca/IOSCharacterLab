import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var viewModel: StarWars
    let character: StarWarsModel

    var body: some View {
        ScrollView {
            VStack {
                Label("Character Info", systemImage: "info.circle")
                    .font(.title)
                    .fontWeight(.heavy)

                if let imageUrl = viewModel.charcaterDetails?.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                }

                Text("**ID**: \(viewModel.charcaterDetails?.id ?? 0)")
                    .padding()
                Text("**Name**: \(viewModel.charcaterDetails?.name ?? "N/A")")
                    .padding()
                Text("**Species**: \(viewModel.charcaterDetails?.species ?? "N/A")")
                    .padding()
                Text("**Gender**: \(viewModel.charcaterDetails?.gender ?? "N/A")")
                    .padding()
            }
        }
        .onAppear {
            viewModel.getDetails(character: character)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: StarWarsModel.sampleCharacter)
            .environmentObject(StarWars())
    }
}
