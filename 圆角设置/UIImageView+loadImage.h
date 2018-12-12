//
//  UIImageView+loadImage.h
//  YuLin
//
//  Created by 处光夫 on 2018/12/7.
//  Copyright © 2018 zhishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (loadImage)

/**
 加载一个带圆角的图片
 
 @param url 图片url
 @param radius 圆角大小
 */
-(void)yulin_setImageWithUrl:(NSURL *)url
                      radius:(CGFloat)radius;

/**
 加载一个带圆角的图片

 @param url 图片url
 @param placeholderImage 占位图
 @param radius 圆角大小
 */
-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius;

/**
 加载一个带圆角带边框的图片

 @param url 图片url
 @param placeholderImage 占位图
 @param radius 圆角大小
 @param borderWidth 边框粗细
 @param borderColor 边框颜色
 */
-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor;

/**
 加载一个带圆角带边框可设置圆角位置和类型的图片

 @param url 图片url
 @param placeholderImage 占位图
 @param radius 圆角大小
 @param corners 圆角位置
 @param borderWidth 边框粗细
 @param borderColor 边框颜色
 @param borderLineJoin 边框圆角类型(该类型为一枚举值 kCGLineJoinMiter-尖角，kCGLineJoinRound-圆角，kCGLineJoinBevel-斜角)
 */
-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius
                     corners:(UIRectCorner)corners
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
              borderLineJoin:(CGLineJoin)borderLineJoin;

@end
