////
////  Network.swift
////  MyOotdMemory
////
////  Created by 겜팜스토어 on 10/7/23.
////
//
//import Foundation
//
//class Network {
//    
//    static let shared = Network()
//    
//    private init() { }
//    
//    func requestConvertible<T: Decodable>(type: T.Type, api: Router, comletion: @escaping (Result<T, SeSACError>) -> Void ) {
//        
//        //AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header) 줄어들었다.
//        AF.request(api).responseDecodable(of: T.self) { response in
//                switch response.result {
//                case .success(let data): comletion(.success(data))
//                case .failure(_):
//                    let statusCode = response.response?.statusCode ?? 500
//                    guard let error = SeSACError(rawValue: statusCode) else { return }
//                    comletion(.failure(error))
//                }
//            }
//        
//    }
