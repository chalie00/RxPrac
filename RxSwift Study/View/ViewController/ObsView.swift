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
    
    private lazy var viewModel = ObsVM(startNoObs: startNo.rx.text.asObservable(), endNoObs: endNo.rx.text.asObservable(), model: ObsModel())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startNo.delegate = self
        self.endNo.delegate = self
        
        defaultSetting()
        
        viewModel.validationText.bind(to: resultTxtLb.rx.text).disposed(by: disposeBag)
        
        
    }
    
    func defaultSetting() {
        startNo.keyboardType = .numberPad
        endNo.keyboardType = .numberPad
    }
    
    //Action
    @IBAction func pressedOn(_ sender: UIButton) {
        print("Was On Pressed")
        let startStr = startNo.text
        let endStr = endNo.text
        let strInt = Int(startStr!)
        let endInt = Int(endStr!)
        if startStr != "" && endStr != "" {
            viewModel.generateArray(start: strInt!, end: endInt!)
        }
    }
    
    @IBAction func pressedOff(_ sender: UIButton) {
        print("Was Off Pressed")
    }
    

}//End Of The Class

extension ObsView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(self.startNo.isFirstResponder || self.endNo.isFirstResponder) {
            self.startNo.resignFirstResponder()
            self.endNo.resignFirstResponder()
        }
    }
}

