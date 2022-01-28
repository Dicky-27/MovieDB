//
//  Persistence.swift
//  MovieDB
//
//  Created by Dicky Buwono on 27/01/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MovieDB")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error : \(error.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in}) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func delete(withID: Int64, completion: @escaping (Error?) -> () = {_ in}) {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d" ,withID)
        let context = container.viewContext
        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            save(completion: completion)
        } catch {
            completion(error)
        }
    }
}
