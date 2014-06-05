//
//  TestViewController.m
//  lessonTest
//
//  Created by sky on 14-5-18.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController
@synthesize delegate;

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
    UIButton *btn=[[UIButton alloc] init];
    btn.frame=CGRectMake(0, 0, 100, 100);
    btn.backgroundColor=[UIColor greenColor];
    [btn addTarget:self action:@selector(didBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view from its nib.
}

-(void)didBtnClick{
    if(delegate && [delegate respondsToSelector:@selector(viewControllerShouldTableViewClicked:)]){
        if([delegate viewControllerShouldTableViewClicked:self]){
            if(delegate && [delegate respondsToSelector:@selector(viewControllerDidTableViewClicked:)]){
                [delegate viewControllerDidTableViewClicked:self];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
