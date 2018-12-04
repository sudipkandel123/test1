//
//  AppDelegate.swift
//  Wizely ios Task 1
//
//  Created by Sudip on 12/4/18.
//  Copyright © 2018 Sudeepasa. All rights reserved.
//
/*The task is -
 
 Github provides APIs to fetch for public repositories,
 
 For repo details: http://api.github.com/repos/{Org_Name}/{Repo_Name} example : - http://api.github.com/repos/Alamofire/Alamofire
 
 For getting open issues - http://api.github.com/repos/{Org_Name}/{Repo_Name}/issues?state=open
 For getting close issues - http://api.github.com/repos/{Org_Name}/{Repo_Name}/issues?state=close
 
 First Screen - There should be a screen where you can enter Organization name and repo name, with a submit button
 
 Repository Detail Screen - After submit there should be a next screen with the details of the repo, including - User name, user Image, Description, Open Issues, Closed Issues,Reposetory Language. There will be two buttons saying “Open Issues“ & “Closed Issues”
 
 Repository Issues Screen (Open/Closed) - There should be a table view with two line description of all the issues,  with user image, name, issue title, issue description (two line max).
 
 Plus Points -
 1. If you use latest version of Swift.
 2. Your code is testable and follows an architecture.
 3. Your app does not have too many dependencies on third party frameworks.
 4. Includes UI & Unit test cases.
*/
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

