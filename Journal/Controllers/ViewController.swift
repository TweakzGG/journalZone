//
//  ViewController.swift
//  Journal
//
//  Created by Jackson Barnes on 9/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = entry?.title
        contentsTextView.text = entry?.contents
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
        let contents = contentsTextView.text,
        !title.isEmpty,
        !contents.isEmpty else { return }
        
        //if there is an entry, I want to update it
        if let entry = entry {
            EntryManager.shared.updateEntry(entry: entry, newTitle: title, newContents: contents)
            
        //if there is no entry, I want to create a new one
        } else{
            EntryManager.shared.createEntry(title: title, contents: contents)
        }
        navigationController?.popViewController(animated: true)
        
        }
    
}

