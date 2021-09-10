//
//  ViewController.swift
//  Avito
//
//  Created by macbookp on 09.09.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let avitoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avito")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let tableView = UITableView()
    let apiManager = ApiManager.shared
    var employees: [Employee] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutImageView()
        layoutTableView()
        configureTableView()
        getDataFromApiManager()
    }

    func layoutImageView() {
        view.addSubview(avitoImageView)
        avitoImageView.snp.makeConstraints { maker in
            maker.top.equalTo(view.layoutMarginsGuide.snp.top)
            maker.leading.equalToSuperview().inset(20)
            maker.height.equalTo(70)
            maker.width.equalTo(140)
        }
    }

    func layoutTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(20)
            maker.top.equalTo(avitoImageView.snp.bottom).inset(-10)
            maker.bottom.equalToSuperview()
        }
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func getDataFromApiManager() {
        apiManager.fetchData { [weak self] avito in
            guard let self = self else { return }
            self.employees = avito.company.employees.sorted { $0.name < $1.name }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    //MARK: - TableViewDelegate & TableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeTableViewCell
        cell.configure(employee: employees[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

