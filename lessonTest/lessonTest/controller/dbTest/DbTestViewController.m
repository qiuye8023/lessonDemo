//
//  DbTestViewController.m
//  lessonTest
//
//  Created by sky on 14-5-17.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "DbTestViewController.h"

@interface DbTestViewController ()

@end

@implementation DbTestViewController
@synthesize db;

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
//    [self creatDatabase];
//    [self creatTable];
//    NSString *str1;
//    NSMutableString *str=[[NSMutableString alloc] initWithString:@"1,2,3"];
    NSString *str=@"str";
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];
    void *buffer=malloc(4);
    People *people3=[[People alloc] init];
    people3.peopleID=2;
    People *people=[[People alloc] init];
    people.peopleID=1;
    people.name=@"name";
    people.age=20;
    [self insertPeople:people];
    NSArray *allPeoples=[self selectAllPeople];
    [self deletePeopleByID:((People *)allPeoples[0]).peopleID];
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

#pragma mark - 
-(NSString *)databaseFilePath
{
    
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [filePath objectAtIndex:0];
    NSLog(@"%@",filePath);
    NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"db.sqlite"];
    return dbFilePath;
    
}

-(void)creatDatabase
{
    db = [FMDatabase databaseWithPath:[self databaseFilePath]];
}

-(void)creatTable
{
    //先判断数据库是否存在，如果不存在，创建数据库
    if (!db) {
        [self creatDatabase];
    }
    //判断数据库是否已经打开，如果没有打开，提示失败
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    //为数据库设置缓存，提高查询效率
    [db setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![db tableExists:@"people"])
    {
        [db executeUpdate:@"CREATE TABLE people(people_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER) "];
        NSLog(@"创建完成");
    }
    
}

-(void)insertPeople:(People *)aPeople
{
    if (!db) {
        [self creatDatabase];
    }
    
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    [db setShouldCacheStatements:YES];
    
    if(![db tableExists:@"people"])
    {
        [self creatTable];
    }
    //以上操作与创建表是做的判断逻辑相同
    //现在表中查询有没有相同的元素，如果有，做修改操作
    FMResultSet *rs = [db executeQuery:@"select * from people where people_id = ?",[NSString stringWithFormat:@"%d",aPeople.peopleID]];
    if([rs next])
    {
        [db executeUpdate:@"update people set name = ?, age = ? where people_id = 1",aPeople.name,[NSString stringWithFormat:@"%d",aPeople.age]];
    }
    //向数据库中插入一条数据
    else{
        [db executeUpdate:@"INSERT INTO people (name, age) VALUES (?,?)",aPeople.name,[NSString stringWithFormat:@"%d",aPeople.age]];
    }
    
    
}

-(void)deletePeopleByID:(int)ID
{
    if (!db) {
        [self creatDatabase];
    }
    
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    [db setShouldCacheStatements:YES];
    
    //判断表中是否有指定的数据， 如果没有则无删除的必要，直接return
    if(![db tableExists:@"people"])
    {
        return;
    }
    //删除操作
    [db executeUpdate:@"delete from people where people_id = ?", [NSString stringWithFormat:@"%d",ID]];
    
    [db close];
}

-(NSArray *)selectAllPeople
{
    
    if (!db) {
        [self creatDatabase];
    }
    
    if (![db open]) {
        NSLog(@"数据库打开失败");
        return nil;
    }
    
    [db setShouldCacheStatements:YES];
    
    if(![db tableExists:@"people"])
    {
        return nil;
    }
    
    //定义一个可变数组，用来存放查询的结果，返回给调用者
    NSMutableArray *peopleArray = [[NSMutableArray alloc] initWithArray:0];
    //定义一个结果集，存放查询的数据
    FMResultSet *rs = [db executeQuery:@"select * from people"];
    //判断结果集中是否有数据，如果有则取出数据
    while ([rs next]) {
        People *aPeople = [[People alloc] init];
        
        aPeople.peopleID = [rs intForColumn:@"people_id"];
        aPeople.name = [rs stringForColumn:@"name"];
        aPeople.age = [rs intForColumn:@"age"];
        //将查询到的数据放入数组中。 
        [peopleArray addObject:aPeople];
    }
    return peopleArray;
}



@end
