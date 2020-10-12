//
//  CommitResponseEntity.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import Foundation


typealias CommitResponse = [CommitEntity]

// MARK: - CommitResponseElement
struct CommitEntity: Codable, Identifiable {
    
    var id: String?
    var commit: Commit?
    
    enum CodingKeys: String, CodingKey {
        case id = "sha"
        case commit
    }
}

// MARK: - Commit
struct Commit: Codable {
    var author, committer: Author?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case author
        case committer
        case message
    }
    
    
}

// MARK: - CommitAuthor
struct Author: Codable {
    var name, email: String?
//    var date: Date?
}


// MARK: - Error
struct ErrorMessage: Codable {
    var message: String?
}
