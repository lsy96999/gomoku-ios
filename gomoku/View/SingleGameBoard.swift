//
//  ContentView.swift
//  gomoku
//
//  Created by N-312 on 2022/12/24.
//

import SwiftUI


enum CheckDirection{
    case Up, Down, Left, Right, UpLeft, UpRight, DownLeft, DownRight
}

struct SingleGameBoard: View {
    @State var trunCnt = 1;
    @State var now =
            [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],]
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        Grid(horizontalSpacing:0, verticalSpacing: 0){
            ForEach(0..<17){cIndex in
                GridRow{
                    ForEach(0..<17){rIndex in
                        if(cIndex == 0 && rIndex == 0
                        || cIndex == 16 && rIndex == 0
                        || cIndex == 0 && rIndex == 16
                        || cIndex == 16 && rIndex == 16){
                            Text("")
                        } else if(cIndex == 0){
                            Text("\(rIndex)").font(.system(size: (screenWidth/16)/2))
                        } else if(rIndex == 0){
                            Text("\(cIndex)").font(.system(size: (screenWidth/16)/2))
                        } else if(cIndex == 16){
                            Text("")
//                            Text("\(rIndex)").font(.system(size: (screenWidth/16)/2))
                        } else if(rIndex == 16){
                            Text("")
//                            Text("\(rIndex)").font(.system(size: (screenWidth/16)/2))
                        } else {
//                            Text("\(now[rIndex-1][cIndex-1])")
                            Tile(turnCnt: $trunCnt, status: $now[cIndex-1][rIndex-1], line: CrossLine(
                                rmUp: cIndex == 1 ? true :false,
                                rmDown: cIndex == 15 ? true:false,
                                rmRight: rIndex == 15 ? true:false,
                                rmLeft: rIndex == 1 ? true:false,
                                centerDot: rIndex == 4 && cIndex == 4
                                || rIndex == 4 && cIndex == 12
                                || rIndex == 8 && cIndex == 8
                                || rIndex == 12 && cIndex == 4
                                || rIndex == 12 && cIndex == 12 ? true : false))
                            
                        }
                    }
                }
            }
        }
        Button("reset"){
            self.now = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                        [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],];
            self.trunCnt = 1
        }
        .onAppear(){
            print(screenWidth)
        }
    }
}

struct SingleGameBoard_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameBoard()
    }
}
