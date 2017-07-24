//
//  XWobjcBlock.h
//  XWObjective-C
//
//  Created by vivi wu on 2017/7/15.
//  Copyright © 2017年 vivi wu. All rights reserved.
//

#import <Foundation/Foundation.h>

//about block in Objective-C

//typedef void (^dispatch_block_t)(void);
typedef void (^xHandler)(void);

@interface XWobjcBlock : NSObject

@property (nonatomic, copy) dispatch_block_t dis_block;
@property (nonatomic, copy) xHandler aHandler;

@property (nonatomic, copy) NSString *fans;
@property (nonatomic, assign) int value;

-(void)completionHandler:(void(^)())handler;

-(void(^)(NSString *, int))returnAnonymity;

@end

/**
 block有
 _NSConcreteStackBlock、     --->stack
 _NSConcreteMallocBlock、    -->heap
 _NSConcreteGlobalBlock     --->data area (.data section)
 这三种类型。
 
对应的结构体定义如下：
struct Block_descriptor {
    unsigned long int reserved;
    unsigned long int size;
    void (*copy)(void *dst, void *src);
    void (*dispose)(void *);
};

struct Block_layout {
    void *isa;
    int flags;
    int reserved;
    void (*invoke)(void *, ...);
    struct Block_descriptor *descriptor;
//     Imported variables. 
};
 
 以下情况，block为_NSConcreteGlobalBlock类型:
    block内部只使用了全局变量
    block内部没有使用任何外部的局部变量
 
 除了以上两种情况，其他的block为_NSConcreteStackBlock类型。
 
 而对于_NSConcreteMallocBlock，只有当_NSConcreteStackBlock类型的block执行copy操作（手动或者系统执行）时，该block才会是_NSConcreteMallocBlock类型
 
 */
