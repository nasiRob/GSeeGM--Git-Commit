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
    @State var navigate:Bool = false
    
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
                    Text("Search For Repo")
                })
                NavigationLink("Tap To View \(repo)", destination: ListOfCommitsView(commits: self.commits, repo: repo), isActive: self.$navigate).show(isVisible: $navigate)
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
    
    func navigateToCommit(commits: CommitResponse) {
        self.commits = commits
        self.navigate = true
    }
    func error(error: Error) {
        //Show Error
        navigate = false
    }
}

extension ContentView: ViewBehavior {

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Show: ViewModifier {
    @Binding var isVisible: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            content
        } else {
            content.hidden()
        }
    }
}

extension View {
    func show(isVisible: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: Show(isVisible: isVisible))
    }
}
