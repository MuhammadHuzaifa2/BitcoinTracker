//
//  Enum.swift
//  BitcoinTracker
//
//  Created by muhammad huzaifa on 9/15/21.
//

import Foundation

enum URLOfBitcoin: String {
    case baseURL = "https://api.nomics.com/v1/currencies/ticker?key=1d691d31d719d5cf0cf16a4f154da03e1fd3402c&ids=BTC&interval=1d,5sec&convert=USD&per-page=1"
}

enum ErrorTypes: Error {
    case decodingError
    case networkError
}
