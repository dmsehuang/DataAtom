//
//  PDFModelController.h
//  DataAtoms
//
//  Created by huijinghuang on 4/4/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

// UIKit provide architecture of UIPageViewController
#import <UIKit/UIKit.h>
#import "PDFScrollViewController.h"

@interface PDFModelController : NSObject <UIPageViewControllerDataSource>

@property (nonatomic) CGPDFDocumentRef pdf;
@property (nonatomic) NSInteger numberOfPages;

-(PDFScrollViewController *)viewControllerAtIndex:(NSInteger)index storyboard:(UIStoryboard *)storyboard;
-(NSInteger)indexOfViewController:(PDFScrollViewController *)pdfScrollViewController;

@end
