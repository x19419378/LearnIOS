//
//  ViewController.m
//  changeView
//
//  Created by 李华 on 15/6/17.
//  Copyright (c) 2015年 李华. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;

@end

@implementation ViewController


-(void)completeHandler:(BOOL*)b{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.image1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView transitionFromView:self.image1 toView:self.image2 duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished){
        NSLog(@"finish");
    }];
}
@end
