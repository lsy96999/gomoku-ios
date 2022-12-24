//
//  Tile.swift
//  gomoku
//
//  Created by N-312 on 2022/12/24.
//

import Foundation
import SwiftUI

struct CrossLine: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.minY))
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY/2))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/2))
        return path
    }
}

struct Tile: View{
    @State var isPut = false;
    @Binding var turnCnt: Int;
    @State var tt = false;
    var body: some View{
        Rectangle()
            .fill(Color("Board"))
            .frame(width: 23, height: 23)
            .overlay(CrossLine().stroke(Color.gray, lineWidth: 1))
            .overlay{
                if(isPut){
                    Circle()
                        .fill(tt ? Color("Black") : Color("White"))
                        .frame(width: 20, height: 20)
                }
            }
            .onTapGesture {
                isPut = !isPut;
                turnCnt+=1
                tt = isTwo(trunCnt: turnCnt)
                print(turnCnt)
            }
    }
    
    func isTwo(trunCnt: Int)->Bool{
        if(trunCnt % 2 == 0){
            return true
        } else {
            return false;
        }
    }
}
