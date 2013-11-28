//
//  CustomCell.m
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import "CustomCell.h"
@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

//Set-Cell Data
-(void)setCellData:(id)data{
    
    // Customize cell here.
    
    
    //Load-Image
    NSURL *imageUrl=[NSURL URLWithString:data];
    [_imgView loadImageWithUrl:imageUrl ProgressViewStyle:PROGRESS_CIRCLE];
}
@end