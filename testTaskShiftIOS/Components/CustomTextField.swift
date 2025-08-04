//
//  CustomTextField.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        textAlignment = .center
        borderStyle = .none
        layer.cornerRadius = 12
        layer.borderWidth = 3
    }
}
