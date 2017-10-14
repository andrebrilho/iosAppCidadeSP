//
//  DataViewController.swift
//  FirtLanchScreen
//
//  Created by André Brilho on 20/09/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var imgvFoto: UIImageView!
    

    @IBOutlet weak var sair: UIButton!
    
    var dataObject: AnyObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description
            imgvFoto.image = UIImage(named: dataObject as! String)
        } else {
            self.dataLabel!.text = ""
        }
    }
    
    
    @IBAction func btnSair(sender: AnyObject) {
      
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }

    
    
}

