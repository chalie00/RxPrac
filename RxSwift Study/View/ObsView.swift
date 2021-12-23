//
//  ViewController.swift
//  RxSwift Study
//  Created by chalie on 2021/11/26.
//


import UIKit
import RxSwift
import RxCocoa

class ObsView: UIViewController {
    
    @IBOutlet weak var resultTxtLb: UILabel!
    @IBOutlet weak var startNo: UITextField!
    @IBOutlet weak var endNo: UITextField!
    
    @IBOutlet weak var logTableView: UITableView!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Action

    @IBAction func pressedOn(_ sender: UIButton) {
        print("Was On Pressed")
    }
    
    @IBAction func pressedOff(_ sender: UIButton) {
        print("Was Off Pressed")
    }
    

}//End Of The Class


