//
//  CustomBlueButton.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import UIKit

class CustomBlueButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 10
        titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
