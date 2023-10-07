////
////  NetworkBasic.swift
////  MyOotdMemory
////
////  Created by 겜팜스토어 on 10/7/23.
////
//
//import Foundation
//import Alamofire
//
//
//    import Foundation
//    import Alamofire
//
//  
//    enum SeSACError: Int, Error, LocalizedError {
//        case unathorized = 401
//        case permisstionDenied = 403
//        case invalidServer = 500
//        case missingParameter = 400
//        
//        var errorDescription: String {
//            switch self {
//            case .unathorized:
//                return "인증 정보가 없습니다."
//            case .permisstionDenied:
//                return "권한이 없습니다."
//            case .invalidServer:
//                return "서버 점검 중입니다."
//            case .missingParameter:
//                return "검색어를 입력해주세요."
//            }
//        }
//        
//    }
//
//    final class NetworkBasic {
//        
//        static let shared = NetworkBasic()
//        private init() { }
//        
//        func callRequest(api: UnsplashAPI, query: String, comletion: @escaping (Result<Photo, SeSACError>) -> Void ) { // search photo
//            
//            AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString), headers: api.header)
//                .responseDecodable(of: Photo.self) { response in
//                    switch response.result {
//                    case .success(let data): comletion(.success(data))
//                    case .failure(_):
//                        let statusCode = response.response?.statusCode ?? 500 //상태 코드가 nil일 경우를 대비한다.
//                        guard let error = SeSACError(rawValue: statusCode) else { return }
//                        comletion(.failure(error)) //열거형 에러 던지기
//                    }
//                }
//            
//        } // search Photo
//        
//        func randomRequest(api: UnsplashAPI, completion: @escaping (Result<PhotoResult, SeSACError>) -> Void ) {
//             
//            AF.request(api.endpoint, method: api.method, headers: api.header)
//                .responseDecodable(of: PhotoResult.self) { response in
//                    switch response.result {
//                    case .success(let data): completion(.success(data))
//                    case .failure(_):
//                        let statusCode = response.response?.statusCode ?? 500
//                        guard let error = SeSACError(rawValue: statusCode) else { return }
//                        completion(.failure(error))
//                    }
//                }
//            
//        } //random
//        
//        func detailPhotoRequest(id: String, api: UnsplashAPI, completion: @escaping (Result<PhotoResult, SeSACError>) -> Void ) {
//            AF.request(api.endpoint, method: api.method, headers: api.header)
//                .responseDecodable(of: PhotoResult.self) { response in
//                    switch response.result {
//                    case .success(let data): completion(.success(data))
//                    case .failure(_):
//                        let statusCode = response.response?.statusCode ?? 500
//                        guard let error = SeSACError(rawValue: statusCode) else { return }
//                        completion(.failure(error))
//                    }
//                }
//            
//        } //random 
//    }
//struct Photo: Decodable {
//    let total: Int
//    let total_pages: Int
//    let results: [PhotoResult]
//}
//
//struct PhotoResult: Decodable {
//    let id: String
//    let created_at: String
//    let urls: PhotoURL
//}
//
//struct PhotoURL: Decodable {
//    let full: String
//    let thumb: String
//}
//
//enum SeSACError: Int, Error, LocalizedError {
//    case unauthorized = 401
//    case permissionDenied = 403
//    case invaildServer = 500
//    case missingParameter = 400
//    
//    var errorDescription: String {
//        switch self {
//        case .unauthorized:
//            return "인증 정보가 없습니다."
//        case .permissionDenied:
//            return "권한이 없습니다"
//        case .invaildServer:
//            return "서버 점검 중입니다."
//        case .missingParameter:
//            return "검색어를 입력해주세요."
//        }
//    }
//    
//}
//
//final class NetworkBasic {
//    
//    static let shared = NetworkBasic()
//    
//    private init() {}
//    
//    func request(api: SeSACAPI, query: String, completion: @escaping (Result<Photo, SeSACError>) -> Void) { //searchPhoto
//        
//        
//        AF.request(api.endpoint, method: api.method, parameters: api.query, encoding: URLEncoding(destination: .queryString) , headers: api.header).responseDecodable(of: Photo.self) { response in
//            switch response.result {
//            case .success(let data):
//                completion(.success(data))
//            case .failure(_):
//                //
//                let statusCode = response.response?.statusCode ?? 500
//                guard let error = SeSACError(rawValue: statusCode) else { return } // 오류 타입 확인
//                completion(.failure(error)) // 실패한 값만 던진다.
//            }
//        }
//    }
//    
//    func random(api: SeSACAPI, completion: @escaping (Result<PhotoResult, SeSACError>) -> Void) { //randomPhoto
//        
//        AF.request(api.endpoint, method: api.method, headers: api.header).responseDecodable(of: PhotoResult.self) { response in
//            switch response.result {
//            case .success(let data): completion(.success(data))
//            case .failure(_):
//                let statusCode = response.response?.statusCode ?? 500
//                guard let error = SeSACError(rawValue: statusCode) else { return }
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    func detailPhoto(api: SeSACAPI, id: String, completion: @escaping (Result<PhotoResult, SeSACError>) -> Void) {
//        
//        AF.request(api.endpoint, method: api.method, headers: api.header).responseDecodable(of: PhotoResult.self) { response in
//            switch response.result {
//            case .success(let data): completion(.success(data))
//            case .failure(_):
//                let statusCode = response.response?.statusCode ?? 500
//                guard let error = SeSACError(rawValue: statusCode) else { return }
//                completion(.failure(error))
//            }
//        }
//        
//    }
//    enum SeSACAPI {
//        
//        private static let key = ""
//        
//        case search(query: String)
//        case random
//        case photo(id: String)
//        
//        private var baseURL: String {
//            return "https://api.unsplash.com/"
//        }
//        
//        var endpoint: URL {
//            switch self {
//            case .search:
//                return URL(string: baseURL + "search/photos")!
//            case .random:
//                return URL(string: baseURL + "photos/random")!
//            case .photo(let id):
//                return URL(string: baseURL + "photos/\(id)")!
//            }
//        }
//        
//        var header: HTTPHeaders {
//            return ["Authorization": "Client-ID \(SeSACAPI.key)"]
//        }
//        
//        var method: HTTPMethod {
//            return .get
//        }
//        
//        var query: [String: String] {
//            switch self {
//            case .search(let query):
//                return ["query" : query]
//            case .random, .photo:
//                return ["":""]
//            }
//        }
//        
//        
//    }
//}
