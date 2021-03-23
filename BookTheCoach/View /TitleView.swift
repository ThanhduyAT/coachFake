//
//  TitleView.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 17/03/2021.
//

import SwiftUI

struct TitleView: View {
    var text: String
    var body: some View {
        HStack{
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .background(Color("Color"))
            
            
        }
        .padding()
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color.white)
            
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(text: "Hello Duy")
    }
}
