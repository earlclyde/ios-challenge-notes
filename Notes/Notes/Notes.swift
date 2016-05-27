//
//  Notes.swift
//  Notes
//
//  Created by Mason Earl on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    private let titleKey = "title"
    private let textKey = "text"
    
    var title: String
    var text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text }
   
    var dictionaryCopy: [String: AnyObject]{
        return[titleKey: title, textKey: text] }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[titleKey] as? String,
            text = dictionary[textKey] as? String else { return nil }
        self.title = title
        self.text = text  }}
    
    func ==(lhs: Note, rhs: Note) -> Bool {
    return ObjectIdentifier(lhs)==ObjectIdentifier(rhs) }


    
    