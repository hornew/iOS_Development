//
//  BookmarkDetailViewController.h
//  Bookmark
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookmarkDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) NSURL * url;

@end
