//
//  NotesViewController.swift
//  ToDo
//
//  Created by Alex on 7/8/21.
//

import UIKit

class NotesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [
        Note(title: "iOS", content: "I have to mastering tableView"),
        Note(title: "Groceries", content: "Apple, Banana, Oil, Meal, 7 PM."),
        Note(title: "Basic Programming", content: "Varibles, data types, if-else, array, loop, function"),
        Note(title: "iOS UI Architecture", content: "MVC, MVVM, MVP, VIPER, etc."),
        Note(title: "Swift UI Building", content: "Storyboard, UIKit Swift Programmatic UI, SwiftUI")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueNoteDetail" else { return }
        guard let dvc = segue.destination as? NoteDetailViewController else { return }
        guard let contentText = sender as? String else { return }
        
        dvc.contentText = contentText
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueNoteDetail", sender: notes[indexPath.row].content)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
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

