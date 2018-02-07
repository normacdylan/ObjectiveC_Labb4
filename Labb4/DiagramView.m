//
//  DiagramView.m
//  Labb4
//
//  Created by August Posner on 2018-02-07.
//  Copyright © 2018 August Posner. All rights reserved.
//

#import "DiagramView.h"

@implementation DiagramView
/*
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        self.data = @[@{@"name":@"USA", @"value":@50}, @{@"name":@"Canada", @"value":@40}];
    }
    return self;
}
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.data = @[@{@"name":@"USA", @"value":@50}, @{@"name":@"Canada", @"value":@40},
                      @{@"name":@"Sweden", @"value":@125}, @{@"name":@"Norway", @"value":@11}];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    float heightScale = [self highestValueFromData] > 0? rect.size.height / [self highestValueFromData] : 1;
    float barWidth = self.data.count > 0? rect.size.width / (self.data.count * 2) : 0;
    
    for (int i=0; i < self.data.count; i++) {
        float height = [[self.data[i] valueForKey:@"value"] floatValue] * heightScale;
        float x = barWidth * 2 * i;
        float y = rect.size.height - height;
        UIColor *barColor = i%2==0? [UIColor blueColor] : [UIColor greenColor];
        
        CGRect bar = CGRectMake(x, y, barWidth, height);
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:bar];
        [barColor setFill];
        [path fill];
    }
}

- (float) highestValueFromData {
    float highest = 0;
    for (int i=0; i < self.data.count; i++) {
        float curValue = [[self.data[i] valueForKey:@"value"] floatValue];
        if (curValue > highest)
            highest = curValue;
    }
    return highest;
}

@end
