/*:
 
 [前一页](@previous) [首页](@Introduction) [下一页](@next)
 
 关于什么是 Existential Type,可以理解为 `Protocols as Types`
 > Protocols as Types Protocols don’t actually implement any functionality themselves. Nonetheless, you can use protocols as a fully fledged types in your code. Using a protocol as a type is sometimes called an existential type, which comes from the phrase “there exists a type T such that T conforms to the protocol”.
 
 理解了什么事`Existential Type`， 我们来看这个`any`的用法
 以前可以把Protocol当做一个类型来约束class/struct/enum，比如下面
 */
protocol Vehicle {
    func travel(to destination: String)
}
    
struct Car: Vehicle {
    func travel(to destination: String) {
        print("I'm driving to \(destination)")
    }
}

let vehicle = Car()
vehicle.travel(to: "London")
/*:
 当然也可以作为泛型约束，比如下面
 */
func travel<T: Vehicle>(to destinations: [String], using vehicle: T) {
    for destination in destinations {
        vehicle.travel(to: destination)
    }
}
    
travel(to: ["London", "Amarillo"], using: vehicle)
/*:
 还可以作为函数参数约束
 
 **重点** Existential Type 要和 opaque Type区分开来，
 Any 是代表任何遵循Protocol的类型，但是Some指代编译时候确定的类型
 */
func travel2(to destinations: [String], using vehicle: Vehicle) {
    for destination in destinations {
        vehicle.travel(to: destination)
    }
}

/*:
 其实上面这种写法，没什么问题。但是在执行效率上，有稍许差别。
 
 当作为泛型约束的时候：函数调用采用 `static dispatch`,
 当直接作为函数参数的时候：蚕蛹 `dynamic dispatch`.
 
 为了解决这个问题，Swift5.6采用了新的关键字`any`.
 */

let vehicle3: any Vehicle = Car()
vehicle3.travel(to: "Glasgow")

func travel3(to destinations: [String], using vehicle: any Vehicle) {
    for destination in destinations {
        vehicle.travel(to: destination)
    }
}
