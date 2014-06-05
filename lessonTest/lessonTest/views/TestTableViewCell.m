//
//  TestTableViewCell.m
//  lessonTest
//
//  Created by sky on 14-5-24.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    if(!selected){
        self.backgroundView.backgroundColor=[UIColor whiteColor];
    }else{
        self.backgroundView.backgroundColor=[UIColor blackColor];
    }
    // Configure the view for the selected state
}

@end
