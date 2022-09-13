//
//  GroupView.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import SwiftUI

struct GroupView: View {
    @EnvironmentObject var memberViewModel: MemberViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                ForEach(memberViewModel.getGroup()) { member in
                    Text(member.name)
                }
            }
        }
        .navigationTitle("Group Members")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GroupView()
            GroupView().preferredColorScheme(.dark)
        }
        .environmentObject(MemberViewModel())
    }
}
