
import UIKit

class NewTeamViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension NewTeamViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
