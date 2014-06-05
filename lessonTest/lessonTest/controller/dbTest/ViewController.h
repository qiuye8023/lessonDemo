//
//  ViewController.h
//  lessonTest
//
//  Created by sky on 14-5-16.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestViewController.h"

@class People;
@protocol Test <NSObject>

@required

@end

@interface ViewController : UINavigationController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,TestViewControllerDelegate>{
    UITableView *tableView_;
    NSArray *dataSource_;
    People *people;
    TestViewController *testVC_;
}

@end
