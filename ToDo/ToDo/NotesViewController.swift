//
//  NotesViewController.swift
//  ToDo
//
//  Created by Alex on 7/8/21.
//

import UIKit

struct Note {
    let title: String
    let content: String
}

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        setupCell()
    }
    
    func setupCell() {
        let nib = UINib(nibName: "NoteTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "noteCellID")
    }
}

extension NotesViewController: UITableViewDelegate {
    
}

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCellID", for: indexPath) as? NoteTableViewCell else { fatalError() }
        
        cell.titleLabel.text = notes[indexPath.row].title
        cell.contentLabel.text = notes[indexPath.row].content
        
        return cell
    }
}

