//
//  ScrollViewCode.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/23/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "ScrollViewCode.h"

@interface ScrollViewCode () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollview;

@end

@implementation ScrollViewCode
{
    UIImageView* photo;
    UILabel* zoomscale;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cosmos02"]];
    [self.scrollview addSubview:photo];
    self.scrollview.delegate = self;
    self.scrollview.minimumZoomScale = 0.2;
    self.scrollview.maximumZoomScale = 4;
    self.scrollview.zoomScale = 0.2;
    
    [self.view addSubview:self.scrollview];
    zoomscale = [[UILabel alloc] initWithFrame:CGRectMake(0,0,40,20)];
    [self.scrollview addSubview:zoomscale];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:zoomscale];
    
    self.navigationItem.rightBarButtonItem = backButton;
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSString* string = [NSString stringWithFormat:@"%2.2f", self.scrollview.zoomScale];
    zoomscale.text = string;
    
}

@end
