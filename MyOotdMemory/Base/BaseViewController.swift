//
//  BaseViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
    }
    

     func configureView(){
        view.backgroundColor = .white
         view.tintColor = .black
         // 다크 모드 변경 하기,,,
    }
    func setConstraints(){

    }

}