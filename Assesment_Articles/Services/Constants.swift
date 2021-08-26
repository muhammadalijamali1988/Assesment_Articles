//
//  Constants.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import Foundation
class Constants {
static let mode = AppModes.Production
static let api_key = "SaL8qXTYW7xRiwcTQMPG1NYgVHYdxsQe"
static var contentExtension = ".json"
    
class var baseURL: String{
       
    switch mode {
    case .Production :
        return "https://api.nytimes.com/svc/mostpopular/v2/"
    case .UAT:
        return "https://api.nytimes.com/svc/mostpopular/v2/"
    case .QA :
    return "https://api.nytimes.com/svc/mostpopular/v2/"
   
    } // end of the switch
    
    
} // end of the baseURL

    
} // end of the class

