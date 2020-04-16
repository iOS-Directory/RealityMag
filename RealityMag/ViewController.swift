//
//  ViewController.swift
//  RealityMag
//
//  Created by FGT MAC on 4/16/20.
//  Copyright © 2020 FGT MAC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration to track image
        let configuration = ARImageTrackingConfiguration()
        
        //Gain access to the images in the assets folder to tell AR to track those images
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main) {
            
            //Tell AR to track the images we have in the assets folder
            configuration.trackingImages = imageToTrack
            
            //Set number of images to track t the same time
            configuration.maximumNumberOfTrackedImages = 1
            
            // Run the view's session
            sceneView.session.run(configuration)

        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

}
