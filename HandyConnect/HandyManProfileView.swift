import SwiftUI

struct HandymanProfileView: View {
    var handyman: Handyman  // Pass the handyman details

    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15) {
                // Profile Card
                VStack {
                    // Profile Image with Glow Effect
                    Image(handyman.profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(LinearGradient(colors: [.white, .blue.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5)
                        )
                        .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 5)
                        .padding(.top, 20)

                    // Name & Category
                    Text(handyman.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(handyman.serviceCategory)
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))

                    // Rating Display
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", handyman.rating))
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    
                    // Details Card
                    VStack(alignment: .leading, spacing: 10) {
                        Text("📞 Phone: \(handyman.phoneNumber)")
                        Text("📧 Email: \(handyman.email)")
                        Text("🛠 Experience: \(handyman.experienceYears) years")
                        Text("📝 Bio: \(handyman.bio)")
                    }
                    .font(.body)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.2))
                        .blur(radius: 1))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.1))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5))
                .padding()
                
                // Price Button with Modern UI
                Button(action: {
                    print("Price for service: $100")
                }) {
                    Text("💰 View Price: $100")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(BlurView(style: .systemThinMaterial))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Contact Buttons
                HStack(spacing: 20) {
                    Button(action: {
                        if let url = URL(string: "tel:\(handyman.phoneNumber)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Call", systemImage: "phone.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 120)
                            .background(BlurView(style: .systemUltraThinMaterial))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }

                    Button(action: {
                        if let url = URL(string: "mailto:\(handyman.email)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Label("Email", systemImage: "envelope.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 120)
                            .background(BlurView(style: .systemUltraThinMaterial))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Handyman Profile")
    }
}

// BlurView for Glassmorphism Effect
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

// Preview with sample data
struct HandymanProfileView_Previews: PreviewProvider {
    static var previews: some View {
        HandymanProfileView(handyman: Handyman(
            name: "John Doe",
            email: "john@example.com",
            phoneNumber: "123-456-7890",
            serviceCategory: "Plumber",
            experienceYears: 5,
            profileImage: "profile_placeholder",
            rating: 4.7,
            bio: "Experienced in plumbing services, repairs, and installations."
        ))
    }
}
