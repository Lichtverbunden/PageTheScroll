//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Ken Krippeler on 15.06.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var gestureRecognizer: UIPanGestureRecognizer!
    var images = [UIImageView]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        var contentWidth: CGFloat = 0.0
        
        var scrollWidth = scrollView.frame.size.width
        for i in 0...2
        {
            let image = UIImage(named: "icon\(i).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(i)
            contentWidth += scrollWidth * CGFloat(i)
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
    }
}

