//
//  ViewController.swift
//  FormNetworkExample
//
//  Created by CheckShirt on 2020/09/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = LottoService()
        service.fetchLottoNumber(905) { (lotto) in
            print(lotto.description)
        } failture: { (error) in
            print(error.localizedDescription)
        }
    }
}

