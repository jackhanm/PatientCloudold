//
//  ReadpaperdetailViewController.m
//  Cloudhospital
//
//  Created by yuhao on 16/4/5.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "ReadpaperdetailViewController.h"
#import "JKwebview.h"
@interface ReadpaperdetailViewController ()<UIWebViewDelegate>
@property (nonatomic, retain)UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain)  JKwebview *Webview;
@end

@implementation ReadpaperdetailViewController

//- (void)setUrl:(NSString *)url
//{
//    
//}
- (void)dealloc
{
      self.Webview.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.Webview = [[JKwebview alloc]initWithFrame:self.view.frame];
    
//    NSString *str = @"http://183.129.131.141:1003/externalinterface/viewexi?MODE=UL&TYPE=S&LID=1&LPW=1&AN=11802167";
    NSLog(@"%@",self.url);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    self.Webview.delegate = self;
    self.Webview.scalesPageToFit = YES;
    self.Webview.opaque = NO;
    [self.view addSubview:self.Webview];
    [self.Webview loadRequest:request];
    
    
    
    // Do any additional setup after loading the view.
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [self.activityIndicator setCenter:view.center];
    [self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [view addSubview:self.activityIndicator];
    
    [self.activityIndicator startAnimating];
    
    
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [self.activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    
    
   
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
