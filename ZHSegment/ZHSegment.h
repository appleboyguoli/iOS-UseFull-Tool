//
//  ZHSegment.h
//  ZhenHao
//
//  Created by Apple on 15/10/10.
//  Copyright (c) 2015年 ShanDongSanMi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SegmentBlock)(NSInteger index);

@interface ZHSegment : UIView

/**
 *  初始化方法
 *
 *  @param segTitles 标题
 *  @param segImages 图片
 *
 *  @return ZHsegment
 */
- (instancetype)initWithSegmentTitles:(NSArray *)segTitles segImages:(NSArray *)segImages;

/**
 *  通过block进行回调
 */
@property(nonatomic, copy) SegmentBlock segblock;
/**
 *  显示底部的活动栏
 */
@property(nonatomic, assign) BOOL showScrollBar;

@end
