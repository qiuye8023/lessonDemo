//
//  ActionSheetViewController.m
//  lessonTest
//
//  Created by sky on 14-5-25.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "ActionSheetViewController.h"

@interface ActionSheetViewController ()

@end

@implementation ActionSheetViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    [btn setTitle:[actionSheet buttonTitleAtIndex:buttonIndex] forState:UIControlStateNormal];
}

-(IBAction)didBtnClick:(id)sender{
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"菜单" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"菜单1",@"菜单2", nil];
    [sheet showInView:sender];
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
