//
//  TableViewController.swift
//  Tong_Types_of_Parser
//
//  Created by Tong Yi on 5/17/20.
//  Copyright © 2020 Tong Yi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    let bundle = Bundle.main
    let fileManager = FileManager.default
    var jsonD: [Entertainment] = []
    let jsonDecoder = JSONDecoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        jsonParser()
    }
    
    func setupUI()
    {
        self.tableView.tableFooterView = UIView()
        self.title = "Types of Parser"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemPink.withAlphaComponent(0.4)
    }
    
    // MARK: - Table view data source & delegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonD.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath)
        cell.textLabel?.text = jsonD[indexPath.row].title
        cell.detailTextLabel?.text = jsonD[indexPath.row].detail
        cell.backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
        return cell
    }

}

//MARK: - JSON File parsing

extension TableViewController
{
    func jsonParser()
    {
        guard let jsonFilePath = bundle.path(forResource: "JSONData", ofType: "json"),
            let jsonData = fileManager.contents(atPath: jsonFilePath) else {return}
        do
        {
            // MARK: - WAY 1
//            let jsonInstance = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [[String: String]]
//
//            for item in jsonInstance
//            {
//                let jsonDataUnit = Entertainment(title: item["title"] ?? "title", detail: item["detail"] ?? "detail")
//                jsonD.append(jsonDataUnit)
//            }
            
            //MARK: - WAY 2
//            let jsonInstance = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [[String: String]]
//
//            for item in jsonInstance
//            {
//                let jsonDataUnit = Entertainment(item)
//                jsonD.append(jsonDataUnit)
//            }
            
            //MARK: - WAY 3
//            let jsonDataUnit = try jsonDecoder.decode(Entertainment.self, from: jsonData)
//            jsonD = [jsonDataUnit]
            
            //MARK: - WAY 4
            jsonD = try jsonDecoder.decode([Entertainment].self, from: jsonData)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
