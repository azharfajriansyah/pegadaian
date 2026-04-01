//
//  CoreDataHelper.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//

import Foundation
import CoreData

public class CoreDataHelper {
    // MARK: - Core Data stack
    
    static let shared = CoreDataHelper()

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
    
    func createOnboardingContent(imageName: String, copywriting: String) {
        let context = persistentContainer.viewContext
        let onboardingContent = OnboardingContent(context: context)
        onboardingContent.id = UUID().uuidString
        onboardingContent.imageName = imageName
        onboardingContent.copywriting = copywriting
        
        do {
            try context.save() // Save the new user to the persistent store
            print("Onboarding content created successfully")
        } catch {
            print("Failed to create onboarding content: \(error)")
        }
    }
    
    func fetchAllOnboardingContent() -> [OnboardingContent]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<OnboardingContent> = OnboardingContent.fetchRequest()
        
        do {
            let onboardingContent = try context.fetch(fetchRequest)
            return onboardingContent
        } catch {
            print("Failed to fetch onboarding content: \(error)")
            return nil
        }
    }
    
    func fetchOnboardingWithID(id: String) -> OnboardingContent? {
        let fetchRequest: NSFetchRequest<OnboardingContent> = OnboardingContent.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let onboardingContents = try persistentContainer.viewContext.fetch(fetchRequest)
            return onboardingContents.first
        } catch {
            debugPrint("Failed to fetch onboarding content: \(error)")
            return nil
        }
    }
    
    func updateOnboardingContentWith(id: String, newImageName: String, newCopywriting: String) {
        if let onboardingContent = fetchOnboardingWithID(id: id) {
            onboardingContent.imageName = newImageName
            onboardingContent.copywriting = newCopywriting
            
            do {
                try persistentContainer.viewContext.save()
                debugPrint("Onboarding content updated successfully")
            } catch {
                debugPrint("Failed to update onboarding content: \(error)")
            }
        }
    }
}
