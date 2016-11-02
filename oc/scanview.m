//
//  scanview.m
//  scan
//  Copyright © 2016年 lixin. All rights reserved.
//

#import "scanview.h"
@interface scanview()
@property(nonatomic,assign)NSInteger picname;
@end
@implementation scanview

-(instancetype)initWithFrame:(CGRect)frame{
  self =  [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.picname = 1;
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    NSString *str = [NSString stringWithFormat:@"%zi",_picname];
    UIImage *view = [UIImage imageNamed:str];
    [view drawInRect:self.bounds];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchpoint = [touch locationInView:self];
    if (touchpoint.x < self.bounds.size.width / 2.0) {
        _picname -= 1;
        if (_picname < 1) {
            _picname = 6;
        }
    }
    if (touchpoint.x > self.bounds.size.width / 2.0) {
        _picname += 1;
        if (_picname > 6) {
            
            _picname = 1;
        }
    }
    [self setNeedsDisplay];
}
@end
