//
//  ViewController.m
//  DataAtoms
//
//  Created by huijinghuang on 4/4/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import "ViewController.h"
#import "PDFModelController.h"
#import "PDFScrollViewController.h"

@interface ViewController ()
// model controller is a private property and it's read only
// readonly means compiler will only synthesize getter method
@property (readonly, strong, nonatomic) PDFModelController* pdfModelController;

@end

@implementation ViewController

// this is required
@synthesize pdfModelController = _pdfModelController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    // init page view controller
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self.pdfModelController;
    
    // set the first page of page view controller
    PDFScrollViewController* pdfScrollViewController = [self.pdfModelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[pdfScrollViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // add it to child view controller
    [self addChildViewController:self.pageViewController];
    
    // set the view of UIPageViewController and add it to subview
    CGRect pageViewFrame = CGRectMake(0, self.view.bounds.size.height/2,
                                      self.view.bounds.size.width, self.view.bounds.size.height/2);
    //CGRect pageViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.pageViewController.view.frame = pageViewFrame;
    [self.view addSubview:self.pageViewController.view];
    
    //[self.pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(PDFModelController *)pdfModelController {
    // lazy instantiation for model controller
    if (!_pdfModelController) {
        _pdfModelController = [[PDFModelController alloc] init];
    }
    return _pdfModelController;
}


@end
