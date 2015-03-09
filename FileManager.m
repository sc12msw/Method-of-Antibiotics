//
//  FileManager.m
//  CFMedApp1
//
//  Created by Matt Watson on 09/03/2015.
//  Copyright (c) 2015 Matthew Watson. All rights reserved.
//

#import "FileManager.h"
#import "GDataXMLNode.h"

@implementation FileManager


//This method shows the file path of a saved file and one kept in storage.
+ (NSString *)dataFilePath:(BOOL)forSave {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    NSString *filePath = [docDirectory
                               stringByAppendingPathComponent:@"cFInfo.xml"];
    if (forSave ||
        [[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    } else {
        return [[NSBundle mainBundle] pathForResource:@"cFInfo" ofType:@"xml"];
    }
}


@end