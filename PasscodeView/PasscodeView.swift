//
//  PasscodeView.swift
//  PasscodeView
//
//  Created by Shubham Saurabh on 23/06/24.
//

import SwiftUI

struct PasscodeView: View {
    @Binding var isAuthenticated: Bool
    @State private var passcode = ""
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 24) {
                Text("Enter Passcode")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text("Please enter your 4-digit pin to securely access your account.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
            }
            .padding(.top)
            
            //indicator view
            
            PasscodeIndicatorView(passcode: $passcode)
            
            Spacer()
            
            //numberpad view
            NumberPadView(passcode: $passcode)
        }
        //IOS 17 standard
//        .onChange(of: passcode, {oldValue, newValue in
//                verifyPasscode()
//        })
        //older version before ios 17
        .onChange(of: passcode, perform: {value in
                verifyPasscode()
        } )
    }
    
    private func verifyPasscode() {
        guard passcode.count == 4 else { return }
        
        Task {
            try? await Task.sleep(nanoseconds: 125_000_000)
            isAuthenticated = passcode == "1234"
//            showPasscodeError = !isAuthenticated
            passcode = ""
        }
    }
}

#Preview {
    PasscodeView(isAuthenticated: .constant(false))
}
