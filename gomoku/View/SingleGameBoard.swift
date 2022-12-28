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
    
    @State var endGame = false;
    @State var endTitle = "";
    @State var turnCnt = 0;
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
        HStack{
            VStack{
                Text("백돌")
                Circle().fill(Color("White")).frame(width: 50, height: 50)
            }
            VStack{
                Text("현재 \(turnCnt+1)턴")
                HStack{
                    VStack{
                        Button("GG"){}
                        Button("무르기요청"){}
                        Button("reset"){
                            reset()
                        }
                    }
                    Button("착수"){
                        dropTheStone()
                    }
                }
            }
        }.rotationEffect(.degrees(180))
            .background(turnCnt % 2 == 0 ? .white : .gray)
        
        Grid(horizontalSpacing:0, verticalSpacing: 0){
            ForEach(0..<17){rIndex in
                GridRow{
                    ForEach(0..<17){cIndex in
                        if(rIndex == 0 && cIndex == 0
                        || rIndex == 16 && cIndex == 0
                        || rIndex == 0 && cIndex == 16
                        || rIndex == 16 && cIndex == 16){
                            Text("")
                        } else if(rIndex == 0){
                            Text("\(cIndex)").font(.system(size: (screenWidth/16)/2))
                        } else if(cIndex == 0){
                            Text("\(rIndex)").font(.system(size: (screenWidth/16)/2))
                        } else if(rIndex == 16){
                            Text("")
                        } else if(cIndex == 16){
                            Text("")
                        } else {
                            Tile(status: $now[rIndex-1][cIndex-1],line: CrossLine(
                                rmUp: rIndex == 1 ? true :false,
                                rmDown: rIndex == 15 ? true:false,
                                rmRight: cIndex == 15 ? true:false,
                                rmLeft: cIndex == 1 ? true:false,
                                centerDot: cIndex == 4 && rIndex == 4
                                || cIndex == 4 && rIndex == 12
                                || cIndex == 8 && rIndex == 8
                                || cIndex == 12 && rIndex == 4
                                || cIndex == 12 && rIndex == 12 ? true : false))
                            .onTapGesture{
                                if(now[rIndex-1][cIndex-1] == 0){
//                                    turnCnt+=1
                                    if(turnCnt % 2 == 0){
                                        for (rI, r) in now.enumerated() {
                                            for (cI, c) in r.enumerated() {
                                                if c == 2 {
                                                    now[rI][cI] = 0
                                                }
                                            }
                                        }
                                        now[rIndex-1][cIndex-1] = 2
//                                        let res = BoardCalcUtils.checkBlackVictory(game: now, row: rIndex-1, col: cIndex-1)
//                                        print("b res : \(res)")
//                                        if(res){
//                                            self.endGame = true;
//                                            self.endTitle = "흑"
//                                            reset()
//                                        }
                                    } else {
                                        for (rI, r) in now.enumerated() {
                                            for (cI, c) in r.enumerated() {
                                                if c == -2 {
                                                    now[rI][cI] = 0
                                                }
                                            }
                                        }
                                        now[rIndex-1][cIndex-1] = -2
//                                        let res = BoardCalcUtils.checkWhiteVictory(game: now, row: rIndex-1, col: cIndex-1)
//                                        print("w res : \(res)")
//                                        if(res){
//                                            self.endGame = true;
//                                            self.endTitle = "백"
//                                            reset()
//                                        }
                                    }
                                    print(turnCnt)
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        .alert("", isPresented: $endGame){
            Button("OK"){}
        } message: {
            Text("\(endTitle) 승")
        }
        HStack{
            VStack{
                Text("흑돌")
                Circle().fill(Color("Black")).frame(width: 50, height: 50)
            }
            VStack{
                Text("현재 \(turnCnt+1)턴")
                HStack{
                    VStack{
                        Button("GG"){}
                        Button("무르기요청"){}
                        Button("reset"){
                            reset()
                        }
                    }
                    Button("착수"){
                        dropTheStone()
                    }
                }
            }
            
        }.background(turnCnt % 2 == 0 ? .gray : .white)
        
        .onAppear(){
//            print(screenWidth)
        }
    }
    func dropTheStone(){
        if(turnCnt % 2 == 0){
            for (rI, r) in now.enumerated() {
                for (cI, c) in r.enumerated() {
                    if c == 2 {
                        turnCnt+=1
                        now[rI][cI] = 1
                        let res = BoardCalcUtils.checkBlackVictory(game: now, row: rI, col: cI)
                        print("b res : \(res)")
                        if(res){
                            self.endGame = true;
                            self.endTitle = "흑"
                            reset()
                        }
                    }
                }
            }
        } else {
            for (rI, r) in now.enumerated() {
                for (cI, c) in r.enumerated() {
                    if c == -2 {
                        turnCnt+=1
                        now[rI][cI] = -1
                        let res = BoardCalcUtils.checkWhiteVictory(game: now, row: rI, col: cI)
                        print("w res : \(res)")
                        if(res){
                            self.endGame = true;
                            self.endTitle = "백"
                            reset()
                        }
                    }
                }
            }
        }
    }
    
    func reset(){
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
        self.turnCnt = 0
    }
}

struct SingleGameBoard_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameBoard()
    }
}
