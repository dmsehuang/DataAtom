//
//  PDFView.h
//  DataAtoms
//
//  Created by huijinghuang on 4/5/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFView : UIView <UIScrollViewDelegate>

@property (nonatomic) CGPDFPageRef pdfPage;

@end
