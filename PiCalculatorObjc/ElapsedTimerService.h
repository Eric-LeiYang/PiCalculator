//
//  ElapsedTimerService.h
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PiCalculatorModel.h"
#import "PiCalculateService.h"

#pragma mark: delegate
@protocol ElapsedTimerServiceDelegate <NSObject>

@required
- (void) elapsedTimerDidUpdate:(PiCalculatorModel *)piCalculatorModel;

@end


@interface ElapsedTimerService : NSObject{
    //MARK: properties
    double timeIncrement;
    double emptyDouble;
    
    NSTimer *timer;
    double timeElapsed;
    
    PiCalculateService *piCalculateService;
    PiCalculatorModel *piCalculatorModel;
}

#pragma mark: public properties

//delegate
@property (nonatomic, weak) id<ElapsedTimerServiceDelegate> delegate;

#pragma mark: public methods

//start
- (void) start;

//stop
- (void) stop;

//resume
- (void) resume;

//pause
- (void) pause;


@end
