//
//  UIImageView+loadImage.m
//  YuLin
//
//  Created by 处光夫 on 2018/12/7.
//  Copyright © 2018 zhishi. All rights reserved.
//

#import "UIImageView+loadImage.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <YYKit.h>
#import <SDWebImage/SDImageCache.h>

@implementation UIImageView (loadImage)

-(void)yulin_setImageWithUrl:(NSURL *)url
                      radius:(CGFloat)radius {
    [self yulin_setImageWithUrl:url
               placeholderImage:nil
                         radius:radius];
}

-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius {
    [self yulin_setImageWithUrl:url
               placeholderImage:placeholderImage
                         radius:radius
                    borderWidth:0
                    borderColor:nil];
}

-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor {
    [self yulin_setImageWithUrl:url
               placeholderImage:placeholderImage
                         radius:radius
                        corners:UIRectCornerAllCorners
                    borderWidth:borderWidth
                    borderColor:borderColor
                 borderLineJoin:kCGLineJoinRound];
}

-(void)yulin_setImageWithUrl:(NSURL *)url
            placeholderImage:(NSString *)placeholderImage
                      radius:(CGFloat)radius
                     corners:(UIRectCorner)corners
                 borderWidth:(CGFloat)borderWidth
                 borderColor:(UIColor *)borderColor
              borderLineJoin:(CGLineJoin)borderLineJoin {
    if (radius != 0) {
        NSString *cacheUrlStr = [url.absoluteString stringByAppendingString:@"radiusCache"];
        UIImage *cacheMemoryImage = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:cacheUrlStr];
        if (cacheMemoryImage) {
            //如果该图片缓存到了内存中则直接干掉
            [[SDImageCache sharedImageCache] removeImageForKey:cacheUrlStr fromDisk:NO withCompletion:nil];
            [self setRadiusImageFromDiskWithUrl:url placeholderImage:placeholderImage radius:radius corners:corners borderWidth:borderWidth borderColor:borderColor borderLineJoin:borderLineJoin];
        }else {
            [self setRadiusImageFromDiskWithUrl:url placeholderImage:placeholderImage radius:radius corners:corners borderWidth:borderWidth borderColor:borderColor borderLineJoin:borderLineJoin];
        }
    }else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeholderImage]];
    }
}

-(void)setRadiusImageFromDiskWithUrl:(NSURL *)url
                    placeholderImage:(NSString *)placeholderImage
                              radius:(CGFloat)radius
                             corners:(UIRectCorner)corners
                         borderWidth:(CGFloat)borderWidth
                         borderColor:(UIColor *)borderColor
                      borderLineJoin:(CGLineJoin)borderLineJoin {
    NSString *cacheUrlStr = [url.absoluteString stringByAppendingString:@"radiusCache"];
    //从磁盘缓存中取出图片
    UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheUrlStr];
    if (cacheImage) {
        self.image = cacheImage;
    }else {
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:placeholderImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (!error) {
                //头像需要手动缓存处理成圆角的图片
                UIImage *radiusImage = [image imageByRoundCornerRadius:image.size.width * (radius / self.size.width) corners:corners borderWidth:borderWidth borderColor:borderColor borderLineJoin:borderLineJoin];
                self.image = radiusImage;
                [[SDImageCache sharedImageCache] storeImage:radiusImage forKey:cacheUrlStr completion:nil];
                //清除原有非圆角图片缓存
                [[SDImageCache sharedImageCache] removeImageForKey:url.absoluteString withCompletion:nil];
            }
        }];
    }
}

@end
