//
//  FriendDetailsView.swift
//  BreadAndButter
//
//  Created by Vegesna, Vijay V EX1 on 7/4/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct FriendDetailsView: View {
    var friend: Friend
    var users: [User]
    
    var asUser: User? {
        guard let asUser = users.first(where: { (user) -> Bool in
            user.id == self.friend.id
        }) else { return nil }
        return asUser
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(friend.name)
                .padding()
                .font(.headline)
            Section {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Age: \(asUser?.age ?? 0)")
                        Text("Company: \(asUser?.company ?? "Unknown")")
                    }
                    Spacer()
                    Text(verbatim: "isActive: \(asUser?.isActive ?? true)")
                }
            }
            .padding()
            Section(header: Text("Tags").font(.largeTitle)) {
                List(asUser?.tags ?? [], id:\.self) {
                    Text($0)
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle("Friend Details", displayMode: .inline)
    }
}
