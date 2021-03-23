//
//  SplashScreen.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 17/03/2021.
//

import SwiftUI

struct SplashScreen: View {
    @State private var animation = false
    @State private var endSplash = false
    

//    @StateObject var userInfo = UserInfo()
    @EnvironmentObject var userInfo: UserInfo
    var body: some View {
        ZStack {
            ContentView()
            
            
            ZStack {
                
                Color("Splash")
                
                Image("anhxe")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animation ? .fill : .fit)
                    .frame(width: animation ? nil : 200, height: animation ? nil : 200, alignment: .center)
                
                
                    .scaleEffect(animation ? 3: 1)
                
            }
            .onAppear() {
                animationSplash()
            }
            .opacity(endSplash ? 0: 1)
        }
        .environmentObject(userInfo)
        
        
    }
    func animationSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(Animation.easeOut(duration: 0.45)) {
                animation.toggle()
                
            }
            
            withAnimation(Animation.easeOut(duration: 0.45)) {
                endSplash.toggle()
                
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
