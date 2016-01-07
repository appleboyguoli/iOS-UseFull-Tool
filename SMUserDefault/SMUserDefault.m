//
//  EOCAutoDictionary.m
//  ResolveDemo
//
//  Created by Apple on 15/12/28.
//  Copyright © 2015年 ShanDongSanMi. All rights reserved.
//

#import "SMUserDefault.h"
#import <objc/runtime.h>

@interface SMUserDefault()

@end

static SMUserDefault *userDefault;

@implementation SMUserDefault

@dynamic phone, password, token, clientID,servicePhone;


+ (SMUserDefault *)smUserDefault
{
    if (userDefault == nil) {
        userDefault = [[SMUserDefault alloc] init];
    }
    return userDefault;
}


id autoDictionaryGetter(id self, SEL _cmd)
{
 
    NSString *key = NSStringFromSelector(_cmd);
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value)
{

    
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length-1, 1)];
    
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    
    if (value) {
        [[NSUserDefaults standardUserDefaults]  setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
    }else
    {
        class_addMethod(self, sel, (IMP)autoDictionaryGetter, "@@:");
    }
    return YES;
}
@end
