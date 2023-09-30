//
//  ListViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit


class ListViewController: BaseViewController {
    var data = ["항목 1", "항목 2", "항목 3", "항목 4", "항목 5"]
    var selector = UIPickerView()
    var subTitle = SubTitleLabel(text: "온도 선택")
    
    
    
    var titleTag :UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        view.textColor = .gray
        view.text = " * 선택한 온도의 기록들을 보여줍니다."
//        view.textAlignment = .right
        return view
    }()
    

    let listCollectionView : ListCollectionView = {
        let view = ListCollectionView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    override func configureView() {
        view.addSubview(subTitle)
        view.addSubview(selector)
        view.addSubview(titleTag)
        view.addSubview(listCollectionView)
        selector.contentMode = .scaleToFill
        selector.delegate = self
        selector.dataSource = self
    }
    override func setConstraints() {
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(80)
            make.height.equalTo(18)
        }
        selector.snp.makeConstraints { make in
            make.leading.equalTo(subTitle.snp.trailing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.centerY.equalTo(subTitle.snp.centerY)
            make.height.equalTo(50)
        }
        titleTag.snp.makeConstraints { make in
            make.leading.equalTo(selector.snp.leading).offset(8)
            make.top.equalTo(subTitle.snp.bottom).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        }
        listCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleTag.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ListViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    // 피커뷰의 각 행에 표시할 타이틀 반환
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return data[row]
        }

        // 피커뷰에서 항목을 선택했을 때 실행될 메서드
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let selectedItem = data[row]
            print("선택된 항목: \(selectedItem)")
        }
    
}
