//
//  Secrets.swift
//  Potpourri
//
//  Created by Nutan Niraula on 11/6/2565 BE.
//

import Foundation

struct Secrets: Codable {
    let apiKey: String
    
    static func load() throws -> Self {
        let secretsFileUrl = Bundle.main.url(forResource: "secrets", withExtension: "json")
        
        guard let secretsFileUrl = secretsFileUrl,
              let secretsFileData = try? Data(contentsOf: secretsFileUrl) else {
            fatalError(
                "secrets.json file not found. Please duplicate secrets.json.sample, rename to secrets.json and add keys."
            )
        }
        
        return try JSONDecoder().decode(Self.self, from: secretsFileData)
    }
}

