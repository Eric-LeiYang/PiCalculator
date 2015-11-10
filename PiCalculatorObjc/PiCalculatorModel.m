//
//  PiCalculatorModel.m
//  PiCalculatorObjc
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import "PiCalculatorModel.h"

@implementation PiCalculatorModel

#pragma mark: init methods

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.Pi = 0.00;
    self.elapsedTime = 0.00;
}

@end
