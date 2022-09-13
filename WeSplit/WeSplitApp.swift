//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by Kemal Ardil Gülez on 13.09.22.
//

import SwiftUI

@main
struct WeSplitApp: App {
    @StateObject var memberViewModel: MemberViewModel = MemberViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(memberViewModel)
        }
    }
}
