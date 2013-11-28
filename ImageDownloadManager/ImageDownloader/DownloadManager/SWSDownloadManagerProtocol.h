//
//  SWSDownloadManagerProtocol.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWSDownloadManager;
@class SWSOperation;
@protocol SWSDownloadManagerProtocol <NSObject>

@required
//For Operation
-(void)DownloadManager:(SWSDownloadManager *)downloadManager withOperation:(SWSOperation *)imageOperation ofURL:(NSURL*)url;

//For Cache-Image
-(void)DownloadManager:(SWSDownloadManager *)downloadManager withData:(NSData *)data ofURL:(NSURL*)url;
@end