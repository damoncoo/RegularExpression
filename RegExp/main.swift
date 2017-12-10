//
//  main.swift
//  RegExp
//
//  Created by Darcy on 10/12/2017.
//  Copyright © 2017 Darcy. All rights reserved.
//

import Foundation

print("Hello, World!")

//
//  main.swift
//  SwiftCrossPlatform
//
//  Created by Darcy on 21/10/2017.
//  Copyright © 2017 Darcy. All rights reserved.
//

import Foundation

print("Hello, World!")


func isValidPhone() {
    
    let phone = "13570278759"
    var reg : NSRegularExpression
    do{
        try reg = NSRegularExpression.init(pattern:"^1[0-9]{10,10}",options:NSRegularExpression.Options.caseInsensitive)
        let res : [NSTextCheckingResult]  = reg.matches(in: phone, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, phone.count))
        
        //    print(res)
        
        for r in res {
            print(r)
            print(r.range)
        }
    }
    catch {
        
    }
}
/*
 //用户名是允许出现-_ 0-0 a-z 0-9 其中“-_” 不能单独注册或连续使用，不能放在开头或结尾。 如果第一位为数字的话，匹配的是全数字的类似qq邮箱
 提示：域名可由英文字母（a-z，不区分大小写）、数字（0-9）、中文汉字以及连字符"-"（即中横线）构成，不能使用空格及特殊字符（如！、$、&、?等）。“-” 不能单独注册或连续使用，不能放在开头或结尾。
 */

func isValidEmail(email : String) ->Bool {
    
    var isMath = false
    let emailRegEx = "((^[0-9]{6,})|(^[a-zA-Z]+([-_][a-z0-9A-Z]+)?))@([a-z0-9A-Z]+([-]?[a-z0-9A-Z]+)*[.])+([a-zA-Z]){2,64}$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    isMath = predicate.evaluate(with: email)
    return isMath
}

func isValidHttpUrl(url : String) -> Bool {
    
    var isMath = false
    let u = url
    let regStr = "http(s)?://(www.)?[a-z0-9]+"
    
    let predicate = NSPredicate(format: "SELF MATCHES %@", regStr)
    isMath = predicate.evaluate(with: u)
    return isMath
}

//isValidPhone()
//
var isMatch = isValidEmail(email: "xxxxww@qq.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.x.com")
isMatch = isValidEmail(email: "chengxiang_yu_19@qq.x-x.com")
isMatch = isValidEmail(email: "1chengxiang_yu@qq.x-x.com")
isMatch = isValidEmail(email: "1chengxiang_yu_@qq.x-x.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.x-x.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.xx.com")
isMatch = isValidEmail(email: "9e838@qq.com")
isMatch = isValidEmail(email: "9399484@qq.com")

//var isMatch = isValidHttpUrl(url: "https://baidu.com")
print(isMatch)

