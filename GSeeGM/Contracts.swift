//
//  Contracts.swift
//  GSeeGM
//
//  Created by Admin on 10/11/20.
//  Copyright © 2020 Nasi. All rights reserved.
//

import Foundation

protocol CommitServiceOutput: class {
    func complete(result: Result<CommitResponse,Error>)
}
