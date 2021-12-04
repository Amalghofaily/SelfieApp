



import UIKit
class ViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let imageView = UIImageView(image: UIImage(named: "user1"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        view.addSubview(imageView)
    }
    
    // hide the status
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        view.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(x: -(diffX/2), y: diffY/2, width: size, height: size)})
        
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    let viewController = LoginScreen()
                    viewController.modalTransitionStyle = .crossDissolve
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                })
            }
        })
    }
    
}
