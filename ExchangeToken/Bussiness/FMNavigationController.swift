//
//  FMNavigationController.swift
//  Tocos
//
//  Created by luan on 2018/11/1.
//  Copyright © 2018 luan. All rights reserved.
//

import UIKit

class FMNavigationController: UINavigationController {
    
    let controllerNameArray = ["", "", "", "",""]
    var lineImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationBar.isTranslucent = false
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.delegate = self
            delegate = self
        }
    }
    
    func getLineImageView() -> UIImageView? {
        if lineImageView == nil {
            lineImageView = findHairlineImageViewUnder(view: navigationBar)
        }
        return lineImageView
    }
    
    func findHairlineImageViewUnder(view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.classForCoder()), view.bounds.size.height <= 1.0 {
            return view as? UIImageView
        }
        for subview in view.subviews {
            let imageView = findHairlineImageViewUnder(view: subview)
            if (imageView != nil) {
                return imageView
            }
        }
        return nil
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        if controllerNameArray.contains(String(describing: viewController.classForCoder)) == false {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        if viewControllers.first != viewController {
            checkItem(viewController)
        }
    }
    
    func checkItem(_ viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(imageLiteralResourceName: "backdcopy").imageWithTintColor(color: AppTheme.shared.secondColor!).withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(backSuperiorController))
    }
    
    @objc func backSuperiorController() {
        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = false
        }
        popViewController(animated: true)
    }
}

extension FMNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            interactivePopGestureRecognizer?.isEnabled = self.viewControllers.count > 1
        }
    }
}

extension FMNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
