//
//  Board.swift
//  gomoku
//
//  Created by N-312 on 2022/12/25.
//

import XCTest
enum CheckDirection{
    case Up, Down, Left, Right, UpLeft, UpRight, DownLeft, DownRight
}
final class BoardCaclUtilsTest: XCTestCase {
 

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHa(){
        let now = [[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [1,1,0,0,0,0,1,0,0,1,1,1,1,0,0],
                   [1,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,1,0,0],
                   [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                   [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],];
        
        let im = testLogic(game: now, direction: .Right, row: 5, col: 5)
        print("im: \(im)")
//        XCTAssertEqual(1, im)
    }
    func testLogic(game: [[Int]], direction: CheckDirection, row: Int, col: Int) -> [Int]{
        var rw = 0;
        if(direction == .Up
           || direction == .UpLeft
           || direction == .UpRight){
            rw = -1;
        } else if(direction == .Down
                  || direction == .DownLeft
                  || direction == .DownRight){
            rw = 1;
        }
        
        var cw = 0;
        if(direction == .Right
           || direction == .UpRight
           || direction == .DownRight){
            cw = 1;
        } else if(direction == .Left
                  || direction == .UpLeft
                  || direction == .DownLeft){
            cw = -1;
        }
        
        if(rw == 1 && row == 14){
            return [game[row][col]]
        } else if(rw == -1 && row == 0){
            return [game[row][col]]
        } else if(cw == 1 && col == 14){
            return [game[row][col]]
        } else if(cw == -1 && col == 0){
            return [game[row][col]]
        } else {
            let calR = row + rw;
            let calC = col + cw;
            var aa = testLogic(game: game, direction: direction, row: calR, col: calC)
            aa.append(game[row][col])
            
            print("calR: \(calR), calC:\(calC), game: \(game[calR][calC]), aa: \(aa)")
            return aa
        }
    }

}
