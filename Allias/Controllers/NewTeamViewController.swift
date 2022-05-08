
import UIKit

class NewTeamViewController: UITableViewController {
    
    var singleShared = SingletonStruct.shared
    
    @IBOutlet weak var newTeam: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false
        newTeam.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
    func saveNewTeam() {
        if let new = newTeam.text {
            singleShared.teamArray.append(new)
            singleShared.teamDictionary[new] = 0
        }
    }
}
    
    extension NewTeamViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
        }
        
        @objc private func textFieldChanged() {
            if newTeam.text?.isEmpty == false {
                saveButton.isEnabled = true
            } else {
                saveButton.isEnabled = false
            }
        }
        
    }
