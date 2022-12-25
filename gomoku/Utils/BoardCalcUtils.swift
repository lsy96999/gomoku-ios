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
            aa.insert(game[row][col], at: 0)
            
//            print("calR: \(calR), calC:\(calC), game: \(game[calR][calC]), aa: \(aa)")
            return aa
        }
    }
    
    static func directionConcat(_ a: [Int], _ b: [Int]) -> [Int]{
        var a = a;
        var b = b;
        
        b.remove(at: 0);
        b.reverse();
        return b + a
    }
    
    static func checkBlackVictory(game: [[Int]], row: Int, col: Int) -> Bool{
        let up = getBoardDirectionLine(game: game, direction: .Up, row: row, col: col)
        let down = getBoardDirectionLine(game: game, direction: .Down, row: row, col: col)
        
        let ud = directionConcat(up, down);
        
        let right = getBoardDirectionLine(game: game, direction: .Right, row: row, col: col)
        let left = getBoardDirectionLine(game: game, direction: .Left, row: row, col: col)
        
        let rl = directionConcat(right, left);
        
        let upRight = getBoardDirectionLine(game: game, direction: .UpRight, row: row, col: col)
        let downLeft = getBoardDirectionLine(game: game, direction: .DownLeft, row: row, col: col)
        
        
        let url = directionConcat(upRight, downLeft);
        
        let downRight = getBoardDirectionLine(game: game, direction: .DownRight, row: row, col: col)
        let upLeft = getBoardDirectionLine(game: game, direction: .UpLeft, row: row, col: col)
        
        let drl = directionConcat(downRight, upLeft);
        
        print("ud: \(ud)");
        print("rl: \(rl)");
        print("url: \(url)");
        print("drl: \(drl)");
        let ds = [ud, rl, url, drl]
        for d in ds {
            for a in d.split(separator: 0){
                for b in a.split(separator: -1){
                    let sums = b.filter{ a in
                        return a == 1
                    }.reduce(0){(p,a) in
                        return p+a
                    }
                    if(sums == 5){
                        return true
                    }
                }
            }
        }
        return false;
    }
    
    static func checkWhiteVictory(game: [[Int]], row: Int, col: Int) -> Bool{
        let up = getBoardDirectionLine(game: game, direction: .Up, row: row, col: col)
        let down = getBoardDirectionLine(game: game, direction: .Down, row: row, col: col)
        
        let ud = directionConcat(up, down);
        
        let right = getBoardDirectionLine(game: game, direction: .Right, row: row, col: col)
        let left = getBoardDirectionLine(game: game, direction: .Left, row: row, col: col)
        
        let rl = directionConcat(right, left);
        
        let upRight = getBoardDirectionLine(game: game, direction: .UpRight, row: row, col: col)
        let downLeft = getBoardDirectionLine(game: game, direction: .DownLeft, row: row, col: col)
        
        
        let url = directionConcat(upRight, downLeft);
        
        let downRight = getBoardDirectionLine(game: game, direction: .DownRight, row: row, col: col)
        let upLeft = getBoardDirectionLine(game: game, direction: .UpLeft, row: row, col: col)
        
        let drl = directionConcat(downRight, upLeft);
        
        print("ud: \(ud)");
        print("rl: \(rl)");
        print("url: \(url)");
        print("drl: \(drl)");
        let ds = [ud, rl, url, drl]
        for d in ds {
            for a in d.split(separator: 0){
                for b in a.split(separator: 1){
                    let sums = b.filter{ a in
                        return a == -1
                    }.reduce(0){(p,a) in
                        return p+a
                    }
                    if(sums == -5){
                        return true
                    }
                }
            }
        }
        return false;
    }
}
