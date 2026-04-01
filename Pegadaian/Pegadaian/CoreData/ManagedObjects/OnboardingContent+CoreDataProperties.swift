//
//  OnboardingContent+CoreDataProperties.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//
//

import Foundation
import CoreData


extension OnboardingContent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OnboardingContent> {
        return NSFetchRequest<OnboardingContent>(entityName: "OnboardingContent")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var copywriting: String?
    @NSManaged public var id: String?

}

extension OnboardingContent : Identifiable {

}
