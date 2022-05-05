
import UIKit

class GameInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableTeams: UITableView!
    @IBOutlet weak var nextTeamToPlay: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var dataTeam = [
        GameTeam(teamName: "❤️ Lovers", teamPoint: "0"),
        GameTeam(teamName: "💀 DeathEaters", teamPoint: "0"),
        GameTeam(teamName: "🤖 Robots", teamPoint: "0"),
        GameTeam(teamName: "🧔🏻‍♂️ Mans", teamPoint: "0"),
        GameTeam(teamName: "👯‍♀️ Womens", teamPoint: "0")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTeams.delegate = self
        tableTeams.dataSource = self
        playButton.layer.cornerRadius = 25
        tableTeams.separatorStyle = .none
        tableTeams.showsVerticalScrollIndicator = false
        
    }
    
    @IBAction func previousPageButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
    }
    
    func numberOfSections(in tableTeams: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableTeams: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTeam.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableTeams: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableTeams.dequeueReusableCell(withIdentifier: "gameInfoCell", for: indexPath) as! GameInfoTableViewCell
        let teamCell = dataTeam[indexPath.row]
        cell.set(teamCell: teamCell)
        cell.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        //        return .insert
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            dataTeam.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
