//
//  NoteTableViewCell.swift
//  ToDo
//
//  Created by Alex on 7/9/21.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    static let cellHeight: CGFloat = 80.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
