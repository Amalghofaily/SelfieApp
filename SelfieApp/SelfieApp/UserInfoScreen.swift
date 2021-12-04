

import UIKit

class UserInfoScreen: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    let myLabel = UILabel()
    let imageView1 = UIImageView(image: UIImage(named: "user1"))
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Label
        myLabel.frame = CGRect(x: 80, y: 60, width: 200, height: 50)
        myLabel.font = UIFont(name: "GillSans-Italic", size: 30)
        myLabel.textColor = #colorLiteral(red: 0.2048765719, green: 0.2848394513, blue: 0.368085444, alpha: 1)
        myLabel.textAlignment = .center
        view.addSubview(myLabel)
        
        // Image
        imageView1.frame = CGRect(x: 50, y: 160, width: 280, height: 280)
        view.addSubview(imageView1)
        
        // button
        button.frame = CGRect(x: 70, y: 600, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.2048765719, green: 0.2848394513, blue: 0.368085444, alpha: 1)
        button.setTitle("Add profile image", for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button)
        button.addTarget(self, action: #selector (isAction1), for: .touchDown)
    }
    
    // hide the status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func isAction1(){
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = .camera
        present(cameraView, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView1.image = pickedImage
        imageView1.frame = CGRect(x: 50, y: 160, width: 280, height: 280)
        imageView1.contentMode = .scaleAspectFill
        imageView1.layer.cornerRadius = imageView1.frame.height / 2
        imageView1.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
}
