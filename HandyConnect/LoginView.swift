import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var selectedRole = "user"

    let sampleHandyman = Handyman(
        name: "John Doe",
        email: "john@example.com",
        phoneNumber: "123-456-7890",
        serviceCategory: "Plumber",
        experienceYears: 5,
        profileImage: "profile_placeholder",
        rating: 4.7,
        bio: "Experienced in plumbing services, repairs, and installations."
    )

    var body: some View {
        NavigationView {
            ZStack {
                // Background Gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.purple.opacity(0.4),
                        Color.blue.opacity(0.6)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                // Main Content
                VStack(spacing: 20) {
                    Text("HandyConnect")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    // Semi-Transparent Card
                    VStack(spacing: 15) {
                        Text("Login")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        // TextFields with fancy styling
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        Picker("Select Role", selection: $selectedRole) {
                            Text("User").tag("user")
                            Text("Handyman").tag("handyman")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                        Button(action: {
                            // Add real login logic
                            isLoggedIn = true
                        }) {
                            Text("Log In")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: .purple.opacity(0.4), radius: 5, x: 0, y: 3)
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
                
                if selectedRole == "handyman" {
                    NavigationLink(destination: UserHomeView(),  isActive: $isLoggedIn) {
                        EmptyView()
                    }
                }
                    
                
                   // NavigationLink(destination: HandymanProfileView(handyman: sampleHandyman), isActive: $isLoggedIn) {
                     //                      EmptyView()
                       //                }
                         //          } else {
                           //            NavigationLink(destination: UserHomeView(), isActive: $isLoggedIn) {
                             //              EmptyView()
                               //        }
                                 //  }

               // NavigationLink(
                //    destination: HandymanProfileView(handyman: sampleHandyman),
               //     isActive: $isLoggedIn
               // ) { EmptyView() }

                Spacer()
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
