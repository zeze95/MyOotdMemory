//
//  CreateViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit


class CreateViewController: BaseViewController {
    let dataSource: [UIColor] = [.orange, .brown, .blue, .gray, .cyan]
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
//        view.backgroundColor = .orange
        view.delegate = self
        return view
    }()


    let backView : UIView = {
        let view = UIView()
//        let insideColor = UIColor(red: 255.0 / 255.0, green: 200.0  / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
        view.backgroundColor = Constants.BaseColor.background
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(gray: 0.7, alpha: 1.0)
        view.clipsToBounds = true
        return view
    }()
    let todayWeater = CreateTodayView()
    let diaryImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(gray: 0.8, alpha: 1.0)
        return view
    }()
    lazy var searchImageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "photo"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.addTarget(self, action: #selector(searchImageButtonClicked), for: .touchUpInside)
        return view
    }()
    lazy var tempView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        view.register(CreateTempCollectionCell.self, forCellWithReuseIdentifier: "CreateTempCollectionCell")
        view.delegate = self
        view.dataSource = self
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.collectionViewLayout = collectionViewLayout()
        return view
    }()
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 100 , height: 58 )
        return layout
    }
    let textView = UITextView()
    override func configureView() {
        view.addSubview(scrollView)
        
  
        view.backgroundColor = Constants.BaseColor.backgroundColor
        scrollView.addSubview(backView)
        backView.addSubview(todayWeater)
        scrollView.addSubview(tempView)
        view.addSubview(diaryImageView)
        view.addSubview(searchImageButton)
        scrollView.addSubview(textView)
        NavBarSetting()
  
  
    }

    override func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        backView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(16)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.width.equalTo(view.bounds.width - 32)
            make.height.equalTo(76)
        }
        todayWeater.snp.makeConstraints { make in
            make.edges.equalToSuperview()
         }
         diaryImageView.snp.makeConstraints { make in
            let bounds = view.bounds.width - 32
            make.top.equalTo(backView.snp.bottom).offset(12)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-16)
             make.width.equalTo(bounds)
             make.height.equalTo(bounds * 0.6)
      
         }
        searchImageButton.snp.makeConstraints { make in
            make.trailing.equalTo(diaryImageView.snp.trailing).offset(-12)
            make.bottom.equalTo(diaryImageView.snp.bottom).offset(-12)
            make.width.height.equalTo(50)
        }
        tempView.snp.makeConstraints { make in
            make.top.equalTo(diaryImageView.snp.bottom).offset(12)
            make.leading.equalTo(todayWeater.snp.leading)
            make.trailing.equalTo(todayWeater.snp.trailing)
            make.height.equalTo(58)
        
            
        }
        textView.snp.makeConstraints { make in
            make.top.equalTo(tempView.snp.bottom).offset(12)
            make.leading.equalTo(todayWeater.snp.leading)
            make.trailing.equalTo(todayWeater.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-16)
            make.height.equalTo(200)
        }
    }
    
    
    
    func NavBarSetting() {
        let iconImage = UIImage(systemName: "chevron.backward")
        let backButton = UIBarButtonItem(image:iconImage, style: .plain, target: self, action: #selector(backButtonClick))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        title =  DateFormatter.today()
        let saveButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClick))
        let buttonCustom = UIColor(cgColor: CGColor(red: 250/255, green: 140/255, blue: 30/255, alpha: 1.0))
        saveButton.tintColor = buttonCustom
        navigationItem.rightBarButtonItem = saveButton
      
    }
    @objc func saveButtonClick(){
        print("저자앚앙")
        // 예외처리하고 값을 받아서 등록하기
        
//        let realm = try! Realm()
//      let task = DiaryTable(diaryTitle: titleTextField.text!, diaryDate: Date(), diaryContents: contentTextView.text, diaryPhotoUrl: fullUrl)
////        try! realm.write {
////            realm.add(task)
////            print("RealmAdd Succeed")
////        }
//      repository.createItem(task) // 위에줄것이 이렇게 바뀜
//      if userImageView.image != nil {
//          saveImageToDocument(fileName: "Add_\(task._id).jpg", image: userImageView.image!)
//      } // 이지지 이름을 지정할떄 모든 글마다 고유하게 가지는 _id를 이용하기
//      
//      
//      navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClick(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
       }
    @objc func searchImageButtonClicked() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
}

extension CreateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            diaryImageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
}
extension CreateViewController : UICollectionViewDelegate ,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateTempCollectionCell", for: indexPath) as! CreateTempCollectionCell
        cell.backgroundColor = dataSource[indexPath.row]
        cell.tempButton.backgroundColor = dataSource[indexPath.row]
        cell.tempButton.setTitle("\(dataSource[indexPath.row])", for: .normal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}
