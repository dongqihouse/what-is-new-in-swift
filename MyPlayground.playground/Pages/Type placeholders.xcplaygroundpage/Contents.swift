//: [上一页](@previous)
/*:
 `Type Placeholders`是以前的特性，具体如下
 */
let score3: _ = 5

/*:
 当然`_`完全不用写，因为有类型推断。如果我们遇到已知初始化，无法确定类型的时候，可以写全类型，如下：
 */
var results2: [String: [Int]] = [
    "Cynthia": [],
    "Jenny": [],
    "Trixie": [],
]

/*:
 现在的你可以选择那部分类型，然编译器进行类型类推到，这样做意义是让你的代码更简洁，且更具有可读性。如下：
 */
var results3: [_: [Int]] = [
    "Cynthia": [],
    "Jenny": [],
    "Trixie": [],
]
/*:
 这样，我们就只明确了编译器无法推断的那部分类型。
 还有一个有意思的地方你可以使用`_?`，这样就是可选类型
 */

let opt: _? = 5

/*:
 需要注意的是，`_` 无法推断出函数签名，所以涉及到参数以及返回值的时候一定要明确具体类型。
 */
struct Player<T: Numeric> {
    var name: String
    var score: T
}
    
func createPlayer() -> _ {
    Player(name: "Anonymous", score: 0)
}

//: [下一页](@next)
