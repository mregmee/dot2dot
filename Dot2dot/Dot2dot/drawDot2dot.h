//
//  drawDot2dot.h
//  Dot2dot
//
//  Created by Mahesh on 3/20/13.
//  Copyright (c) 2013 unlv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface drawDot2dot : UIView

@property NSInteger row;
@property NSInteger column;
@property NSInteger score1,score2;
-(void) drawLine: (int) src_x : (int)  src_y : (int) dest_x : (int) dest_y : (int) comp_player;
-(void) drawBox : (int) src_x : (int)  src_y : (int) width  : (int) height : (int) comp_player;
-(void) reset;
-(void) restart;
-(void) hmove : (int) i : (int) j;
-(void) vmove : (int) i : (int) j;
-(void)sethedge :(int)x : (int)y;
-(void)setvedge :(int)x : (int)y;
-(void)takeedge :(int)zz : (int)x : (int)y;
-(void) makemove;
-(void) takesafe3s;
-(BOOL) sides3;
-(void) takeall3s;
-(BOOL) sides01;
-(BOOL)safehedge:(int)i : (int)j;
-(BOOL)safevedge:(int)i : (int)j;
-(BOOL)randhedge:(int)i : (int)j;
-(BOOL)randvedge:(int)i : (int)j;
-(BOOL)singleton;
-(BOOL)doubleton;
-(BOOL)ldub:(int)i : (int)j;
-(BOOL)rdub:(int)i : (int)j;
-(BOOL)udub:(int)i : (int)j;
-(BOOL)ddub:(int)i : (int)j;
-(void)sac:(int)i : (int)j;
-(void) incount : (int)k :(int)i :(int)j;
-(void) takeallbut: (int) x : (int) y;
-(BOOL) sides3not:(int)x : (int)y;
-(void) takebox:(int)i : (int)j;
-(void) outcount : (int)k :(int)i :(int)j;
-(void) makeanymove;
-(void) checkh:(int)x : (int)y;
-(void) checkv:(int)x : (int)y;


@end
