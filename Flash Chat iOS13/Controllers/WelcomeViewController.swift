//
//  WelcomeViewController.swift
//  Flash Chat iOS13

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    //To hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true // To hide navigation bar
    }
    
    
    // to set navigation after Disappear current screen
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false // To show navigation bar
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text =  K.appName // animation lable

//        titleLabel.text = "" // set empty stringte
//              let  titleText = "⚡️FlashChat" // text should be display
//              var charIndex = 0
//              for letter in titleText { //-------for loop for continue this flow until diplay string value completely ------
//
//                  // create timer for give time space to animation load letter by letter
//                  Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { (timer) in // closer for get letters within time space
//                      self.titleLabel.text?.append(letter)// set 'titleLabel' value within animation
//                  }
//
//                  charIndex += 1
//
//              }                      //---------------------*******--------------------
              
       
    }
    
}
