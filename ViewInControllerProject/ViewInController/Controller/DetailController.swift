//
//  DetailController.swift
//  ControllerTest0503
//
//  Created by 김우성 on 2021/05/03.
//

import UIKit

class DetailController: UIViewController {
    
    // MARK: - Properties
    
    private let testButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TEST BUTTON", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClickedAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    // MARK: - Actions
    
    @objc
    func handleButtonClickedAction() {
        
        print("DEBUG: 클릭하였습니다.")
        let vc = SecondViewController()
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        testButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        testButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
