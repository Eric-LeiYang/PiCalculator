//
//  ViewController.h
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PiCalculatorViewModel.h"

@interface ViewController : UIViewController

#pragma mark - IBOutlet

//Label
@property (weak, nonatomic) IBOutlet UILabel *PiLabel;
@property (weak, nonatomic) IBOutlet UILabel *elapsedLabel;

//Button
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseResumeButton;

#pragma mark - public

//init method
- (instancetype)initWithViewModel:(PiCalculatorViewModel *)viewModel;


@end

