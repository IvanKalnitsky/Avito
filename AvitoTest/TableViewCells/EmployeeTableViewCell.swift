//
//  EmpoyeeTableViewCell.swift
//  Avito
//
//  Created by macbookp on 10.09.2021.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    let employeeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .gray
        view.alpha = 0.1
        return view
    }()

    func layoutViews() {
        contentView.addSubview(backView)
        backView.snp.makeConstraints { maker in
            maker.leading.trailing.top.equalToSuperview()
            maker.bottom.equalToSuperview().inset(20)
        }
        contentView.addSubview(employeeLabel)
        employeeLabel.snp.makeConstraints { maker in
            maker.top.trailing.equalToSuperview()
            maker.leading.equalToSuperview().inset(20)
            maker.bottom.equalToSuperview().inset(20)
        }
    }

    func configure(employee: Employee) {
        layoutViews()
        let name = employee.name
        let phone = employee.phoneNumber
        let skills = employee.skills.joined(separator: ", ")
        employeeLabel.text = "Name: \(name) \nSkills: \(skills) \nPhone number: \(phone)"
    }

}
