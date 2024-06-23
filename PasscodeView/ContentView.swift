//
//  ContentView.swift
//  PasscodeView
//
//  Created by Shubham Saurabh on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!!")
                    
                    Button("Log out") {
                        isAuthenticated = false
                    }
                }
            } else {
                PasscodeView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    ContentView()
}
