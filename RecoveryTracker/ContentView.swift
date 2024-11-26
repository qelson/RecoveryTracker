//
//  ContentView.swift
//  RecoveryTracker
//
//  Created by Quin on 11/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Recovery Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("Track your journey and stay strong!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()

                NavigationLink(destination: AddViceView()) {
                    Text("Add a Vice")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("Recovery Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
