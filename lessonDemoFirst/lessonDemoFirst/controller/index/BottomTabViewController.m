//
//  BottomTabViewController.m
//  lessonDemoFirst
//
//  Created by sky on 14-6-3.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "BottomTabViewController.h"


@interface BottomTabViewController ()

@end

@implementation BottomTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(!guideVC_){
        guideVC_=[[GuideViewController alloc] initWithNibName:@"GuideViewController" bundle:nil];
        [self addChildViewController:guideVC_];
        [self.view addSubview:guideVC_.view];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *newsBtn=[[UIButton alloc] initWithTitle:@"新闻" icon:@"btn_news"];
    UIButton *readBtn=[[UIButton alloc] initWithTitle:@"订阅" icon:@"btn_read"];
    UIButton *imageBtn=[[UIButton alloc] initWithTitle:@"图片" icon:@"btn_image"];
    UIButton *videoBtn=[[UIButton alloc] initWithTitle:@"视频" icon:@"btn_video"];
    self.tabBarBtnArray=[@[newsBtn,readBtn,imageBtn,videoBtn] mutableCopy];
    
    TopNavViewController *topNav=[[TopNavViewController alloc] initWithNibName:@"TopNavViewController" bundle:nil];
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:topNav];
    self.viewControllers=@[nav];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
