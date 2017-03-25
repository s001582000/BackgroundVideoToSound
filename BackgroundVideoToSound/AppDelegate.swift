//
//  AppDelegate.swift
//  BackgroundVideoToSound
//
//  Created by 梁雅軒 on 2017/3/24.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainView:ViewController!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        application.beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayback)
        try! session.setActive(true)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        mainView = ViewController(nibName: "ViewController", bundle: nil)
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
            self.mainView.player()
        })
        
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    override func remoteControlReceived(with event: UIEvent?) {
        if event?.type == UIEventType.remoteControl {
            if event?.subtype == UIEventSubtype.remoteControlPlay {
                mainView.player()
            }
        }
        
    }
}

