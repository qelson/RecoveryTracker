//
//  ContentView.swift
//  RecoveryTracker
//
//  Created by Quin on 11/26/24.
//

import SwiftUI

// Data Model for a Vice
struct Vice: Identifiable {
    let id = UUID() // Unique identifier for each vice
    let name: String // Name of the vice
    let cleanDate: Date // Clean date and time
}

struct ContentView: View {
    @State private var vices: [Vice] = [] // List of vices
    @State private var showAddVice = false // Controls Add Vice screen visibility

    var body: some View {
        NavigationView {
            ZStack {
                // Platform-specific background color
                #if os(iOS)
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                #elseif os(macOS)
                Color(NSColor.windowBackgroundColor)
                    .ignoresSafeArea()
                #endif

                if vices.isEmpty {
                    // Empty state view
                    VStack {
                        Text("No vices added yet!")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                        Text("Tap the + button to add your first vice.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                } else {
                    // List of vices
                    List {
                        ForEach(vices) { vice in
                            VStack(alignment: .leading) {
                                Text(vice.name)
                                    .font(.headline)
                                Text("Sober since \(formattedDate(vice.cleanDate))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteVice)
                    }
                }
            }
            .navigationTitle("Recovery Tracker")
            .toolbar {
                // Add Vice button in the toolbar
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddVice = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddVice) {
                AddViceView(vices: $vices)
            }
        }
    }

    // Format the clean date for display
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    // Delete a vice from the list
    private func deleteVice(at offsets: IndexSet) {
        vices.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
