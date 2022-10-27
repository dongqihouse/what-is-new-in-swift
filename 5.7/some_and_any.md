```Swift
// ## some 和 any

// 5.7 之前 泛型协议无法用于类型声明
//func compare(x: Equatable, y: Equatable) -> Bool {
//    return x == y
//}
// 泛型协议 只能 作为泛型约束 (only be used as a generic constraint)
func compare1<T: Equatable>(x: T, y: T) -> Bool {
    return x == y
}

// 5.7之后 protocol 可以使用some any关键字
// some 是 5.1 引入
// some关键字 最常见的使用即为SwiftUI里面
// return some View
// some 其实是定义了一个 opaque return types. 编译器会在每次调用的时候
// 自动推断其具体的类型，减少额外的代码量
func compare2(x: some Equatable, y: some Equatable) -> Bool {
    // 这里不能使用 return x > y
    // 其实很容易理解，some Equatable 和 some Equatable 编译器无法约束为一种类型啊，自然无法对比
    return false
}

// Result values in '? :' expression have mismatching types 'Int' and 'Bool'
// some 是确定的类型，只不过是编译器推断，所以下面的代码是无法编译通过的
//func anyUsage2() -> some Equatable {
//    return Bool.random() ? 1 : true
//}

// any 是存在类型，是一种容器类型
func anyUsage() -> any Equatable {
    return Bool.random() ? 1 : true
}

// 总结
// some 是具体的静态类型，只不过是编译器推断
// any  是动态类型
```