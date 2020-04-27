//
//  Document.swift
//  VocalTextEdit
//
//  Created by annilq on 2020/4/27.
//  Copyright © 2020 annilq. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents :String = ""
    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = self.contents
        self.addWindowController(windowController)
    }

    enum Error:Swift.Error,LocalizedError {
        case UTF8Encoding
        case UTF8Decoding
        var failureReason: String?{
            switch self {
            case .UTF8Encoding:
                return "File cann't be encoded in utf-8"
            case .UTF8Decoding:
                return "File cann't be decoded in utf-8"
            default:
                return "unknow error"
            }
        }
    }
    
    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.contents ?? ""
        guard let data = contents.data(using: .utf8) else{
            throw Error.UTF8Encoding
        }
        return data
        
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        guard let contents = String(data:data,encoding: .utf8) else {
            throw Error.UTF8Decoding
        }
        self.contents = contents
       
    }


}

