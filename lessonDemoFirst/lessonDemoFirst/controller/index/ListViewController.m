//
//  ListViewController.m
//  lessonDemoFirst
//
//  Created by sky on 14-6-3.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "ListViewController.h"
#import "NewsInfo.h"
#import "NewsTableViewCell.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    news_=[NSMutableArray new];
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    news_=nil;
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate method
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsInfo *info=news_[indexPath.row];
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
    if(!cell){
        cell=(NewsTableViewCell *)[[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:self options:nil][0];
    }
    cell.titleLabel.text=info.title;
    cell.contentLabel.text=info.summary;
    cell.dateLabel.text=info.pubDate;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return news_?[news_ count]:0;
}


#pragma mark - 加载网络数据
-(void)requestNewsInfos{
    BaseService *base=[[BaseService alloc] init];
    //http://api.blbaidu.cn/API/News.ashx?pageSize=10&pageNo=2&cid=170
    base.url=@"http://api.blbaidu.cn/API/News.ashx?pageSize=10&pageNo=2&cid=170";
    [base requestWithCompletionHandler:^(NSString *responseStr, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDic=[responseStr objectFromJSONString];
        if(responseDic){
            NSArray *results=[responseDic objectForKey:@"result"];
            if(results){
                [news_ removeAllObjects];
                for(NSDictionary *newsDic in results){
                    NewsInfo *newsInfo=[[NewsInfo alloc] initWithDictionary:newsDic];
                    [news_ addObject:newsInfo];
                }
                [tableview_ reloadData];
            }
        }
    }];
}

@end
