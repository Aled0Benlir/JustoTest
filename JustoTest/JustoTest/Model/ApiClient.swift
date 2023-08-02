//
//  ApiClient.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import Foundation

enum ApiService: String {
    case randomUser = "https://randomuser.me/api/"
}

class ApiClient {
    func getResponse(from url: URL, completion: @escaping((Data?, Error?)) -> ()) {
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        let task = urlSession.dataTask(with: url) { data, response, error in
            completion((data, error))
        }
        task.resume()
    }
    
    func getUser(from service: ApiService, completion: @escaping((UserModel?, Error?)) -> ()) {
        guard let url = URL(string: service.rawValue) else { return }
        getResponse(from: url) { (data, error) in
            if let data = data, error == nil {
                let  userResponse = try? JSONDecoder().decode(
                    UserResponse.self,
                    from: data)
                if let user = userResponse {
                    completion(
                        (UserModel.init(user), error))
                }
            }
            completion((nil, error))
        }
    }
}
