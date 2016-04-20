//
//  AppDelegate.swift
//  WeatherData
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var textField: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let path = NSBundle.mainBundle().pathForResource("weather", ofType: "dat") {
            do {
                let data = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                let weatherData = WeatherData(data: data)
                textField.stringValue = weatherData.getDayWithMinSpread()
            } catch { }
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

