//
//  YapilacaklarGuncelle.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import UIKit

class YapilacaklarGuncelle: UIViewController {
    
    @IBOutlet weak var tfYapilacaklarBaslik: UITextField!
    @IBOutlet weak var tfYapilacaklarKonu: UITextField!
    
    var yapilacaklar:YapilacaklarModel?
    
    var viewModel = YapilacaklarGuncelleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacaklar {
            tfYapilacaklarKonu.text = y.konu
            tfYapilacaklarBaslik.text = y.name
        }
        
    }
    

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let y = yapilacaklar, let konu = tfYapilacaklarKonu.text, let name = tfYapilacaklarBaslik.text {
            viewModel.guncelle(yapilacaklar: y, name: name, konu: konu)
        }
    }
    

}
