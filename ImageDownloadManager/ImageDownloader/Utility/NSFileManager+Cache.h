//
//  NSFileManager+Cache.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Cache)

//Cache Folder Path
-(NSString *)imageCacheFolder;

//Get Unique Image Name
-(NSString *)uniqueImageName;
    
//Get Image From Local
-(UIImage *)imageFromDiskForPath:(NSString *)imagePath;
-(NSData *)imageDataFromDiskForPath:(NSString *)imagePath;

//Remove Image
-(BOOL)deleteImageFromDiskForPath:(NSString *)imagePath;

//Clear All-Images Cache
- (void)clearAllImagesCache;

//Return Cache-Folder Files'name Array
-(NSArray *)cacheFolderFilesName;

//Return Count of Cache-Folder
-(NSUInteger)countOfImageCacheFolder;
@end
