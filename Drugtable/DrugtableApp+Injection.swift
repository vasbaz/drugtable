//
//  DrugtableApp+Injection.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 08.12.2021.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { AuthRepository() as AuthRepository }.scope(.application)
        register { MockDrugsRepository() as DrugsRepository }.scope(.application)
        register { MockIntervalsRepository() as IntervalsRepository }.scope(.application)
        register { MockRemindersRepository() as RemindersRepository }.scope(.application)
    }
}
