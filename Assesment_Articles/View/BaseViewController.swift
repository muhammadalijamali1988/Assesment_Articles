//
//  BaseViewController.swift
//  Assesment_Articles
//
//  Created by Muhammad Ali on 25/08/2021.
//

import UIKit

//MARK:- Base Functionality
class BaseViewController: UIViewController {
    var ReachabilitySwift :  Reachability!
    var networkStatus : NetworkStatus = .online // Default Status Online
    var reachbilityTimer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupReachability()
        self.resetNavigationBar()
        self.resetTitleColor()
    }
    
    func setupReachability(){
        do
        {
            ReachabilitySwift = try Reachability()
        } catch { let error = NSError()
            print("error  \(error)")
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: ReachabilitySwift)
        do{
            try ReachabilitySwift.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        reachbilityTimer = Timer.scheduledTimer(timeInterval: 20, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)

    }
    
    @objc func runTimedCode(){
        networkStatus = ReachabilitySwift.connection == .unavailable ? .offline : .online
    }
    @objc func reachabilityChanged(note: Notification) {
        ReachabilitySwift = note.object as? Reachability
        switch ReachabilitySwift.connection {
        case .wifi:
            print("Reachable via WiFi")
            networkStatus = .online
        case .cellular:
            print("Reachable via Cellular")
            networkStatus = .online
        case .unavailable:
            networkStatus = .offline
            showAlertWithTitle(title: networkAlertTitle, message: networkAlertMessge, reference: self, type: .alert)
            
            print("Network not reachable")
           
        case .none:
            break
        }
    }

}

//MARK:- @objc Methods
extension  BaseViewController {
    @objc func onBtnBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func onBtnSideMenu(){
        showAlertWithTitle(title: sideMenuMessageTitle, message: sideMenuMessageDetail, reference: self, type: .alert)
    }
}
// MARK:- SETUP THEME
extension BaseViewController {
    func resetNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = navigationBarColor
        self.navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func resetTitleColor(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

//MARK:- NavigationButtons
extension BaseViewController {
    func addSideMenuBarButtonItem() {
        let image = UIImage(named: "SideMenu")!
        image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.onBtnSideMenu), for: .touchUpInside)
        //set frame
        
        button.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    func addMoreBarButtonItem(named: String) {
        
        let image = UIImage(systemName: named)!
        image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.tintColor = .white
       // button.addTarget(self, action: #selector(self.onBtnAddMore), for: .touchUpInside)
        //set frame
        
        button.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
}
