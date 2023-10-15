//
//  GlobalConstant.swift
//  Runner
//
//  Created by Lathiya Jayesh on 15/10/23.
//

import Foundation

//MARK: - STORYBOARD
struct STORYBOARD {
    static let MAIN = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - VIEW_CONTROLLER
enum MAIN_STORYBOARD: String {
    case NewsDetailVC
}

//MARK: - DATE_FORMMATE
enum DATE_FORMATE : String{
    case DATE1 = "yyyy-MM-dd'T'HH:mm:ssZ"
    case DATE2 = "dd-MM-yyyy"
    case DATE3 = "hh:mm a"
    case DATE4 = "yyyy-MM-dd"
    case DATE5 = "MMM yyyy"
    case DATE6 = "dd-MM-yyyy HH:mm:ss"
    case DATE7 = "YYYY-MM-dd'T'HH:mm:ss.ssssZ"
    case DATE8 = "d MMM hh:mm a"
    case DATE9 = "dd/MM/yyyy"
    case DATE10 = "MMMM d, yyyy"

    func getValue() ->String {
        return self.rawValue
    }
}
