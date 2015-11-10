//
//  PiCalculateService.m
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "PiCalculateService.h"

@implementation PiCalculateService

#pragma mark: init methods

- (instancetype)init{
    self = [super init];
    if (self ) {
        [self initialize];
    }
    return self;
}

//initialize
- (void)initialize {
    emptyDouble = 0.00;
    defaultIterationNumber = 1;
    shouldBeStopped = NO;
    Pi = emptyDouble;
    iterationNumber = defaultIterationNumber;
}

#pragma mark: public

//start
- (void) start{
    shouldBeStopped = NO;
    
    Pi = emptyDouble;
    iterationNumber = defaultIterationNumber;
    
}

//stop
- (void) stop{
    shouldBeStopped = YES;
}

//resume
- (void) resume{
    shouldBeStopped = NO;
}

//pause
- (void) pause{
    shouldBeStopped = YES;
}

//Pi algorithm
- (double) PiAlgorithm{
    //if stoped/paused
    if(shouldBeStopped == YES){
        return Pi;
    }
    
    //using if/else instead of pow() function in Swift
    if(iterationNumber % 2 == 0){ //if the reminder of m/2 is 0
        Pi += 4.0 * ((-1.0)/((2.0 * iterationNumber)-1.0));
    }else{
        Pi += 4.0 * ((1.0)/((2.0 *  iterationNumber)-1.0));
    }
    
    //add number
    iterationNumber += 1;
    
    return Pi;
}

@end
