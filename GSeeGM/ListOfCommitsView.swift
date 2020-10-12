//
//  ListOfCommits.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import SwiftUI

struct ListOfCommitsView: View {
    let commits: CommitResponse
    var body: some View {
        Text("hello there")
    }
}

struct ListOfCommits_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCommitsView(commits: [CommitsEntity]())
    }
}
