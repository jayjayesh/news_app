//
//  AppExtensions.swift
//  Runner
//
//  Created by Lathiya Jayesh on 15/10/23.
//

import Foundation



extension UIApplication {
    class func topViewController(base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}


extension String {
  //MARK:- Convert UTC To Local Date by passing date formats value
    func UTCToLocal(incomingFormat: String, outGoingFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = incomingFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = outGoingFormat
        return dateFormatter.string(from: dt ?? Date())
    }
    
  //MARK:- Convert Local To UTC Date by passing date formats value
    func localToUTC(incomingFormat: String, outGoingFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = incomingFormat
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = outGoingFormat
        return dateFormatter.string(from: dt ?? Date())
    }
}


extension UIProgressView{
    private struct Holder {
        static var _progressFull:Bool = false
        static var _completeLoading:Bool = false;
    }

    var progressFull:Bool {
        get {
            return Holder._progressFull
        }
        set(newValue) {
            Holder._progressFull = newValue
        }
    }

    var completeLoading:Bool {
        get {
            return Holder._completeLoading
        }
        set(newValue) {
            Holder._completeLoading = newValue
        }
    }

    func animateProgress(){
        if(completeLoading){
            return
        }
        UIView.animate(withDuration: 1, animations: {
            if self.progressFull {
                self.setProgress( 1.0, animated: true)
            }else{
                self.setProgress( 0.0, animated: false)
            }
            
        })

        progressFull = !progressFull;

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.animateProgress();
        }
    }

    func startIndefinateProgress(){
        isHidden = false
        completeLoading = false
        animateProgress()
    }

    func stopIndefinateProgress(){
        completeLoading = true
        isHidden = true
    }
}
