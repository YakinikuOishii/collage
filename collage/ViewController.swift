//
//  ViewController.swift
//  collage
//
//  Created by 笠原未来 on 2018/03/24.
//  Copyright © 2018年 笠原未来. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var image: UIImage!

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
            print("error")
        }
    }
    
    // 選択した画像をアプリ内に表示
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerEditedImage] as? UIImage
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "to", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditViewController" {
            let nextVC: MakeStampsViewController = (segue.destination as? MakeStampsViewController)!
            nextVC.originImage = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

