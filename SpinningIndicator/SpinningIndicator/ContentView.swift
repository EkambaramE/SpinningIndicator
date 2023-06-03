//
//  ContentView.swift
//  SpinningIndicator
//
//  Created by Ganesh on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var showSpinner: Bool = true
    @State private var degree: Double = 0.0
    @State private var spinnerLength: CGFloat = 0.6
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showSpinner.toggle()
                } label: {
                    Text(showSpinner ? "Stop Spinner" : "Start Spinner")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(width: 160)
                        .background(LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(8)
                }
                .padding(20)
                if showSpinner {
                    Circle()
                        .trim(from: 0.0, to: spinnerLength)
                        .stroke(LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                        .frame(width: 60, height: 60)
                        .rotationEffect(Angle(degrees: degree))
                        .onAppear {
                            animateRotation()
                        }
                }
            }
        }
    }
    
    // MARK: - Methods
    func animateRotation() {
        withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
            degree += 360
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

