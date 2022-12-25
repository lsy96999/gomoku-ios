//
//  BoardCaclUtils.swift
//  gomoku
//
//  Created by N-312 on 2022/12/25.
//

import Foundation
class BoardCalcUtils{
    static func getBoardDirectionLine(game: [[Int]], direction: CheckDirection, row: Int, col: Int) -> [Int]{
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
            var aa = getBoardDirectionLine(game: game, direction: direction, row: calR, col: calC)
            aa.append(game[row][col])
            
            print("calR: \(calR), calC:\(calC), game: \(game[calR][calC]), aa: \(aa)")
            return aa
        }
    }
}
