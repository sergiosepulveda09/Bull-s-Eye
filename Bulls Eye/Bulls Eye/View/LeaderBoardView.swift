
import SwiftUI

struct LeaderBoardView: View {
    @Binding  var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack (spacing: 10){
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntry.indices) { i in
                            let leaderboardEntry = game.leaderboardEntry[i]
                            RowView(index: i,
                                    score: leaderboardEntry.score
                                    ,date: leaderboardEntry.date)
                        }
                    }
                }
                
               
            }
        }
        
    }
}
struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    var body: some View {
        HStack {
           RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    @Binding  var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }
                else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            .padding(.top)
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}


struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width:Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
        LeaderBoardView(leaderboardIsShowing: leaderboardIsShowing,game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
