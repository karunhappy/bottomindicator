//
//  BottomIndicatorView.swift
//  BottomIndicator
//
//  Created by Karun Aggarwal on 07/02/20.
//  Copyright © 2020 Karun Aggarwal. All rights reserved.
//

import UIKit

@IBDesignable
class IndicatorView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var labelPageNumber: UILabel!
    
    var number = (max: 10,
                  min: 3,
                  spacing: 3)
    
    var colors = (unselected: UIColor(red: 0.840, green: 0.840, blue: 0.840, alpha: 1),
                  selected: UIColor(red: 0.000, green: 0.400, blue: 0.200, alpha: 1),
                  progress: UIColor(red: 0.675, green: 0.886, blue: 0.667, alpha: 1))
    
    //MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        contentView?.prepareForInterfaceBuilder()
        self.updateView()
    }
    
    /// Intialise view
    func commitInit() {
        Bundle.main.loadNibNamed("IndicatorView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        labelPageNumber.text = ""
    }
    
    /// Space between Indicators, Default to 3
    @IBInspectable var space: CGFloat {
        get {
            return CGFloat(number.spacing)
        } set {
            number.spacing = Int(newValue)
        }
    }
    
    /// Maximum Indicators number, Default to 10
    @IBInspectable var maximum: Int {
        get {
            return self.number.max
        } set {
            number.max = newValue
        }
    }
    
    /// Current Indicators index, Default to 3
    @IBInspectable var current: Int {
        get {
            return self.number.min
        } set {
            number.min = newValue - 1
        }
    }
    
    /// Set Selected Indicator Color, Default to colors.selected
    @IBInspectable var selectedColor: UIColor {
        get {
            return self.colors.selected
        } set {
            colors.selected = newValue
        }
    }
    
    /// Set Selected Indicator Color, Default to colors.unselected
    @IBInspectable var unselectedColor: UIColor {
        get {
            return self.colors.unselected
        } set {
            colors.unselected = newValue
        }
    }
    
    /// Set Selected Indicator Color, Default to colors.selected
    @IBInspectable var progressColor: UIColor {
        get {
            return self.colors.progress
        } set {
            colors.progress = newValue
        }
    }
}
extension IndicatorView {
    /// Update & Display Indicators according to selected value
    func updateView() {
        guard number.max > number.min else {
            fatalError("Current indicator cannot be greater than Maximum.")
        }
        labelPageNumber.text = number.min.description + " of " + number.max.description
        
        stackView.spacing = CGFloat(self.number.spacing)
        stackView.subviews.forEach({ $0.removeFromSuperview() })
        
        for i in 0...number.max - 1 {
            let view = UIView()
            view.backgroundColor = colors.unselected
            view.layer.cornerRadius = stackView.bounds.height / 2
            view.clipsToBounds = true
            
            let min = number.min - 1
            if i == min {
                view.backgroundColor = colors.selected
            } else if i < min {
                view.backgroundColor = colors.progress
            }
            
            stackView.addArrangedSubview(view)
        }
    }
}
