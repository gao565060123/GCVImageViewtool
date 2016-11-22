//
//  UIImageViewTools.h
//  HCInvestment
//
//  Created by mybook on 16/3/14.
//  Copyright © 2016年 GC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageViewTools : UIImageView

/**
 *  淡入淡出
 *
 *  @param imgStr 占位
 *  @param urlStr 地址
 */
+ (void)loadImgWithPlaceholder:(UIImage *)placeImg url:(NSString *)urlStr imgView:(UIImageView *)imgView;

+ (UIImageView *)getImageLayerWithImageView:(UIImageView *)imageView BorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor  shadowRadius:(CGFloat)shadowRadius cornerRadius:(CGFloat)cornerRadius;



+(void)showImage:(UIImageView *)avatarImageView;

@end
