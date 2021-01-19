//
//  MainViewController.swift
//  NBAWidgetKit
//
//  Created by Nicholas Wang on 2021-01-18.
//

import UIKit

protocol MainDelegate: AnyObject {
    var firstPreference: [String] {get set}
    var secondPreference: [String] {get set}
    var thirdPreference: [String] {get set}
    
    func reloadView()
}

class MainViewController: UIViewController, UIGestureRecognizerDelegate, MainDelegate {

    @IBOutlet weak var firstp: UITextField!
    @IBOutlet weak var secondp: UITextField!
    @IBOutlet weak var thirdp: UITextField!
    
    var firstPreference: [String] = []
    var secondPreference: [String] = []
    var thirdPreference: [String] = []
    
    
    @objc func handleFirst() {
        self.performSegue(withIdentifier: "getTeam", sender: 1)
    }
    
    @objc func handleSecond() {
        self.performSegue(withIdentifier: "getTeam", sender: 2)
    }
    
    @objc func handleThird() {
        self.performSegue(withIdentifier: "getTeam", sender: 3)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(self.handleFirst))
        tap1.delegate = self
        firstp.addGestureRecognizer(tap1)
        
        if firstPreference.count > 0 {
            firstp.text = firstPreference[0]
        } else {
            firstp.text = "Click to select"
        }
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(self.handleSecond))
        tap2.delegate = self
        secondp.addGestureRecognizer(tap2)
        
        if secondPreference.count > 0 {
            secondp.text = secondPreference[0]
        } else {
            secondp.text = "Click to select"
        }
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(self.handleThird))
        tap3.delegate = self
        thirdp.addGestureRecognizer(tap3)
        
        if thirdPreference.count > 0 {
            thirdp.text = thirdPreference[0]
        } else {
            thirdp.text = "Click to select"
        }
        
        UserDefaults(suiteName: "group.com.nick.NBAWidgetKit")!.set("test", forKey: "test")

        // Do any additional setup after loading the view.
    }
    
    func reloadView() {
        self.viewDidLoad()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TeamViewController {
            dest.priority = sender as? Int
            dest.delegate = self
        }
    }

}
