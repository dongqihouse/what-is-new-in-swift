//: [Previous](@previous)

/*:
 # CodingKey类型改变
 当我们需要对一个对象进行，编解码的时候，这个对象需要遵守`Codable`协议，一般序列化为`KeyContained`的形式，
 
 以前我们的CodingKey只能是String或者Int

 */
import Foundation

enum OldSettings: String, Codable {
    case name
    case twitter
}

let oldDict: [OldSettings: String] = [.name: "Paul", .twitter: "@twostraws"]
let oldData = try JSONEncoder().encode(oldDict)
print(String(decoding: oldData, as: UTF8.self))

/*:
 这里data decode字符串，我们发现结果是`["twitter","@twostraws","name","Paul"]`一个数组，并不是我们原先的字典。
 所以当我们需要打印当前对象的字符串的时候，就会造成误解。
 
 不过现在CodingKey，可以指定类型了
 */

//: [Next](@next)
