//
//  String+Extension.swift
//  TheMovie
//
//  Created by NhiVHY on 31/01/2024.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
