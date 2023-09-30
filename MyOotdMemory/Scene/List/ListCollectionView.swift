//
//  ListCollectionView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/02.
//

import UIKit

class ListCollectionView: BaseView {
    let dataSource: [UIColor] = [.orange, .brown, .blue, .gray, .cyan]
    lazy var collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "ListCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        let size = UIScreen.main.bounds.width - 32 //self.frame.width
        layout.itemSize = CGSize(width: size , height: 250)
        return layout
    }
    override func configure() {
        addSubview(collectionView)
        
    }
    override func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }

}

extension ListCollectionView : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.backgroundColor = dataSource[indexPath.row]
        return cell
    }
    
    
}
