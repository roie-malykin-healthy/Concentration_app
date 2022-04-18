//
//  CardTheme.swift
//  ConcentrationStoryboard
//
//  Created by Roie Malykin on 17/04/2022.
//

import Foundation

struct CardTheme{
        
    static var emojiRanges = [
            "faces":0x1F600...0x1F609,
            "gestures":0x1F645...0x1F64F,
            "vehicles":0x1F681...0x1F690,
            "animals":0x1F42A...0x1F435,
            "landsacpes":0x1F300...0x1F309,
            "stars":0x1F311...0x1F320
        ]
    
    static func getRandomTheme() -> [String]{
        let ThemeOptions = Array(emojiRanges.keys)
        let Theme = ThemeOptions.randomElement() ?? "faces"
        var EmojiChoices = [String]()
        for i in emojiRanges[Theme]!{
            let c = String(Unicode.Scalar(i)!)
            EmojiChoices.append(c)
        }
        return EmojiChoices
    }
    
    static func CreateNewTheme(Theme:String, range: ClosedRange<Int>) {
        self.emojiRanges[Theme] = range
    }
}
