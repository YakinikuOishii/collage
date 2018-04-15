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
    @IBOutlet var rightEyeButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    var originImage: UIImage!
    var stampImageView: UIImageView!
    var appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

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
        
        print("locationは\(location)")
        
        let image: UIImage = (rightEyeButton.imageView?.image)!
        stampImageView.image = image
        stampImageView.center = CGPoint(x: location.x, y: location.y)
        imageView.addSubview(stampImageView)
    }
    
    @IBAction func save() {
        let rect: CGRect = CGRect(x: 0, y: 20, width: 320, height: 320)
        UIGraphicsBeginImageContext(rect.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // フォトライブラリに保存
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
        
        let alert: UIAlertController = UIAlertController(title: "画像の保存", message: "カメラロールに保存しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OKが押された")
            })
        )
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func delete() {
        //サブビューがいくつ乗っているか取得
        print("デリート呼ばれたよ")
        print(imageView.subviews.count)
        if imageView.subviews.count >= 1 {
            let lastSubView = imageView.subviews.last!
            lastSubView.removeFromSuperview()
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
