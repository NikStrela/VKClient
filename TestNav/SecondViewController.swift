
//
//  SecondViewController.swift
//  TestNav
//
//  Created by Максим Разумов on 05.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class SecondViewController: UIViewController {
    
    let upCounterButton = UIButton()
    private var counterLabel = UILabel()
    private var currentCount: Int = 0
    
    var delegate: CountDelegate?
    var titleLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        setUpView()
        view.backgroundColor = .orange
        title = "SecondView"
        upCounterButton.setTitle("CounterUp", for: .normal)
        upCounterButton.addTarget(self, action: #selector(upCount), for: .touchUpInside)
        counterLabel.text = "\(currentCount)"
        counterLabel.textAlignment = .center
        
    }
    
    init(counter: Int) {
        super.init(nibName: nil, bundle: nil)
        self.currentCount = counter
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.returnCount(count: currentCount)
    }
    
    func setUpView() {
        view.addSubview(upCounterButton)
        view.addSubview(counterLabel)
        upCounterButton.easy.layout(Top(30), Leading(), Trailing())
        counterLabel.easy.layout(Top(40).to(upCounterButton,.bottom), Leading(), Trailing())
    }
    
    @objc func upCount() {
        
        currentCount += 1
        counterLabel.text = "\(currentCount)"
    }
}
