//
//  CalculatorVC.m
//  CFMedApp1
//
//  Created by Matt Watson on 21/02/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "CalculatorVC.h"

@interface CalculatorVC (){
    //Global variables
    NSMutableArray *storage;
    NSNumber *answer;
}

@end

@implementation CalculatorVC

@synthesize calculatorOutput;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initalises global variables
    storage = [[NSMutableArray alloc] init];
    answer = [[NSNumber alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//Button methods
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
    NSNumber *number,*number2;
    NSUInteger sizeOfArray =storage.count;
    NSMutableString *numberStr;
    NSMutableArray *calculationArray,*operationArray;
    numberStr = [[NSMutableString alloc]init];
    calculationArray = [[NSMutableArray alloc]init];
    operationArray = [[NSMutableArray alloc]init];
    //Turns the button presses into numbers and operations separating them.
    @try {
        while (currentIndex < sizeOfArray){
            
            while (![[storage objectAtIndex:currentIndex] isKindOfClass:[NSString class]]){
                [numberStr appendString:[NSString stringWithFormat:@"%@",[storage objectAtIndex:currentIndex]]];
                
                currentIndex = currentIndex+1;
                if (currentIndex >= sizeOfArray){
                    break;
                }
                
            }
            if (![numberStr isEqualToString:@""]) {
                number = @([numberStr intValue]);
                [calculationArray addObject:number];
            }
            if (currentIndex < sizeOfArray){
                [calculationArray addObject:[storage objectAtIndex:currentIndex]];
                [numberStr setString:@""];
                currentIndex = currentIndex+1;
            }
            
        }
        
        
        //Loop over - operations to make the numbers negative and make all the decimal numbers .
        for (int i=0; i<calculationArray.count;i++){
            
            if ([[calculationArray objectAtIndex:i] isKindOfClass:[NSString class]]){
                
                //Checks if a . exsists then replaces the operation with a double number.
                if ([[calculationArray objectAtIndex:i] isEqualToString:@"."]){
                    number =@([[calculationArray objectAtIndex:i+1]doubleValue]);
                    number2=@([[calculationArray objectAtIndex:i-1]doubleValue]);
                    NSString *tempStr = [NSString stringWithFormat:@"%@%@%@",number2,@".",number];
                    number = @([tempStr doubleValue]);
                    [calculationArray removeObjectAtIndex:i+1];
                    [calculationArray replaceObjectAtIndex:i withObject:number];
                    [calculationArray removeObjectAtIndex:i-1];
                    
                    //Checks if a - exists then replaces the operation with a + and makes the number negative.
                }else if ([[calculationArray objectAtIndex:i ] isEqualToString:@"-"]){
                    if ([[calculationArray objectAtIndex:i ] isEqualToString:@"-"]){
                        number =@([[calculationArray objectAtIndex:i+1]doubleValue]);
                        number = @([number doubleValue] * -1);
                        [calculationArray replaceObjectAtIndex:i+1 withObject: number];
                        [calculationArray replaceObjectAtIndex:i withObject:@"+"];
                    }
                    
                }
            }
        }
        
        number = 0;
        number2 = 0;
        currentIndex =0;
        for (int i =0; i<calculationArray.count; i++){
            
            if ([[calculationArray objectAtIndex:i]isKindOfClass:[NSString class]]){
                
                //Addition operation.
                if([[calculationArray objectAtIndex:i] isEqualToString:@"+"]){
                    //Checks to avoid operations such as 5 x - 6 as two operations would confuse it.
                    //Changes it to 5 + (-6) which is valid.
                    if(![[calculationArray objectAtIndex:currentIndex+1] isKindOfClass:[NSString class]]) {
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }else{
                        [calculationArray removeObjectAtIndex:currentIndex+1];
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }
                    number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    
                    if (currentIndex>0){
                        number2 = @([[calculationArray objectAtIndex:currentIndex-1]doubleValue]);
                        
                        //Checks if this is a single calculation or calulation with multiple operators.
                        if(!operationArray.count>0){
                            number = @([number2 doubleValue] + [number doubleValue]);
                            [operationArray addObject:number];
                        }else [operationArray addObject:number];
                    }
                    //Multiplication operation.
                }else if ([[calculationArray objectAtIndex:i] isEqualToString:@"x"]){
                    //Checks to avoid operations such as 5 x - 6 as two operations would confuse it.
                    //Changes it to 5 x (-6) which is valid.
                    if(![[calculationArray objectAtIndex:currentIndex+1] isKindOfClass:[NSString class]]) {
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }else{
                        [calculationArray removeObjectAtIndex:currentIndex+1];
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }
                    if (currentIndex>0){
                        number2 = @([[calculationArray objectAtIndex:currentIndex-1]doubleValue]);
                        
                        //Checks if this is a single calculation or calulation with multiple operators.
                        if(!operationArray.count>0){
                            number = @([number2 doubleValue] * [number doubleValue]);
                            [operationArray addObject:number];
                        }else{
                            number =@([[operationArray lastObject]doubleValue] * [number doubleValue]);
                            [operationArray removeLastObject];
                            [operationArray addObject:number];
                        }
                    }
                    
                    //Division operation.
                }else if ([[calculationArray objectAtIndex:i] isEqualToString:@"/"]){
                    //Checks to avoid operations such as 5 / - 6 as two operations would confuse it.
                    //Changes it to 5 / (-6) which is valid.
                    if(![[calculationArray objectAtIndex:currentIndex+1] isKindOfClass:[NSString class]]) {
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }else{
                        [calculationArray removeObjectAtIndex:currentIndex+1];
                        number =@([[calculationArray objectAtIndex:currentIndex+1]doubleValue]);
                    }
                    if (currentIndex>0){
                        number2 = @([[calculationArray objectAtIndex:currentIndex-1]doubleValue]);
                        
                        //Checks if this is a single calculation or calulation with multiple operators.
                        if(!operationArray.count>0){
                            number = @([number2 doubleValue] / [number doubleValue]);
                            [operationArray addObject:number];
                        }else{
                            number =@([[operationArray lastObject]doubleValue] / [number doubleValue]);
                            [operationArray removeLastObject];
                            [operationArray addObject:number];
                        }
                    }
                    
                }
                
                
            }
            currentIndex = currentIndex+1;
        }
        //Adds all calculations together.
        number = 0;
        for (NSNumber *temp in operationArray){
            number = @([number doubleValue]+[temp doubleValue]);
        }
        //Sets answer label resets arrays and loads answer variable.
        self.calculatorOutput.text = [number stringValue];
        answer = @([self.calculatorOutput.text doubleValue]);
        [storage removeAllObjects];
        [calculationArray removeAllObjects];
        [operationArray removeAllObjects];
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

- (IBAction)ans:(id)sender {
    [storage addObject:answer];
}



@end
