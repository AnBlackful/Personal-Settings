import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in genderPicker: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ genderPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArray.count
    }
    func pickerView(_ genderPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.genderArray[row]
    }
    func pickerView(_ genderPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderTextField.text = genderArray[row]
    }
    
    let genderArray = ["female", "male"]

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var setGenderButton: UIButton!
    
    @IBOutlet weak var birthdayView: UIView!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var setBithdayButton: UIButton!
    
    
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var birthdayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setProperty()
    }
    
    @IBAction func beginEditingName(_ sender: UITextField) {
        self.birthdayView.isHidden = true
        self.genderView.isHidden = true
        self.nicknameTextField.resignFirstResponder()
    }
    @IBAction func beginEditingNickname(_ sender: UITextField) {
        self.birthdayView.isHidden = true
        self.genderView.isHidden = true
        self.nameTextField.resignFirstResponder()
    }
    
    @IBAction func genderButtonPressed(_ sender: UIButton) {
        self.closeAll()
        self.genderView.isHidden = false
    }
    @IBAction func birthdayButtonPressed(_ sender: UIButton) {
        self.closeAll()
        self.birthdayView.isHidden = false
    }
    @IBAction func birthdayValueChanged(_ sender: UIDatePicker) {
        let selectedDate = DateManager.shared.stringFromDate(date: sender.date)
        self.birthdayTextField.text = selectedDate
    }
    @IBAction func closeBirthdayView(_ sender: UIButton) {
        self.birthdayView.isHidden = true
    }
    @IBAction func setGenderButtonPressed(_ sender: UIButton) {
        self.genderView.isHidden = true
    }
    
    
    func setProperty(){
        //self.genderView.isHidden = true
        self.genderTextField.text = genderArray[0]
        self.genderButton.frame.origin.x = self.genderTextField.frame.origin.x
        self.genderButton.frame.origin.y = self.genderTextField.frame.origin.y
        self.genderButton.frame.size.width = self.genderTextField.frame.width
        self.genderButton.frame.size.height = self.genderTextField.frame.height
        self.genderTextField.layer.zPosition = 0
        self.genderButton.layer.zPosition = 1
        self.birthdayButton.frame.origin.x = self.birthdayTextField.frame.origin.x
        self.birthdayButton.frame.origin.y = self.birthdayTextField.frame.origin.y
        self.birthdayButton.frame.size.width = self.birthdayTextField.frame.width
        self.birthdayButton.frame.size.height = self.birthdayTextField.frame.height
        self.birthdayTextField.layer.zPosition = 0
        self.birthdayButton.layer.zPosition = 1
        self.birthdayPicker.maximumDate = Date()
    }
    
    func closeAll(){
        self.genderView.isHidden = true
        self.birthdayView.isHidden = true
        self.nicknameTextField.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
    }
    
}

