//
//  XWExecuter.m
//  XWObjcRuntime
//
//  Created by vivi wu on 2017/6/30.
//  Copyright © 2017年 vivi wu. All rights reserved.
//
#import <objc/Object.h>
#import <objc/runtime.h>

#import "XWExecuter.h"
#import "XWPerson.h"

@implementation XWExecuter

- (void) executeNow{
    
    [self getAllIvarList:[XWPerson class]];
}

- (void) getAllIvarList:(Class)cls {
    
    const char *cls_name = object_getClassName(cls);
    NSLog(@"<Class> %s (properties):", cls_name);
    unsigned int ivarCount = 0;
    Ivar * ivars = class_copyIvarList(cls, &ivarCount);
    for (unsigned int i = 0; i < ivarCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        //property inspect:
        //objc_property_t property_t = class_getProperty(cls, name);
        NSLog(@"Name: %s , Type: %s;", name, type);
    }
    free(ivars);
    
    

//    property_getAttributes
     
}

@end
