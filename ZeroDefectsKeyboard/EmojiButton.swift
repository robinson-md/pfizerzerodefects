//
//  EmojiButton.swift
//  ZeroDefectsKeyboard
//
//  Created by Robinson Marquez on 6/14/18.
//  Copyright © 2018 Pfizer. All rights reserved.
//

import UIKit

enum PfizerEmoji: String {
    case evernote = "\u{e902}"
    case gmail = "\u{e905}"
    case apple = "\u{e901}"
    case android = "\u{e900}"
    case facebook = "\u{e903}"
    case visualstudiocode = "\u{e908}"
}

class EmojiButton{
    
    
    var emojibtn: UIButton!
    var emojiFontName = "ZeroDefectsEmojiFonts"
    
    init(emoji: PfizerEmoji){
        emojibtn = UIButton()
        let title = emoji.rawValue
    
        emojibtn.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        emojibtn.titleLabel?.font = UIFont(name: self.emojiFontName, size: 30)
        emojibtn.setTitle(title, for: .normal)
    }
 
    func button() ->  UIButton {
         return emojibtn
    }
    
}
