//
//  ViewController.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 15.01.2025.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDataSource {
    
    let viewModel = CharacterListViewModel()
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Star Wars Characters"
        
        setupTableView()
        
        viewModel.fetchCharacters()
        
        viewModel.onDataFetched = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let character = viewModel.character(at: indexPath.row)
        cell.textLabel?.text = character.name
        return cell
    }


}

