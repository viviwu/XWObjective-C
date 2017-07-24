//
//  XWExecuter.h
//  XWObjcRuntime
//
//  Created by vivi wu on 2017/6/30.
//  Copyright © 2017年 vivi wu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    UnknownXWOjcProperty = '?', // unknown type
    BoolXWObjcProperty   = 'c', // BOOL
    IntXWObjcProperty    = 'i', // 32 bit integer
    LongXWObjcProperty   = 'q', // 64 bit long, i.e. long long, not long
    FloatXWObjcProperty  = 'f', // 32 bit float
    DoubleXWObjcProperty = 'd', // 64 bit double
    ObjectXWObjcProperty = '@'  // objects
} XWObjcPropertyType;

@interface XWExecuter : NSObject

- (void) executeNow;

- (void) getAllIvarList:(Class)cls;

@end
