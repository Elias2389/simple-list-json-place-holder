//
//  DetailViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Andres Rivas on 16/09/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUser(user: User) {
        print("This is the user selected: \(user.email)")
    }

}
