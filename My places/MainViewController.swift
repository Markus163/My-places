//
//  MainViewController.swift
//  My places
//
//  Created by Марк Михайлов on 21.11.2022.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0 : places.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let place = places[indexPath.row]

        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        cell.imageView?.layer.cornerRadius = cell.frame.height / 2
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let place = places[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [deleteAction]
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
    }
}
