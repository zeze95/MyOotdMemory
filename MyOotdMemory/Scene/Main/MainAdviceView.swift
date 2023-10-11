//
//  MainAdviceView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/01.
//

import UIKit
import SnapKit

class MainAdviceView: BaseView {
    let dataSource: [UIColor] = [.orange, .brown, .blue, .gray, .cyan]
    var subTitle = SubTitleLabel(text: "오늘의 추천 옷차림")
    
    lazy var adviceCollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(MainAdviceCollectionViewCell.self, forCellWithReuseIdentifier: "MainAdviceCollectionViewCell")
        view.delegate = self
        view.dataSource = self
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    private func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        let size = UIScreen.main.bounds.width - 40 //self.frame.width
        DispatchQueue.main.async {
            lazy var heig = self.frame.height
             layout.itemSize = CGSize(width: size / 2, height: heig )
        }
        return layout
    }
    override func configure() {
        addSubview(subTitle)
        adviceCollectionView.dataSource = self
        adviceCollectionView.delegate = self
        addSubview(adviceCollectionView)
    }
    
    override func setConstraints() {
        subTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        adviceCollectionView.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(19)
            make.leading.equalTo(subTitle.snp.leading)
            make.trailing.equalTo(subTitle.snp.trailing)
            make.bottom.equalToSuperview()
            
        }
    }

}

extension MainAdviceView : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainAdviceCollectionViewCell", for: indexPath) as! MainAdviceCollectionViewCell
        cell.backgroundColor = dataSource[indexPath.row]
        return cell
    }
    
    
}
