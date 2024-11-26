//
//  AddViceView.swift
//  RecoveryTracker
//
//  Created by Quin on 11/26/24.
//

import SwiftUI

struct AddViceView: View {
    var body: some View {
        VStack {
            Text("Add a New Vice")
                .font(.largeTitle)
                .padding()

            Text("Track your progress and stay committed.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()

            Spacer()
        }
        .navigationTitle("Add Vice")
        .padding()
    }
}

struct AddViceView_Previews: PreviewProvider {
    static var previews: some View {
        AddViceView()
    }
}
