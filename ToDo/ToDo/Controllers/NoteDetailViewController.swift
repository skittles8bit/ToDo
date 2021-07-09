//
//  NoteDetailViewController.swift
//  ToDo
//
//  Created by Alex on 7/9/21.
//

import UIKit

class NoteDetailViewController: UIViewController {
    @IBOutlet weak var detailTextView: UITextView!
    
    var contentText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTextView.text = contentText
    }
    
}
