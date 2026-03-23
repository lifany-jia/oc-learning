//
//  Student + Study.m
//  oc
//
//  Created by lifany on 2026/3/22.
//

#import "Student+Study.h"
@implementation Student (Study)
// 9. 这里要写分类名吗？
// 必须写
- (void)Study {
    NSLog(@"%@ is study", _name);
    // 10. 自定义getter是不是不能用点语法访问属性？
    // 对，因为这里的getter是错误命名，正确的没有get前缀，所以现在就是一个普通的方法，不能用点语法，点语法是用来访问属性的
    // 11. 直接用实例变量和用self去调用方法有什么区别？
    // 就是直接访问内存和调用方法的区别，用箭头其实就是直接访问内存，用点语法就是调用方法
    // 一般init里面直接用实例变量，但是其他地方用点语法调用方法访问 
}

@end
