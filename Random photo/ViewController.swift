//
//  ViewController.swift
//  Random photo
//
//  Created by Jean Bikorimana on 3/27/23.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
   
        func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
            }
        }
    }
    
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors:[UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemGreen,
        .systemBrown,
        .systemOrange,
        .systemPurple
        
    
    ]
    
    let url = "https://source.unsplash.com/random/600x600"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        imageView.center = view.center
        
        
        
        //getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){//checks if the user tapped the button.
        
        //getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        
            super.viewDidLayoutSubviews()
        
        view.addSubview(button)
        button.frame = CGRect( //rearranges button so that we don't have it above the home bar
            x: 30,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height:55
        )
        
        
    }//"https://source.unsplash.com/random/600x600
    
    /*
    func getRandomPhoto() { //grabs url for the image
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string:urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    self.handleClientError(error)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                    self.handleServerError(response)
                    return
                }
                if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                    let data = data,
                    let string = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.webView.loadHTMLString(string, baseURL: url)
                    }
                }
            }
            task.resume()
        
    } */
    
    
    /*func setImageFromStringrURL(stringUrl: String) {
        if let url = URL(string:"https://source.unsplash.com/random/600x600") {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
          // Error handling...
          guard let imageData = data else { return }

          DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
              
          }
        }.resume()
      }
    }
     */
    
    
    
    func gradientBackground(){ //create a moving gradient background
        
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor(red: 0.91, green: 0.78, blue: 0.47, alpha: 1.00).cgColor,
                                UIColor(red: 0.25, green: 0.61, blue: 0.52, alpha: 1.00).cgColor,
                                UIColor(red: 0.72, green: 0.62, blue: 0.71, alpha: 1.00).cgColor
                           
        ]
        
        view.layer.addSublayer(gradient)
        
        
    }
    
    
   


}

