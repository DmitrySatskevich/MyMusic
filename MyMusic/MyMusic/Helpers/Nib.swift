//
//  Nib.swift
//  MyMusic
//
//  Created by dzmitry on 11.05.23.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil)![0] as! T
    }
}
