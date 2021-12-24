//
//  ObsVM.swift
//  RxSwift Study
//
//  Created by chalie on 2021/12/23.
//

import Foundation
import RxSwift

class ObsVM {
    
    let disposeBag = DisposeBag()
    var timer: Timer = Timer()
    var arrays:[Int] = []
    
//    func createTimer() {
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.generateOnNext(timer:)), userInfo: nil, repeats: true)
//    }
    
    
    func generateArray(start: Int, end: Int) {
        print("generate On Next Array")

        for i in start ... end {
            let arrayEle = i + start - 1
            arrays.append(arrayEle)
        }
        generateOnNext()
    }
        
        
     func generateOnNext() {
            let publishSub = PublishSubject<Int>()
            
            publishSub.subscribe{
                print($0)
            }.disposed(by: disposeBag)
            
            for i in 1...arrays.count {
                publishSub.onNext(self.arrays[i-1])
//                delay(2.0, closure: {
//                    print(i)
//                    publishSub.onNext(self.arrays[i-1])
//
//                })
            }
        }

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
        
// Test Code
//        let i = PublishSubject<Int>()
//            let s = PublishSubject<String>()
//
//            _ = Observable.combineLatest(i, s) {
//                "\($0) + \($1)"
//              }
//              .subscribe {
//                print("onNext: ", $0)
//              }
//
//            i.onNext(1)
//            s.onNext("A")
//            i.onNext(2)
//            s.onNext("B")
//            s.onNext("C")
//            i.onNext(3)
        

 
    
    
}//End Of The Class

