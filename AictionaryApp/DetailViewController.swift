//
//  DetailViewController.swift
//  AictionaryApp
//
//  Created by Selim on 29.11.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var turkishLabel: UILabel!
    
    var kelime:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let k = kelime{
            turkishLabel.text = k.kelime_turkce
            englishLabel.text = k.kelime_ingilizce
        }
    }
}
