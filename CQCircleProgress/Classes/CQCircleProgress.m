//
//  CQCircleProgress.m
//  CQCircleProgress
//
//  Created by steve on 20/06/2018.
//

#import "CQCircleProgress.h"

@interface CQCircleProgress()

@property (nonatomic, strong) CAShapeLayer *progessLayer;

@end

@implementation CQCircleProgress

- (instancetype)initWithFrame:(CGRect)frame trackColor: (UIColor *)trackColor progressColor: (UIColor *)progressColor lineWidth: (CGFloat)lineWidth {
    _trackColor = trackColor;
    _progressColor = progressColor;
    _lineWidth = lineWidth;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    CAShapeLayer *trackLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath addArcWithCenter:self.center radius:self.bounds.size.width startAngle:-0.5f*M_PI endAngle:1.5f * M_PI  clockwise:YES];
    trackLayer.path = bezierPath.CGPath;
    trackLayer.lineWidth = self.lineWidth ?: 10;
    trackLayer.strokeColor = (self.trackColor ?: [UIColor lightGrayColor]).CGColor;
    trackLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:trackLayer];

    self.progessLayer = [[CAShapeLayer alloc] init];
    self.progessLayer.path = bezierPath.CGPath;
    self.progessLayer.lineWidth = self.lineWidth ?: 10;
    self.progessLayer.lineCap = kCALineCapRound;
    self.progessLayer.strokeStart = 0;
    self.progessLayer.strokeEnd = 0;
    self.progessLayer.strokeColor = (self.progressColor ?: [UIColor redColor]).CGColor;
    self.progessLayer.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.progessLayer];
}

- (void)setProgress:(CGFloat)progress {
    self.progessLayer.strokeEnd = progress;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(self.progress ?: 0);
    animation.toValue = @(progress);
    animation.duration = 0.6f;
    [self.progessLayer addAnimation:animation forKey:@"drawLineAnimation"];
    _progress = progress;
}

@end
