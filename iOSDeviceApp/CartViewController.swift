//
//  CartViewController.swift
//  iOSDeviceApp
//
//  Created by Rakesh on 25/05/19.
//  Copyright © 2019 Subhalaxmi. All rights reserved.
//

import UIKit

class CartViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var cartTableView: UITableView!
    var itemList = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "My Cart"
        let continueShoppingButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width:  44 , height: 44))
        continueShoppingButton.setTitleColor(UIColor.blue, for: .normal)
        continueShoppingButton.setTitle("Continue Shopping", for: .normal)
        continueShoppingButton.addTarget(self, action: #selector(continueShopping), for: UIControlEvents.touchUpInside)
        
        let continueShoppingBarButton = UIBarButtonItem()
        continueShoppingBarButton.customView = continueShoppingButton
        self.navigationItem.rightBarButtonItems = [continueShoppingBarButton]
        
        guard let placesData = UserDefaults.standard.object(forKey: "items") as? NSData else {
            print("'places' not found in UserDefaults")
            return
        }
        
        guard let placesArray = NSKeyedUnarchiver.unarchiveObject(with: placesData as Data) as? [Item] else {
            print("Could not unarchive from placesData")
            return
        }
        self.itemList = placesArray
        
       
        self.cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self
 
    }

    @objc private func continueShopping() {
    
        self.navigationController?.popToRootViewController(animated: true)
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itemList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell!
        cell.deviceImageView.image = self.itemList[indexPath.item].itemImage
        cell.deviceNameLabel.text = self.itemList[indexPath.item].name
        cell.devicePriceLabel.text = self.itemList[indexPath.item].itemPrice
        cell.deviceAvailabilityLabel.text = self.itemList[indexPath.item].itemAvailabilty
        cell.removeBtn.tag = indexPath.row
        cell.removeBtn.addTarget(self, action: #selector(removeButtonClicked), for: UIControlEvents.touchUpInside)

        return cell
        
    }
    @objc func removeButtonClicked(sender:UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to remove the item from cart?", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction!) in
            let buttonPosition = sender.convert(CGPoint.zero, to: self.cartTableView)
            let indexPath = self.cartTableView.indexPathForRow(at: buttonPosition)
            if indexPath != nil {
                self.itemList.remove(at: (indexPath?.row)!)
                self.cartTableView.reloadData()
                var tempItemsArray: [Item] = []
                tempItemsArray = self.itemList
                let tempItemData = NSKeyedArchiver.archivedData(withRootObject: tempItemsArray) as NSData
                UserDefaults.standard.set(tempItemData, forKey: "items")
                
                
            }
        }
        alert.addAction(OKAction)
        
        // Create Cancel button
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { (action:UIAlertAction!) in
        }
        alert.addAction(cancelAction)
        
        
        self.present(alert, animated: true, completion: nil)
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0
    }

}
