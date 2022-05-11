//
//  TitleVC.swift
//  final-ios-assessment
//
//  Created by John Sag on 5/11/22.
//

import Foundation
import UIKit


class TitleVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: Fruit? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = model?.title
    }
}
