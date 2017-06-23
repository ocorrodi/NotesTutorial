//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    @IBOutlet weak var noteContentTextView: UITextView!
    

    var note: Note?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "save" {
            let note = self.note ?? CoreDataHelper.newNote()
            note.title = noteTitleTextField.text ?? ""
            note.content = noteContentTextView.text ?? ""
            note.modificationTime = Date() as NSDate
            CoreDataHelper.saveNote()
      //      } else {
    
//                let newNote = Note()
//                newNote.title = noteTitleTextField.text ?? ""
//                newNote.content = noteContentTextView.text ?? ""
//                let date = Date().convertToString()
//                newNote.modificationTime = date
//                listNotesTableViewController.notes.append(newNote)
            }
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }
        else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }

}
