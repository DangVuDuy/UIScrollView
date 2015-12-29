//
//  ScaleWithSlider.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/23/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "ScaleWithSlider.h"

@interface ScaleWithSlider () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollview;


@end

@implementation ScaleWithSlider
{
    UIImageView* photo;
    UISlider* slider;
    UIToolbar* toobar;
    UILabel* zoomscale;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //add toolbar
    toobar = [UIToolbar new];
    [toobar sizeToFit ];
    slider = [[UISlider alloc] initWithFrame:CGRectMake(8, 0, self.view.bounds.size.width - 16, 40)];
    slider.minimumValue = 0.2;
    slider.maximumValue = 5.0;
    slider.value = slider.minimumValue;
    [slider addTarget:self
               action:@selector(OnSliderchange:)
     forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toobar.items = @[barButton];
    toobar.frame = CGRectMake(0, self.view.bounds.size.height - toobar.bounds.size.height, toobar.bounds.size.width, toobar.bounds.size.height);
    [self.view addSubview:toobar];
    
    CGRect scrollRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - toobar.bounds.size.height);
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:scrollRect];
    photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Cosmos02"]];
    [self.scrollview addSubview:photo];
    self.scrollview.delegate = self;
    self.scrollview.minimumZoomScale = slider.minimumValue;
    self.scrollview.maximumZoomScale = slider.maximumValue;
    self.scrollview.zoomScale = slider.value;
    
    [self.view addSubview:self.scrollview];
    zoomscale = [[UILabel alloc] initWithFrame:CGRectMake(0,0,40,20)];
    [self.scrollview addSubview:zoomscale];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:zoomscale];
    
    self.navigationItem.rightBarButtonItem = backButton;
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}
- (void) OnSliderchange: (UISlider*) sender {
    [self.scrollview setZoomScale:sender.value animated:true];
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSString* string = [NSString stringWithFormat:@"%2.2f", self.scrollview.zoomScale];
    zoomscale.text = string;
    slider.value = self.scrollview.zoomScale;
    
    
}

@end