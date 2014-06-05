//
//  WelcomeViewController.m
//  lessonTest
//
//  Created by sky on 14-5-20.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "WelcomeViewController.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
#import "BottomTabViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_backgroundView setImageWithURL:@"http://www.baidu.com/img/bdlogo.gif" finish:^(UIImage *image, NSError *error) {
        [UIView animateWithDuration:3 animations:^{
            _backgroundView.transform=CGAffineTransformMakeScale(2, 2);
            _backgroundView.alpha=0;
        } completion:^(BOOL finished) {
            [self toGuideViewController];
        }];
    }];
    
    [_btn.layer setCornerRadius:6];
    // Do any additional setup after loading the view from its nib.
}

-(void)didBtnClick:(id)sender{
    _label.text=@"hello world";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toGuideViewController{
    BottomTabViewController *bottomTabVC=[[BottomTabViewController alloc] init];
    [[UIApplication sharedApplication] keyWindow].rootViewController=bottomTabVC;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}

-(IBAction)didSegmentClick:(id)sender{
    UISegmentedControl *segment= (UISegmentedControl *)sender;
    NSLog(@"%d",segment.selectedSegmentIndex);
//    for(id subview in segment.subviews){
//        NSLog(@"%@",[subview class]);
//        for(id subview2 in [(UIView *)subview subviews]){
//            NSLog(@"%@",[subview2 class]);
//        }
//    }
//    [(UIImageView *)[segment.subviews[0] subviews][1] setImage:<#(UIImage *)#>];
}

@end
