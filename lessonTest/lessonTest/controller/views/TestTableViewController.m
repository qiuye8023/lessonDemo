//
//  TestTableViewController.m
//  lessonTest
//
//  Created by sky on 14-5-25.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "TestTableViewController.h"
#import "ViewController.h"
#import "DbTestViewController.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

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

    self.title=@"表格";
    dataSource_=[@[@"数据1",@"数据2",@"数据3",@"数据1",@"数据2",@"数据3",@"数据1",@"数据2",@"数据3",@"数据1",@"数据2",@"数据3",@"数据1",@"数据2",@"数据3"] mutableCopy];
    [_tableview setEditing:YES];
    _tableview.allowsMultipleSelection=YES;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//tableView向我们请求，Section中有几条数据
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource_ count];
}

//tableView向我们请求，IndexPath（section，row），第indexPath.row行的单元格是什么样子的
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"请求第%d行单元格样式",indexPath.row);
    NSString *str=dataSource_[indexPath.row];
//    [dataSource_ objectAtIndex:indexPath.row];
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"lesson"];
    
    if(!cell){
        NSLog(@"生成第%d行单元格",indexPath.row);
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lesson"];
    }else{
        NSLog(@"第%d行使用重用单元格",indexPath.row);
    }
    
    cell.textLabel.text=str;
    
//    UITableViewCell *cell=[[UITableViewCell alloc] init];
//    cell.textLabel.text=str;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
//    label.backgroundColor=[UIColor greenColor];
//    label.text=@"表头";
//    return label;
    UIImageView *image=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    image.frame=CGRectMake(0, 0, 320, 40);
    
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [btn addTarget:self action:@selector(didHeaderBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor=[UIColor greenColor];
    return btn;
}

-(void)didHeaderBtnClick:(id)sender{
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"点击了表头" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    
//}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [dataSource_ removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        return NO;
    }
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *str=dataSource_[indexPath.row];
//    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"你选择的是：%@",str] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alert show];
    DbTestViewController *vc=[[DbTestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - 修改表格
-(IBAction)didChangeBtnClick:(id)sender{
    dataSource_=@[@"修改数据1",@"修改数据2",@"修改数据3",@"修改数据4"];
    [_tableview reloadData];
}

-(IBAction)didEditBtnClick:(id)sender{
    _tableview.editing=!_tableview.editing;
}

@end
