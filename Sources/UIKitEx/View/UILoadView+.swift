//
//  UILoadView+.swift
//  ImageRotate
//
//  Created by yuki on 2024/03/25.
//

import UIKit

open class UILoadView: UIView {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        self.onAwake()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadControl: UIControl {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        onAwake()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadButton: UIButton {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        onAwake()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}


open class UILoadStackView: UIStackView {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        onAwake()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadViewController: UIViewController {
    open func onAwake() {}
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.onAwake()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadTableViewCell: UITableViewCell {
    open func onAwake() {}
        
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.onAwake()
    }
    
    public init() {
        super.init(style: .default, reuseIdentifier: nil)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadScrollView: UIScrollView {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadCollectionReusableView: UICollectionReusableView {
    open func onAwake() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadCollectionViewCell: UICollectionViewCell {
    open func onAwake() {}
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadImageView: UIImageView {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadTableViewHeaderFooterView: UITableViewHeaderFooterView {
    open func onAwake() {}
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadLabel: UILabel {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadTextField: UITextField {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}

open class UILoadTextView: UITextView {
    open func onAwake() {}
    
    public init() {
        super.init(frame: .zero, textContainer: nil)
        self.onAwake()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.onAwake()
    }
}
