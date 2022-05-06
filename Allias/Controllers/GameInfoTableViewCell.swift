
import UIKit

class GameInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 25
    }
    
    func set(teamCell: GameTeam) {
        self.teamNameLabel.text = teamCell.teamName
        self.pointsLabel.text = teamCell.teamPoint
    }
    
}
