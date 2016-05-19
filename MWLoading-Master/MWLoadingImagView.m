//
//  MWLoadingImagView.m
//  MWLoading-Master
//
//  Created by Sino on 16/5/19.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "MWLoadingImagView.h"

@interface MWLoadingImagView ()

@property (weak, nonatomic) IBOutlet UIView *mwView;
@property (weak, nonatomic) IBOutlet UIImageView *roto;

@property (weak, nonatomic) IBOutlet UIImageView *loading;

@end


@implementation MWLoadingImagView

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.frame =[UIScreen mainScreen].bounds;
    self.mwView.layer.cornerRadius = 15.0;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    [self setUpSubViews];
    
}

+ (MWLoadingImagView *)instantiateFromNib
{
    return [[[NSBundle mainBundle]loadNibNamed:@"MWLoadingImageView" owner:self options:nil]lastObject];
}

- (void)setUpSubViews
{

    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i=1 ; i< 10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [imageArray addObject:image];
    }
    self.roto.animationImages = [NSArray arrayWithArray:imageArray];
    _roto.animationDuration = 1.0;
    _roto.animationRepeatCount = -1;
    
    NSMutableArray *loadingArray = [NSMutableArray array];
    for (int i=1 ; i<6; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading0%d",i]];
        [loadingArray addObject:image];
    }
    
    self.loading.animationImages = [NSArray arrayWithArray:loadingArray];
    self.loading.animationDuration = 1.0;
    self.loading.animationRepeatCount = -1;
    
}
- (void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self.roto startAnimating];
    [self.loading startAnimating];
   
}

- (void)close
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
        } completion:^(BOOL finished) {
            [self.roto stopAnimating];
            [self.loading stopAnimating];
            [self removeFromSuperview];
        }];
    });
    
   
}

@end
