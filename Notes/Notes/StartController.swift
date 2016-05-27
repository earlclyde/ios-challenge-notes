//
//  StartController.swift
//  Notes
//

import Foundation

class StartController {
    
    private let entryKey = "entry"
    
    static let sharedController = StartController()
    
    var entries: [Entry]
    
    init() {
       
        self.entries = []
        
        self.loadFromPersistentStorage()
    }
    
    func addStart(entry: Entry) {
        
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    func removeStart(entry: Entry) {
        
        if let startIndex = entries.indexOf(entry) {
            entries.removeAtIndex(startIndex)
        }
        
        self.saveToPersistentStorage()
        
    }
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entryKey) as?
            [Dictionary< String, AnyObject>]
        
        if let startDictionaries = entryDictionariesFromDefaults {
            
            self.entries = startDictionaries.map({Entry(dictionary: $0)!})
    }
}
    func saveToPersistentStorage() {
    
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})

        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entryKey)
}
}
