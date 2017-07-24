//
//  main.m
//  XWObjective-C
//
//  Created by vivi wu on 2015/8/24.
//  Copyright © 2015年 vivi wu. All rights reserved.
//

#import <Foundation/Foundation.h>
//block
#import "XWobjcBlock.h"
//runtime
#import "XWExecuter.h"
#import "XWPerson.h"

void (^objc_block)()=^{
    NSLog(@"hello Block!");
    XWobjcBlock * person=[[XWobjcBlock alloc]init];
    
    //        2:
    __block int number = 5;
    int (^calculator)(int) = ^(int num){
        // 如果外部number变量是static、static global或者global变量，则不需要添加__block，该值也是可以在block内部修改的。
        number=7;
        return num * number;
    };
    person.value=calculator(10);
    NSLog(@"value==%d", person.value);
    
    [person completionHandler:^{
        NSLog(@"Play block!");
    }];
    person.returnAnonymity(@"vivi", 25);
};

void objc_runtime(){
    XWExecuter * exe=[[XWExecuter alloc]init];
    [exe executeNow];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /*
         //        id obj = [NSNull null];
         id obj = nil;
         NSMutableDictionary * m_dict=[NSMutableDictionary dictionary];
         [m_dict setObject:obj forKey:@"key"];
         NSLog(@"%@", m_dict);
         
         XWobjcBlock * obj=[[XWobjcBlock alloc]init];
         [obj returnAnonymity];
         NSLog(@"Hello, World!");
         */
        
    }
    return 0;
}
