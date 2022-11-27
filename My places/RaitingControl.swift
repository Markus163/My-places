//
//  RaitingControl.swift
//  My places
//
//  Created by Марк Михайлов on 27.11.2022.
//

import UIKit

@IBDesignable class RaitingControl: UIStackView {
    
    //MARK: - Properties
    
    private var ratingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44, height: 44) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    var raiting = 0

   
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: - Button Action
    
    @objc func raitingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: - Private Methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        for _ in 0..<starCount {
            // Create the button
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constaints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Setup the button action
            button.addTarget(self, action: #selector(raitingButtonTapped(button:)), for: .touchUpInside)
            
            //Add the button to stack
            addArrangedSubview(button)
            
            //Add the new button on the rating button array
            ratingButtons.append(button)
        }
        

        
        
    }
}
