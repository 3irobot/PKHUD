//
//  HUD.swift
//  PKHUD
//
//  Created by Eugene Tartakovsky on 29/01/16.
//  Copyright © 2016 Eugene Tartakovsky, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

public enum HUDContentType {
    case success
    case error
    case progress
    case image(UIImage?)
    case rotatingImage(UIImage?)

    case labeledSuccess(title: String?, subtitle: String?)
    case labeledError(title: String?, subtitle: String?)
    case labeledProgress(title: String?, subtitle: String?)
    case labeledImage(image: UIImage?, title: String?, subtitle: String?)
    case labeledRotatingImage(image: UIImage?, title: String?, subtitle: String?)

    case label(String?)
    case systemActivity
}

public final class HUD {

    // MARK: Properties
    public static var dimsBackground: Bool {
        get { return PKHUD.sharedHUD.dimsBackground }
        set { PKHUD.sharedHUD.dimsBackground = newValue }
    }

    public static var allowsInteraction: Bool {
        get { return PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled  }
        set { PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = newValue }
    }

    public static var isVisible: Bool { return PKHUD.sharedHUD.isVisible }

    // MARK: Public methods, PKHUD based
    public static func show(_ content: HUDContentType, onView view: UIView? = nil) {
        PKHUD.sharedHUD.contentView = contentView(content)
        PKHUD.sharedHUD.show(onView: view)
    }

    public static func hide(_ completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: false, completion: completion)
    }

    public static func hide(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: animated, completion: completion)
    }

    public static func hide(afterDelay delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }

    // MARK: Public methods, HUD based
    public static func flash(_ content: HUDContentType, onView view: UIView? = nil) {
        HUD.show(content, onView: view)
        HUD.hide(animated: true, completion: nil)
    }

    public static func flash(_ content: HUDContentType, onView view: UIView? = nil, delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        HUD.show(content, onView: view)
        HUD.hide(afterDelay: delay, completion: completion)
    }
    
    public static var font : UIFont = UIFont.boldSystemFont(ofSize: 14.0)
    public static var textColor : UIColor = UIColor.black

    // MARK: Private methods
    fileprivate static func contentView(_ content: HUDContentType) -> UIView {
        switch content {
        case .success:
            let view = PKHUDSuccessView()
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case .error:
            let view = PKHUDErrorView()
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case .progress:
            let view = PKHUDProgressView()
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .image(image):
            let view = PKHUDSquareBaseView(image: image)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .rotatingImage(image):
            let view =  PKHUDRotatingImageView(image: image)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .labeledSuccess(title, subtitle):
            let view =  PKHUDSuccessView(title: title, subtitle: subtitle)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .labeledError(title, subtitle):
            let view =  PKHUDErrorView(title: title, subtitle: subtitle)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .labeledProgress(title, subtitle):
            let view =  PKHUDProgressView(title: title, subtitle: subtitle)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .labeledImage(image, title, subtitle):
            let view =  PKHUDSquareBaseView(image: image, title: title, subtitle: subtitle)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .labeledRotatingImage(image, title, subtitle):
            let view =  PKHUDRotatingImageView(image: image, title: title, subtitle: subtitle)
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        case let .label(text):
            let view =  PKHUDTextView(text: text)
            view.titleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            return view
        case .systemActivity:
            let view =  PKHUDSystemActivityIndicatorView()
            view.titleLabel.font = self.font
            view.subtitleLabel.font = self.font
            view.titleLabel.textColor = self.textColor
            view.subtitleLabel.textColor = self.textColor
            return view
        }
    }
}
