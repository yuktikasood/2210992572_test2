//
//  RecipeDetailViewController.swift
//  test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class RecipeDetailViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var recipy:Recipe?
    @IBOutlet weak var recipeNameTextField: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var instructionsTextView: UITextView!
    
    @IBOutlet weak var caloriesTextField: UITextField!
    
    @IBOutlet weak var categoryTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    func updateUI() {
        guard let recipy = recipy else{
            return
        }
        recipeNameTextField.text = recipy.name
        ingredientsTextView.text = recipy.ingredients.joined(separator:"\n")
        instructionsTextView.text = recipy.instructions.joined(separator: "\n")
        caloriesTextField.text = String(recipy.calories)
        categoryTextField.text = recipy.category
        
    }

    @IBAction func choosephoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let alertController = UIAlertController(title: "choose image", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {action in print("user has chosen camera")
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true,completion: nil)})
            alertController.addAction(cameraAction)}
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let photolibAction = UIAlertAction(title: "Photo Library", style: .default, handler: {action in print("photo lib")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)})
            alertController.addAction(photolibAction)
        }
        present(alertController, animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        ImageView.image = selectedImage
        dismiss(animated: true,completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
