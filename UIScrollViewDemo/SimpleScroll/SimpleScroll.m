//
//  SimpleScroll.m
//  UIScrollViewDemo
//
//  Created by Duy Dang on 12/25/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "SimpleScroll.h"
#define PHOTO_WITH 320
#define PHOTO_HEIGHT 480
#define NUM_PHOTO 6

@interface SimpleScroll () <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) UIPageControl* pageControl;

@end

@implementation SimpleScroll

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((size.width - PHOTO_WITH) * 0.5 , 0, PHOTO_WITH, PHOTO_HEIGHT)];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor grayColor];
    self.scrollView.contentSize = CGSizeMake(PHOTO_WITH * NUM_PHOTO, PHOTO_HEIGHT);
    self.scrollView.pagingEnabled = YES; // Giup tren man hinh luon la 1 anh va cac anh ko bi dinh' vao nhau
    
   
    for (int i = 0; i < NUM_PHOTO + 1; i++) {
        NSString *filename = [NSString stringWithFormat:@"%d.jpg",i];
        UIImage *image = [UIImage imageNamed:filename];
        UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
        imageview.frame = CGRectMake((i - 1) * PHOTO_WITH, 0, PHOTO_WITH, self.view.bounds.size.height  - 40 - 60);
        [self.scrollView addSubview:imageview];
    }
    
    [self.view addSubview:self.scrollView];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, size.height - 40 - 60, size.width, 40)];
    self.pageControl.backgroundColor = [UIColor lightGrayColor];
    self.pageControl.numberOfPages = NUM_PHOTO;
    [self.pageControl addTarget:self
                         action:@selector(OnpageChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
}
- (void)viewDidDisappear:(BOOL)animated{
// chu y phai co ham nay de prevent crash o ham scrollViewDidscroll khi Viewcontroler
// tra ve NavigationControler, luc nay 1 so su kien view scroll van gui ve viewcontroller
// trong khi Viewcontroller da la nil
    self.scrollView.delegate = nil;
}
- (void) OnpageChange:(id) sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * PHOTO_WITH, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //Chu y khi Viewcontroller pop tro ve NavigationController neu
    //UiscrollView van tiep tuc gui su kien scrollviewdidScroll thi ung dung se bi crash
    //can bat Product > Schemit > Edit Schemit > Enable Zombies object de xa dinh ham na gay error, doi tuong nao bi null khi co loi
   
   self.pageControl.currentPage = self.scrollView.contentOffset.x / PHOTO_WITH;

}

@end
