
import SwiftUI

struct ContentView: View {
    @State
    private var alertIsVisible: Bool = false
    @State
    private var sliderValue: Double = 50
    @State
    private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack{
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertAv: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                    
                }
                else {
                    HitMeButton(text: "Hit me", alertAv: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
                
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}
struct InstructionView: View {
    @Binding
    var game: Game
    
    var body: some View {
        VStack {
            IntructionText(text:"🎯🎯🎯\n Put the bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text:String(self.game.returnTarget()))

        }
    }
}

struct SliderView: View {
    @Binding
    var sliderValue: Double
    var body: some View{
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue , in: 1.0 ... 100.0)
            SliderLabelText(text: "100")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
