//
//  ZHSegment.m
//  ZhenHao
//
//  Created by Apple on 15/10/10.
//  Copyright (c) 2015年 ShanDongSanMi. All rights reserved.
//

#import "ZHSegment.h"
#import "UIView+MJExtension.h"

@interface ZHSegment ()
/**
 *  保存按钮
 */
@property(nonatomic, strong)    NSMutableArray *segBtns;

/**
 *  标题与图片
 */
@property(nonatomic, strong)    NSArray *titlsArr;
@property(nonatomic, strong)    NSArray *imageArr;

/**
 *  边线
 */
@property(nonatomic, weak)      UIView *topLine;
@property(nonatomic, weak)      UIView *bottomLine;
@property(nonatomic, weak)      UIView *middleLine;


/**
 *  底部的滑动栏
 */
@property(nonatomic, weak) UIView *scrollBar;


@end


@implementation ZHSegment

- (instancetype)initWithSegmentTitles:(NSArray *)segTitles segImages:(NSArray *)segImages
{
    if (self = [super init]) {
        
        _titlsArr = segTitles;
        _imageArr = segImages;
        
        self.segBtns = [[NSMutableArray alloc] initWithCapacity:0];
        
        
        for(NSInteger i = 0; i < _titlsArr.count; i++)
        {
            NSString *title = _titlsArr[i];
            UIImage  *image = _imageArr[i];
            
            UIButton *segButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [segButton setTitle:title forState:UIControlStateNormal];
            segButton.titleLabel.font = [UIFont systemFontOfSize:14];
            [segButton setTitleColor:ZHColor(84, 84, 84) forState:UIControlStateNormal];
            [segButton setImage:image forState:UIControlStateNormal];
            [segButton addTarget:self action:@selector(segBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            segButton.tag = i;
            
            [self addSubview:segButton];
            [self.segBtns addObject:segButton];
        }
        
        
        self.topLine    = [self makeLineView];
        self.bottomLine = [self makeLineView];
//      self.middleLine = [self makeLineView];
        
        UIView * scrollBar = [[UIView alloc] init];
        scrollBar.backgroundColor = ZHColor(220, 42, 21);
        [self addSubview:scrollBar];
        self.scrollBar = scrollBar;
        
        
    }
    
    return self;
}

- (UIView *)makeLineView
{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:line];
    return line;
}

//block 回调处理
- (void)segBtnClicked:(UIButton *)segBtn
{

    if (self.scrollBar.superview) {
        [UIView animateWithDuration:0.2 animations:^{
            
            self.scrollBar.mj_x = segBtn.mj_x;
        }];
    }
    
    
    if (self.segblock) {
        
        self.segblock(segBtn.tag);
    
    }
    
    for(UIButton *button in self.segBtns)
    {
        if (button == segBtn) {
            [button setTitleColor:ZHColor(245, 85, 31) forState:UIControlStateNormal];
        }else
        {
            [button setTitleColor:ZHColor(84, 84, 84) forState:UIControlStateNormal];

        }
    }


}

- (void)layoutSubviews
{

    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    CGFloat buttonW = self.mj_width/self.segBtns.count;
    CGFloat buttonH = self.mj_height;
    
    for(NSInteger i = 0; i < self.segBtns.count; i++)
    {
        
        UIButton *segBtn = self.segBtns[i];
        CGFloat segBtnX = offsetX + i*(buttonW);
        CGFloat segBtnY = offsetY;
        
        segBtn.frame = CGRectMake(segBtnX, segBtnY, buttonW, buttonH);
        
    }
    
    
    self.topLine.frame = CGRectMake(0, 0,self.mj_width, 1);
    self.bottomLine.frame = CGRectMake(0, self.mj_height-1, self.mj_width, 1);
    self.middleLine.frame = CGRectMake(self.mj_width/2, 0, 1, self.mj_height);
    
    UIButton *firstButton = [self.segBtns firstObject];
    [firstButton setTitleColor:ZHColor(245, 85, 31) forState:UIControlStateNormal];

    if (self.showScrollBar) {
        self.scrollBar.frame = CGRectMake(0, self.mj_height-2, self.mj_width/2, 2);
    }
}



@end
