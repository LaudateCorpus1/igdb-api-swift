//
//  Parameters.swift
//  APIWrapperPlayground
//
//  Created by Filip Husnjak on 2017-11-14.
//  Copyright © 2017 igdb. All rights reserved.
//

import Foundation

class Parameters {
    
    var offset: String = ""
    var ids: String = ""
    var fields: String = ""
    var expand: String = ""
    var limit: String = ""
    var order: String = ""
    var search: String = ""
    var scroll: String = ""
    var query: String = ""
    
    var filters: [String] = []
    
    func add(filter: String) -> Parameters {
        filters.append("&filter\(filter.replacingOccurrences(of: " ", with: ""))")
        return self
    }
    
    func add(ids: String) -> Parameters {
        self.ids = ids.replacingOccurrences(of: " ", with: "")
        return self
    }
    
    func add(offset: String) -> Parameters {
        self.offset = "&offset=\(offset.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    func add(fields: String) -> Parameters {
        self.fields = fields.replacingOccurrences(of: " ", with: "")
        return self
    }
    
    func add(expand: String) -> Parameters {
        self.expand = "&expand=\(expand.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    func add(limit: String) -> Parameters {
        self.limit = "&limit=\(limit.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    func add(order: String) -> Parameters {
        self.order = "&order=\(order.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    func add(search: String) -> Parameters {
        self.search = "?search=\(search)"
        return self
    }
    
    func add(scroll: String) -> Parameters {
        self.scroll = "&scroll=\(scroll.replacingOccurrences(of: " ", with: ""))"
        return self
    }
    
    func buildQuery(endpoint: APIWrapper.Endpoint) -> String {
        var filter: String = ""
        
        for param in filters {
            filter += param
        }
        
        query = endpoint.rawValue.lowercased()
        query += "/" + ids + search
        
        if fields != "" && search != "" {
            query += "&fields=" + fields
        }else if !fields.isEmpty {
            query += "?fields=" + fields
        }else{
            query += "?fields=*"
        }
        
        query += filter + expand + order + limit + offset + scroll
        print(query)
        
        return query
    }
    
}

