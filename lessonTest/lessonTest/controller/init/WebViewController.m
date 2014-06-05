//
//  WebViewController.m
//  lessonTest
//
//  Created by sky on 14-5-24.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

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
//    NSString *urlStr=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"test.html"];
    NSString *urlStr=@"http://www.baidu.com";
    NSURL *url=[NSURL URLWithString:urlStr];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    [webView stringByEvaluatingJavaScriptFromString:@"show(111)"];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}

@end
