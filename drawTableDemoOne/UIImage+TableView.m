//
//  UIImage+TableView.m
//  drawMyTableOne
//
//  Created by liuxq on 15-2-27.
//  Copyright (c) 2015年 liuxq. All rights reserved.
//

#import "UIImage+TableView.h"
#import "JSONKit.h"

@implementation UIImage (TableView)


-(instancetype)initWithParam:(CGFloat)width tableHeaderIdArray:(NSArray *)tableHeaderIdArray tableHeaderNameArray:(NSArray *)tableHeaderNameArray tableDataArray:(NSArray *)tableDataArray{
  /**
   *  设置文字大小
   */
  UIFont *font = [UIFont boldSystemFontOfSize:20.0];
  /**
   *  表头颜色
   */
  UIColor *titleColor = [UIColor colorWithRed:91 / 255.0 green:155 / 255.0 blue:213 / 255.0 alpha:1];
  /**
   *  奇数行背景色
   */
  UIColor *rowColor_1 = [UIColor colorWithRed:210 / 255.0 green:222 / 255.0 blue:239 / 255.0 alpha:1];
  /**
   *  偶数行背景色
   */
  UIColor *rowColor_2 = [UIColor colorWithRed:234 / 255.0 green:239 / 255.0 blue:247 / 255.0 alpha:1];
  /**
   *  列数
   */
  NSInteger collNum = tableHeaderIdArray.count;
  /**
   *  表格宽度
   */
  float tableWidth = width*2;
  /**
   *  列宽度
   */
  float collWidth = tableWidth / collNum;
  /**
   *  表头中文字的左右外边距
   */
  float marginLeftRight = 16;
  /**
   * 保存表格每一行的y位置
   */
  NSMutableArray *rowPositionYArray = [[NSMutableArray alloc] init];
  /**
   *  表格总高度
   */
  float tableHeight = 0;
  
  //计算表格每一行的y位置并保存
  {
    float biaoTouHeight = 0; //表头最大高度
    //获取表头最大高度
    float cellWidth = tableWidth / tableHeaderNameArray.count - marginLeftRight; //表格每列的宽度
    for (int i = 0; i < tableHeaderNameArray.count; i++) {
      CGSize stringSize = [tableHeaderNameArray[i] sizeWithFont:font
                                              constrainedToSize:CGSizeMake(cellWidth, 999)];
      float height = stringSize.height + 16; //上下留间距
      if (height > biaoTouHeight) {
        biaoTouHeight = height;
      }
    }
    //设置行最小高度
    if(biaoTouHeight<58){
      biaoTouHeight=58;
    }
    [rowPositionYArray addObject:[NSString stringWithFormat:@"%f", biaoTouHeight]];
    tableHeight = biaoTouHeight;
    
    //====获取表格每一行最大高度=====
    for (int index = 0; index < tableDataArray.count; index++) {
      
      if (index < tableDataArray.count) {
        //画表格内容
        NSDictionary *dic=[tableDataArray[index] objectFromJSONString];
        //计算每行最大高度
        float currentRowMaxHeight = 0.0;
        for (int num = 0; num < collNum; num++) {
          NSString *value = [NSString stringWithFormat:@"%@", [dic objectForKey:tableHeaderIdArray[num]]];
          NSAttributedString *attributedText =
          [[NSAttributedString alloc]
           initWithString:value
           attributes:@{
                        NSFontAttributeName : font
                        }];
          CGSize stringSize = [attributedText boundingRectWithSize:CGSizeMake(collWidth - marginLeftRight, 999)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                           context:nil].size; //自动计算Labele的
          float height = stringSize.height + 16;                               //上下留间距
          if (height > currentRowMaxHeight) {
            currentRowMaxHeight = height;
          }
        }
        //设置行最小高度
        if(currentRowMaxHeight<58){
          currentRowMaxHeight=58;
        }
        [rowPositionYArray addObject:[NSString stringWithFormat:@"%f", currentRowMaxHeight]];
        tableHeight = tableHeight + currentRowMaxHeight;
      }
    }
  }
  
  //初始化画图格式
  //    UIGraphicsBeginImageContext(CGSizeMake(320, tableHeight)); // 创建内存中的图片
  UIGraphicsBeginImageContext(CGSizeMake(tableWidth, tableHeight)); // 创建内存中的图片
  CGContextRef ctx = UIGraphicsGetCurrentContext();          //获取画布
  CGContextSetShouldAntialias(ctx, YES);                     //抗锯齿
  CGContextSetShouldSmoothFonts(ctx, YES);                   //字体抗锯齿
  CGContextSetLineWidth(ctx, 1);                             //设置行列分割线宽度
  
  
  
  float currentRowY = [rowPositionYArray[0] floatValue];     //当前列的y位置
  
  //=====画表头======
  //画表头背景
  CGRect titleBg = CGRectMake(0, 2, tableWidth, currentRowY);
  CGContextSetFillColorWithColor(ctx, titleColor.CGColor);
  CGContextFillRect(ctx, titleBg);
  //画表头文字
  //    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor); //文字颜色
  for (int num = 0; num < collNum; num++) {
    NSString *valueName = tableHeaderNameArray[num]; //表头文字
    //计算自适应的文字宽高
    CGSize size = CGSizeMake(collWidth - marginLeftRight, currentRowY); //collWidth-marginLeftRight是为了计算留出左右边距
    
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:valueName
     attributes:@{
                  NSFontAttributeName : font
                  }];
    CGSize valnueNameSize = [attributedText boundingRectWithSize:size
                                                         options:NSStringDrawingUsesLineFragmentOrigin
                                                         context:nil].size; //自动计算Labele的
    
    NSDictionary *dict = @{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor whiteColor]};
    [valueName drawInRect:CGRectMake( (collWidth - valnueNameSize.width) / 2 + num * collWidth, 2 + (currentRowY - valnueNameSize.height) / 2, valnueNameSize.width, valnueNameSize.height) withAttributes:dict];
  }
  
  //====画表格内容=====
  for (int index = 0; index < tableDataArray.count; index++) {
    NSDictionary *dic = [tableDataArray[index] objectFromJSONString];
    float currentRowMaxHeight = [rowPositionYArray[index + 1] floatValue];
    //画行背景
    CGRect rowBg = CGRectMake(0, currentRowY, tableWidth, currentRowMaxHeight);
    //设置奇偶行背景色
    if (index % 2 == 0) {
      CGContextSetFillColorWithColor(ctx, rowColor_1.CGColor);
    } else {
      CGContextSetFillColorWithColor(ctx, rowColor_2.CGColor);
    }
    CGContextFillRect(ctx, rowBg);
    
    for (int num = 0; num < collNum; num++) {
      NSString *value = [NSString stringWithFormat:@"%@", [dic objectForKey:tableHeaderIdArray[num]]];
      CGSize size = CGSizeMake(collWidth - marginLeftRight, currentRowMaxHeight); //collWidth-8是为了计算留出左右边距
      NSAttributedString *attributedText =
      [[NSAttributedString alloc]
       initWithString:value
       attributes:@{
                    NSFontAttributeName : font
                    }];
      CGSize valnueNameSize = [attributedText boundingRectWithSize:size
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                           context:nil].size; //自动计算Labele的
      
      NSDictionary *dict = [[NSDictionary alloc] init];
      //设置数值的正负颜色
      if ([value floatValue] < 0) {
        dict = @{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor redColor]};
        
      } else {
        dict = @{NSFontAttributeName : font, NSForegroundColorAttributeName : [UIColor grayColor]};
      }
      
      [value drawInRect:CGRectMake(0 + (collWidth - valnueNameSize.width) / 2 + num * collWidth, (currentRowMaxHeight - valnueNameSize.height) / 2 + currentRowY, valnueNameSize.width, valnueNameSize.height) withAttributes:dict]; //画cell文字
    }
    
    //画行分割线
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGPoint line[] = {CGPointMake(0, currentRowY), CGPointMake(tableWidth , currentRowY)};
    CGContextStrokeLineSegments(ctx, line, 2);
    currentRowY = currentRowY + currentRowMaxHeight;
  }
  //=====画列分割线======
  CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor); //设置列分割线颜色
  for (int index =1; index < collNum; index++) {
    CGPoint line1[] = {CGPointMake(0 + index * collWidth, 2), CGPointMake( index * collWidth, tableHeight )};
    CGContextStrokeLineSegments(ctx, line1, 2);
  }
  
  self = UIGraphicsGetImageFromCurrentImageContext();
  //---------结束绘图---------
  UIGraphicsEndImageContext();
  //  }
  
  return self;
}

@end
