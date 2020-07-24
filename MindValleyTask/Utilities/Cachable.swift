//
//  Cachable.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/23/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import Foundation

public class ObjectCache {
    
    static let sharedInstance = ObjectCache()
    
    func getCacheFolder() -> URL {
        if let url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first {
            return url.appendingPathComponent("cache")
        } else {
            fatalError("Could not retrieve documents directory")
        }
    }
    
    func getFileURL(fileName: String) -> URL {
        return getCacheFolder().appendingPathComponent(fileName)
    }
    
    func store<T: Codable>(object: T, fileName: String) {
        
       let jsonData  = try? JSONEncoder().encode(object)
        let jsonString = String(data: jsonData!, encoding: .utf8)

        let fileUrl = getFileURL(fileName: fileName)

        if FileManager.default.fileExists(atPath: fileUrl.path) {
            try? FileManager.default.removeItem(at: fileUrl)
        }
        
        try? FileManager.default.createDirectory(atPath: getCacheFolder().path, withIntermediateDirectories: true, attributes: nil)
        
        try? jsonString?.write(to: fileUrl, atomically: true, encoding: .utf8)
    }
    
    func retrieve<T: Codable>(fileName: String) -> T? {
        let fileUrl = getFileURL(fileName: fileName)
        guard let contents = try? String(contentsOf: fileUrl, encoding: .utf8) else { return nil}

        do {
            let jsonObject = try JSONDecoder().decode(T.self, from: Data(contents.utf8))
            return jsonObject

        } catch  {
            print("error: ", error)
        }
        
        return nil
    }
    
    
    func delete(fileName: String) {
        let fileUrl = getFileURL(fileName: fileName)
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            try? FileManager.default.removeItem(at: fileUrl)
        }
    }
    
    func clearCache() {
        try? FileManager.default.removeItem(atPath: getCacheFolder().path)
    }
}
