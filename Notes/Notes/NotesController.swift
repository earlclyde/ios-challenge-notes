//
//  NotesController.swift
//  Notes
//
//  Created by Mason Earl on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NotesController {
    
    static let sharedInstance = NotesController()
    var notes: [Note]
    private let notesKey = "notes"
    
    init(){
        self.notes = [] }
    
    func addNote(note: Note) {
        notes.append(note) }
    
    func removeNote(note: Note) {
        if let index = notes.indexOf(note) {
            notes.removeAtIndex(index) }}
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(notes.map{$0.dictionaryCopy}, forKey: notesKey )}
    
    func loadFromPersistentStorage() {
        guard let notesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(notesKey) as? [[String: AnyObject]] else { return }
        notes = notesDictionaryArray.flatMap{Note(dictionary: $0) }}}

