//
//  UserDetailView.swift
//  BreadAndButter
//
//  Created by Vegesna, Vijay V EX1 on 7/4/20.
//  Copyright © 2020 Vegesna, Vijay V. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
    var user: User
    var users: [User]
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.about)
                .padding()
            Section(header: Text("Friends")
                .font(.largeTitle)) {
                List(user.friends, id: \.id) { friend in
                    NavigationLink(destination: FriendDetailsView(friend: friend, users: self.users)) {
                        Text(friend.name)
                    }
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle("User Deatils", displayMode: .inline)
    }
}
