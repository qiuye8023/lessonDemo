//
//  TopNavViewController.h
//  lessonTest
//
//  Created by sky on 14-5-22.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideViewController.h"
#import "BaseTabbarController.h"

@interface TopNavViewController : UIViewController{
    IBOutlet UIScrollView *titleScrollView_;
    IBOutlet UIScrollView *contentScrollView_;
    UIView *titleSelectBg_;
}

@end
