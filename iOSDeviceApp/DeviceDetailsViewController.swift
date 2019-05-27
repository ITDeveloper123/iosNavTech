//
//  DeviceDetailsViewController.swift
//  iOSDeviceApp
//
//  Created by Rakesh on 25/05/19.
//  Copyright © 2019 Subhalaxmi. All rights reserved.
//

import UIKit

class DeviceDetailsViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    var itemselected:Item!

    @IBOutlet weak var insideView: UIView!
    @IBOutlet weak var deviceImagevIew: UIImageView!
    @IBOutlet weak var performanceLabel: UILabel!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
    @IBOutlet weak var batteryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Find Device"
        let addToCartButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width:  44 , height: 44))
       // addToCartButton.setImage(UIImage(named: "add_to_cart"), for: .normal)
        addToCartButton.setTitleColor(UIColor.blue, for: .normal)
        addToCartButton.setTitle("Add To Cart", for: .normal)

        addToCartButton.addTarget(self, action: #selector(addToCart), for: UIControlEvents.touchUpInside)
        
        let addToCartBarButton = UIBarButtonItem()
        addToCartBarButton.customView = addToCartButton
        self.navigationItem.rightBarButtonItems = [addToCartBarButton]
        
        self.availabilityLabel.text = self.itemselected.itemAvailabilty
        self.deviceImagevIew.image = self.itemselected.itemImage
        self.performanceLabel.text = self.itemselected.performance
        self.displayLabel.text = self.itemselected.display
        self.storageLabel.text = self.itemselected.storage
        self.cameraLabel.text = self.itemselected.camera
        self.batteryLabel.text = self.itemselected.battery
        self.priceLabel.text = self.itemselected.itemPrice

     
        
        
        
       
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        scrollView.contentSize = CGSize.init(width: self.insideView.frame.width, height: self.insideView.frame.height + 300)

    }
    
   
    @objc private func addToCart() {
        var itemsData = UserDefaults.standard.object(forKey: "items")
        if(itemsData == nil){
            var tempItemsArray1: [Item] = []
            tempItemsArray1.append(self.itemselected)
            
            let itemsData1 = NSKeyedArchiver.archivedData(withRootObject: tempItemsArray1)
            UserDefaults.standard.set(itemsData1, forKey: "items")
        }else{
            var tempItemsArray: [Item] = []
            tempItemsArray = (NSKeyedUnarchiver.unarchiveObject(with: itemsData as! Data) as? [Item])!
            tempItemsArray.append(self.itemselected)
            itemsData = NSKeyedArchiver.archivedData(withRootObject: tempItemsArray) as NSData
            //placesData = NSKeyedArchiver.archivedData(withRootObject: placesArray)
            UserDefaults.standard.set(itemsData, forKey: "items")

        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let deviceDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        self.navigationController?.pushViewController(deviceDetailsViewController, animated: true)
//        guard var tempItemsArray = NSKeyedUnarchiver.unarchiveObject(with: itemsData as! Data) as? [Item] else {
//            print("Could not unarchive from placesData")
//           
//            return
//        }
       
        

        
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
