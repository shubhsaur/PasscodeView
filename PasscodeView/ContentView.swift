//
//  ContentView.swift
//  PasscodeView
//
//  Created by Shubham Saurabh on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false
    @State private var count = 0
    
    var body: some View {
        VStack {
            if isAuthenticated {
                VStack {
                    Text("You're in!!")
                    Stepper("Count \(count)") {
                        count += 1
                    } onDecrement: {
                        guard count > 0 else { return }
                        count -= 1
                    }
                    .padding()

                    
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
