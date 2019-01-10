//
//  AllCoaches.swift
//  Tryouts
//
//  Created by Rodrigo Schreiner on 1/7/19.
//  Copyright © 2019 GoEmobile. All rights reserved.
//

import UIKit
import FirebaseFirestore
import MessageUI

class AllCoaches: UITableViewController {
    @IBOutlet weak var myNavigation: UINavigationBar!
    let cellId = "cellId"
    var coachesList = [CoachesNames]()
    var queryAllCoaches = 0
    var navBarTitle = "Coaches"
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let db = Firestore.firestore()
        db.collection("coaches").whereField("coach_invited", isEqualTo: "1").order(by: "coach_name", descending: true).getDocuments {(snapshot, error) in
            if error != nil {
                print(error as Any)
            } else {
                //if (snapshot?.documents.count)! > 0 {
                    self.coachesList.removeAll()
                    for coaches in (snapshot?.documents)! {
                        let coachObject = coaches.data() as? [String: AnyObject]
                        let coachName = coachObject?["coach_name"]
                        let coachPhone = coachObject?["coach_phone"]
                        let coachEmail = coachObject?["coach_email"]
                        let coach_invited = coachObject?["coach_invited"]
                        let teamCode = coachObject?["team_code"]
                        if let userExist = coachObject?["coach_name"] as? String {
                            if userExist.count > 0 {
                                let coach = CoachesNames(coach_name: coachName as! String?, coach_phone: coachPhone as! String?, coach_email: coachEmail as! String?, team_code: teamCode as! String?, coach_invited: coach_invited as! String? )
                                self.coachesList.append(coach)
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
//                } else {
//                    print("No data")
//                }
            }
        }
        tableView.register(CoachCell.self, forCellReuseIdentifier: cellId)

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
    
    func importantAction(at indexPath :IndexPath) -> UIContextualAction {
      //  let coach = coachesList[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Important"){
            (action, view, completion) in
          
            completion(true)
           // coach.isImportant = !coach.isImportant
        }
        
        action.image = #imageLiteral(resourceName: "red_checkmark_30x30")
       // action.backgroundColor = UIColor.red
       return action
        
    }
    
    func deleteAction(at indexPath :IndexPath) -> UIContextualAction {
       // let coach = coachesList[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Delete"){
            (action, view, completion) in
           completion(true)
        }
        
        action.image = #imageLiteral(resourceName: "red_checkmark")
       // action.backgroundColor = UIColor.green
        return action
        
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let important = UIContextualAction(style: .destructive, title: "Important"){
            (action, view, nil) in
            print("important")
           
        }
         important.image = #imageLiteral(resourceName: "red_checkmark_30x30")
        
       // let delete = deleteAction(at: indexPath)
        let config =  UISwipeActionsConfiguration(actions:[important])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let coachInfo = coachesList[indexPath.row]
      //  cell.accessoryType = .disclosureIndicator
    //    cell.detailTextLabel!.numberOfLines = 0
        cell.textLabel!.text = coachInfo.coach_name
        //cell.detailTextLabel?.text = ("\(String(describing: coachInfo.coach_phone!))\n\(String(describing: coachInfo.coach_email!))")
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let coach_info = coachesList[indexPath.row]
        let coachName = coach_info.coach_name!
        let coachPhone = coach_info.coach_phone!
        let coachEmail = coach_info.coach_email!
        let coachInvited = coach_info.coach_invited!
        let vc = storyboard?.instantiateViewController(withIdentifier: "coachdetails") as? CoachDetails
        vc?.coach_name = coachName
        vc?.coach_email = coachEmail
        vc?.coach_phone = coachPhone
        vc?.coach_invited = coachInvited
        
        self.present(vc!,animated:true,completion: nil)
    }

    @IBAction func goToCoachOptions(_ sender: Any) {
         self.presentStoryBoards(storyboardid: "coaches", transitionid: "")
    }
    
    
    func presentStoryBoards(storyboardid: String, transitionid: String) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc:UIViewController = storyBoard.instantiateViewController(withIdentifier: storyboardid) as UIViewController
        self.present(vc,animated:true,completion: nil)
    }
}
