//
//  AppDelegate.swift
//  Football
//
//  Created by Jordan Camara on 4/19/16.
//  Copyright © 2016 Jordan Camara. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet var textField: NSTextField!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let path = NSBundle.mainBundle().pathForResource("football", ofType: "dat") {
            do {
                let data = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
                let football = Football(data: data)
                textField.stringValue = football.getMinDifferenceName()
            } catch { }
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

