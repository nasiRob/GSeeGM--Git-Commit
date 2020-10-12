//
//  CommitInteractor.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import Foundation

class CommitInteractor {
    
    lazy var remoteService = GithubRemoteService()
    
    func fetchCommits(author: String, repo: String) {
        remoteService.getCommits(author: author, repo: repo)
    }
    
}

extension CommitInteractor: CommitServiceOutput {
    
    func complete(result: Result<CommitResponse, Error>) {
        DispatchQueue.main.async {
            <#code#>
        }
    }
    
    
}
