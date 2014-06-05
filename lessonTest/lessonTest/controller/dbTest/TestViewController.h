//
//  TestViewController.h
//  lessonTest
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestViewController;

@protocol TestViewControllerDelegate<NSObject>

-(BOOL)viewControllerShouldTableViewClicked:(TestViewController *)viewController;

-(void)viewControllerDidTableViewClicked:(TestViewController *)viewController;


@end


@interface TestViewController : UIViewController

@property(nonatomic,assign) id<TestViewControllerDelegate> delegate;


@end
