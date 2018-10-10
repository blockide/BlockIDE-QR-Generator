//
//  ViewController.swift
//  QRGenerate
//
//  Created by Casey Gardiner

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutltes and variables

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap(#selector(self.dismissKeyboard))
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - IBActions

    @IBAction func button(_ sender: Any) {

        if let myString = myTextField.text {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")

            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let qrCodeImage = UIImage(ciImage: (filter?.outputImage!.applying(transform))!)
            myImageView.image = qrCodeImage
        }
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
        // do aditional stuff
    }
}

extension UIViewController {
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
