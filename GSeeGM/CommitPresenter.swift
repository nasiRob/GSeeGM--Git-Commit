//
//  CommitPresenter.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import Foundation

class CommitPresenter {
    
    var interactor: CommitInteractor?
    var view: ViewBehavior?
        
    func fetchCommits(author:String , repo:String) {
        interactor?.fetchCommits(author: author, repo: repo)
    }
}
extension CommitPresenter: InteractorOutput {
    func output(result: Result<CommitResponse, Error>) {
        switch result {
        case .success(let commits):
            view?.navigateToCommit(commits: commits)
        case .failure(let error):
            view?.error(error: error)
        }
    }
}
