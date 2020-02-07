//
//  UnderlineTextField.swift
//  ystravel
//
//  Created by Winnis on 2020/02/03.
//  Copyright © 2020 ystravel. All rights reserved.
//

import UIKit

class UnderlineTextField: UITextField {
  
  let underline = CALayer()
  
  @IBInspectable var lineColor: UIColor = grey199Color {
    didSet{
      underline.borderColor = lineColor.cgColor
    }
  }
  
  @IBInspectable var selectedLineColor: UIColor = appColor
  
  @IBInspectable var lineHeight: CGFloat = CGFloat(1.0) {
    didSet{
      underline.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
    }
  }
  
  required init(coder aDecoder: (NSCoder)) {
    super.init(coder: aDecoder)!
    
    createUnderline()
    self.delegate = self
  }
  
  func createUnderline() {
    underline.backgroundColor = lineColor.cgColor
    underline.frame = CGRect(x: 0, y: self.frame.size.height - lineHeight, width: self.frame.size.width, height: self.frame.size.height)
    self.layer.addSublayer(underline)
    self.layer.masksToBounds = true
  }
}

extension UnderlineTextField: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.underline.backgroundColor = selectedLineColor.cgColor
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.underline.backgroundColor = lineColor.cgColor
  }
}
