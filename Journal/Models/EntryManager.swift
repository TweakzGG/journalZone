//
//  EntryManager.swift
//  Journal
//
//  Created by Jackson Barnes on 9/9/21.
//

import Foundation

class EntryManager {
    static let shared = EntryManager()
    var entries: [Entry] = []
    private var fileURL: URL {
        var url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("entries")
        url.appendPathExtension("json")
        return url
    }
    
    private init(){
        loadEntries()
    }
    
    //Create
    func createEntry(title: String, contents: String){
        //make an entry
        let entry = Entry(title: title, contents: contents)
        entries.append(entry)
        saveEntries()
    }
    
    //Read
    private func loadEntries(){
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            print(error)
        }
    }
    
    //Update
    func updateEntry(entry: Entry, newTitle: String, newContents: String){
        entry.title = newTitle
        entry.contents = newContents
        saveEntries()
        
    }
    
    //Destroy
    func delete(entry: Entry){
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        saveEntries()
    }
    
    
    private func saveEntries() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            try data.write(to: fileURL)
        } catch {
            print(error)
        }
        
    }
}
