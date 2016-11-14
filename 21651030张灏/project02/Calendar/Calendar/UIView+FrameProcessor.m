//
//  UIView+FrameProcessor.m
//  京东金融（仿）
//
//  Created by zhang on 16/11/1.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "UIView+FrameProcessor.h"

@implementation UIView (FrameProcessor)

- (void)setCenterX:(CGFloat)centerX
{
	CGPoint newCenter = self.center;
	newCenter.x = centerX;
	self.center = newCenter;
}

- (CGFloat)centerX
{
	return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
	CGPoint newCenter = self.center;
	newCenter.y = centerY;
	self.center = newCenter;
}

- (CGFloat)centerY
{
	return self.center.y;
}

- (void)setSize:(CGSize)size
{
	CGRect newBounds = self.bounds;
	newBounds.size = size;
	self.bounds = newBounds;
}

- (CGSize)size
{
	return self.bounds.size;
}

- (void)setX:(CGFloat)x
{
	CGRect newFrame = self.frame;
	newFrame.origin.x = x;
	self.frame = newFrame;
}

- (CGFloat)x
{
	return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
	CGRect newFrame = self.frame;
	newFrame.origin.y = y;
	self.frame = newFrame;
}

- (CGFloat)y
{
	return self.frame.origin.y;
}

- (CGPoint)origin
{
	return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
	CGRect newFrame = self.frame;
	newFrame.origin = origin;
	self.frame = newFrame;
}

@end
