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
    // 表示されている画像の座標
    var tapLocation: CGPoint!
    // 元の画像の座標
    var originTapLocation: CGPoint!
    
    var appdelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    var saveRightEye = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        print("did")
        cameraImageView.image = originImage
        cropImageView.image = cameraImageView.image?.cropping(to: CGRect(x: 100, y: 95, width: 100, height: 100))
        //円形
        cropImageView.layer.cornerRadius = cropImageView.frame.width / 2
        cropImageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        tapLocation = touch.location(in: self.view)
        //サイズの倍率を算出し、UIImage上でのタップ座標を求める
        originTapLocation = CGPoint(x: originImage.size.width/cameraImageView.frame.width * tapLocation.x, y: originImage.size.height/cameraImageView.frame.height * tapLocation.y)
        cropImageView.image = cameraImageView.image?.cropping(to: CGRect(x: originTapLocation.x - 50, y: originTapLocation.y - 50, width: 100, height: 100))
        cropImageView.layer.cornerRadius = cropImageView.frame.width / 2
        cropImageView.clipsToBounds = true
    }
    
    @IBAction func openAlbum() {
        // カメラロールを使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            // カメラロールの画像を選択して画像を表示させるまでの一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        }else{
            print("カメラロールエラー")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            print("呼ばれたカメラロール")
            originImage = image
            appdelegate.rightEyeImage = cropImageView.image
            dismiss(animated: true, completion: {self.performSegue(withIdentifier: "toCollage", sender: nil)})
        }else{
            print("画像選択エラー")
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollage" {
            let nextVC: CollageViewController = (segue.destination as? CollageViewController)!
            nextVC.originImage = originImage
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
