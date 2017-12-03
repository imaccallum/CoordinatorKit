//
//  Config.swift
//  CoordinatorKitDemo
//
//  Created by Ian MacCallum on 11/1/17.
//

import Foundation

public protocol ConfigProvidingType: class {
    var config: ConfigType { get }
}

public protocol ConfigType {
    var environment: Environment { get }
    var appVersion: String { get }
    var buildNumber: String { get }
    var apiVersion: String { get }
    var apiEndpoint: String { get }
    var url: URL  { get }
    var locale: Locale { get }
    init(bundle: Bundle, locale: Locale)
}

public class Config: ConfigType {
    
    public let environment: Environment
    public let appVersion: String
    public let buildNumber: String
    public let apiVersion: String
    public let apiEndpoint: String
    public let locale: Locale
    
    public lazy var url: URL = URL(string: "\(self.apiEndpoint)/\(self.apiVersion)")!
    
    public required init(bundle: Bundle, locale: Locale) {
        self.locale = locale
        
        let endpoints = bundle.object(forInfoDictionaryKey: "API Endpoints") as! [String: String]
        let env = bundle.object(forInfoDictionaryKey: "Environment") as! String

        environment = Environment(rawValue: env.lowercased()) ?? .release
        
        apiEndpoint = endpoints[env]!
        appVersion = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        
        buildNumber = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        apiVersion = bundle.object(forInfoDictionaryKey: "API Version") as! String
    }
}

