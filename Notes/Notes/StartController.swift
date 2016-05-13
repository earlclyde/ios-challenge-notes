//
//  StartController.swift
//  Notes
//

import Foundation

class StartController {
    
    private let starterKey = "starter"
    
    static let sharedController = StartController()
    
    var starter: [Start]
    
    init() {
       
        self.starter = []
        
        self.loadFromPersistentStorage()
    }
    
    func addStart(start: Start) {
        
        starter.append(start)
        
        self.saveToPersistentStorage()
    }
    func removeStart(start: Start) {
        
        if let startIndex = starter.indexOf(start) {
            starter.removeAtIndex(startIndex)
        }
        
        self.saveToPersistentStorage()
        
    }
    func loadFromPersistentStorage() {
        
        let startDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(starterKey) as?
            [Dictionary< String, AnyObject>]
        
        if let startDictionaries = startDictionariesFromDefaults {
            
            self.starter = startDictionaries.map({Start(dictionary: $0)!})
    }
}
    func saveToPersistentStorage() {
    
        let startDictionaries = self.starter.map({$0.dictionaryCopy()})

        NSUserDefaults.standardUserDefaults().setObject(startDictionaries, forKey: starterKey)
}
}
