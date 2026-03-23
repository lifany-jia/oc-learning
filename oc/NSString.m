//
//  main.m
//  oc
//
//  Created by lifany on 2026/3/9.
//

#import <Foundation/Foundation.h>

// 打印一条分隔线
void printDivider() {
    NSLog(@"─────────────────────────────────────────");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSLog(@"");
        NSLog(@"=========================================");
        NSLog(@"       NSString 类型深度解析             ");
        NSLog(@"=========================================");

        // ① 字面量
        NSString* str1 = @"123";

        // ② stringWithString: 短中文
        NSString* str2 = [NSString stringWithString:@"测试"];
        NSString* str6 = [NSString stringWithString:@"heelo"];
        NSString* str7 = [NSString stringWithString:@"heelonihdcnsdnc"];

        NSString* str3 = [NSString stringWithFormat:@"hello"];
        
        // ④ stringWithFormat: 纯ASCII无格式符但更长
        NSString* str4 = [NSString stringWithFormat:@"hello world"];
        NSString* str8 = [NSString stringWithString:str1];
        NSString* str10 = [NSString stringWithString:str3];
        NSString* str9 = [NSString stringWithString:str4];
        // ⑤ stringWithFormat: 单个中文
        NSString* str5 = [NSString stringWithFormat:@"测"];

        // ⑥ alloc init 空字符串
        NSString* stttt = [[NSString alloc] init];
        NSString* str = [NSString alloc];

        // 原始输出
        NSLog(@"");
        NSLog(@"【原始 NSLog 输出】");
        NSLog(@"str1 = %@, str2 = %@, str6 = %@, str7 = %@, str3 = %@, str4 = %@, str8 = %@, str10 = %@, str9 = %@, str5 = %@, stttt = %@, str = %@",
              str1.class,
              str2.class,
              str6.class,
              str7.class,
              str3.class,
              str4.class,
              str8.class,
              str10.class,
              str9.class,
              str5.class,
              stttt.class,
              str.class);
    }
    return 0;
}

//2026-03-17 08:49:15.498 day[42601:11803787] =========================================
//2026-03-17 08:49:15.498 day[42601:11803787]        NSString 类型深度解析
//2026-03-17 08:49:15.498 day[42601:11803787] =========================================
//2026-03-17 08:49:15.498 day[42601:11803787] 【原始 NSLog 输出】
//2026-03-17 08:49:15.498 day[42601:11803787] str1 = __NSCFConstantString, str2 = __NSCFConstantString, str6 = __NSCFConstantString, str7 = __NSCFConstantString, str3 = NSTaggedPointerString, str4 = __NSCFString, str8 = __NSCFConstantString, str10 = NSTaggedPointerString, str9 = __NSCFString, str5 = __NSCFString, stttt = __NSCFConstantString, str = NSPlaceholderString
