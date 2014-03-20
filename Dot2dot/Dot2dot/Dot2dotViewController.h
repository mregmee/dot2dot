//
//  Dot2dotViewController.h
//  Dot2dot
//
//  Created by Mahesh on 3/23/13.
//  Copyright (c) 2013 unlv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "drawDot2dot.h"

@interface Dot2dotViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *score1;
@property (weak, nonatomic) IBOutlet UILabel *score2;
@property (weak, nonatomic) IBOutlet UITextField *row;
@property (weak, nonatomic) IBOutlet UITextField *column;
@property (weak, nonatomic) IBOutlet UILabel *lblWinMsg;

- (IBAction)reset:(id)sender;
-(void)showdot2dot;
@end
