//
//  PDFScrollViewController.m
//  DataAtoms
//
//  Created by huijinghuang on 4/5/15.
//  Copyright (c) 2015 huijinghuang. All rights reserved.
//

#import "PDFScrollViewController.h"
#import "PDFView.h"

@interface PDFScrollViewController ()

@end

@implementation PDFScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // construct uibutton
    self.penButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.penButton addTarget:self
                  action:@selector(penButtonClick)
        forControlEvents:UIControlEventTouchUpInside];
    [self.penButton setTitle:@"PEN" forState:UIControlStateNormal];
    self.penButton.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 45, 60);
    [self.view addSubview:self.penButton];
    
    // construct scroll view rect, add padding
    CGFloat x0 = self.view.frame.origin.x;
    CGFloat y0 = self.view.frame.origin.y;
    CGFloat dx = 50;
    CGFloat dy = 50;
    //CGFloat dx = self.view.frame.size.width/10;
    //CGFloat dy = self.view.frame.size.height/20;
    CGFloat x1 = x0 + dx;
    CGFloat y1 = y0 + dy;
    CGFloat lenx = self.view.frame.size.width - 2*dx;
    // hard code the height, half of the size. This is a bad code
    CGFloat leny = self.view.frame.size.height/2 - 2*dy;
    CGRect scrollRect = CGRectMake(x1, y1, lenx, leny);
    
    // init scroll view
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    CGRect pageRect = CGPDFPageGetBoxRect(self.pdfPage, kCGPDFMediaBox);
    self.scrollView.contentSize = pageRect.size;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 5.0;
    self.scrollView.delegate = self;
    
    // add a view as a subview of scroll view
    self.pdfView = [[PDFView alloc] initWithFrame:pageRect];
    self.pdfView.pdfPage = self.pdfPage;
    [self.scrollView addSubview:self.pdfView];
    [self.view addSubview:self.scrollView];
    //[self.view addSubview:self.pdfView];
}

-(void)penButtonClick {
    if (!self.penButton.isSelected) {
        [self.penButton setSelected:YES];
        self.scrollView.scrollEnabled = NO;
        
    } else {
        [self.penButton setSelected:NO];
        self.scrollView.scrollEnabled = YES;
    }
}

// scroll view delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.pdfView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
