//
//  XWobjcBlock.m
//  XWObjective-C
//
//  Created by vivi wu on 2017/7/15.
//  Copyright © 2017年 vivi wu. All rights reserved.
//

#import "XWobjcBlock.h"
// 声明全局变量global
int global = 100;

@implementation XWobjcBlock

//+ (void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        id obj = [[self alloc] init];
//        
//        [obj anInstanceMethod];
//    });
//}


- (void)anInstanceMethod {
    
    __block int num=5;
    void (^someBlock)() = ^ {
        global++;
        num += global;
        self.fans = @"girls";
        NSLog(@"%d fans:%@", num,self.fans);
    };
//    someBlock();
    [self completionHandler:someBlock];
//    Block_release(someBlock);//MRC
}


-(void)completionHandler:(void(^)())handler
{
    _aHandler=[handler copy];
    handler();//invoke the specific method
}

-(void(^)(NSString *, int))returnAnonymity{
    
    void(^block)(NSString*, int) = ^(NSString *name, int age){
        NSLog(@"%@ is %d years old.", name, age);
        _aHandler();
    };
    
    return block;
}

- (void)dealloc
{
    NSLog(@"Person dealloc");
    //MRC
//    Block_release(_aHandler); 
//    [super dealloc];
}

/*
 // 由此可知,在Block定义时便是将局部变量的值传给Block变量所指向的结构体,因此在调用Block之前对局部变量进行修改并不会影响Block内部的值,同时内部的值也是不可修改的
// OC代码如下
void(^myBlock)() = ^{
    NSLog(@"global = %d", global);
};

// 转为C++代码如下
void(*myBlock)() = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, global));

// 将变量类型精简之后C++代码如下,我们发现Block变量实际上就是一个指向结构体__main_block_impl_0的指针,而结构体的第三个元素是局部变量global的值
void(*myBlock)() = &__main_block_impl_0(__main_block_func_0, &__main_block_desc_0_DATA, global);

// 我们看一下结构体__main_block_impl_0的代码
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int global;
    __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _global, int flags=0) : global(_global) {
        impl.isa = &_NSConcreteStackBlock;
        impl.Flags = flags;
        impl.FuncPtr = fp;
        Desc = desc;
    }
};

// 在OC中调用Block的方法转为C++代码如下,实际上是指向结构体的指针myBlock访问其FuncPtr元素,在定义Block时为FuncPtr元素传进去的__main_block_func_0方法
((void (*)(__block_impl *))((__block_impl *)myBlock)->FuncPtr)((__block_impl *)myBlock);

// __main_block_func_0方法代码如下,由此可见NSLog的global正是定义Block时为结构体传进去的局部变量global的值
static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
    int global = __cself->global; // bound by copy
    NSLog((NSString *)&__NSConstantStringImpl__var_folders_6y_vkd9wnv13pz6lc_h8phss0jw0000gn_T_main_d5d9eb_mi_0, global);
}
*/

@end
