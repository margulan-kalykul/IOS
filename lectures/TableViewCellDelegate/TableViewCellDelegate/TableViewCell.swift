//
//  TableViewCell.swift
//  TableViewCellDelegate
//
//  Created by Arman Myrzakanurov on 27.11.2024.
//

import UIKit

protocol TableViewCellDelegate {
    func onButtonDidTap(index: String)
}

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    private var stringIndex: String = ""

    var delegate: TableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(text: String) {
        titleLabel.text = text
        stringIndex = text
    }

    @IBAction private func nextButtonDidTap(_ sender: UIButton) {
        delegate?.onButtonDidTap(index: stringIndex)
    }

}
