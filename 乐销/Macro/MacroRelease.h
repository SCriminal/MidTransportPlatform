//
//  MacroRelease.h
//  中车运
//
//  Created by 隋林栋 on 2017/6/16.
//  Copyright © 2017年 ping. All rights reserved.
//

#ifndef MacroRelease_h
#define MacroRelease_h

//请求URL
#if DEBUG
#define URL_HEAD  @"http://112.253.1.72:10401"
#define URL_IMAGE @"http://112.253.1.72:10499"//image
#define URL_SHARE @"http://112.253.1.72:10201"
//#define URL_HEAD  @"https://api.zhongcheyun.cn"//外网
//#define URL_IMAGE @"http://img.zhongcheyun.cn"//阿里云
//#define URL_SHARE @"https://www.zhongcheyun.cn"//
#else
#define URL_HEAD  @"https://api.zhongcheyun.cn"//外网
#define URL_IMAGE @"http://img.zhongcheyun.cn"//阿里云
#define URL_SHARE @"https://www.zhongcheyun.cn"//

#endif

#if DEBUG
//#define SLD_TEST //sld_test
//#define SLD_TRACK //track test
#endif



//前缀
#define PREFIX_SCHEDULE @"zcy_s:"

//阿里云文件地址
#define ENDPOINT @"http://oss-cn-beijing.aliyuncs.com"
#define ENDPOINT_VIDEO @"http://oss-cn-beijing.aliyuncs.com"

#define IMAGEURL_HEAD @"http://img.zhongcheyun.cn"
//微信 appid
#define WXAPPID @"wx61e166a8dd0279d2"
#define WXAPPLINK  @"https://www.zhongcheyun.cn/consignor/"

//高德地图
#if DEBUG

#define MAPID @"ec5edb0fb3d9cc4d4e64a72ba62b1dfe"

#else
#define MAPID @"d7e24a6e856fdf6f255910fe2814d4cb"
#endif

//闪登
#define FLASH_ID @"h9HQTEdK"
#define FLASH_KEY @"1sNSijQW"



#endif /* MacroRelease_h */
