//
//  CollageViewController.swift
//  collage
//
//  Created by 笠原未来 on 2018/04/04.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class CollageViewController: UIViewController {
    
    var originImage: UIImage!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var rightEyeButton: UIButton!
    
    var stampImageView: UIImageView!

    var touchCount: Int = 0
    
    var appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//    var saveRightEye = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = originImage
        rightEyeButton.setImage(appdelegate.rightEyeImage, for: .normal)
        rightEyeButton.layer.cornerRadius = rightEyeButton.frame.width / 2
        rightEyeButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        stampImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        stampImageView.layer.cornerRadius = stampImageView.frame.width / 2
        stampImageView.clipsToBounds = true
        
        print("indexは\(touchCount)")
        print("locationは\(location)")
        
        if touchCount <= 1 {
            touchCount = touchCount + 1
        }
        
        
        if touchCount <= 1 {
            let image: UIImage = (rightEyeButton.imageView?.image)!
            stampImageView.image = image
            
            stampImageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(stampImageView)
        }
        
        
    }
    
//    @IBAction func stamp() {
//
//    }
    
    @IBAction func remove() {
        print("呼ばれた")
        touchCount = touchCount - 1
        if touchCount == 0 {
            self.stampImageView.removeFromSuperview()

        }
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
