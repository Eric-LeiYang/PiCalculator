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
    
    elapsedTimerService = [[ElapsedTimerService alloc] init];
    elapsedTimerService.delegate = self;
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
