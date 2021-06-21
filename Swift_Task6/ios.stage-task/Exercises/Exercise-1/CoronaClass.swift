import Foundation

class CoronaClass {
    let n: Int
    var res: Int = 0
    var seats = [Int]()
    
    
    init(n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        if seats.isEmpty {
            res = 0}
        if seats.count == 1 && seats.contains(0) {
            res = n - 1}
        if seats.count == 1 && !seats.contains(0) {
            res = 0}
        if seats.count == 2 {
            let diff3 = seats[1] - seats[0] - 1
            var real = 0
            if diff3 % 2 == 0 {
                real = (diff3/2) + 1}
            if diff3 % 2 != 0 {
                real = (diff3 + 1)/2}
            res = seats[1] - real}
        if seats.count > 2 && seats.last != (n-1) {
            res = n - 1}
        if seats.count > 2 && seats.last == (n-1) {
            var diff: [(Int, Int)] = []
            for i in 1 ..< seats.count {
                let diffx = seats[i] - seats[i-1] - 1
                var realdiff = 0
                if diffx % 2 == 0 {
                    realdiff = (diffx - 2)/2 + 1}
                if diffx % 2 != 0 {
                    realdiff = (diffx - 1)/2 + 1}
                diff.append((seats[i-1], realdiff))
            }
            let secondDiff = diff.map( { $0.1 } )
            let secondDiff2 = secondDiff.sorted(by: >)
            var maxValue = 0
            if secondDiff == secondDiff2 {
                maxValue = secondDiff[0]}
            else {maxValue = secondDiff.max()!}
            let indexOfMax = secondDiff.firstIndex(of: maxValue)!
            let firstDiff = diff.map({$0.0})
            let firstValue = firstDiff[indexOfMax]
            res = firstValue + maxValue
            diff.removeAll()
         }
        seats.append(res)
        seats.sort()
        return res
    }
    func leave(_ p: Int) {
//        for i in 0 ..< seats.count {
//            if seats[i] == p {
//                seats.remove(at: i)
//                return
//            }
//        }
        
//        if seats.contains(p)
        if p == 0 && seats.count == 1 {
            seats.removeAll()
        }
        
        if (p == 0 && seats.count > 1) || (p > 0 && p <= n)  {
            if seats.contains(p) {
                if let index = seats.firstIndex(of: p) {
                    seats.remove(at: index)
                }
            }
        }
        
//                    if p >= 0 && p <= n  {
//                        //seats = seats.filter { $0 != p }
//                        guard let toRemove = seats.firstIndex(of: p) else {return}
//                        seats.remove(at: toRemove)}

    }
}
