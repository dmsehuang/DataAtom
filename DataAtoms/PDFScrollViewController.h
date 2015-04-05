//
//  PDFScrollViewController.h
//  DataAtoms
//
//  Created by huijinghuang on 4/5/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDFView;

@interface PDFScrollViewController : UIViewController

@property (strong, nonatomic) PDFView* pdfView;

@property (nonatomic) CGPDFPageRef pdfPage;
@property (nonatomic) NSInteger pageNumber;

@end