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
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
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
    
    @objc private func registrationButtonTapped() {
        if validateInputs() {
            
            UserDefaults.standard.set(textFieldForName.text ?? "", forKey: "user_name")
            UserDefaults.standard.set(textFieldForSurname.text ?? "", forKey: "user_surname")
            
            let mainScreen = MainScreenViewController(productViewModel: ProductViewModel())
            self.navigationController?.pushViewController(mainScreen, animated: true)
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField == textFieldForName {
            highlightField(textField, isValid: isValidName(textField.text ?? ""))
        } else if textField == textFieldForSurname {
            highlightField(textField, isValid: isValidSurname(textField.text ?? ""))
        } else if textField == textFieldForPassword {
            highlightField(textField, isValid: isValidPassword(textField.text ?? ""))
        } else if textField == textFieldForConfirmPassword {
            highlightField(textField, isValid: isValidPassword(textField.text ?? "") && textField.text == textFieldForPassword.text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldForName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textFieldForSurname.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textFieldForPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        textFieldForConfirmPassword.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(backgroundScrollView)
        backgroundScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundScrollView.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundScrollView)
            make.width.equalTo(backgroundScrollView)
        }
        
        backgroundView.addSubview(labelForName)
        labelForName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(backgroundView.snp.centerY).offset(-220)
        }
        
        backgroundView.addSubview(textFieldForName)
        textFieldForName.snp.makeConstraints { make in
            make.top.equalTo(labelForName.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(labelForSurname)
        labelForSurname.snp.makeConstraints { make in
            make.top.equalTo(textFieldForName.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundView.addSubview(textFieldForSurname)
        textFieldForSurname.snp.makeConstraints { make in
            make.top.equalTo(labelForSurname.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(labelForBirthday)
        labelForBirthday.snp.makeConstraints { make in
            make.top.equalTo(textFieldForSurname.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundView.addSubview(textFieldForBirthday)
        textFieldForBirthday.snp.makeConstraints { make in
            make.top.equalTo(labelForBirthday.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(labelForPassword)
        labelForPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldForBirthday.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundView.addSubview(textFieldForPassword)
        textFieldForPassword.snp.makeConstraints { make in
            make.top.equalTo(labelForPassword.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(labelForConfirmPassword)
        labelForConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldForPassword.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        backgroundView.addSubview(textFieldForConfirmPassword)
        textFieldForConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(labelForConfirmPassword.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        backgroundView.addSubview(buttonForSaveData)
        buttonForSaveData.snp.makeConstraints { make in
            make.top.equalTo(textFieldForConfirmPassword.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(20)
        }
    }
}

extension RegistrationScreenViewController {
    private func validateInputs() -> Bool {
        var errors: [String] = []
        
        if let name = textFieldForName.text, !isValidName(name) {
            highlightField(textFieldForName, isValid: false)
            errors.append("Имя")
        } else {
            highlightField(textFieldForName, isValid: true)
        }
        
        if let surname = textFieldForSurname.text, !isValidSurname(surname) {
            highlightField(textFieldForSurname, isValid: false)
            errors.append("Фамилия")
        } else {
            highlightField(textFieldForSurname, isValid: true)
        }
        
        if let password = textFieldForPassword.text, !isValidPassword(password) {
            highlightField(textFieldForPassword, isValid: false)
            errors.append("Пароль")
        } else {
            highlightField(textFieldForPassword, isValid: true)
        }
        
        if textFieldForPassword.text == textFieldForConfirmPassword.text && textFieldForConfirmPassword.text != "" {
            highlightField(textFieldForConfirmPassword, isValid: true)
        } else {
            highlightField(textFieldForConfirmPassword, isValid: false)
            errors.append("Подтверждение пароля")
        }
        
        if !errors.isEmpty {
            let message = "Проверьте следующие поля:\n" + errors.joined(separator: "\n")
            showAlert(title: "Ошибка", message: message)
            return false
        }
        return true
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default))
        present(alert, animated: true)
    }
    
    private func isValidName(_ name: String) -> Bool {
        let regex = "^[A-Za-zА-Яа-я]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: name)
    }
    
    private func isValidSurname(_ surname: String) -> Bool {
        let regex = "^[A-Za-zА-Яа-я]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: surname)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: password)
    }
    
    private func highlightField(_ textField: UITextField, isValid: Bool) {
        textField.layer.borderColor = isValid ? UIColor.systemGreen.cgColor : UIColor.systemRed.cgColor
    }
}
