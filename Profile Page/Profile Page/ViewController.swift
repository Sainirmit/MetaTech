//
//  ViewController.swift
//  Profile Page
//
//  Created by Prabal Kumar on 22/04/24.
//

import UIKit

struct Section {
    let title : String
    let options :  [SettingsOption]
   
}

struct SettingsOption {
    let title : String
    let iconBackgroundColor: UIColor
    let handler : (() -> Void)
    let icon : UIImage?
}


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Profile"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure(){
        models.append(Section(title: "General", options: [
            SettingsOption(title: "Privacy", iconBackgroundColor: .systemPink, handler: {
                print("Privacy button pressed")
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Address", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house"))
            ]))
        
        models.append(Section(title: "Information", options: [
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house"))
            ]))
        
        models.append(Section(title: "Apps", options: [
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house")),
            
            SettingsOption(title: "Wifi", iconBackgroundColor: .systemPink, handler: {
                
            }, icon: UIImage(systemName: "house"))
        
        ]))
        
        
        
    } //models data end here
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath
        ) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
    }


}

