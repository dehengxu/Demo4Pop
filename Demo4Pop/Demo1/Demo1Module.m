//
//  Demo1Module.m
//  Demo4Pop
//
//  Created by DehengXu on 14-5-20.
//
//

#import "Demo1Module.h"
#import "Demo1ViewController.h"

@implementation Demo1Module

- (void)configure
{
    [self bindClass:[Demo1ViewController class] toProtocol:@protocol(DemoViewControllerProtocal)];
}

@end
