//
//  SecondViewController.swift
//  GrandCentralDispatch
//
//  Created by MacBook Pro on 2022-06-15.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()

    }

    func fetchImage() {
        imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/07/Huge_ball_at_Vilnius_center.jpg")
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
            self.image = UIImage(data: imageData)
    }
}
