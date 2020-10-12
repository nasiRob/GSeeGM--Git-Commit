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
    var repo: String
    var body: some View {
        return List(commits) { commit in
            CommitRow(commit: commit)
        }
        .navigationBarTitle(Text(repo), displayMode: .automatic)
    }
}

struct ListOfCommits_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCommitsView(commits: [CommitEntity](), repo: "Test")
    }
}

struct CommitRow: View {
    var commit: CommitEntity
    var body: some View {
        VStack(alignment: .leading) {
            Text("Author: " + (commit.commit?.author?.name ?? commit.commit?.author?.email ?? "Uknown Author")).font(.system(size: 11))
                .bold()
            Text("Hash: " + (commit.id ?? "NaN") )
                .font(.system(size: 11))
                .bold()
            Text(commit.commit?.message ?? "No message has been provided").padding([.top], 20.0)
        }

    }
}

