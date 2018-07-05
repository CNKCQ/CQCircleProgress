//
//  CQViewController.m
//  CQCircleProgress
//
//  Created by cnkcq on 07/05/2018.
//  Copyright (c) 2018 cnkcq. All rights reserved.
//

#import "CQViewController.h"
#import <CQCircleProgress/CQCircleProgress.h>

@interface CQViewController (){
    CQCircleProgress *pieView;
}

@end

@implementation CQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    pieView = [[CQCircleProgress alloc] initWithFrame:CGRectMake(80, 150, 45, 45) trackColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.1] progressColor:[UIColor colorWithRed:114/255.0 green:188/255.0 blue:246/255.0 alpha:1] lineWidth:6];
    pieView.progress = 0.8;
    [self.view addSubview:pieView];
    
    UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(pieView.frame) + 200, 40, 24)];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    [plusButton setTitleColor:[UIColor colorWithRed:114/255.0 green:188/255.0 blue:246/255.0 alpha:1] forState:UIControlStateNormal];
    UIButton *reducButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50 - 40, CGRectGetMaxY(pieView.frame) + 200, 40, 24)];
    [reducButton setTitle:@"-" forState:UIControlStateNormal];
    [reducButton setTitleColor:[UIColor colorWithRed:114/255.0 green:188/255.0 blue:246/255.0 alpha:1] forState:UIControlStateNormal];
    [plusButton addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    [reducButton addTarget:self action:@selector(handle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plusButton];
    [self.view addSubview:reducButton];
}

- (void)handle: (UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"+"]) {
        pieView.progress = pieView.progress + 0.3;
    } else {
        pieView.progress = pieView.progress - 0.3;
    }
}


@end
