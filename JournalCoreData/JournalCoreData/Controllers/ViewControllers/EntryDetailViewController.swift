//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Andrew Saeyang on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - PROPERTIES
    var entry: Entry?
    
    // MARK: - OUTLETS
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    // MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }

    
    // MARK: - ACTIONS
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else { return }
        
        if let entry = entry{
            EntryController.shared.updateEntry(entry: entry, title: title, bodytext: body)
            
        }else{
            
            EntryController.shared.createEntry(title: title, body: body)
        }
        
        navigationController?.popViewController(animated: true)
        //updateViews()
        dismiss(animated: true)
    }
    
    // MARK: - HELPER METHODS
    
    func updateViews(){
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodytext
        
    }
    
}
