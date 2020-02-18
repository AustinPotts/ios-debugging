//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Spencer Curtis on 8/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    
    // Bug #2: Representation needed to be initialized through computed property
//    var entryRepresentation: EntryRepresentation? {
//        guard let title = title,
//            let mood = mood,
//            let bodyText = bodyText,
//            let timestamp = timestamp,
//            let identifier = identifier else{return nil}
//        return EntryRepresentation(title: title, bodyText: bodyText, mood: mood, timestamp: timestamp, identifier: identifier)
//    }

    
    // Bug #4: Added discarable result
   @discardableResult convenience init(title: String,
                     bodyText: String,
                     timestamp: Date = Date(),
                     mood: String,
                     identifier: String = UUID().uuidString,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.title = title
        self.bodyText = bodyText
        self.mood = mood
        self.timestamp = timestamp
        self.identifier = identifier
    }
    
    convenience init?(entryRepresentation: EntryRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        guard let title = entryRepresentation.title,
            let bodyText = entryRepresentation.bodyText,
            let mood = entryRepresentation.mood,
            let timestamp = entryRepresentation.timestamp,
            let identifier = entryRepresentation.identifier else { return nil }
        
        self.init(title: title, bodyText: bodyText, timestamp: timestamp, mood: mood, identifier: identifier, context: context)
    }
}
