//
//  YapilacaklarKayit.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import UIKit

class YapilacaklarKayit: UIViewController {

    @IBOutlet weak var tfYapilacaklarBaslik: UITextField!
    @IBOutlet weak var tfYapilacaklarKonu: UITextField!
    
    var viewModel = YapilacaklarKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let konu = tfYapilacaklarKonu.text, let name = tfYapilacaklarBaslik.text {
            viewModel.kaydet(name: name,konu: konu)
        }
    }
    
   

}
