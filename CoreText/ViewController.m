//
//  ViewController.m
//  CoreText
//
//  Created by maoziyue on 2017/9/21.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParser.h"
#import "CTFrameParserConfig.h"
#import "CoreTextLinkData.h"

@interface ViewController ()

@property (nonatomic,strong)CTDisplayView *ctView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"mao";
    
    
    
    
    [self setupUserInterface];
    [self setupNotifications];
    
    
}

- (void)setupUserInterface
{
    self.ctView = [[CTDisplayView alloc]initWithFrame:CGRectMake(20, 100, self.view.width - 40, 0)];
    [self.view addSubview:self.ctView];
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = self.ctView.width;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor whiteColor];
}

- (void)setupNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePressed:)
                                                 name:CTDisplayViewImagePressedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(linkPressed:)
                                                 name:CTDisplayViewLinkPressedNotification object:nil];
    
}





- (void)imagePressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
    CoreTextImageData *imageData = userInfo[@"imageData"];
    
    NSLog(@"-----点击图片------");
    
    //ImageViewController *vc = [[ImageViewController alloc] init];
    //vc.image = [UIImage imageNamed:imageData.name];
    //[self presentViewController:vc animated:YES completion:nil];
}

- (void)linkPressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
    CoreTextLinkData *linkData = userInfo[@"linkData"];
    
    NSLog(@"-----点击链接------");
    
//    WebContentViewController *vc = [[WebContentViewController alloc] init];
//    vc.urlTitle = linkData.title;
//    vc.url = linkData.url;
//    [self presentViewController:vc animated:YES completion:nil];
}







@end











