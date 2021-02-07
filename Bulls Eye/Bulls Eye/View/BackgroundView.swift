
import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        
        ZStack {
            VStack {
               TopView(game: $game)
                Spacer()
                BottomView(game: $game)
            }
            .padding()
            .background(
                RingsView()
        )
        }
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Button(action: {
                    game.restart()
                }) {
                    RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                }
                
                Spacer()
                Button(action: {
                    leaderboardIsShowing = true
                }) {
                    RoundedImageViewFilled(systemName: "list.dash")
                }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                    LeaderBoardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
                })
            }
            
        }

    }
}

struct NumberView: View {
    var title: String
    var text: String

    var body: some View {
        VStack {
            LabelText(text: title.uppercased())
            RoundRectTextView(score: text)
        }
    }
    
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(1..<6) { rings in
                let size = CGFloat(rings * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
                    )
                    .frame(width: size, height: size, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }

        }
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                NumberView(title: "Score", text: String(game.returnScore()))
                Spacer()
                NumberView(title: "Round", text: String(game.returnRound()))
            }
            
        }

    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        RingsView()
    }
}
