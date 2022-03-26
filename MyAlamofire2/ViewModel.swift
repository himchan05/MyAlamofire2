//
//  ViewModel.swift
//  MyAlamofire2
//
//  Created by 박힘찬 on 2022/03/26.
//

import SwiftUI
import Alamofire
import Combine

class ViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var viewmodel = [Joke]()
    
    let baseurl = "http://api.icndb.com/jokes/random"
    
    init() {
        print("🐹")
        fetchData()
    }
    
    func fetchData(count: Int = 45) {
//        AF.request(baseurl+"/\(count)")
//            .responseDecodable(of: JokesData.self) { response in
//                switch response.result {
//                case .success(let res):
//                    print(res)
//                    print(response.value)
//                    guard let _result = response.value?.value else { return }
//                    //print(" 🐣 \(_result[2].joke)")
//                    self.viewmodel = _result
//
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
        
        AF.request(baseurl+"/\(count)")
            .publishDecodable(type: JokesData.self)
            .compactMap { $0.value }
            .map { $0.value }
            .sink(receiveCompletion: { completion in
                print("🐻‍❄️ 데이터 스트림 완료")
            }, receiveValue: { recivedValue in
                print(" 🐻‍❄️ \(recivedValue[0].joke)")
                self.viewmodel = recivedValue
            }).store(in: &subscription)
    }
}
