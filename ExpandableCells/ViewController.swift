//
//  ViewController.swift
//  ExpandableCells
//
//  Created by Matti on 17/12/2019.
//  Copyright © 2019 Matti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedRow: IndexPath = IndexPath(row: -1, section: 0)
    var isExpanded = false

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(registrableClass: ExpandableCell.self)
        myTableView.register(registrableClass: ClassCell.self)

        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            return
        case 1:
            guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
                else { return }

                UIView.animate(withDuration: 0.3, animations: {
                    tableView.beginUpdates()
                    cell.isExpanded = !cell.isExpanded
                    tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.top, animated: true)
                    tableView.endUpdates()
                })
        default:
            return
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ClassCell.reusableID, for: indexPath) as? ClassCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.reusableID, for: indexPath) as? ExpandableCell else {
                return UITableViewCell()
            }
            cell.isExpanded = false
            return cell

        default:
            return UITableViewCell()
        }
    }
}

