//
//  Test.swift
//  BookTheCoach
//
//  Created by Thanh Duy on 12/03/2021.
//

import SwiftUI

struct Test: View {
    
    var body: some View {
        ZStack {
            Color("Splash")
            Image("anhxekhach")
                .renderingMode(.original)

        }
        
    
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
