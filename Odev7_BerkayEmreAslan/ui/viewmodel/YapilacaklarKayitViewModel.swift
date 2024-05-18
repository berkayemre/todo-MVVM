//
//  YapilacaklarKayitViewModel.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import Foundation

class YapilacaklarKayitViewModel {
    var yrepo = YapilacaklarRepository()
    
    func kaydet(name:String,konu:String){
        yrepo.kaydet(name: name,konu: konu)
    }
}
