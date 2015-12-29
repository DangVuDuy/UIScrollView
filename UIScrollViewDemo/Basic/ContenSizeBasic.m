//
//  ContenSizeBasic.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/23/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "ContenSizeBasic.h"

@interface ContenSizeBasic ()
@property (nonatomic,strong) UIScrollView* scrollview;

@end

@implementation ContenSizeBasic {
    UIImageView* photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage* image = [UIImage imageNamed:@"people.jpg"];
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, self.view.bounds.size.width - 16, 300)];
    self.scrollview.backgroundColor = [UIColor grayColor];
    self.scrollview.contentSize = CGSizeMake(image.size.width, image.size.height);
    // Doi true ==> false khi scroll anh trong o contensize duoc tu dong tra ve duong bouns
    self.scrollview.bounces = true;
    // true ==> false hien thi vach. khi scroll
    // Horizontal : chieu ngang
    // Vertical : chieu thang dung
    self.scrollview.showsHorizontalScrollIndicator = true;
    self.scrollview.showsVerticalScrollIndicator = true;
  
      photo = [[UIImageView alloc] initWithImage:image];
    photo.frame = CGRectMake(0, 0, image.size.width, image.size.height);
     [self.scrollview addSubview:photo];
    [self.view addSubview:self.scrollview];
    
}

@end
