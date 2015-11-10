//
//  ElapsedTimerService.m
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "ElapsedTimerService.h"

@implementation ElapsedTimerService

#pragma mark: init methods

- (instancetype) init{
    self = [super init];
    if (self ) {
        [self initialize];
    }
    return self;
}

//initialize
- (void)initialize {
    timeIncrement = 0.01;
    emptyDouble = 0.00;
    timer = nil;
    _delegate = nil;
    timeElapsed = emptyDouble;
    piCalculateService = [[PiCalculateService alloc] init];
    piCalculatorModel = [[PiCalculatorModel alloc] init];
}


#pragma mark: private

//update timer
- (void) updateTimer{
    //elapsed time
    timeElapsed += timeIncrement;
    
    //model
    piCalculatorModel.Pi =  [piCalculateService PiAlgorithm];
    piCalculatorModel.elapsedTime = timeElapsed;
    
    //delegate method
    if ([self.delegate respondsToSelector:@selector(elapsedTimerDidUpdate:)]) {
        [self.delegate elapsedTimerDidUpdate:piCalculatorModel];
    }
}

#pragma mark: public

//start
- (void) start{
    //Pi calculator
    [piCalculateService start];
    
    //timer
    timeElapsed = emptyDouble;//start from 0
    timer = [NSTimer  scheduledTimerWithTimeInterval:timeIncrement
                                          target:self
                                            selector:@selector(updateTimer)
                                            userInfo:nil
                                             repeats:true];
}

//pause
- (void) pause{
    //Pi calculator
    [piCalculateService pause];
    
    [timer invalidate];
    timer = nil;
}

//stop
- (void) stop{
    //Pi calculator
    [piCalculateService stop];
    
    timeElapsed = emptyDouble; //clean the elapsed time
    [timer invalidate];
    timer = nil;
}

//resume
- (void) resume{
    //Pi calculator
    [piCalculateService resume];
    
    timer = [NSTimer  scheduledTimerWithTimeInterval:timeIncrement
                                              target:self
                                            selector:@selector(updateTimer)
                                            userInfo:nil
                                             repeats:true];
}

@end
