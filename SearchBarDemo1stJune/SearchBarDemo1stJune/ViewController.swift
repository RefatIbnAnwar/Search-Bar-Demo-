//
//  ViewController.swift
//  SearchBarDemo1stJune
//
//  Created by Mobio on 6/1/17.
//  Copyright © 2017 Mobio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,UISearchBarDelegate{
    
    
    @IBOutlet weak var myTableView: UITableView!

    @IBOutlet weak var mySearchBar: UISearchBar!
    
    
    var countryList = ["India","Bangladesh","Austrilia","NewZeland","Pakistan","Bhutan","Dubai","USA","England","Malayasia","Italy","Ireland","WestIndies","Zimbabwe","Colombia","Brazil","Argentina","RealMadrid"].sorted()

    var filterArray : [String]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //filterArray is empty at first , so we have to load countrylist in filterArray 
        
        filterArray = countryList
    //mySearchBar.delegate = self
            mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "Search Here"
        
            }

    
    
    // delegate method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //delegate method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return filterArray!.count
    }
    
    
    
    //datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CELL" , for: indexPath)
        cell.textLabel?.text = filterArray?[indexPath.row]
        return cell
        
    }
    
    
    //search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print("Called")
        //print(searchText)
        
        if searchText.isEmpty{
            filterArray = countryList
        } else
        {
            //we have to convert all the character into lowercase or uppercase to check if the search string is available or not
            
            filterArray = countryList.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        
        // since data is changed so we have to reload the tableView
        
        self.myTableView.reloadData()
        
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      filterArray = countryList
         self.myTableView.reloadData()
    }
    
    

}

