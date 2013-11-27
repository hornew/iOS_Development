//
//  EDViewController.m
//  EmailDemo
//
//  Created by Horne, William Austin on 11/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "EDViewController.h"

@implementation EDViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)emailButton:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController * mail = [[MFMailComposeViewController alloc] init];
        
        mail.mailComposeDelegate = self;
        [mail setSubject:@"My first e-mail"];
        [mail setMessageBody:@"Content of my message" isHTML:NO];
        NSArray * recipients = [NSArray arrayWithObject:@"hornew@goldmail.etsu.edu"];
        [mail setToRecipients:recipients];
        [mail setModalPresentationStyle:UIModalPresentationPageSheet];
        //[self presentModalViewController:mail animated:YES];
        [self presentViewController:mail animated:YES completion:nil];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Email not supported" message:@"Email is not supported on devices running iOS versions older than version 3.0" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        alert = nil;
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    UIAlertView * alert = [UIAlertView alloc];
    switch (result) {
        case MFMailComposeResultSent:
            [alert initWithTitle:@"Message sent" message:@"Message successfully sent" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            break;
            
        case MFMailComposeResultSaved:
            [alert initWithTitle:@"Message saved" message:@"Message successfully saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            break;
            
        case MFMailComposeResultCancelled:
            [alert initWithTitle:@"Message cancelled" message:@"Message composition cancelled" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            break;
            
        case MFMailComposeResultFailed:
            [alert initWithTitle:@"Message failed" message:@"Message sending failed" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            break;
            
        default:
            break;
    }
    [alert show];
    alert = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
