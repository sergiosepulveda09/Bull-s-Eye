import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}


struct Game {
    
    private var target: Int = Int.random(in: 1...100)
    private var score: Int = 0
    private var round: Int = 1
    var leaderboardEntry: [LeaderboardEntry] = []
    
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntry.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntry.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntry.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntry.append(LeaderboardEntry(score: 60, date: Date()))
            leaderboardEntry.append(LeaderboardEntry(score: 90, date: Date()))
        }
    }
    
    func returnTarget() -> Int {
        return self.target
    }
    
    func returnScore() -> Int {
        return self.score
    }

    func returnRound() -> Int {
        return self.round
    }

    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        }
        else if difference <= 2 {
            bonus = 50
        }
        else {
            bonus = 0
        }
        return 100 - difference + bonus 
    }
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntry.append(LeaderboardEntry(score: points, date: Date()))
        self.leaderboardEntry.sort { $0.score > $1.score}
    }
    

    mutating func startNewRound(points: Int) {
        self.score += points
        self.round += 1
        self.target = Int.random(in: 1...100)
        addToLeaderboard(points: points)

    }
    
    mutating func restart() {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
        
    }
    
}
