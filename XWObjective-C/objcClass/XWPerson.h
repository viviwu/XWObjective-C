//
//  XWPerson.h
//  XWObjcRuntime
//
//  Created by vivi wu on 2017/6/30.
//  Copyright © 2017年 vivi wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XWPerson : NSObject
{
    NSString *address;
}

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)float stature;
@property(nonatomic,assign)BOOL sex;


@end
