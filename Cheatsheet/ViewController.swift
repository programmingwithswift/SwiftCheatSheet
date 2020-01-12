//
//  ViewController.swift
//  Cheatsheet
//
//  Created by ProgrammingWithSwift on 2020/01/09.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.run()
        // Do any additional setup after loading the view.
    }
    
    private func run() {
        
        // 1. Get length of string
        let stringForLength = "string for length"
        let lengthOfString = stringForLength.count
//        print(lengthOfString)
        
        // 2. Split string into array
        let stringToSplit = "string to split"
        let splitString = stringToSplit.components(separatedBy: " ")
        let splitToCharacters = Array(stringToSplit)
//        print(splitString)
//        print(splitToCharacters)
        
        // 3. Enumerate Enum
        enum EnumerateEnum: CaseIterable {
            case one
            case two
            case three
            case four
        }
        
//        for enumCase in EnumerateEnum.allCases {
//            print(enumCase)
//        }
        
        // 4. Convert Int to String
        let intToStringValue = 15
        let stringOfIntValue = String(intToStringValue)
//        print(stringOfIntValue)
        
        // 5. Convert String to Int
        let stringToIntValue = "10"
        let intOfStringValue = Int(stringToIntValue)
//        print(intOfStringValue)
        
        // 6. Sort object array by value
        let pointArray = [CGPoint(x: 10, y: 10),
                          CGPoint(x: 20, y: 10),
                          CGPoint(x: 30, y: 10),
                          CGPoint(x: 40, y: 10)]
        let sortedArray = pointArray.sorted(by: { $0.x > $1.x })
//        print(sortedArray)
        
        // Sort Dictionary by value
        let dictionary = [
            "One" : CGPoint(x: 10, y: 10),
            "Two" : CGPoint(x: 20, y: 10),
            "Three" : CGPoint(x: 30, y: 10),
            "Four" : CGPoint(x: 40, y: 10),
        ]
        let sortedDictionary = dictionary.sorted { $0.1.x > $1.1.x }
        
//        let sortedDictionary = dictionary.sorted { firstElement, secondElement in
//            return firstElement.value.x > secondElement.value.x
//        }
        
//        print(sortedDictionary)
        
        
        // Sort dictionary by key
        let dictionaryToSortByKey = [
            "One" : CGPoint(x: 10, y: 10),
            "Two" : CGPoint(x: 20, y: 10),
            "Three" : CGPoint(x: 30, y: 10),
            "Four" : CGPoint(x: 40, y: 10),
        ]
        
        let keySortedDictionary = dictionaryToSortByKey.sorted { $0.0 > $1.0 }
//        print(keySortedDictionary)
        
        // Check if array contains elements
        let arrayOfElements = [1, 2, 3, 4, 5]
        let elementToContain = 2
        
//        if arrayOfElements.contains(elementToContain) {
//            print("Yes, the array contains this element")
//        }
        
        // Replace characters in string
        let stringToReplaceCharacters = "test string"
        let replacedCharacterString = stringToReplaceCharacters.replacingOccurrences(of: "t", with: "+")
//        print(replacedCharacterString)
        
        let endIndex = stringToReplaceCharacters.index(stringToReplaceCharacters.startIndex, offsetBy: 3)
        let range = stringToReplaceCharacters.startIndex...endIndex
        let replaceInRange = stringToReplaceCharacters.replacingCharacters(in: range, with: "-")
        
//        print(replaceInRange)
        
        // Generate a random number
        let randomNumber = Int(arc4random_uniform(100))
//        print(randomNumber)
        
        // Add observer for notification
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notifcationObserverFunction),
                                               name: NSNotification.Name("myNotificationName"),
                                               object: nil)
        
        // Merge/Concatenate arrays
        let arrayOne = [1, 2, 3, 4]
        let arrayTwo = [5, 6, 7, 8]

        let mergedArray = arrayOne + arrayTwo
//        print(mergedArray)
        
        // Close keyboard
        let textField = UITextField()
        textField.resignFirstResponder()
        
        self.view.endEditing(true)
        
        // Get reference to AppDelegate
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        // Round decimal to x places
        let doubleValue = 1.011201
        let roundedToThreePlaces = (doubleValue * 1000).rounded() / 1000
//        print(roundedToThreePlaces)
        
        // Determine current device model
        let deviceModel = UIDevice.current.name
//        print(deviceModel)
        
        // Add element to array
        var baseArray = [1, 2, 3, 4, 5]
        baseArray.append(6)
        
//        print(Constants.WELCOME_MESSAGE)
//        print(ConstantsEnum.WELCOM_MESSAGE)
        
        // Validate email address
        let email = "testemail@gmail.com"
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)

//        if emailPredicate.evaluate(with: email) {
//            print("valid")
//        } else {
//            print("invalid")
//        }
        
        // Create attributed string
        let stringToBeAttributed = "string to be attributed"
        let attributes = [NSAttributedString.Key.backgroundColor: UIColor.green]
        let attributedString = NSAttributedString(string: stringToBeAttributed,
                                                  attributes: attributes)
        
        // Difference between == and ===
        let a = TestClass(property: "test string")
        let b = TestClass(property: "test string")

        // Test if a and b are eqautable
        if a == b {
            print("true")
        } else {
            print("false")
        }

        // Test if a and b are pointing to the same memory
        if a === b {
            print("true")
        } else {
            print("false")
        }
        
        // Generate UUID
        let uuid = UUID()
        let uuidString = uuid.uuidString
        
        // Check if user is using iPad
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad {
            print("true")
        }

    }
    
    @objc
    func notifcationObserverFunction(_ notification: Notification) {
        print(notification)
    }
    
}

class TestClass: Equatable {
    static func == (lhs: TestClass, rhs: TestClass) -> Bool {
        return lhs.property == rhs.property
    }
    
    let property: String
    
    init(property: String) {
        self.property = property
    }
}

enum ConstantsEnum {
    static let WELCOM_MESSAGE = "Welcome from enum"
}

struct Constants {
    static let WELCOME_MESSAGE = "Welcome!"
}
