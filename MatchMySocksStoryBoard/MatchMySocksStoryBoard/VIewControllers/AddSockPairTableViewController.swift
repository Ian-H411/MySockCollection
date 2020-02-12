//
//  AddSockPairTableViewController.swift
//  MatchMySocksStoryBoard
//
//  Created by Ian Hall on 2/12/20.
//  Copyright © 2020 Ian Hall. All rights reserved.
//

import UIKit

class AddSockPairTableViewController: UITableViewController {
    //MARK: - OUTLETS
    
    @IBOutlet weak var newNameTxtField: UITextField!
    
    @IBOutlet weak var addImageButton: UIButton!
    
    @IBOutlet weak var sockImage: UIImageView!
    
    @IBOutlet weak var primaryColorBtn: UIButton!
    
    @IBOutlet weak var secondaryColorBtn: UIButton!
    
    @IBOutlet weak var notesTextField: UITextView!
    
    @IBOutlet weak var isFavoriteSwitch: UISwitch!
    
    
    
    //MARK: - Variable
    
    var selectedSock: SockPair?
    
    var isInEditMode: Bool {
        return selectedSock != nil
    }
    
    var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    //MARK: - Actions
    
    @IBAction func primaryColorBtnTapped(_ sender: Any) {
        
        
    }
    
    @IBAction func secondaryColorBtnTapped(_ sender: Any) {
    }
    
    @IBAction func isFavoriteSliderTapped(_ sender: UISwitch) {
        isFavorite.toggle()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        saveData()
    }
    
    @IBAction func addPhotoBtnTapped(_ sender: Any) {
        presentActionSheet()
    }
    
    
    
    
    
    //MARK: - Helper Functions
    
    func updateUI() {
        newNameTxtField.delegate = self
        notesTextField.delegate = self
        if isInEditMode {
            guard let sock = selectedSock else {return}
            if let picture = sock.photo {
                sockImage.image = picture
                let colors = picture.getColors()
                primaryColorBtn.backgroundColor = colors.primary
                secondaryColorBtn.backgroundColor = colors.secondary
            }
            newNameTxtField.text = sock.name
            isFavoriteSwitch.setOn(sock.isFavorite, animated: true)
            isFavorite = sock.isFavorite
            notesTextField.text = sock.note
        }
    }
    
    func saveData() {
        
    }
    
    func setColorsFromImage() {
        guard let image = sockImage.image else {return}
        let colors = image.getColors()
        primaryColorBtn.backgroundColor = colors.primary
        secondaryColorBtn.backgroundColor = colors.secondary
    }
    
}

//MARK: - EXTENSIONS

extension AddSockPairTableViewController: UITextViewDelegate {
    
}

extension AddSockPairTableViewController {
    func camera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            self.present(myPickerController, animated: true , completion: nil)
        }
    }
    
    func photoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let mypickerController = UIImagePickerController()
            mypickerController.delegate = self
            mypickerController.sourceType = .photoLibrary
            self.present(mypickerController, animated: true, completion: nil)
        }
    }
    
    func presentActionSheet(){
        let actionSheet = UIAlertController(title: "Add a photo of your socks", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraButton = UIAlertAction(title: "Import With Camera", style: .default) { (_) in
                self.camera()
            }
            actionSheet.addAction(cameraButton)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photoLibrary = UIAlertAction(title: "Import From Photo Library", style: .default) { (_) in
                self.photoLibrary()
            }
            actionSheet.addAction(photoLibrary)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        actionSheet.addAction(cancelButton)
        self.present(actionSheet, animated: true, completion: nil)
    }
}


extension AddSockPairTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            sockImage.image = image
            setColorsFromImage()
        } else {
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension AddSockPairTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
