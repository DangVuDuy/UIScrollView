//
//  TabToZoom.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/25/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "TabToZoom.h"
#define ZOOM_STEP 1.5

@interface TabToZoom () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) UIScrollView* scrollview;
@property (weak, nonatomic) UIImageView* photo;
@property (weak, nonatomic) UILabel* scalelabel;

@end

@implementation TabToZoom

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //Init scrollview
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollview.delegate = self;
    scrollview.minimumZoomScale = 1.0;
    scrollview.maximumZoomScale = 10;
    scrollview.zoomScale = 1.0;
    scrollview.clipsToBounds = YES;
    
    UIImageView* photo = [[UIImageView alloc] initWithFrame:scrollview.bounds];
    photo.image = [UIImage imageNamed:@"playboy.jpg"];
    photo.contentMode = UIViewContentModeScaleAspectFill;
    //lenh hung su kien khi nguoi dung tab vao photo
    
    photo.userInteractionEnabled = YES;
    photo.multipleTouchEnabled = YES;
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(Ontap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate =self;
    [photo addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(OnDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate =self;
    [photo addGestureRecognizer:doubleTap];
    
    //Neu ko co lenh nay thi singletap se nhan roi sau do doubletap cung nhan
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [scrollview addSubview:photo];
    [self.view addSubview:scrollview];
    
    //Sau khi scrollview, photo duoc gan vao view cha, co con tro strong thi chung ta moi gan vao weak property
    self.scrollview = scrollview;
    self.photo = photo;
    
    UILabel* scalelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    scalelabel.textAlignment = NSTextAlignmentRight;
    scalelabel.text = [NSString stringWithFormat:@"%2.2f", scrollview.zoomScale];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:scalelabel];
    
    [self.navigationItem setRightBarButtonItem:barButton];
    self.scalelabel = scalelabel;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photo;
}

- (void) Ontap: (UITapGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo];
    float newScale = self.scrollview.zoomScale * ZOOM_STEP;
    [self zoomRectForScale:newScale
                withCenter:tapPoint];
}

- (void) OnDoubleTap: (UITapGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo];
    float newScale = self.scrollview.zoomScale / ZOOM_STEP;
    [self zoomRectForScale:newScale
                withCenter:tapPoint];
}

- (void)zoomRectForScale:(float)scale
              withCenter:(CGPoint)center {
    CGRect zoomRect;
    CGSize scrollViewSize = self.scrollview.bounds.size;
    zoomRect.size.height = scrollViewSize.height / scale;
    zoomRect.size.width  = scrollViewSize.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    [self.scrollview zoomToRect:zoomRect
                       animated:YES];
    
    self.scalelabel.text = [NSString stringWithFormat:@"%2.2f", self.scrollview.zoomScale];
    
}
@end

