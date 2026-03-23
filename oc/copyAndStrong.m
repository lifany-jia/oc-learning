//
//  copyAndStrong.m
//  oc
//
//  Created by lifany on 2026/3/11.
//
#import "copyAndStrong.h"

@implementation Person


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person* p1 = [[Person alloc] init];
        NSMutableString *s1 = [NSMutableString stringWithString:@"ggg"];
        p1.name = s1;
        [s1 appendString:@"111"];
        NSLog(@"%@", p1.name);  // 使用copy会返回一个不可变字符串对象，而且是NSMutableString，所以是深拷贝，所以修改s1不会受到影响，地址也不一样
        NSLog(@"%@", p1.name.class);
        //但如果是strong，就会被改变，因为指向同一个地址
    }
    return 0;
}
