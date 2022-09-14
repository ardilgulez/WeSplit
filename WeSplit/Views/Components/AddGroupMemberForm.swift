//
//  AddGroupMemberForm.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 14.09.22.
//

import SwiftUI

struct AddGroupMemberForm: View {
    @EnvironmentObject var memberViewModel: MemberViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Add New Member")
                .font(.title2).bold()
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            
            TextField("Member Name", text: $memberViewModel.memberToUpdate.name)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if memberViewModel.memberToUpdate.name == "" {
                    return
                }
                if memberViewModel.formMode == MemberFormMode.ADD {
                    memberViewModel.addMemberToGroup()
                } else {
                    memberViewModel.updateMember()
                }
                
                dismiss()
            } label: {
                Text("Add Member")
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Color(hue: 0.328, saturation: 0.796, brightness: 0.408)
                    )
                    .cornerRadius(30)
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()

    }
}

struct AddGroupMemberForm_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddGroupMemberForm()
            AddGroupMemberForm().preferredColorScheme(.dark)
        }
        .environmentObject(MemberViewModel())
    }
}
