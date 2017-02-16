//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Victoria Zhou on 2/15/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forkCountLabel: UILabel!
    
    var githubRepo: GithubRepo! {
        didSet{
            nameLabel.text = githubRepo.name!
            ownerLabel.text = githubRepo.ownerHandle!
            let avatarURL = URL(string: githubRepo.ownerAvatarURL!)
            avatarImageView.setImageWith(avatarURL!)
            descriptionLabel.text = githubRepo.repoDescription
            starsImageView.image = UIImage(named: "star")
            forkImageView.image = UIImage(named: "fork")
            starsCountLabel.text = "\(githubRepo.stars!)"
            forkCountLabel.text = "\(githubRepo.forks!)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
