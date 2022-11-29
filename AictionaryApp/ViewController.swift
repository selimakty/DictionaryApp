//
//  ViewController.swift
//  AictionaryApp
//
//  Created by Selim on 29.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var list = [Kelimeler]()
    
    var aramaYapiliyorMu:Bool = false
    var aramaKelimesi:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        
        
        if aramaYapiliyorMu {
           list = Kelimelerdao().aramaYap(kelime: aramaKelimesi!)
        }else{
           list = Kelimelerdao().tumKisilerAl()
        }
        
        tableView.reloadData()
    }
    
    func veritabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var.Kopyalamaya gerek yok")
        }else{
            do {
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch{
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
                  
         if segue.identifier == "toDetail" {
             
             let gidilecekVC = segue.destination as! DetailViewController
             
             gidilecekVC.kelime = list[indeks!]
             
         }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dicCell", for: indexPath) as! TableViewCell
        
        cell.turkceLabel.text = list[indexPath.row].kelime_turkce
        cell.ingilizceLabel.text = list[indexPath.row].kelime_ingilizce
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        aramaKelimesi = searchText
        
        if searchText == "" {
            aramaYapiliyorMu = false
        }else{
            aramaYapiliyorMu = true
        }
        
        list = Kelimelerdao().aramaYap(kelime: aramaKelimesi!)
        
        tableView.reloadData()
    }
}

