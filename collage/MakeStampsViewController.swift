//
//  MakeStampsViewController.swift
//  collage
//
//  Created by 笠原未来 on 2018/03/24.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class MakeStampsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet var cropImageView: UIImageView!
    var originImage: UIImage!
    
    var tapLocation: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did")
//        cameraImageView.image = originImage
        cropImageView.image = cameraImageView.image?.cropping(to: CGRect(x: 100, y: 95, width: 50, height: 50))
        cropImageView.layer.cornerRadius = cropImageView.frame.width / 2
        cropImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        tapLocation = touch.location(in: self.view)
        cropImageView.image = cameraImageView.image?.cropping(to: CGRect(x: tapLocation.x, y: tapLocation.y, width: 50, height: 50))
        cropImageView.layer.cornerRadius = cropImageView.frame.width / 2
        cropImageView.clipsToBounds = true
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
