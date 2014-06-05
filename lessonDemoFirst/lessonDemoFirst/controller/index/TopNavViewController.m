//
//  TopNavViewController.m
//  lessonTest
//
//  Created by sky on 14-5-22.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "TopNavViewController.h"
#import "GuideViewController.h"
#import "ListViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TopNavViewController ()

@end

@implementation TopNavViewController

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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self reloadTitleView:@[@"要闻",@"浙江",@"娱乐",@"体育",@"财经",@"科技",@"房产",@"汽车",@"游戏"]];
    ListViewController *listVC=[[ListViewController alloc] initWithNibName:@"ListViewController" bundle:nil];
    [self addChildViewController:listVC];
    [contentScrollView_ addSubview:listVC.view];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)reloadTitleView:(NSArray *)titles{
    for(id subview in titleScrollView_.subviews){
        [subview removeFromSuperview];
    }

    if(!titleSelectBg_){
        titleSelectBg_=[[UIView alloc] initWithFrame:CGRectMake(5, 0, 70, 40)];
        titleSelectBg_.backgroundColor=[[UIColor blueColor] colorWithAlphaComponent:.3];
        titleSelectBg_.layer.cornerRadius=6.0;
        [titleScrollView_ insertSubview:titleSelectBg_ atIndex:0];
    }
//    UIButton *lastBtn;
    CGFloat totalWidth=10;
    titleScrollView_.contentSize=CGSizeMake(70*[titles count], 40);
    for(int i=0;i<[titles count];i++){
        NSString *title=titles[i];
        UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(totalWidth, 5, 60, 30)];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        [btn setTitleColor:[[UIColor blueColor] colorWithAlphaComponent:.7] forState:UIControlStateSelected];
        btn.tag=i;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(didTitleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleScrollView_ addSubview:btn];
        totalWidth+=70;
        
//        UIButton *btn=[[UIButton alloc] init];
//        [titleScrollView_ addSubview:btn];
//        btn.translatesAutoresizingMaskIntoConstraints=NO;
//        [btn setTitle:title forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[[UIColor blueColor] colorWithAlphaComponent:.7] forState:UIControlStateSelected];
//        btn.tag=i;
//        [btn setTitle:title forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(didTitleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        if(!lastBtn){
//            [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[btn]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(btn)]];
//            [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[btn(==30)]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(btn)]];
//        }else{
//            [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lastBtn]-10-[btn(==lastBtn)]" options:NSLayoutFormatAlignAllTop metrics:0 views:NSDictionaryOfVariableBindings(lastBtn,btn)]];
//            [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[btn(==lastBtn)]" options:0 metrics:0 views:NSDictionaryOfVariableBindings(lastBtn,btn)]];
//        }
//        lastBtn=btn;
    }
//    if(lastBtn){
//        [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lastBtn]-10-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(lastBtn)]];
//        [titleScrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lastBtn]-5-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(lastBtn)]];
//    }
}

-(void)didTitleBtnClick:(UIButton *)sender{
    for(id subview in titleScrollView_.subviews){
        if([subview isKindOfClass:[UIButton class]]){
            [(UIButton *)subview setSelected:NO];
        }
    }
    sender.selected=YES;
    [UIView animateWithDuration:.3 animations:^{
        titleSelectBg_.center=sender.center;
        titleScrollView_.contentOffset=CGPointMake(MIN(MAX(0, sender.center.x-titleScrollView_.frame.size.width/2), MAX(0, titleScrollView_.contentSize.width-titleScrollView_.frame.size.width)) , 0);
    }];
}

@end
