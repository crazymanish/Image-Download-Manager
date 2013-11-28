//
//  SWSUrlConnectionProtocol.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Manish Rathi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SWSOperation;
@protocol SWSOperationProtocol<NSObject>

@optional
//For Downloading-Progress
-(void)UrlOperation:(SWSOperation *)operation withProgress:(float)progress ofURLRequest:(NSURLRequest *)request;
//For URLConnection-Response
-(void)UrlOperation:(SWSOperation *)operation didReceiveResponse:(NSURLResponse *)response ofURLRequest:(NSURLRequest *)request;

@required
//For UIImage Data----After Downloading
-(void)UrlOperation:(SWSOperation *)operation withData:(NSMutableData *)data ofURLRequest:(NSURLRequest *)request;

//Need to Cancel-Operation Cancel Operation
-(void)NeedToCancelUrlOperation:(SWSOperation *)operation withImageData:(NSMutableData *)data;

//For Failure Handler
-(void)UrlOperation:(SWSOperation *)operation didFailWithError:(NSError *)error ofURLRequest:(NSURLRequest *)request;
@end
