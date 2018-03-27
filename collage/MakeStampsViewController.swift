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
    var originImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        cameraImageView.image = originImage
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
