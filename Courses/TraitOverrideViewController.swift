//
//  TraitOverrideViewController.swift
//  KhromaPal
//
//  Created by Joan Coyne on 12/10/14.
//  Copyright (c) 2014 RayWenderlich. All rights reserved.
//

import UIKit

class TraitOverrideViewController: UIViewController {
    
    override func viewWillTransitionToSize(size: CGSize,
          withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
            var traitOverride: UITraitCollection? = nil
            if size.width > 414 {
                traitOverride = UITraitCollection(horizontalSizeClass:.Regular)
            }
            setOverrideTraitCollection(traitOverride,
                 forChildViewController: childViewControllers[0] as UIViewController)
            super.viewWillTransitionToSize(size,withTransitionCoordinator: coordinator)
    }
}