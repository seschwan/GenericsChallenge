

struct CountedSet<Element: Hashable> {
    
    private (set) var items: [Element : Int] = [:] // Creating a new [Key : Value] pair.
    
    mutating func insert(_ elementKey: Element) { // Taking in a new Element
        if let value = items[elementKey] { // Checking to see if it has already been added.
            items[elementKey] = value + 1  // If it has then incrementing the value
        } else {
            items.updateValue(1, forKey: elementKey)  // .updateValue gives a value to a new Element
        }
    }
    
    mutating func remove(_ elementKey: Element) {
        if let value = items[elementKey] {
            items[elementKey] = value - 1
        } else {
            items.removeValue(forKey: elementKey)
        }
    }
    
    subscript(_ memeber: Element) -> Int {
        return items[memeber] ?? 0
    }
  
    func count() -> Int {
        return items.isEmpty ? 0 : items.count
    }
    
}


// Create an extension to conform to the "ExpressibleByArrayLiteral" protocol.
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for element in elements {
            self.insert(element)
        }
    }
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0


