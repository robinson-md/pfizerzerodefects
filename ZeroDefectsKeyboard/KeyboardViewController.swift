//
//  KeyboardViewController.swift
//  ZeroDefectsKeyboard
//
//  Created by Robinson Marquez on 6/12/18.
//  Copyright © 2018 Pfizer. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {

    var nextKeyboardButton: UIButton! = {
        let nextButton = UIButton(type: .system)
        
        nextButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        nextButton.sizeToFit()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        return nextButton
    }()

    // Pfizer Buttons
    let buttons = [
        EmojiButton(emoji: PfizerEmoji.apple).button(),
    ]
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.attachElements()
        self.initLayout()
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
        
        if textInput != nil{
            let initialPosition = textInput!.position(from: textInput!.endOfDocument, offset: 1)
            let endPos = textInput!.endOfDocument
            
            let t = textInput?.text(in: (textInput?.textRange(from: initialPosition!, to: endPos))!)
            
            print("Text did change ")
            print(t)
            print(initialPosition)
        }
     
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        let button = sender
        let proxy = self.textDocumentProxy
        let message = button.currentTitle
        
        proxy.insertText(message!)

    }

    
    func attachButtonsToKeyboard() {
        let square = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        square.backgroundColor = .red
        
        for pfizerButton in buttons {
            pfizerButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
            self.view.addSubview(pfizerButton)
        }
    }
    
    /*
    * Attach UI element to current view
    */
    func attachElements() {
        self.view.addSubview(self.nextKeyboardButton)
        
        self.attachButtonsToKeyboard()
    }
    
    
    /*
    * Set layout constraints for element in the view
    */
    func initLayout() {
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}
