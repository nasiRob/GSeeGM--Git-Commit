//
//  GitHubRemoteService.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import Foundation

class GithubRemoteService {
    
    weak var output: CommitServiceOutput?
    
    func getCommits(author: String, repo: String) {
        guard let request = createRequest(author, repo: repo) else {
            output?.complete(result: .failure(BadRequestError()))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                self.output?.complete(result: Result.failure(error))
                return
            }

            if let data = data {
                if let errorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: data).message {
                    self.output?.complete(result: .failure(ServiceError(errorMessage)))
                    return
                }
                self.output?.complete(result: self.decodeData(data))
                return
            }
            self.output?.complete(result: Result.failure(UknownError()))
        }.resume()
    }
    
    private func createRequest(_ author: String, repo: String) -> URLRequest? {
        let getCommitUrl = "https://api.github.com/repos/%@/%@/commits"
        guard let url = URL(string: String(format: getCommitUrl, author, repo).removingPercentEncoding ?? "" ) else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    private func decodeData(_ data: Data) -> Result<CommitResponse,Error> {
        do {
            let output = try JSONDecoder().decode(CommitResponse.self, from: data)
            return Result.success(output)
        } catch (let error) {
            return Result.failure(error)
        }
    }
}

class UknownError: Error {
    
}

class ServiceError: Error {
    var errorMessage: String
    init(_ errorMessage: String) {
        self.errorMessage  = errorMessage
    }
}

class BadRequestError: Error {
    var errorMessage: String = "Invalid Username or Repo"
}
