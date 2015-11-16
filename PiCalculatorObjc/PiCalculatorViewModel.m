//
//  PiCalculatorViewModel.m
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "PiCalculatorViewModel.h"

@implementation PiCalculatorViewModel

#pragma mark: init methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

//initialize
- (void)initialize {
    self.Pi = @"0.00";
    self.elapsedTime = @"0.00";
    self.titleOnStartStopButton = @"Start";
    self.titleOnPauseResumeButton = @"Pause";
    self.titleColorOnPauseResumeButton = [UIColor lightGrayColor];
    self.pauseResumeButtonEnabled = NO;
    
    elapsedTimerService = [[ElapsedTimerService alloc] init];
    elapsedTimerService.delegate = self;
    
    currentStatus = CalculatorStatusInit;
}

#pragma mark: private

//update viewmodel
//no need to dispatch main queue since ReactiveCocoa handle it
- (void) updatePiCalculatorModelWith:(PiCalculatorModel *)piCalculatorModel{
    self.Pi = [NSString stringWithFormat:@"%.25f",piCalculatorModel.Pi];
    self.elapsedTime = [NSString stringWithFormat:@"%.2f",piCalculatorModel.elapsedTime];
}

#pragma marl: delegate

//model value from ElapsedTimeService
- (void)elapsedTimerDidUpdate:(PiCalculatorModel *)piCalculatorModel{
    [self updatePiCalculatorModelWith:piCalculatorModel];
}


#pragma mark: public

- (RACCommand *)startStopCommand {
    if (!_startStopCommand) {
        _startStopCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal defer:^{
                // Do stuff
                [self setButtonByStartStopCommand];
                
                return [RACSignal empty];
            }];
        }];
    }
    return _startStopCommand;
}

- (RACCommand *)pauseResumeCommand {
    if (!_pauseResumeCommand) {
        _pauseResumeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal defer:^{
                // Do stuff
                [self setButtonByPauseResumeCommand];
                
                return [RACSignal empty];
            }];
        }];
    }
    return _pauseResumeCommand;
}

//update UI by status
- (void) setButtonByStartStopCommand{
    
    switch (currentStatus){
            
        case CalculatorStatusInit:
            self.titleOnStartStopButton = @"Stop";
            self.pauseResumeButtonEnabled = YES;
            self.titleColorOnPauseResumeButton = [UIColor blackColor];
            
            [self startCalculator];
            currentStatus = CalculatorStatusRunning;
            break;
            
        case CalculatorStatusPaused:
        case CalculatorStatusResumed:
        case CalculatorStatusRunning:
            self.titleOnStartStopButton = @"Start";
            self.pauseResumeButtonEnabled = NO;
            self.titleOnPauseResumeButton = @"Pause";
            self.titleColorOnPauseResumeButton = [UIColor lightGrayColor];
            
            [self stopCalculator];
            currentStatus = CalculatorStatusInit;
            break;
            
    }
}

//update UI by status
- (void) setButtonByPauseResumeCommand{
    
    switch (currentStatus){
            
        case CalculatorStatusInit:
            break;
            
        case CalculatorStatusPaused:
            self.titleOnPauseResumeButton = @"Pause";
            [self resumeCalculator];
            currentStatus = CalculatorStatusResumed;
            break;
            
        case CalculatorStatusResumed:
        case CalculatorStatusRunning:
            self.titleOnPauseResumeButton = @"Resume";
            [self pauseCalculator];
            
            currentStatus = CalculatorStatusPaused;
            break;
    }

}

//start
- (void) startCalculator{
    [elapsedTimerService start];
}

//stop
- (void) stopCalculator{
    [elapsedTimerService stop];
}

//resume
- (void) resumeCalculator{
    [elapsedTimerService resume];
}

//pause
- (void) pauseCalculator{
    [elapsedTimerService pause];
}


@end
