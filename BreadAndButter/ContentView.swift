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
    
    var body: some View {
        NavigationView {
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
                    return
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown Error")")
            }
        }.resume()
    }
}
