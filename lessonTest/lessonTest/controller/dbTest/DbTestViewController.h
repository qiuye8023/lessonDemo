//
//  DbTestViewController.h
//  lessonTest
//
//  Created by sky on 14-5-17.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
#import "People.h"
#import "ViewController.h"

@interface DbTestViewController : UIViewController{
    ViewController *viewController;
}
@property(nonatomic,strong) FMDatabase *db;

@end
