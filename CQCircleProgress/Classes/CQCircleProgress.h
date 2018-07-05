//
//  CQCircleProgress.h
//  CQCircleProgress
//
//  Created by steve on 20/06/2018.
//

#import <UIKit/UIKit.h>

@interface CQCircleProgress : UIView

@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, strong) UIColor *trackColor;

@property (nonatomic, strong) UIColor *progressColor;

@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithFrame:(CGRect)frame trackColor: (UIColor *)trackColor progressColor: (UIColor *)progressColor lineWidth: (CGFloat)lineWidth;

@end
