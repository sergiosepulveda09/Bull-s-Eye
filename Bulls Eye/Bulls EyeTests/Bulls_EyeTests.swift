
import XCTest
@testable import Bulls_Eye

class Bulls_EyeTests: XCTestCase {
    
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.returnTarget() + 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    func testScoreNegative() {
        let guess = game.returnTarget() - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.returnScore(), 100)
        XCTAssertEqual(game.returnRound(), 2)
    }
    
    func testScoreExact() {
        let guess = game.returnTarget()
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    func testScoreClose() {
        let guess = game.returnTarget() + 2
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.returnScore(), 0)
        XCTAssertNotEqual(game.returnRound(), 1)
        game.restart()
        XCTAssertEqual(game.returnScore(), 0)
        XCTAssertEqual(game.returnRound(), 1)
    }
    
    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntry.count, 1)
        XCTAssertEqual(game.leaderboardEntry[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntry.count, 2)
        XCTAssertEqual(game.leaderboardEntry[0].score , 200)
        XCTAssertEqual(game.leaderboardEntry[1].score , 100)
    }
}
