//
//  Start.swift
//  Notes
//
//  Created by Mason Earl on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let timestampKey = "timestamp"
    private let titleKey = "title"
    private let textKey = "text"
    
    
    var timestamp: NSData
    var title: String
    var text: String
    
    init(timestamp: NSData = NSData(), title: String, text: String) {
        
        self.timestamp = timestamp
        self.title = title
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let textStorage = dictionary[timestampKey] as? NSDate,
            let title = dictionary[titleKey] as? String,
            let text = dictionary[textKey] as? String else {
                
                //Set values for stored properties due to requirement as of swift 2.0
                self.timestamp = NSData()
                self.text = ""
                self.title = ""
                
                return nil
        
        }
        
        func dictionaryCopy() -> Dictionary<String, AnyObject> {
            let dictionary = [
                timestamp : self.timestamp,
                titleKey : self.title,
                textKey : self.text
            ]
            return dictionary
        }
    }

    func == (lhs: Entry, rhs: Entry) -> Bool {
        return ObjectIdentifier(lhs)==ObjectIdentifier(rhs)
    }

