//
//  MainViewController.swift
//  My places
//
//  Created by Марк Михайлов on 21.11.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
    let restaurantNames = [
        "Cafe47", "Левингстон", "Вилка-Ложка", "Хокку", "Ваще огонь",
        "Джонни Ву", "Аль-Халяль", "Тандыр", "Перчини", "Альфред",
        "Кухмистерская", "Лепрекон", "Кантина Мука", "То самое тесто", "Meat Club"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.imageOfPlace.image = UIImage(named: restaurantNames[indexPath.row])
//        cell.imageView?.layer.cornerRadius = cell.frame.height / 2
//        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
