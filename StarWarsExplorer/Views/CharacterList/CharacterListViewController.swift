//
//  ViewController.swift
//  StarWarsExplorer
//
//  Created by Bartuğ Kaan Çelebi on 15.01.2025.
//

import UIKit

class CharacterListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let viewModel = CharacterListViewModel()
    var collectionView: UICollectionView!
    var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Characters"
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        setupCollectionView()
        setupActivityIndicator()
        
        showActivityIndicator()
        viewModel.fetchCharacters()
        
        viewModel.onDataFetched = {
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                self.collectionView.reloadData()
            }
        }
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width / 2) - 15, height: 250)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.identifier)
        view.addSubview(collectionView)
    }
    
    private func setupActivityIndicator(){
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.color = .white
        view.addSubview(activityIndicator)
    }
    
    private func showActivityIndicator(){
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideActivityIndicator(){
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell else{
            return UICollectionViewCell()
        }
        let character = viewModel.character(at: indexPath.row)
        cell.configure(with: character)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        
        if position > contentHeight - scrollViewHeight - 100{
            showActivityIndicator()
            viewModel.fetchCharacters()
        }
    }
    


}

