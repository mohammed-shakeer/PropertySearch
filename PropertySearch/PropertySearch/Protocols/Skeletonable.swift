//
//  Skeletonable.swift
//  PropertySearch
//
//  Created by Mohammed Shakeer on 17/10/2020.
//  Copyright © 2020 PF. All rights reserved.
//

import UIKit

protocol Skeletonable: UIView {

    /// color of the skeleton layer
    var skeletonColor: UIColor { get }

    /// array of UIView to be shown as skeleton
    var skeletonFields: [UIView?] { get }
}

extension Skeletonable {

    var skeletonColor: UIColor {
        return UIColor.systemGray6
    }

    /// shows skeleton layer
    func showSkeleton() {
        for view in getAllSubviews() {
            if skeletonFields.contains(view) {
                view.backgroundColor = skeletonColor
                if view is UILabel {
                    (view as? UILabel)?.text = " "
                } else if view is UIImageView {
                    (view as? UIImageView)?.image = nil
                    (view as? UIImageView)?.removeAllSubviews()
                }
            }
        }
    }

    /// hides skeleton layer
    func hideSkeleton() {
        for view in getAllSubviews() {
            if skeletonFields.contains(view) {
                view.backgroundColor = .clear
            }
        }
    }
}
