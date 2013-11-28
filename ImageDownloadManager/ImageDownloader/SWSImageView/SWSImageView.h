//
//  SWSImageView.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PROGRESS_NONE,
    PROGRESS_CIRCLE,
    PROGRESS_GRAY_ACTIVITY,
    PROGRESS_WHITE_ACTIVITY,
    PROGRESS_WHITE_LARGE_ACTIVITY,
    PROGRESS_BAR,
    PROGRESS_CUSTOM
}ProgressViewStyle;

@interface SWSImageView : UIImageView

//Load-Image (with No Progress-Indicator)
-(void)loadImageWithUrl:(NSURL *)url;
-(void)loadImageWithUrl:(NSURL *)url withDefaultImage:(UIImage *)defaultImg;

//Load-Image (with Progress-Indicator)
-(void)loadImageWithUrl:(NSURL *)url ProgressViewStyle:(ProgressViewStyle)progressStyle;
-(void)loadImageWithUrl:(NSURL *)url withDefaultImage:(UIImage *)defaultImg ProgressViewStyle:(ProgressViewStyle)progressStyle;
@end