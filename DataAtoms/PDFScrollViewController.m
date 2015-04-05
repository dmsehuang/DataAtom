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
//    CGRect rect = CGRectMake(45, 45, 100, 100);
//    UILabel* label = [[UILabel alloc] initWithFrame:rect];
//    label.backgroundColor = [UIColor lightGrayColor];
//    label.text = [NSString stringWithFormat:@"Page #%ld", (long)self.pageNumber];
//    [self.view addSubview:label];
    self.pdfView = [[PDFView alloc] initWithFrame:self.view.frame];
    self.pdfView.pdfPage = self.pdfPage;
    [self.view addSubview:self.pdfView];
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
