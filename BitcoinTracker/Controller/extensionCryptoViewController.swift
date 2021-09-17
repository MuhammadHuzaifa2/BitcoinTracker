//
//  extensionViewController.swift
//  BitcoinTracker
//
//  Created by muhammad huzaifa on 9/15/21.
//

import UIKit
import SVGKit

extension CryptoViewController {
  
    func convertStringToImages(svg: String, bitImage: UIImageView) {
        let stringUrl = URL(string: svg)
        let urlData = try! Data(contentsOf: stringUrl!)
        let rec: SVGKImage = SVGKImage(data: urlData)
        bitImage.image = rec.uiImage
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.refreshData), userInfo: nil, repeats: true)
        
        BitcoinSecretary.shared.getBitcoinData(url: URLOfBitcoin.baseURL.rawValue) { BTC, error in
            if let error = error{
                print(error)
            }
            DispatchQueue.main.async {
                self.price.text = BTC?.price
                self.convertStringToImages(svg: BTC!.logo_url, bitImage: self.bitcoinImage)
                
            }
            
        }
    }
    
    @objc func refreshData() -> Void{
        BitcoinSecretary.shared.getBitcoinData(url: URLOfBitcoin.baseURL.rawValue) { BTC, error in
            if let error = error{
                print(error)
            }
            DispatchQueue.main.async {
                self.price.text = BTC?.price
               
            }
        }
    }
}
