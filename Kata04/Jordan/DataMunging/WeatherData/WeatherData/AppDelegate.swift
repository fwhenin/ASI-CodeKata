//
//  AppDelegate.swift
//  WeatherData
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Cocoa
import DifferenceCommon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var textField: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let data = FileHelper.getStringResource("weather", ofType: "dat") {
            let weatherData = WeatherData(data: data)
            textField.stringValue = weatherData.getMinDifferenceName()
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

