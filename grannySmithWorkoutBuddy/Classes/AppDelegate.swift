//
//  AppDelegate.swift
//  grannySmithWorkoutBuddy
//
//  Created by Jean Hoang on 2022-03-29.
//

import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var databaseName : String? = "data.db"
    var databasePath : String?
  
    var avatarOptions : [String] = ["avatar1.png","avatar2.png","avatar3.png"]
  
     
    var people : [User] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
               let documentsDir = documentPaths[0]
               databasePath = documentsDir.appending("/" + databaseName!)
               checkAndCreateDatabase()
               readUserDataFromDatabase()
        return true
    }
    
    func checkAndCreateDatabase(){
            var success = false
            let fileManager = FileManager.default
            
            success = fileManager.fileExists(atPath: databasePath!)
            
            if success {
                return
            }
            
            let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
           try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
            return
        }
    
    func readUserDataFromDatabase(){
        people.removeAll()
        
        var db : OpaquePointer? = nil
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK{
            print("Successfully opened connection to database at \(self.databasePath)")
            
            var queryStatement : OpaquePointer? = nil
            var queryStatementString : String = "select * from user"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK{
                while sqlite3_step(queryStatement) == SQLITE_ROW{
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let cname = sqlite3_column_text(queryStatement, 1)
                    let cgoal = sqlite3_column_text(queryStatement, 2)
                    let cfitness = sqlite3_column_text(queryStatement, 3)
                    let cavatar = sqlite3_column_text(queryStatement, 4)
                    
                    let name = String(cString: cname!)
                    let goal = String(cString: cgoal!)
                    let fitness = String(cString: cfitness!)
                    let avatar = String(cString: cavatar!)
                    
                    let data : User = User.init()
                    data.initWithData(theRow: id, theUsername: name, theGoal: goal, theFitness: fitness, theAvatar: avatar)
                    
                    people.append(data)
                    
                    print("User Query result")
                    print("\(id)|\(name)|\(goal)|\(fitness)|\(avatar)|")
                }
                sqlite3_finalize(queryStatement)
                
            }else{
                print("Select statament could not be prepared")
            }
            sqlite3_close(db)
        }
        else{
            print("unable to open database")
        }
    }
    
    func editUserIntoDatabase(person :User)-> Bool{
        
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK{
            
            var insertStatement : OpaquePointer? = nil
            var insertStatementString : String = "update user set username = ?, goal = ?, fitness = ?, avatar = ? where id = 1"
       
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement,nil) == SQLITE_OK{
                
                let nameStr = person.username! as NSString
                let goalStr = person.goal! as NSString
                let fitnessStr = person.fitness! as NSString
                let avatarStr = person.avatar! as NSString
                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, goalStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, fitnessStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, avatarStr.utf8String, -1, nil)
                if sqlite3_step(insertStatement) == SQLITE_DONE{
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully updated row \(rowID)")
                }else{
                    print("could not iupdate row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            }else{
                print("update statement could not be prepared")
                returnCode = false
            }
            sqlite3_close(db)
            
        }else{
            print("unable to open dataabase")
            returnCode = false
        }
   return returnCode
    }
    

      
      // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

