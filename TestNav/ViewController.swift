//
//  ViewController.swift
//  TestNav
//
//  Created by Максим Разумов on 05.09.2020.
//  Copyright © 2020 Максим Разумов. All rights reserved.
//

import UIKit
import EasyPeasy

class ViewController: UIViewController, CountDelegate {
    

    let upCounterButton = UIButton()
    private var counterLabel = UILabel()
    private var currentCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        edgesForExtendedLayout = []
        navigationController?.navigationBar.barTintColor = .yellow
        title = "FirstView"
        setUpView()
//        nextView.setTitle("NextView", for: .normal)
        upCounterButton.setTitle("Counter", for: .normal)
        counterLabel.text = "\(currentCount)"
        upCounterButton.addTarget(self, action: #selector(upCount(_:)), for: .touchUpInside)
        upCounterButton.tintColor = .yellow
        counterLabel.textAlignment = .center
        let nextView = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showNextView))
        navigationItem.rightBarButtonItem = nextView
        // Do any additional setup after loading the view.
    }

    func setUpView() {
            
            view.addSubview(upCounterButton)
            view.addSubview(counterLabel)
    //        view.addSubview(nextView)
            upCounterButton.easy.layout(Top(20),Leading(),Trailing())
            counterLabel.easy.layout(Top(100).to(upCounterButton,.bottom), Leading(), Trailing(), CenterX())
    //        nextView.easy.layout(Top(30).to(counterLabel,.bottom), Leading(),Trailing())
    }
    
    func returnCount(count: Int) -> String {
        
        currentCount = count
        counterLabel.text = "\(currentCount)"
        
        return "dfgdh"
    }

    @objc func upCount(_ sender: Any) {
        
        currentCount += 1
        counterLabel.text = "\(currentCount)"
    }
    

    @objc func showNextView(_ sender: Any) {
        let secondVC = SecondViewController(counter: currentCount)
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
//        show(SecondViewController(counter: currentCount), sender: self)
    }
    

}

