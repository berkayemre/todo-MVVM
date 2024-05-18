//
//  AnasayfaViewModel.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var yrepo = YapilacaklarRepository()
    var yapilacaklarListesi = BehaviorSubject<[YapilacaklarModel]>(value: [YapilacaklarModel]())
    
    init() {
        yapilacaklarListesi = yrepo.yapilacaklarListesi
    }
    
    func ara(aramaKelimesi:String){
        yrepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacaklar:YapilacaklarModel){
        yrepo.sil(yapilacaklar: yapilacaklar)
        yapilacaklariYukle()
    }
    
    func yapilacaklariYukle(){
        yrepo.yapilacaklariYukle()
    }
}
