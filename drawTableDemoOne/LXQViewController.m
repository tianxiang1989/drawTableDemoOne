//
//  ViewController.m
//  drawMyTableOne
//
//  Created by liuxq on 15-2-27.
//  Copyright (c) 2015年 liuxq. All rights reserved.
//

#import "LXQViewController.h"
//#import "LXQTableView.h"
#import "UIImage+TableView.h"

//获取设备的物理高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//@interface LXQViewController ()
//
//@end

@implementation LXQViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  NSArray *tableDataArray=@[@"{\"MON_RING_RATE\": \"5.92\",\"MON_SAME_RATE\": \"90.59\",\"TD_FLUX_RATE\": \"23.61\",\"DAY_FLUX\": \"12668.75\",\"REGION_DESC\": \"河北\",\"FLUX_4G_RATE\": \"22\",\"DAY_SAME_RATE\": \"84.65\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"45.62\",\"MON_FLUX\": \"281849.42\"}",@"{\"MON_RING_RATE\": \"4.99\",\"MON_SAME_RATE\": \"54.76\",\"TD_FLUX_RATE\": \"20.99\",\"DAY_FLUX\": \"1257.04\",\"REGION_DESC\": \"邯郸\",\"FLUX_4G_RATE\": \"22.84\",\"DAY_SAME_RATE\": \"49.30\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.84\",\"MON_FLUX\": \"27587.44\"}",@"{\"MON_RING_RATE\": \"4.07\",\"MON_SAME_RATE\": \"107.57\",\"TD_FLUX_RATE\": \"25.26\",\"DAY_FLUX\": \"1890.97\",\"REGION_DESC\": \"石家庄\",\"FLUX_4G_RATE\": \"30\",\"DAY_SAME_RATE\": \"93.04\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"55.26\",\"MON_FLUX\": \"43361.97\"}",@"{\"MON_RING_RATE\": \"7.31\",\"MON_SAME_RATE\": \"87.15\",\"TD_FLUX_RATE\": \"27.39\",\"DAY_FLUX\": \"2256.87\",\"REGION_DESC\": \"保定\",\"FLUX_4G_RATE\": \"19.76\",\"DAY_SAME_RATE\": \"77.22\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"47.15\",\"MON_FLUX\": \"50550.96\"}",@"{\"MON_RING_RATE\": \"3.09\",\"MON_SAME_RATE\": \"89.42\",\"TD_FLUX_RATE\": \"27.65\",\"DAY_FLUX\": \"687.41\",\"REGION_DESC\": \"张家口\",\"FLUX_4G_RATE\": \"21.03\",\"DAY_SAME_RATE\": \"77.49\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"48.68\",\"MON_FLUX\": \"14990.75\"}",@"{\"MON_RING_RATE\": \"11.06\",\"MON_SAME_RATE\": \"87.69\",\"TD_FLUX_RATE\": \"22.83\",\"DAY_FLUX\": \"485.22\",\"REGION_DESC\": \"承德\",\"FLUX_4G_RATE\": \"17.67\",\"DAY_SAME_RATE\": \"90.48\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"40.50\",\"MON_FLUX\": \"10357.39\"}",@"{\"MON_RING_RATE\": \"6.40\",\"MON_SAME_RATE\": \"90.42\",\"TD_FLUX_RATE\": \"21.68\",\"DAY_FLUX\": \"1607.27\",\"REGION_DESC\": \"唐山\",\"FLUX_4G_RATE\": \"21.88\",\"DAY_SAME_RATE\": \"87.82\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.57\",\"MON_FLUX\": \"36279.27\"}",@"{\"MON_RING_RATE\": \"5.44\",\"MON_SAME_RATE\": \"115.53\",\"TD_FLUX_RATE\": \"23.05\",\"DAY_FLUX\": \"1331.08\",\"REGION_DESC\": \"廊坊\",\"FLUX_4G_RATE\": \"18.76\",\"DAY_SAME_RATE\": \"116.72\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"41.82\",\"MON_FLUX\": \"28881.57\"}",@"{\"MON_RING_RATE\": \"9.91\",\"MON_SAME_RATE\": \"114.28\",\"TD_FLUX_RATE\": \"20.43\",\"DAY_FLUX\": \"1199.20\",\"REGION_DESC\": \"沧州\",\"FLUX_4G_RATE\": \"19.50\",\"DAY_SAME_RATE\": \"111.51\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"39.93\",\"MON_FLUX\": \"26308.35\"}",@"{\"MON_RING_RATE\": \"1.84\",\"MON_SAME_RATE\": \"71.73\",\"TD_FLUX_RATE\": \"23.02\",\"DAY_FLUX\": \"392.92\",\"REGION_DESC\": \"衡水\",\"FLUX_4G_RATE\": \"22.05\",\"DAY_SAME_RATE\": \"74.07\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"45.07\",\"MON_FLUX\": \"8714.25\"}",@"{\"MON_RING_RATE\": \"4.35\",\"MON_SAME_RATE\": \"75.31\",\"TD_FLUX_RATE\": \"20.74\",\"DAY_FLUX\": \"878.48\",\"REGION_DESC\": \"邢台\",\"FLUX_4G_RATE\": \"21.49\",\"DAY_SAME_RATE\": \"70.24\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"42.23\",\"MON_FLUX\": \"19292.19\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛1\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛2\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛3\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛4\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}",@"{\"MON_RING_RATE\": \"5.48\",\"MON_SAME_RATE\": \"96.25\",\"TD_FLUX_RATE\": \"22.87\",\"DAY_FLUX\": \"682.29\",\"REGION_DESC\": \"秦皇岛5\",\"FLUX_4G_RATE\": \"20.54\",\"DAY_SAME_RATE\": \"97.70\",\"DATE\": \"20141221\",\"FLUX_34G_RATE\": \"43.41\",\"MON_FLUX\": \"15525.35\"}"];//表格数据
  
  NSArray *tableHeaderIdArray=@[ @"REGION_DESC", @"DAY_FLUX", @"DAY_SAME_RATE", @"MON_FLUX", @"MON_SAME_RATE", @"MON_RING_RATE", @"FLUX_4G_RATE", @"FLUX_34G_RATE", @"TD_FLUX_RATE" ];//表头id
  NSArray *tableHeaderNameArray=@[ @"地域", @"日流量", @"同比", @"月流量", @"同比", @"月环比", @"4G流量占比", @"34G流量分流比", @"T网流量占比" ];//表头名称

  CGFloat width=SCREEN_WIDTH;
  UIImage *tableImg=[[UIImage alloc] initWithParam:width tableHeaderIdArray:tableHeaderIdArray tableHeaderNameArray:tableHeaderNameArray tableDataArray:tableDataArray];

  //放置表格图像的UIImageView
  UIImageView *tableImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, width, tableImg.size.height/2.0)];
  tableImgView.image = tableImg;
  [self.view addSubview:tableImgView];
}


@end
