//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by Rennan Bruno on 27/02/22.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {
    
    
    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerContoller: AVPlayerViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()

       prepareView()
       preparePlayer()
    }
    
    func prepareView() {
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        var rating = "Ainda não avaliado"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating {
                rating += "✮"
            }
        }
        lbRating.text = rating
        ivTrailer.image = UIImage(named: trailer.poster + "-large")
    }
    
    func preparePlayer() {
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        playerContoller = AVPlayerViewController()
        playerContoller.player = player
        playerContoller.showsPlaybackControls = true
        playerContoller.player?.play()
        playerContoller.view.frame = viTrailer.bounds
        viTrailer.addSubview(playerContoller.view)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
