//
//  Kelimeler.swift
//  AictionaryApp
//
//  Created by Selim on 29.11.2022.
//

import Foundation

class Kelimeler{
    
    var kelieme_id:Int?
    var kelime_ingilizce:String?
    var kelime_turkce:String?
    
    init(){
        
    }
    
    init(kelieme_id:Int,kelime_ingilice:String,kelime_turkce:String){
        self.kelieme_id = kelieme_id
        self.kelime_ingilizce = kelime_ingilice
        self.kelime_turkce = kelime_turkce
    }
}
