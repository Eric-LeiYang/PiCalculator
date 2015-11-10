//
//  PiCalculateService.h
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PiCalculateService : NSObject{
    double emptyDouble;
    int defaultIterationNumber;//Iteration Number: 1 by default
    
    //MARK: private
    bool shouldBeStopped;
    double Pi;
    int iterationNumber;
}

- (void) start;
- (void) stop;
- (void) resume;
- (void) pause;

- (double) PiAlgorithm;

@end
