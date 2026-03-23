//
//  Teacher.m
//  oc
//
//  Created by lifany on 2026/3/23.
//

#import "Teacher.h"
@implementation Teacher

- (void)didAddStudent:(Student *)stu {
    NSLog(@"teacher noticed new student:%@\n", [stu getName]);
}

@end
