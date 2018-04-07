//
//  ViewController.swift
//  collage
//
//  Created by 笠原未来 on 2018/03/24.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var originImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func useCamera() {
        // カメラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)

        }else{
            print("起動エラー")
        }
//        performSegue(withIdentifier: "toMakeStamps", sender: self)
    }
    
    // 撮影が完了した時に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            print("呼ばれた撮影")
            originImage = image
            dismiss(animated: true, completion: {
                self.performSegue(withIdentifier: "toMakeStamps", sender: nil)
            })
        }else{
            print("撮影エラー")
            dismiss(animated: true, completion: nil)
        }
       
    }
    
//    @IBAction func openAlbum() {
//        // カメラロールを使えるかの確認
//        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//            
//            // カメラロールの画像を選択して画像を表示させるまでの一連の流れ
//            let picker = UIImagePickerController()
//            picker.sourceType = .photoLibrary
//            picker.delegate = self
//            
//            picker.allowsEditing = true
//            
//            present(picker, animated: true, completion: nil)
//        }else{
//            print("カメラロールエラー")
//        }
//    }
//    
//     このメソッドが呼ばれない問題
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            print("呼ばれたカメラロール")
//            originImage = image
//            dismiss(animated: true, completion: {self.performSegue(withIdentifier: "toCollage", sender: nil)})
//        }else{
//            print("画像選択エラー")
//            dismiss(animated: true, completion: nil)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMakeStamps" {
            let nextVC: MakeStampsViewController = (segue.destination as? MakeStampsViewController)!
            nextVC.originImage = originImage
        }
        
//       if segue.identifier == "toCollage" {
//            let nextVC: CollageViewController = (segue.destination as? CollageViewController)!
//            nextVC.imageView.image = originImage
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

