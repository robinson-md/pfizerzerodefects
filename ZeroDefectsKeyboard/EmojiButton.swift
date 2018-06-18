//
//  EmojiButton.swift
//  ZeroDefectsKeyboard
//
//  Created by Robinson Marquez on 6/14/18.
//  Copyright © 2018 Pfizer. All rights reserved.
//

//import Foundation
import UIKit

class EmojiButton{
    
    
    var btn: UIButton!
    var image: UIImage!
    
    
    init(withImageName imageName: String){
        btn = UIButton()
        image = UIImage(named: imageName)
        
        btn.frame = CGRect(x: 15, y: 54, width: 60, height: 60)
        btn.setImage(image, for: .normal)
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5, bottom: 5, right: 5)
        btn.backgroundColor = UIColor.darkGray
    }
    
 
    func button() ->  UIButton {
         return btn
    }
    
}
