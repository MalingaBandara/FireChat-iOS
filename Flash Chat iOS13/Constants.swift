//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Malinga Bandara on 2021-12-12.
//  Copyright © 2021 Angela Yu. All rights reserved.
//


struct K{
    
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell" // cell identifier
    static let cellNibName = "MessageCell"     // nib file name
    static let registerSegue = "RegisterToChat" // RegisterViewController navigation segue identifier
    static let loginSegue = "LoginToChat"      //  LoginViewController navigation segue identifier
    

    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}


   
