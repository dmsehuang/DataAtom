//
//  PDFView.m
//  DataAtoms
//
//  Created by huijinghuang on 4/5/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import "PDFView.h"

@implementation PDFView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
// Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // transform the coordination system
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawPDFPage(context, self.pdfPage);
    CGContextRestoreGState(context);
}

@end
