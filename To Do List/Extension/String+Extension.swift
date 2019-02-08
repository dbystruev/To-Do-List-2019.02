//
//  String+Extension.swift
//  To Do List
//
//  Created by Denis Bystruev on 07/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

extension String {
    var name: String {
        return components(separatedBy: "/").last ?? ""
    }
}
