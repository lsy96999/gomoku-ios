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
        if(true){
            
        }
        return path
    }
}

struct Tile: View{
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
                    if(status == 1 || status == -1){
                        ZStack{
                            Circle()
                                .fill(status == 1 ? Color("Black") : Color("White"))
                                .frame(width: (screenWidth/16)*0.9, height: (screenWidth/16)*0.9)
                                
//                            Text("33")
//                                .foregroundColor(.red)
                        }
                        
                    }else if(status == 2 || status == -2){
                        Circle()
                            .fill(status == 2 ? Color("Black") : Color("White"))
                            .opacity(0.7)
                            .frame(width: (screenWidth/16)*0.9, height: (screenWidth/16)*0.9)
                    } else if(status == 3 || status == -3){
                        Circle()
                            .fill(status == 3 ? Color("Black") : Color("White"))
                            .frame(width: (screenWidth/16)*0.9, height: (screenWidth/16)*0.9)
                            .overlay{
                                Circle()
                                    .fill(status == 3 ? Color("White") : Color("Black"))
                                    .frame(width: (screenWidth/16)*0.2, height: (screenWidth/16)*0.2)
                            }
                    }
                    
                }
            }
            .overlay{
                if(status == 9 || status == -9){
                    Image(systemName: "xmark")
                        .foregroundColor(status == 1 ? Color("Black") : Color("White"))
                        .imageScale(.small)
                }
            }
    }
}
