//
//  OperationsWithData.swift
//  HTMLEditor
//
//  Created by VyacheslavKrivoi on 5/9/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import Foundation

class OperationsWithData  {
    init() {}

    func saveFile(textSave: String) {
    let fileName = "ProjectTextFile"
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    
    let writeString = textSave
    do {
    // Write to the file
    try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
    } catch let error as NSError {
    print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }
    }
    
    func readFile() -> String {
    let fileName = "ProjectTextFile"
    let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
    print("FilePath: \(fileURL.path)")
    var readString = "" // Used to store the file contents
    do {
    // Read the file contents
    readString = try String(contentsOf: fileURL)
    } catch let error as NSError {
    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    print("File Text: \(readString)")
    return readString
    }
    
    
}
