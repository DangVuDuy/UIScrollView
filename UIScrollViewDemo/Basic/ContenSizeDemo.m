//
//  ContenSizeDemo.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/24/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "ContenSizeDemo.h"

@interface ContenSizeDemo () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollview;
@end

@implementation ContenSizeDemo
{
    UIImageView* photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* image = [UIImage imageNamed:@"Girl"];
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - image.size.width) * 0.5,
                                                                     (self.view.bounds.size.height - 64 - image.size.height) * 0.5,
                                                                     image.size.width,
                                                                     image.size.height)];
    self.scrollview.backgroundColor = [UIColor grayColor];
    self.scrollview.delegate = self;
    self.scrollview.minimumZoomScale = 0.2;
    self.scrollview.maximumZoomScale = 4.0;
    self.scrollview.contentSize = CGSizeMake(image.size.width, image.size.height);
    //Thí nghiệm: bổ xung thêm contentOffset
    //self.scrollview.contentOffset = CGPointMake(-40, -40); //(Dua anh ra ngoai scroll)
    
    self.scrollview.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    //Thí nghiệm: bật tắt clipsToBounds rồi phóng to thu nhỏ ảnh con mèo. clipsToBounds = true --> Ảnh mèo to quá sẽ bị cắt
    self.scrollview.clipsToBounds = true;// cut lay hinh kich thuoc hinh anh
    
    //Thí nghiệm: chuyển bounces từ true sang false.
    self.scrollview.bounces = true;
    
    //Thí nghiệm:
    self.scrollview.showsHorizontalScrollIndicator = true;
    self.scrollview.showsVerticalScrollIndicator = true;
    
    
    photo = [[UIImageView alloc] initWithImage: image];
    photo.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [self.scrollview addSubview:photo];
    
    
    [self.view addSubview:self.scrollview];
}

@end
