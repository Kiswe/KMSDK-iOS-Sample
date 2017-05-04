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
    @IBOutlet weak var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        KMSDK.shared.setAPIToken("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJLaXN3ZSIsInN1YiI6IjEzODU2MiIsImV4cCI6IjIwMTctMDktMDhUMjE6NTU6MzAuNzk0WiJ9.qgveH0QTXoHmJZRQNFeMl6Uy9kTtXXbKod-cj1x9bXI")
    }

    @IBAction func didTapPresentSoloMediaPlayerButton(_ sender: UIButton) {
        guard let eventId = eventIdTextField.text else { return }
        let username = usernameTextField.text ?? ""
        KMSDK.shared.mediaPlayerControllerWith(eventId: eventId, username: username) { (mediaVC: KMMediaViewController?) in
            if let mediaVC = mediaVC {
                mediaVC.delegate = self
                self.present(mediaVC, animated: true, completion: nil)
            } else {
                self.presentCouldNotGetEventError()
            }
        }
    }

    @IBAction func didTapPresentMediaPlayerWithWidgetsButton(_ sender: UIButton) {
        guard let eventId = eventIdTextField.text else { return }
        let username = usernameTextField.text ?? ""
        KMSDK.shared.parentViewControllerWith(eventId: eventId, username: username) { (parentVC: KMParentViewController?) in
            if let parentVC = parentVC {
                parentVC.mediaPlayerController.delegate = self
                self.present(parentVC, animated: true)
            } else {
                self.presentCouldNotGetEventError()
            }
        }
    }

    func presentCouldNotGetEventError() {
        let vc = UIAlertController(title: "Error",
                                   message: "Could not get Event",
                                   preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil))
        self.present(vc, animated: true)
    }
}

extension ViewController: KMMediaControllerDelegate {

    func mediaController(_ mediaController: KMMediaViewController,
                         playerStateDidChange newState: KMMediaState) {
        print("\(mediaController) player state did change to KMMediaState.rawValue: \(newState.rawValue)")
    }

    func mediaController(_ mediaController: KMMediaViewController,
                         playerSwitchingFromStream fromStreamName: String?,
                         toStream toStreamName: String?) {
        print("\(mediaController) switching from stream \(fromStreamName ?? "nil") to \(toStreamName ?? "nil")")
    }

    func mediaController(_ mediaController: KMMediaViewController,
                         userMovedPlayheadTo playhead: String) {
        print("\(mediaController) user moved playhead to \(playhead)")
    }
}

