//
//  ViewController.swift
//  FirtLanchScreen
//
//  Created by André Brilho on 22/06/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var startButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //1
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        //2
      //  textView.textAlignment = .Center
        textView.text = "+ São Paulo"
       //textView.textColor = .blackColor()
        self.startButton.layer.cornerRadius = 4.0
        //3
        let imgOne = UIImageView(frame: CGRectMake(0, 0,scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "Slide 1")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0,scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide 2")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0,scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Slide 3")
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0,scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Slide 4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
        
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
            
            textView.text = "São Paulo a cidade mais importente do Brasil"
        }else if Int(currentPage) == 1{
            
            textView.text = "Para saber mais sobre a historia da cidade clique no icone com o Livro"
        }else if Int(currentPage) == 2{
            
            textView.text = "Teste seus conhecimento clicando sobre o icone do Quiz"
        }else{
            
            textView.text = "Continue conhecendo a cidade em qualquer lugar que  for e teste seus conhecimentos  :) "
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.startButton.alpha = 1.0
            })
        }
        
   
        
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func iniciar(sender: AnyObject) {
        
        
        
        let tela = self.storyboard?.instantiateViewControllerWithIdentifier("Mapa") as! MapaViewController
 
        
        
        
        self.presentViewController(tela, animated: true, completion: nil)
        
    }
    
    
    
    

}

