//
//  PersonTableViewCell.swift
//  searchStarWars-practice
//
//  Created by Dongwoo Pae on 6/6/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    //MARK -Properties and outlets
    var person: Person? {
        didSet {
            self.updateViews()
        }
    }
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var firstYearLabel: UILabel!
    
    
    //MARK: - Methods
    private func updateViews() {
        guard let person = person else {return}
        self.nameLabel.text = person.name
        self.genderLabel.text = "Gender: \(person.gender)"
        self.firstYearLabel.text = "birth year: \(person.birthYear)"
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }

}
