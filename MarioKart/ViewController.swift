//
//  ViewController.swift
//  MarioKart
//
//  Created by Joy Paul on 3/6/19.
//  Copyright © 2019 Joy Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //kart outlets
    @IBOutlet weak var kart1: UIImageView!
    @IBOutlet weak var kart2: UIImageView!
    @IBOutlet weak var kart3: UIImageView!
    
    //vars to hold starting points of our karts
    var startingPointkart1 = CGPoint()
    var startingPointKart2 = CGPoint()
    var startingPointKart3 = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadsKartStartingPoints()
    }
    
    func loadsKartStartingPoints(){
        startingPointkart1 = kart1.center
        startingPointKart2 = kart2.center
        startingPointKart3 = kart3.center
    }

    //background image
    @IBAction func longPressGesture(_ sender: UILongPressGestureRecognizer) {
        print("longPress recognized")
        longPressToResetPositions(using: sender)
    }
    
    
    //kart 1
    @IBAction func kart1PanGesture(_ sender: UIPanGestureRecognizer) {
        print("kart1 panned")
        moveKart(using: sender)
    }
    
    @IBAction func kart1PinchGesture(_ sender: UIPinchGestureRecognizer) {
        zoomInOutKart(using: sender)
    }
    
    @IBAction func kart1RotationGesture(_ sender: UIRotationGestureRecognizer) {
        rotateKart(using: sender)
    }
    @IBAction func kart1TapGesture(_ sender: UITapGestureRecognizer) {
        doubleTapToStart(with: sender)
    }
    
    //kart 2
    @IBAction func kart2PanGesture(_ sender: UIPanGestureRecognizer) {
        print("kart2 panned")
        moveKart(using: sender)
    }
    
    @IBAction func kart2PinchGesture(_ sender: UIPinchGestureRecognizer) {
        zoomInOutKart(using: sender)
    }
    
    @IBAction func kart2RotationGesture(_ sender: UIRotationGestureRecognizer) {
        rotateKart(using: sender)
    }
    @IBAction func kart2TapGesture(_ sender: UITapGestureRecognizer) {
        doubleTapToStart(with: sender)
    }
    
    //kart 3
    @IBAction func kart3PanGesture(_ sender: UIPanGestureRecognizer) {
        print("kart3 panned")
        moveKart(using: sender)
    }
    
    @IBAction func kart3PinchGesture(_ sender: UIPinchGestureRecognizer) {
        zoomInOutKart(using: sender)
    }
    
    @IBAction func kart3RotationGesture(_ sender: UIRotationGestureRecognizer) {
        rotateKart(using: sender)
    }
    @IBAction func kart3TapGesture(_ sender: UITapGestureRecognizer) {
        doubleTapToStart(with: sender)
    }
    
    //kart's functionalities. Get access to view and perfom actions on it
    func moveKart(using sender: UIPanGestureRecognizer){
        let location = sender.location(in: view)
        print("Location coordinates are X: \(location.x) Y: \(location.y)")
        
        //sets loaction to whereever user moves the asset
        let kartView = sender.view
        kartView?.center = location
    }
    
    func zoomInOutKart(using sender: UIPinchGestureRecognizer){
        let scale = sender.scale
        print("Scale-> \(scale)")
        
        //scales image based on pinch to zoom level
        let kartView = sender.view
        kartView?.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func rotateKart(using sender: UIRotationGestureRecognizer){
        let rotation = sender.rotation
        print("rotation -> \(rotation)")
        
        //rotates the image
        let kartView = sender.view
        kartView?.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    func doubleTapToStart(with sender: UITapGestureRecognizer){
        print("Double tap recognized")
        let kartView = sender.view
        
        //animates the positional changes of a view within a set duration
        UIView.animate(withDuration: 0.8) {
            //races at a slight top right trajectory
            kartView?.center.y -= 180
            kartView?.center.x += self.view.frame.size.width+200
        }
    }
    
    //sets the center positions for the views
    func longPressToResetPositions(using sender: UILongPressGestureRecognizer){
        UIView.animate(withDuration: 0.8) {
            self.kart1.center = self.startingPointkart1
            self.kart2.center = self.startingPointKart2
            self.kart3.center = self.startingPointKart3
            
            //resets any
            self.kart1.transform = CGAffineTransform.identity
            self.kart2.transform = CGAffineTransform.identity
            self.kart3.transform = CGAffineTransform.identity
        }
    }
    
}

