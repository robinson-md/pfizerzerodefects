//
//  KeyboardViewController.swift
//  ZeroDefectsKeyboard
//
//  Created by Robinson Marquez on 6/12/18.
//  Copyright © 2018 Pfizer. All rights reserved.
//

import UIKit

struct PfizerButton {
    let text, type: String

    init(_ text: String) {
        self.text = text
        self.type = ""
    }
}


class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    

    // Pfizer Buttons
    let buttons = [
        PfizerButton("Fix"),
//        PfizerButton("Say"),
//        PfizerButton("Prevent")
    ]
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        
        // Load custom keys
        attachButtonsToKeyboard()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    
    func createButtonWithTitle(_ title: String) -> UIButton {
        
        let button = UIButton(type: .roundedRect)
        button.setTitle(title, for: .normal)
        button.sizeToFit()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    
        //    button.frame =  (0, 0, 20, 20)
        //    button.setTranslatesAutoresizingMaskIntoConstraints(false)
        //    button.backgroundColor = UIColor(white: 1.0, alpha: 1.0)
        //    button.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        //    button.addTarget(self, action: "didTapButton:", forControlEvents: .TouchUpInside)
        
        return button
    }
    
    @IBAction func didTapButton(sender: UIButton) {
        let button = sender
        let title = button.title(for: .normal)
        let proxy = self.textDocumentProxy
        
        proxy.insertText(title!)
    }
    
    func attachButtonsToKeyboard() {
        for pfizerButton in buttons {
            let button = self.createButtonWithTitle(pfizerButton.text)
            self.view.addSubview(button)
        }
    }
    
}
