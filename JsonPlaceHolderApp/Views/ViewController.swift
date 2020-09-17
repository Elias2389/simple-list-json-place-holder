//
//  ViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Andres Rivas on 14/09/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let urlApiString: String = "https://jsonplaceholder.typicode.com/users"
    var model: [User] = []
    var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchService()
        setupView()

    }
    
    private func setupView() {
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CustomViewCell", bundle: nil), forCellReuseIdentifier: "custom-view")
        tableView.delegate = self
    }
    
    func fetchService() {
        guard let endpoint = URL(string: urlApiString) else {
            return
        }
        
        AF.request(endpoint, method: .get, parameters: nil).responseData { (response: AFDataResponse<Data>) in
            if response.error != nil {
                print("Error")
                return
            }
            
            guard
                let dataFromService = response.data,
                let data: [User] = try? JSONDecoder().decode([User].self, from: dataFromService) else {
                return
            }
            self.model = data
            self.tableView.reloadData()
            
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom-view", for: indexPath)
        
        if let customCell = cell as? CustomViewCell {
            customCell.setupCell(title: self.model[indexPath.row].name, subtitle: self.model[indexPath.row].email)
        }
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "send-detail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedUser = self.model[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "send-detail" {
            let destine = segue.destination as! DetailViewController
            destine.setUser(user: self.selectedUser!)
        }
    }
}

