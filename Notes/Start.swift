//
//  Start.swift
//  Notes
//
//  Created by Mason Earl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Start: Equatable {
    
    private let textStorageKey = "textStorage"
    private let titleKey = "title"
    private let textKey = "text"
    
    
    var textStorage: NSData
    var title: String
    var text: String
    
    init(textStorage: NSData = NSData(), title: String, text: String) {
        
        self.textStorage = textStorage
        self.title = title
        self.text = text
    }
    
    init?(dictionary: Dictionary<String, AnyObject>) {
        guard let textStorage = dictionary[textStorageKey] as? NSDate,
            let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String else {
                
                //Set values for stored properties due to requirement as of swift 2.0
                self.textStorage = NSData()
                self.text = ""
                self.title = ""
                
                return nil
        
        }
        
        func dictionaryCopy() -> Dictionary<String, AnyObject> {
            let dictionary = [
                textStorageKey : self.textStorage,
                titleKey : self.title,
                textKey : self.text
            ]
            
            return dictionary
        }
    }

    func == (lhs: Start, rhs: Start) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }


