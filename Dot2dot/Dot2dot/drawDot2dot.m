//
//  drawDot2dot.m
//  Dot2dot
//
//  Created by Mahesh on 3/20/13.
//  Copyright (c) 2013 unlv. All rights reserved.
//

#import "drawDot2dot.h"

@implementation drawDot2dot

int x_source,y_source,x_dest,y_dest;
int comp_player = 1;
int total_comp_count=0,total_player_count=0;
BOOL box_flag = FALSE,h_edge_flag = FALSE,v_edge_flag=FALSE;
bool loop = false;

NSInteger h_edges[10][10];
NSInteger v_edges[10][10];
NSInteger boxes[10][10];
NSString *winMsg;

int height;
int width;
int thick;
int edge_width;
int edge_height;
int player=1;
int x,y,zz,count,u,v,nn;
int score[2];

int x_init;
int y_init;

@synthesize row,column,score1,score2;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}

-(void) reset{
    for (int i =0; i< column+1; i ++)
    {
        for (int j =0; j < row+1 ; j++)
        {
            boxes[i][j]=0;
            h_edges[i][j]=0;
            v_edges[i][j]=0;
            score[0] =0;
            score[1]=0;
            winMsg = @"";
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    

    int x,y;
    //row = 5;
    //column = 5;
    height = 250;
    width  = 250;
    thick  = 10;
    edge_width = (width- (column+1)*thick)/column;
    edge_height = (height -(row+1) * thick)/row;
    
    x_init = 15;
    y_init = 15;

    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(contextRef, 0, 0, 255, 0.1);
    //CGContextSetRGBFillColor(contextRef, 0, 10, 200, 0.2);
    
    CGContextSetRGBStrokeColor(contextRef, 0, 0, 255, 0.5);
    
    // Draw a circle (filled)
    //CGContextFillEllipseInRect(contextRef, CGRectMake(100, 100, 25, 25));
    
    // Draw a circle (border only)
    //CGContextStrokeEllipseInRect(contextRef, CGRectMake(100, 100, 25, 25));
    
    
    
    // Get the graphics context and clear it
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    for (int i =0; i<= column; i ++)
    {
        for (int j =0; j <= row ; j++)
        {
            x = x_init + i*(edge_width + thick);
            y = y_init + j*(edge_height + thick);
            //Draw each dot of thickness thick
            CGContextSetRGBFillColor(ctx, 255, 0, 0, 1);
            CGContextFillEllipseInRect(ctx, CGRectMake(x, y, thick, thick));
            //NSLog(@"x and ys are  %d %d %d %d",i,j,x,y);
        }
    }

        for (int i =0; i<= column; i ++)
        {
            for (int j =0; j <= row ; j++)
            {
                
            if(h_edges[i][j] >= 1)
            {
                x_source = x_init + i*(edge_width + thick);
                y_source = y_init + j*(edge_height + thick);
                
                x_dest = x_init + (i+1)*(edge_width + thick);
                y_dest = y_init + (j)*(edge_height + thick);
                
                [self drawLine:x_source :y_source :x_dest :y_dest: h_edges[i][j]];
            }
            
            if(v_edges[i][j]>=1)
            {
                x_source = x_init + i*(edge_width + thick);
                y_source = y_init + j*(edge_height + thick);
                
                x_dest = x_init + i*(edge_width + thick);
                y_dest = y_init + (j+1)*(edge_height + thick);
                
                [self drawLine:x_source :y_source :x_dest :y_dest: v_edges[i][j]];
            }
                //NSLog(@"box is %d %d %d",i,j,boxes[i][j]);
                if(boxes[i][j]>=4)
                {
                    x_source = x_init + i*(edge_width + thick);
                    y_source = y_init + j*(edge_height + thick);
                    
                    [self drawBox: x_source : y_source : edge_width:edge_height: boxes[i][j]];
                    
                    //comp_player = !comp_player;
                    
                    
                }
                
            
             
        }
    }
    
    //NSLog(@"row and column are %d %d",row,column);
    
    if(score[0] + score[1] == (row) * (column)){
        NSLog(@"I am inside final");
        if (score[0]>score[1])
            winMsg = @"Try again";
        else
            winMsg = @"Congratulations";
    }
    
    UILabel *score_label1 = (UILabel *)[self viewWithTag:101];
    score_label1.text = [[NSNumber numberWithInt: score[0]] stringValue];
    
    UILabel *score_label2 = (UILabel *)[self viewWithTag:100];
    score_label2.text = [[NSNumber numberWithInt: score[1]] stringValue];
    UILabel *win_label = (UILabel *)[self viewWithTag:102];
    win_label.text = winMsg;
    
    //super.score1.text = [[NSNumber numberWithInt: score1] stringValue];
    //super = [[NSNumber numberWithInt: dot2dot.score2] stringValue];
    
    /*
    //CGContextRef context=UIGraphicsGetCurrentContext();
    //NSLog(@"I am inside drawLine");
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx,[UIColor blueColor].CGColor);
    //CGContextMoveToPoint(contextRef, src_x,src_y);
    //CGContextAddLineToPoint(contextRef, dest_x,dest_y);
    
    CGContextMoveToPoint(ctx, 10,10);
    CGContextAddLineToPoint(ctx, 200,200);
    CGContextStrokePath(ctx);
    //NSLog(@"I am inside drawrect");
     */
    
}
-(void) drawBox : (int) src_x : (int)  src_y : (int) width  : (int) height : (int) comp_player
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //CGContextClearRect(ctx, rect);
    if (comp_player==4)
        CGContextSetRGBFillColor(ctx, 0, 255, 0, 1);
    else
        CGContextSetRGBFillColor(ctx, 0,255,255, 1);
    CGContextFillRect(ctx, CGRectMake(src_x+10, src_y+10, width, height));
}
-(void) drawLine: (int) src_x : (int)  src_y : (int) dest_x : (int) dest_y : (int) comp_player
{
    CGContextRef context=UIGraphicsGetCurrentContext();
   // NSLog(@"I am inside drawLine");
    CGContextSetLineWidth(context, 4.0);
    if (comp_player ==1 )
      CGContextSetStrokeColorWithColor(context,[UIColor blueColor].CGColor);
    else
      CGContextSetStrokeColorWithColor(context,[UIColor brownColor].CGColor);
    CGContextMoveToPoint(context, src_x + 5,src_y+5);
    CGContextAddLineToPoint(context, dest_x+5,dest_y+5);

    //CGContextMoveToPoint(context, 10,10);
    //CGContextAddLineToPoint(context, 200,200);
    CGContextStrokePath(context);

    
    //[self setNeedsDisplay];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint locationPoint = [[touches anyObject] locationInView:self];
   
   
    int edge_width_out = (width- (column+1)*thick)/column+thick;
    int edge_height_out = (height -(row+1 ) * thick)/row+thick;
    
   // NSLog(@"Player Turn is %d",player);
    
    //NSLog(@"x co-ordinate in load is %f",locationPoint.x);
    //NSLog(@"y co-ordinate in load is %f",locationPoint.y);
    
    float location_x = locationPoint.x - x_init;
    float location_y = locationPoint.y - y_init;
    
    float x_norm = (float)location_x/edge_width_out;
    float y_norm = (float)location_y/edge_height_out;
    
    float x_margin = (float) thick/edge_width_out;
    float y_margin = (float) thick/edge_height_out;
    
    float x_decimal = x_norm - floor(x_norm);
    float y_decimal = y_norm - floor(y_norm);
    
    int x_real    = (int)floor(x_norm);
    int y_real    = (int)floor(y_norm);
    /*
    NSLog(@"x norm is %f",x_norm);
    NSLog(@"y norm in %f",y_norm);
    NSLog(@"x real is %d",x_real);
    NSLog(@"y real in %d",y_real);
    NSLog(@"x decimal is %f",x_decimal);
    NSLog(@"y decimal in %f",y_decimal);
     */
    BOOL x_flag = FALSE,y_flag = FALSE;
    
    if(x_decimal < x_margin) x_flag = TRUE;
    
    if(y_decimal < y_margin) y_flag = TRUE;
    
    
    if(x_flag && !y_flag) {
        /*
        NSLog(@"x co-ordinate is %d",x_real);
        NSLog(@"y co-ordinate in %d",y_real);
        NSLog(@"next x co-ordinate is %d",x_real);
        NSLog(@"next y co-ordinate in %d",y_real +1);
        */
        
        if (v_edges[x_real][y_real] == 0)
        {
        //NSLog(@"I am inside vertial line");
            [self setvedge:x_real :y_real];
            //v_edges[x_real][y_real] = comp_player;
            v_edge_flag = TRUE;
        
            //boxes[x_real][y_real]++;
        }
        
    }
    if(!x_flag && y_flag) {
      /*
        NSLog(@"x co-ordinate is %d",x_real);
        NSLog(@"y co-ordinate in %d",y_real);
        NSLog(@"next x co-ordinate is %d",x_real + 1);
        NSLog(@"next y co-ordinate in %d",y_real);
       */
        if (h_edges[x_real][y_real] == 0)
        {
       //NSLog(@"I am inside horizontal line");

            [self sethedge:x_real :y_real];
            //h_edges[x_real][y_real] = comp_player;

            h_edge_flag = TRUE;
        }
    }
    /*
    
    for (int i =0; i< row; i ++)
    {
        for (int j =0; j < column ; j++)
        {
            if(boxes[i][j] == 0)
            {
            //NSLog(@"I am inside box %d %d",i,j);
            if(h_edges[i][j]>=1 && h_edges[i][j+1]>=1 && v_edges[i][j]>=1 && v_edges[i+1][j]>=1)
            {                
                
                boxes[i][j]=comp_player;
                box_flag = TRUE;
                if(comp_player ==1)
                    self.score1++;
                else
                    self.score2++;
               // break;

                
            }


            }
            //comp_player = !comp_player;
        }
    }
    
     NSLog(@"Player Turn is %d",comp_player);
    
    if ((h_edge_flag == TRUE || v_edge_flag == TRUE ) && box_flag == TRUE)
    {
        comp_player = comp_player;
    }
    else if (h_edge_flag == TRUE || v_edge_flag == TRUE )
    {
        if (comp_player ==1 ) comp_player =2;
        else
            comp_player =1;
    }
    h_edge_flag = FALSE;
    v_edge_flag = FALSE;
    box_flag = FALSE;
     */
    if(player ==0) [self  makemove];
    //[self drawLine:x_source :y_source :x_dest :y_dest];
    [self setNeedsDisplay];
}

///////////////////////////
 
 /*
-(void)restart{
 int i,j,x;
 score[0]=0;
 score[1]=0;
 for (i=0;i<=m;i++) {
 x=2*i*nn+1
 for (j=0;j<n;j++) {
 document.images[x+2*j].src=n3.src;
 hedge[i][j]=0;
 }
 }
 for (i=0;i<m;i++) {
 x=(2*i+1)*nn
 for (j=0;j<=n;j++) {
 document.images[x+2*j].src=n3.src;
 vedge[i][j]=0;
 }
 }
 for (i=0;i<m;i++) {
 x=(2*i+1)*nn+1
 for (j=0;j<n;j++) {
 document.images[x+2*j].src=n3.src;
 box[i][j]=0;
 }
 }
 if (player!=1) makemove();
 }*/
 
-(void) hmove : (int) i : (int) j {     //horizontal move by user
 if (h_edges[i][j]<1) {
     [self sethedge:i :j];
     //sethedge(i,j);
 if (score[0]+score[1]==row*column) {
 //alert("Game over.\r Score: Red = "+score[0]+",  Blue = "+score[1])
 } else if (player==0) [self makemove];
 }
 }
 
 -(void) vmove : (int) i : (int) j {     //vertical move by user
 if (v_edges[i][j]<1) {
     [self setvedge:i :j];
     //setvedge(i,j);
 if (score[0]+score[1]==row*column) {
 //alert("Game over.\r Score: Red = "+score[0]+",  Blue = "+score[1])
 } else if (player==0) [self makemove];
 }
 }
 
-(void)sethedge :(int)x : (int)y {      //Sets horizontal edge
    //NSLog(@"inside set hedge x and y is %d %d",x,y);
 h_edges[x][y]=player+1;
 if (y>0) boxes[x][y-1]++;
 if (y<row) boxes[x][y]++;
 //document.images[2*x*nn+2*y+1].src=n2.src;
    [self checkh:x :y];
    //checkh(x,y);
 player=1-player;
    //[self setNeedsDisplay];
 }
 
-(void)setvedge :(int)x : (int)y {      //Sets vertical edge
    //NSLog(@"inside set vedge x and y is %d %d",x,y);
 v_edges[x][y]=player+1;
 if (x>0) boxes[x-1][y]++;
 if (x<column) boxes[x][y]++;
 //document.images[(2*x+1)*nn+2*y].src=n2.src;
    [self checkv:x :y];
    //checkv(x,y);
 player=1-player;
    //[self setNeedsDisplay];
 }

-(void)takeedge :(int)zz : (int)x : (int)y
{    //Set hedge if zz=1 and vedge if zz=2.
    if (zz>1) [self setvedge:x :y];//setvedge(x,y);
 else [self sethedge:x :y];//sethedge(x,y);
 }
 
 -(void) makemove {
 [self takesafe3s];//takesafe3s();
 if ([self sides3 ]) {
 if ([self sides01 ]) {
 [self takeall3s ];
 [self takeedge:zz:x:y];
 } else {
     [self sac:u:v];
 }
 if (score[0]+score[1]==row*column) {
 //alert("Game over.\r Score: Red = "+score[0]+",  Blue = "+score[1])
 }
 } else if ([self sides01]) [self takeedge:zz:x:y];
 else if ([self singleton ]) [self takeedge:zz:x:y];
 else if ([self doubleton ]) [self takeedge:zz:x:y];
 else [self makeanymove];
 }
 
-(void) takesafe3s {     //Take all singleton and doubleton 3's.
 for (int i=0;i<row;i++) {
 for (int j=0;j<column;j++) {
 if (boxes[i][j]==3) {
 if (v_edges[i][j]<1) {
     if (j==0 || boxes[i-1][j]!=2)[ self setvedge:i:j ];
 } else if (h_edges[i][j]<1) {
 if (i==0 || boxes[i][j-1]!=2) [ self sethedge:i:j ];
 } else if (v_edges[i+1][j]<1) {
 if (j==row-1 || boxes[i+1][j]!=2) [ self setvedge:i+1:j ];
 } else {
 if (i==column-1 || boxes[i][j+1]!=2) [ self sethedge:i:j+1 ];
 }
 }
 }
 }
 }
 
 -(BOOL) sides3 {     //Returns true and u,v if there is a box(u,v)=3.
     for (int i=0;i<row;i++) {
         for (int j=0;j<column;j++) {
 if (boxes[i][j]==3) {
 u=i;
 v=j;
 return true;
 }
 }
 }
 return false;
 }
 
 -(void)takeall3s {
     while ([self sides3]) [self takebox: u : v];
 }

-(BOOL)sides01 {     //Returns true and zz,x,y if there is a safe edge(x,y).
 if ((arc4random()%100)/100<.5) zz=1; else zz=2;  //zz=1 if horizontal, zz=2 if vertical
 int i=(int)(column*(arc4random()%100)/100);
 int j=(int)(row*(arc4random()%100)/100);
 if (zz==1) {
     if ([self randhedge:i : j ]) return true;
 else {
 zz=2;
 if ([self randvedge:i : j ]) return true;
 }
 } else {
 if ([self randvedge:i : j ]) return true;
 else {
 zz=1;
 if ([self randhedge:i : j ]) return true;
 }
 }
 return false;
 }
 
-(BOOL)safehedge:(int)i : (int)j
{     //Returns true if (i,j) is a safe hedge
 if (h_edges[i][j]<1) {
 if (i==0) {
     if (boxes[i][j]<2) return true;
 } else if (i==column-1) {
     if (boxes[i][j-1]<2) return true;
 }
 else if (boxes[i][j]<2 && boxes[i][j-1]<2) return true;
 }
    return false;
 }
 
-(BOOL)safevedge:(int)i : (int)j{
 if (v_edges[i][j]<1) {
 if (j==0) {
     if (boxes[i][j]<2) return true;
 } else if (j==row-1) {
     if (boxes[i-1][j]<2) return true;
 }
 else if (boxes[i][j]<2 && boxes[i-1][j]<2) return true;
 }
    return false;
 }
 
 -(BOOL)randhedge:(int)i : (int)j{
 x=i;
 y=j;
 do {
     
 if ([self safehedge:x : y ]) return true;
 else {
 y++;
 if (y==row-1) {
 y=0;
 x++;
 if (x>column-1) x=0;
 }
 }
 } while (x!=i || y!=j);
     return false;
 }
 
 -(BOOL)randvedge:(int)i : (int)j {
 x=i;
 y=j;
 do {
 if ([self safevedge:x : y ]) return true;
 else {
 y++;
 if (y>row-1) {
 y=0;
 x++;
 if (x==column-1) x=0;
 }
 }
 } while (x!=i || y!=j);
     return false;
 }
 
-(BOOL)singleton{     //Returns true and zz,x,y if edge(x,y) gives exactly
 int numb;              //1 square away
 for (int i=0;i<column;i++) {
 for (int j=0;j<row;j++) {
 if (boxes[i][j]==2) {
 numb=0;
 if (h_edges[i][j]<1) {
 if (j<1 || boxes[i][j-1]<2) numb++;
 }
 zz=2;
 if (v_edges[i][j]<1) {
 if (i<1 || boxes[i-1][j]<2) numb++;
 if (numb>1) {
 x=i;
 y=j;
     NSLog(@"inside singletnon hedge x and y is %d %d",x,y);
 return true;
 }
 }
 if (v_edges[i+1][j]<1) {
 if (i+1==row || boxes[i+1][j]<2) numb++;
 if (numb>1) {
 x=i+1;
 y=j;
 return true;
 }
 }
 zz=1;
 if (h_edges[i][j+1]<1) {
 if (j+1==row || boxes[i][j+1]<2) numb++;
 if (numb>1) {
 x=i;
 y=j+1;
     NSLog(@"inside singleton hedge x and y is %d %d",x,y);
 return true;
 }
 }
 }
 }
 }
 return false;
 }
 
-(BOOL)doubleton{     //Returns true and zz,x,y if edge(x,y) gives away
 zz=2;                  //exactly 2 squares
 for (int i=0;i<column;i++) {
 for (int j=0;j<row;j++) {
 if (boxes[i][j]==2 && boxes[i+1][j]==2 && v_edges[i+1][j]<1) {
 if ([self ldub:i : j ] && [self rdub:i+1 : j]) {
 x=i+1;
 y=j;
     NSLog(@"I am inside doubleton %d %d %d",zz,x,y);
 return true;
 }
 }
 }
 }
 zz=1;
 for (int j=0;j<row;j++) {
 for (int i=0;i<column;i++) {
 if (boxes[i][j]==2 && boxes[i][j+1]==2 && h_edges[i][j+1]<1) {
 if ([self udub:i : j ] && [self ddub:i : j+1 ]) {
 x=i;
 y=j+1;
      NSLog(@"I am inside doubleton %d %d %d",zz,x,y);
 return true;
 }
 }
 }
 }
    return false;
 }
 
 -(BOOL)ldub:(int)i : (int)j{      //Given box(i,j)=2 and vedge(i,j+1)=0, returns true
 if (v_edges[i][j]<1) {      //if the other free edge leads to a box<2
 if (i<1 || boxes[i-1][j]<2) return true;
 } else if (h_edges[i][j]<1) {
 if (j<1 || boxes[i][j-1]<2) return true;
 } else if (i==column-1|| boxes[i][j+1]<2) {
     return true;
 }
     return false;
 }
 
 -(BOOL)rdub:(int)i : (int)j{
 if (v_edges[i+1][j]<1) {
 if (i+1==column || boxes[i+1][j]<2) return true;
 } else if (h_edges[i][j]<1) {
 if (j<1 || boxes[i][j-1]<2) return true;
 } else if (j+1==row || boxes[i][j+1]<2) {
     return true;
 }
     return false;
 }
 
 -(BOOL)udub:(int)i : (int)j {
 if (h_edges[i][j]<1) {
 if (j<1 || boxes[i][j-1]<2) return true;
 } else if (v_edges[i][j]<1) {
 if (i<1 || boxes[i-1][j]<2) return true;
 } else if (i==column-1 || boxes[i+1][j]<2) {
     return true;
 }
     return false;
 }
 
-(BOOL)ddub:(int)i : (int)j {
 if (h_edges[i][j+1]<1) {
 if (j==row-1 || boxes[i][j+1]<2) return true;
 } else if (v_edges[i][j]<1) {
 if (i<1 || boxes[i-1][j]<2) return true;
 } else if (i==column-1 || boxes[i+1][j]<2) {
     return true;
 }
    return false;
 }
 
-(void)sac:(int)i : (int)j {     //sacrifices two squares if there are still 3's
 count=0;
 loop=false;
    [self incount:0:i : j ];
 //incount(0,i,j);
    if (!loop) [self takeallbut :i : j ];
 if (count+score[0]+score[1]==row*column) {
     [self takeall3s];
 //    takeall3s();
 } else {
 if (loop) {
 count=count-2;
 }
[self outcount:0:i : j ];
 i=row;
 j=column;
 }
 }
 
-(void) incount : (int)k :(int)i :(int)j{  //enter with box[i][j]=3 and k=0
 count++;               //returns count = number in chain starting at i,j
 if (k!=1 && v_edges[i][j]<1) {     //k=1,2,3,4 means skip left,up,right,down.
 if (i>0) {
 if (boxes[i-1][j]>2) {
 count++;
 loop=true;
 } else if (boxes[i-1][j]>1) [self incount:3:i-1 : j];
 }
 } else if (k!=2 && h_edges[i][j]<1) {
 if (j>0) {
 if (boxes[i][j-1]>2) {
 count++;
     loop=true;
 } else if (boxes[i][j-1]>1) [self incount:4 :i : j-1];
 }
 } else if (k!=3 && v_edges[i+1][j]<1) {
 if (i<column-1) {
 if (boxes[i+1][j]>2) {
 count++;
     loop=true;
 } else if (boxes[i+1][j]>1) [self incount:1:i+1 : j ];
 }
 } else if (k!=4 && h_edges[i][j+1]<1) {
 if (j<row-1) {
 if (boxes[i][j+1]>2) {
 count++;
     loop=true;
 } else if (boxes[i][j+1]>1) [self incount:2:i : j+1 ];
 }
 }
 }
 
 -(void) takeallbut: (int) x : (int) y{
     while ([self sides3not: x : y]) {
 //takebox(u,v);
         [self takebox:u :v];
 }
 }
 
 -(BOOL) sides3not:(int)x : (int)y{
 for (int i=0;i<column;i++) {
 for (int j=0;j<row;j++) {
 if (boxes[i][j]==3) {
 if (i!=x || j!=y) {
 u=i;
 v=j;
 return true;
 }
 }
 }
 }
     return false;
 }
 
 -(void) takebox:(int)i : (int)j{
 if (h_edges[i][j]<1) [self sethedge:i :j];
 else if (v_edges[i][j]<1) [self setvedge:i :j];
 else if (h_edges[i][j+1]<1) [self sethedge:i :j+1];
 else [self setvedge:i+1 :j];
 }

-(void) outcount : (int)k :(int)i :(int)j{     //Takes all but count-2 squares and exits
 if (count>0) {
 if (k!=1 && v_edges[i][j]<1) {
 if (count!=2) [self setvedge:i :j];
 count--;
     [self outcount:3 :i-1 :j];
     //outcount(3,i,j-1);
 } else if (k!=2 && h_edges[i][j]<1) {
 if (count!=2) [self sethedge:i :j];
 count--;
     [self outcount:4 :i :j-1];
     //outcount(4,i-1,j);
 } else if (k!=3 && v_edges[i+1][j]<1) {
 if (count!=2) [self setvedge:i+1 :j];
 count--;
     [self outcount:1 :i+1 :j];
     //outcount(1,i,j+1);
 } else if (k!=4 && h_edges[i][j+1]<1) {
 if (count!=2) [self sethedge:i :j+1];;
 count--;
     [self outcount:2 :i :j+1];
     //outcount(2,i+1,j);
 }
 }
 }
 
-(void) makeanymove{
 x=-1;
 for (int i=0;i<column;i++) {
 for (int j=0;j<row;j++) {
 if (h_edges[i][j]<1) {
 x=i;
 y=j;
 i=column+1;
     j=row;
 }
 }
 }
 if (x<0) {
 for (int i=0;i<column;i++) {
 for (int j=0;j<row;j++) {
 if (v_edges[i][j]<1) {
 x=i;
 y=j;
 i=column;
 j=row+1;
 }
 }
     
 }
     [self setvedge:x :y];
     //setvedge(x,y);
 } else {
     [self sethedge:x :y];
 //sethedge(x,y);
 }
    NSLog(@"I am inside makeanymove: %d %d",x ,y );
    if (player==0) [self makemove];//makemove();
 }
 
 -(void) checkh:(int)x : (int)y {     //check if hedge move scores any points
 int hit=0;
 if (y>0) {
 if (boxes[x][y-1]==4) {
// int uu=x-1;
 //document.images[(2*uu+1)*nn+2*y+1].src=flag[player];
     boxes[x][y-1] = 4 + player;
 score[player]++;
 hit=1;
 }
 }
 if (y<row) {
 if (boxes[x][y]==4) {
 //document.images[(2*x+1)*nn+2*y+1].src=flag[player];
     boxes[x][y] = 4+ player;
 score[player]++;
 hit=1;
 }
 }
 if (hit>0) player=1-player;
 }
 
-(void) checkv:(int)x : (int)y {
 int hit=0;
 if (x>0) {
 if (boxes[x-1][y]==4) {
 //int vv=y-1;
 //document.images[(2*x+1)*nn+2*vv+1].src=flag[player];
     boxes[x-1][y] = 4+player;
 score[player]++;
 hit=1;
 }
 }
 if (x<column) {
 if (boxes[x][y]==4) {
 //document.images[(2*x+1)*nn+2*y+1].src=flag[player];
     boxes[x][y] = 4+player;
 score[player]++;
 hit=1;
 }
 }
 if (hit>0) player=1-player;
 }
 
 
 
 ///////////////

@end
