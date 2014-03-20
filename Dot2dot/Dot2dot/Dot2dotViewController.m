//
//  Dot2dotViewController.m
//  Dot2dot
//
//  Created by Mahesh on 3/23/13.
//  Copyright (c) 2013 unlv. All rights reserved.
//

#import "Dot2dotViewController.h"

@interface Dot2dotViewController ()
{
    int row_value,column_value;
}

@end
drawDot2dot *dot2dot;

@implementation Dot2dotViewController
@synthesize row,column,score1,score2,lblWinMsg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) showdot2dot{
    dot2dot = [[drawDot2dot alloc] initWithFrame:CGRectMake(15, 40, 300, 300)];
    dot2dot.row = row_value;
    dot2dot.column = column_value;
    self.row.text = [[NSNumber numberWithInt:row_value] stringValue];
    self.column.text = [[NSNumber numberWithInt:column_value] stringValue];
   
    self.view.backgroundColor= [UIColor blackColor];
    [score1 setTag:100];
    [score2 setTag:101];
    [lblWinMsg setTag:102];
    [dot2dot addSubview:score1];
    
    [dot2dot addSubview:score2];
    [dot2dot addSubview:lblWinMsg];
    [self.view addSubview:dot2dot];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    row_value = 4;
    column_value =4;
    [self showdot2dot];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reset:(id)sender {
    [sender resignFirstResponder];
    [self.row resignFirstResponder];
    [self.column resignFirstResponder];
    [dot2dot reset];
    row_value = [[self.row text]intValue];
    column_value = [[self.column text]intValue];
    if(row_value >=1 && row_value <= 8 && column_value >=1 && column_value <=8 )
    [self showdot2dot];
}
@end
