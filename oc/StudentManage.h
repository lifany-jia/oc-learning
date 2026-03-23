//
//  StudentManage.h
//  oc
//
//  Created by lifany on 2026/3/22.
//
#import "Student.h"
#import "Student+Study.h"
#import "StudentManageDelegate.h"
#import <Foundation/Foundation.h>
@interface StudentManage : NSObject
@property (nonatomic, weak) id<StudentManageDelegate> delegate;

// 代理要用weak，emmm，weak就是我使用别人的时候不加引用计数，那代理要用weak，，好吧我不知道，难道是循环引用？
// 对的，就是为了避免循环引用

@property (nonatomic, strong) NSMutableArray *students;
// NSSArray是不可变的数组，NSMutableArray是可变数组
// 遍历数组可以通过 1.for(id object in array) 2. for(i = 0; i > array.count; i++) 3.枚举器遍历，但是这个我不会
// 数组里面存放id类型，可能。。就是你要用到对应属性不能用点语法？？好吧这个我不知道

// 12. 这个类如果被alloc创建后是不是只会分配一个能够存放NSMutableArray的指针的内存？那具体什么时候回分配堆上的内存呢？
// alloc分配isa以及所有ivar，但此时指针=nil，所以要init自己初始化创建数组对象

- (void)addStudent:(Student*)stu;
- (void)removeStudent:(Student*)stu;
- (Student *)findStudentInfoById:(NSString *)studentId;
- (void)printAllStudent;
@end
