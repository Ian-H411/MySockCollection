//
//  AddSockViewController.swift
//  SocDrawr1.1
//
//  Created by Ian Hall on 12/8/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class AddSockViewController: UIViewController {
//MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var primaryColorLabel: UILabel!
    
    @IBOutlet weak var primaryColorButton: UIButton!
    
    @IBOutlet weak var sockImageView: UIImageView!
    
    @IBOutlet weak var tagsTextField: UITextView!
    
    @IBOutlet weak var noteTextField: UITextView!
    
    
    //MARK: - Variables
    
    var imageLandingPad: UIImage?
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    @IBAction func primaryColorButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    
    //MARK: - Helper Functions
    
    
   

}
//MARK: - Extensions

extension AddSockViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}

