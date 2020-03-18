//: # 常量

// 整数 : Int
let age = 10
let age1: Int
age1 = 20

func getAge() -> Int {
    return 30
}

let age2 = getAge()

//: # 常用数据类型
// 浮点数 : float double
let letFloat: Float = 30.0
let letDouble = 30.0

//: # 字面量
// 布尔 : Bool
let letBool = true
let letBool2 = false

// 字符串 : String
let letString = "字符串"

// 字符 : Character(可存储ASCII字符、Unicode字符)
let letCharacter: Character = "A"

// 整数
let intDecimal = 17 // 十进制
let intBinary = 0b10001 // 二进制
let intOctal = 0o21 // 八进制
let intHexadecimal = 0x11 // 十六进制

// 浮点数
let doubleDecimal = 125.0 // 十进制, 等价于1.25e2; 0.0125等价于1.25e-2
let doubleHexadecimal1 = 0xFp2 // 十六进制, 等价于15x2^2, 相当于十进制的60.0
let doubleHexadecimal2 = 0xFp-2 // 十六进制, 等价于15x2^-2, 相当于十进制的3.75

// 以下都等于十进制的12.1875
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 // 怎么求的???

// 数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// 数组
let array = [1, 3, 5, 7, 9]

// 字典
let dictionary = ["age": 18, "height": 168, "weight": 120]

//: # 类型转换
// 整数转换
//let cannotBeNegative: UInt8 = -1 // UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1 // Int8 类型不能存储超过最大值的数，所以会报错

// 类型不同不能相加
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型

// 字面量可以直接相加，因为数字字面量本身没有明确的类型
let result = 3 + 0.14159

//: # 类型别名(type aliases)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound 现在是 0

//: # 元组(Tuple)
// 404
let http404Error = (404, "Not Found" )
print( "The status code is \(http404Error.0)")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")

let (justTheStatusCode, _) = http404Error

// 200
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
