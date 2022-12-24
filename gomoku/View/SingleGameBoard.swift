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
                        if(cIndex < 1){
                            Text("\(rIndex)").font(.system(size: 10))
                        } else if(rIndex < 1){
                            Text("\(cIndex)").font(.system(size: 10))
                        } else {
                            Tile(turnCnt: $trunCnt)
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
