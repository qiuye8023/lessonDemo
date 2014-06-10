//
//  AnnouncementListViewController.m
//  lessonDemoSecond
//
//  Created by sky on 14-6-10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AnnouncementListViewController.h"
#import "NewsInfo.h"
#import "MBProgressHUD.h"
#import "NewsTableViewCell.h"

@interface AnnouncementListViewController ()

@end

@implementation AnnouncementListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        currentPage_=1;
    }
    return self;
}

- (void)viewDidLoad
{
    //初始化数据源
    announcements_=[NSMutableArray new];
    [super viewDidLoad];
    //网络加载第一页公告
    [self requestAnnouncementByPage:currentPage_];
    MJRefreshHeaderView *headerView=[[MJRefreshHeaderView alloc] initWithScrollView:tableView_ beginRefreshingBlock:^(MJRefreshBaseView *refreshView) {
        [announcements_ removeAllObjects];
        currentPage_=1;
        [self requestAnnouncementByPage:currentPage_];
    }];
    [tableView_ addSubview:headerView];
    MJRefreshFooterView *footerView=[[MJRefreshFooterView alloc] initWithScrollView:tableView_ beginRefreshingBlock:^(MJRefreshBaseView *refreshView) {
        [self requestAnnouncementByPage:++currentPage_];
    }];
    [tableView_ addSubview:footerView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestAnnouncementByPage:(NSInteger)page{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    BaseService *base=[[BaseService alloc] init];
    base.url=[NSString stringWithFormat:@"http://api.blbaidu.cn/API/News.ashx?cid=205&pageNo=%d",page];
    [base requestWithCompletionHandler:^(NSString *responseStr, NSURLResponse *response, NSError *error) {
        //解析json字符串
        if(responseStr){
            NSDictionary *responseDic=[responseStr objectFromJSONString];
            if(responseDic){
                NSArray *results=[responseDic objectForKey:@"result"];
                if(results){
                    for(NSDictionary *newsDic in results){
                        //组装对象
                        NewsInfo *newsInfo=[[NewsInfo alloc] initWithDictionary:newsDic];
                        [announcements_ addObject:newsInfo];
                    }
                    [tableView_ reloadData];
                }
            }
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark - UITableView delegate method
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsInfo *info=announcements_[indexPath.row];
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell"];
    if(!cell){
        cell=(NewsTableViewCell *)[[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell" owner:self options:nil][0];
    }
    cell.titleLabel.text=info.title;
    cell.contentLabel.text=info.summary;
    //日期格式转换
    NSDateFormatter *formatter=[NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    NSDate *date=[formatter dateFromString:info.pubDate];
    NSDateFormatter *strFormatter=[NSDateFormatter new];
    [strFormatter setDateFormat:@"MM-dd HH:mm"];
    cell.dateLabel.text=[strFormatter stringFromDate:date];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return announcements_?[announcements_ count]:0;
}


@end
