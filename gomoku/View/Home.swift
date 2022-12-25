//
//  Home.swift
//  gomoku
//
//  Created by N-312 on 2022/12/24.
//

import SwiftUI

struct Home: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    var body: some View {
        Text("HOME")
        Text("width: \(screenWidth)")
        Text("height: \(screenHeight)")
        NavigationLink("singleGame"){
            SingleGameBoard()
        }
        NavigationLink("multiGame"){
            Rooms()
        }
        NavigationLink("settings"){
            Settings()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
