//
//  AddNoteViewController.swift
//  ToDo
//
//  Created by Alex on 7/9/21.
//

import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addDidTap(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        guard let contents = contentTextView.text else { return }
        
        if title.isEmpty || contents.isEmpty { return }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
