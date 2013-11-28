//
//  CustomCell.h
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWSImageView.h"
@interface CustomCell : UITableViewCell

//Image-View
@property (weak, nonatomic) IBOutlet SWSImageView *imgView;

//Set Cell-Data
-(void)setCellData:(id)data;
@end
