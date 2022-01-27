//
//  Created by Josh Grant on 1/27/22.
//

import Foundation

public extension String
{
    static func *(lhs: String, rhs: Int) -> String
    {
        var output: String = ""
        for _ in 0 ..< rhs
        {
            output += lhs
        }
        return output
    }
    
    static var newline: String { "\n" }
    static var divider: String { "–––––––––––––––––––––––––––––––––" }
}
