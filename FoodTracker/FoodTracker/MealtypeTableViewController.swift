//
//  MealtypeTableViewController.swift
//  FoodTracker
//
//  Created by Minh on 2017-10-07.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class MealtypeTableViewController: UITableViewController, UISearchResultsUpdating{

    var mealtype: [String]!
    
    var searchcontroller : UISearchController!
    var resultcontroller = UITableViewController()
    var filteredmeal=[String]()
    
    @IBOutlet var mealchoosen: UITableView!
    
    // Search function
//    let searchController = UISearchController(searchResultsController: nil)
//    var filtermeal = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealtype=["Breakfast","Lunch","Dinner","Snack"]
        

        
        self.title="MEAL TYPE"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Declare for the Search
        self.searchcontroller = UISearchController(searchResultsController: self.resultcontroller)
        self.tableView.tableHeaderView = self.searchcontroller.searchBar
        self.searchcontroller.searchResultsUpdater = self
        // To enable the list so that it still showup
        self.searchcontroller.dimsBackgroundDuringPresentation=false
        // To eliminate the space during showing search result
        definesPresentationContext=true

        self.resultcontroller.tableView.dataSource=self
        self.resultcontroller.tableView.delegate=self
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredmeal=self.mealtype.filter{ (meal : String) -> Bool in
            //if meal.lowercased().contains(self.searchcontroller.searchBar.text!.lowercased()){
            var result : Bool
            result = false
            for x in self.searchcontroller.searchBar.text!.lowercased(){
                if meal.lowercased().contains(x){
                    print("same")
                    result = true
                    break
            
                }
                else{
                    print("not same")
                    result = false
                }
            }
            return result
        }
        self.resultcontroller.tableView.reloadData()
        print(filteredmeal)
        print("reload")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("filter1 \(filteredmeal)")
        if tableView == self.tableView{
            return self.mealtype.count
        }
        else{
            return self.filteredmeal.count
        }
        
    }


    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()

        // Configure the cell...

        if tableView==self.tableView{
            cell.textLabel?.text=mealtype[indexPath.row]
        }
        else{
            cell.textLabel?.text=filteredmeal[indexPath.row]
        }
        
        //cell.textLabel?.text=mealtype[indexPath.row]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
            self.performSegue(withIdentifier: "detail", sender: nil)
       
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
