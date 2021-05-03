//
//  ViewController.swift
//  ControllerTest0503
//
//  Created by 김우성 on 2021/05/03.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    
    // MARK: - Helpers
    
    func configureUI() {
        
        /* UI배치를 위한 코드 */
        let detailViewHeight = view.frame.height * 0.45
        view.addSubview(detailView)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.heightAnchor.constraint(equalToConstant: detailViewHeight).isActive = true
        detailView.widthAnchor.constraint(equalToConstant: detailViewHeight).isActive = true
        detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        /* View 내부에 Controller를 추가하는 코드 */
        // 1 View 안에 들어갈 Controller 인스턴스를 생성한다.
        let detailVC = DetailController()
        
        // 2 현재 컨트롤러(최상위 C)에 하위 컨트롤러로 추가한다.
        self.addChild(detailVC)
        
        // 3 하위 컨트롤러가 될 컨트롤러의 부모 컨트롤러를 현재(self) 컨트롤러로 지정한다.
        detailVC.didMove(toParent: self)
        
        // 4 원하는 View의 하위 View로 하위 컨트롤러의 View를 등록한다.
        detailView.addSubview(detailVC.view)
        
        // 5 크기를 동일하게한다. (원한다면 다르게해도됩니다.)
        detailVC.view.frame = detailView.bounds
    }
}

