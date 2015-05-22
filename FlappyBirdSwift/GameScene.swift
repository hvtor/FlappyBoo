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
        self.physicsWorld.gravity = CGVectorMake(0.0, -3.0);
        
        // Boo Setup
        var booTexture1 = SKTexture(imageNamed:"f1")
        var booTexture2 = SKTexture(imageNamed:"f2")
        var booTexture3 = SKTexture(imageNamed:"f3")
        var booTexture4 = SKTexture(imageNamed:"f4")


        booTexture1.filteringMode = SKTextureFilteringMode.Nearest
        
        
        boo = SKSpriteNode(texture: booTexture1)
        
        boo.position = CGPoint(x: self.frame.size.width * 0.1, y: self.frame.size.height * 0.6)
            

        
        var animation = SKAction.animateWithTextures([booTexture1, booTexture2, booTexture3, booTexture4], timePerFrame: 0.3)
        var makeBooFlap = SKAction.repeatActionForever(animation)
        boo.runAction(makeBooFlap)
        
        

        //

        boo.xScale = 2.0
        boo.yScale = 2.0

        boo.zPosition = 20

        boo.physicsBody = SKPhysicsBody(circleOfRadius:boo.size.height / 2.0)
        boo.physicsBody?.dynamic = true
        boo.physicsBody?.allowsRotation = false
        
        self.addChild(boo)
        
        var backgroundImage = SKTexture(imageNamed: "farback")
        var farBg = SKSpriteNode(texture: backgroundImage)
        farBg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        farBg.xScale = 2.0
        farBg.yScale = 2.0
        
        

        self.addChild(farBg)
        
        
        var foregroundBackgroundImage = SKTexture(imageNamed: "farback")
        var foreGroundBg = SKSpriteNode(texture: foregroundBackgroundImage)
        foreGroundBg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        foreGroundBg.xScale = 1.0
        foreGroundBg.yScale = 1.0
        
        foreGroundBg.zPosition = 10
        self.addChild(foreGroundBg)

        
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
            boo.physicsBody?.velocity = CGVectorMake(0,0)

            boo.physicsBody?.applyImpulse(CGVectorMake(0, 35))
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
