//
//  Enums.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import Foundation
enum NetworkStatus{
      case offline
      case online
}
enum Route : String{
     //MARK:- Authennticate
       case  Articles = "mostviewed/all-sections/"
}

enum ArticlesPeroid : Int {
    case OneDay = 1
    case SevenDays = 7
    case ThirtyDays = 30
}

enum AppModes {
    case Production
    case UAT
    case QA
}

enum HTTPResponseCodes : Int{
    case OK = 200
}
enum APIResponseError : Error {
    case network
    case parsing
    case request
    
}
