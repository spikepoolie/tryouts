//
//  AllCoaches.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/7/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit
import FirebaseFirestore
class AllCoaches: UITableViewController {
    
    //var ref: DatabaseReference?
    @IBOutlet weak var myNavigation: UINavigationItem!
    let cellId = "cellId"
    var coachesList = [CoachesNames]()
    
    override func viewDidLoad() {
       // ref = Database.database().reference().child("TryOutCoaches")
        super.viewDidLoad()
        let db = Firestore.firestore()
        db.collection("coaches").getDocuments {(snapshot, error) in
            if error != nil {
                print(error as Any)
            } else {
                if (snapshot?.documents.count)! > 1 {
                    self.coachesList.removeAll()
                    for coaches in (snapshot?.documents)! {
                        let coachObject = coaches.data() as? [String: AnyObject]
                        let coachName = coachObject?["coach_name"]
                        let coachPhone = coachObject?["coach_phone"]
                        let coachEmail = coachObject?["coach_email"]
                        let coach = CoachesNames(coach_name: coachName as! String?, coach_phone: coachPhone as! String?, coach_email: coachEmail as! String? )
                        self.coachesList.append(coach)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }

                    }
                } else {
                    print("No data")
                }
            }
        }
        tableView.register(CoachCell.self, forCellReuseIdentifier: cellId)
     
        
//        ref?.queryOrdered(byChild: "coach")
//            .observeSingleEvent(of: .value, with: { snapshot in
//
//            if snapshot.exists() {
//                self.coachesList.removeAll()
//                for coaches in snapshot.children.allObjects as![DataSnapshot] {
//                    let coachObject = coaches.value as? [String: AnyObject]
//                    let coachName = coachObject?["coach"]
//                    let coachPhone = coachObject?["cellphone"]
//                    let teamName = coachObject?["team_name"]
//
//                    let coach = CoachesNames(team_name: teamName as! String?, cellphone: coachPhone as! String?, coach: coachName as! String? )
//
//                    self.coachesList.append(coach)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//
//                }
//            }
//        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coachesList.count
    }
    
    @objc func HandleMe(){
        
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let coachInfo = coachesList[indexPath.row]
        cell.detailTextLabel!.numberOfLines = 0
        cell.textLabel!.text = coachInfo.coach_name
        cell.detailTextLabel?.text = ("\(String(describing: coachInfo.coach_phone!))\n\(String(describing: coachInfo.coach_email!))")
        return cell
    }
    
    class CoachCell: UITableViewCell {
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
