//
//  CreateViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import Toast

class CreateViewController: BaseViewController {
    var fullURl: String?
    let repository = DiaryTableRepository()
    let repositoryWeather = WeatherSaveRepository()
    var weatherData :WeatherSave?
    var selectedIndexPath: IndexPath?
    var isEdit :Bool = false
    var editDate:String = ""
    var feeldefault : Int = 2
    let dataSource: [String] = ["더움","따뜻함","보통","시원함","추움"]
    let hotColor = UIColor(red: 255.0 / 255.0, green: 165.0  / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    let warmColor = UIColor(red: 255.0 / 255.0, green: 195.0  / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    let normalColor = UIColor(red: 200.0 / 255.0, green: 255.0  / 255.0, blue: 155.0 / 255.0, alpha: 1.0)
    let coolColor = UIColor(red: 155.0 / 255.0, green: 240.0  / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    let coldColor = UIColor(red: 155.0 / 255.0, green: 205.0  / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    var feel = ""
    let picker = UIImagePickerController()
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
        view.backgroundColor = Constants.BaseColor.backgroundColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = CGColor(gray: 0.8, alpha: 1.0)
        view.image = UIImage(named: "photoimg")
        view.contentMode = .scaleAspectFit
        return view
    }()
    lazy var searchImageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "photo"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = Constants.BaseColor.borderbackground
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
        view.backgroundColor = .clear
        return view
    }()
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 70 , height: 40 )
        return layout
    }
    let textViewTitle : SubTitleLabel = {
        let view = SubTitleLabel(text: "한줄 일기")
        view.label.textAlignment = .center
        return view
    }()
    let textView : UITextView = {
        let view = UITextView()
        view.textColor = Constants.BaseColor.text
        view.backgroundColor = Constants.BaseColor.backgroundColor
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.font = UIFont(name: "SUITE-Regular", size: 18)
        return view
    }()
    let placeholderLabel = {
        let view = UILabel()
        view.font = UIFont(name: "SUITE-Regular", size: 18)
        view.textColor = .lightGray
        view.text = "35자 이내로 입력해주세요."
        return view
    }()
    override func configureView() {
        view.addSubview(scrollView)
        view.backgroundColor = Constants.BaseColor.backgroundGray
        scrollView.addSubview(backView)
        backView.addSubview(todayWeater)
        scrollView.addSubview(tempView)
        scrollView.addSubview(diaryImageView)
        view.addSubview(searchImageButton)
        scrollView.addSubview(textViewTitle)
        scrollView.addSubview(textView)
        textView.addSubview(placeholderLabel)
        NavBarSetting()
        textView.delegate = self
        if isEdit {editSettig()}
        selectedIndexPath = IndexPath(item: feeldefault, section: 0)
        tempView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .centeredVertically)
    }
    
    func editSettig(){
        //여기서 데이터베이스 가져와서 어쩌고 저쩌고 하기
        let todayData = repository.findTodayData(date: DateFormatter.today())[0]
        diaryImageView.image = loadImageFromDocument(fileName: "Add_\(todayData._id).jpeg")
        textView.text = todayData.summary
        feel = todayData.feel
        placeholderLabel.isHidden = !textView.text.isEmpty
        if let index = dataSource.firstIndex(of: todayData.feel) {
            feeldefault = index
        }
        tempView.reloadData()
    }

    override func setConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        backView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(16)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.width.equalTo(view.bounds.width - 32)
            make.height.equalTo(56)
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
             make.height.equalTo(bounds * 0.65)
      
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
            make.height.equalTo(48)
        }
        textViewTitle.snp.makeConstraints { make in
            make.top.equalTo(tempView.snp.bottom).offset(24)
            make.leading.equalTo(todayWeater.snp.leading)
            make.trailing.equalTo(todayWeater.snp.trailing)
            make.height.equalTo(24)
        }
        textView.snp.makeConstraints { make in
            make.top.equalTo(textViewTitle.snp.bottom).offset(16)
            make.leading.equalTo(scrollView.snp.leading).offset(16)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-16)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-16)
            make.height.equalTo(60)
        }
        placeholderLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            if newText.count > 35 {
                self.view.makeToast("글자 수 제한을 초과했습니다.(35자 이내)", duration: 2.0, position: .center)
                return false
            }
            return true
        }
    
    func NavBarSetting() {
        let iconImage = UIImage(systemName: "chevron.backward")
        let backButton = UIBarButtonItem(image:iconImage, style: .plain, target: self, action: #selector(backButtonClick))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        title = DateFormatter.today()
        let saveButton = UIBarButtonItem(title: isEdit ? "수정" :"저장", style: .plain, target: self, action: #selector(saveButtonClick))
        let buttonCustom = Constants.BaseColor.point
        saveButton.tintColor = buttonCustom
        navigationItem.rightBarButtonItem = saveButton
      
    }
    @objc func saveButtonClick(){
        let weatherData = repositoryWeather.fetch()
        // 예외처리하고 값을 받아서 등록하기
        var photoId = ""
        if weatherData.count != 0 {
           let weathers = weatherData[weatherData.count-1]
            let inputData = DiaryTable(date: DateFormatter.today() , temp: weathers.temp, weather: weathers.descrip, feel: feel, summary: textView.text, photo: fullURl)
            
            if isEdit { // 수정
                let todayData = repository.findTodayData(date: DateFormatter.today())[0]
                repository.removeImageFromDocument(fileName: "Add_\(todayData._id).jpeg")
                repository.updateItem(id: todayData._id, feel: feel, photo: fullURl, summary: textView.text)
                photoId = "\(todayData._id)"
            }else { // 생성
                repository.createItem(inputData)
                photoId = "\(inputData._id)"
            }
            if diaryImageView.image != nil {
                saveImageToDocument(fileName: "Add_\(photoId).jpeg", image: diaryImageView.image!)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backButtonClick(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
       }
    @objc func searchImageButtonClicked() {
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        picker.navigationBar.tintColor = .black
        picker.toolbar.tintColor = .black
        picker.navigationBar.topItem?.rightBarButtonItem?.title = "저장"
        picker.navigationBar.topItem?.leftBarButtonItem?.title = "취소"
        picker.navigationBar.topItem?.title = "사진 선택"
        present(picker, animated: true) // 물어보기 .한글전환
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateTempCollectionCell", for: indexPath) as? CreateTempCollectionCell else { return UICollectionViewCell() }
        let dataColor : [UIColor] = [hotColor,warmColor,normalColor,coolColor,coldColor]
        cell.tempButton.setTitle("\(dataSource[indexPath.row])", for: .normal)
        if indexPath == selectedIndexPath {
                    cell.tempButton.backgroundColor =  Constants.BaseColor.borderbackground
                } else {
                    cell.tempButton.backgroundColor = dataColor[indexPath.row]
                }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let dataColor : [UIColor] = [hotColor,warmColor,normalColor,coolColor,coldColor]
        if let previousIndexPath = selectedIndexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath) as! CreateTempCollectionCell
                previousCell.tempButton.backgroundColor = dataColor[indexPath.row]
                previousCell.tempButton.setTitleColor(.black, for: .normal)
                }
        //선택한 셀
        let cell = collectionView.cellForItem(at: indexPath) as! CreateTempCollectionCell
        cell.tempButton.backgroundColor = .gray
        cell.tempButton.setTitleColor(.white, for: .normal)
        selectedIndexPath = indexPath
        feel = dataSource[indexPath.item]
        print("선택",feel)
    }
    
}

extension CreateViewController : UITextViewDelegate {
    
    
}
