import Foundation
import UIKit

class DateManager: NSObject{
    static let shared = DateManager()
    private override init() {}
    
    let formatter = DateFormatter()
    
    func stringFromDate(date: Date) -> String{
        formatter.dateFormat="dd - MMMM - yyyy"
        return formatter.string(from: date)
    }
}
