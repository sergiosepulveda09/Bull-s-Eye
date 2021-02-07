import SwiftUI

struct IntructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}
struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
        
    }
}

struct SliderLabelText: View {
    var text: String
    var body: some View {
            Text(text)
                .bold()
                .foregroundColor(Color("TextColor"))
                .frame(width: 35.0)
        }
}

struct HitMeButton: View {
    var  text: String
    @Binding var alertAv: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        Button(action: {
            withAnimation {
                alertAv = true
            }
        }) {
            Text(text.uppercased())
                .bold()
                .font(.title3)
        }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct LabelText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .kerning(1.5)
            .font(.caption)
    }
    
}

struct BodyText: View {
    var text: String
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .font(.subheadline)
            .lineSpacing(12)
            //.frame(width: 166, height: 67)
    }
    
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .font(.body)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
            
    }
    
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
    
}
struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    
    }
    
}

struct BigBoldText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .kerning(2)
            .foregroundColor(Color("TextColor"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.black)
        
    }
    
    
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IntructionText(text: "Instructions")
            BigNumberText(text: "99")
            SliderLabelText(text: "1")
            LabelText(text: "Score")
            HitMeButton(text: "Hit me", alertAv: .constant(true), sliderValue: .constant(50.0), game: .constant(Game()))
            BodyText(text: "You scored 200 Points \n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            ScoreText(score: 123)
            DateText(date: Date())
            BigBoldText(text: "leaderboard")
        }
        .padding()
        
    }
}
