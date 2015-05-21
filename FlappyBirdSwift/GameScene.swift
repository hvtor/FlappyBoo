//
//  GameScene.swift
//  FlappyBirdSwift
//
//  Created by Hemant V. Torsekar on 2015-05-18.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var boo = SKSpriteNode()
    
    var backgroundImage = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Physics
        self.physicsWorld.gravity = CGVectorMake(0.0, 3.0);
        
        // Boo Setup
        var booTexture1 = SKTexture(imageNamed:"boo1")
        var booTexture2 = SKTexture(imageNamed:"boo2")
        booTexture1.filteringMode = SKTextureFilteringMode.Nearest
        
        
        boo = SKSpriteNode(texture: booTexture1)
        
        boo.position =  CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        var animation = SKAction.animateWithTextures([booTexture1, booTexture2], timePerFrame: 0.3)
        var makeBooFlap = SKAction.repeatActionForever(animation)
        boo.runAction(makeBooFlap)
        
        boo.yScale:

        //        CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)

        boo.xScale = 0.15
        boo.yScale = 0.15

        boo.zPosition = 10

        boo.physicsBody = SKPhysicsBody(circleOfRadius:boo.size.height / 2.0)
        boo.physicsBody?.dynamic = false
        boo.physicsBody?.allowsRotation = false
        
        self.addChild(boo)
        
        var backgroundImage = SKTexture(imageNamed: "backgroundImage")
        var bg = SKSpriteNode(texture: backgroundImage)
        bg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg.xScale = 2.0
        bg.yScale = 2.0

        self.addChild(bg)

        
        // Ground
        
        var ground = SKNode()
        var groundTexture = SKTexture(imageNamed: "ground")
        var groundSprite = SKSpriteNode(texture: groundTexture)

        groundSprite.setScale(2)
        groundSprite.physicsBody = SKPhysicsBody(rectangleOfSize:CGSizeMake(self.frame.size.width, groundTexture.size().height * 1.0))
        groundSprite.position = CGPointMake(self.size.width/2, groundSprite.size.height/10)
        groundSprite.physicsBody?.dynamic = false
        groundSprite.physicsBody?.allowsRotation = false



        self.addChild(groundSprite)

        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        println("Flappy is Flying")
        for touch in (touches as! Set<UITouch>) {
            
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
