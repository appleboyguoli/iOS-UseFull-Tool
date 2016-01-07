//
//  ZHScreetAES.h
//  ZhenHao
//
//  Created by 刘洪飞 on 16/1/6.
//  Copyright © 2016年 ShanDongSanMi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHScreetAES : NSObject

+ (NSString*) AES128Encrypt:(NSString *)plainText;
+ (NSString*) AES128Decrypt:(NSString *)encryptText;

@end
