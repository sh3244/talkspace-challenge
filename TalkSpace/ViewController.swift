//
//  ViewController.swift
//  TalkSpace
//
//  Created by Sam on 11/8/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

@objc enum SortType: Int {
    case normal, backwards, initial

    static func next(type: SortType) -> SortType {
        switch type {
        case .normal:
            return .backwards
        case .backwards:
            return .initial
        case .initial:
            return .normal
        }
    }
}

class ViewController: UIViewController {

    let sampleEmployees: [Employee] = [
        Employee(name: "John", position: "Engineer"),
        Employee(name: "Madison", position: "Manager"),
        Employee(name: "Benjamin", position: "Director")
    ]

    var sortedEmployees: [Employee] = []
    var sortType: SortType = .normal

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.reuseIdentifier())
        return table
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Sort", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employees"

        view.sv(tableView)
        tableView.fillHorizontally().top(0)

        view.sv(button)
        button.Top == tableView.Bottom
        button.Bottom == view.safeAreaLayoutGuide.Bottom
        button.fillHorizontally()
        button.height(50)

        sortedEmployees = sampleEmployees
        tableView.reloadData()
    }

    @objc func buttonTapped() {
        sort(type: SortType.next(type: sortType), completion: { [weak self] in
            if let sortType = self?.sortType {
                self?.sortType = SortType.next(type: sortType)
            }
            self?.tableView.reloadData()
        })
    }

    func sort(type: SortType, completion: @escaping (() -> Void)) {
        DispatchQueue.global().async {
            switch type {
            case .normal:
                self.sortedEmployees = self.sampleEmployees.sorted(by: { (left, right) -> Bool in
                    left.name < right.name
                })
            case .backwards:
                self.sortedEmployees = self.sampleEmployees.sorted(by: { (left, right) -> Bool in
                    left.name > right.name
                })
            case .initial:
                self.sortedEmployees = self.sampleEmployees
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = sortedEmployees[indexPath.row]
        let detailVC = DetailViewController(nibName: nil, bundle: nil)
        detailVC.set(employee: employee)
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let employee = sortedEmployees[indexPath.row]
        guard let employeeCell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.reuseIdentifier(), for: indexPath) as? EmployeeCell else {
            return EmployeeCell()
        }
        employeeCell.set(employee: employee)
        return employeeCell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedEmployees.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
