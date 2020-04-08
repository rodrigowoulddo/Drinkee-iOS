//
//  TransitionTest.swift
//  Drinks SwiftUI
//
//  Created by Rafael Ferreira on 07/04/20.
//  Copyright © 2020 Rodrigo Giglio. All rights reserved.
//

import SwiftUI

struct TransitionTest: View {
    var testString: String
    
    var body: some View {
        Text(testString)
    }
}

struct TransitionTest_Previews: PreviewProvider {
    static var previews: some View {
        TransitionTest(testString: "Testeeee")
    }
}
