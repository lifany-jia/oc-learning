//
//  StudentManageDelegate.h
//  oc
//
//  Created by lifany on 2026/3/23.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@protocol StudentManageDelegate <NSObject>
// 15. 协议和继承一样一定要继承NSObject吗？
// 协议不必须继承NSObject，但是继承会得到respondsToSelector，isKindOfClass，实际开发建议加上

- (void)didAddStudent:(Student *)stu;
@end
// 协议只是借口声明，而继承是父类子类的关系，感觉是完全不同的，继承的父类的方法一般不用你去重写，但是协议必须要自己实现，当然也有可选选项
