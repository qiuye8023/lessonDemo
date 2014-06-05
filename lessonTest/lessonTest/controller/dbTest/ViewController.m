//
//  ViewController.m
//  lessonTest
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "ViewController.h"
#import "DbTestViewController.h"
#import "TestTableViewCell.h"
#import "TestTableViewController.h"

#define kTableViewCellName @"UITableViewCell"

@interface ViewController ()

@end

@implementation ViewController
@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title=@"自定义表格";
    tableView_=[[UITableView alloc] initWithFrame:self.view.frame];
    tableView_.delegate=self;
    tableView_.dataSource=self;
    dataSource_=@[@"FMDB",@"bbb",@"ccc",@"FMDB",@"bbb",@"ccc",@"FMDB",@"bbb",@"ccc",@"FMDB",@"bbb",@"ccc",@"FMDB",@"bbb",@"ccc",@"FMDB",@"bbb",@"ccc"];
    [self.view addSubview:tableView_];
	// Do any additional setup after loading the view, typically from a nib.
    tableView_.allowsMultipleSelection=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *str=dataSource_[indexPath.row];
//    CGSize size=CGSizeMake(MAXFLOAT, 140);
//    CGRect rect=[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:@"Arial"} context:nil];
//    return rect.size.height;
    return 125;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource_ count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TestTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kTableViewCellName];
    if(cell==nil){
        cell=[[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:self options:nil][0];
        cell.contentView.backgroundColor=[UIColor clearColor];
    }
    cell.thumbImg.image=[UIImage imageNamed:@"1"];
    cell.titleLabel.text=[NSString stringWithFormat:@"title%d",indexPath.row];
    cell.contentLabel.text=[NSString stringWithFormat:@"content%d",indexPath.row];
    cell.detailText.text=[NSString stringWithFormat:@"detail%d",indexPath.row];
    cell.priceLabel.text=[NSString stringWithFormat:@"price%d",indexPath.row];
    cell.timeLabel.text=[NSString stringWithFormat:@"time%d",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            DbTestViewController *dbTestVC=[[DbTestViewController alloc] init];
            [self pushViewController:dbTestVC animated:YES];
            
        }
            break;
        case 1:{
            testVC_=[[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
            testVC_.delegate=self;
            [self.navigationController pushViewController:testVC_ animated:YES];
        }
        default:
            break;
    }
}

#pragma mark - 
-(BOOL)viewControllerShouldTableViewClicked:(TestViewController *)viewController{
    return YES;
}

-(void)viewControllerDidTableViewClicked:(TestViewController *)viewController{
    NSLog(@"click");
    
}

@end
