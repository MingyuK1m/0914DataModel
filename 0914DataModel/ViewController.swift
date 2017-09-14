//
//  ViewController.swift
//  0914DataModel
//
//  Created by D7702_10 on 2017. 9. 14..
//  Copyright © 2017년 D7702_10. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        zoomToRegion()
        
    let a = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594), title: "동의과학대학교", subtitle: "우리들의 꿈이 자라는 곳")
    let b = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168444, longitude: 129.057832), title: "부산시민공원", subtitle: "부산 시민들의 휴식처")
    let c = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.1651574, longitude: 129.0813102), title: "송상현광장", subtitle: "부산 시민들의 행단보도")
        
    myMapView.addAnnotations([a,b,c])
        
        
        myMapView.delegate = self
    }
    
    func zoomToRegion() {
        //  DIT 위치정보 35.166197, 129.072594
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        myMapView.setRegion(region, animated: true)
        
    }
    //pin 딜리게이트
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        //pin의 재활용
        let iden = "mypin"
        var anno = myMapView.dequeueReusableAnnotationView(withIdentifier: iden) as? MKPinAnnotationView
        
        if anno == nil { //처음이면 실행
            anno = MKPinAnnotationView(annotation: annotation, reuseIdentifier: iden)
            
            anno?.canShowCallout = true
            
            if annotation.title! == "부산시민공원"{
                anno?.pinTintColor = UIColor.cyan
                //이미지 넣기
                let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                img.image = UIImage(named: "다운로드.jpeg")
                anno?.leftCalloutAccessoryView = img
            } else if annotation.title! == "동의과학대학교"{
                anno?.pinTintColor = UIColor.purple
                //이미지 넣기
                let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                img.image = UIImage(named: "dong.JPG")
                anno?.leftCalloutAccessoryView = img
            } else if annotation.title! == "송상현광장"{
                anno?.pinTintColor = UIColor.brown
                //이미지 넣기
                let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                img.image = UIImage(named: "ss.jpeg")
                anno?.leftCalloutAccessoryView = img
            }
            
            anno?.animatesDrop = true
            
            // callout acceary
            let btn = UIButton(type: .detailDisclosure)
            anno?.rightCalloutAccessoryView = btn
            
            
        } else {
            // 제활용
            anno?.annotation = annotation
        }
        
        return anno
    }
    
    
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        
        //연결
        let vano = view.annotation
        //데이터 읽기
        let vtit : String = ((vano?.title)!)!
        let vsub : String = ((vano?.subtitle)!)!
        
        //알터 생성 .alter(가운데) .actionsheet(밑)
        let ac = UIAlertController(title: vtit, message: vsub, preferredStyle: .actionSheet)
        
        //ok생성
        ac.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        
        //작동 됨
        present(ac, animated: true, completion: nil)
        
    }
}
