//
//  ViewController.swift
//  JustoTest
//
//  Created by Alan Eduardo Benavides Lira on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Constants
    let GENDER_MALE = "male"
    let MALE_TEXT_COLOR = UIColor(rgb: 0xE87A7A)
    let FEMALE_TEXT_COLOR = UIColor(rgb: 0x36D6E8)
    let HEADER_CORNER_RADIUS: CGFloat = 15
    let HEADER_BORDER_WIDTH: CGFloat = 1
    let HEADER_BORDER_COLOR = 0x5E5E5E
    let HEADER_SHADOW_COLOR = 0x272727
    let HEADER_SHADOW_OPACITY: Float = 1
    let HEADER_SHADOW_RADIUS: CGFloat = 10
    let ACTIVITY_INDICATOR_COLOR = 0x21A019
    let ERROR_TITLE = "Error"
    let ALERT_TITLE_BUTTON = "OK"
    let AGE_MESSAGE = "years old"
    
    // MARK: - Oulets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var photoBackgroundView: UIView!
    @IBOutlet weak var userDataStack: UIStackView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    // MARK: - Vars
    let apiClient = ApiClient()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        getUserData()
    }
    
    // MARK: - Actions
    @IBAction func reloadAction(_ sender: Any) {
        getUserData()
    }
    
    // MARK: - Functions
    func setupViews() {
        userDataStack.isHidden = true
        headerView.layer.cornerRadius = HEADER_CORNER_RADIUS
        headerView.layer.borderWidth = HEADER_BORDER_WIDTH
        headerView.layer.borderColor = UIColor(rgb: HEADER_BORDER_COLOR).cgColor
        headerView.layer.shadowColor = UIColor(rgb: HEADER_SHADOW_COLOR).cgColor
        headerView.layer.shadowOpacity = HEADER_SHADOW_OPACITY
        headerView.layer.shadowOffset = .zero
        headerView.layer.shadowRadius = HEADER_SHADOW_RADIUS
        photoBackgroundView.layer.cornerRadius = photoBackgroundView.bounds.height / 2
        photoBackgroundView.layer.masksToBounds = true
        activitiIndicator.style = .large
        activitiIndicator.color = UIColor(rgb: ACTIVITY_INDICATOR_COLOR)
        activitiIndicator.hidesWhenStopped = true
    }
    
    func getUserData() {
        startLoading()
        apiClient.getUser(from: .randomUser) { (user, error) in
            if let user = user {
                DispatchQueue.main.async {
                    self.fillData(with: user)
                }
            } else if let error = error {
                let alert = UIAlertController(
                    title: self.ERROR_TITLE,
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                let okAction = UIAlertAction(
                    title: self.ALERT_TITLE_BUTTON,
                    style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    func fillData(with user: UserModel) {
        userDataStack.isHidden = false
        headerView.backgroundColor = .random()
        let currentColor = user.gender == GENDER_MALE ? FEMALE_TEXT_COLOR : MALE_TEXT_COLOR
        userImage.getImage(from: user.largePicture)
        nameLbl.text = user.fullName()
        nameLbl.textColor = currentColor
        emailLabel.text = user.email
        emailLabel.textColor = currentColor
        ageLabel.text = "\(user.age) \(AGE_MESSAGE)"
        ageLabel.textColor = currentColor
        addressLabel.text = user.shortAddress()
        addressLabel.textColor = currentColor
        phoneLabel.text = user.phone
        phoneLabel.textColor = currentColor
        finishLoading()
    }
    
    func startLoading() {
        activitiIndicator.startAnimating()
    }
    
    func finishLoading() {
        activitiIndicator.stopAnimating()
    }
 
}

