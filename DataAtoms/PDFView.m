//
//  PDFView.m
//  DataAtoms
//
//  Created by huijinghuang on 4/5/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import "PDFView.h"

@implementation PDFView

-(id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //NSLog(@"draw rect");
    // resize the pdf view
    CGRect pageRect = CGPDFPageGetBoxRect(self.pdfPage, kCGPDFMediaBox);
    CGFloat yScale = rect.size.height/pageRect.size.height;
    CGFloat xScale = rect.size.width/pageRect.size.width;
    CGFloat myScale = MAX(yScale, xScale);
    
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // transform the coordination system
    
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0 * myScale, -1.0 * myScale);
    
    CGContextDrawPDFPage(context, self.pdfPage);
    CGContextRestoreGState(context);
}

@end
