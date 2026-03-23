//
//  StudentManage.m
//  oc
//
//  Created by lifany on 2026/3/22.
//

#import "StudentManage.h"
@implementation StudentManage
- (NSMutableArray *)students {
    if (!_students) {
        _students = [NSMutableArray array];
    }
    return _students;
}
- (void)addStudent:(Student *)stu {
    [self.students addObject:stu];
    [self.delegate didAddStudent:stu];
    NSLog(@"添加成功");
}

- (void)removeStudent:(Student *)stu{
    [self.students removeObject:stu];
}

- (Student *)findStudentInfoById:(NSString *)studentId {
    for (id object in self.students) {
        if ([studentId isEqualToString:[object getStudentId]]) {
            return object;
        }
    }
    return NULL;
    // 13. 讲讲关于空值null
    // 这里其实应该用nil，nil表示对象空，NULL表示C指针空，NSNull表示集合用的空对象
    
}
- (void)printAllStudent {
    NSLog(@"数组个数：%lu", self.students.count);
    for (id obj in self.students) {
        NSLog(@"%@\n", obj);
        // 14. 这里会调用description吗，会不会受id类型影响？
        // 不影响，runtime会动态调用函数方法
    }
}
@end
