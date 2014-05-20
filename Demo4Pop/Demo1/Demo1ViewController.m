//
//  Demo1ViewController.m
//  Demo4Pop
//
//  Created by DehengXu on 14-5-20.
//
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btnAnim = [[UIButton alloc] init];
    [self.view addSubview:self.btnAnim];
    
    [self.btnAnim addTarget:self action:@selector(onClick_startAnimtaion:) forControlEvents:UIControlEventTouchUpInside];
    self.btnAnim.frame = (CGRect){0,0,160, 60};
    self.btnAnim.center = pt(self.view.center.x, self.view.frame.size.height - 100);
    [self.btnAnim setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnAnim setTitle:@"StartAnim" forState:UIControlStateNormal];
    
    self.demoView = [[UIView alloc] init];
    self.demoView.frame = rt(0, 0, 80, 80);
    self.demoView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.demoView];
    
    self.animTypeLable = [[UILabel alloc] initWithFrame:rt(self.view.frame.size.width - 200, 0, 200, 70)];
    self.animTypeLable.textColor = [UIColor darkGrayColor];
    self.animTypeLable.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.animTypeLable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

bool isPop = false;

- (void)onClick_startAnimtaion:(id)sender
{
    NSLog(@"%s", __func__);
    isPop = !isPop;
    
    self.btnAnim.enabled = NO;
    if (isPop) {
        self.animTypeLable.text = @"Pop";
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.toValue = [NSValue valueWithCGRect:rt(300, 400, 80, 80)];
        [anim setCompletionBlock:^(POPAnimation *anim, BOOL isCompleted) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.demoView.frame = rt(0, 0, 80, 80);
                self.btnAnim.enabled = YES;
            });
        }];
        [self.demoView pop_addAnimation:anim forKey:kPOPViewFrame];
        
    }else {
        self.animTypeLable.text = @"UIKit";
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.demoView.frame = rt(300, 400, 80, 80);
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.demoView.frame = rt(0, 0, 80, 80);
                self.btnAnim.enabled = YES;
            });
        }];
    }
}

@end
