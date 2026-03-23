//
//  Student.h
//  oc
//
//  Created by lifany on 2026/3/22.
//

#import <Foundation/Foundation.h>
@interface Student : NSObject
{
    @protected
//  protected是用来控制其子类可以进行访问的，默认下模式，private是私有变量其他都不可以访问，public是公开任何人都可以访问的，package是同一映像下可以访问
    NSString *_name;
    NSInteger _age;
    NSString *_studentId;
}
// 1. 属性生成的getter setter函数和自己自定义的getter setter函数有什么区别？
//自动处理内存语义（copy / strong）支持 点语法

// 2. 访问控制符属性和实例变量都可以作用？
//不作用于 property / 方法

- (void)printfInfo;
- (void)setName:(NSString *)name;
- (void)setAge:(NSInteger)age;
- (void)setStudentId:(NSString *)studentId;
- (NSString *)getName;
- (NSInteger)getAge;
- (NSString *)getStudentId;

@end
