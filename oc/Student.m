//
//  Student.m
//  oc
//
//  Created by lifany on 2026/3/22.
//

#import "Student.h"
@interface Student()
@property (nonatomic, strong)NSString *address;
@end
// Category 不能添加成员变量，因为他是单独的一个文件，在编译他之前已经将类的实例对象的内存大小分配好了，不能动态添加
// Extension 和 Category的区别在于分类是子类以及外部都可以调用的，而扩展是私有的，并且分类只能添加方法不能添加实例
// 纠正： Category 不是子类，是在原类上扩展方法，不创建新类，不改变继承，继承方法是否重写取决于需求
// Extension写在.m文件里是因为要和类的实例一起编译，并且不暴露方法接口
@implementation Student

- (instancetype)init {
    self = [super init];
// self在普通方法中指代他自己，init就是初始化方法
// 因为他的父类可能有他没有的要初始化的部分，所以让父类自己初始化自己的部分

    if (self) {
        _name = @"梨花";
        _studentId = @"129298";
        _address = @"lifany@";
    }
    return self;
}
- (void)printfInfo {
    NSLog(@"%@", self);
    // 4. 这里是要调用description吗
    // 对
}
- (void)setName:(NSString *)name {
    _name = [name copy];
}

- (void)setAge:(NSInteger)age {
    _age = age;
}
- (void)setStudentId:(NSString *)studentId {
    _studentId = [studentId copy];
}
- (NSString *)getName {
    return _name;
}
- (NSString *)getStudentId {
    return _studentId;
}
- (NSInteger)getAge {
    return _age;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"姓名：%@\n年龄：%lu\n学生ID：%@", _name, _age, _studentId];
    // 5. 这里重写要使用settergetter函数吗？
    // 不强制，推荐，符合封装思想
}
- (BOOL)isEqual:(id)object {
    // 因为==只会判断当前对象里面存储了什么，如果是一个指针就是会判断地址一样不一样，就会有所偏差
    
    if ([[object getStudentId] isEqualToString:_studentId] && [[object getName] isEqual:_name] && [object getAge] == _age) {
        return true;
    // 6. YES还是true？
    // 最好用YES/NO ，符合oc语意
 //   typedef signed char BOOL;
//    #define YES (BOOL)1
//    #define NO  (BOOL)0
        
    // 7. 这里object是不是不能用点语法，因为是id类型？
        // 对，编译器不知道具体类型
    } else {
        return false;
    }
}
// isEqual最好这样写，因为传入的object可能不是Student类型
//- (BOOL)isEqual:(id)object {
//    if (self == object) return YES;
//    if (![object isKindOfClass:[Student class]]) return NO;
//    Student *other = (Student *)object;
//    return [self.studentId isEqualToString:other.studentId];
//}
// 这里只比较studentId是因为studentId = 唯一标识

// 8. isEqual: 和 hash 是否应该一起重写？为什么？这个问题的hash是什么，没有了解过
// NSDictionary / NSSet 用 hash 做查找，isEqual 判断“逻辑相等”，如果只重写 isEqual：容器可能认为“不同对象”

@end
