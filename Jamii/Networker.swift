//
//  Networker.swift
//  Jamii
//
//  Created by Godwin Olorunshola on 27/10/2019.
//  Copyright © 2019 Godwin Olorunshola. All rights reserved.
//

import Foundation


class Networker{
    
    func get<T: Decodable>(url : String, completion : @escaping (Result<T,APIError>) -> ()){
        guard let url  = URL(string: url) else{
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(genericModel))
                    } catch {
                        completion(.failure(.jsonConversionFailure))
                    }
                } else {
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.responseUnsuccessful))
            }
        }
        
        task.resume()
        
    }
    
    
    func test<T: Decodable>(comp : (T) -> ()){
        let genericModel = try! JSONDecoder().decode(T.self, from: Data())
        comp(genericModel)
    }

    
}
