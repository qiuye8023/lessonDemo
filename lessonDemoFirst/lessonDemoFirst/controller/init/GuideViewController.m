//
//  GuideViewController.m
//  lessonTest
//
//  Created by sky on 14-5-22.
//  Copyright (c) 2014年 com.grassinfo. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseService.h"
#import "UIImageView+WebCache.h"
#import "TopNavViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GuideViewController ()

@end

@implementation GuideViewController

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
    [self requestImages];
    
//    UIView *view=[[UIView alloc] init];
    
//    UITapGestureRecognizer *tap;
//    UISwipeGestureRecognizer *swipe;
//    UIPinchGestureRecognizer *pinch;
//    UIRotationGestureRecognizer *rotate;
//    UIPanGestureRecognizer *pan;
//    
//    [view addGestureRecognizer:tap];
//    [view addGestureRecognizer:swipe];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)dealloc{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    pageControl_.currentPage=scrollView_.contentOffset.x/scrollView_.frame.size.width;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%f",(pageControl_.numberOfPages+1/5.0)*scrollView.frame.size.width);
    if(scrollView.contentOffset.x>(pageControl_.numberOfPages-1+1/5.0)*scrollView.frame.size.width){
        [UIView animateWithDuration:.5 animations:^{
            self.view.alpha=0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }];
    }
}

#pragma mark - 
-(void)requestImages{
    [self reloadImages:@[@"0.png",@"0.png",@"0.png"]];
//    BaseService *base=[[BaseService alloc] init];
//    base.url=@"www.baidu.com";
//    [base requestWithCompletionHandler:^(NSString *responseStr, NSURLResponse *response, NSError *error) {
//        [self reloadImages:@[@"http://img4.duitang.com/uploads/item/201306/21/20130621084728_a23Bu.jpeg",@"2.png",@"3.png"]];
//    }];
//    [base addObserver:self forKeyPath:@"url" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    base.url=@"123";
//    [base removeObserver:self forKeyPath:@"url"];

}

-(void)reloadImages:(NSArray *)imagePaths{
    for(id subview in scrollView_.subviews){
        [subview removeFromSuperview];
    }
    pageControl_.numberOfPages=imagePaths.count;
    scrollView_.contentSize=CGSizeMake(scrollView_.frame.size.width*[imagePaths count], scrollView_.frame.size.height);
    UIImageView *lastImageView=nil;
    scrollView_.translatesAutoresizingMaskIntoConstraints = NO;
    for(int i=0;i<[imagePaths count];i++){
//        UIImageView *imageView=[[UIImageView alloc] initWithFrame:scrollView_.frame];
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.translatesAutoresizingMaskIntoConstraints=NO;
        [scrollView_ addSubview:imageView];
        if(!lastImageView){
            [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView(==scrollView_)]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(imageView,scrollView_)]];
            [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView(==scrollView_)]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(imageView,scrollView_)]];
        }else{
            [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[lastImageView][imageView(==scrollView_)]"
                                                                                options:NSLayoutFormatAlignAllTop
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(lastImageView,imageView,scrollView_)]];
            [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[imageView(==scrollView_)]"
                                                                                options:0
                                                                                metrics:nil
                                                                                  views:NSDictionaryOfVariableBindings(lastImageView,imageView,scrollView_)]];
        }
        
        imageView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.3];
//        imageView.center=CGPointMake(scrollView_.center.x+scrollView_.frame.size.width*i, scrollView_.center.y);
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [imageView setImageWithURL:imagePaths[i]];
        lastImageView=imageView;
    }
    if(lastImageView){
        [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lastImageView]|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:NSDictionaryOfVariableBindings(lastImageView,scrollView_)]];
        [scrollView_ addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lastImageView]|"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:NSDictionaryOfVariableBindings(lastImageView,scrollView_)]];

    }

}

@end
