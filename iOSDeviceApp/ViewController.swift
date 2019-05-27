//
//  ViewController.swift
//  iOSDeviceApp
//
//  Created by Rakesh on 25/05/19.
//  Copyright © 2019 Subhalaxmi. All rights reserved.
//

import UIKit
class Item : NSObject, NSCoding {
    
   
    var name: String
    var itemImage: UIImage
    var itemPrice: String
    var itemId: String
    var itemAvailabilty: String
    var performance: String
    var display: String
    var storage: String
    var camera: String
    var battery: String

    
    init(name: String, itemImage: UIImage, itemPrice: String, itemId: String, itemAvailabilty: String, performance: String, display: String, storage:String, camera:String, battery:String) {
        self.name = name
        self.itemImage = itemImage
        self.itemPrice = itemPrice
        self.itemId = itemId
        self.itemAvailabilty = itemAvailabilty
        self.performance = performance
        self.display = display
        self.storage = storage
        self.camera = camera
        self.battery = battery

        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        itemImage = aDecoder.decodeObject(forKey: "itemImage") as! UIImage
        name = aDecoder.decodeObject(forKey: "name") as! String
        itemPrice = aDecoder.decodeObject(forKey: "itemPrice") as! String
        itemId = aDecoder.decodeObject(forKey: "itemId") as! String
        itemAvailabilty = aDecoder.decodeObject(forKey: "itemAvailabilty") as! String
        performance = aDecoder.decodeObject(forKey: "performance") as! String
        display = aDecoder.decodeObject(forKey: "display") as! String
        storage = aDecoder.decodeObject(forKey: "storage") as! String
        camera = aDecoder.decodeObject(forKey: "camera") as! String
        battery = aDecoder.decodeObject(forKey: "battery") as! String

        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(itemImage, forKey: "itemImage")
        aCoder.encode(itemPrice, forKey: "itemPrice")
        aCoder.encode(itemId, forKey: "itemId")
        aCoder.encode(itemAvailabilty, forKey: "itemAvailabilty")
        aCoder.encode(performance, forKey: "performance")
        aCoder.encode(display, forKey: "display")
        aCoder.encode(storage, forKey: "storage")
        aCoder.encode(camera, forKey: "camera")
        aCoder.encode(battery, forKey: "battery")

        
    }
}

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var deviceCollectionView: UICollectionView!
    let reuseIdentifier = "DeviceCollectionViewCell" // also enter this string as the cell identifier in the storyboard
  
    var itemList = [Item]()

    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = "Find Device"

       
        
        self.itemList.append(Item(name: "Oppo F1", itemImage: UIImage(named:"oppo1")!,  itemPrice: "INR 27000", itemId:"1",itemAvailabilty:"Apr 2017",performance: "Octa 12", display: "6.5", storage:"4 GB", camera:"12 MP", battery:"4000 mAh"))
        self.itemList.append(Item(name: "Redmi Note 3", itemImage: UIImage(named:"device_2")!,  itemPrice: "INR 22000", itemId:"2",itemAvailabilty:"Apr 2016",performance: "Octa 12", display: "5.0", storage:"3 GB", camera:"11 MP", battery:"3065 mAh"))
        self.itemList.append(Item(name: "Redmi Note 4", itemImage: UIImage(named:"device_3")!,  itemPrice: "INR 14000", itemId:"3",itemAvailabilty:"Mar 2017",performance: "Octa 12", display: "6.0", storage:"2 GB", camera:"10 MP", battery:"3050 mAh"))
        self.itemList.append(Item(name: "Real Me 2", itemImage: UIImage(named:"device_4")!,  itemPrice: "INR 13000", itemId:"4",itemAvailabilty:"Apr 2019",performance: "Octa 12", display: "5.5", storage:"6 GB", camera:"8 MP", battery:"4000 mAh"))
        self.itemList.append(Item(name: "Nexus 6p", itemImage: UIImage(named:"device_5")!,  itemPrice: "INR 11000", itemId:"5",itemAvailabilty:"Jan 2018",performance: "Octa 12", display: "5.5", storage:"4 GB", camera:"13 MP", battery:"3000 mAh"))
        self.itemList.append(Item(name: "Oppo F7", itemImage: UIImage(named:"device_6")!,  itemPrice: "INR 19000", itemId:"6",itemAvailabilty:"Mar 2017",performance: "Octa 12", display: "5.0", storage:"3 GB", camera:"12 MP", battery:"3000 mAh"))
        self.itemList.append(Item(name: "Oppo F9", itemImage: UIImage(named:"device_7")!,  itemPrice: "INR 7000", itemId:"7",itemAvailabilty:"Jun 2017",performance: "Octa 12", display: "6.5", storage:"4 GB", camera:"12 MP", battery:"4050 mAh"))
        self.itemList.append(Item(name: "Redmin Y1", itemImage: UIImage(named:"device_8")!,  itemPrice: "INR 9000", itemId:"8",itemAvailabilty:"Apr 2018",performance: "Octa 12", display: "6", storage:"4 GB", camera:"8 MP", battery:"3050 mAh"))
        self.deviceCollectionView.dataSource = self
        self.deviceCollectionView.delegate = self
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! DeviceCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.deviceNameLabel.text = self.itemList[indexPath.item].name
        cell.devicePriceLabel.text = self.itemList[indexPath.item].itemPrice
        cell.deviceAvailabilityLabel.text = self.itemList[indexPath.item].itemAvailabilty
        cell.deviceImageView.image = self.itemList[indexPath.item].itemImage

       // cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let deviceDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "DeviceDetailsViewController") as! DeviceDetailsViewController
        deviceDetailsViewController.itemselected = self.itemList[indexPath.item]
        self.navigationController?.pushViewController(deviceDetailsViewController, animated: true)
    }
}
