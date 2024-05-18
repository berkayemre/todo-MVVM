//
//  YapilacaklarRepository.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import Foundation
import RxSwift
import CoreData

class YapilacaklarRepository {
    var yapilacaklarListesi = BehaviorSubject<[YapilacaklarModel]>(value: [YapilacaklarModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func kaydet(name:String,konu:String){
        let yapilacaklar = YapilacaklarModel(context: context)
        yapilacaklar.name = name
        yapilacaklar.konu = konu
        
        appDelegate.saveContext()
    }
    
    func guncelle(yapilacaklar:YapilacaklarModel,name:String,konu:String){
        yapilacaklar.name = name
        yapilacaklar.konu = konu
        
        appDelegate.saveContext()
    }
    
    func ara(aramaKelimesi:String){
        do{
            let fr = YapilacaklarModel.fetchRequest()
            fr.predicate = NSPredicate(format: "name CONTAINS[c] %@", aramaKelimesi)
            let liste = try context.fetch(fr)
            yapilacaklarListesi.onNext(liste)
        }catch{}
    }
    
    func sil(yapilacaklar:YapilacaklarModel){
        context.delete(yapilacaklar)
        
        appDelegate.saveContext()
    }
    
    func yapilacaklariYukle(){
        do{
            let fr = YapilacaklarModel.fetchRequest()
            let liste = try context.fetch(fr)
            yapilacaklarListesi.onNext(liste)
        }catch{}
    }
}
