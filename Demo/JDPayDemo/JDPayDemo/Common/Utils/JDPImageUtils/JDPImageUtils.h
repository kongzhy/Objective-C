//
//  JDPImageUtils.h
//  JDPayDemo
//
//  Created by 孔朝阳 on 2017/3/29.
//  Copyright © 2017年 JDJR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDPImageUtils : NSObject



/**
 图片数据的第一个字节是固定的,一种类型的图片第一个字节就是它的标识

 @param data 图像
 @return 返回图像的实际类型后缀
 */
+ (NSString *)contentTypeForImageData:(NSData *)data;
@end
