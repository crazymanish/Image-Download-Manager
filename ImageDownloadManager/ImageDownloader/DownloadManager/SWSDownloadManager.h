//
//  SWSDownloadManager.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWSOperation.h"
#import "SWSDownloadManagerProtocol.h"

@interface SWSDownloadManager : NSObject

//Download-Queue
@property (nonatomic, strong) NSOperationQueue *downloadQueue;

//SingleTon Instance
+ (id)instance;

/**
 Set SWSDownloadManager Delegate
 */
@property(nonatomic,weak) id<SWSDownloadManagerProtocol> delegate;

//CACHE_LIMIT_TYPE
@property(nonatomic,strong) NSString *cacheLimitType;
//MAX-SIZE limit of Cache
@property (nonatomic) long long int sizeLimit;
//MAX-FILE limit in Cache
@property (nonatomic) NSUInteger filesLimit;

//DownLoadImage
-(void)downloadImageWithUrl:(NSURL *)url withDelegate:(id<SWSDownloadManagerProtocol>)delegate;

//Cancel-Operation
-(void)removeOperationFromQueue:(SWSOperation *)operation;

//Helper Method
- (NSDictionary *)loadCachedDataForURL:(NSURL*)url;
@end
