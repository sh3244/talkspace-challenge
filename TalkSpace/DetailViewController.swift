//
//  DetailViewController.swift
//  TalkSpace
//
//  Created by Sam on 11/8/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

class DetailViewController: UIViewController {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.sv(nameLabel)
        nameLabel.centerHorizontally()
        nameLabel.centerVertically(-20)

        view.sv(positionLabel)
        positionLabel.centerHorizontally()
        positionLabel.centerVertically(40)
    }

    func set(employee: Employee) {
        nameLabel.text = employee.name
        positionLabel.text = employee.position
    }
}
