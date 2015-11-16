//
//  PiCalculatorViewModel.h
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ElapsedTimerService.h"

#ifndef PiCalculatorViewModel_h
#define PiCalculatorViewModel_h

//status enum
typedef enum: NSInteger{
    CalculatorStatusInit = 1,
    CalculatorStatusRunning = 2,
    CalculatorStatusPaused = 3,
    CalculatorStatusResumed = 4
}CalculatorStatus;

#endif

@interface PiCalculatorViewModel : NSObject  <ElapsedTimerServiceDelegate>{
    
    //MARK: properties
    
    ElapsedTimerService *elapsedTimerService;
    
    CalculatorStatus currentStatus;
}

#pragma mark: public properties

@property (strong, nonatomic) NSString *Pi;
@property (strong, nonatomic) NSString *elapsedTime;

@property (strong, nonatomic) NSString *titleOnStartStopButton;
@property (strong, nonatomic) UIColor *titleColorOnStartStopButton;
@property BOOL startStopButtonEnabled;

@property (strong, nonatomic) NSString *titleOnPauseResumeButton;
@property (strong, nonatomic) UIColor *titleColorOnPauseResumeButton;
@property BOOL pauseResumeButtonEnabled;

@property (nonatomic, strong) RACCommand *startStopCommand;
@property (nonatomic, strong) RACCommand *pauseResumeCommand;


#pragma mark: public methods

//start
- (void) startCalculator;

//stop
- (void) stopCalculator;

//resume
- (void) resumeCalculator;

//pause
- (void) pauseCalculator;

@end
