//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"ScrollView", CLASS: @"ScrollViewCode"},
                                    @{TITLE: @"ScalelWithSlider", CLASS: @"ScaleWithSlider"},
                                    @{TITLE: @"ContentSizeBasic", CLASS: @"ContenSizeBasic"},
                                    @{TITLE: @"ContentSizeDemo", CLASS: @"ContenSizeDemo"},
                                    @{TITLE: @"TapToZoom", CLASS: @"TabToZoom"},
                                    @{TITLE: @"SimpleScroll", CLASS: @"SimpleScroll"}

                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Inter B", CLASS: @"InterB"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"UScrollView";
    mainScreen.about = @"This is demo UIScrollView";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
