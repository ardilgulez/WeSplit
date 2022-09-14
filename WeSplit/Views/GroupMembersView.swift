//
//  GroupMembersView.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 14.09.22.
//

import SwiftUI

struct GroupMembersView: View {
    @EnvironmentObject var memberViewModel: MemberViewModel
    @State private var showAddMemberView: Bool = false
    
    @ViewBuilder
    func memberRow(member: Member) -> some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(Color.green)
            Text(member.name)
                .padding()
                .font(.subheadline)
        }
    }

    var body: some View {
        ZStack{
            Form {
                Section("Group Members") {
                    ForEach(memberViewModel.getGroup(), id: \.id) { groupMember in
                        memberRow(member: groupMember)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    memberViewModel.deleteMember(memberToRemove: groupMember)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .onTapGesture {
                                memberViewModel.formMode = MemberFormMode.UPDATE
                                memberViewModel.memberToUpdate = groupMember
                                showAddMemberView = true
                            }
                    }
                    Button("Add New Member") {
                        memberViewModel.formMode = MemberFormMode.ADD
                        memberViewModel.reinitializeMemberToUpdate()
                        showAddMemberView.toggle()
                    }
                }
            }
        }
        .sheet(
            isPresented: $showAddMemberView,
            onDismiss: {
                showAddMemberView = false
            },
            content: {
                AddGroupMemberForm()
                    .environmentObject(memberViewModel)
            }
        )
    }
}

struct GroupMembersView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroupMembersView()
            GroupMembersView().preferredColorScheme(.dark)
        }
        .environmentObject(MemberViewModel())
    }
}
