//
//  ContentView.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var memberViewModel: MemberViewModel
    
    var body: some View {
        TabView {
            ChequeFormView()
                .tabItem {
                    Image(systemName: "banknote.fill")
                    Text("Cheque Form")
                }
                .environmentObject(memberViewModel)
            GroupMembersView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Group Members")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().preferredColorScheme(.dark)
        }
        .environmentObject(MemberViewModel())
    }
}
