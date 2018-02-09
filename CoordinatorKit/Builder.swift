//
//  Builder.swift
//  CoordinatorKit
//
//  Created by Ian MacCallum on 2/7/18.
//

import Foundation

public protocol Buildable: class {}

open class Builder<DependencyType>: Buildable {
    
    public let dependency: DependencyType
    
    public init(dependency: DependencyType) {
        self.dependency = dependency
    }
}
