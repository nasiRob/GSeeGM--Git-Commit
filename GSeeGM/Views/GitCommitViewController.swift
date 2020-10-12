//
//  GitCommitViewController.swift
//  GSeeGM
//
//  Created by Admin on 10/12/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import UIKit
import SwiftUI

class GitCommitViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var repoField: UITextField!
    
    @IBOutlet weak var gitCommitButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var presenter = CommitPresenter()
    var interactor = CommitInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.interactor = interactor
        interactor.output = presenter
        buildStyle()
        title = "Get Commits"
    }
    
    
    
    func buildStyle() {
        errorLabel.isHidden = true
        gitCommitButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    func buttonTapped() {
        if let username = usernameField.text, let repo = repoField.text, !username.isEmpty, !repo.isEmpty {
            presenter.fetchCommits(author: username, repo: repo)
            return
        }
        errorLabel.text = "Username or Repo is Empty"
        errorLabel.isHidden = false
    }
}
extension GitCommitViewController: ViewBehavior {
    
    func navigateToCommit(commits: CommitResponse) {
        let hostingController = UIHostingController(rootView: ListOfCommitsView(commits: commits, repo: repoField.text ?? "Repo"))
        navigationController?.pushViewController(hostingController, animated: true)
        return
    }
    
    func error(error: Error) {
        switch error {
        case is BadRequestError:
            errorLabel.text = (error as! BadRequestError).errorMessage
        case is ServiceError:
            errorLabel.text = (error as! ServiceError).errorMessage
        default:
            errorLabel.text = error.localizedDescription
            
        }
        errorLabel.isHidden = false
        return
    }
}

//TODO: Add text field delegate to remove error on edit.
