//
//  UIImage+TableView.h
//  drawMyTableOne
//
//  Created by liuxq on 15-2-27.
//  Copyright (c) 2015年 liuxq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TableView)
/**
 *  初始化方法
 *
 *  @param width                表格宽度
 *  @param tableHeaderIdArray   表头id
 *  @param tableHeaderNameArray 表头名称
 *  @param tableDataArray       表格内容
 *
 *  @return 绘制好的表格
 */
-(instancetype)initWithParam:(CGFloat) width tableHeaderIdArray:(NSArray*) tableHeaderIdArray tableHeaderNameArray: (NSArray*) tableHeaderNameArray tableDataArray:(NSArray*) tableDataArray;
@end
