//
//  ViewController.swift
//  Odev7_BerkayEmreAslan
//
//  Created by Berkay Emre Aslan on 17.05.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacaklarTableView: UITableView!

    var yapilacaklarListesi = [YapilacaklarModel]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        _ = viewModel.yapilacaklarListesi.subscribe(onNext: {liste in
            self.yapilacaklarListesi = liste
            self.yapilacaklarTableView.reloadData()
        })
        
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.yapilacaklariYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGuncelle" {
            if let yapilacaklar = sender as? YapilacaklarModel {
                let gidilecekVC = segue.destination as! YapilacaklarGuncelle
                gidilecekVC.yapilacaklar = yapilacaklar
            }
        }
    }

}

extension Anasayfa : UISearchBarDelegate  {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == ""){
            viewModel.yapilacaklariYukle()
                
        }else{
            viewModel.ara(aramaKelimesi: searchText)
        }
    }
    
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre") as! YapilacaklarHucre
        
        let yapilacaklar = yapilacaklarListesi[indexPath.row]
        
        hucre.konuLbl.text = yapilacaklar.konu
        hucre.nameLbl.text = yapilacaklar.name
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacaklar = yapilacaklarListesi[indexPath.row]
        performSegue(withIdentifier: "toGuncelle", sender: yapilacaklar)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ contextualAction,view,bool in
            let yapilacaklar = self.yapilacaklarListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacaklar.name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ _ in
                self.viewModel.sil(yapilacaklar: yapilacaklar)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    }
    
   
    
    

