//
//  CustomLabel.swift
//  testTaskShiftIOS
//
//  Created by Stepan Kolenkin on 04.08.2025.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        textColor = .black
        textAlignment = .center
        font = .systemFont(ofSize: 20, weight: .bold)
    }
}
