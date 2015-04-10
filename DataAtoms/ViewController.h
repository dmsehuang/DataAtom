//
//  ViewController.h
//  DataAtoms
//
//  Created by huijinghuang on 4/4/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController* pageViewController;

@property (strong, nonatomic) UIButton* lockBtn;

@end

