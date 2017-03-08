//
//  ViewController.swift
//  KMSDK Sample
//
//  Created by Rodrigo Pacheco Curro on 3/8/17.
//  Copyright © 2017 Kiswe. All rights reserved.
//

import UIKit
import KMSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KMSDK.shared.setAPIToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJLaXN3ZSIsInN1YiI6IjEzODU2MiIsImV4cCI6IjIwMTctMDktMDhUMjE6NTU6MzAuNzk0WiJ9.qgveH0QTXoHmJZRQNFeMl6Uy9kTtXXbKod-cj1x9bXI")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        KMSDK.shared.mediaPlayerControllerWith(eventId: "5957") { (mediaVC: KMMediaViewController?) in
            if let mediaVC = mediaVC {
                self.present(mediaVC, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

