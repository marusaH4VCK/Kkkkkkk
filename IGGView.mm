#import "Main.h"
#import "meo.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIAlertView.h>
#import <UIKit/UIControl.h>
#import "Obfuscate.h"
@interface IGGViewa()
@end
UIButton *openButton;
UIButton *closeButton;
UIView *menuView;
UIButton *clean;
UIView *menu;
UIButton *movingView;
@implementation IGGViewa



#pragma mark -------------------------------------View-------------------------------------------

+ (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        IGGViewa *view = [IGGViewa View];
        [view show];
        [[[[UIApplication sharedApplication] windows]lastObject] addSubview:view];
//New Application Windows
      UIWindow*Window = [UIApplication sharedApplication].keyWindow;
//Open menu with 3 finger
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 2;      // MultiTouch
    tap.numberOfTouchesRequired = 3;   // Number finger touch
    [Window addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(expand)]; // Check status
});

}


+ (instancetype)View
{
    return [[IGGViewa alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
  
    }
    return self;
}

- (void)show
{
    self.hidden = NO;

}
#pragma mark -------------------------------------Event-------------------------------------------
//Start creating menu
+ (void)expand {


     //New menu view
    UIWindow*mainWindow;
    mainWindow = [UIApplication sharedApplication].keyWindow;

movingView = [[UIButton alloc]initWithFrame: CGRectMake(131.5, -11.5, 100, 100)];
movingView.transform = CGAffineTransformMakeScale(1.0, 1.0);                          
movingView.alpha = 1.0f;
movingView.backgroundColor = [UIColor clearColor];
movingView.layer.shadowOpacity = 0;
movingView.layer.shadowColor = [UIColor clearColor].CGColor;
movingView.layer.shadowRadius = 0;
[movingView addTarget:self action:@selector(wasDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
[mainWindow addSubview:movingView];

    //Create a close menu button
   closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      UIWindow*Window = [UIApplication sharedApplication].keyWindow;
//Open menu with 3 finger
  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 3;      // MultiTouch
    tap.numberOfTouchesRequired = 3;   // Number finger touch
    [Window addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(closeMenu)];
       //Define to store multiple data
   closeButton.hidden = NO; 
    [menuView addSubview:closeButton];
 
       //Define to store multiple data
     NSUserDefaults*defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];

    UISwitch* SW1 = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
SW1.layer.cornerRadius = 5.0;
SW1.transform = CGAffineTransformMakeScale(0.90, 0.90);
SW1.backgroundColor = [UIColor redColor];
SW1.layer.cornerRadius = 15;

SW1.thumbTintColor = [UIColor blackColor];

SW1.onTintColor = [UIColor greenColor];
SW1.tintColor = [UIColor cyanColor];
    [SW1 addTarget:self action:@selector(feature1:)  forControlEvents:UIControlEventValueChanged];
    [movingView addSubview:SW1];
   BOOL sw1 = [defaults boolForKey:@"sw1"];
    if (sw1 == YES) { [SW1 setOn:YES];   } 
    else { [SW1 setOn:NO];     }
      UILabel* AL1 = [[UILabel alloc] initWithFrame:CGRectMake(9.5, 7.5, 44, 12)];
      [AL1 setText:NSSENCRYPT("STOP MOVE")];
      [AL1 setTextColor:[UIColor blackColor] ];
      [AL1 setBackgroundColor:[UIColor clearColor]];
      AL1.font = [UIFont fontWithName:@"AmericanTypewriter-Bold" size:8];
      [movingView addSubview:AL1];



}

+ (void)feature1:(UISwitch *)SW1 {
GHOSTA *cc = [[GHOSTA alloc] init];
    if ([SW1 isOn]) {
[cc set_on];
} else {
[cc set_off];
}}

+ (void)wasDragged:(UIButton *)button withEvent:(UIEvent *)event {


    UITouch *touch = [[event touchesForView:button] anyObject];

    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;

    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y); }


+ (void)closeMenu { movingView.hidden = YES; } 


@end

