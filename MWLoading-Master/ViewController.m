//
//  ViewController.m
//  MWLoading-Master
//
//  Created by Sino on 16/5/19.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "ViewController.h"
#import "MWLoadingImagView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender {
    
    MWLoadingImagView *meView = [MWLoadingImagView instantiateFromNib];
    [meView show];
    
    double delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    
   
    [meView close];
    
    
}

@end
