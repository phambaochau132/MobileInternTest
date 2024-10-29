import UIKit

//Option 1
func findMissingNumber(array:Set<Int>)->Int?{
    var arrayTemp:Set<Int>=[]
    for i in 1...array.count+1{
        arrayTemp.insert(i)
    }
    return arrayTemp.symmetricDifference(array).first
}
//Option 2
func findMissingNumber1(array:Set<Int>)->Int?{
    var arrayTemp:Set<Int>=[]
    for i in 1...array.count+1{
        arrayTemp.insert(i)
    }
    let sumArrayTemp=arrayTemp.reduce(0, +)
    let sumArray=array.reduce(0, +)
    return sumArrayTemp-sumArray
}
//Output
let array:Set=[3,7,1,2,6,4]
dump(findMissingNumber(array: array))
dump(findMissingNumber1(array: array))
