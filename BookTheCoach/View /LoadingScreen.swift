//
//  LoadingScreen.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 03/03/2021.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.2).ignoresSafeArea(.all, edges: .all)
            
            ProgressView()
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
            
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
