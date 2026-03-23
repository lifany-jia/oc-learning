//
//  main.m
//  oc
//
//  Created by lifany on 2026/3/23.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentManage.h"
#import "Student+Study.h"
#import "Teacher.h"
int main() {
    StudentManage *manager = [[StudentManage alloc] init];
    Teacher *teacher = [[Teacher alloc] init];
    manager.delegate = teacher;
    Student *stu1 = [[Student alloc]init];
    Student *stu2 = [[Student alloc]init];
    stu2.name = @"小丽";
    stu2.age = 14;
    stu2.studentId = @"792374";
    [manager addStudent:stu1];
    [manager addStudent:stu2];
    [manager printAllStudent];
    return 0;
}
