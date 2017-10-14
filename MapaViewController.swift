//
//  MapaViewController.swift
//  FirtLanchScreen
//
//  Created by André Brilho on 28/06/15.
//  Copyright (c) 2015 classroomM. All rights reserved.
//

import UIKit
import MapKit


class MapaViewController: UIViewController, MKMapViewDelegate {

       @IBOutlet weak var map: MKMapView!
    
    override func viewWillAppear(animated: Bool) {
    
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        map.delegate = self
        
        //mostrar uma latitude e longitude no mapa
        let localizacao = CLLocationCoordinate2D(latitude: -23.5816554, longitude: -46.6838368)
        
        let zoom = MKCoordinateSpan(latitudeDelta: 0.800, longitudeDelta: 0.800)
        
        let regiao = MKCoordinateRegion(center: localizacao, span: zoom)
        
        
        let localizacao1 = CLLocationCoordinate2D(latitude: -23.5625060, longitude: -46.6551630)
        
        
        let regiao1 = MKCoordinateRegion(center: localizacao1, span: zoom)
        
        
        
        map.setRegion(regiao, animated: true)
        map.setRegion(regiao1, animated: true)
        
        //adicionar um pino no mapa
        let pino = MKPointAnnotation()
        
        pino.title = "Instituto de Artes Interativas"
        pino.subtitle = "Rua Amauri, 352"
        pino.coordinate = localizacao
        map.addAnnotation(pino)
        
        
        let pino1 = MKPointAnnotation()
        
        pino1.title = "Trianon Masp"
        pino1.subtitle = "Av Paulista, 2000"
        pino1.coordinate = localizacao1
        map.addAnnotation(pino1)
 
     
        

            }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
        
        //percebam que o retorno desse método é um MKAnnotationView
        //percebam que estamos recebendo pelo parametro do método a referência do pino adicionado
        
        let pinoView = MKAnnotationView(annotation: annotation, reuseIdentifier: "idPino")
        
        pinoView.image = UIImage(named: "pin")
        
        //quando utilizamos esse método para customizar o pino o callout deixa de aparecer
        pinoView.canShowCallout = true
        
        //colocar uma imagem no balão do pino
        if annotation.title! == "Instituto de Artes Interativas"
        {
            let imgv = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
            imgv.image = UIImage(named: "casa_bola.jpeg")
            
            //na view do pino podemos setar qualquer view como acessorio do callout tanto do lado esquerdo, como do direito.
            //a altura máxima dessa view acessorio é 32
            pinoView.leftCalloutAccessoryView = imgv
            
            
        }
        
        let botaoDetalhes = UIButton(type: UIButtonType.DetailDisclosure)
        botaoDetalhes.addTarget(self, action: "botaoDetalhesPressionado", forControlEvents: UIControlEvents.TouchUpInside)
        
        pinoView.rightCalloutAccessoryView = botaoDetalhes
        
        
        return pinoView
        
        
    }
 
    func botaoDetalhesPressionado(){
    print("detalhes pressionado")
        UIButtonType.InfoDark
        
        //como saber o pino selecionado
        
        let pinoSelecionado = map.selectedAnnotations.first as! MKPointAnnotation
        
        if pinoSelecionado.title == "Instituto de Artes Interativas" {
 
            let tela = self.storyboard?.instantiateViewControllerWithIdentifier("detalhe") as! detalheViewController
            
            self.presentViewController(tela, animated: true, completion: nil)
            
        } else {
        
            let tela = self.storyboard?.instantiateViewControllerWithIdentifier("detalhe2") as! detalhe2ViewController
            
            self.presentViewController(tela, animated: true, completion: nil)
            
        }
        
 
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func voltar(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
