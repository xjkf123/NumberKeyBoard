//
//  XFG_KeyBoard.h
//  InitKeyBoard_dome
//
//  Created by lf on 16/4/12.
//  Copyright (c) 2016年 lf. All rights reserved.
//

#import <UIKit/UIKit.h>

//创建自定义键盘协议
@protocol XFG_KeyBoardDelegate <NSObject>
//创建协议方法
@required//必须执行的方法
- (void)numberKeyBoard:(NSInteger) number;
- (void)cancelKeyBoard;
- (void)finishKeyBoard;
- (void)periodKeyBoard;
- (void)changeKeyBoard;
@optional//不必须执行方法

@end


@interface XFG_KeyBoard : UIView
{
    @private//私有的协议方法
    id<XFG_KeyBoardDelegate> _delegate;
}

@property (nonatomic, strong) id<XFG_KeyBoardDelegate> delegate;

- (id)initWithNumber:(NSNumber *)number;
@end
