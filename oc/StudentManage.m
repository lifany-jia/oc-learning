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
// 加了字典删除部分也要一并删除：
//- (void)removeStudent:(Student *)stu {
//    [self.students removeObject:stu];
//    [self.dictionary removeObjectForKey:stu.studentId];
//}

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
// 加了字典集合的优化：
//- (Student *)findStudentInfoById:(NSString *)studentId {
//    return self.dictionary[studentId]; // O(1)
//}
- (void)printAllStudent {
    NSLog(@"数组个数：%lu", self.students.count);
    for (id obj in self.students) {
        NSLog(@"%@\n", obj);
        // 14. 这里会调用description吗，会不会受id类型影响？
        // 不影响，runtime会动态调用函数方法
    }
}

// NSSet判断重复是根据先判断hash，如果这个相同的话就去调用isEqual
// 如果没有实现hash？我不知道是指没有复写还是根本没有，如果根本没有的话，感觉也没有什么影响，如果没有重写的话，可能就是由于内存不同导致hash不同，直接就不继续判断了，所以我们要重写？是这个意思吗？
// : 不同对象，内存地址不同，但是内容一样，由于直接先比较hash，NSSet会判断他们是一个人，认为不是一个人就去重失败了，如果你没有重写 hash，那 hash 默认与对象内存地址有关
- (void)removeDuplicateStudents {
    NSSet *set = [NSSet setWithArray:self.students];
    self.students = [set allObjects].mutableCopy;
// 16. allobjects返回的是set怎么能拷贝给array，这是怎么作用的？
// 因为这个allObjects返回的就已经是数组，不是NSSet，allObjects 会把 set 内部的无序元素 打包成数组 返回，这个数组是不可变数组，之后再用mutableCopy返回一个可变数组，赋值给self.students
// 17. 点语法不是作用给属性的吗，为什么可以用在这里？
// 这是少数情况，而且也相当于调用方法
}

- (void)sortByAgeByAscending {
    [self.students sortUsingComparator:^NSComparisonResult(Student *s1, Student *s2) {
        if ([s1 getAge] < [s2 getAge]) {
            return NSOrderedAscending;
        } else if ([s1 getAge] > [s2 getAge]){
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
}

- (NSMutableDictionary *)studentDict {
    if (!_dictionary) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    return _dictionary;
}
// 18. 我发现重写初始化的时候集合类每次都在getter上重写，普通类就在init上?
// 普通对象初始化就是创建对象，所以在 init 里赋值属性，集合类，可能不会马上用，如果在 init 就创建，浪费内存（尤其是大数组/字典），使用懒加载 在第一次访问时创建，更灵活


- (void)addStudentDic:(Student *)stu {
    if (self.dictionary[[stu getStudentId]]) {
        NSLog(@"学生已存在");
        return ;
    }
    [self.students addObject:stu];
    [self.dictionary setObject:stu forKey:[stu getStudentId]];
    [self.delegate didAddStudent:stu];
}
- (NSArray<Student *>*)findAdultStudents {
    NSMutableArray<Student *> *result = [NSMutableArray alloc];
    for (Student *stu in self.students) {
        if ([stu getAge] > 18) {
            [result addObject:stu];
        }
    }
    return result;
}
- (double)averageAge {
    if (self.students.count == 0) {
        return 0.0;
    }
    NSInteger sum = 0;
    for (Student *stu in self.students) {
        sum += [stu getAge];
    }
    return (double)sum / self.students.count;
}

@end
