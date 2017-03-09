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

    @IBOutlet weak var eventIdTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KMSDK.shared.setAPIToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJLaXN3ZSIsInN1YiI6IjEzODU2MiIsImV4cCI6IjIwMTctMDktMDhUMjE6NTU6MzAuNzk0WiJ9.qgveH0QTXoHmJZRQNFeMl6Uy9kTtXXbKod-cj1x9bXI")
    }

    @IBAction func didTapPresentButton(_ sender: UIButton) {
        guard let eventId = eventIdTextField.text else { return }
        KMSDK.shared.mediaPlayerControllerWith(eventId: eventId) { (mediaVC: KMMediaViewController?) in
            if let mediaVC = mediaVC {
                self.present(mediaVC, animated: true, completion: nil)
            }
        }
        
    }
}

