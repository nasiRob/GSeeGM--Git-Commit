//
//  ContentView.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var repo: String = ""
    @State var author: String = ""
    @State var commits = CommitResponse()
    @State var navigate = false
    
    var presenter: CommitPresenter?
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Author or Email", text: $author)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Repository", text: $repo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    self.buttonTapped()
                }, label: {
                    Text("Get Commits")
                })
                NavigationLink(repo, destination: ListOfCommitsView(commits: commits), isActive: $navigate).hidden()
            }
            .padding([.leading, .trailing], 70.0)
            .navigationBarTitle(Text("Search Repo"), displayMode: .inline)
        }
    }
    
    func buttonTapped() {
        if !self.author.isEmpty && !self.repo.isEmpty {
            presenter?.fetchCommits(author: author, repo: repo)
        }
    }
}

extension ContentView: ViewBehavior {
    
    func navigateToCommit(commits: CommitResponse) {
        self.commits = commits
        navigate = true
    }
    
    func error(error: Error) {
        //Show Error
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
