//
//  CRateViewController.h
//  Collaborate
//
//  Created by Horne, William Austin on 11/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRateViewController : UIViewController

- (IBAction)palettePopout:(id)sender;

- (IBAction)brushesPopout:(id)sender;

- (IBAction)deleteButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end
