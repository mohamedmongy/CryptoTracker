//
//  LocalFileManager.swift
//  CryptoTracker
//
//  Created by mongy on 17/02/2023.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() {}
    
    
    func save(rawData: UIImage, with fileName: String, at folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        guard
            let data = rawData.pngData(),
            let url =  getUrlFor(fileName: fileName, at: folderName)
        else {
            return
        }
        
        do {
            try data.write(to: url, options: .atomic)
        } catch  let error {
            print("error saving image data: fileURl: \(url) with \(error)")
        }
    }
    
    func get(image named: String, at folderName: String) -> UIImage? {
        guard
            let url = getUrlFor(fileName: named, at: folderName),
            FileManager.default.fileExists(atPath: url.path)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: url.path)
    }
   
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getUrlFor(folderName: folderName) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(atPath: url.path, withIntermediateDirectories: true)
            } catch let error {
                print("error creating folder: named: \(folderName) with \(error)")
            }
        }
    }
    
    private func getUrlFor(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getUrlFor(fileName: String, at folderName: String) -> URL? {
        guard let url = getUrlFor(folderName: folderName) else {
            return nil
        }
        
        return url.appendingPathComponent(fileName)
    }
    
}
