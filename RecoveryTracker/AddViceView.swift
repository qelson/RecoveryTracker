//
//  AddViceView.swift
//  RecoveryTracker
//
//  Created by Quin on 11/26/24.
//

import SwiftUI

struct AddViceView: View {
    @Binding var vices: [Vice] // Binding to the vices list in ContentView
    @Environment(\.dismiss) var dismiss // To dismiss the sheet
    @State private var name: String = ""
    @State private var cleanDate = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Vice Details")) {
                    TextField("Vice Name", text: $name)
                    DatePicker("Clean Date", selection: $cleanDate, displayedComponents: [.date, .hourAndMinute])
                }
            }
            .navigationTitle("Add Vice")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newVice = Vice(name: name, cleanDate: cleanDate)
                        vices.append(newVice) // Add the new vice to the list
                        dismiss() // Close the sheet
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddViceView_Previews: PreviewProvider {
    static var previews: some View {
        AddViceView(vices: .constant([])) // Provide a constant empty array for preview
    }
}
