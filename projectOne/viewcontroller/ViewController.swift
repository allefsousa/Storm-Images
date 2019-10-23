//
//  ViewController.swift
//  projectOne
//
//  Created by Allef Sousa Santos on 18/10/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        // get images default package
        let fm = FileManager.default
        guard let path = Bundle.main.resourcePath else {return}
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
               pictures.append(item)
                print(pictures)
            }
        }

       
    }
    
    // size table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // format Row TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    //seleted item event
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc  = storyboard?.instantiateViewController(identifier: "detail") as? DetailsViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

