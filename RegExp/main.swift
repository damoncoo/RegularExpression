//
//  main.swift
//  RegExp
//
//  Created by Darcy on 10/12/2017.
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
    let emailRegEx = "((^[0-9]{6,})|(^[a-zA-Z]+([-_][a-z0-9A-Z]+)?))@([a-z0-9A-Z]+([-]?[a-z0-9A-Z]+)*\\.)+([a-zA-Z]){2,4}$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    isMath = predicate.evaluate(with: email)
    return isMath
}

func isValidHttpUrl(url : String) -> Bool {
    
    var isMath = false
    let u = url
    let regStr = "http(s)?://([a-z0-9A-Z]+([-]?[a-z0-9A-Z]+)*\\.)+([a-zA-Z]){2,4}(:[0-9]{1,5})?(/[0-9A-Za-z\\.]+)*(\\?)?[0-9a-zA-Z=&\\.]*"
    
    let predicate = NSPredicate(format: "SELF MATCHES %@", regStr)
    isMath = predicate.evaluate(with: u)
    return isMath
}

func findWords(regStr : String,matchText : String) {
    
    var reg : NSRegularExpression
    do {
        try reg = NSRegularExpression.init(pattern:regStr ,options:NSRegularExpression.Options.caseInsensitive)
        let res : [NSTextCheckingResult]  = reg.matches(in: matchText, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, matchText.count))
        
        for r in res {
            print((matchText as NSString).substring(with: r.range))
        }
    }
    catch  {
        
    }
}
var regStr = "(\\w+)"
regStr = "[1-9]+(\\.[0-9])*"
var text  = "String的总体功能来看还是比NSString要更加强大，毕竟Swift语法里的正规军。两者有很多的不同，甚至他有你没有的功能说到底都是一个是值类型，一个是引用类型引起的。swift2.0之后扩展了一些属性，这也让String的很多方法的调用方式发生了巨大改变。 还有一些不同正在探索中，希望本文-能对读者有所帮助99个人，转载必须注明转载和原文链接3.1。"

findWords(regStr: regStr,matchText: text)

regStr = "(.+).*\\1" //后向引用,匹配前面和后面一样的
text = "本周谷歌推出了一款名为DeepVariant的程序，可以通过深度学习来拼凑一个人的基因组并且更准确地识别出DNA序列中的突变。这个技术在谷歌中曾经用来识别一张照片是猫还是狗，在这里DeepVarient利用了相同的技术解决了DNA分析领域的一个重要问题。现代DNA测序仪可以执行高通量测序，读取出的不是完整的DNA序列，而是重叠的短片段。然后将这些片段与另一个基因组进行比较，从而将它们拼凑在一起，进行变异识别。但是这项技术很容易出错，科学家也很难排查出这些错误以及小突变。这些小突变非常重要。它们可以提供重要的见解，比如说，疾病的根本原因。区分哪些碱基对是错误的，哪些是正确的，这被称为“变量调用”。其实已经有一些工具可以帮助科学家做到这一点。最广泛使用的是GATK，这是一种人工设计的算法，可以将统计数据应用到测序机器最常出错的地方。然而，DeepVariant利用神经网络技术来构建比以往任何技术都更精确的程序。去年，这项技术在FDA大赛中获得了第一名。神经网络之所以如此命名，是因为它们的工作方式有点类似于神经元在大脑中的方式。每一层网络都逐级处理着更为复杂的工作。为了利用图像识别技术来建立一个精确的DNA序列，谷歌团队将DNA测序数据转化为了一个图像。例如，构成遗传密码的As、Ts、c和Gs，就会以红色的形式出现。研究人员随后对数百万份基因组测序和高通量读取技术进行了研究，并教会了这个程序哪些东西更重要，哪些可以忽略。此产生的算法可以比以往任何系统都更准确地对错误进行排查。最初，这些图像仅由三种颜色组成，或三层数据。不过，发布的最新版本包含了7种，使其可以更加精确地表达。这个程序目前是作为开源软件发布的，外部研究人员可以使用以及继续进行程序强化。DeepVariant绝不是100%准确的。但它的成功代表了机器学习对基因学的影响。基因组数据的规模和复杂性是巨大的。机器可能正是我们需要弄明白的东西"

findWords(regStr: regStr, matchText: text)

/*
 
 (?=X )
 
 零宽度正先行断言。仅当子表达式 X 在 此位置的右侧匹配时才继续匹配。例如，/w+(?=/d) 与后跟数字的单词匹配，而不与该数字匹配。此构造不会回溯。
 
 (?!X)
 
 零宽度负先行断言。仅当子表达式 X 不在 此位置的右侧匹配时才继续匹配。例如，例如，/w+(?!/d) 与后不跟数字的单词匹配，而不与该数字匹配 。
 
 (?<=X)
 
 零宽度正后发断言。仅当子表达式 X 在 此位置的左侧匹配时才继续匹配。例如，(?<=19)99 与跟在 19 后面的 99 的实例匹配。此构造不会回溯。
 
 (?<!X)
 
 零宽度负后发断言。仅当子表达式 X 不在此位置的左侧匹配时才继续匹配。例如，(?<!19)99 与不跟在 19 后面的 99 的实例匹配
 */
//断言 ?<= 正后发断言  ?= 零宽度正先行断言
regStr = "(?<=s).*(?=D)"
findWords(regStr: regStr, matchText: text)

regStr = "(?<!s).*(?!D)"
findWords(regStr: regStr, matchText: text)



//找中文
regStr = "[\\u4e00-\\u9fa5]+"
findWords(regStr: regStr, matchText: text)

text = "149390199010200918"
regStr = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$"

findWords(regStr: regStr, matchText: text)

//isValidPhone()

var isMatch = isValidEmail(email: "xxxxww@qq.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.x.com")
isMatch = isValidEmail(email: "chengxiang_yu_19@qq.x-x.com")
isMatch = isValidEmail(email: "1chengxiang_yu@qq.x-x.com")
isMatch = isValidEmail(email: "1chengxiang_yu_@qq.x-x.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.x-x.com")
isMatch = isValidEmail(email: "chengxiang_yu@qq.xx.com")
isMatch = isValidEmail(email: "9e838@qq.com")
isMatch = isValidEmail(email: "9399484@qq.com")

isMatch = isValidHttpUrl(url: "https://baidu.com:888")
isMatch = isValidHttpUrl(url: "https://baidu.com:888/oeo/i2ke")
isMatch = isValidHttpUrl(url: "https://baidu.com:888/oeo/i2ke?oeoe=llkd")
isMatch = isValidHttpUrl(url: "http://baidu.com:888/oeo/i2ke?oeoe=llkd")
print(isMatch)

regStr = "[0-9]+[^0-9]+"
text = "1,曾经沧海难为水2,除却巫山不是云2"
findWords(regStr: regStr, matchText: text)




