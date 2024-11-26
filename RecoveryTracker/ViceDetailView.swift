//
//  ViceDetailView.swift
//  RecoveryTracker
//
//  Created by Quin on 11/26/24.
//

import SwiftUI

struct ViceDetailView: View {
    @Binding var vice: Vice // Binding to the specific vice for updates
    @State private var timer: Timer? // Timer for live updates

    var body: some View {
        VStack(spacing: 20) {
            Text(vice.name)
                .font(.largeTitle)
                .bold()
                .padding()

            Text("Time Sober")
                .font(.headline)

            Text(timeSinceClean())
                .font(.title)
                .bold()
                .onAppear {
                    startTimer() // Start the live timer
                }
                .onDisappear {
                    timer?.invalidate() // Stop the timer when leaving the view
                }

            Button(action: resetCleanDate) {
                Text("Reset Clean Date")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Vice Details")
    }

    // Calculate the time since the clean date
    private func timeSinceClean() -> String {
        let now = Date()
        let duration = now.timeIntervalSince(vice.cleanDate)

        let days = Int(duration / 86400)
        let hours = Int((duration.truncatingRemainder(dividingBy: 86400)) / 3600)
        let minutes = Int((duration.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))

        return "\(days) days, \(hours) hours, \(minutes) minutes, \(seconds) seconds"
    }

    // Start a timer to refresh the view every second
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            // This forces the view to refresh every second
        }
    }

    // Reset the clean date to now
    private func resetCleanDate() {
        vice.cleanDate = Date()
    }
}

struct ViceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ViceDetailView(vice: .constant(Vice(name: "Alcohol", cleanDate: Date())))
    }
}
