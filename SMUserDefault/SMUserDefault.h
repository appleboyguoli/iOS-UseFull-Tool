//
//  EOCAutoDictionary.h
//  ResolveDemo
//
//  Created by Apple on 15/12/28.
//  Copyright © 2015年 ShanDongSanMi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMUserDefault : NSObject

+ (SMUserDefault *)smUserDefault;

@property(nonatomic, copy) NSString *phone;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, copy) NSString *token;
@property(nonatomic, copy) NSString *clientID;
@property(nonatomic, copy) NSString *servicePhone;


@end
