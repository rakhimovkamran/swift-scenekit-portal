//
//  Extensions.swift
//  ARKit Portal
//
//  Created by Kamran Rakhimov on 10/12/21.
//

import Foundation
import SceneKit
import ARKit

var height : CGFloat = 1
var width  : CGFloat = 0.2
var length : CGFloat = 1

var doorLength : CGFloat = 0.3

func createBox(isDoor : Bool) -> SCNNode {
    let node = SCNNode()
    
    // Add First Box
    let firstBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let firstBoxNode = SCNNode(geometry: firstBox)
    
    firstBoxNode.renderingOrder = 200
    
    node.addChildNode(firstBoxNode)
    
    // Add Masked Box
    let maskedBox = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    
    maskedBox.firstMaterial?.diffuse.contents = UIColor.white
    maskedBox.firstMaterial?.transparency = 0.00001
    
    let maskedBoxNode = SCNNode(geometry: maskedBox)
    
    maskedBoxNode.renderingOrder = 100
    maskedBoxNode.position = SCNVector3.init(width, 0, 0)
    
    return node
}
