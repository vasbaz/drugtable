//
//  Singleton.swift
//  Drugtable
//
//  Created by Danila Vasilchenko-Bazarov on 16.11.2021.
//

protocol Singleton {
    static var shared: Self { get }
}
