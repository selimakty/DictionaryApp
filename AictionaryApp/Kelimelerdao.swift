//
//  Kelimelerdao.swift
//  DictionaryApp
//
//  Created by Selim on 29.11.2022.
//

import Foundation

class Kelimelerdao{
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKisilerAl() -> [Kelimeler] {
        var liste = [Kelimeler]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kelimeler", values: nil)
            
            while rs.next() {
                let kisi = Kelimeler(kelieme_id: Int(rs.string(forColumn: "kelime_id")!)!, kelime_ingilice: rs.string(forColumn: "ingilizce")!, kelime_turkce:  rs.string(forColumn: "turkce")!)
                
                liste.append(kisi)
            }
            
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return liste

    }
    
    
    func aramaYap(kelime:String) -> [Kelimeler] {
        var liste = [Kelimeler]()
        
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE ingilizce like '\(kelime.lowercased())%' ", values: nil)
            
            while rs.next() {
                let kisi = Kelimeler(kelieme_id: Int(rs.string(forColumn: "kelime_id")!)!, kelime_ingilice: rs.string(forColumn: "ingilizce")!, kelime_turkce:  rs.string(forColumn: "turkce")!)
                
                liste.append(kisi)
            }
            
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return liste
        
    }
}
