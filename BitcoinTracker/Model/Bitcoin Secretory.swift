//
//  Bitcoin Secretory.swift
//  BitcoinTracker
//
//  Created by muhammad huzaifa on 9/15/21.
//

import Foundation

struct BitcoinSecretary {
    static var shared = BitcoinSecretary()
    
    func getBitcoinData(url: String, completition: @escaping (DataModel?, ErrorTypes?) -> ()) {
        NetworkService.shared.networkCall(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = try JSONDecoder().decode([DataModel].self, from: data as! Data)
                    DispatchQueue.main.async {
                        for i in jsonDecoder{
                        completition(i, nil)
                        }
                    }
                } catch {
                    completition(nil, .decodingError)
                }
            case .failure(_):
                completition(nil, .networkError)
            }
        }
    }
}
