//
//  EmployeeCell.swift
//  TalkSpace
//
//  Created by Sam on 11/8/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Stevia

class EmployeeCell: UITableViewCell {

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

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        sv([nameLabel, positionLabel])
        nameLabel.left(10).width(60%).height(40).centerVertically()

        positionLabel.right(10).height(40).centerVertically()
        positionLabel.Left == nameLabel.Right
    }

    func set(employee: Employee) {
        nameLabel.text = employee.name
        positionLabel.text = employee.position
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    static func reuseIdentifier() -> String {
        return "EmployeeCell"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
