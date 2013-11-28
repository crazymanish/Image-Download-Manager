//
//  ViewController.m
//  ImageDownloadManager
//
//  Created by Manish Rathi on 19/11/13.
//  Copyright (c) 2013 Softway Solutions. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _tblView.backgroundColor=[UIColor grayColor];
    
	_imagesData = [NSMutableArray array];
    struct {
        short unsigned end;
        short unsigned start;
        char *url;
    }images[3] =
    {{89, 49, "http://i13.mangareader.net/naruto/650/naruto-45061%02d.jpg"},
        {85, 51, "http://i40.mangareader.net/naruto/651/naruto-45170%02d.jpg"},
        {305, 265, "http://i11.mangareader.net/naruto/652/naruto-4528%03d.jpg"}};
    
    for (int i = 0; i < 3; i++) {
        int end = images[i].end;
        for (int j = images[i].start; j <= end; j+=2) {
            [_imagesData addObject:[NSString stringWithFormat:[NSString stringWithCString:images[i].url encoding:NSUTF8StringEncoding], j]];
        }
    }
    
 //   NSLog(@"arrURLs =%@",_imagesData);
    [_tblView reloadData];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_imagesData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    [cell setCellData:[_imagesData objectAtIndex:indexPath.row]];
    return cell;
}

@end