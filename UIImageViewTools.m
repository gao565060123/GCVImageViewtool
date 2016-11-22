//
//  UIImageViewTools.m
//  HCInvestment
//
//  Created by mybook on 16/3/14.
//  Copyright © 2016年 GC. All rights reserved.
//

#import "UIImageViewTools.h"

@implementation UIImageViewTools



/**
 *  淡入淡出  sdwebimage方法
 *
 *  @param imgStr 占位
 *  @param urlStr 地址
 */
+ (void)loadImgWithPlaceholder:(UIImage *)placeImg url:(NSString *)urlStr imgView:(UIImageView *)imgView
{
    [imgView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:placeImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error && !image)
        {
            return ;
        }
        else
        {
            
            if (cacheType == SDImageCacheTypeNone)
            {
                //下载的
                [UIView transitionWithView:imgView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    imgView.image = image;
                } completion:NULL];
            }
            else
            {
                //内存缓存中的
                imgView.image = image;
            }
            
        }
    }];
}

/*
 
 [iconView.layer setShouldRasterize:NO];
 // 设置边框颜色
 [iconView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
 // 设置边框宽度
 [iconView.layer setBorderWidth: 2.0];
 // 设置投影偏移量，CGSizeMake(x轴方向, y轴方向)
 [[iconView layer] setShadowOffset:CGSizeMake(1, 1)];
 // 设置投影颜色
 [[iconView layer] setShadowColor:[UIColor whiteColor].CGColor];
 // 设置投影半径
 [[iconView layer] setShadowRadius:65];
 // 设置透明度
 [[iconView layer] setShadowOpacity:1];
 // 当设置为YES时，超过边界的将被遮盖(隐藏)，经常与cornerRadius，属性使用。这样，圆角外的区域将被遮盖
 [iconView.layer setMasksToBounds:YES];
 // 设置圆角
 iconView.layer.cornerRadius = 65;

*/


+ (UIImageView *)getImageLayerWithImageView:(UIImageView *)imageView BorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowColor:(UIColor *)shadowColor  shadowRadius:(CGFloat)shadowRadius cornerRadius:(CGFloat)cornerRadius;
{
    [imageView.layer setShouldRasterize:NO];
    // 设置边框颜色
    [imageView.layer setBorderColor: [borderColor CGColor]];
    // 设置边框宽度
    [imageView.layer setBorderWidth: borderWidth];
    // 设置投影偏移量，CGSizeMake(x轴方向, y轴方向)
    [[imageView layer] setShadowOffset:CGSizeMake(1, 1)];
    // 设置投影颜色
    [[imageView layer] setShadowColor:[shadowColor CGColor]];
    // 设置投影半径
    [[imageView layer] setShadowRadius:shadowRadius];
    // 设置透明度
    [[imageView layer] setShadowOpacity:1];
    // 当设置为YES时，超过边界的将被遮盖(隐藏)，经常与cornerRadius，属性使用。这样，圆角外的区域将被遮盖
    [imageView.layer setMasksToBounds:YES];
    // 设置圆角
    imageView.layer.cornerRadius = cornerRadius;
    return imageView;
}






static CGRect oldframe;

+(void)showImage:(UIImageView *)avatarImageView{
    
    UIImage *image=avatarImageView.image;
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}

+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}



@end
