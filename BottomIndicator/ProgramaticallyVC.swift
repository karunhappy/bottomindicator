//
//  ProgramaticallyVC.swift
//  BottomIndicator
//
//  Created by Karun Aggarwal on 07/02/20.
//  Copyright © 2020 Karun Aggarwal. All rights reserved.
//

import UIKit

class ProgramaticallyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Programatically"
        
        let size = UIScreen.main.bounds
        let indicator = IndicatorView(frame: CGRect(x: 10, y: 100, width: size.width - 20, height: 20))
        view.addSubview(indicator)
        indicator.updateView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
