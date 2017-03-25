//
//  ViewController.swift
//  BackgroundVideoToSound
//
//  Created by 梁雅軒 on 2017/3/24.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer
class ViewController: UIViewController {
    var window: UIWindow?
    var myPlayer:AVPlayer?
    var item:AVPlayerItem?
    var myPlayerLay:AVPlayerLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.nextTrackCommand.isEnabled = true
        commandCenter.playCommand.addTarget(self, action:#selector(player))
    }
    
    override var canBecomeFirstResponder: Bool{return true}
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        player() 
    }
    
    func player() {
        if myPlayer == nil {
            if let path = Bundle.main.path(forResource: "Demo", ofType: "mp4"){
                item = AVPlayerItem(url: URL(fileURLWithPath: path))
                myPlayer = AVPlayer.init(playerItem: item)
                myPlayerLay = AVPlayerLayer.init(player: myPlayer)
                myPlayerLay?.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
                self.view.layer.addSublayer(myPlayerLay!)
                myPlayer?.play()
                
                let infoContent = MPNowPlayingInfoCenter.default()
                var dic = [String:Any]()
//                dic[MPMediaItemPropertyPlaybackDuration] = 400
//                dic[MPNowPlayingInfoPropertyElapsedPlaybackTime] = 30
                dic[MPMediaItemPropertyTitle] = "怎麼說我不愛你"
                dic[MPMediaItemPropertyPlaybackDuration] = 
                infoContent.nowPlayingInfo = dic  
            }
        }else{
            self.myPlayer?.play()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

