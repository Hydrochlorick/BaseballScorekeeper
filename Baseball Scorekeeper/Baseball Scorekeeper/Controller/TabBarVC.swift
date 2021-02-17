//
//  TabBarVC.swift
//  Baseball Scorekeeper
//
//  Created by Rick Jacobson on 2/14/21.
//

import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .blue
        self.tabBar.barTintColor = .black
        self.tabBar.unselectedItemTintColor = .darkGray
        setupViewControllers()
        // Do any additional setup after loading the view.
    }
    
//    func setupTabBarIcons(){
//        
//    }
    
    func setupViewControllers(){
        
        let gameView = GameViewVC()
        let gameNavController = UINavigationController(rootViewController: gameView)
        gameView.tabBarItem = UITabBarItem(title: "Game", image: UIImage(systemName: "house"), tag: 0)
        
        let recordView = RecordTableVC()
        let recordNavController = UINavigationController(rootViewController: recordView)
        recordView.tabBarItem = UITabBarItem(title: "Record", image: UIImage(systemName: "list.bullet"), tag: 1)
        
        viewControllers = [gameNavController, recordNavController]
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
