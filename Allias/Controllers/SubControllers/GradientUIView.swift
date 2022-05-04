//
//  GradientUIView.swift
//  Allias
//
//  Created by Артем Оголец on 04.05.2022.
//

import UIKit

class GradientUIView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable private var startColor: UIColor? {
        didSet { setGradientLayer() }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet { setGradientLayer() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setGradientLayer() {
        gradientLayer.colors = [startColor?.cgColor, endColor?.cgColor]
    }
    
}
