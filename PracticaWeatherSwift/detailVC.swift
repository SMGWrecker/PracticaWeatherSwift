//
//  detailVC.swift
//  PracticaWeatherSwift
//
//  Created by user on 04/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON


//class detailVC: UITableViewController {
class detailVC: UIViewController {

    var cityName = ""
    
    @IBOutlet weak var iconDetail: UIImageView!
    @IBOutlet weak var cityDetail: UILabel!
    @IBOutlet weak var tempDetail: UILabel!
    @IBOutlet weak var dateDetail: UILabel!
    @IBOutlet weak var weekDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentWeather(city: cityName)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        currentWeather(city: cityName)
//    }
    
    func currentWeather(city: String) {
        let url = "https://api.weatherapi.com/v1/current.json?key=\(token)&q=\(city)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        AF.request(url as! URLConvertible, method: .get).validate().responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.cityDetail.text = city
                self.tempDetail.text = String(json["current"]["temp_c"].doubleValue)
                let iconString = "https:\(json["current"]["condition"]["icon"].stringValue)"
                self.iconDetail.image = UIImage.init(data: try! Data(contentsOf: URL(string: iconString)!))
                let dateString = json["location"]["localtime"].stringValue
                let dateFormating = DateFormatter()
                dateFormating.dateFormat="yyyy-MM-dd HH:mm"
                if let dateFinal = dateFormating.date(from: dateString) {
                    dateFormating.dateFormat = "dd/MM/yyyy"
//                    let dateResult =
                    self.dateDetail.text = dateFormating.string(from: dateFinal)
                    
                    dateFormating.dateFormat = "EEEE"
                    self.weekDetail.text = dateFormating.string(from: dateFinal).description
                }
                
                
                
//                var dateResult = String(dateFinal)
//                self.weekDetail.text = weekDay
                

                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
