//
//  DetailsViewController.swift
//  projectOne
//
//  Created by Allef Sousa Santos on 23/10/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
