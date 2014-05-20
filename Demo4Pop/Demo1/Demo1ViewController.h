//
//  Demo1ViewController.h
//  Demo4Pop
//
//  Created by DehengXu on 14-5-20.
//
//

#import <UIKit/UIKit.h>
#import <DemoViewControllerProtocal.h>

@interface Demo1ViewController : UIViewController<DemoViewControllerProtocal>
@property (nonatomic, strong) UIButton *btnAnim;
@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UILabel *animTypeLable;
@end
