//
//  SWSOperation.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWSOperationProtocol.h"

@interface SWSOperation : NSOperation<NSURLConnectionDelegate,NSURLConnectionDataDelegate>

/**
 The request used by the operation's connection.
 */
@property (nonatomic, strong) NSURLRequest *request;

/**
 The data received during the request.
 */
@property (nonatomic, strong) NSMutableData *responseData;

/**
 Set UrlConnection 
 */
@property (nonatomic, strong) NSURLConnection *connection;

/**
 Set SWSOperation Delegate
 */
@property(nonatomic,weak) id<SWSOperationProtocol> delegate;

/**
@param urlRequest The request object to be used by the operation connection.
*/
- (id)initWithRequest:(NSURLRequest *)urlRequest withDelegate:(id)delegate;
- (id)initWithRequest:(NSURLRequest *)urlRequest withDelegate:(id)delegate withCacheType:(NSString *)cacheType;
- (id)initWithRequest:(NSURLRequest *)urlRequest withDelegate:(id)delegate withCacheType:(NSString *)cacheType withPriorityType:(NSString *)priorityType;
@end