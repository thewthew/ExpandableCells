//
//  ExpandableCell.swift
//  ExpandableCells
//
//  Created by Matti on 17/12/2019.
//  Copyright © 2019 Matti. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell, UITableViewCellRegistrable {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var picker: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var isExpanded: Bool = false {
        didSet {
            if isExpanded {
                picker.isHidden = false
                heightConstraint.constant = 128
            } else {
                picker.isHidden = true
                heightConstraint.constant = 207
            }
        }
    }
}
