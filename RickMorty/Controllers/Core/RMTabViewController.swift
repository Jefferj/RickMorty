//
//  ViewController.swift
//  RickMorty
//
//  Created by Jefferson Naranjo rodríguez on 11/01/23.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }
    private func setUpTabs(){
        let charactersVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingVC = RMSettingViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navOne = UINavigationController(rootViewController: charactersVC)
        let navTwo = UINavigationController(rootViewController: locationVC)
        let navThree = UINavigationController(rootViewController: episodeVC)
        let navFour = UINavigationController(rootViewController: settingVC)
        
        navOne.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 1)
        navTwo.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 2)
        navThree.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navFour.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 4)
        
        for nav in [navOne, navTwo, navThree, navFour] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [navOne, navTwo, navThree, navFour], animated: true)
    }
}

