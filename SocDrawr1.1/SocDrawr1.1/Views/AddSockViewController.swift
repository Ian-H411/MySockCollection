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
    
    
    @IBOutlet weak var sockImageView: UIImageView!
    
    @IBOutlet weak var tagsTextField: UITextView!
    
    @IBOutlet weak var noteTextField: UITextView!
    
    @IBOutlet weak var colorPickerButton: UIButton!
    
    
    //MARK: - Variables
    
    var imageLandingPad: UIImage?
    
    var isFavorite: Bool = false
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    //MARK: - Actions
    
   
    @IBAction func colorPickerButtonTapped(_ sender: Any) {
    }
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        isFavorite.toggle()
        if isFavorite {
            favoriteButton.layer.backgroundColor = UIColor.red.cgColor
        } else {
            favoriteButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let note = noteTextField.text else {return}
        
        let sock = SockController.shared.create(sockName: name, isFavorite: isFavorite, primaryColor: nil, secondaryColor: nil, image: imageLandingPad)
        SockController.shared.changeNote(sock: sock, note: note)
        navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Helper Functions
    
    func initialSetUp() {
        if let photo = imageLandingPad {
            sockImageView.image = photo
        }
    }
   

}
//MARK: - Extensions

extension AddSockViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}

extension AddSockViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
}

