//
//  ViewController.m
//  ChildController
//
//  Created by surendra on 22/10/17.
//  Copyright © 2017 surendra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    
    _childVc = [[ChildViewController alloc]initWithNibName:@"ChildViewController" bundle:nil];
    [self pushViewControllers:_childVc :self];

   // [self displayContentController];
    
}

- (void) displayContentController
{
    CGRect muSearchRect = CGRectMake(20, self.view.frame.size.height, self.view.frame.size.width-40, 400);
    [self addChildViewController:_childVc];
   _childVc.view.frame = muSearchRect;//[self frameForContentController];
    [self.view addSubview:_childVc.view];
    [_childVc didMoveToParentViewController:self];
}
- (void) hideContentController
{
    [_childVc willMoveToParentViewController:nil];
    [_childVc.view removeFromSuperview];
    [_childVc removeFromParentViewController];
    
}

-(void)pushViewControllers:(ChildViewController *)newVC :(UIViewController *)oldVC
{
    CGRect muSearchRect = CGRectMake(20, self.view.frame.size.height/4, self.view.frame.size.width-40, 400);
    CGRect ogFrame = muSearchRect;
    [self displayContentController];
    [UIView animateWithDuration:0.6f
                          delay:0.5f
                        options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         newVC.view.frame = ogFrame;
                     }
                     completion:^(BOOL finished)
     {}];
}


@end
