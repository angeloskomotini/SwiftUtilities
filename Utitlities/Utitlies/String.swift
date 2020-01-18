//
//  String.swift
//  Utitlities
//
//  Created by Angelos Staboulis on 18/1/20.
//  Copyright © 2020 Angelos Staboulis. All rights reserved.
//

import Foundation

extension String{
    func substring(text:String,start:Int,end:Int)->Substring{
        let characters =  text.dropLast(text.count - end)
        let string = text[characters.startIndex...characters.endIndex]
        return string
    }
    func left(text:String,start:Int)->Substring{
        let characters =  text.dropLast(text.count - start)
        let string = text[characters.startIndex...characters.endIndex]
        return string
    }
    func right(text:String,start:Int)->Substring{
        let characters =  text.dropFirst(text.count - start)
        let string = text[characters.startIndex..<characters.endIndex]
        return string
    }
    func toCharArray()->[Character]{
        var characters=[Character]()
        var characterOutside = self.makeIterator()
        for _ in 0..<self.count{
            characters.append(characterOutside.next()!)
        }
        return characters
    }
    func findCharacter(character:Character)->Bool{
        let characters = self.toCharArray()
        var found:Bool!=false
        for characterOut in 0..<self.toCharArray().count{
            if(characters[characterOut]==character){
                found=true
            }
            
        }
        return found
    }
    func checkOccurences()->Bool{
        let characters = self.toCharArray()
        var characterOut:Int!=0
        var characterIn:Int!=1
        var found:Bool!=false
        while(characterOut < characters.count){
            let firstLetter = characters[characterOut]
            while(characterIn<characters.count){
                let nextLetter = characters[characterIn]
                if(firstLetter == nextLetter){
                    found=true
                }
                characterIn = characterIn + 1
            }
            characterOut = characterOut + 1
        }
        return found
    }
    func evaluateString()->Any{
        let expression = NSExpression(format: self, argumentArray: [])
        let result = expression.expressionValue(with: nil, context: nil)
        return result ?? "0"
    }
}
