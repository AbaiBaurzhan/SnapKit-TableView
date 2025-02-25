//
//  TableViewController.swift
//  SnapKit TableView
//
//  Created by Абай Бауржан on 23.02.2025.
//

import UIKit
import SnapKit

class TableViewController: UITableViewController {

    var arrayPerson = [
        Person(name: "Brus", surname: "Wayne", imageName: "batman"),
        Person(name: "Diana", surname: "Tymiskirskaya", imageName: "wonder woman"),
        Person(name: "Klark", surname: "Kent", imageName: "superman"),
        Person(name: "Barrey", surname: "Kent", imageName: "flash"),
        Person(name: "Artur", surname: "Karry", imageName: "aquaman")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Persons"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPerson))
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 120
    }

    @objc func addPerson() {
        arrayPerson.append(Person(name: "Username", surname: "Usersurname", imageName: "vk dog"))
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPerson.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let person = arrayPerson[indexPath.row]
        cell.configure(with: person, isEven: indexPath.row % 2 == 0)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayPerson.remove(at: indexPath.row) 
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = arrayPerson[indexPath.row]
        let detailVC = ViewController()
        detailVC.person = person
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

    
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
    
    

