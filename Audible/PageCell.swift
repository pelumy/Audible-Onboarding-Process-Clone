//
//  PageCell.swift
//  Audible
//
//  Created by mac on 26/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet{
            
            guard let page = page else{return}
            
            var imageName = page.imageName
            if UIDevice.current.orientation.isLandscape {
                imageName += "_landscape"
            }
            
            imageView.image = UIImage(named: imageName)
            let color = UIColor(white: 0.2, alpha: 1)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium),
                NSAttributedString.Key.foregroundColor: color
            ])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium),
                NSAttributedString.Key.foregroundColor: color
            ]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            
            textView.attributedText = attributedText
//            textView.text = page.title + "\n\n" + page.message
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "SAMPLE TEXT FOR NOW"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let lineSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    func setupViews(){
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparatorView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        lineSeparatorView.anchorToTop(top: nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        
        ])
        
//        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//Here’s the set of parameters we use:
//
//duration
//Represents the duration of the animation determining how long the block of code should run.
//delay
//Represents the initial delay that we want to have before the start of the animation.
//SpringWithDamping
//Represents the value of the springy effect that we want the view to behave. The value must be between 0 to 1. The lower the value, the higher the spring oscillation.
//velocity
//Represents the speed at which the animation should start.
//options
//Type of animation curve that you want to apply to your view animation.
//Finally, the block of code where we set the frame of the button that needs to be animated. It is the same as the previous animation.


//WHAT IS A frame?
//A collection of the view’s frame changes/ transitions, from the start state to the final state, is defined as animation and each position of the view during the animation is called as a frame.


//View transitions are used when you want to add a new view to your view hierarchy or remove a view from the view hierarchy.

//Keyframe animations enable you to set different stages of an animation. You can group different animations together that share some common properties, but still be able to control them separately.

//The APIs that are used to create view transitions are

//UIView.transitionWithView(_:, duration:, options:, animations:, completion:)
//UIView.transitionFromView(_:, toView:, duration:, options:, completion:)
