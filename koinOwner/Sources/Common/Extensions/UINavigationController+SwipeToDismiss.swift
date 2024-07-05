//
//  UINavigationController+SwipeToDismiss.swift
//  koinOwner
//
//  Created by 정영준 on 7/6/24.
//

import SwiftUI

// Swipe to dismiss 기능 활성화.
extension UINavigationController: UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
