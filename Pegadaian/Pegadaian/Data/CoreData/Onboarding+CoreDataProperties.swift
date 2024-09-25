//
//  Onboarding+CoreDataProperties.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 24/09/24.
//
//

import Foundation
import CoreData


extension Onboarding {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Onboarding> {
        return NSFetchRequest<Onboarding>(entityName: "Onboarding")
    }

    @NSManaged public var id: String?
    @NSManaged public var imageName: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?

}

extension Onboarding : Identifiable {

}
