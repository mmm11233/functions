import UIKit

var greeting = "Hello, playground"

//1)შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.

func calculateTheFactorial(number: Int) -> Int {
    if number == 0 || number == 1 {
        return 1
    } else {
        var result = 1
        for  num  in 2...number {
            result *= num
        }
        return result
    }
}

print(calculateTheFactorial(number: 5))


//2)შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.

func calculateFibonacciNumbers(count: Int) -> [Int] {
    var fibonacciNumbers = [0, 1]
    
    while fibonacciNumbers.count < count {
        let nextNumber = fibonacciNumbers[fibonacciNumbers.count - 1] + fibonacciNumbers[fibonacciNumbers.count - 2]
        fibonacciNumbers.append(nextNumber)
    }
    return fibonacciNumbers
}

print(calculateFibonacciNumbers(count: 20))


//3)შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად "racecar" ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.

func checkIfPalindrome(_ word: String) -> Bool {
    let characters = Array(word)
    let length = characters.count
    for i in 0..<(length / 2) {
        if characters[i] != characters[length - 1 - i] {
            return false
        }
    }
    return true
}

print(checkIfPalindrome("racecar"))



//4)შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func square(numbers: [Int]) -> [Int] {
    var squaredNumbers = [Int]()
    for number in numbers {
        let squaredNumber = number * number
        squaredNumbers.append(squaredNumber)
    }
    return squaredNumbers
}
print(square(numbers: [2, 3, 4]))


//5)შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით "TBC x USAID, tbc it academy, we are in TBC academy." function-მა უნდა დააბრუნოს ["tbc": 3, "academy": 2, "we": 1, "are": 1, "in": 1, "it": 1, "x": 1]

func countWords(sentense: String) -> [String: Int] {
    var words = sentense.lowercased().components(separatedBy: .whitespaces)
    var countedWords = [String: Int]()
    
    for word in words {
        if let count = countedWords[word] {
            countedWords[word] = count + 1
        } else {
            countedWords[word] = 1
        }
    }
    
    return countedWords
}

print(countWords(sentense: "TBC x USAID, tbc it academy, we are in TBC academy."))



//შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.

let binary: (Int) -> String = { number in
    return String(number, radix: 2)
}

//შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.

let numbers = [3, 45, 65, 7, 8, 95, 2]

let filteredNumbers = numbers.filter { $0 % 2 == 0 }

print("Filtered numbers: \(filteredNumbers)")


//შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.

let numbersArray = [32, 6, 8, 22, 9]

let changedNumbers = numbersArray.map { $0 * 10 }

changedNumbers.forEach { number in
    print("changed element: \(number)")
}


//გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.

func printAfterEscaping(array: [Int], completion: @escaping (Int) -> Void) {
    DispatchQueue.global().async {
        Thread.sleep(forTimeInterval: 3)
        
        let sum = array.reduce(0, +)
        completion(sum)
    }
}

let nums = [2, 5, 6, 7, 8]

printAfterEscaping(array: nums) { sum in
    print("The sum of the array is: \(sum)")
}


//function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.
//სტრინგები გადავაკეთო ინტებად -> გავფილტრო კენტები -> map გადავაკონვვერტირო ისევ სტინგად

func filterStrings(numbers: [String]) -> [String] {
    let oddStrings = numbers
        .compactMap { Int($0) }
        .filter { $0 % 2 != 0 }
        .map { String($0) }
    return oddStrings
}

print(filterStrings(numbers: ["34", "22", "76", "4", "39", "67", "1"]))



       
