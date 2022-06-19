//
//  LogInViewController.swift
//  Profile
//
//  Created by Алексей Маяков on 13.06.2022.
//
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tag = 0
        textField.placeholder = "Введите логин"
        textField.keyboardType = .phonePad
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.tag = 1
        textField.placeholder = "Введите пароль"
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var pictureVK: UIImageView = {
        let pictureVK = UIImageView()
        pictureVK.image = #imageLiteral(resourceName: "vklogo")
        pictureVK.backgroundColor = .systemRed
        pictureVK.layer.cornerRadius = 4
        pictureVK.clipsToBounds = true
        pictureVK.translatesAutoresizingMaskIntoConstraints = false
        return pictureVK
    }()
    
    private var login: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupGestures()
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        //self.stackView.addArrangedSubview(self.button)
        self.scrollView.addSubview(self.pictureVK)
        self.scrollView.addSubview(self.button)
        //self.scrollView.addSubview(ProfileHeaderView)
        UiConstraint()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    

    
    private func  UiConstraint(){
        NSLayoutConstraint.activate([
            //ScrollView
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            // image
            //self.pictureVK.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.pictureVK.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            //self.pictureVK.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: 120),
            self.pictureVK.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 140),
            self.pictureVK.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -140),
            self.pictureVK.widthAnchor.constraint(equalToConstant: 100),
            self.pictureVK.heightAnchor.constraint(equalToConstant: 100),
//self.pictureVK.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            
            // stackView
       self.stackView.topAnchor.constraint(equalTo: pictureVK.bottomAnchor, constant: 120),
     self.stackView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
       self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
        self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
       self.stackView.heightAnchor.constraint(equalToConstant: 100),
            //self.pictureVK.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: 16),
            //Кнопка
            
            self.button.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 50),
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -50),
            //self.pictureVK.widthAnchor.constraint(equalToConstant: 240),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            //self.pictureVK.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        ])
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = self.stackView.frame.origin.y + self.button.frame.origin.y + self.button.frame.height
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0

            print("🍋 \(self.stackView.frame.origin.y), \(self.loginTextField.frame.origin.y), \(self.button.frame.origin.y)")
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}


extension LogInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("🍋 \(textField.text)")
        if textField.tag == 0 {
            self.login = textField.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.forcedHidingKeyboard()
        return true
    }
}
