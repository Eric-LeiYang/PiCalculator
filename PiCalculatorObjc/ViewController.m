//
//  ViewController.m
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

#pragma mark - properties

//view model
@property (weak, nonatomic) PiCalculatorViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Bind view with ViewModel by using ReactiveCocoa
    [self bindViewModel];
    
    //init UI status
    //[self updateUIbyStatus:CalculatorStatusStopped];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//init with view model
- (instancetype)initWithViewModel:(PiCalculatorViewModel *)viewModel {
    self = [super init];
    if (self ) {
        _viewModel = viewModel;
    }
    return self;
}

//bind View with ViewModel by using ReactiveCocoa
- (void)bindViewModel {
    RAC(self.PiLabel, text) = RACObserve(self, viewModel.Pi);
    RAC(self.elapsedLabel, text) = RACObserve(self, viewModel.elapsedTime);
 
    //Binding button title
    [self.startStopButton rac_liftSelector:@selector(setTitle:forState:)
                             withSignals:RACObserve(self, viewModel.titleOnStartStopButton),
     [RACSignal return:@(UIControlStateNormal)], nil];
    
    //Binding button title color
    [self.startStopButton rac_liftSelector:@selector(setTitleColor:forState:) withSignals:RACObserve(self, viewModel.titleColorOnStartStopButton),
     [RACSignal return:@(UIControlStateNormal)], nil];
    
    //Binding button enable/disable
    [self.startStopButton rac_liftSelector:@selector(setEnabled:) withSignals:RACObserve(self, viewModel.startStopButtonEnabled), nil];
    
    
    //button title
    [self.pauseResumeButton rac_liftSelector:@selector(setTitle:forState:)
                                 withSignals:RACObserve(self, viewModel.titleOnPauseResumeButton),
     [RACSignal return:@(UIControlStateNormal)], nil];
    //Binding button title color
    [self.pauseResumeButton rac_liftSelector:@selector(setTitleColor:forState:) withSignals:RACObserve(self, viewModel.titleColorOnPauseResumeButton),
     [RACSignal return:@(UIControlStateNormal)], nil];
    
    //Binding button enable/disable
    [self.pauseResumeButton rac_liftSelector:@selector(setEnabled:) withSignals:RACObserve(self, viewModel.pauseResumeButtonEnabled), nil];

    
    //Binding tap action
    self.startStopButton.rac_command = self.viewModel.startStopCommand;
    self.pauseResumeButton.rac_command = self.viewModel.pauseResumeCommand;
}


#pragma mark - private

////update UI by status
//- (void) updateUIbyStatus: (CalculatorStatus)status{
//    
//    switch (status){
//        
//    case CalculatorStatusStarted:
//            [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
//            self.pauseResumeButton.enabled = YES;
//            [self.pauseResumeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            break;
//        
//    case CalculatorStatusPaused:
//            [self.pauseResumeButton setTitle:@"Resume" forState:UIControlStateNormal];
//            break;
//
//        
//    case CalculatorStatusResumed:
//            [self.pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
//            break;
//
//        
//    case CalculatorStatusStopped:
//            [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
//            self.pauseResumeButton.enabled = NO;
//            [self.pauseResumeButton setTitle:@"Pause" forState:UIControlStateNormal];
//            [self.pauseResumeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//            break;
//
//    }
//}
//
//#pragma mark - public
//
//- (IBAction)startStopButton:(UIButton *)sender {
//    if([@"Start" isEqualToString:sender.titleLabel.text]){
//        [self updateUIbyStatus:CalculatorStatusStarted];
//        [self.viewModel startCalculator];
//    }else{
//        [self updateUIbyStatus:CalculatorStatusStopped];
//        [self.viewModel stopCalculator];
//    }
//}
//
//- (IBAction)pauseResumeButton:(UIButton *)sender {
//    if([@"Pause" isEqualToString:sender.titleLabel.text]){
//        [self updateUIbyStatus:CalculatorStatusPaused];
//        [self.viewModel pauseCalculator];
//    }else{
//        [self updateUIbyStatus:CalculatorStatusResumed];
//        [self.viewModel resumeCalculator];
//    }
//}
@end
