//
//  NSFileManager+Cache.m
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import "NSFileManager+Cache.h"

@implementation NSFileManager (Cache)

-(NSString *)imageCacheFolder{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    NSString *cacheFolderPath = [documentsDirectory stringByAppendingPathComponent:@"CacheImage"];
    if (![self fileExistsAtPath:cacheFolderPath]){
        [self createDirectoryAtPath:cacheFolderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return cacheFolderPath;
}
    
-(NSString *)uniqueImageName{
    return [NSString stringWithFormat:@"%@%04d%d",[self imageCacheFolder], arc4random()%10000,
                                                        (int)([[NSDate date] timeIntervalSince1970])];
}

-(UIImage *)imageFromDiskForPath:(NSString *)imagePath{
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:imagePath]];
}

-(NSData *)imageDataFromDiskForPath:(NSString *)imagePath{
    return [NSData dataWithContentsOfFile:imagePath];
}

-(BOOL)deleteImageFromDiskForPath:(NSString *)imagePath{
    return [self removeItemAtPath:imagePath error:nil];
}

-(void)clearAllImagesCache{
    NSString *cacheFolderPath=[self imageCacheFolder];
    for (NSString *file in [self contentsOfDirectoryAtPath:cacheFolderPath error:nil]){
        [self removeItemAtPath:[cacheFolderPath stringByAppendingPathComponent:file] error:nil];
    }
}

-(NSArray *)cacheFolderFilesName{
    return [self contentsOfDirectoryAtPath:[self imageCacheFolder] error:nil];
}

-(NSUInteger)countOfImageCacheFolder{
    return [[self cacheFolderFilesName] count];
}
@end