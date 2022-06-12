//
//  ProfileHeaderView.swift
//  Profile
//
//  Created by Алексей Маяков on 04.06.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    // Создание UI элементов
   
    
    
    private var  statusText  = ""
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "morty")
        return imageView
    }()
    
    
        private lazy var headerLabelView: UILabel = {
            let headerView = UILabel()
            headerView.text = "   Evil Morty"
            headerView.font = .boldSystemFont(ofSize: 18)
            headerView.textColor = .black
            headerView.translatesAutoresizingMaskIntoConstraints = false
            return headerView
        }()
    
    private lazy var uiBotton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemIndigo
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.cornerRadius = 15
        setStatusButton.backgroundColor = .blue
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show Status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        return setStatusButton
    }()
/*
    private lazy var SetTextView: UITextView = {
        let setStatus = UITextView()
        setStatus.text = "aaaaaas"
        setStatus.layer.cornerRadius = 12
        setStatus.font = UIFont(name: "regular", size: 15)
        setStatus.layer.borderWidth = 1
        setStatus.layer.backgroundColor = .init(red: 255, green: 255, blue: 255, alpha: 1)
        setStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return setStatus
    }()
  */
    private lazy var uiLabelStatus: UILabel = {
        let statusTextLabel = UILabel()
        statusTextLabel.text = "Waiting for something..."
        statusTextLabel.font = UIFont(name: "regular", size: 14)
        statusTextLabel.textColor = .gray
        statusTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return  statusTextLabel
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.pushButton()
    }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func pushButton(){
       
        uiBotton.addTarget(self, action: #selector(doOnButton), for: .touchUpInside)
    }
    
    
   private func  setupView(){
    // Добавление элементов во view
        self.addSubview(self.avatarImageView)
    self.addSubview(self.headerLabelView)
    self.addSubview(self.uiBotton)
    self.addSubview(self.uiLabelStatus)
    // Создаём расположение для ui  элементов
    NSLayoutConstraint.activate([
        //Расположение картинки
        self.avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
        self.avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        self.avatarImageView.widthAnchor.constraint(equalToConstant: 100),
        self.avatarImageView.heightAnchor.constraint(equalToConstant: 100),
        
       //Расположение лэйбла
        self.headerLabelView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
        self.headerLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),  
        self.headerLabelView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0 ),
        self.headerLabelView.widthAnchor.constraint(equalToConstant: 265),
        self.headerLabelView.heightAnchor.constraint(equalToConstant: 20),
        
        //Расположение кнопки
    
       self.uiBotton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant:16 ),
       self.uiBotton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16), 
        self.uiBotton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16 ),
       self.uiBotton.widthAnchor.constraint(equalToConstant: 260),
        self.uiBotton.heightAnchor.constraint(equalToConstant: 50),
        
        // Расположение TextView
        
       //self.uiTextView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant:0 ),
       self.uiLabelStatus.bottomAnchor.constraint(equalTo: uiBotton.topAnchor, constant:-34),
        self.uiLabelStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
       self.uiLabelStatus.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 0),
        self.uiLabelStatus.widthAnchor.constraint(equalToConstant: 265),
         self.uiLabelStatus.heightAnchor.constraint(equalToConstant: 40),
         
        
                                    ])
    
    
    
    
    }
    // Добавьте обработку нажатия по кнопке addTarget, UIEvent выбрать .touchUpInside. Добавьте функцию, которую будет принимать обработчик, например, @objc func buttonPressed()
    @objc func doOnButton(){
        print(uiLabelStatus.text!)
            }
    
   /*
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "empty"
    }
    */
    
}


