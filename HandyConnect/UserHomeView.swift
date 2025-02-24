import SwiftUI

struct UserHomeView: View {
    @State private var searchText = ""
    @State private var handymen: [Handyman] = [
        Handyman(name: "John Doe", email: "john@example.com", phoneNumber: "123-456-7890", serviceCategory: "Plumber", experienceYears: 5, profileImage: "handyman1", rating: 4.5, bio: "Experienced plumber with 5 years of experience."),
        Handyman(name: "Jane Smith", email: "jane@example.com", phoneNumber: "987-654-3210", serviceCategory: "Electrician", experienceYears: 8, profileImage: "handyman2", rating: 4.8, bio: "Skilled electrician specializing in residential wiring.")
    ]

    var filteredHandymen: [Handyman] {
        if searchText.isEmpty {
            return handymen
        } else {
            return handymen.filter { $0.serviceCategory.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                        // Background Gradient
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.3),
                                Color.purple.opacity(0.4)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .edgesIgnoringSafeArea(.all)

                        VStack(spacing: 0) {
                            // Title & Search
                            VStack {
                                Text("Find a Handyman")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.top, 40)

                                TextField("Search for a handyman...", text: $searchText)
                                    .padding()
                                    .background(Color.white.opacity(0.15))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                            .padding(.bottom, 10)

                            // Main Card for Results
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.1))
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                    .edgesIgnoringSafeArea(.bottom)

                                // Handyman List
                                List(filteredHandymen) { handyman in
                                    NavigationLink(destination: HandymanProfileView(handyman: handyman)) {
                                        HStack(spacing: 15) {
                                            Image(handyman.profileImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                                .shadow(radius: 2)

                                            VStack(alignment: .leading, spacing: 4) {
                                                Text(handyman.name)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                Text(handyman.serviceCategory)
                                                    .font(.subheadline)
                                                    .foregroundColor(.white.opacity(0.7))
                                            }
                                            Spacer()
                                            Text("\(handyman.rating, specifier: "%.1f") ★")
                                                .foregroundColor(.yellow)
                                        }
                                        .padding(.vertical, 5)
                                        .listRowBackground(Color.clear)
                                    }
                                }
                                .listStyle(PlainListStyle())
                                .padding(.top, 10)
                            }
                        }
                    }
            .navigationTitle("Find a Handyman")
        }
    }
}



	
