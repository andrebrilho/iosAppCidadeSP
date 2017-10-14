//
//  CuriosidadesViewController.swift
//  FirtLanchScreen
//
//  Created by André Brilho on 28/06/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

//
//  ViewController.swift
//  Quiz_Game
//
//  Created by André Brilho on 22/08/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class CuriosidadesViewController: UIViewController {
    
    

    
    let backgroundImage = UIImage(named: "BG_quiz.png")
    var imageView: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        
        

        
    }
    
    
    @IBOutlet weak var perguntaLabel: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    
    @IBOutlet weak var labelResposta: UILabel!
    
    
    

    
    
    var RespostaCerta = String()
    
    override func viewDidLoad() {
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)

        
        self.btn1.layer.cornerRadius = 8.0
        self.btn2.layer.cornerRadius = 8.0
        self.btn3.layer.cornerRadius = 8.0
        self.btn4.layer.cornerRadius = 8.0
        
        
        super.viewDidLoad()
        
        RandonPerguntas()

        
        labelResposta.text = ""

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func RandonPerguntas(){
        
        //Valores seriam de 0 a 4, por isso coloquei o valor que random vale 0 + 1, ou seja começa do 1
        var RandomNumber = arc4random() % 7
        RandomNumber += 1
        
        
        switch(RandomNumber){
        case 1:
            
            perguntaLabel.text = "sou conhecido por poucos, mas todos me conhecem ?"
            btn1.setTitle("Cirilo", forState: UIControlState.Normal)
            btn2.setTitle("Andre", forState: UIControlState.Normal)
            btn3.setTitle("Joauim", forState: UIControlState.Normal)
            btn4.setTitle("Pedro", forState: UIControlState.Normal)
            RespostaCerta = "2"
            
            break
        case 2:
            
            perguntaLabel.text = "Just do .. ?"
            btn1.setTitle("It", forState: UIControlState.Normal)
            btn2.setTitle("Make", forState: UIControlState.Normal)
            btn3.setTitle("Love", forState: UIControlState.Normal)
            btn4.setTitle("Give UP", forState: UIControlState.Normal)
            RespostaCerta = "1"
            
            break
        case 3:
            
            perguntaLabel.text = "1 + 1 é ?"
            btn1.setTitle("20, sabe na nada Inocente", forState: UIControlState.Normal)
            btn2.setTitle("5", forState: UIControlState.Normal)
            btn3.setTitle("3", forState: UIControlState.Normal)
            btn4.setTitle("Rapaiz tú é muito esperto é 2", forState: UIControlState.Normal)
            RespostaCerta = "4"
            
            break
        case 4:
            
            perguntaLabel.text = "O que pega fogo mais não queima ?"
            btn1.setTitle("Agua", forState: UIControlState.Normal)
            btn2.setTitle("Vento", forState: UIControlState.Normal)
            btn3.setTitle("CO2", forState: UIControlState.Normal)
            btn4.setTitle("Fogo", forState: UIControlState.Normal)
            RespostaCerta = "2"
            
            break
            
        case 5:
            
            perguntaLabel.text = "O que significa as estrelas na bandeira do Estado de São Paulo ?"
            btn1.setTitle("Cidades", forState: UIControlState.Normal)
            btn2.setTitle("Homenagem", forState: UIControlState.Normal)
            btn3.setTitle("Não sei", forState: UIControlState.Normal)
            btn4.setTitle("Nada", forState: UIControlState.Normal)
            RespostaCerta = "1"
            
            break
            
        case 6:
            
            perguntaLabel.text = "Cidade de São Paulo foi a 1 ser ?"
            btn1.setTitle("Vendida", forState: UIControlState.Normal)
            btn2.setTitle("Rendida na decado de 1.800", forState: UIControlState.Normal)
            btn3.setTitle("Vista nos Cinemas Internacionais", forState: UIControlState.Normal)
            btn4.setTitle("Reconhecida como Cidade independente", forState: UIControlState.Normal)
            RespostaCerta = "3"
            
            break
            
        case 7:
            
            perguntaLabel.text = "Cidade mais rica da America Latina ?"
            btn1.setTitle("São Paulo", forState: UIControlState.Normal)
            btn2.setTitle("Rio de Janeiro", forState: UIControlState.Normal)
            btn3.setTitle("Santiago", forState: UIControlState.Normal)
            btn4.setTitle("Cordoba", forState: UIControlState.Normal)
            RespostaCerta = "1"
            
            break
        default:
            break
            
        }
    }
    
    
    func HideResposta(){
        labelResposta.hidden = false
        
    }
    
    @IBAction func btnAction1(sender: AnyObject) {
        
        
        if(RespostaCerta == "1"){
           
            labelResposta.text = ": )"
            RandonPerguntas()
            btn1.alpha = 1
            btn2.alpha = 1
            btn3.alpha = 1
            btn4.alpha = 1
            labelResposta.alpha = 1
            
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                
                self.labelResposta.alpha = 0
            })
            
       

        }else {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            labelResposta.alpha = 1
            labelResposta.text = ": |"

            UIView.animateWithDuration(1.5, animations: { () -> Void in
                

                self.btn1.alpha = 0
                
            })
        }
        

        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.labelResposta.alpha = 0
        })
        
        
    }
    
    @IBAction func btnAction2(sender: AnyObject) {
      
        if(RespostaCerta == "2"){

            labelResposta.text = ": )"
            RandonPerguntas()
            btn1.alpha = 1
            btn2.alpha = 1
            btn3.alpha = 1
            btn4.alpha = 1
            labelResposta.alpha = 1
            
            UIView.animateWithDuration(1.5, animations: { () -> Void in
                
                self.labelResposta.alpha = 0
            })
            
     
        } else {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            labelResposta.alpha = 1
            labelResposta.text = ": ("

            UIView.animateWithDuration(1.5, animations: { () -> Void in
                

                self.btn2.alpha = 0
            })

        }

        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.labelResposta.alpha = 0
        })
        
        
    }
    
    @IBAction func btnAction3(sender: AnyObject) {
     
        if(RespostaCerta == "3"){
            

            labelResposta.text = ": )"
            RandonPerguntas()
            btn1.alpha = 1
            btn2.alpha = 1
            btn3.alpha = 1
            btn4.alpha = 1
            labelResposta.alpha = 1
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.labelResposta.alpha = 0
            })
            
            
        }else {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            labelResposta.alpha = 1
           labelResposta.text = ": |"

            UIView.animateWithDuration(1.5, animations: { () -> Void in

                self.btn3.alpha = 0
            })

        }
        
  
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.labelResposta.alpha = 0
        })
        
        
    }
    @IBAction func btnAction4(sender: AnyObject) {
      
        if(RespostaCerta == "4"){
            
            labelResposta.text = ": )"
            RandonPerguntas()
            btn1.alpha = 1
            btn2.alpha = 1
            btn3.alpha = 1
            btn4.alpha = 1
            labelResposta.alpha = 1
        
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                self.labelResposta.alpha = 0
            })
            
            
            
            
        }else {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            labelResposta.alpha = 1
            labelResposta.text = ": ("

            UIView.animateWithDuration(1.5, animations: { () -> Void in
                

                self.btn4.alpha = 0
            })

        }
        

        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            self.labelResposta.alpha = 0
        })
    }
    

    @IBAction func voltar(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}



