//
//  TestTableViewController.h
//  lessonTest
//
//  Created by sky on 14-5-25.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *dataSource_;
}

@property(nonatomic,assign) IBOutlet UITableView *tableview;

@end
