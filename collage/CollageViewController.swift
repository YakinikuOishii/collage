//
//  CollageViewController.swift
//  collage
//
//  Created by 笠原未来 on 2018/04/04.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class CollageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var rightEyeImageView: UIImageView!
    
    var appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
//    var saveRightEye = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        rightEyeImageView.image = appdelegate.rightEyeImage

        // Do any additional setup after loading the view.
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
