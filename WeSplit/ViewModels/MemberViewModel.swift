//
//  MemberViewModel.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import Foundation

enum MemberFormMode {
    case ADD, UPDATE
}

class MemberViewModel: ObservableObject {
    
    @Published var members: [Member] = [
        Member(id: 1, name: "Kemal"),
        Member(id: 2, name: "Ardil"),
        Member(id: 3, name: "Barkin"),
    ]
    
    @Published var memberToUpdate: Member = Member(id: 4, name: "")
    
    var formMode: MemberFormMode = MemberFormMode.ADD

    var newMemberId: Int = 4

    func getGroup() -> [Member] {
        return members
    }
    
    func reinitializeMemberToUpdate() {
        memberToUpdate = Member(id: newMemberId, name: "")
    }

    func addMemberToGroup() {
        members.append(memberToUpdate)
        newMemberId += 1
        memberToUpdate = Member(id: newMemberId, name: "")
    }

    func deleteMember(memberToRemove: Member) {
        members = members.filter { member in
            member.id != memberToRemove.id
        }
    }

    func updateMember() {
        members = members.map { member in
            member.id == memberToUpdate.id ? memberToUpdate : member
        }
    }

}
