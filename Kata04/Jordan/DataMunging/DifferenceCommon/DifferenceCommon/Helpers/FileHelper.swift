//
//  FileHelper.swift
//  DifferenceCommon
//
//  Created by Jordan Camara on 4/20/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Foundation

public class FileHelper {
    public static func getStringResource(name: String, ofType type: String) -> String? {
        var result: String?
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: type) {
            do {
                result = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            } catch { }
        }
        return result
    }
}