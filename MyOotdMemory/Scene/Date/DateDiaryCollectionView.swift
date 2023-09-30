//
//  DateDiary.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/02.
//

import UIKit

class DateDiaryCollectionView: BaseView {
    
    let dataSource: [UIColor] = [.orange, .brown, .blue, .gray, .cyan]
    lazy var DiaryCollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(DateDiaryCollectionViewCell.self, forCellWithReuseIdentifier: "DateDiaryCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        let size = UIScreen.main.bounds.width - 32
        layout.itemSize = CGSize(width: size, height: 250)
        return layout
    }
    override func configure() {
        DiaryCollectionView.dataSource = self
        DiaryCollectionView.delegate = self
        addSubview(DiaryCollectionView)
    }

    override func setConstraints() {
        DiaryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
         
            
        }
    }
}

extension DateDiaryCollectionView : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateDiaryCollectionViewCell", for: indexPath) as! DateDiaryCollectionViewCell
        cell.backgroundColor = dataSource[indexPath.row]
        return cell
    }
    
    
}
