//
//  ViewController.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import UIKit
import SnapKit

class RegistrationScreenViewController: UIViewController {
    
    private lazy var backgroundScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        return scroll
    }()
    
    private lazy var labelForName: UILabel = {
        let label = CustomLabel()
        label.text = "Введите имя"
        return label
    }()
    
    private lazy var textFieldForName: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "Иван"
        return textField
    }()
    
    private lazy var labelForSurname: UILabel = {
        let label = CustomLabel()
        label.text = "Введите фамилию"
        return label
    }()
    
    private lazy var textFieldForSurname: UITextField = {
        let textField = CustomTextField()
        textField.placeholder = "Иванов"
        return textField
    }()
    
    private lazy var labelForBirthday: UILabel = {
        let label = CustomLabel()
        label.text = "Укажите дату рождения"
        return label
    }()
    
    private lazy var textFieldForBirthday: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private lazy var labelForPassword : UILabel = {
        let label = CustomLabel()
        label.text = "Введите пароль"
        return label
    }()
    
    private lazy var textFieldForPassword: UITextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var labelForConfirmPassword : UILabel = {
        let label = CustomLabel()
        label.text = "Введите пароль еще раз"
        return label
    }()
    
    private lazy var textFieldForConfirmPassword: UITextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var buttonForSaveData: UIButton = {
        let button = CustomBlueButton()
        button.setTitle("Регистрация", for: .normal)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func registrationButtonTapped() {
        self.navigationController?.pushViewController(MainScreenViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(backgroundScrollView)
        backgroundScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(labelForName)
        labelForName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(backgroundScrollView.snp.centerY).offset(-220)
        }
        
        backgroundScrollView.addSubview(textFieldForName)
        textFieldForName.snp.makeConstraints { make in
            make.top.equalTo(labelForName.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundScrollView.addSubview(labelForSurname)
        labelForSurname.snp.makeConstraints { make in
            make.top.equalTo(textFieldForName.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(textFieldForSurname)
        textFieldForSurname.snp.makeConstraints { make in
            make.top.equalTo(labelForSurname.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundScrollView.addSubview(labelForBirthday)
        labelForBirthday.snp.makeConstraints { make in
            make.top.equalTo(textFieldForSurname.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(textFieldForBirthday)
        textFieldForBirthday.snp.makeConstraints { make in
            make.top.equalTo(labelForBirthday.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        backgroundScrollView.addSubview(labelForPassword)
        labelForPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldForBirthday.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(textFieldForPassword)
        textFieldForPassword.snp.makeConstraints { make in
            make.top.equalTo(labelForPassword.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundScrollView.addSubview(labelForConfirmPassword)
        labelForConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldForPassword.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(textFieldForConfirmPassword)
        textFieldForConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(labelForConfirmPassword.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundScrollView.addSubview(buttonForSaveData)
        buttonForSaveData.snp.makeConstraints { make in
            make.top.equalTo(textFieldForConfirmPassword.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

