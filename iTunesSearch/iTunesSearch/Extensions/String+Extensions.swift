//
//  String+Extensions.swift
//  iTunesSearch
//
//  Created by Guido Moyano Bertero on 28/8/18.
//  Copyright © 2018 Guido Moyano. All rights reserved.
//

import Foundation

extension String {
    
    func asSearchTerms() -> String? {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : self.replacingOccurrences(of: " ", with: "+")
    }
    
}


