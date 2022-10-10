//
//  SettingsView.swift
//  MyMovieDB
//
//  Created by Christian Slanzi on 19.09.22.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isPresented: Bool
    
    @State private var selection = 1
    @State private var name = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Favorite Gerne")) {
                    Text("Action").tag(1)
                    Text("Comedy").tag(2)
                    Text("Drama").tag(3)
                    Text("Scifi").tag(4)
                    Text("Documentary").tag(5)
                }
                
                // personal infos
                Section(header: Text("Personal infos")) {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                .headerProminence(.increased)
                
                Button {
                    // TODO: save preferences into ... DB, User Defaults..
                    isPresented = false
                } label: {
                    Text("Save preferences")
                }

                
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(false))
    }
}
