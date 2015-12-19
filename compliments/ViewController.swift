//
//  ViewController.swift
//  compliments
//
//  Created by Kyle Wilson on 12/16/15.
//  Copyright © 2015 Bluyam Inc. All rights reserved.
//

import UIKit
import FBSDKMessengerShareKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet var complimentLabel: UILabel!
    @IBOutlet var messengerBackgroundView: UIView!
    @IBOutlet var refreshButton: UIImageView!
    @IBOutlet var messengerButton: UIImageView!
    @IBOutlet var actualMessengerButton: UIButton!
    @IBOutlet var shareView: UIView!
    @IBOutlet var facebookImageView: UIImageView!
    
    var compliments = [ "Your smile is contagious.",
        "You look great today.",
        "You're a smart cookie.",
        "I bet you make babies smile.",
        "You have impeccable manners.",
        "I like your style.",
        "You have the best laugh.",
        "I appreciate you.",
        "You are the most perfect you there is.",
        "You are enough.",
        "You're strong.",
        "Your perspective is refreshing.",
        "You're an awesome friend.",
        "You light up the room.",
        "You deserve a hug right now.",
        "You should be proud of yourself.",
        "You're more helpful than you realize.",
        "You have a great sense of humor.",
        "You've got all the right moves!",
        "Your kindness is a balm to all who encounter it.",
        "You're all that and a super-size bag of chips.",
        "On a scale from 1 to 10, you're an 11.",
        "You are brave.",
        "You have the courage of your convictions.",
        "Your eyes are breathtaking.",
        "You are making a difference.",
        "You're like sunshine on a rainy day.",
        "You bring out the best in other people.",
        "You're a great listener.",
        "How is it that you always look great, even in sweatpants?",
        "Everything would be better if more people were like you!",
        "I bet you sweat glitter.",
        "You were cool way before hipsters were cool.",
        "That color is perfect on you.",
        "Hanging out with you is always a blast.",
        "You smell really good.",
        "Being around you makes everything better!",
        "When you say, 'I meant to do that,' I totally believe you.",
        "Colors seem brighter when you're around.",
        "You're more fun than a ball pit filled with candy.",
        "You're wonderful.",
        "You have cute elbows. For reals!",
        "Jokes are funnier when you tell them.",
        "You're better than a triple-scoop ice cream cone.",
        "Your bellybutton is kind of adorable.",
        "Your hair looks stunning.",
        "You're one of a kind!",
        "You're inspiring.",
        "You should be thanked more often, so thank you!",
        "Our community is better because you're in it.",
        "You have the best ideas.",
        "You always know how to find that silver lining.",
        "You're a candle in the darkness.",
        "You're a great example to others.",
        "Being around you is like being on a happy little vacation.",
        "You always know just what to say.",
        "You could survive a Zombie apocalypse.",
        "You're more fun than bubble wrap.",
        "When you make a mistake, you fix it.",
        "Who raised you? They deserve a medal for a job well done.",
        "You're great at figuring stuff out.",
        "Your voice is magnificent.",
        "The people you love are lucky to have you in their lives.",
        "You're like a breath of fresh air.",
        "You're so thoughtful.",
        "Your creative potential seems limitless.",
        "Your name suits you to a T.",
        "You're irresistible when you blush.",
        "Somehow you make time stop and fly at the same time.",
        "You seem to really know who you are.",
        "Any team would be lucky to have you on it.",
        "I bet you do the crossword puzzle in ink.",
        "Babies and small animals probably love you.",
        "There's ordinary, and then there's you.",
        "You're someone's reason to smile.",
        "You're even better than a unicorn, because you're real.",
        "How do you keep being so funny and making everyone laugh?",
        "You have a good head on your shoulders.",
        "Has anyone ever told you that you have great posture?",
        "The way you treasure your loved ones is incredible.",
        "You're really something special.",
        "You're a gift to those around you."]
    
    var currentCompliment = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.userInteractionEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
        setNeedsStatusBarAppearanceUpdate()
        
        // set rounded corners for simulated messenger app icon
        messengerBackgroundView.layer.cornerRadius = 13
        facebookImageView.layer.cornerRadius = 16
        
        // send views to correct zPosition
        shareView.layer.zPosition = -1
        // actualMessengerButton.layer.zPosition = 10
        
        // get random compliment
        setCurrentCompliment()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func onRefreshTapped(sender: UITapGestureRecognizer) {
        setCurrentCompliment()
    }
    
    @IBAction func onMessengerTapped(sender: AnyObject) {
        let image = UIImage(named: "complimentary_logo_draft1.png")
        FBSDKMessengerSharer.shareImage(image, withOptions: nil)

    }
    
    @IBAction func onSMSTapped(sender: AnyObject) {
        let controller = configuredMessageComposeViewController()
        if MFMessageComposeViewController.canSendText() {
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func setCurrentCompliment() {
        let index = Int(arc4random_uniform(81))
        currentCompliment = compliments[index]
        complimentLabel.text = currentCompliment
    }
    
    func configuredMessageComposeViewController() -> MFMessageComposeViewController {
        let messageComposerVC = MFMessageComposeViewController()
        messageComposerVC.body = "\(currentCompliment) (Sent via Complimentary)"
        messageComposerVC.messageComposeDelegate = self
        return messageComposerVC
    }
    
    func showSendMessageErrorAlert() {
        // error message when messsage cannot be sent
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

