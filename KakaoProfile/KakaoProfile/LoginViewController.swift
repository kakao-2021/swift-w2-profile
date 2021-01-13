//
//  LoginViewController.swift
//  KakaoProfile
//
//  Created by 이청원 on 2021/01/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var profileImageView: UIImageView!
    var nameText : String = ""
    var descriptionText : String = ""
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let namePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let descriptionPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.nameTextField.leftView = namePaddingView
        self.descriptionTextField.leftView = descriptionPaddingView
        self.nameTextField.leftViewMode = .always
        self.descriptionTextField.leftViewMode = .always
        self.nameTextField.text = nameText
        self.descriptionTextField.text = descriptionText
        
        imagePicker.delegate = self
    }
    
    @IBAction func cancelButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButtonTouched(_ sender: Any) {
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = false
        present(imagePicker, animated: false, completion: nil)
    }
}

extension LoginViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            profileImageView?.image = image
            dismiss(animated: true, completion: nil)
        }
    }
}
