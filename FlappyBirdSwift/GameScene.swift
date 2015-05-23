//
//  GameScene.swift
//  FlappyBirdSwift
//
//  Created by Hemant V. Torsekar on 2015-05-18.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    
    var boo = SKSpriteNode()
    
    var backgroundImage = SKSpriteNode()
    
    var buttonUp = SKSpriteNode()
    // Button Up Setup
    

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Physics for the Cosmos
        self.physicsWorld.gravity = CGVectorMake(0.0,-2.0)
            
        
        // Spaceship Animation Textures
        var booTexture1 = SKTexture(imageNamed:"f1")
        var booTexture2 = SKTexture(imageNamed:"f2")
        var booTexture3 = SKTexture(imageNamed:"f3")
        var booTexture4 = SKTexture(imageNamed:"f4")

        booTexture1.filteringMode = SKTextureFilteringMode.Nearest
        
        boo = SKSpriteNode(texture: booTexture1)
        
        boo.position = CGPoint(x: self.frame.size.width * 0.1, y: self.frame.size.height * 0.6)
            
        // Spaceship Animation Setup
        var animation = SKAction.animateWithTextures([booTexture1, booTexture2, booTexture3, booTexture4], timePerFrame: 0.3)
        var makeBooFlap = SKAction.repeatActionForever(animation)
        
        boo.runAction(makeBooFlap)
        
        // Spaceship setup

        boo.xScale = 2.0
        boo.yScale = 2.0

        boo.zPosition = 30

        boo.physicsBody = SKPhysicsBody(circleOfRadius:boo.size.height / 2.0)
        boo.physicsBody?.dynamic = true
        boo.physicsBody?.allowsRotation = false
        
        self.addChild(boo)
        
        
        
        // Button Down Setup
        var buttonDownTexture = SKTexture(imageNamed: "buttonDown")
        var buttonDown = SKSpriteNode(texture:buttonDownTexture)
        buttonDown.setScale(1.5)
        buttonDown.position = CGPointMake(200, 140)
        buttonDown.physicsBody?.dynamic = false
        buttonDown.physicsBody?.allowsRotation = true
        buttonDown.zPosition = 23
        
        buttonDown.userInteractionEnabled = true
        
        self.addChild(buttonDown)
        
        boo.physicsBody?.velocity = CGVectorMake(0,0)
        func rocketButtonUp() {
            println("up")
            boo.physicsBody?.applyImpulse(CGVectorMake(0,20))
        }
        func rocketButtonDown(){
            println("down")
            boo.physicsBody?.applyImpulse(CGVectorMake(0,20))
        }
        
        
        // BackgroundImage Setup
        var backgroundImage = SKTexture(imageNamed: "farback")
        var farBg = SKSpriteNode(texture: backgroundImage)
        farBg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        farBg.xScale = 2.0
        farBg.yScale = 2.0
        self.addChild(farBg)
        
        //Foreground Stars Setup
        var foregroundBackgroundImage = SKTexture(imageNamed: "starfield")
        var foreGroundBg = SKSpriteNode(texture: foregroundBackgroundImage)
        foreGroundBg.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        foreGroundBg.xScale = 1.0
        foreGroundBg.yScale = 1.0
        
        foreGroundBg.zPosition = 10
        
        var cloud = SKTexture(imageNamed:"clouds")
        var bottomCloud = SKSpriteNode()
        bottomCloud.position = CGPoint(x:0,y:0)
        bottomCloud.zPosition = 30
        self.addChild(bottomCloud)

        
        
        var animationNode = SKSpriteNode()

        var foreGroundBgMove = SKAction.moveByX(-foreGroundBg.size.width, y: 0, duration: 2)
        var replace = SKAction.moveByX(foreGroundBg.size.width, y: 0, duration: 0)
        var moveBGForEver = SKAction.repeatActionForever(SKAction.sequence([foreGroundBgMove,replace]))
        
//        for var i:CGFloat = 0; i < 3; i++ {
//            var backGround = SKSpriteNode(texture: foregroundBackgroundImage)
//            backGround.position = CGPoint(x: foregroundBackgroundImage.size.width / 2 + bgTexture.size.width * i, y:CGRectGetMidY(self.frame))
//            backGround.size.height = self.frame.height
//            
//            backGround.runAction(moveBGForEver)
//            movingObjects.addChild(backGround)
//        }

        
        self.addChild(foreGroundBg)

//        var nebulla1 = SKNode()
//        var nebullaTexture1 = SKTexture(imageNamed: "nebulla4")
//        var nebullaSprite1 = SKSpriteNode(texture: nebullaTexture1)
//        
//        nebullaSprite1.setScale(2.0)
//        nebullaSprite1.position = CGPointMake(600, 600)
//        nebullaSprite1.physicsBody?.dynamic = false
//        nebullaSprite1.physicsBody?.allowsRotation = true
//        nebullaSprite1.zPosition  = 23
//        self.addChild(nebullaSprite1)
//
//        let pressButtonUp = UILongPressGestureRecognizer(target:self, action:"makeRocketGoUp")
//        let pressButtonDown = UILongPressGestureRecognizer(target:self, action:"makeRocketGoDown")
//

}
    
    func playSound(audio:String, shouldRepeat:Bool)
    {
        var sound = SKAction.playSoundFileNamed(audio, waitForCompletion: false)
        runAction(sound)
    }
    
    // Button Up Setup
    var buttonUpTexture = SKTexture(imageNamed: "buttonUp")
    var buttonUp = SKSpriteNode(texture: buttonUpTexture)
    
    
    
    buttonUp.physicsBody?.dynamic = false
    buttonUp.physicsBody?.allowsRotation = false
    buttonUp.setScale(1.5)
    buttonUp.position = CGPointMake(200, 210)
    buttonUp.physicsBody?.dynamic = false
    buttonUp.physicsBody?.allowsRotation = true
    buttonUp.zPosition  = 23
    buttonUp.name = "buttonUpPressed"
    buttonUp.userInteractionEnabled = true
    
    self.addChild(buttonUp)

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */

        for touch in (touches as! Set<UITouch>) {
            let location = (touch as UITouch).locationInNode(self)

            if self.nodeAtPoint(location) == touch.locationInNode(buttonUp) {

                    self.boo.physicsBody?.applyImpulse(CGVectorMake(0, 34))
                
            }
        
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
