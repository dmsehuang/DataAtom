//
//  PDFModelController.m
//  DataAtoms
//
//  Created by huijinghuang on 4/4/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import "PDFModelController.h"

@implementation PDFModelController

-(id)init {
    self = [super init];
    if (self) {
        NSURL* pdfURL = [[NSBundle mainBundle] URLForResource:@"jack-ma.pdf" withExtension:nil];
        self.pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
        self.numberOfPages = CGPDFDocumentGetNumberOfPages(self.pdf);
    }
    return self;
}

-(PDFScrollViewController *)viewControllerAtIndex:(NSInteger)index storyboard:(UIStoryboard *)storyboard {
    PDFScrollViewController* pdfScrollViewController = [storyboard instantiateViewControllerWithIdentifier:@"PDFScrollViewController"];
    
    pdfScrollViewController.pageNumber = index + 1;
    pdfScrollViewController.pdfPage = CGPDFDocumentGetPage(self.pdf, index+1);
    pdfScrollViewController.view.layer.borderColor = [UIColor orangeColor].CGColor;
    pdfScrollViewController.view.layer.borderWidth = 5.0f;
    return pdfScrollViewController;
}

-(NSInteger)indexOfViewController:(PDFScrollViewController *)pdfScrollViewController {
    return pdfScrollViewController.pageNumber-1;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    //NSLog(@"before");
    NSInteger index = [self indexOfViewController:(PDFScrollViewController *)viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self viewControllerAtIndex:index-1 storyboard:viewController.storyboard];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    //NSLog(@"after");
    NSInteger index = [self indexOfViewController:(PDFScrollViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == self.numberOfPages) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
