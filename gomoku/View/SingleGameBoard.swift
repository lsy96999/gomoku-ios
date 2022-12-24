//
//  ContentView.swift
//  gomoku
//
//  Created by N-312 on 2022/12/24.
//

import SwiftUI


struct ContentView: View {
    @State var trunCnt = 0;
    var body: some View {
        Grid(horizontalSpacing:0, verticalSpacing: 0){
            ForEach(0..<16){cIndex in
                GridRow{
                    ForEach(0..<16){rIndex in
                        if(cIndex == 0 && rIndex == 0){
                            Text("")
                        } else if(cIndex == 0){
                            Text("\(rIndex)").font(.system(size: 10))
                        } else if(rIndex == 0){
                            Text("\(cIndex)").font(.system(size: 10))
                        } else {
                            Tile(turnCnt: $trunCnt, line: CrossLine(
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
