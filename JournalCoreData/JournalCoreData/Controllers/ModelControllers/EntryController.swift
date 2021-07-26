//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Andrew Saeyang on 7/26/21.
//

import CoreData

class EntryController{
    
    // MARK: - PROPERTIES
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
     let request = NSFetchRequest<Entry>(entityName: "Entry")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
    static let shared = EntryController()
    
    // MARK: - SOT
    var entries: [Entry] = []
    
    // MARK: - CRUD
    func createEntry(title: String, body: String){
        
        //DCHECK: Date init?
        let newEntry = Entry(title: title, bodytext: body)
        
        entries.append(newEntry)
        
        CoreDataStack.saveContext()
        
    }
    
    func fetchEntries(){
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        
        //print(entries.count)
        
        self.entries = entries
        
    }
    
    func updateEntry(entry: Entry, title: String, bodytext: String){
        entry.title = title
        entry.bodytext = bodytext
        
        CoreDataStack.saveContext()
        
    }
    
    func deleteEntry(entry: Entry){
        
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
        CoreDataStack.saveContext()
    }
}

