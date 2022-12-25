//
//  Tile.swift
//  gomoku
//
//  Created by N-312 on 2022/12/24.
//

import Foundation
import SwiftUI

struct CrossLine: Shape{
    var rmUp = false;
    var rmDown = false;
    var rmRight = false;
    var rmLeft = false;
    var centerDot = false;
    func path(in rect: CGRect) -> Path{
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2))
        if(!rmUp){
            path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.minY))
            path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2))
        }
        
        if(!rmDown){
            path.addLine(to: CGPoint(x: rect.maxX/2, y: rect.maxY))
            path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2))
        }
        
        if(!rmRight){
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY/2))
            path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2))
        }
        
        if(!rmLeft){
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY/2))
            path.move(to: CGPoint(x: rect.maxX/2, y: rect.maxY/2))
        }
        if(centerDot){
            path.addArc(center: CGPoint(x: rect.maxX/2, y: rect.maxY/2), radius: 4, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
            path.addArc(center: CGPoint(x: rect.maxX/2, y: rect.maxY/2), radius: 2, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        }
        return path
    }
}

struct Tile: View{
    @Binding var turnCnt: Int;
    @Binding var status: Int;
    var line: CrossLine;
    let screenWidth = UIScreen.main.bounds.size.width
    
    var body: some View{
        Rectangle()
            .fill(Color("Board"))
            .frame(width: (screenWidth/16), height: (screenWidth/16))
            .overlay(line.stroke(Color.gray, lineWidth: 2))
            .overlay{
                if(status != 0){
                    Circle()
                        .fill(status == 1 ? Color("Black") : Color("White"))
                        .frame(width: (screenWidth/16)*0.9, height: (screenWidth/16)*0.9)
                }
            }
            .onTapGesture {
                if(status == 0){
                    turnCnt+=1
                    if(isTwo(trunCnt: turnCnt)){
                        status = 1
                    } else {
                        status = -1
                    }
                    print(turnCnt)
                }
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
