//
//  SWSDownloadManager.m
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import "SWSDownloadManager.h"
#import "NSFileManager+Cache.h"
#import "ImageDownloaderSetting.h"

@interface SWSDownloadManager (){
    NSString *SWSCachePolicyType;
    NSString *SWSClearCacheType;
    NSString *SWSCachePriorityType;
}
@end

@implementation SWSDownloadManager
static SWSDownloadManager *sharedInstance = nil;

#pragma mark - Singleton Instance
+ (id)instance{
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        //Download Queue
        _downloadQueue=[[NSOperationQueue alloc] init];
       
        /**
         Set MAX_CONURRENT_DOWNLOADS_LIMIT
         */
      //  _downloadQueue.maxConcurrentOperationCount=3;
        
        /**
         Set CACHE_POLICY
         */
        SWSCachePolicyType=SWSCachePolicyTypeDownloadOnce;
        
        /**
         Set CACHE_POLICY
         */
        SWSClearCacheType=SWSClearCacheNone;
        
        /**
         Set CACHE_LIMIT_TYPE
         */
        _cacheLimitType=SWSCacheLimitNone;
        
        /**
         Set CACHE_MAX_SIZE_LIMIT
         */
        _sizeLimit = 50000000;
        
        /**
         Set CACHE_MAX_FILES_LIMIT
         */
        _filesLimit = 500;
        
        /**
         Set CACHE_PRIORITY
         */
        SWSCachePriorityType=SWSCachePrioritySmall;
    }
    return self;
}

#pragma mark - Fetch Image
-(void)downloadImageWithUrl:(NSURL *)url withDelegate:(id<SWSDownloadManagerProtocol>)delegate{
    //Return Cache Image ----based on cache-policy
    if (SWSCachePolicyType==SWSCachePolicyTypeDownloadOnce) {
        NSDictionary *cachedImageData = [self loadCachedDataForURL:url];
        if (cachedImageData!=nil) {
            NSFileManager *fileManager=[NSFileManager defaultManager];
            if ([fileManager fileExistsAtPath:cachedImageData[SWSImageLocalPath]]) {
                if (delegate && [delegate respondsToSelector:@selector(DownloadManager:withData:ofURL:)]) {
                    [delegate DownloadManager:self withData:[fileManager contentsAtPath:cachedImageData[SWSImageLocalPath]] ofURL:url];
                }
                return;
            }
        }
    }
    
    //Request for Downloading Image
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url];
    SWSOperation *operation=[[SWSOperation alloc] initWithRequest:urlRequest withDelegate:delegate withCacheType:SWSCachePolicyType withPriorityType:SWSCachePriorityType];
    
    //Send delegate to ImageView
    if (delegate && [delegate respondsToSelector:@selector(DownloadManager:withOperation:ofURL:)]) {
        [delegate DownloadManager:self withOperation:operation ofURL:url];
    }
    
    //add operation into Queue
    [self.downloadQueue addOperation:operation];
}

#pragma mark - Cancel Operation
-(void)removeOperationFromQueue:(SWSOperation *)operation{
    //Make sure, Our operation should removed from Queue 
    for (SWSOperation* op in self.downloadQueue.operations) {
        if ([operation isEqual:op]) {
            [operation cancel];
            return;
        }
    }
}

#pragma mark - Helper Methods
- (NSDictionary *)loadCachedDataForURL:(NSURL*)url{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arrStoredImages = [[ud objectForKey:SWSCacheImages] mutableCopy];
    for (int i = 0; i < arrStoredImages.count ; i++) {
        NSDictionary *objImage = arrStoredImages[i];
        if([objImage[SWSImageUrl] isEqualToString:[url absoluteString]]) {
            NSFileManager *manager = [NSFileManager defaultManager];
            if(![manager fileExistsAtPath:objImage[SWSImageLocalPath]]){
                [arrStoredImages removeObjectAtIndex:i];
                [ud setObject:arrStoredImages forKey:SWSCacheImages];
                [ud synchronize];
                i--;
                continue;
            }
            NSMutableDictionary *dicImageData = [objImage mutableCopy];
            dicImageData[SWSImageFetchCount] = @([dicImageData[SWSImageFetchCount] integerValue]+1);
            [arrStoredImages replaceObjectAtIndex:i withObject:dicImageData];
            [ud setObject:arrStoredImages forKey:SWSCacheImages];
            [ud synchronize];
            return dicImageData;
        }
    }
    return nil;
}
@end