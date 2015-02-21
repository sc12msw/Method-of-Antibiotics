//
//  CalculatorVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 21/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "CalculatorVC.h"

@interface CalculatorVC (){
    //Stores buttons pressed
    NSMutableArray *storage;
    
}

@end

@implementation CalculatorVC

@synthesize calculatorOutput;


- (void)viewDidLoad {
    [super viewDidLoad];
    storage = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)seven:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:7]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)eight:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:8]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)nine:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:9]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)subtract:(id)sender {
    [storage addObject:@"-"];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)del:(id)sender {
    
    [storage removeLastObject];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
    
}

- (IBAction)clear:(id)sender {
    [storage removeAllObjects];
    
    self.calculatorOutput.text = @"0";
}

- (IBAction)add:(id)sender {
    [storage addObject:@"+"];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)six:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:6]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)five:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:5]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)four:(id)sender {
    
    [storage addObject:[NSNumber numberWithDouble:4]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)one:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:1]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)two:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:2]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)three:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:3]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)multiply:(id)sender {
    [storage addObject:@"x"];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)equals:(id)sender {
    NSInteger currentIndex =0;
    NSNumber *number;
    NSUInteger sizeOfArray =storage.count;
    NSMutableString *numberStr;
    NSMutableArray *calculationArray;
    numberStr = [[NSMutableString alloc]init];
    calculationArray = [[NSMutableArray alloc]init];
    @try {
        while (currentIndex < sizeOfArray){
            
            while (![[storage objectAtIndex:currentIndex] isKindOfClass:[NSString class]]){
                [numberStr appendString:[NSString stringWithFormat:@"%@",[storage objectAtIndex:currentIndex]]];
                
                currentIndex = currentIndex+1;
                if (currentIndex >= sizeOfArray){
                    break;
                }
                
            }
            number = @([numberStr intValue]);
            [calculationArray addObject:number];
            if (currentIndex < sizeOfArray){
                [calculationArray addObject:[storage objectAtIndex:currentIndex]];
                [numberStr setString:@""];
                currentIndex = currentIndex+1;
            }
            
        }
        self.calculatorOutput.text = [calculationArray componentsJoinedByString:@" "];
    }
    @catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Math Error"
                                                        message:@"This calculation is not possible on this application, sorry."
                                                       delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
        NSLog(@"%@", exception.reason);
    }
    @finally {
        
    }
    
    
}

- (IBAction)point:(id)sender {
    [storage addObject:@"."];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)zero:(id)sender {
    [storage addObject:[NSNumber numberWithDouble:0]];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}

- (IBAction)divide:(id)sender {
    [storage addObject:@"/"];
    self.calculatorOutput.text = [storage componentsJoinedByString:@""];
}



@end
