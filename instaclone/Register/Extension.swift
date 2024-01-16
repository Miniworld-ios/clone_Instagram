//
//  Extension.swift
//  instaclone
//
//  Created by 심정민 on 2023/02/07.
//

import UIKit

// 버튼 글씨
extension UIViewController {
    func generateButtonAttributes(_ button: UIButton,
                                  texts: String...,
                                  fonts: UIFont...,
                                  colors: UIColor...) -> NSMutableAttributedString {
        guard let wholeText = button.titleLabel?.text else { fatalError("error")}
        
        let customFonts: [UIFont] = fonts
        
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])}
        
        let customColors = colors
        
        let attributesString = NSMutableAttributedString(string: wholeText)
        
        texts.indices.forEach { index in
            attributesString.addAttribute(.font,
                                           value: customFonts[index],
                                           range: customTextsRanges[index])
            attributesString.addAttribute(.foregroundColor,
                                           value: customColors[index],
                                           range: customTextsRanges[index])
        }
        
        return attributesString
        
        
    }
}
