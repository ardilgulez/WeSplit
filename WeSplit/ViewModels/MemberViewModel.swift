//
//  MemberViewModel.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import Foundation

class MemberViewModel: ObservableObject {
    
    func getGroup() -> [Member] {
        return [
            Member(id: 1, name: "Kemal"),
            Member(id: 2, name: "Ardil"),
            Member(id: 3, name: "Barkin"),
        ]
    }

}
