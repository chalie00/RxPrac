//
//  ObsEvent.swift
//  RxSwift Study
//
//  Created by chalie on 2021/12/23.
//

import Foundation
import RxSwift

protocol ObsModelProtocol {
    func combineData(streamOn: Int?, streamData: Int?) -> Observable<Void>
}

class ObsModel: ObsModelProtocol {
    
    func combineData(streamOn: Int?, streamData: Int?) -> Observable<Void> {
        
    }
}//End Of The Class


