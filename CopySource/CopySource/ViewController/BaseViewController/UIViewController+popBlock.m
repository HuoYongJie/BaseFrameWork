//
//  UIViewController+popBlock.m
//  CopySource
//
//  Created by zhengwenming on 2017/4/9.
//  Copyright © 2017年 zhengwenming. All rights reserved.
//

#import "UIViewController+popBlock.h"
#import <objc/runtime.h>

static char popBlockKey;

@implementation UIViewController (popBlock)
-(void)setPopBlock:(PopBlock)popBlock{
    objc_setAssociatedObject(self, &popBlockKey, popBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(PopBlock)popBlock{
    
    PopBlock popBlock = objc_getAssociatedObject(self, &popBlockKey);
    
   return popBlock;
}
@end
