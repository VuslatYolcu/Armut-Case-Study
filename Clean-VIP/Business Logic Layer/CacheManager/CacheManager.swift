//
//  CacheManager.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

/// Manages in memory session scoped API caches
final class CacheManager {
    // API URL: Data
    
    private var cacheDictionary: [ServiceEndpoint: NSCache<NSString, NSData>] = [:]
    private var cache = NSCache<NSString, NSData>()
    
    
    init() {
        setupCache()
    }
    
    // MARK: - Public
    public func cachedResponse(for endpoint: ServiceEndpoint, url: URL?) -> Data? {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as Data?
    }
    
    public func setCache(for endpoint: ServiceEndpoint, url: URL?, data: Data) {
        guard let targetCache = cacheDictionary[endpoint], let url = url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    // MARK: - Private
    private func setupCache() {
        ServiceEndpoint.allCases.forEach { endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        }
    }
}
