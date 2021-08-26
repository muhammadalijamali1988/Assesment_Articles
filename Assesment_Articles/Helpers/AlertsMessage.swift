//
//  AlertsMessage.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import Foundation
import UIKit
func showAlertWithTitle(title : String , message : String, reference : UIViewController , type : UIAlertController.Style) {
    let alert = UIAlertController(title: title, message:message, preferredStyle: type)
    alert.addAction(UIAlertAction(title: okayLabel, style:.default, handler: nil))
    reference.present(alert, animated: true, completion: nil)
  }
