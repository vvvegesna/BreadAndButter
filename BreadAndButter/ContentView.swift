//
//  ContentView.swift
//  BreadAndButter
//
//  Created by Vegesna, Vijay V EX1 on 7/3/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var isOffline = false
    
    var body: some View {
        NavigationView {
            Group {
                if isOffline {
                    Text("Date not available!")
                } else {
                    List(users, id:\.id) { user in
                        NavigationLink(destination: UserDetailView(user: user, users: self.users)) {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.address)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onAppear(perform: loadData)
                }
            }
            .alert(isPresented: $isOffline, content: { () -> Alert in
                Alert(title: Text("Whoops!"), message: Text("Device lost internet connection"), dismissButton: .default(Text("Okay"), action: loadData))
            })
                .navigationBarTitle("Users")
        }
    }
    
    func loadData() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                } else {
                    print("Error in decoding JSON data")
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
            DispatchQueue.main.async {
                self.isOffline = true
            }
        }.resume()
    }
}
