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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        imageView.center = view.center
        
        
        
        gradientBackground()
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
        
        
    }
    
    @objc func didTapButton(){//checks if the user tapped the button.
        
        getRandomPhoto()
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
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string:urlString)!
        
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        
        imageView.image = UIImage(data: data)
        
    }
    
    
    
    
    func gradientBackground(){ //create a moving gradient background
        
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor(red: 0.91, green: 0.78, blue: 0.47, alpha: 1.00).cgColor,
                           UIColor(red: 0.25, green: 0.61, blue: 0.52, alpha: 1.00).cgColor,
                           UIColor(red: 0.72, green: 0.62, blue: 0.71, alpha: 1.00).cgColor
                           
        ]
        
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        
    }
    
    
    
    
}



