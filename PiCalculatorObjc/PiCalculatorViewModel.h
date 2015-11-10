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

@interface PiCalculatorViewModel : NSObject  <ElapsedTimerServiceDelegate>{
    
    //MARK: properties
    
    ElapsedTimerService *elapsedTimerService;
}

#pragma mark: public properties

@property (strong, nonatomic) NSString *Pi;
@property (strong, nonatomic) NSString *elapsedTime;

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
