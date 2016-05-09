//
//  Config.h
//  DrawerView
//
//  Created by ycd006 on 16/5/9.
//  Copyright © 2016年 闰尚松. All rights reserved.
//

#ifndef Config_h
#define Config_h

#ifndef VIEW
#define VIEW(CGRect) [[UIView alloc] initWithFrame:CGRect]
#endif

#ifndef VIEW_INIT
#define VIEW_INIT [[UIView alloc] init]
#endif

#ifndef SCREEN_WIDTH 
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#endif

#endif /* Config_h */



