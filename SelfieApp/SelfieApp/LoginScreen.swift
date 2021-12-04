

import UIKit

class LoginScreen: UIViewController {
    let textField1 = UITextField()
    let textField2 = UITextField()
    let button = UIButton()
    let label = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()
    let imageView1 = UIImageView(image: UIImage(named: "selfie"))
    let textField1Image = UIImage(systemName: "person.fill")
    let textField2Image = UIImage(systemName: "lock.fill")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backgroundColor
        view.backgroundColor = .white
        
        // Image
        imageView1.frame = CGRect(x: 50, y: 140, width: 300, height: 230)
        view.addSubview(imageView1)
        
        // first textField
        textField1.frame = CGRect(x: 35, y: 430, width: 300, height: 45)
        textField1.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: textField1, fieldImge: textField1Image!)
        textField1.font = UIFont(name: "GillSans-Italic", size: 15)
        textField1.placeholder = "| Enter your name" // display when click on it
        textField1.layer.cornerRadius = 25
        view.addSubview(textField1)
        
        // second textField
        textField2.frame = CGRect(x: 35, y: 530, width: 300, height: 45)
        textField2.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ImgeInTextField(textField: textField2, fieldImge: textField2Image!)
        textField2.font = UIFont(name: "GillSans-Italic", size: 15)
        textField2.placeholder = "| Enter your password" // display when click on it
        textField2.layer.cornerRadius = 25
        textField2.isSecureTextEntry = true
        view.addSubview(textField2)
        
        // button
        button.frame = CGRect(x: 75, y: 650, width: 230, height: 50)
        button.layer.cornerRadius = 25
        button.backgroundColor = #colorLiteral(red: 0.1133795157, green: 0.2006021738, blue: 0.3459158242, alpha: 1)
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 25)
        view.addSubview(button)
        button.addTarget(self, action: #selector (isAction), for: .touchDown)
        
        // title label
        label.frame = CGRect(x: 95, y: 90, width: 200, height: 50)
        label.text = "Selfie App"
        label.font = UIFont(name: "GillSans-Italic", size: 40)
        label.textColor = #colorLiteral(red: 0.1384164095, green: 0.1636873186, blue: 0.4304022491, alpha: 1 )
        label.textAlignment = .center
        view.addSubview(label)
        
        //second label
        label2.frame = CGRect(x: 45, y: 390, width: 200, height: 50)
        label2.text = "Name"
        label2.font = UIFont(name: "GillSans-Italic", size: 19)
        label2.textColor = #colorLiteral(red: 0.1384164095, green: 0.1636873186, blue: 0.4304022491, alpha: 1 )
        view.addSubview(label2)
        
        //first label
        label1.frame = CGRect(x: 45, y: 490, width: 200, height: 50)
        label1.text = "Password"
        label1.font = UIFont(name: "GillSans-Italic", size: 19)
        label1.textColor = #colorLiteral(red: 0.1384164095, green: 0.1636873186, blue: 0.4304022491, alpha: 1 )
        view.addSubview(label1)
    }
    
    // hide the status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Def image for text field
    @objc func ImgeInTextField(textField: UITextField, fieldImge img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500 , height: 100 ))
        leftImageView.image = img
        leftImageView.tintColor = .gray
        textField.leftView = leftImageView
        textField.leftViewMode = .always
    }
    
    @objc func isAction(){
        let vc = UserInfoScreen()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
        vc.myLabel.text = "\(textField1.text ?? " ")'s Photo"
    }
}
