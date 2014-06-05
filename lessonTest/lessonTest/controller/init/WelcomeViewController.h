//
//  WelcomeViewController.h
//  lessonTest
//
//  Created by sky on 14-5-20.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,UISearchBarDelegate>

@property(nonatomic,assign) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property(nonatomic,assign) IBOutlet UIButton *btn;
- (IBAction)didBtnClick:(id)sender;

@end
