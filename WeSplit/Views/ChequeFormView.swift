//
//  ChequeFormView.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import SwiftUI

struct ChequeFormView: View {
    
    @EnvironmentObject var memberViewModel: MemberViewModel
    
    @State var cheque: Double = 0
    @State var tip: Double = 0

    var body: some View {
        NavigationView{
            Form {
                Section("Cheque Form") {
                    Text("How much is the cheque?")
                    TextField("number", text: Binding(
                        get: { String(cheque) },
                        set: { cheque = Double($0) ?? 0 }
                    ))
                
                    Text("How much tip do you want to leave??")
                    TextField("number", text: Binding(
                        get: { String(tip) },
                        set: { tip = Double($0) ?? 0 }
                    ))
                }
            }
        }
        .navigationTitle("Add New Group Expense")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChequeFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChequeFormView()
            ChequeFormView().preferredColorScheme(.dark)
        }
        .environmentObject(MemberViewModel())
    }
}
