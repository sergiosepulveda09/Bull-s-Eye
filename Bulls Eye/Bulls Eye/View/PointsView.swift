
import SwiftUI

struct PointsView: View {
    @Binding var alertAv: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        VStack(spacing: 10) {
            let roundedValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            IntructionText(text: "The slider's value is ")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) Points \n 🎉🎉🎉")
            Button(action: {
                withAnimation {
                    alertAv = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round" )
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 6 )
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(alertAv: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(alertAv: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
