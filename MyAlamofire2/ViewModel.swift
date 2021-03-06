//
//  ViewModel.swift
//  MyAlamofire2
//
//  Created by λ°νμ°¬ on 2022/03/26.
//

import SwiftUI
import Alamofire
import Combine

class ViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var viewmodel = [Joke]()
    
    let baseurl = "http://api.icndb.com/jokes/random"
    
    init() {
        print("πΉ")
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
//                    //print(" π£ \(_result[2].joke)")
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
                print("π»ββοΈ λ°μ΄ν° μ€νΈλ¦Ό μλ£")
            }, receiveValue: { recivedValue in
                print(" π»ββοΈ \(recivedValue[0].joke)")
                self.viewmodel = recivedValue
            }).store(in: &subscription)
    }
}
