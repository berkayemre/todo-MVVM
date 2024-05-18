//
//  YapilacaklarGuncelleViewModel.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import Foundation

class YapilacaklarGuncelleViewModel{
    var yrepo = YapilacaklarRepository()
    
    func guncelle(yapilacaklar:YapilacaklarModel,name:String,konu:String){
        yrepo.guncelle(yapilacaklar: yapilacaklar, name: name,konu: konu)
    }
    
}
