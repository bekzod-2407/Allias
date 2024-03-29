
import UIKit

class GameInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableTeams: UITableView!
    @IBOutlet weak var nextTeamToPlay: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    let singleShared = SingletonStruct.shared
    
        override func viewDidLoad() {
            super.viewDidLoad()
            playButton.isEnabled = false
            countIsOk()
            tableTeams.delegate = self
            tableTeams.dataSource = self
            
            tableTeamCustomization()
        }
        
        func countIsOk() {
            print(singleShared.teamArray.count)
            if singleShared.teamArray.count < 2 || singleShared.teamArray.count > 5 {
                
                playButton.isEnabled = false
            } else {
                playButton.isEnabled = true
            }
        }
        
        @IBAction func previousPageButtonPressed(_ sender: UIButton) {
            presentVC(identifierOfVC: "MainStoryboard")
        }
        
        @IBAction func playButtonPressed(_ sender: UIButton) {
            presentVC(identifierOfVC: "GameStoryboard")
        }
        
        func tableView(_ tableTeams: UITableView, numberOfRowsInSection section: Int) -> Int {
            return singleShared.teamArray.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        
        func tableView(_ tableTeams: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableTeams.dequeueReusableCell(withIdentifier: "gameInfoCell", for: indexPath) as! GameInfoTableViewCell
            let teamCell = singleShared.teamArray[indexPath.row]
            cell.teamNameLabel.text = teamCell
            if let pointTeam = singleShared.teamDictionary[teamCell] {
                cell.pointsLabel.text = String(pointTeam)
                
            }
            cell.layer.backgroundColor = UIColor.clear.cgColor
            nextTeamToPlay.text = "Team \(singleShared.teamArray[singleShared.activCommandIdx])\n would play next!"
            return cell
        }
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                tableView.beginUpdates()
                
                singleShared.teamArray.remove(at: indexPath.row)
                
                singleShared.teamDictionary.removeValue(forKey: singleShared.teamArray[indexPath.row])
                singleShared.teamArray.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
                countIsOk()
            }
        }
        func tableTeamCustomization(){
            playButton.layer.cornerRadius = 25
            tableTeams.separatorStyle = .none
            tableTeams.showsVerticalScrollIndicator = false
        }
        
        
        //Перемещение по экранам
        func presentVC(identifierOfVC: String){
            let main = UIStoryboard(name: "Main", bundle: nil)
            let destination = main.instantiateViewController(withIdentifier: identifierOfVC)
            destination.modalPresentationStyle = .fullScreen
            destination.modalTransitionStyle = .crossDissolve
            self.present(destination, animated: true, completion: nil)
            
        }
        
        @IBAction func unwindSegue(_segue: UIStoryboardSegue) {
            guard let newTeamVC = _segue.source as? NewTeamViewController else {return}
            newTeamVC.saveNewTeam()
            tableTeams.reloadData()
            countIsOk()
        }
        
    }
