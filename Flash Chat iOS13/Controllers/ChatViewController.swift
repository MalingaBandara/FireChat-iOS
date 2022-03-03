//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase // firebase lib

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore() // firestore DB
    
    var messages: [Message] = [] // messages array wanna dispaly
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self // delegate for table view data source
        
        title  = K.appName // app name
        navigationItem.hidesBackButton = true // hide back button
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier) // connect MessageCell(message bubble)
        
        loadMessages() // call 'loadMessages' method to get previous messages
    }
    
    
    
    func loadMessages(){ // to get previous messages
        
        // ******************** 🔴 get data from firestore🔴 ********************
        // db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { QuerySnapshot, error in }// 🔰  FierStore retriven 🔰
        
        db.collection(K.FStore.collectionName) // db colection name
            .order(by: K.FStore.dateField) // set data stroe in order by time
            .addSnapshotListener { QuerySnapshot, error in                              // 🔰 Start of Closures 🔰

            self.messages = [] // cleare messages array
            
            // remove optionals using if conditions
            if let e = error { // check is there have any error in data retrieve from fierstore
                print("There was an issue retrieving data form  Firestore. \(e)") // print error
                }
             
            //  👉 without any errors in data retrieve from fierstore  👇
            else{
                
                if let snapshotDocuments = QuerySnapshot?.documents { // assign messages(messages documet) to veriable   🟡
                    
                    for doc in snapshotDocuments { // Read and get all items in 'snapshotDocuments'(message document) ✍️
                        
                        let data = doc.data() // assign items in 'snapshotDocuments' to "data" veriable
                        
                        if  let messageSender = data[K.FStore.senderField] as? String, // save message sender details to "messageSender" variable as String type
                             let messageBody = data[K.FStore.bodyField] as? String{ // save message  to "messageBody" variable as String type
                            
                            let newMessage = Message(sender: messageSender, body: messageBody) // send message sender details and message to 'Message.swift'
                            self.messages.append(newMessage) // add 'newMessage'  values to 'message' array in 'ChatViewController.swift'
                            
                            
                            DispatchQueue.main.async { // load code lines main thread(do firstly) in this method
                                self.tableView.reloadData() // to reload data
                                
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0) // this line for give the raw path want to scroll
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true) // this line for to scroll
                                
                            }
                            
                            
                        }
                        
                    } // -------------------------------------------------------------------------------------------- ✍️
                     
                } // ``````````````````````````````````````````````````````````````````````````````````````````````````` 🟡
                
            }  // 👉 ...............############################............... 👆
        }                                                                             // 🔰 End of Closures 🔰
        // ******************** 🔴 .............. 🔴 ********************
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) { // send a message
        
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email  {
            
            db.collection(K.FStore.collectionName).addDocument(data: [ // to add data recoders
                
                K.FStore.senderField: messageSender, // pass the value of message sender
                K.FStore.bodyField: messageBody,  // pass the value of message
                K.FStore.dateField: Date().timeIntervalSince1970 // pass the time of message send
                
            
            ]) { (error) in //this  Closures for check the errors in data adding to database
                if let e = error {
                    print("There was an issue saveing data to firestore, \(e)")
                }else{
                    print("Successfully saved data.")
                    
                    
                    DispatchQueue.main.async { // sync to Main Thread
                        
                        self.messageTextfield.text = "" // to clear msg text box after send message
                        
                    }
                    
                }
            }
            
        }
        
        
    }
     
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) { // logout action
         
        // sign out
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true) // navigate root viwe controller (welcome screen)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
      
    
}



extension ChatViewController: UITableViewDataSource { // Print messages(Bubble)
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // count of table rows
        
        return messages.count // number of messages rows
        
    }
    
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // print cells with message
        
        let  message = messages[indexPath.row] // message
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell // create cell
        
        cell.label.text =  message.body // cell text
        
        
        
        //-------------- checking , who is send this  message(current user or not)-------------------
        if message.sender == Auth.auth().currentUser?.email { // This is a message from the current user.
            
            cell.leftImageView.isHidden = true // Hide "YOU" avatar image
            //cell.rightImageView.isHidden = false // Show "ME" avatar image
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple) // change message bubble background color
            cell.label.textColor = UIColor(named: K.BrandColors.purple) // change message text color
            
        }
        else{ // this is a message from another sender
            
            cell.leftImageView.isHidden = false // Show "YOU" avatar image
            //cell.rightImageView.isHidden = true // Hide "ME" avatar image
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple) // change message bubble background color
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple) // change message text color
            
        }
        //--------------*************************************************************-------------------
        
        
        return cell // dispaly cell with components(letters, numbers, text)
        
    }
    
    
}

  
