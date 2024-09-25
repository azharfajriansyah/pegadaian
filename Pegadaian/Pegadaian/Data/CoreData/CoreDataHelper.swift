//
//  CoreDataHelper.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    static let shared = CoreDataHelper()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Pegadaian")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createOnboardingContent(imageName: String, title: String, desc: String) {
        let onboardingContent = Onboarding(context: persistentContainer.viewContext)
        onboardingContent.id = UUID().uuidString
        onboardingContent.imageName = imageName
        onboardingContent.title = title
        onboardingContent.desc = desc
        
        do {
            try persistentContainer.viewContext.save()
            debugPrint("Onboarding saved successfully")
        } catch {
            debugPrint("Failed to save onboarding, error: \(error)")
        }
    }
    
    func fetchAllOnboardingContent() -> [Onboarding]? {
        let fetchRequest: NSFetchRequest<Onboarding> = Onboarding.fetchRequest()
        
        do {
            let onboardingContents = try persistentContainer.viewContext.fetch(fetchRequest)
            return onboardingContents
        } catch {
            debugPrint("Failed to fetch onboarding content: \(error)")
            return nil
        }
    }
}
