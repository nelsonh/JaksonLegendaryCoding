//
//  ViewController.m
//  casino2
//
//  Created by mobile on 12/7/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"
//#import "NSTimer+Extras.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize loginView,loginBut,userName,passWord;

@synthesize loginImg,loadingView;

@synthesize betView;
@synthesize betViewBG;
@synthesize btnChangeTable;
@synthesize btnDetail;
@synthesize btnRecord;
@synthesize btnClear;
@synthesize btnBet;
@synthesize videoImage;
@synthesize underImage;
@synthesize historyTable;
@synthesize scrollView1;
@synthesize pickSelectChips;
@synthesize pickerData;
@synthesize btnChangeMoney;
@synthesize arrPick1, arrPick2, arrPick3,arrPick4;
@synthesize creditLabel,lblCountDown,betTotalLabel,dealerName;
@synthesize btnBet1,btnBet2,btnBet3,btnBet4,btnBet5,btnBet6,btnBet7,btnBet8,btnBet9,btnBet10,btnBet11;
@synthesize btnDetail1,btnDetail2,btnDetail3,btnDetail4;
@synthesize imgMoney1,imgMoney2,imgMoney3,imgMoney4,imgCover;
@synthesize btnMoney1,btnMoney2,btnMoney3,btnMoney4;
@synthesize baB_Bet1,baB_Bet2,baB_Bet3,baB_Bet4,baB_Bet5,baB_Bet6,baB_Bet7,baB_Bet8,baB_Bet9,baB_Bet10,baB_Bet11;
@synthesize baS_Bet1,baS_Bet2,baS_Bet3,baS_Bet4,baS_Bet5,baS_Bet6,baS_Bet7,baS_Bet8,baS_Bet9,baS_Bet10,baS_Bet11;
@synthesize baI_Bet1,baI_Bet2,baI_Bet3,baI_Bet4,baI_Bet5,baI_Bet6,baI_Bet7,baI_Bet8,baI_Bet9,baI_Bet10,baI_Bet11;
@synthesize baL_Bet1,baL_Bet2,baL_Bet3,baL_Bet4,baL_Bet5,baL_Bet6,baL_Bet7,baL_Bet8,baL_Bet9,baL_Bet10,baL_Bet11; 
@synthesize baE_Bet1,baE_Bet2,baE_Bet3,baE_Bet4,baE_Bet5,baE_Bet6,baE_Bet7,baE_Bet8,baE_Bet9,baE_Bet10,baE_Bet11;
@synthesize showSpacePoker1, showSpacePoker2,showSpacePoker3,showSpacePoker4,showSpacePoker5,showSpacePoker6;
@synthesize showPokerNote;
@synthesize labPlayerNum,labBankerNum;
@synthesize btnRelogin, btnRoadMap;
@synthesize IVmessageBox;
@synthesize LmessageLab;
@synthesize imgRoadMapBG,imgAllRoadMapBG;
@synthesize scrviewRoadmap,scrDetail;
@synthesize countBanker,countPlayer,countTie;
@synthesize btnBankAsk,btnPlayAsk;
@synthesize myUIPageControl;
@synthesize D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11;//下注區已下注;
@synthesize scrDetal1, scrDetal2, scrDetal3, webViewDetail1,textviewDetail1;
@synthesize scrchangeTable;
@synthesize btnchang1,btnchang2,btnchang3,btnchang4,btnchang5,btnchang6,btnchang7,btnchang8,btnchang9,btnchang10;
@synthesize labchang1,labchang2,labchang3,labchang4,labchang5,labchang6,labchang7,labchang8,labchang9,labchang10;
@synthesize imgChangeFront1,imgChangeFront2,imgChangeFront3,imgChangeFront4,imgChangeFront5,imgChangeFront6,imgChangeFront7,imgChangeFront8,imgChangeFront9,imgChangeFront10;
@synthesize betNavigationBarLabel,gameNameLabel,userNameLabel;
@synthesize table;
@synthesize list,dateList,heroicaArray,heroicaArrayDetail;
@synthesize Op1,Op2,Op3,Op4,Op5,Op6;
@synthesize labRoundID,labTableID,labOrderTime,labOther,labBanker,labPlayer,labTotal,labTotalPay;
@synthesize Oa1,Oa2,Oa3,Oa4,Oa5,Oa6,Oa7,Oa8,Oa9,Oa10,Oa11,Oa12,Oa13;
@synthesize Ob1,Ob2,Ob3,Ob4,Ob5,Ob6,Ob7,Ob8,Ob9,Ob10,Ob11,Ob12,Ob13;
@synthesize Oc1,Oc2,Oc3,Oc4,Oc5,Oc6,Oc7,Oc8,Oc9,Oc10,Oc11,Oc12,Oc13;
@synthesize Od1,Od2,Od3,Od4,Od5,Od6,Od7,Od8,Od9,Od10,Od11,Od12,Od13,Oscor1;
@synthesize changeBG,changeFront,changeTitle,changeTop,changeUnder;
@synthesize videoSwitch,seedSegmented,scrhistoryTable,scrChipTable;

NSTimer *timer;           //視訊源使用
NSTimer *allCountTimer;   //選桌倒數使用
NSTimer *askTimer;
NSString *allRoadmapData[30];
//NSString *server= @"http://183.182.70.199:80";


NSString *server= @"http://183.182.66.173:80";
NSString *url=  @"/baccarathd1/sd2.jpg";
NSString *quality = @"sd";
NSString *recodeurl= @"https://es.esball.com/app/user_betrecord.php";
NSString *recodeDetailUrl= @"https://es.esball.com/app/user_betrecord.php";
AVAudioPlayer * bgAvPlayer;
NSArray *myMoneys ; 

struct userInfo myUserInfo;
struct gameInfo myGameInfo;
struct betAreaInfo bac1;
struct betAreaInfo bac2;
struct betAreaInfo bac3;
struct betAreaInfo bac4;
struct betAreaInfo bac5;
struct betAreaInfo bacinit;
struct betMoneys myBetMoney;


NSString *roundSerial; //gameinfo已有 ，記憶體問題暫存用; 
#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];   
    
  
    #ifdef DEBUG
      userName.text=@"james1";
      passWord.text=@"pweptd11";
      
    #endif
    
        [self.view bringSubviewToFront:loginView];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *textToLoad = [prefs stringForKey:@"keyToFindText"];
    userName.text =textToLoad;
    

    
       allCountTimer  =  [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(getCountData:) userInfo:nil repeats:YES]  ; 
    [allCountTimer invalidate];
   // [timer invalidate];
  //   timer = nil;
    allCountTimer=nil;
    scrchangeTable.hidden=YES;
    [self.userName setDelegate:self];
    [self.userName setReturnKeyType:UIReturnKeyDone];
    [self.userName addTarget:self action:@selector(userNameFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.passWord setDelegate:self];
    [self.passWord setReturnKeyType:UIReturnKeyDone];
    [self.passWord addTarget:self action:@selector(passWordFinished:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
    
  //  UIButton *button =  [UIButton buttonWithType:UIButtonTypeCustom];
   // [button setImage:[UIImage imageNamed:@"test1.png"] forState:UIControlStateNormal];
   // [button addTarget:self action:@selector(blah) forControlEvents:UIControlEventTouchUpInside];
   // [button setFrame:CGRectMake(0, 0, 32, 32)];
  //  self.betNavigationBar.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
   // NSError *setCategoryError = nil;
//	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    
    NSURL *murl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],@"Background.WAV"]];
    _backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:murl error:nil];
    _backgroundMusicPlayer.numberOfLoops = -1;
    [_backgroundMusicPlayer prepareToPlay];
   
    UIButton *checkbox ;
    BOOL checkBoxSelected;
    checkbox = [[UIButton alloc] initWithFrame:CGRectMake(50,50,20,20)];
              
                
                [checkbox setBackgroundImage:[UIImage imageNamed:@"notselectedcheckbox.png"]
                                    forState:UIControlStateNormal];
                [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                                    forState:UIControlStateSelected];
                [checkbox setBackgroundImage:[UIImage imageNamed:@"selectedcheckbox.png"]
                                    forState:UIControlStateHighlighted];
                checkbox.adjustsImageWhenHighlighted=YES;
             //   [checkbox addTarget.....]
                [self.view addSubview:checkbox];
    
	// Create audio player with background music
	//NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:@"background-music-aac" ofType:@"caf"];
	//NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
	//NSError *error;
	//_backgroundMusicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
	//[_backgroundMusicPlayer setDelegate:self];  // We need this so we can restart after interruptions
	//[_backgroundMusicPlayer setNumberOfLoops:-1];	// Negative number means loop forever
    
    
    [self hiden_Roadmap:YES];
    [self initData];
    
}

- (IBAction)userNameFinished:(id)sender
{
    [userName resignFirstResponder];
}

- (IBAction)passWordFinished:(id)sender
{
    [passWord resignFirstResponder];
}

-(IBAction) segmentedControlIndexChanged:(id)sender{
    
    [timer invalidate];
    timer = nil;
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
   switch (selectedSegment) {          
        case 0:          
           [prefs  setObject:@"0" forKey:@"keyToVidoeSeed"];  
           timer=  [NSTimer scheduledTimerWithTimeInterval:100000 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            break;            
        case 1:
            [prefs setObject:@"2" forKey:@"keyToVidoeSeed"];   
           timer=  [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            break;
        case 2:
             [prefs setObject:@"5" forKey:@"keyToVidoeSeed"];   
           timer=  [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            break;
        case 3:
             [prefs setObject:@"8" forKey:@"keyToVidoeSeed"];   
           timer=  [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            break;
        case 4:
            [prefs setObject:@"12" forKey:@"keyToVidoeSeed"];     
           timer=  [NSTimer scheduledTimerWithTimeInterval:0.09 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            break;        
        default:           
            break;            
    }
       
   // NSLog([NSString stringWithFormat:@"%@d", selectedSegment] );   
}

-(IBAction)chickSwitch
{
  
    
      NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *quality_;
    
    if (videoSwitch.on)  {
         [prefs setObject:@"640" forKey:@"keyToVidoesize"];
           quality_=@"hd";
        NSLog(@"123");

    }
    else {
         [prefs setObject:@"320" forKey:@"keyToVidoesize"];
          quality_=@"sd";
         NSLog(@"321");
    }
    
    if (1 == myUserInfo.changeindex)  
        url= [NSString stringWithFormat: @"/baccarat%@1/sd2.jpg",quality_] ;
    if (2 ==myUserInfo.changeindex)  
        url= [NSString stringWithFormat: @"/baccarat%@2/sd2.jpg",quality_] ;
    if (3 ==myUserInfo.changeindex)  
        url= [NSString stringWithFormat: @"/baccarat%@3/sd2.jpg",quality_] ;
    if (4 ==myUserInfo.changeindex)  
        url= [NSString stringWithFormat: @"/baccarat%@4/sd2.jpg",quality_] ;
    if (5 ==myUserInfo.changeindex)  
        url= [NSString stringWithFormat: @"/baccarat%@5/sd2.jpg",quality_] ;
   
    
}

- (IBAction)down_money1
{
     betMoney=myBetMoney.betmoney1;
    
    [btnMoney1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f_down.png",myBetMoney.betmoney1] ] forState:UIControlStateNormal];
    [btnMoney2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney2] ] forState:UIControlStateNormal];
    [btnMoney3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney3] ] forState:UIControlStateNormal];
    [btnMoney4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney4] ] forState:UIControlStateNormal];
   
}

-(void)detailHide:(bool)ishide
{
    scrDetal1.hidden=ishide;
    scrDetal2.hidden=ishide;
    scrDetal3.hidden=ishide;
    webViewDetail1.hidden=ishide;
   
    [btnDetail1 setImage:[UIImage imageNamed:@"basicBtn_01_up.png"] forState:UIControlStateNormal];
    [btnDetail2 setImage:[UIImage imageNamed:@"basicBtn_02_up.png"] forState:UIControlStateNormal];
    [btnDetail3 setImage:[UIImage imageNamed:@"basicBtn_03_up.png"] forState:UIControlStateNormal];
    [btnDetail4 setImage:[UIImage imageNamed:@"basicBtn_04_up.png"] forState:UIControlStateNormal];
    
}
- (IBAction) down_btnDetail1
{
    [self detailHide:YES] ;
    scrDetal1.hidden=NO;
    [btnDetail1 setImage:[UIImage imageNamed:@"basicBtn_01_down.png"] forState:UIControlStateNormal];
    [scrDetal1 setFrame:CGRectMake(450,112,479,105)];

}
- (IBAction) down_btnDetail2
{
     [self detailHide:YES] ;
    scrDetal2.hidden=NO;
    [btnDetail2 setImage:[UIImage imageNamed:@"basicBtn_02_down.png"] forState:UIControlStateNormal];
    [scrDetal2 setFrame:CGRectMake(460,56,455,496)];

}
- (IBAction) down_btnDetail3
{
     [self detailHide:YES] ;
    webViewDetail1.hidden=NO;
    [btnDetail3 setImage:[UIImage imageNamed:@"basicBtn_03_down.png"] forState:UIControlStateNormal];
    [webViewDetail1 setFrame:CGRectMake(397,61,627,556)];

       }
- (IBAction) down_btnDetail4
{
    [self detailHide:YES] ;
     scrDetal3.hidden=NO;
    [btnDetail4 setImage:[UIImage imageNamed:@"basicBtn_04_down.png"] forState:UIControlStateNormal];
     [scrDetal3 setFrame:CGRectMake(450,79,479,412)];
}

- (IBAction)down_money2
{
    betMoney=myBetMoney.betmoney2;
    [btnMoney1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney1] ] forState:UIControlStateNormal];
    [btnMoney2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f_down.png",myBetMoney.betmoney2] ] forState:UIControlStateNormal];
    [btnMoney3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney3] ] forState:UIControlStateNormal];
    [btnMoney4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney4] ] forState:UIControlStateNormal];    
}

- (IBAction)down_money3
{
    betMoney=myBetMoney.betmoney3;
    [btnMoney1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney1] ] forState:UIControlStateNormal];
    [btnMoney2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney2] ] forState:UIControlStateNormal];
    [btnMoney3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f_down.png",myBetMoney.betmoney3] ] forState:UIControlStateNormal];
    [btnMoney4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney4] ] forState:UIControlStateNormal];
}

- (IBAction)down_money4
{
    betMoney=myBetMoney.betmoney4;
    [btnMoney1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney1] ] forState:UIControlStateNormal];
    [btnMoney2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney2] ] forState:UIControlStateNormal];
    [btnMoney3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f.png",myBetMoney.betmoney3] ] forState:UIControlStateNormal];
    [btnMoney4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%.0f_down.png",myBetMoney.betmoney4] ] forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [inputStream close];
    [outputStream close];
    self.pickSelectChips=nil;
    self.pickerData =nil;
}

-(void) enableButton:(bool)isenable
{
    //btnChangeTable.enabled= isenable;
    btnDetail.enabled=YES;//isenable;
    btnRecord.enabled=isenable;
    btnBet.enabled=isenable;
    btnClear.enabled=isenable;
    btnRelogin.enabled=isenable;
    btnRoadMap.enabled=YES;//isenable;
    btnChangeTable.enabled=isenable;
}

-(void) changeAsk:(NSTimer *)askTimer 
{

       if (myUserInfo.askconstnum==myUserInfo.asknum)
           myUserInfo.asknum=0;
       else 
           myUserInfo.asknum=myUserInfo.askconstnum;
       

    [self updateRoadmap];
}

-(void) getCountData:(NSTimer *)allCountTimer
{
    NSString *tempAnalyze;
    NSArray *currentTimes;
    NSURL *url = [NSURL URLWithString:@"http://183.182.66.167/8eea62084ca7e541d918e823422bd82e.htm"];     
    tempAnalyze= [NSString stringWithContentsOfURL:url]; 
    
    currentTimes=   [ tempAnalyze componentsSeparatedByString:@";"]; 
  if (currentTimes.count>100)
  {
    labchang1.text=[currentTimes objectAtIndex:7];
    labchang2.text=[currentTimes objectAtIndex:17];
    labchang3.text=[currentTimes objectAtIndex:27];
    labchang4.text=[currentTimes objectAtIndex:37];
    labchang5.text=[currentTimes objectAtIndex:47];
    labchang8.text=[currentTimes objectAtIndex:57];
    labchang7.text=[currentTimes objectAtIndex:68];
    labchang6.text=[currentTimes objectAtIndex:78];
   // labchang9.text=[currentTimes objectAtIndex:89];
      
    int tempint=[[currentTimes objectAtIndex:89] intValue];    
    if (tempint>0)
          labchang9.text=   [currentTimes objectAtIndex:89];
      else
          labchang9.text=   @"0";   
      
     tempint=[[currentTimes objectAtIndex:99] intValue];    
    if (tempint>0)
        labchang10.text=   [currentTimes objectAtIndex:99];
    else
        labchang10.text=   @"0";   
  }
}

- (void)panMoney1:(UIPanGestureRecognizer *)gestureRecognizer
{   
    
    CGPoint translation=[gestureRecognizer translationInView:imgMoney1];  
    imgMoney1.center = CGPointMake(gestureRecognizer.view.center.x +
                                         translation.x, gestureRecognizer.view.center.y+translation.y); 
    [gestureRecognizer setTranslation:CGPointMake(0,0) inView:imgMoney1];  
    betMoney=myBetMoney.betmoney1;
    
 }

- (void)panMoney2:(UIPanGestureRecognizer *)gestureRecognizer
{   
    CGPoint translation=[gestureRecognizer translationInView:imgMoney2];  
    imgMoney2.center = CGPointMake(gestureRecognizer.view.center.x +
                                   translation.x, gestureRecognizer.view.center.y+translation.y); 
    [gestureRecognizer setTranslation:CGPointMake(0,0) inView:imgMoney2];  
     betMoney=myBetMoney.betmoney2;
}

- (void)panMoney3:(UIPanGestureRecognizer *)gestureRecognizer
{   
    CGPoint translation=[gestureRecognizer translationInView:imgMoney3];  
    imgMoney3.center = CGPointMake(gestureRecognizer.view.center.x +
                                   translation.x, gestureRecognizer.view.center.y+translation.y); 
    [gestureRecognizer setTranslation:CGPointMake(0,0) inView:imgMoney3];  
    
     betMoney=myBetMoney.betmoney3;
}

- (void)panMoney4:(UIPanGestureRecognizer *)gestureRecognizer
{   
    CGPoint translation=[gestureRecognizer translationInView:imgMoney4];  
    imgMoney4.center = CGPointMake(gestureRecognizer.view.center.x +
                                   translation.x, gestureRecognizer.view.center.y+translation.y); 
    [gestureRecognizer setTranslation:CGPointMake(0,0) inView:imgMoney4];  
     betMoney=myBetMoney.betmoney4;
}

- (void)changeVideo1{   
    //CGPoint translation=[gestureRecognizer translationInView:imgMoney4];  
    //imgMoney4.center = CGPointMake(gestureRecognizer.view.center.x +
   //                                translation.x, gestureRecognizer.view.center.y+translation.y); 
   // [gestureRecognizer setTranslation:CGPointMake(0,0) inView:imgMoney4];  
  //  betMoney=myBetMoney.betmoney4;
   
}

//rtmp--
- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
    
//	NSLog(@"stream event %i", ii);
//	NSLog(@"server said: %@", output);
    
    switch (streamEvent) {
			
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream opened");
			break;
		case NSStreamEventHasBytesAvailable:
            
			if (theStream == inputStream) {
                
		
				uint16_t buffer[1024];
				int len;
                UInt32 big5 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingBig5);
                
				while ([inputStream hasBytesAvailable]) {
					len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    
					if (len > 0) {
						
						NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:big5];
						
						if (nil != output) {
                            
                            [self messageReceived:output];
							//NSLog(@"server said: %@", output);
                            if ([output rangeOfString:@"timeout is expired"].location !=NSNotFound)       
                            {
                                [self showError:@"连线已中断，请重新登入"];
                                [self relogin];
                            }
						}
					}
				}
			}
			break;
            
			
		case NSStreamEventErrorOccurred:
			[self showError:@"连线已中断，请重新登入f"];
            [self relogin];
			break;
			
		case NSStreamEventEndEncountered:
            
            [theStream close];
            [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            //          [theStream release];
            theStream = nil;
			
			break;
		default:
          NSLog(@"Unknown event");
				}
    
}

- (void) messageReceived:(NSString *)message //下注被init给搞壤了~
{
    
    if ( [message isEqualToString:@"API_EC_ACC_30_SEC"] )
    {
         [self showError:@"请三十秒后再次登入"];
      
    }else if ([message isEqualToString:@"API_EC_ACC_DISABLED"] )
    {
        [self showError:@"帐号停用"];
    }else if ([message isEqualToString:@"API_EC_ACC_PWD_INVALID"] )
    {
        [self showError:@"密码错误"];
    }else if ([message isEqualToString:@"API_EC_ACC_FREEZE"] )
    {
        [self showError:@"帐号冻结"];
    }else if ([message isEqualToString:@"API_EC_ACC_SUSPENDED"] )
    {
        [self showError:@"帐号停用"];
    }else if ([message isEqualToString:@"API_EC_SYS_MAINTAIN"] )
    {
        [self showError:@"维护中 请稍后"];
    }else if ([message isEqualToString:@"UNDER_MIN"] )
    {
      //  [self showError:@"下注额度不足"];
        [self showError:@"下注失敗"];

    }else if ([message isEqualToString:@"OVERMAX"] )
    {
        [self showError:@"注额不足"];
    }
    else if ([message isEqualToString:@"TIMEOUT"] )
    {
        [self showError:@"连线逾时"];
    }
    
    
    NSRange range = [message rangeOfString:@"loginsid"];    
   if (range.length>0)//login success;
   {
       NSLog(@"sid:%@", message);
       [UIView beginAnimations:nil context:NULL];
       [UIView setAnimationDuration:0.5];
       [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView: self.view cache:NO];
      // [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
       scrchangeTable.hidden=YES;
       [self changeTable];
       [self.view sendSubviewToBack: loginView];
       [self.view bringSubviewToFront: betView];
       [UIView commitAnimations];
       /*
    //   [self.view bringSubviewToFront:loadingView];
       
      [self hiden_Roadmap:YES];
       videoImage.userInteractionEnabled=YES;
    
       NSMutableArray *anims= [[NSMutableArray alloc]init];
       UIImage *img1= [UIImage imageNamed:@"Load_img_01.png"];
       UIImage *img2= [UIImage imageNamed:@"Load_img_02.png"];
       UIImage *img3= [UIImage imageNamed:@"Load_img_03.png"];
       UIImage *img4= [UIImage imageNamed:@"Load_img_04.png"];
       UIImage *img5= [UIImage imageNamed:@"Load_img_05.png"];
       UIImage *img6= [UIImage imageNamed:@"Load_img_06.png"];
       UIImage *img7= [UIImage imageNamed:@"Load_img_07.png"];
       UIImage *img8= [UIImage imageNamed:@"Load_img_08.png"];
       UIImage *img9= [UIImage imageNamed:@"Load_img_09.png"];
       UIImage *img10= [UIImage imageNamed:@"Load_img_10.png"];
       UIImage *img11= [UIImage imageNamed:@"Load_img_11.png"];
       UIImage *img12= [UIImage imageNamed:@"Load_img_12.png"];
       UIImage *img13= [UIImage imageNamed:@"Load_img_13.png"];
       UIImage *img14= [UIImage imageNamed:@"Load_img_14.png"];
       UIImage *img15= [UIImage imageNamed:@"Load_img_15.png"];
       UIImage *img16= [UIImage imageNamed:@"Load_img_16.png"];
       UIImage *img17= [UIImage imageNamed:@"Load_img_17.png"];
       UIImage *img18= [UIImage imageNamed:@"Load_img_18.png"];
       UIImage *img19= [UIImage imageNamed:@"Load_img_19.png"];
       UIImage *img20= [UIImage imageNamed:@"Load_img_20.png"];
       
       [anims addObject:img1];
       [anims addObject:img2];  
       [anims addObject:img3];
       [anims addObject:img4];
       [anims addObject:img5];
       [anims addObject:img6];
       [anims addObject:img7];
       [anims addObject:img8];
       [anims addObject:img9];
       [anims addObject:img10];
       [anims addObject:img11];
       [anims addObject:img12];
       [anims addObject:img13];
       [anims addObject:img14];
       [anims addObject:img15];
       [anims addObject:img16];
       [anims addObject:img17];
       [anims addObject:img18];
       [anims addObject:img19];
       [anims addObject:img20];
       
       loginImg.hidden=NO;
       loginImg.animationImages = anims;			
       loginImg.animationDuration=1.5f;
       loginImg.animationRepeatCount=8;
       [loginImg startAnimating];
       
      */
       NSString *response  = [NSString stringWithFormat:@"login\n"];
       NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
       [outputStream write:[data bytes] maxLength:[data length]];
      //Serialization
       NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];
       NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
       [parser setDelegate:self];
       [parser parse];
      
   }
    
    range = [message rangeOfString:@"onLogin"];
    if (range.length>0)//login success;
    {
        NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
        [parser setDelegate:self];
        [parser parse];
                      
       
        NSString *response  = [NSString stringWithFormat:@"userInfo\n"];
        NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];             
         scrchangeTable.hidden=YES;
        

    }
    
    range = [message rangeOfString:@"onRestoreChips"];    if (range.length>0)//login success;
     if (range.length>0)
    {
        NSArray *currentChips;
        NSString* tempstr;
    //    double tempdouble;
        currentChips=   [ message componentsSeparatedByString:@","];        
        bac1=bacinit; bac2=bacinit; bac3=bacinit; bac4=bacinit; bac5=bacinit;
        
        struct  betAreaInfo betAreaInfoTemp ;          
        betAreaInfoTemp=bacinit;
        
        tempstr=[[currentChips objectAtIndex:1] substringFromIndex:4];       
        betAreaInfoTemp.moneyBetted11=[tempstr doubleValue];//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:4] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted8=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:5] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted4=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:6] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted5=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:7] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted3=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:8] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted10=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:9] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted9=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:10] substringFromIndex:4];
        betAreaInfoTemp.moneyBetted7=[tempstr doubleValue] ;//NSLog(tempstr);
        
       // int tempint;
       // tempint=[[currentChips objectAtIndex:2] length]-1;
        tempstr=[[currentChips objectAtIndex:11] substringWithRange:NSMakeRange(4, [[currentChips objectAtIndex:2] length]-5)] ;
        betAreaInfoTemp.moneyBetted6=[tempstr doubleValue] ;//NSLog(tempstr);
        
        tempstr=[[currentChips objectAtIndex:2] substringFromIndex:5];        
        betAreaInfoTemp.moneyBetted1=[tempstr doubleValue] ;//NSLog(tempstr);
        tempstr=[[currentChips objectAtIndex:3] substringFromIndex:5];
        betAreaInfoTemp.moneyBetted2=[tempstr doubleValue] ;//NSLog(tempstr);
        
       if (myUserInfo.gameCode ==1)
            bac1=   betAreaInfoTemp ;
        if (myUserInfo.gameCode==2)
            bac2=   betAreaInfoTemp ;
        if (myUserInfo.gameCode==3)
            bac3=   betAreaInfoTemp ;
        if (myUserInfo.gameCode==6)
            bac4=   betAreaInfoTemp ;
        if (myUserInfo.gameCode==7)
            bac5=   betAreaInfoTemp ;
        
       }
 
    
    
    range = [message rangeOfString:@"onUserInfo"];    
    if (range.length>0)//login success;
    {
        NSLog(@"userinfo:\n%@\n\n", message);
        NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
        [parser setDelegate:self];
        [parser parse];

        

        // timer=  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector//(printimage:) userInfo:nil repeats:YES]  ;
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *textToLoad=@"";
        textToLoad = [prefs stringForKey:@"keyToVidoeSeed"];
        
        if (textToLoad==nil)
        textToLoad=@"15";


       [timer invalidate];
        timer = nil;
        
        if ([textToLoad intValue] ==0)
        { timer=  [NSTimer scheduledTimerWithTimeInterval:100000 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 0;
            NSLog(@"jamesss");   NSLog(@"1");
        }
        else if ([textToLoad intValue] == 2)
        {    timer=  [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 1;
          NSLog(@"jamesss");   NSLog(@"2");}
        else if ([textToLoad floatValue] ==5)
        {    timer=  [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 2;
          NSLog(@"jamesss");   NSLog(@"3");}
        else if ([textToLoad floatValue] ==8)
        {   timer=  [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 3;
          NSLog(@"jamesss");   NSLog(@"4");}
        else if ([textToLoad floatValue] ==13)
        {    timer=  [NSTimer scheduledTimerWithTimeInterval:0.09 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 4;
          NSLog(@"jamesss");   NSLog(@"5");}
        else
        {     timer=  [NSTimer scheduledTimerWithTimeInterval:0.13 target:self selector:@selector(printimage:) userInfo:nil repeats:YES]  ;
            seedSegmented.selectedSegmentIndex = 3;   
          NSLog(@"jamesss");   NSLog(@"other");
        }            
        
        
        NSString *response  = [NSString stringWithFormat:@"tableList\n"];
        NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];
        
       
       // if( [myUserInfo.gameType isEqualToString:@"3001"]);
        {
            struct betAreaInfo bacTemp;
            bacTemp=bacinit;
            bacTemp.moneyLimit1 = myUserInfo.max ;
            bacTemp.moneyLimit2 = myUserInfo.max ;
            bacTemp.moneyLimit3 = myUserInfo.par ;
            bacTemp.moneyLimit4 = myUserInfo.tie ;
            bacTemp.moneyLimit5 = myUserInfo.par ;
            bacTemp.moneyLimit6 = myUserInfo.max ;
            bacTemp.moneyLimit7 = myUserInfo.max ;
            bacTemp.moneyLimit8 = myUserInfo.max ;
            bacTemp.moneyLimit9 = myUserInfo.ou ;
            bacTemp.moneyLimit10 = myUserInfo.ou ;
            bacTemp.moneyLimit11 = myUserInfo.max ;
            
            bacTemp.moneyCanbet1 = myUserInfo.max ;
            bacTemp.moneyCanbet2 = myUserInfo.max ;
            bacTemp.moneyCanbet3 = myUserInfo.par ;
            bacTemp.moneyCanbet4 = myUserInfo.tie ;
            bacTemp.moneyCanbet5 = myUserInfo.par ;
            bacTemp.moneyCanbet6 = myUserInfo.max ;
            bacTemp.moneyCanbet7 = myUserInfo.max ;
            bacTemp.moneyCanbet8 = myUserInfo.max ;
            bacTemp.moneyCanbet9 = myUserInfo.ou ;
            bacTemp.moneyCanbet10 = myUserInfo.ou ;
            bacTemp.moneyCanbet11 = myUserInfo.max ;
            
            bacTemp.moneyBetting1 = 0 ;
            bacTemp.moneyBetting2 = 0 ;
            bacTemp.moneyBetting3 = 0 ;
            bacTemp.moneyBetting4 = 0 ;
            bacTemp.moneyBetting5 = 0 ;
            bacTemp.moneyBetting6 = 0 ;
            bacTemp.moneyBetting7 = 0 ;
            bacTemp.moneyBetting8 = 0 ;
            bacTemp.moneyBetting9 = 0 ;
            bacTemp.moneyBetting10 = 0 ;
            bacTemp.moneyBetting11 = 0 ;
            
            bacTemp.moneyBetted1 = 0 ;
            bacTemp.moneyBetted2 = 0 ;
            bacTemp.moneyBetted3 = 0 ;
            bacTemp.moneyBetted4 = 0 ;
            bacTemp.moneyBetted5 = 0 ;
            bacTemp.moneyBetted6 = 0 ;
            bacTemp.moneyBetted7 = 0 ;
            bacTemp.moneyBetted8 = 0 ;
            bacTemp.moneyBetted9 = 0 ;
            bacTemp.moneyBetted10 = 0 ;
            bacTemp.moneyBetted11 = 0 ;
            bacinit=bacTemp;
            
            bac1=bacTemp;
            bac2=bacTemp;
            bac3=bacTemp;
            bac4=bacTemp;
            bac5=bacTemp;
           
        }
        
      
        
        
    }
    
    range = [message rangeOfString:@"onTableList"];    
    if (range.length>0)//login success;
    {
        
         NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];       
         NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
         [parser setDelegate:self];
         [parser parse];
        
        NSLog(@"testOK");
       // [self.view bringSubviewToFront:betView];
        NSString *response  = [NSString stringWithFormat:@"videoLink\n"];
        NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];      
        
        NSLog(@"sentOK");
        
          myUserInfo=myUserInfo;
        [self getUpdateRoadmap] ;
        [self updateRoadmap];
        myUserInfo.unbetround=0;
        [_backgroundMusicPlayer play];
        NSString *tempAnalyze;
        NSArray *IPs;
        NSURL *url = [NSURL URLWithString:@"http://183.182.66.167/padfjaskdfjaskdjfakfal;sdkfjkl.jpg"];     
        tempAnalyze= [NSString stringWithContentsOfURL:url]; 
        
        IPs=  [ tempAnalyze componentsSeparatedByString:@"^"]; 
        int index= arc4random()% IPs.count; 
        
        server=[IPs objectAtIndex:index];
        NSLog(@"serverIP",nil);
        NSLog(server,nil);
       // [self transformUserinfo];
        
        
    }
    
    range = [message rangeOfString:@"onUpdate"];    
    if (range.length>0)//login success;
    {
        if (scrchangeTable.hidden==YES)
        { 
            NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];
            NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
            [parser setDelegate:self];
            [parser parse];
        }                
    }
    
    range = [message rangeOfString:@"onBet"];    
    if (range.length>0)//login success;
    {
        NSData* xmlData=[message dataUsingEncoding:NSUTF8StringEncoding];
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:xmlData];
        [parser setDelegate:self];
        [parser parse];      
    }
    
  
  
    
    message=@"" ;
}

-(void) rtmpConnect:(NSString *)serverIP
{
    CFReadStreamRef readStream;
	CFWriteStreamRef writeStream;
    
    NSArray *SERVERIP =[server componentsSeparatedByString: @":"];
    
	CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)CFBridgingRetain(SERVERIP[0]), 10243, &readStream, &writeStream);
//	CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"183.182.66.80", 10243, &readStream, &writeStream);
	inputStream = (__bridge NSInputStream *)readStream;
	outputStream = (__bridge NSOutputStream *)writeStream;
	inputStream.delegate = self;
	outputStream.delegate = self;
	[inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[inputStream open];
	[outputStream open];

}

- (void) sendMessage :(NSString *)sendingMessage
{
	
	NSString *response  = [NSString stringWithFormat:@"msg:%@ \n", sendingMessage];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
	
	
}

-(void)gaemOver30:(NSString *)gameSerial
{
    int loc=[gameSerial rangeOfString:@"-"].location +1;
   
    gameSerial =[gameSerial substringFromIndex: loc];
    myUserInfo.round=[gameSerial intValue];
    UIImage *image;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    if ( myUserInfo.round<=30)
        image=[UIImage imageNamed:@"Game_bgs.png"];
    else
        image=[UIImage imageNamed:@"Game_bg2s.png"];   
       
    }else {
        if ( myUserInfo.round<=30)
            image=[UIImage imageNamed:@"Game_bg@2x.png"];   
        else
            image=[UIImage imageNamed:@"Game_bg2@2x.png"];   
    }
         [betViewBG  setImage:image] ;   
        
}

//--rtmp

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{//暫時設成無法轉動
    
      if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
           return NO;
      }
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||interfaceOrientation == UIInterfaceOrientationLandscapeRight );
    }
   // return NO;
}

-(void) showError:(NSString *) errorMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"-警告-" message:errorMessage                                                         delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(NSString *) showOrderType:(NSString *) GameType code:(int)codeindex
{
    
/*百家
 1, '百家樂 莊'
 2, '百家樂 閑'
 3, '百家樂 和'
 4, '百家樂 莊對'
 5, '百家樂 閑對'
 6, '百家樂 大'
 7, '百家樂 小'
 8 莊單
 9 莊雙
 10 閒單
 11 閒雙
 */
    switch (codeindex) {
        case 1:
            return @"莊";
            break;
            
        case 2:
            return @"閑";
            break;
            
        case 3:
            return @"和";
            break;
            
        case 4:
            return @"莊對";
            break;
            
        case 5:
            return @"閑對";
            break;
            
        case 6:
            return @"大";
            break;
            
        case 7:
            return @"小";
            break;
            
        case 8:
            return @"莊單";
            break;
            
        case 9:
            return @"莊雙";
            break;
            
        case 10:
            return @"閒單";
            break;
            
        case 11:
            return @"閒雙";
            break;
            
        default:
            return @"";
            break;
    }
    return @"";
}

//xml--
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{  
  
    NSString *name,*att;
    
     int i=0;
    for(id key in attributeDict)
    { i++;
        if (i==1)
            att = [attributeDict objectForKey:key] ;
        
        if (i==2)
            name = [attributeDict objectForKey:key];
        
    }    
   // NSLog(@"test james %@ %@", name,att);

    [self transformUserinfo:name andatt:att] ;
   
}

//parser <>XXXXXX
//2. 找到XML tag所包含的內容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
  //  NSLog(@"foundCharacters %@", string);
}



//3. 於遇到XML tag結尾時被呼叫
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
      
   // [myXml insertObject: [NSString stringWithFormat:elementName] atIndex:0];
       
}
//--xml


-(void )printimage:(NSTimer *)timer
{
  //  underImageCount=underImageCount+1;
    while ([scrollView1.subviews count] > 0) {
        //NSLog(@"subviews Count=%d",[[myScrollView subviews]count]);
        [[[scrollView1 subviews] objectAtIndex:0] removeFromSuperview];
 }
    
    if (scrviewRoadmap.hidden==YES)
    {
        NSString *tmpurl =[NSString stringWithFormat:@"%@%@", server,url];
      //  NSString *tmpurl =[NSString stringWithFormat:@"%@%@", @"http://192.168.200.11:80",url];
     //  NSLog(tmpurl);
        NSURL *imageurl =[NSURL URLWithString:tmpurl] ;    
        NSData *imagedata =[NSData dataWithContentsOfURL:imageurl] ;
        UIImage *image =[UIImage imageWithData:imagedata  ];
        
        if (image.size.width>100)
            videoImage.image = image;   
        
    }
    

    //[scrollView1 addSubview:videoImage];
    

}

    

//-----------------------controller
- (IBAction) joinBet
{
    loginBut.enabled=NO;
    
    CFReadStreamRef readStream;
	CFWriteStreamRef writeStream;
	CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"183.182.66.239", 10243, &readStream, &writeStream);
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    [prefs setObject:userName.text forKey:@"keyToFindText"];    
    
	inputStream = (__bridge NSInputStream *)readStream;
	outputStream = (__bridge NSOutputStream *)writeStream;
	inputStream.delegate = self;
	outputStream.delegate = self;
	[inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[inputStream open];
	[outputStream open];
    
    
    scrviewRoadmap.hidden=YES;
    
    NSString *response  = [NSString stringWithFormat:@"getsid%@\n", @""];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
    
    response  = [NSString stringWithFormat:@"%@,%@\n", userName.text,passWord.text];
	data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    

    [userName resignFirstResponder];
    [passWord resignFirstResponder];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        url=  @"/baccaratsd1/sd2.jpg";
    else
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *textToLoad = [prefs stringForKey:@"keyToVidoesize"];     
    
        if ([textToLoad intValue] ==640)
        {   quality=@"hd";
            [videoSwitch setOn:YES animated:NO];
        }
        else if ([textToLoad intValue] ==320)
        {
            quality=@"sd";
            [videoSwitch setOn:NO animated:NO];
        }
        else
        {
            quality=@"hd";
            [videoSwitch setOn:YES animated:NO];
        }
    
        url= [NSString stringWithFormat: @"/baccarat%@1/sd2.jpg",quality] ;
        }
 loginBut.enabled=YES;
}
- (IBAction) sentBet
{
  //  [self transformUserinfo];
     myUserInfo=myUserInfo;
    
 

    struct  betAreaInfo betAreaInfoTemp ;
    if (myUserInfo.gameCode ==1)
        betAreaInfoTemp =bac1;
    if (myUserInfo.gameCode==2)
        betAreaInfoTemp =bac2;
    if (myUserInfo.gameCode==3)
        betAreaInfoTemp =bac3;
    if (myUserInfo.gameCode==6)
        betAreaInfoTemp =bac4;
    if (myUserInfo.gameCode==7)
        betAreaInfoTemp =bac5;       
 
  
    NSString *response  = [NSString stringWithFormat:@"bet\n"];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];        
    
     /*
     1, '百家樂 莊'
     2, '百家樂 閑'
     3, '百家樂 和'
     4, '百家樂 莊對'
     5, '百家樂 閑對'
     6, '百家樂 大'
     7, '百家樂 小'
     8 莊單
     9 莊雙
     10 閒單
     11 閒雙
     */
    
    response  = [NSString stringWithFormat:@"%@",roundSerial];
    
    if (betAreaInfoTemp.moneyBetting1>=myUserInfo.min)
       response = [NSString stringWithFormat:@"%@,b10:%.2f",response,betAreaInfoTemp.moneyBetting1];
    
    if (betAreaInfoTemp.moneyBetting2>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b11:%.2f",response,betAreaInfoTemp.moneyBetting2];
    
    if (betAreaInfoTemp.moneyBetting3>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b5:%.2f",response,betAreaInfoTemp.moneyBetting3];
    
    if (betAreaInfoTemp.moneyBetting4>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b3:%.2f",response,betAreaInfoTemp.moneyBetting4];
    
    if (betAreaInfoTemp.moneyBetting5>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b4:%.2f",response,betAreaInfoTemp.moneyBetting5];
    
    if (betAreaInfoTemp.moneyBetting6>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b9:%.2f",response,betAreaInfoTemp.moneyBetting6];
    
    if (betAreaInfoTemp.moneyBetting7>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b8:%.2f",response,betAreaInfoTemp.moneyBetting7];
    
    if (betAreaInfoTemp.moneyBetting8>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b2:%.2f",response,betAreaInfoTemp.moneyBetting8];
    
    if (betAreaInfoTemp.moneyBetting9>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b7:%.2f",response,betAreaInfoTemp.moneyBetting9];
    
    if (betAreaInfoTemp.moneyBetting10>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b6:%.2f",response,betAreaInfoTemp.moneyBetting10];
    
    if (betAreaInfoTemp.moneyBetting11>=myUserInfo.min)
        response = [NSString stringWithFormat:@"%@,b1:%.2f",response,betAreaInfoTemp.moneyBetting11];
    
    
    
    response  = [NSString stringWithFormat:@"%@\n",response];
   
    NSLog(response,nil);
   data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
   [outputStream write:[data bytes] maxLength:[data length]];
    
    /*betAreaInfoTemp.moneyBetted1 =betAreaInfoTemp.moneyBetted1+betAreaInfoTemp.moneyBetting1;
    betAreaInfoTemp.moneyBetted2 =betAreaInfoTemp.moneyBetted2+betAreaInfoTemp.moneyBetting2;
    betAreaInfoTemp.moneyBetted3 =betAreaInfoTemp.moneyBetted3+betAreaInfoTemp.moneyBetting3;
    betAreaInfoTemp.moneyBetted4 =betAreaInfoTemp.moneyBetted4+betAreaInfoTemp.moneyBetting4;
    betAreaInfoTemp.moneyBetted5 =betAreaInfoTemp.moneyBetted5+betAreaInfoTemp.moneyBetting5;
    betAreaInfoTemp.moneyBetted6 =betAreaInfoTemp.moneyBetted6+betAreaInfoTemp.moneyBetting6;
    betAreaInfoTemp.moneyBetted7 =betAreaInfoTemp.moneyBetted7+betAreaInfoTemp.moneyBetting7;
    betAreaInfoTemp.moneyBetted8 =betAreaInfoTemp.moneyBetted8+betAreaInfoTemp.moneyBetting8;
    betAreaInfoTemp.moneyBetted9 =betAreaInfoTemp.moneyBetted9+betAreaInfoTemp.moneyBetting9;
    betAreaInfoTemp.moneyBetted10 =betAreaInfoTemp.moneyBetted10+betAreaInfoTemp.moneyBetting10;
    betAreaInfoTemp.moneyBetted11 =betAreaInfoTemp.moneyBetted11+betAreaInfoTemp.moneyBetting11;*/

    betAreaInfoTemp.moneyBetting1=0.0;    baI_Bet1.hidden= YES;    baL_Bet1.hidden =YES;    baB_Bet1.hidden =YES;
    betAreaInfoTemp.moneyBetting2=0.0;    baI_Bet2.hidden= YES;    baL_Bet2.hidden =YES;    baB_Bet2.hidden =YES;
    betAreaInfoTemp.moneyBetting3=0.0;    baI_Bet3.hidden= YES;    baL_Bet3.hidden =YES;    baB_Bet3.hidden =YES;
    betAreaInfoTemp.moneyBetting4=0.0;    baI_Bet4.hidden= YES;    baL_Bet4.hidden =YES;    baB_Bet4.hidden =YES;
    betAreaInfoTemp.moneyBetting5=0.0;    baI_Bet5.hidden= YES;    baL_Bet5.hidden =YES;    baB_Bet5.hidden =YES;
    betAreaInfoTemp.moneyBetting6=0.0;    baI_Bet6.hidden= YES;    baL_Bet6.hidden =YES;    baB_Bet6.hidden =YES;
    betAreaInfoTemp.moneyBetting7=0.0;    baI_Bet7.hidden= YES;    baL_Bet7.hidden =YES;    baB_Bet7.hidden =YES;
    betAreaInfoTemp.moneyBetting8=0.0;    baI_Bet8.hidden= YES;    baL_Bet8.hidden =YES;    baB_Bet8.hidden =YES;
    betAreaInfoTemp.moneyBetting9=0.0;    baI_Bet9.hidden= YES;    baL_Bet9.hidden =YES;    baB_Bet9.hidden =YES;
    betAreaInfoTemp.moneyBetting10=0.0;    baI_Bet10.hidden= YES;    baL_Bet10.hidden =YES;    baB_Bet10.hidden =YES;
    betAreaInfoTemp.moneyBetting11=0.0;    baI_Bet11.hidden= YES;    baL_Bet11.hidden =YES;    baB_Bet11.hidden =YES;

    myUserInfo.unbetround  =0;
    [self bgPlay:@"AddStack.WAV"]; 
    
    
    if (myUserInfo.gameCode ==1)
        bac1=betAreaInfoTemp;
    if (myUserInfo.gameCode ==2)
        bac2=betAreaInfoTemp;
    if (myUserInfo.gameCode ==3)
        bac3=betAreaInfoTemp;
    if (myUserInfo.gameCode ==6)
        bac4=betAreaInfoTemp;
    if (myUserInfo.gameCode ==7)
        bac5=betAreaInfoTemp; 
    
    
   // NSLog([NSString stringWithFormat: @"james test%.0f,",  bac1.moneyBetting1]);
  //  NSLog([NSString stringWithFormat: @"james test%.0f,%i",  bac2.moneyBetting3,myUserInfo.gameCode]);

    
   
    
    [self upBetAreaInfo] ;
  //  NSLog([NSString stringWithFormat: @"james test%.0f,",  bac1.moneyBetted1]);
}

- (void) changeTableByindex:(int)index
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {    if (index ==1)
            url  =@"/baccaratsd1/sd2.jpg";
     
        if (index==2)                 
            url  =@"/baccaratsd2/sd2.jpg";
     
        if (index==3)     
            url  =@"/baccaratsd3/sd2.jpg";

        if (index ==4)    
            url  =@"/baccaratsd4/sd2.jpg";
     
        if (index==5)     
            url  =@"/baccaratsd5/sd2.jpg";  
    }
    else
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *textToLoad = [prefs stringForKey:@"keyToVidoesize"];
        if ([textToLoad intValue] ==640)
            quality=@"hd";
        else if ([textToLoad intValue ]==320)
            quality=@"sd";
        else 
            quality=@"hd"; 
        
        if (index ==1)  
            url= [NSString stringWithFormat: @"/baccarat%@1/sd2.jpg",quality] ;
        if (index ==2)  
            url= [NSString stringWithFormat: @"/baccarat%@2/sd2.jpg",quality] ;
        if (index ==3)  
            url= [NSString stringWithFormat: @"/baccarat%@3/sd2.jpg",quality] ;
        if (index ==4)  
            url= [NSString stringWithFormat: @"/baccarat%@4/sd2.jpg",quality] ;
        if (index ==5)  
            url= [NSString stringWithFormat: @"/baccarat%@5/sd2.jpg",quality] ;
        
        NSLog(@"jamesssss%@,quality%@",url,quality);
        
    }
     
      
        NSString *response  = [NSString stringWithFormat:@"turn\n"];
        NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];
        
        response  = [NSString stringWithFormat:@"%i\n",index-1];
        data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];
        
        response  = [NSString stringWithFormat:@"login\n"];
        data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
        [outputStream write:[data bytes] maxLength:[data length]];   


}

- (IBAction)down_reentergame
{
    if (myUserInfo.changeindex==-1)  
        myUserInfo.changeindex=1;   
    
    [self changeTableByindex:myUserInfo.changeindex];
    //scrchangeTable.hidden=YES;
    [self enableButton: YES];
   
}
- (IBAction) changeBet  
{
    [scrollView1 setContentSize:CGSizeMake(150, 100)]  ;

    //NSLog(@"changeBet",myUserInfo.chipFilter);
    NSArray *mon1 = myMoneys;    
    NSArray *mon2 = myMoneys;    
    NSArray *mon3 = myMoneys;    
    NSArray *mon4 = myMoneys;
    
    [myMoneys indexOfObject: [ NSString stringWithFormat:@"%.0f", myBetMoney.betmoney1]];
    
    
    
    
    [pickSelectChips reloadAllComponents] ;  
    if (pickSelectChips.hidden==YES)
    {       CGRect RC;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
             RC=CGRectMake(0,182,320,394);
        else 
             RC=CGRectMake(352,330,320,394);
        
        [pickSelectChips setFrame:RC];   
        [pickSelectChips selectRow:[myMoneys indexOfObject:[ NSString stringWithFormat:@"%.0f", myBetMoney.betmoney1]] inComponent:0 animated:NO];
        [pickSelectChips selectRow:[myMoneys indexOfObject:[ NSString stringWithFormat:@"%.0f", myBetMoney.betmoney2]] inComponent:1 animated:NO];
        [pickSelectChips selectRow:[myMoneys indexOfObject:[ NSString stringWithFormat:@"%.0f", myBetMoney.betmoney3]] inComponent:2 animated:NO];
        [pickSelectChips selectRow:[myMoneys indexOfObject:[ NSString stringWithFormat:@"%.0f", myBetMoney.betmoney4]] inComponent:3 animated:NO];
    
          
    self.arrPick1 = myMoneys;
    self.arrPick2 = myMoneys;
    self.arrPick3 = myMoneys;
    self.arrPick4 = myMoneys;
    //[arrPick1 objectAtIndex: arrPick1.count-1]=@"100K";
          

        
    pickSelectChips.hidden=NO;
    UIImage *image=[UIImage imageNamed:@"Save_up.png"];
    [btnChangeMoney setImage:image forState:UIControlStateNormal ];
        
    }
     else 
     {
        int money1=[[ mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:0]] doubleValue],
            money2=[[ mon2 objectAtIndex:[pickSelectChips selectedRowInComponent:1]] doubleValue],
            money3=[[ mon3 objectAtIndex:[pickSelectChips selectedRowInComponent:2]] doubleValue],
            money4=[[ mon4 objectAtIndex:[pickSelectChips selectedRowInComponent:3]] doubleValue];
         
         if (money1> myUserInfo.max||
             money2> myUserInfo.max||
             money3> myUserInfo.max||
             money4> myUserInfo.max)
         {
              [self showError:@"请将筹码設定低於最大下注额"];
         }
         
         else if (money1==money2||money1==money3||money1==money4||money2==money3||money2==money4||money3==money4)
         {
             [self showError:@"筹码設定重复，请重新设定"];
         }
         else 
         {
             NSString *response  = [NSString stringWithFormat:@"setChipValue\n"];
             NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
             [outputStream write:[data bytes] maxLength:[data length]];         
             
             response  = [NSString stringWithFormat:@"%@,%@,%@,%@\n",[ mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:0]],[ mon2 objectAtIndex:[pickSelectChips selectedRowInComponent:1]],[ mon3 objectAtIndex:[pickSelectChips selectedRowInComponent:2]],[ mon4 objectAtIndex:[pickSelectChips selectedRowInComponent:3]]];
             
             data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
             [outputStream write:[data bytes] maxLength:[data length]];                 
             
             [self setChip1: [ mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:0]] setchip2:[ mon2 objectAtIndex:[pickSelectChips selectedRowInComponent:1]] setchip3:[ mon3 objectAtIndex:[pickSelectChips selectedRowInComponent:2]] setchip4:[ mon4 objectAtIndex:[pickSelectChips selectedRowInComponent:3]]];
             
             pickSelectChips.hidden=YES;
             UIImage *image=[UIImage imageNamed:@"chipSetting_up.png"];
             [btnChangeMoney setImage:image forState:UIControlStateNormal];
             
             
        //     NSLog( [NSString stringWithFormat: @"jamestest%@,%@,%@,%@,", [mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:0]], [mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:1]], [mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:2]], [mon1 objectAtIndex:[pickSelectChips selectedRowInComponent:3]]]  );
         }      
    }
    
    
}

-(IBAction)seeDetail
{  
    
    if (scrDetail.hidden) {
        
        if (myUserInfo.gameCode==1) 
            D2.text=@"桌号：A";
        else if (myUserInfo.gameCode==2)
            D2.text=@"桌号：B";
        else if (myUserInfo.gameCode==3)
            D2.text=@"桌号：C";
        else if (myUserInfo.gameCode==6)
            D2.text=@"桌号：D";
        else if (myUserInfo.gameCode==7)
            D2.text=@"桌号：E"; 
        
   if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) 
   {
    
    D5.text=[NSString stringWithFormat:@"最小下注：%i", myUserInfo.min];
    D6.text=[NSString stringWithFormat:@"单注限额：%i", myUserInfo.max];
    D7.text=[NSString stringWithFormat:@"对子上限：%i", myUserInfo.par];
    D8.text=[NSString stringWithFormat:@"和注上限：%i", myUserInfo.tie];
    D9.text=[NSString stringWithFormat:@"大小单注限额：%i", myUserInfo.ou];
   }
   else 
   {
       [self detailHide:YES] ;
       [self down_btnDetail1] ;
       NSString *urlAddress = @"https://es.esball-in.com/app/help.php?GameType=3001&lang=zh-cn&HALLID=6&State=0";
       
       //Create a URL object.
       
       NSURL *url = [NSURL URLWithString:urlAddress];
       
       //URL Requst Object
       
       NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
       
       //Load the request in the UIWebView.
       
       [webViewDetail1 loadRequest:requestObj];

       D5.text=[NSString stringWithFormat:@"%i", myUserInfo.min];
       D6.text=[NSString stringWithFormat:@"%i", myUserInfo.max];
       D7.text=[NSString stringWithFormat:@"%i", myUserInfo.par];
       D8.text=[NSString stringWithFormat:@"%i", myUserInfo.tie];
       D9.text=[NSString stringWithFormat:@"%i", myUserInfo.ou];
   }
        
        
        
        
        scrDetail.hidden=NO; 
        [self enableButton:NO];
    }else 
    {
        scrDetail.hidden=YES;
        [self enableButton:YES];
    }
    btnDetail.enabled=YES;
}

-(IBAction)seeRoadmap
{
if (scrviewRoadmap.hidden==NO)
{  
    [self hiden_Roadmap:YES];
     videoImage.userInteractionEnabled=YES;
}
else 
{ 
    [self hiden_Roadmap:NO];  
    videoImage.userInteractionEnabled=NO;
    [self updateRoadmap];    
}

}


-(void)hiden_Roadmap:(bool)isHiden
{  
    scrviewRoadmap.hidden=isHiden;
    countTie.hidden=isHiden;
    countBanker.hidden=isHiden;
    countPlayer.hidden=isHiden;
    btnBankAsk.hidden=isHiden;
    btnPlayAsk.hidden=isHiden;
    imgAllRoadMapBG.hidden=isHiden;
    myUIPageControl.hidden=isHiden;
    scrollView1.hidden=isHiden;
    
}


-(void)getRoapmapData:(NSString*)table 
{
    int i=0 ,j=0;
    NSString *strUrl ;
  //  NSLog(table);
    NSArray *datatemp;
    for(j=0;j<3;j++)
    {
        for (i = 1; i <= 6; i++)
        {    
           
            if (i==5||i==6)
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/0.htm" ,table,i-1] ;
            else
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/%i/%i.htm" ,table,i-1,j] ;
            
          //  NSLog(strUrl);
            NSURL *url = [NSURL URLWithString:strUrl];     
            allRoadmapData[i+j*6]= [NSString stringWithContentsOfURL:url];         
            
            
        }
    }
    
        strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/7/0.htm" ,table] ;
        NSURL *url = [NSURL URLWithString:strUrl];  
        strUrl=  [NSString stringWithContentsOfURL:url];  
        datatemp=[strUrl componentsSeparatedByString: @";"];
        NSLog(strUrl);   
        countBanker.text =[datatemp objectAtIndex:1];
        countPlayer.text =[datatemp objectAtIndex:0];
        countTie.text =   [datatemp objectAtIndex:2];
        datatemp=datatemp;
    
//    roadmapData= roadmapData;
    
}
-(void)drawRoapmap:(NSString*)table askRoad:(NSString*)askmethod
{
    NSLog(@"roadmap width:%d", myGameInfo.roadmapWidth);
    NSLog(@"roadmap height:%d", myGameInfo.roadmapHight);
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
    
    scrviewRoadmap.delegate =self;
	[scrviewRoadmap setBackgroundColor:[UIColor blackColor]];
	[scrviewRoadmap setCanCancelContentTouches:NO];
	scrviewRoadmap.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	scrviewRoadmap.clipsToBounds = YES;		
	scrviewRoadmap.scrollEnabled = YES;	
	scrviewRoadmap.pagingEnabled = YES;
    NSString *roadmapData[7];
    
    //http://183.182.66.167/3001/c/0/0.htm;
    //桌号 路子种类 问路。
    NSString *gamename;
    gamename =  table ;
    
    NSUInteger i;
    
    UIImage *player = [UIImage imageNamed:@"rou_R_big.png"]; 
    UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"]; 
    UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
    UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
    UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
    UIImage *smallPlayer = [UIImage imageNamed:@"rou_R_small2.png"]; 
    UIImage *smallBanker = [UIImage imageNamed:@"rou_B_small2.png"];
    UIImage *zingPlayer = [UIImage imageNamed:@"rou_R_ob.png"]; 
    UIImage *zingBanker = [UIImage imageNamed:@"rou_B_ob.png"];
    
    if(scrviewRoadmap!=nil)
    {
        while ([scrviewRoadmap.subviews count] > 0) {
            //NSLog(@"subviews Count=%d",[[myScrollView subviews]count]);
            [[[scrviewRoadmap subviews] objectAtIndex:0] removeFromSuperview];
        }
    }
    
    
    for (i = 1; i <= 6; i++)
	{  
        if (i==5||i==6)
            roadmapData[i] = allRoadmapData[i+[askmethod intValue] *6] ;
        else
            roadmapData[i] = allRoadmapData[i+[askmethod intValue] *6] ;  
    }
    
    
	for (i = 1; i <= 6; i++)
	{        
        
        UIGraphicsBeginImageContext(CGSizeMake(myGameInfo.roadmapWidth,myGameInfo.roadmapHight));  
        CGContextRef context= UIGraphicsGetCurrentContext();
        NSString *imageName;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
           imageName = [NSString stringWithFormat:@"Route_bg2s.png", i];
        else
           imageName = [NSString stringWithFormat:@"Route_bg2@2x.png", i];

        UIImage *image = [UIImage imageNamed:imageName];
        [image drawInRect:CGRectMake(0, 0,myGameInfo.roadmapWidth, myGameInfo.roadmapHight)];
        CGContextSaveGState(context);
        CGContextRestoreGState(context);
        
        
        float col=0,row=0;
        float w=20,h=21;
        int start;
        NSArray *allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
        int lines= [ allLines count]-2;
        
        if (lines>0)
            switch (i) {
                    
                case 1:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;                  
                    
                    if (lines<=13)
                        start=0;
                    else 
                    {   start=lines-14;
                        lines=14;
                    }   
                    
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            
                            
                            if ([[data objectAtIndex:0] intValue]==1)
                            {  [player drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                               // count_play_temp+=1;
                            }
                            else if ([[data objectAtIndex:0] intValue]==2)
                            {    [banker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                              //  count_bank_temp+=1;
                            }                       
                            if ([[data objectAtIndex:1] intValue]>=1)
                            {[tie1 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                             //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                            }
                            if ([[data objectAtIndex:1] intValue]>=2)
                                [tie2 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                    
                            
                            if ([[data objectAtIndex:1] intValue]>=3)
                                [tie3 drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                 
                        }                    
                    }
                    }
                    else
                    {   NSLog(@"ipad");
                        col=0,row=0;
                        w=23.8,h=21.2;                  
                        
                        if (lines<=15)
                            start=0;
                        else 
                        {   start=lines-16;
                            lines=16;
                        }   
                        
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                
                                
                                if ([[data objectAtIndex:0] intValue]==1)
                                {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    // count_play_temp+=1;
                                }
                                else if ([[data objectAtIndex:0] intValue]==2)
                                {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //  count_bank_temp+=1;
                                }                       
                                if ([[data objectAtIndex:1] intValue]>=1)
                                {[tie1 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                                }
                                if ([[data objectAtIndex:1] intValue]>=2)
                                    [tie2 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                    
                                
                                if ([[data objectAtIndex:1] intValue]>=3)
                                    [tie3 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                 
                            }                    
                        }
                        
                        NSArray *allLines =[roadmapData[i+1] componentsSeparatedByString: @"\n"];
                        int lines= [ allLines count]-2;
                        col=0,row=0;
                        w=11.9,h=10.6;                  
                        
                        if (lines<=18)
                            start=0;
                        else 
                        {   start=lines-19;
                            lines=19;
                        }   
                        
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                
                                
                                if ([[data objectAtIndex:0] intValue]==1)
                                {  [player drawInRect: CGRectMake(357+col*w, 1+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    // count_play_temp+=1;
                                }
                                else if ([[data objectAtIndex:0] intValue]==2)
                                {    [banker drawInRect: CGRectMake(357+col*w, 1+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //  count_bank_temp+=1;
                                }                       
                                               
                            }                    
                        }

                        allLines =[roadmapData[i+2] componentsSeparatedByString: @"\n"];
                         lines= [ allLines count]-2;
                        col=0,row=0;
                        w=11.9,h=10.6;                  
                        
                        if (lines<=18)
                            start=0;
                        else 
                        {   start=lines-19;
                            lines=19;
                        } 
                        
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                if ([[data objectAtIndex:0] intValue]==1)
                                    [smallPlayer drawInRect: CGRectMake(357+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                else if ([[data objectAtIndex:0] intValue]==2)
                                    [smallBanker drawInRect: CGRectMake(357+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                            
                            }                    
                        }
                        allLines =[roadmapData[i+3] componentsSeparatedByString: @"\n"];
                        lines= [ allLines count]-2;
                        col=0,row=0;
                        w=11.9,h=10.6;                  
                        
                        if (lines<=18)
                            start=0;
                        else 
                        {   start=lines-19;
                            lines=19;
                        } 
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                if ([[data objectAtIndex:0] intValue]==1)
                                    [zingPlayer drawInRect: CGRectMake(571+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];
                                else if ([[data objectAtIndex:0] intValue]==2)
                                    [zingBanker drawInRect: CGRectMake(571+col*w, 66+row*h,9, 9) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                                
                            }                    
                        }
                        
                    }
                    break;
                    
                case 2:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=33)
                        start=0;
                    else 
                    {    start=lines-34;
                        lines=34;
                    }   
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [player drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [banker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                                       
                        }                    
                    }
                    }
                    else
                    {
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                        int lines= [ allLines count]-2;
                        NSLog(@"ipad");
                        col=0,row=0;
                        w=23.8,h=21.2;                  
                        
                        if (lines<=33)
                            start=0;
                        else 
                        {   start=lines-34;
                            lines=34;
                        }   
                        
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                
                                
                                if ([[data objectAtIndex:0] intValue]==1)
                                {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    // count_play_temp+=1;
                                }
                                else if ([[data objectAtIndex:0] intValue]==2)
                                {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //  count_bank_temp+=1;
                                }                       
                                if ([[data objectAtIndex:1] intValue]>=1)
                                {[tie1 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                                }
                                if ([[data objectAtIndex:1] intValue]>=2)
                                    [tie2 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                    
                                
                                if ([[data objectAtIndex:1] intValue]>=3)
                                    [tie3 drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                 
                            }                    
                        }
                    }
                    break;
                case 3:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=13)
                        start=0;
                    else 
                    {    start=lines-14;
                        lines=14;
                    }   
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [smallPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [smallBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                            
                        }                    
                    }}
                    else {
                        NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                        int lines= [ allLines count]-2;
                        col=0,row=0;
                       w=23.8,h=21.2;                    
                        
                        if (lines<=18)
                            start=0;
                        else 
                        {   start=lines-19;
                            lines=19;
                        }   
                        
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                
                                
                                if ([[data objectAtIndex:0] intValue]==1)
                                {  [player drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    // count_play_temp+=1;
                                }
                                else if ([[data objectAtIndex:0] intValue]==2)
                                {    [banker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                    //  count_bank_temp+=1;
                                }                       
                                
                            }                    
                        }
                    }
                    break;
                case 4:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<=13)
                        start=0;
                    else 
                    {    start=lines-14;
                        lines=14;
                    }   
                    for(col=0;col<lines-1;col++)
                    {
                        NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                        NSLog([allrows objectAtIndex:1],nil);
                        allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(row=0;row<6;row++)
                        {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                            if ([[data objectAtIndex:0] intValue]==1)
                                [zingPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            else if ([[data objectAtIndex:0] intValue]==2)
                                [zingBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                            
                        }                    
                    }}
                    else {
                        NSArray *allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                        int lines= [ allLines count]-2;
                        col=0,row=0;
                        w=23.8,h=21.2; 
                        
                        if (lines<=33)
                            start=0;
                        else 
                        {    start=lines-34;
                            lines=34;
                        }   
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                if ([[data objectAtIndex:0] intValue]==1)
                                    [smallPlayer drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                else if ([[data objectAtIndex:0] intValue]==2)
                                    [smallBanker drawInRect: CGRectMake(1+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                                
                            }                    
                        }

                    }
                    break;
                case 5:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;
                    
                    if (lines<0)
                    {
                        NSLog(@"lies==0");
                        break;
                    }
                  
                    allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                    {
                        NSLog(@"lies<1");
                        break;
                    }
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if (([[data objectAtIndex:0] intValue]%3)==1)
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==2)
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                        if (([[data objectAtIndex:0] intValue]%3)==0)
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                        [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        
                        if (([[data objectAtIndex:0] intValue]/3)==1)
                        { 
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_small3.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==2)
                        {    
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_small3.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                        if (([[data objectAtIndex:0] intValue]/3)==3)
                        {    
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_small3.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_small3.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        }
                    }
                    NSLog(@"james5");
                    }
                    else 
                    {
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                        int lines= [ allLines count]-2;

                        col=0,row=0;
                        w=23.8,h=21.2;                      
                        
                        if (lines<=13)
                            start=0;
                        else 
                        {    start=lines-14;
                            lines=14;
                        }   
                        for(col=0;col<lines-1;col++)
                        {
                            NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                            NSLog([allrows objectAtIndex:1],nil);
                            allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                            
                            for(row=0;row<6;row++)
                            {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                                if ([[data objectAtIndex:0] intValue]==1)
                                    [zingPlayer drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                else if ([[data objectAtIndex:0] intValue]==2)
                                    [zingBanker drawInRect: CGRectMake(2+col*w, 2+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                        
                                
                            }                    
                        }
                    }
                    break;
                    
                case 6:
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                    col=0,row=0;
                    w=20,h=21;
                    if (lines<0)
                    { break;}
                             allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                    if (allLines.count<2)
                        break;
                    
                    allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                    
                    for(col=0;col<[allLines count]-1;col++)
                    {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                        UIImage *tmpimg ;
                        if ([[data objectAtIndex:0] intValue]==1)
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                        if ([[data objectAtIndex:0] intValue]==2)
                            tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                        
                        [tmpimg drawInRect: CGRectMake(1+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                   
                        
                    }}
                    else {
                        
                        allLines =[roadmapData[i-1] componentsSeparatedByString: @"\n"];
                        col=0,row=0;
                         w=23.8,h=21.2;
                        
                        if (lines<0)
                        {
                            NSLog(@"lies==0");
                            break;
                        }
                        
                        allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                        if (allLines.count<2)
                        {
                            NSLog(@"lies<1");
                            break;
                        }
                        allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(col=0;col<[allLines count]-1;col++)
                        {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                            UIImage *tmpimg ;
                            if (([[data objectAtIndex:0] intValue]%3)==1)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_B_0%@.png",[data objectAtIndex:1]] ];
                            if (([[data objectAtIndex:0] intValue]%3)==0)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_0%@.png",[data objectAtIndex:1]] ];
                            [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col %6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            
                            if (([[data objectAtIndex:0] intValue]/3)==1)
                            { 
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_small3.png",[data objectAtIndex:1]] ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==2)
                            {    
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_small3.png",[data objectAtIndex:1]] ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                            if (([[data objectAtIndex:0] intValue]/3)==3)
                            {    
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_G_small3.png",[data objectAtIndex:1]] ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_R_small3.png",[data objectAtIndex:1]] ];
                                [tmpimg drawInRect: CGRectMake(2+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                            }
                        }
                        allLines =[roadmapData[i] componentsSeparatedByString: @"\n"];
                        col=0,row=0;
                         w=23.8,h=21.2;
                        if (lines<0)
                        { break;}
                        allLines =[[allLines objectAtIndex:1] componentsSeparatedByString: @":"];
                        if (allLines.count<2)
                            break;
                        
                        allLines=[[allLines objectAtIndex:1] componentsSeparatedByString: @";"];
                        
                        for(col=0;col<[allLines count]-1;col++)
                        {   NSArray *data =[[allLines objectAtIndex:col] componentsSeparatedByString: @","];
                            UIImage *tmpimg ;
                            if ([[data objectAtIndex:0] intValue]==1)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_big.png"] ];
                            if ([[data objectAtIndex:0] intValue]==2)
                                tmpimg= [UIImage imageNamed:[NSString stringWithFormat:@"rou_small.png"] ];
                            
                            [tmpimg drawInRect: CGRectMake(405+(int)col/6*w, 2+((int)col%6)*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];                   
                            
                        }
                    }
                    
                                      break;
                    
                default:
                    break;
            }
        
        
        
        image=UIGraphicsGetImageFromCurrentImageContext()   ;
        
		
		UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
		
        CGRect rect = imageView.frame;
		rect.size.height = myGameInfo.roadmapHight;
		rect.size.width = myGameInfo.roadmapWidth;
		imageView.frame = rect;
		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
		[scrviewRoadmap addSubview:imageView];
		
	}
    
	
    [self layoutScrollImages];

}

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [scrviewRoadmap subviews];
    NSLog(@"james5 %i",[[scrviewRoadmap subviews] count] );
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
           if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
               curXLoc += (myGameInfo.roadmapWidth);
            else
                curXLoc += (myGameInfo.roadmapWidth+1);
        }
	}
	
	// set the content size so it can be scrollable
	[scrviewRoadmap setContentSize:CGSizeMake((6 * myGameInfo.roadmapWidth),  myGameInfo.roadmapHight-1)];	// now place the photos in serial layout 
}

- (IBAction) clearBet
{
    [self clearBetAreaInfo];
    [self upBetAreaInfo];   
}

-(BOOL)betProcess:(int)betAreaIndex
{
     if (!(myGameInfo.status ==1))
         return NO;
    
   // myUserInfo.unbetround  =0;
      [self bgPlay:@"Click.WAV"];   
    struct  betAreaInfo betAreaInfoTemp ;
    if (myUserInfo.gameCode ==1)
        betAreaInfoTemp =bac1;
    if (myUserInfo.gameCode==2)
        betAreaInfoTemp =bac2;
     if (myUserInfo.gameCode==3)
        betAreaInfoTemp =bac3;
     if (myUserInfo.gameCode==6)
        betAreaInfoTemp =bac4;
     if (myUserInfo.gameCode==7)
        betAreaInfoTemp =bac5;
     
    switch (betAreaIndex) {
        case 1:
            if (betAreaInfoTemp.moneyCanbet1>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet1 =   betAreaInfoTemp.moneyCanbet1 - betMoney;                     // 可下注金頠
                //betAreaInfoTemp.moneyBetting1 = betAreaInfoTemp.moneyLimit1 -betAreaInfoTemp.moneyCanbet1 ; // 本局累積下注金額
                betAreaInfoTemp.moneyBetting1 = betAreaInfoTemp.moneyBetting1 +betMoney ;                     // 本次下注金額
            }
            break;
            
        case 2:
            if (betAreaInfoTemp.moneyCanbet2>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet2 =   betAreaInfoTemp.moneyCanbet2 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting2 = betAreaInfoTemp.moneyBetting2 +betMoney ;                     // 本次下注金額
            }
            break;
            
        case 3:
            if (betAreaInfoTemp.moneyCanbet3>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet3 =  betAreaInfoTemp.moneyCanbet3 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting3 = betAreaInfoTemp.moneyBetting3 +betMoney ;                     // 本次下注金額
            }
            break;
            
        case 4:
            if (betAreaInfoTemp.moneyCanbet4>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet4 =   betAreaInfoTemp.moneyCanbet4 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting4 = betAreaInfoTemp.moneyBetting4 +betMoney ;                     // 本次下注金額
            }
            break;
        case 5:
            if (betAreaInfoTemp.moneyCanbet5>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet5 =   betAreaInfoTemp.moneyCanbet5 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting5 = betAreaInfoTemp.moneyBetting5 +betMoney ;                     // 本次下注金額
            }
            break;
        case 6:
            if (betAreaInfoTemp.moneyCanbet6>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet6 =   betAreaInfoTemp.moneyCanbet6 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting6 = betAreaInfoTemp.moneyBetting6 +betMoney ;                     // 本次下注金額
            }
            break;
        case 7:
            if (betAreaInfoTemp.moneyCanbet7>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet7 =   betAreaInfoTemp.moneyCanbet7 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting7 = betAreaInfoTemp.moneyBetting7 +betMoney ;                     // 本次下注金額
            }
            break;
        case 8:
            if (betAreaInfoTemp.moneyCanbet8>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet8 =   betAreaInfoTemp.moneyCanbet8 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting8 = betAreaInfoTemp.moneyBetting8 +betMoney ;                     // 本次下注金額
            }
            break;
        case 9:
            if (betAreaInfoTemp.moneyCanbet9>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet9 =   betAreaInfoTemp.moneyCanbet9 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting9 = betAreaInfoTemp.moneyBetting9 +betMoney ;                     // 本次下注金額
            }
            break;
        case 10:
            if (betAreaInfoTemp.moneyCanbet10>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet10 =   betAreaInfoTemp.moneyCanbet10 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting10 = betAreaInfoTemp.moneyBetting10 +betMoney ;                     // 本次下注金額
            }
            break;
        case 11:
            if (betAreaInfoTemp.moneyCanbet11>=betMoney)            
            {            
                betAreaInfoTemp.moneyCanbet11 =   betAreaInfoTemp.moneyCanbet11 - betMoney;                     // 可下注金頠
                betAreaInfoTemp.moneyBetting11 = betAreaInfoTemp.moneyBetting11 +betMoney ;                     // 本次下注金額
            }
            break;
            
          
        
    default:
        break;
        
        
       
    }
    
   if (myUserInfo.gameCode ==1)
        bac1=betAreaInfoTemp;
    if (myUserInfo.gameCode ==2)
        bac2=betAreaInfoTemp;
   if (myUserInfo.gameCode ==3)
        bac3=betAreaInfoTemp;
   if (myUserInfo.gameCode ==6)
        bac4=betAreaInfoTemp;
    if (myUserInfo.gameCode ==7)
        bac5=betAreaInfoTemp;
}

-(BOOL)upBetAreaInfo
{
    struct  betAreaInfo betAreaInfoTemp ;
    if (myUserInfo.gameCode ==1)
        betAreaInfoTemp =bac1;
    if (myUserInfo.gameCode==2)
        betAreaInfoTemp =bac2;
    if (myUserInfo.gameCode==3)
        betAreaInfoTemp =bac3;
    if (myUserInfo.gameCode==6)
        betAreaInfoTemp =bac4;
    if (myUserInfo.gameCode==7)
        betAreaInfoTemp =bac5;
    


    baI_Bet1.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit1 -betAreaInfoTemp.moneyCanbet1 ]  ;     
    baL_Bet1.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet1] ;
    baE_Bet1.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted1] ;
    
    baI_Bet2.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit2 -betAreaInfoTemp.moneyCanbet2 ]  ;     
    baL_Bet2.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet2] ;
    baE_Bet2.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted2] ;
    
    baI_Bet3.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit3 -betAreaInfoTemp.moneyCanbet3 ]  ;     
    baL_Bet3.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet3] ;
    baE_Bet3.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted3] ;
    
    baI_Bet4.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit4 -betAreaInfoTemp.moneyCanbet4 ]  ;     
    baL_Bet4.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet4] ;
    baE_Bet4.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted4] ;
    
    baI_Bet5.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit5 -betAreaInfoTemp.moneyCanbet5 ]  ;     
    baL_Bet5.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet5] ;
    baE_Bet5.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted5] ;
    
    baI_Bet6.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit6 -betAreaInfoTemp.moneyCanbet6 ]  ;     
    baL_Bet6.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet6] ;
    baE_Bet6.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted6] ;
    
    baI_Bet7.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit7 -betAreaInfoTemp.moneyCanbet7 ]  ;     
    baL_Bet7.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet7] ;
    baE_Bet7.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted7] ;
    
    baI_Bet8.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit8 -betAreaInfoTemp.moneyCanbet8 ]  ;     
    baL_Bet8.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet8] ;
    baE_Bet8.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted8] ;
    
    baI_Bet9.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit9 -betAreaInfoTemp.moneyCanbet9 ]  ;     
    baL_Bet9.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet9] ;
    baE_Bet9.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted9] ;
    
    baI_Bet10.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit10 -betAreaInfoTemp.moneyCanbet10 ]  ;     
    baL_Bet10.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet10] ;
    baE_Bet10.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted10] ;
    
    baI_Bet11.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyLimit11 -betAreaInfoTemp.moneyCanbet11 ]  ;     
    baL_Bet11.text =   [NSString stringWithFormat: @"%.0f", betAreaInfoTemp.moneyCanbet11] ;
    baE_Bet11.text =   [NSString stringWithFormat: @"+%.0f", betAreaInfoTemp.moneyBetted11] ;
    
 
    
  
 
    //1
    if (betAreaInfoTemp.moneyBetted1 == 0 && betAreaInfoTemp.moneyBetting1 ==0)
    {
        baI_Bet1.hidden= YES;
        baL_Bet1.hidden =YES;
        baB_Bet1.hidden =YES;
        baE_Bet1.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting1 >=0.5)
    {
        baI_Bet1.hidden= NO;
        baL_Bet1.hidden =NO;
        baB_Bet1.hidden =NO;
        baE_Bet1.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted1 >=0.5)
    {
        baI_Bet1.hidden= YES;
        baL_Bet1.hidden =YES;
        baB_Bet1.hidden =NO;
        baE_Bet1.hidden= NO;
    }
    
    //2
    if (betAreaInfoTemp.moneyBetted2 == 0 && betAreaInfoTemp.moneyBetting2 ==0)
    {
        baI_Bet2.hidden= YES;
        baL_Bet2.hidden =YES;
        baB_Bet2.hidden =YES;
        baE_Bet2.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting2 >=0.5)
    {
        baI_Bet2.hidden= NO;
        baL_Bet2.hidden =NO;
        baB_Bet2.hidden =NO;
        baE_Bet2.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted2 >=0.5)
    {
        baI_Bet2.hidden= YES;
        baL_Bet2.hidden =YES;
        baB_Bet2.hidden =NO;
        baE_Bet2.hidden= NO;
    }
    
    //3
    if (betAreaInfoTemp.moneyBetted3 == 0 && betAreaInfoTemp.moneyBetting3 ==0)
    {
        baI_Bet3.hidden= YES;
        baL_Bet3.hidden =YES;
        baB_Bet3.hidden =YES;
        baE_Bet3.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting3 >=0.5)
    {
        baI_Bet3.hidden= NO;
        baL_Bet3.hidden =NO;
        baB_Bet3.hidden =NO;
        baE_Bet3.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted3 >=0.5)
    {
        baI_Bet3.hidden= YES;
        baL_Bet3.hidden =YES;
        baB_Bet3.hidden =NO;
        baE_Bet3.hidden= NO;
    }
    
    //4
    if (betAreaInfoTemp.moneyBetted4 == 0 && betAreaInfoTemp.moneyBetting4 ==0)
    {
        baI_Bet4.hidden= YES;
        baL_Bet4.hidden =YES;
        baB_Bet4.hidden =YES;
        baE_Bet4.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting4 >=0.5)
    {
        baI_Bet4.hidden= NO;
        baL_Bet4.hidden =NO;
        baB_Bet4.hidden =NO;
        baE_Bet4.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted4 >=0.5)
    {
        baI_Bet4.hidden= YES;
        baL_Bet4.hidden =YES;
        baB_Bet4.hidden =NO;
        baE_Bet4.hidden= NO;
    }
    //5
    if (betAreaInfoTemp.moneyBetted5 == 0 && betAreaInfoTemp.moneyBetting5 ==0)
    {
        baI_Bet5.hidden= YES;
        baL_Bet5.hidden =YES;
        baB_Bet5.hidden =YES;
        baE_Bet5.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting5 >=0.5)
    {
        baI_Bet5.hidden= NO;
        baL_Bet5.hidden =NO;
        baB_Bet5.hidden =NO;
        baE_Bet5.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted5 >=0.5)
    {
        baI_Bet5.hidden= YES;
        baL_Bet5.hidden =YES;
        baB_Bet5.hidden =NO;
        baE_Bet5.hidden= NO;
    }
    //6
    if (betAreaInfoTemp.moneyBetted6 == 0 && betAreaInfoTemp.moneyBetting6 ==0)
    {
        baI_Bet6.hidden= YES;
        baL_Bet6.hidden =YES;
        baB_Bet6.hidden =YES;
        baE_Bet6.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting6 >=0.5)
    {
        baI_Bet6.hidden= NO;
        baL_Bet6.hidden =NO;
        baB_Bet6.hidden =NO;
        baE_Bet6.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted6 >=0.5)
    {
        baI_Bet6.hidden= YES;
        baL_Bet6.hidden =YES;
        baB_Bet6.hidden =NO;
        baE_Bet6.hidden= NO;
    }
    //7
    if (betAreaInfoTemp.moneyBetted7 == 0 && betAreaInfoTemp.moneyBetting7 ==0)
    {
        baI_Bet7.hidden= YES;
        baL_Bet7.hidden =YES;
        baB_Bet7.hidden =YES;
        baE_Bet7.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting7 >=0.5)
    {
        baI_Bet7.hidden= NO;
        baL_Bet7.hidden =NO;
        baB_Bet7.hidden =NO;
        baE_Bet7.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted7 >=0.5)
    {
        baI_Bet7.hidden= YES;
        baL_Bet7.hidden =YES;
        baB_Bet7.hidden =NO;
        baE_Bet7.hidden= NO;
    }    //8
    if (betAreaInfoTemp.moneyBetted8 == 0 && betAreaInfoTemp.moneyBetting8 ==0)
    {
        baI_Bet8.hidden= YES;
        baL_Bet8.hidden =YES;
        baB_Bet8.hidden =YES;
        baE_Bet8.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting8 >=0.5)
    {
        baI_Bet8.hidden= NO;
        baL_Bet8.hidden =NO;
        baB_Bet8.hidden =NO;
        baE_Bet8.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted8 >=0.5)
    {
        baI_Bet8.hidden= YES;
        baL_Bet8.hidden =YES;
        baB_Bet8.hidden =NO;
        baE_Bet8.hidden= NO;
    }
    //9
    if (betAreaInfoTemp.moneyBetted9 == 0 && betAreaInfoTemp.moneyBetting9 ==0)
    {
        baI_Bet9.hidden= YES;
        baL_Bet9.hidden =YES;
        baB_Bet9.hidden =YES;
        baE_Bet9.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting9 >=0.5)
    {
        baI_Bet9.hidden= NO;
        baL_Bet9.hidden =NO;
        baB_Bet9.hidden =NO;
        baE_Bet9.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted9 >=0.5)
    {
        baI_Bet9.hidden= YES;
        baL_Bet9.hidden =YES;
        baB_Bet9.hidden =NO;
        baE_Bet9.hidden= NO;
    }
    //10
    if (betAreaInfoTemp.moneyBetted10 == 0 && betAreaInfoTemp.moneyBetting10 ==0)
    {
        baI_Bet10.hidden= YES;
        baL_Bet10.hidden =YES;
        baB_Bet10.hidden =YES;
        baE_Bet10.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting10 >=0.5)
    {
        baI_Bet10.hidden= NO;
        baL_Bet10.hidden =NO;
        baB_Bet10.hidden =NO;
        baE_Bet10.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted10 >=0.5)
    {
        baI_Bet10.hidden= YES;
        baL_Bet10.hidden =YES;
        baB_Bet10.hidden =NO;
        baE_Bet10.hidden= NO;
    }
    //11
    if (betAreaInfoTemp.moneyBetted11 == 0 && betAreaInfoTemp.moneyBetting11 ==0)
    {
        baI_Bet11.hidden= YES;
        baL_Bet11.hidden =YES;
        baB_Bet11.hidden =YES;
        baE_Bet11.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetting11 >=0.5)
    {
        baI_Bet11.hidden= NO;
        baL_Bet11.hidden =NO;
        baB_Bet11.hidden =NO;
        baE_Bet11.hidden= YES;
    }else if(betAreaInfoTemp.moneyBetted11 >=0.5)
    {
        baI_Bet11.hidden= YES;
        baL_Bet11.hidden =YES;
        baB_Bet11.hidden =NO;
        baE_Bet11.hidden= NO;
    }
    
    
    
    return YES;
    
}



-(BOOL)clearBetAreaInfo
{
    struct  betAreaInfo betAreaInfoTemp ;
    if (myUserInfo.gameCode ==1)
        betAreaInfoTemp =bac1;
    if (myUserInfo.gameCode==2)
        betAreaInfoTemp =bac2;
    if (myUserInfo.gameCode==3)
        betAreaInfoTemp =bac3;
    if (myUserInfo.gameCode==6)
        betAreaInfoTemp =bac4;
    if (myUserInfo.gameCode==7)
        betAreaInfoTemp =bac5;
    
           
    betAreaInfoTemp.moneyCanbet1 =   betAreaInfoTemp.moneyLimit1-betAreaInfoTemp.moneyBetted1;                      
    betAreaInfoTemp.moneyBetting1 = 0 ;                     // 本次下注金額
    betAreaInfoTemp.moneyCanbet2 =   betAreaInfoTemp.moneyLimit2-betAreaInfoTemp.moneyBetted2;   
    betAreaInfoTemp.moneyBetting2 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet3 =   betAreaInfoTemp.moneyLimit3-betAreaInfoTemp.moneyBetted3;                      
    betAreaInfoTemp.moneyBetting3 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet4 =   betAreaInfoTemp.moneyLimit4-betAreaInfoTemp.moneyBetted4;                      
    betAreaInfoTemp.moneyBetting4 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet5 =   betAreaInfoTemp.moneyLimit5-betAreaInfoTemp.moneyBetted5;                      
    betAreaInfoTemp.moneyBetting5 = 0 ;                     // 本次下注金額   
    betAreaInfoTemp.moneyCanbet6 =   betAreaInfoTemp.moneyLimit6-betAreaInfoTemp.moneyBetted6;                      
    betAreaInfoTemp.moneyBetting6 = 0 ;                     // 本次下注金額 
    betAreaInfoTemp.moneyCanbet7 =   betAreaInfoTemp.moneyLimit7-betAreaInfoTemp.moneyBetted7;                      
    betAreaInfoTemp.moneyBetting7 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet8=   betAreaInfoTemp.moneyLimit8-betAreaInfoTemp.moneyBetted8;                      
    betAreaInfoTemp.moneyBetting8 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet9 =   betAreaInfoTemp.moneyLimit9-betAreaInfoTemp.moneyBetted9;                      
    betAreaInfoTemp.moneyBetting9 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet10 =   betAreaInfoTemp.moneyLimit10-betAreaInfoTemp.moneyBetted10;                      
    betAreaInfoTemp.moneyBetting10 = 0 ;                     // 本次下注金額    
    betAreaInfoTemp.moneyCanbet11 =   betAreaInfoTemp.moneyLimit11-betAreaInfoTemp.moneyBetted11;                      
    betAreaInfoTemp.moneyBetting11 = 0 ;                     // 本次下注金額    
        //下注正常 清除有問題
            
            
    
    
    if (myUserInfo.gameCode ==1)
        bac1=betAreaInfoTemp;
    if (myUserInfo.gameCode ==2)
        bac2=betAreaInfoTemp;
    if (myUserInfo.gameCode ==3)
        bac3=betAreaInfoTemp;
    if (myUserInfo.gameCode ==6)
        bac4=betAreaInfoTemp;
    if (myUserInfo.gameCode ==7)
        bac5=betAreaInfoTemp;

}

- (IBAction) Down_btnBet1
{         
    if(betMoney>0)
    {
        [self betProcess:1];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
    
}

- (IBAction) Down_btnBet2
{
    if(betMoney>0)
    {
        [self betProcess:2];
        [self upBetAreaInfo] ;   
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet3
{
    if(betMoney>0)
    {
        [self betProcess:3];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet4
{
    if(betMoney>0)
    {
        [self betProcess:4];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet5
{
    if(betMoney>0)
    {
        [self betProcess:5];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet6
{
    if(betMoney>0)
    {
        [self betProcess:6];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet7
{
    if(betMoney>0)
    {
        [self betProcess:7];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet8
{
    if(betMoney>0)
    {
        [self betProcess:8];
        [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet9
{
    if(betMoney>0)
    {
    [self betProcess:9];
    [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet10
{
    if(betMoney>0)
    {
    [self betProcess:10];
    [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

- (IBAction) Down_btnBet11
{
    if(betMoney>0)
    {
    [self betProcess:11];
    [self upBetAreaInfo] ;
    }else {
        [self showError:@"请选择下注筹码"];
    }
}

-(void) changeEachTable:(int)index
{ 
    CGRect temp ;
    NSString *strUrl ;
    myUserInfo.changeindex=index;
    
 
    while ([changeFront.subviews count] > 0) {    
        [[[changeFront subviews] objectAtIndex:0] removeFromSuperview];
    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    [btnchang1 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
    [btnchang2 setImage:[UIImage imageNamed: @"bacB_btn_up.png"] forState:UIControlStateNormal];
    [btnchang3 setImage:[UIImage imageNamed: @"bacC_btn_up.png"] forState:UIControlStateNormal];
    [btnchang4 setImage:[UIImage imageNamed: @"bacD_btn_up.png"] forState:UIControlStateNormal];
    [btnchang5 setImage:[UIImage imageNamed: @"bacE_btn_up.png"] forState:UIControlStateNormal];
   // [btnchang6 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
   // [btnchang7 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
   // [btnchang8 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
   // [btnchang9 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
   // [btnchang10 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal];
     
    if (index<9 && index>0)
    {
        [changeTop setCenter:CGPointMake(160,95)] ;
        [changeBG setCenter:CGPointMake(160,103)] ;
        [changeTitle setCenter:CGPointMake(160,105)] ;
        [changeFront setCenter:CGPointMake(160,127)] ; 
        [changeUnder setCenter:CGPointMake(160,246)] ;
        temp= changeTop.frame;    
        [changeTop setFrame:CGRectMake(temp.origin.x ,95.0, temp.size.width , temp.size.height)];
        temp= changeBG.frame;    
        [changeBG setFrame:CGRectMake(temp.origin.x ,103.0, temp.size.width , temp.size.height)];
        temp= changeTitle.frame;    
        [changeTitle setFrame:CGRectMake(temp.origin.x ,105.0, temp.size.width , temp.size.height)];
        temp= changeFront.frame;    
        [changeFront setFrame:CGRectMake(temp.origin.x ,127.0, temp.size.width , temp.size.height)];
        temp= changeUnder.frame;    
        [changeUnder setFrame:CGRectMake(temp.origin.x ,246.0, temp.size.width , temp.size.height)];
        
               
        temp=btnchang5.frame; 
        [btnchang5 setFrame:CGRectMake(temp.origin.x ,260.0, temp.size.width , temp.size.height)];
        temp=btnchang6.frame; 
        [btnchang6 setFrame:CGRectMake(temp.origin.x ,260.0, temp.size.width , temp.size.height)];
        temp=btnchang7.frame; 
        [btnchang7 setFrame:CGRectMake(temp.origin.x ,260.0, temp.size.width , temp.size.height)];
        temp=btnchang8.frame; 
        [btnchang8 setFrame:CGRectMake(temp.origin.x ,260.0, temp.size.width , temp.size.height)];
        temp=btnchang9.frame; 
        [btnchang9 setFrame:CGRectMake(temp.origin.x ,355.0, temp.size.width , temp.size.height)];
        temp=btnchang10.frame; 
        [btnchang10 setFrame:CGRectMake(temp.origin.x ,355.0, temp.size.width , temp.size.height)];            
    }
    if (index<=0)
    {
        [changeTop setCenter:CGPointMake(-160,95)] ;
        [changeBG setCenter:CGPointMake(-160,103)] ;
        [changeTitle setCenter:CGPointMake(-160,105)] ;
        [changeFront setCenter:CGPointMake(-160,127)] ;
        [changeUnder setCenter:CGPointMake(-160,246)] ;
        
        
        temp=btnchang1.frame; 
        [btnchang1 setFrame:CGRectMake(temp.origin.x ,14, temp.size.width , temp.size.height)];
        temp=btnchang2.frame; 
        [btnchang2 setFrame:CGRectMake(temp.origin.x ,14, temp.size.width , temp.size.height)];
        temp=btnchang3.frame; 
        [btnchang3 setFrame:CGRectMake(temp.origin.x ,14, temp.size.width , temp.size.height)];
        temp=btnchang4.frame; 
        [btnchang4 setFrame:CGRectMake(temp.origin.x ,14, temp.size.width , temp.size.height)];
       
        temp=btnchang5.frame; 
        [btnchang5 setFrame:CGRectMake(temp.origin.x ,107, temp.size.width , temp.size.height)];
        temp=btnchang6.frame; 
        [btnchang6 setFrame:CGRectMake(temp.origin.x ,107, temp.size.width , temp.size.height)];
        temp=btnchang7.frame; 
        [btnchang7 setFrame:CGRectMake(temp.origin.x ,107, temp.size.width , temp.size.height)];
        temp=btnchang8.frame; 
        [btnchang8 setFrame:CGRectMake(temp.origin.x ,107, temp.size.width , temp.size.height)];
        
        temp=btnchang9.frame; 
        [btnchang9 setFrame:CGRectMake(temp.origin.x ,200, temp.size.width , temp.size.height)];
        temp=btnchang10.frame; 
        [btnchang10 setFrame:CGRectMake(temp.origin.x ,200, temp.size.width , temp.size.height)];  
    }
    
    [labchang5 setFrame:CGRectMake(labchang5.frame.origin.x ,btnchang5.frame.origin.y-1, 27 , 21)];
    [labchang6 setFrame:CGRectMake(labchang6.frame.origin.x ,btnchang6.frame.origin.y-1, 27 , 21)];
    [labchang7 setFrame:CGRectMake(labchang7.frame.origin.x ,btnchang7.frame.origin.y-1, 27 , 21)];
    [labchang8 setFrame:CGRectMake(labchang8.frame.origin.x ,btnchang8.frame.origin.y-1, 27 , 21)];
    [labchang9 setFrame:CGRectMake(labchang9.frame.origin.x ,btnchang9.frame.origin.y-1, 27 , 21)];
    [labchang10 setFrame:CGRectMake(labchang10.frame.origin.x ,btnchang10.frame.origin.y-1, 27 , 21)];

    switch (index) {
        case 1:
            [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bg.png", index]]];
            [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bg.png", index]]];
            changeTitle.text=@"百家乐 A";
            strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"a",0,0] ;
            [btnchang1 setImage:[UIImage imageNamed: @"bacA_btn_down.png"] forState:UIControlStateNormal]; 
                        break;
        case 2:
            [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bg.png", index]]];
            [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bg.png", index]]];
             changeTitle.text=@"百家乐 B";
            strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"b",0,0] ;
            [btnchang2 setImage:[UIImage imageNamed: @"bacB_btn_down.png"] forState:UIControlStateNormal]; 
            break;
        case 3:
            [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bg.png", index]]];
            [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bg.png", index]]];
             changeTitle.text=@"百家乐 C";
            strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"c",0,0] ;
            [btnchang3 setImage:[UIImage imageNamed: @"bacC_btn_down.png"] forState:UIControlStateNormal]; 
            break;
        case 4:
            [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_top_bg.png", index]]];
            [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_down_bg.png", index]]];
             changeTitle.text=@"百家乐 D";
            strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"d",0,0] ;
            [btnchang4 setImage:[UIImage imageNamed: @"bacD_btn_down.png"] forState:UIControlStateNormal]; 
            break;
            
        case 5:
            [changeTop setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route00_top_bg.png%@", index]]];
            [changeUnder setImage:[UIImage imageNamed:  [NSString stringWithFormat: @"route0%i_down_bg.png", index%4]]];
             changeTitle.text=@"百家乐 E";
            strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"e",0,0] ;
            [btnchang5 setImage:[UIImage imageNamed: @"bacE_btn_down.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
            
            
            
            
    }
        //http://183.182.66.167/3001/c/0/0.htm;
        //桌号 路子种类 问路。
        NSString *roadmapData;
        NSUInteger i;
        
        UIImage *player = [UIImage imageNamed:@"rou_R_big.png"]; 
        UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"]; 
        UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
        UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
        UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
        
        
        if(scrviewRoadmap!=nil)
        {
            while ([scrviewRoadmap.subviews count] > 0) {
                [[[scrviewRoadmap subviews] objectAtIndex:0] removeFromSuperview];
            }
        }
        
        
        
        UIGraphicsBeginImageContext(CGSizeMake(298,112));  
        CGContextRef context= UIGraphicsGetCurrentContext();
        NSString *imageName = [NSString stringWithFormat:@"route_bg_bac.png", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [image drawInRect:CGRectMake(0, 0,298, 112)];
        CGContextSaveGState(context);
        CGContextRestoreGState(context);  
        
        NSURL *url = [NSURL URLWithString:strUrl];     
        roadmapData= [NSString stringWithContentsOfURL:url]; 
        NSLog(@"jamestest4%@",roadmapData);
        
        int col=0,row=0;
        double w=20,h=21;
        int start;
        NSArray *allLines =[roadmapData componentsSeparatedByString: @"\n"];
        int lines= [ allLines count]-2;
        
        if (lines>0)
        {
            col=0,row=0;
            w=18.6,h=17.8;
            //   int count_bank_temp=0,count_play_temp=0,count_tie_temp=0;
            
            if (lines<=16)
                start=0;
            else 
            {   start=lines-17;
                lines=17;
            }   
            
            for(col=0;col<lines-1;col++)
            {
                NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                NSLog([allrows objectAtIndex:1],nil);
                allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                
                for(row=0;row<6;row++)
                {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                    
                    
                    if ([[data objectAtIndex:0] intValue]==1)
                    {  [player drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        // count_play_temp+=1;
                    }
                    else if ([[data objectAtIndex:0] intValue]==2)
                    {    [banker drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_bank_temp+=1;
                    }                       
                    if ([[data objectAtIndex:1] intValue]>=1)
                    {[tie1 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                    }
                    if ([[data objectAtIndex:1] intValue]>=2)
                        [tie2 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                    
                    if ([[data objectAtIndex:1] intValue]>=3)
                        [tie3 drawInRect: CGRectMake(1+col*w, 0+row*h,18, 18) blendMode:kCGBlendModeNormal alpha:1.0f];
                }                    
            }
            // countBanker.text =[NSString stringWithFormat:@"%d", count_bank_temp];
            //  countPlayer.text =[NSString stringWithFormat:@"%d", count_play_temp];;
            //  countTie.text =   [NSString stringWithFormat:@"%d", count_tie_temp];;
            
        }
        image=UIGraphicsGetImageFromCurrentImageContext()   ;
        
        
        UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
        
        CGRect rect = imageView.frame;
        rect.size.height = 118;
        rect.size.width = 298;
        imageView.frame = rect;
        imageView.tag = i;	// tag our images for later use when we place them in serial fashion
        [changeFront addSubview:imageView];
        
        
    }
    else 
    {
        [btnchang1 setImage:[UIImage imageNamed: @"BaccaratA@2x.png"] forState:UIControlStateNormal]; 
        [btnchang2 setImage:[UIImage imageNamed: @"BaccaratB@2x.png"] forState:UIControlStateNormal]; 
        [btnchang3 setImage:[UIImage imageNamed: @"BaccaratC@2x.png"] forState:UIControlStateNormal]; 
        [btnchang4 setImage:[UIImage imageNamed: @"BaccaratD@2x.png"] forState:UIControlStateNormal]; 
        [btnchang5 setImage:[UIImage imageNamed: @"BaccaratE@2x.png"] forState:UIControlStateNormal]; 
        // [btnchang6 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
        // [btnchang7 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
        // [btnchang8 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
        // [btnchang9 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
        // [btnchang10 setImage:[UIImage imageNamed: @"bacA_btn_up.png"] forState:UIControlStateNormal]; 
       
        
               
        switch (index) {
            case 1:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"a",0,0] ;
                [btnchang1 setImage:[UIImage imageNamed: @"BaccaratA_down@2x.png"] forState:UIControlStateNormal]; 
                break;
            case 2:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"b",0,0] ;
                [btnchang2 setImage:[UIImage imageNamed: @"BaccaratB_down@2x.png"] forState:UIControlStateNormal]; 
                break;
            case 3:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"c",0,0] ;
                [btnchang3 setImage:[UIImage imageNamed: @"BaccaratC_down@2x.png"] forState:UIControlStateNormal]; 
                break;
            case 4:
                strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"d",0,0] ;
                [btnchang4 setImage:[UIImage imageNamed: @"BaccaratD_down@2x.png"] forState:UIControlStateNormal]; 
                break;
                
            case 5:
                  strUrl = [NSString stringWithFormat:@"http://183.182.66.167/3001/%@/0/0.htm" ,@"e",0,0] ;
                [btnchang5 setImage:[UIImage imageNamed: @"BaccaratE_down@2x.png"] forState:UIControlStateNormal]; 
                break;
                
            default:
                break;
    }
        
        
     
    }
    
   

}

-(IBAction)down_changeICO1
{
    [self changeEachTable:1] ;   
    
}
-(IBAction)down_changeICO2
{
     [self changeEachTable:2] ; 
}
-(IBAction)down_changeICO3
{
     [self changeEachTable:3] ; 
}
-(IBAction)down_changeICO4
{
     [self changeEachTable:4] ; 
}
-(IBAction)down_changeICO5
{
     [self changeEachTable:5] ; 
}
-(IBAction)down_changeICO6
{
    
}
-(IBAction)down_changeICO7
{
    
}
-(IBAction)down_changeICO8
{
    
}
-(IBAction)down_changeICO9
{
    
}
-(IBAction)down_changeIC10
{
    
}


- (IBAction) changeTable
{ 
    if (scrchangeTable.hidden==NO)
    {
        scrchangeTable.hidden=YES;     
        if (allCountTimer!=nil)
        {
            [allCountTimer invalidate];
            allCountTimer=nil;
        }
   
        
    }else  {
       
        myUserInfo.changeindex=1;
        scrchangeTable.hidden=NO;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        [scrchangeTable setFrame:CGRectMake(0, 45, 322, 430)];
        else 
        [scrchangeTable setFrame:CGRectMake(0, 59, 1024, 711)];
        
        [self changeEachTable:-1];
        allCountTimer  =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getCountData:) userInfo:nil repeats:YES]  ;   
        
        
        
        //http://183.182.66.167/3001/c/0/0.htm;
        //桌号 路子种类 问路。
        NSString *roadmapData;
        NSUInteger i;
        
        UIImage *player = [UIImage imageNamed:@"rou_R_big.png"]; 
        UIImage *banker = [UIImage imageNamed:@"rou_B_big.png"]; 
        UIImage *tie1 = [UIImage imageNamed:@"rou_Tie_01.png"];
        UIImage *tie2 = [UIImage imageNamed:@"rou_Tie_02.png"];
        UIImage *tie3 = [UIImage imageNamed:@"rou_Tie_03.png"];
        
        
        if(imgChangeFront1!=nil)       
            while ([imgChangeFront1.subviews count] > 0) 
                [[[imgChangeFront1 subviews] objectAtIndex:0] removeFromSuperview];      
        
        if(imgChangeFront2!=nil)       
            while ([imgChangeFront2.subviews count] > 0) 
                [[[imgChangeFront2 subviews] objectAtIndex:0] removeFromSuperview];     
        
        if(imgChangeFront3!=nil)       
            while ([imgChangeFront3.subviews count] > 0) 
                [[[imgChangeFront3 subviews] objectAtIndex:0] removeFromSuperview];     
        
        if(imgChangeFront4!=nil)       
            while ([imgChangeFront4.subviews count] > 0) 
                [[[imgChangeFront4 subviews] objectAtIndex:0] removeFromSuperview];     
        
        if(imgChangeFront5!=nil)       
            while ([imgChangeFront5.subviews count] > 0) 
                [[[imgChangeFront5 subviews] objectAtIndex:0] removeFromSuperview];     
       
        
        
        
        int changfront=0;
        for(changfront=1;changfront<=5;changfront++)
        {
            NSURL *url;
            switch (changfront) {
                case 1:
                    url = [NSURL URLWithString:@"http://183.182.66.167/3001/a/0/0.htm"];  break;
                case 2:
                    url = [NSURL URLWithString:@"http://183.182.66.167/3001/b/0/0.htm"];  break;
                case 3:
                    url = [NSURL URLWithString:@"http://183.182.66.167/3001/c/0/0.htm"];  break;
                case 4:
                    url = [NSURL URLWithString:@"http://183.182.66.167/3001/d/0/0.htm"];  break;
                case 5:
                    url = [NSURL URLWithString:@"http://183.182.66.167/3001/e/0/0.htm"];  break;                
                default:
                    break;
        }
            
            UIGraphicsBeginImageContext(CGSizeMake(298,112));  
            CGContextRef context= UIGraphicsGetCurrentContext();
            NSString *imageName = [NSString stringWithFormat:@"imgChangeFront1"];
            UIImage *image = [UIImage imageNamed:imageName];
            [image drawInRect:CGRectMake(0, 0,195, 89)];
            CGContextSaveGState(context);
            CGContextRestoreGState(context);
       
        roadmapData= [NSString stringWithContentsOfURL:url]; 
        NSLog(@"jamestest4%@",roadmapData);
        
        int col=0,row=0;
        double w=20,h=21;
        int start;
        NSArray *allLines =[roadmapData componentsSeparatedByString: @"\n"];
        int lines= [ allLines count]-2;
        
        if (lines>0)
        {
            col=0,row=0;
            w=15,h=14.4;
                   
            if (lines<=13)
                start=0;
            else 
            {   start=lines-14;
                lines=14;
            }   
            
            for(col=0;col<lines-1;col++)
            {
                NSArray *allrows =[[allLines objectAtIndex:col+1+start] componentsSeparatedByString: @":"];
                NSLog([allrows objectAtIndex:1],nil);
                allrows=[[allrows objectAtIndex:1] componentsSeparatedByString: @";"];
                
                for(row=0;row<6;row++)
                {   NSArray *data =[[allrows objectAtIndex:row] componentsSeparatedByString: @","];
                    
                    
                    if ([[data objectAtIndex:0] intValue]==1)
                    {  [player drawInRect: CGRectMake(col*w, row*h,14, 13) blendMode:kCGBlendModeNormal alpha:1.0f];
                        // count_play_temp+=1;
                    }
                    else if ([[data objectAtIndex:0] intValue]==2)
                    {    [banker drawInRect: CGRectMake(col*w, row*h,14, 13) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_bank_temp+=1;
                    }                       
                    if ([[data objectAtIndex:1] intValue]>=1)
                    {[tie1 drawInRect: CGRectMake(col*w, row*h,14, 13) blendMode:kCGBlendModeNormal alpha:1.0f];
                        //   count_tie_temp+=[[data objectAtIndex:1] intValue];
                    }
                    if ([[data objectAtIndex:1] intValue]>=2)
                        [tie2 drawInRect: CGRectMake(col*w, row*h,14, 13) blendMode:kCGBlendModeNormal alpha:1.0f];                    
                    
                    if ([[data objectAtIndex:1] intValue]>=3)
                        [tie3 drawInRect: CGRectMake(col*w, row*h,13, 13) blendMode:kCGBlendModeNormal alpha:1.0f];                 
                }                    
            }
            
            
        }
        image=UIGraphicsGetImageFromCurrentImageContext()   ;
        
        
        UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
        
        CGRect rect = imageView.frame;
        rect.size.height = 118;
        rect.size.width = 298;
        imageView.frame = rect;
           
             
                switch (changfront) {
                    case 1:
                        [imgChangeFront1 addSubview:imageView]; break;
                    case 2:
                        [imgChangeFront2 addSubview:imageView];break;
                    case 3:
                        [imgChangeFront3 addSubview:imageView];break;
                    case 4:
                         [imgChangeFront4 addSubview:imageView];break;
                    case 5:
                        [ imgChangeFront5 addSubview:imageView];   break;            
                    default:
                        break;
                }
        
    }
        
    }
      [self enableButton: NO];
 
}
- (IBAction) seeHistory
{  
 
       if(Oscor1.hidden ==YES || historyTable.hidden==YES )
       {
           list = [[NSMutableArray alloc] init];
           dateList=[[NSMutableArray alloc] init];
           heroicaArray=[[NSMutableArray alloc] init];
           heroicaArrayDetail=[[NSMutableArray alloc] init];
           
           NSMutableArray *datas=[[NSMutableArray alloc] init];
           NSMutableArray *dateListCount=[[NSMutableArray alloc] init];
           
           NSURL *url = [NSURL URLWithString: recodeurl];
           NSString *tempAnalyze;
           tempAnalyze = [NSString stringWithContentsOfURL:url];
         
           NSLog(tempAnalyze);
           NSArray *records=  [ tempAnalyze componentsSeparatedByString:@"CID"];
           
           int i=0;
           NSString *oldDate=@"";
           NSString *all,*allDetail;
           //得到全部的時間組合
           for (i=1;i<records.count-1;i++)
           {
               NSArray *temp=  [ [records objectAtIndex:i] componentsSeparatedByString:@","];
               NSString *nowDate=[temp objectAtIndex:1];
               NSString *nowDate1=[temp objectAtIndex:2];
               
               NSArray *temp1=  [ nowDate1  componentsSeparatedByString:@" "];
               NSString *nowDate2=[temp1 objectAtIndex:0];
               
               NSString *temp2=  [NSString stringWithFormat:@"庄:%@ 闲:%@    总投注%@ 总派彩%@",[temp objectAtIndex:3],[temp objectAtIndex:4],[temp objectAtIndex:5],[temp objectAtIndex:6]] ;
               [list addObject:[temp objectAtIndex:1]];
               
               if (![oldDate isEqualToString:nowDate2] )
               {
                   
                   [dateList addObject:nowDate2];
                   [dateListCount addObject:[NSString stringWithFormat:@"%i", i/7-2]] ;
                   
                   oldDate=nowDate2;
                   [datas addObject:nowDate] ;
                   all=[NSString stringWithFormat:@"%@,%@",all,@"_"];
                   allDetail=[NSString stringWithFormat:@"%@,%@",allDetail,@"_"];
               }
               all=[NSString stringWithFormat:@"%@,%@                                        %@",all,nowDate,[temp objectAtIndex:0]];
               allDetail=[NSString stringWithFormat:@"%@,%@",allDetail,temp2];
               
           }
           
           
           NSArray *alldataArray=[all componentsSeparatedByString: @",_," ];
           NSArray *alldataDetailArray=[allDetail componentsSeparatedByString: @",_," ];
           for (i=1;i<dateList.count+1;i++)
           {
               NSLog(@"james1");
               NSArray *temp=  [ [alldataArray objectAtIndex:i] componentsSeparatedByString:@","];
               [heroicaArray addObject:temp];
               
               temp=  [ [alldataDetailArray objectAtIndex:i] componentsSeparatedByString:@","];
               [heroicaArrayDetail addObject:temp];
           }
           [table reloadData];
           [self enableButton: NO];
           [self setHistorytableItemClear];
           Oscor1.hidden =NO;
           historyTable.hidden=NO;
           
       }else 
       {
           historyTable.hidden=YES;
           Oscor1.hidden =YES;
           [self enableButton: YES];
       }          
            
        btnRecord.enabled=YES;
}

- (IBAction) down_BankAsk
{
    [btnPlayAsk setImage:[UIImage imageNamed: @"askP_btn_up.png"] forState:UIControlStateNormal];   
    if (myUserInfo.asknum!=1)
    {
        myUserInfo.askconstnum=1;
        [askTimer invalidate];
        askTimer = nil;
        askTimer  =  [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES]  ;  
        [btnBankAsk setImage:[UIImage imageNamed: @"askB_btn_down.png"] forState:UIControlStateNormal];        
    }
    else
    {
        [askTimer invalidate];
        askTimer = nil;
        myUserInfo.asknum=0;
         myUserInfo.askconstnum=0;
        [btnBankAsk setImage:[UIImage imageNamed: @"askB_btn_up.png"] forState:UIControlStateNormal];     
    }
    
    [self updateRoadmap];    
}
- (IBAction) down_PlayAsk
{
    [btnBankAsk setImage:[UIImage imageNamed: @"askB_btn_up.png"] forState:UIControlStateNormal]; 
    if (myUserInfo.asknum!=2)
    {
       
        myUserInfo.askconstnum=2;
        [askTimer invalidate];
        askTimer = nil;
         askTimer  =  [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(changeAsk:) userInfo:nil repeats:YES]  ; 
        [btnPlayAsk setImage:[UIImage imageNamed: @"askP_btn_down.png"] forState:UIControlStateNormal];        
    }
    else
    {
        [askTimer invalidate];
        askTimer = nil;
        myUserInfo.askconstnum=0;
        myUserInfo.asknum=0;
        [btnPlayAsk setImage:[UIImage imageNamed: @"askP_btn_up.png"] forState:UIControlStateNormal];     
        
    }
    
    [self updateRoadmap];
}
-(IBAction) relogin
{
    if (scrhistoryTable.hidden||Oscor1.hidden)
    {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView: self.view cache:NO];
    // [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [self.view sendSubviewToBack: betView];
    [self.view bringSubviewToFront: loginView];
    [UIView commitAnimations];
    
    
    
       [timer invalidate];
    timer = nil;
    passWord.text=@"";
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *textToLoad = [prefs stringForKey:@"keyToFindText"];
    userName.text =textToLoad;
    
    [inputStream close];
    [outputStream close];
    scrviewRoadmap.hidden=NO;
     Oscor1.hidden =YES;
    scrollView1.hidden=YES;
     [_backgroundMusicPlayer stop];
    }
    else {
        scrhistoryTable.hidden=YES;
          [btnRelogin setImage:[UIImage imageNamed: @"logout_btn_up.png"] forState:UIControlStateNormal];   
        btnRecord.enabled=YES;
        btnRelogin.enabled=NO;
    }
    
}
-(void) updateRoadmap
{
    if (myUserInfo.gameCode ==1)
        [self drawRoapmap:@"A" askRoad:[NSString stringWithFormat:@"%i" ,myUserInfo.asknum]];
    if (myUserInfo.gameCode==2)
        [self drawRoapmap:@"B" askRoad:[NSString stringWithFormat:@"%i" ,myUserInfo.asknum]];
    if (myUserInfo.gameCode==3)
        [self drawRoapmap:@"C" askRoad:[NSString stringWithFormat:@"%i" ,myUserInfo.asknum]];
    if (myUserInfo.gameCode==6)
        [self drawRoapmap:@"D" askRoad:[NSString stringWithFormat:@"%i" ,myUserInfo.asknum]];
    if (myUserInfo.gameCode==7)
        [self drawRoapmap:@"E" askRoad:[NSString stringWithFormat:@"%i" ,myUserInfo.asknum]];
}
-(void) getUpdateRoadmap
{
    
    if (myUserInfo.gameCode ==1)
        [self getRoapmapData:@"A"];
    if (myUserInfo.gameCode==2)
        [self getRoapmapData:@"B"];
    if (myUserInfo.gameCode==3)
        [self getRoapmapData:@"C"];
    if (myUserInfo.gameCode==6)
        [self getRoapmapData:@"D"];
    if (myUserInfo.gameCode==7)
        [self getRoapmapData:@"E"];
}

-(void) setChip1:(NSString *)chip1 setchip2:(NSString *)chip2 setchip3:(NSString *)chip3 setchip4:(NSString *)chip4
{
    
    //chip1=@"10";
    UIImage *newImage;
  //  if (![chip1 isEqualToString: @"10"] )//10chip.png have some bug.
        newImage = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_%@.png", chip1]];
 //   else 
 //       newImage = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_100.png", chip1]];    
    [imgMoney1 setImage:newImage];
    [btnMoney1 setImage:newImage forState:UIControlStateNormal];
    myBetMoney.betmoney1=[chip1 doubleValue];
    
     UIImage *newImage1;
   // if (chip2!=@"10")//10chip.png have some bug.
        newImage1 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_%@.png", chip2]];
  //  else 
  //      newImage1 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_100.png", chip2]];    
    [imgMoney2 setImage:newImage1];
    [btnMoney2 setImage:newImage1 forState:UIControlStateNormal];
     myBetMoney.betmoney2=[chip2 doubleValue];
    
    UIImage *newImage2;
  //  if (![chip3 isEqualToString: @"10"])//10chip.png have some bug.
        newImage2 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_%@.png", chip3]];
  //  else 
   //     newImage2 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_100.png", chip3]];        
    [imgMoney3 setImage:newImage2];
    [btnMoney3 setImage:newImage2 forState:UIControlStateNormal];
     myBetMoney.betmoney3=[chip3 doubleValue];

    UIImage *newImage3;
   // if (chip4!=@"10")//10chip.png have some bug.
        newImage3 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_%@.png", chip4]];
  //  else 
  //      newImage3 = [UIImage imageNamed:  [NSString stringWithFormat: @"chip_100.png", chip4]];       
    [imgMoney4 setImage:newImage3];
    [btnMoney4 setImage:newImage3 forState:UIControlStateNormal];
     myBetMoney.betmoney4=[chip4 doubleValue];
   
}


- (void)transformUserinfo:(NSString *)name andatt:(NSString *)att
{      
    
        if ( [name isEqualToString:@"sid"])                //解析出問題
        {
            myUserInfo.sid =att;
            NSString* stringURL = [NSString stringWithFormat:@"https://bm.esb886.com/app/api/LiveDealerAPI.php?type=getBetRecord&sid=%@&GameType=3001&Rows=50&Page=1&Type=I&Gamekind=3&Second=open", att];
            recodeurl = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];            
            recodeDetailUrl = [NSString stringWithFormat:@"http://bm.esb886.com/app/api/LiveDealerAPI.php?type=getBetDetail&sid=%@", att];            
        }
    
         if ( [name isEqualToString:@"action"])
            myUserInfo.action =att;
        
        if ( [name isEqualToString:@"gameType"])
        {  
            myUserInfo.gameType =att;
        }
        if ( [name isEqualToString:@"userName"])
        {
            userNameLabel.text=att;
            myUserInfo.userName =att;
        }
        if ( [name isEqualToString:@"vip"])
            myUserInfo.vip =att;
        
        if ( [name isEqualToString:@"currency"])
        {   myUserInfo.currency =att;
            D4.text=[NSString stringWithFormat:@"币别：%@",att];
        }
    
        if ( [name isEqualToString:@"marquee"])
        {  // myUserInfo.currency =att;
            D10.text=[NSString stringWithFormat:@"%@",att];
            textviewDetail1.text=[NSString stringWithFormat:@"%@",att];

        }
    
        if([name isEqualToString:@"dealerName"])
        {
            myGameInfo.dealerName=att;
            D1.text=[NSString stringWithFormat:@"荷官：%@",att];
            dealerName.text=[NSString stringWithFormat:@"%@",att];
        }
        if ( [name isEqualToString:@"gameCode"])
            myUserInfo.gameCode =[att intValue];
        
   
        if ( [name isEqualToString:@"runEor"])
        {
           // if (att ==@"UNDER_MIN")
                [self messageReceived:@"UNDER_MIN" ];
        }
        if ( [name isEqualToString:@"hallID"])
            myUserInfo.hallID =att;
        
        if ( [name isEqualToString:@"userID"])
            myUserInfo.userID =att;
    
        if ( [name isEqualToString:@"payoff"])
        {
            myUserInfo.payoff = att ;
            if ([att doubleValue]!=0)
            {
                IVmessageBox.hidden=NO;
                LmessageLab.hidden=NO;
                NSString *tmpString;
                if([att doubleValue]>0)
                    tmpString=[NSString stringWithFormat: @"您赢了: %.2f",  [att doubleValue]];
                else if ([att doubleValue]<0)
                    tmpString=[NSString stringWithFormat: @"您输了: %.2f",  [att doubleValue]*-1 ];
               
              
                LmessageLab.text=tmpString;
            }
            else 
            {
                IVmessageBox.hidden=YES ;
                LmessageLab.hidden=YES;
            }
        }
        if ( [name isEqualToString:@"chipList"])
        {   
            NSArray *currentChips;
             currentChips=   [ att componentsSeparatedByString:@","];
          
            if ([currentChips count]>=4)
            {
            [
                self setChip1:[currentChips objectAtIndex:0]  setchip2:[currentChips objectAtIndex:1] setchip3:[currentChips objectAtIndex:2] setchip4:[currentChips objectAtIndex:3]];
            }
            else {
                [self showError:@"尊贵的客户，麻烦您重新设定筹码"];
            }
        }
        if ( [name isEqualToString:@"chipFilter"])
        { 
            att= [ att stringByAppendingString:@", nil"];
            myUserInfo.chipFilter =att;
            myMoneys=   [ att componentsSeparatedByString:@","];
            [self setChipNormal];
        }
    
        if ( [name isEqualToString:@"phone"])
            myUserInfo.phone =att;
        
        if ( [name isEqualToString:@"kick"])
        {
            if ([att isEqualToString:@"Y"] )
                myUserInfo.kick =YES;
            else                
               myUserInfo.kick =NO;
        }
        
        if ( [name isEqualToString:@"credit"])       
            myUserInfo.credit = [att doubleValue];
    
        if ( [name isEqualToString:@"max"])       
            myUserInfo.max = [att intValue];
        
        if ( [name isEqualToString:@"ou"])       
            myUserInfo.ou = [att intValue];
        
        if ( [name isEqualToString:@"pair"])       
            myUserInfo.par = [att intValue];
        
        if ( [name isEqualToString:@"tie"])       
            myUserInfo.tie = [att intValue];
        
        if ( [name isEqualToString:@"min"])       
            myUserInfo.min = [att intValue];        
        
        if ( [name isEqualToString:@"PayoffTotal"])       
            myUserInfo.payOfftal = att ; 
    
       
        
       
    
    
    if ( [name isEqualToString:@"roundNo"])       
    {  myGameInfo.roundNo = [NSString stringWithFormat: @"%@", att];
        [self gaemOver30:att];
        
    }
    
    if ( [name isEqualToString:@"roundSerial"])       
    {   
        myGameInfo.roundSerial = [NSString stringWithFormat: @"%@", att];
        NSString *tmpstr;
        if (myUserInfo.gameCode==1)
            tmpstr=@"A";
        if (myUserInfo.gameCode==2)
            tmpstr=@"B";
        if (myUserInfo.gameCode==3)
            tmpstr=@"C";
        if (myUserInfo.gameCode==6)
            tmpstr=@"D";
        if (myUserInfo.gameCode==7)
            tmpstr=@"E";
        
        
        if ( att.length>3)
        {
           
            betNavigationBarLabel.text=[NSString stringWithFormat: @"%@ %@", myGameInfo.roundNo, att];
            
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
              gameNameLabel.text =[NSString stringWithFormat: @"百家乐%@",tmpstr];
            else
              gameNameLabel.text =[NSString stringWithFormat: @"%@",tmpstr];
            
            if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                D3.text=[NSString stringWithFormat: @"局号：%@  %@", myGameInfo.roundNo, att];
            else
               D3.text=[NSString stringWithFormat: @"%@  %@", myGameInfo.roundNo, att];
            
         
           [self.view bringSubviewToFront: betView];
                    
            [self upBetAreaInfo ];
                  }
        creditLabel.text =[NSString stringWithFormat: @"%.2f", myUserInfo.credit];    
        lblCountDown.text=[NSString stringWithFormat: @"%i", myGameInfo.countDown];
        roundSerial=myGameInfo.roundSerial; 
    }
    if ( [name isEqualToString:@"credit"])       
        myUserInfo.credit = [[NSString stringWithFormat: @"%@",att] doubleValue] ;
    if ( [name isEqualToString:@"countDown"])       
        myGameInfo.countDown =[[NSString stringWithFormat: @"%@", att] intValue];
    if ( [name isEqualToString:@"poker"])       
        myGameInfo.poker =[NSString stringWithFormat: @"%@", att];
    if ( [name isEqualToString:@"result"])       
        myGameInfo.result =[NSString stringWithFormat: @"%@", att];

    if ( [name isEqualToString:@"status"])       
    { 
        NSString *temp ;
        temp =[NSString stringWithFormat: @"%@", att];
        if ( [temp isEqualToString:@"betting"])   
         myGameInfo.status = 1   ;
     
        else if ( [temp isEqualToString:@"dealing"])
            myGameInfo.status = 2   ;
        
        else if ( [temp isEqualToString:@"waiting"])
              myGameInfo.status = 3   ;
        [self updateData] ;
    }
    
    if ( [name isEqualToString:@"b1"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted11+=  [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted11+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted11+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted11+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted11+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b2"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted8+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted8+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted8+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted8+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted8+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b3"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted4+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted4+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted4+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted4+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted4+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b4"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted5+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted5+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted5+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted5+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted5+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b5"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted3+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted3+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted3+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted3+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted3+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b6"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted10+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted10+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted10+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted10+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted10+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b7"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted9+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted9+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted9+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted9+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted9+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b8"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted7+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted7+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted7+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted7+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted7+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b9"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted6+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted6+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted6+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted6+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted6+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b10"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted1+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted1+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted1+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted1+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted1+= [att doubleValue] ;
    }
    if ( [name isEqualToString:@"b11"])       
    { 
        if(myUserInfo.gameCode==1)
            bac1.moneyBetted2+= [att doubleValue] ;
        if(myUserInfo.gameCode==2)
            bac2.moneyBetted2+= [att doubleValue] ;
        if(myUserInfo.gameCode==3)
            bac3.moneyBetted2+= [att doubleValue] ;
        if(myUserInfo.gameCode==6)
            bac4.moneyBetted2+= [att doubleValue] ;
        if(myUserInfo.gameCode==7)
            bac5.moneyBetted2+= [att doubleValue] ;
    }

}

//依可用籌碼 提供至籌碼區。
-(void)setChipNormal
{    
    int i=0;   
    int availableChipCount=0;

    myUserInfo.invalueChips=0;
    scrChipTable.pagingEnabled=YES;
    scrChipTable.delegate=self;
    
    int chipsize=0;
    int chipareasize=0;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        chipsize=iPhoneChipSize;
        chipareasize=iPhoneChipArea;
    }
    else{
        chipsize=iPadChipSize;
        chipareasize=iPadChipArea;
    }
    
    for (i=0;i<[myMoneys count];i++)
    {
        if (myUserInfo.max >=  [[myMoneys objectAtIndex:i] intValue] && [[myMoneys objectAtIndex:i] intValue]>0)
        {   availableChipCount++;
            [[scrChipTable viewWithTag:[[myMoneys objectAtIndex:i] intValue]] removeFromSuperview];            
            UIButton *btnKategori=[UIButton buttonWithType:UIButtonTypeCustom];
            btnKategori.frame=CGRectMake(5+((chipsize+10)*i), 2, chipsize, chipsize);
            btnKategori.tag=[[myMoneys objectAtIndex:i] intValue];
            [btnKategori
             setImage: [UIImage imageNamed: [NSString stringWithFormat: @"chip_%@.png",[myMoneys objectAtIndex:i] ]]
             forState:(UIControlState)UIControlStateNormal];            
            [scrChipTable addSubview:btnKategori];            
            [btnKategori addTarget:self
                            action:@selector(aMethod:)
                  forControlEvents:UIControlEventTouchDown];
            
            myUserInfo.invalueChips++;
        }
    }
    [scrChipTable setContentSize:CGSizeMake(chipareasize* (((availableChipCount-1)/5)+1), scrChipTable.frame.size.height)];
    
}

-(void)aMethod:(id)sender
{
    
   for(UIButton *tb in  [scrChipTable subviews]) {
    
        if([tb isKindOfClass:[UIButton class]]) {
            [tb setImage: [UIImage imageNamed: [NSString stringWithFormat: @"chip_%d.png",tb.tag ]]
               forState:(UIControlState)UIControlStateNormal];
        }
   }

   
    
    UIButton *t = sender;
    [t setImage:[UIImage imageNamed:[NSString stringWithFormat:@"chip_%d_down.png",t.tag] ] forState:UIControlStateNormal];
    betMoney=t.tag;
    NSLog(@"James%d",t.tag);      
}

-(void) showPokers
{
    int player_num=0;
    int banker_num=0;
    if (myGameInfo.poker.length>3)
    {
        NSArray *myCards = [myGameInfo.poker componentsSeparatedByString:@","];
        //p1
        if ([ myCards objectAtIndex:0 ] !=@"" && [[ myCards objectAtIndex:0] length] >2  )     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:0 ]]];
            [showSpacePoker1 setImage:image  ];   
            if ([[[ myCards objectAtIndex:0 ] substringFromIndex:2] intValue]<=10)
            player_num= player_num +[[[ myCards objectAtIndex:0 ] substringFromIndex:2] intValue];
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker1 setImage:image  ];  
        }
        //p2
        if ([ myCards objectAtIndex:1 ] !=@""   && [[ myCards objectAtIndex:1] length] >2 )     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:1 ]]];
            [showSpacePoker2 setImage:image  ];    
            if ([[[ myCards objectAtIndex:1 ] substringFromIndex:2] intValue]<=10)
            banker_num= banker_num +[[[ myCards objectAtIndex:1 ] substringFromIndex:2] intValue];
            
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker2 setImage:image  ];  
        }
        //p3
        if ([ myCards objectAtIndex:2 ] !=@"" && [[ myCards objectAtIndex:2] length] >2)     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:2 ]]];
            [showSpacePoker3 setImage:image  ];    
            if ([[[ myCards objectAtIndex:2 ] substringFromIndex:2] intValue]<=10)
            player_num= player_num +[[[ myCards objectAtIndex:2 ] substringFromIndex:2] intValue];
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker3 setImage:image  ];  
        }
        //p4
        if ([ myCards objectAtIndex:3 ] !=@"" && [[ myCards objectAtIndex:3] length] >2)     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:3 ]]];
            [showSpacePoker4 setImage:image  ];   
            if ([[[ myCards objectAtIndex:3 ] substringFromIndex:2] intValue]<=10)
            banker_num= banker_num +[[[ myCards objectAtIndex:3 ] substringFromIndex:2] intValue];
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker4 setImage:image  ];  
        }
        //p5
        if ([ myCards objectAtIndex:4 ] !=@"" && [[ myCards objectAtIndex:4] length] >2)     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:4 ]]];
            [showSpacePoker5 setImage:image  ]; 
            if ([[[ myCards objectAtIndex:4 ] substringFromIndex:2] intValue]<=10)
            player_num= player_num +[[[ myCards objectAtIndex:4] substringFromIndex:2] intValue];
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker5 setImage:image  ];  
        }
        //p6
        if ([ myCards objectAtIndex:5 ] !=@"" && [[ myCards objectAtIndex:5] length] >2)     {
            UIImage *image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [ myCards objectAtIndex:5 ]]];
            [showSpacePoker6 setImage:image  ];    
            if ([[[ myCards objectAtIndex:5 ] substringFromIndex:2] intValue]<=10)
            banker_num= banker_num +[[[ myCards objectAtIndex:5 ] substringFromIndex:2] intValue];
        }else {
            UIImage *image=[UIImage imageNamed: @"colorless.png" ];
            [showSpacePoker6 setImage:image  ];  
            
        }
        banker_num=banker_num % 10;
        player_num=player_num % 10;
        
        labBankerNum.text= [NSString stringWithFormat:@"%i",banker_num]; 
        labPlayerNum.text= [NSString stringWithFormat:@"%i",player_num]; 
    }
}

-(void)showResult
{
    NSString *resultdata;
    resultdata = [self showResultArea];   
    
    if ([resultdata rangeOfString:@"PO"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_P02s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_P02@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
         [anims addObject:img2];
        else
         [anims addObject:img3];     
          
        baS_Bet1.hidden=NO;        
        baS_Bet1.animationImages = anims;        
        baS_Bet1.animationDuration=1.0f;
        baS_Bet1.animationRepeatCount=1;
        [baS_Bet1 startAnimating];
               
    }
    
    if ([resultdata rangeOfString:@"PE"].location !=NSNotFound)       
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_P03s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_P03@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
    
        baS_Bet2.hidden=NO;
        baS_Bet2.animationImages = anims;
        baS_Bet2.animationDuration=1.0f;
        baS_Bet2.animationRepeatCount=1;
        [baS_Bet2 startAnimating];
        
    }
    
    if ([resultdata rangeOfString:@"PP"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_P04s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_P04@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];        
     
        baS_Bet3.hidden=NO;
        baS_Bet3.animationImages = anims;
        baS_Bet3.animationDuration=1.0f;
        baS_Bet3.animationRepeatCount=1;
        [baS_Bet3 startAnimating];
    }
    
    if ([resultdata rangeOfString:@"Tie"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_T01s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_T01@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];        
        
        baS_Bet4.hidden=NO;
        baS_Bet4.animationImages = anims;
        baS_Bet4.animationDuration=1.0f;
        baS_Bet4.animationRepeatCount=1;
        [baS_Bet4 startAnimating];
    }
    
    if ([resultdata rangeOfString:@"BP"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_B02s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_B04@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        baS_Bet5.hidden=NO;
        baS_Bet5.animationImages = anims;
        baS_Bet5.animationDuration=1.0f;
        baS_Bet5.animationRepeatCount=1;
        [baS_Bet5 startAnimating]; 
    }
    if ([resultdata rangeOfString:@"BE"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_B03s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_B03@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
      
        baS_Bet6.hidden=NO;
        baS_Bet6.animationImages = anims;
        baS_Bet6.animationDuration=1.0f;
        baS_Bet6.animationRepeatCount=1;
        [baS_Bet6 startAnimating]; 
    }
        
    if ([resultdata rangeOfString:@"BO"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_B04s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_B02@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        baS_Bet7.hidden=NO;
        baS_Bet7.animationImages = anims;
        baS_Bet7.animationDuration=1.0f;
        baS_Bet7.animationRepeatCount=1;
        [baS_Bet7 startAnimating]; 
    }
    
    if ([resultdata rangeOfString:@"BPlayer"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_P01s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_P01@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        baS_Bet8.hidden=NO;
        baS_Bet8.animationImages = anims;
        baS_Bet8.animationDuration=1.0f;
        baS_Bet8.animationRepeatCount=1;
        [baS_Bet8 startAnimating]; 
    }
    
    if ([resultdata rangeOfString:@"Small"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_T02s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_T02@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
        baS_Bet9.hidden=NO;
        baS_Bet9.animationImages = anims;
        baS_Bet9.animationDuration=1.0f;
        baS_Bet9.animationRepeatCount=1;
        [baS_Bet9 startAnimating]; 
    }
    
    if ([resultdata rangeOfString:@"BIG"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_T03s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_T03@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];        
     
        baS_Bet10.hidden=NO;
        baS_Bet10.animationImages = anims;
        baS_Bet10.animationDuration=1.0f;
        baS_Bet10.animationRepeatCount=1;
        [baS_Bet10 startAnimating]; 
    }
    
    if ([resultdata rangeOfString:@"Banker"].location !=NSNotFound)
    {
        NSMutableArray *anims= [[NSMutableArray alloc]init];
        UIImage *img1= [UIImage imageNamed:@"colorless.png"];
        UIImage *img2= [UIImage imageNamed:@"area_B01s.png"];
        UIImage *img3= [UIImage imageNamed:@"area_B01@2x.png"];
        [anims addObject:img1];
        if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [anims addObject:img2];
        else
            [anims addObject:img3];
        
      
        baS_Bet11.hidden=NO;
        baS_Bet11.animationImages = anims;
        baS_Bet11.animationDuration=1.0f;
        baS_Bet11.animationRepeatCount=1;
        [baS_Bet11 startAnimating]; 
    }
    
    

}

-(void)allBtnCanBetenable:(bool) isenable
{
     
    if (myUserInfo.round<=30)  
    {
        btnBet1.enabled=isenable;
        btnBet2.enabled=isenable;
        btnBet3.enabled=isenable;
        btnBet4.enabled=isenable;
        btnBet5.enabled=isenable; 
        btnBet6.enabled=isenable;
        btnBet7.enabled=isenable;
        btnBet8.enabled=isenable; 
        btnBet9.enabled=isenable;
        btnBet10.enabled=isenable;   
        btnBet11.enabled=isenable;
    }else {
        btnBet1.enabled=NO;
        btnBet2.enabled=NO;
        btnBet3.enabled=isenable;
        btnBet4.enabled=isenable;
        btnBet5.enabled=isenable; 
        btnBet6.enabled=NO;
        btnBet7.enabled=NO;
        btnBet8.enabled=isenable; 
        btnBet9.enabled=NO;
        btnBet10.enabled=NO;   
        btnBet11.enabled=isenable;
    }
}


-(void)updateData
{

  
    
        
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:showSpacePoker6.bounds];
    animatedImageView.animationImages = [NSArray arrayWithObjects:    
                                         //[UIImage imageNamed:@"agcartoons5.gif"],
                                         // [UIImage imageNamed:@"C.12.png"],
                                         nil] ;
    animatedImageView.animationDuration = 0.5f;
    animatedImageView.animationRepeatCount = 2;
    [animatedImageView startAnimating];
    [ showSpacePoker6 addSubview:animatedImageView];
    
    baS_Bet1.hidden=YES;
    baS_Bet2.hidden=YES;
    baS_Bet3.hidden=YES;
    baS_Bet4.hidden=YES;
    baS_Bet5.hidden=YES;
    baS_Bet6.hidden=YES;
    baS_Bet7.hidden=YES;
    baS_Bet8.hidden=YES;
    baS_Bet9.hidden=YES;
    baS_Bet10.hidden=YES;
    baS_Bet11.hidden=YES;
    
    double tempi;
    struct betAreaInfo tempbac;
    if (myUserInfo.gameCode==1)
          tempbac =bac1;
    if (myUserInfo.gameCode==2)
        tempbac =bac2;
    if (myUserInfo.gameCode==3)
        tempbac =bac3;
    if (myUserInfo.gameCode==6)
        tempbac =bac4;
    if (myUserInfo.gameCode==7)
        tempbac =bac5;       
 
    tempi=tempbac.moneyBetted1+tempbac.moneyBetted2+tempbac.moneyBetted3+tempbac.moneyBetted4+tempbac.moneyBetted5+tempbac.moneyBetted6+tempbac.moneyBetted7+tempbac.moneyBetted8+tempbac.moneyBetted9+tempbac.moneyBetted10+tempbac.moneyBetted11;
        
    betTotalLabel.text=[NSString stringWithFormat:@"%.2f",tempi] ;
    
    if ( myGameInfo.status ==1)
    {
        
        for(UIButton *tb in  [scrChipTable subviews]) {
            if([tb isKindOfClass:[UIButton class]]) 
                tb.enabled=YES;
        }

        [self allBtnCanBetenable:YES];
        if (myGameInfo.oldStatus==3)      
        {
            bac1=bacinit;
            bac2=bacinit;
            bac3=bacinit;
            bac4=bacinit;
            bac5=bacinit;
            [self bgPlay:@"startbetting.WAV"];   
            myUserInfo.unbetround+=1;
            
        if (myUserInfo.kick==YES)
        { if(myUserInfo.unbetround==6)            
                [self showError:@"您已五局未下注将於十局返回登入画面"];
            
            if(myUserInfo.unbetround==11)            
                [self showError:@"您已十局未下注，即将回登入画面"];
            
            if(myUserInfo.unbetround==12)            
                [self relogin];
        }
            [self getUpdateRoadmap] ;
            [self updateRoadmap];
           

        }
        if (myGameInfo.countDown<2)
        {
            [self bgPlay:@"countdown2.WAV"];
        }
        
        imgCover.hidden=YES ;
        showPokerNote.hidden=YES;
        if (btnDetail.enabled&&btnRecord.enabled)
        { btnBet.enabled=YES;
        btnClear.enabled=YES;
        }
    }
    else if ( myGameInfo.status ==2)
    {
        for(UIButton *tb in  [scrChipTable subviews]) {
            if([tb isKindOfClass:[UIButton class]])
                tb.enabled=NO;
        }
        [self allBtnCanBetenable:NO];
        if (myGameInfo.oldStatus==1)
        {
            [self bgPlay:@"stopbetting.WAV"];
            [self clearBetAreaInfo];
            
        }
     
       [self showPokers];
        showPokerNote.hidden=NO;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [showPokerNote setFrame:CGRectMake(23, 242, 278, 100)];
        else 
            [showPokerNote setFrame:CGRectMake(680, 60, 325, 373)];

        imgCover.hidden=NO ;
        btnBet.enabled=NO;
        btnClear.enabled=NO;
        myGameInfo.waiting_delay=4;       
    }
    else if ( myGameInfo.status ==3 )
    {
        for(UIButton *tb in  [scrChipTable subviews]) {
            if([tb isKindOfClass:[UIButton class]])
                tb.enabled=NO;
        }
       [self allBtnCanBetenable:NO];
        if (myGameInfo.waiting_delay==3)
        {
          if ( [labBankerNum.text intValue] >  [labPlayerNum.text intValue])
               [self bgPlaynostop:@"bankerwin.WAV"];
          else if ([labBankerNum.text intValue] <  [labPlayerNum.text intValue]) 
              [self bgPlaynostop:@"playerwin.WAV"];
          else if ([labBankerNum.text intValue] ==  [labPlayerNum.text intValue]) 
                  [self bgPlaynostop:@"Tie.WAV.WAV"];          
        }
        
        if (myGameInfo.waiting_delay== 1)
        {           
               [self bgPlaynostop:[NSString stringWithFormat:  @"Bankerpoint%@.WAV",labBankerNum.text ]];            
        }  
        
        if (myGameInfo.waiting_delay==-1)
        {            
            [self bgPlaynostop:[NSString stringWithFormat:  @"Playerpoint%@.WAV",labPlayerNum.text ]];            
        } 
        
        if (myGameInfo.waiting_delay<-2)
        {
            [self showPokers];
            imgCover.hidden=NO ;
            btnBet.enabled=NO;
            btnClear.enabled=NO;
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            [showPokerNote setFrame:CGRectMake(23, 360, 278, 100)];
            
            [self showResult];
               
     
            if (myUserInfo.gameCode ==1)
            {   bac1.moneyBetted1=0;
                bac1.moneyBetting1=0;
                bac1.moneyCanbet1=bac1.moneyLimit1;
                bac1.moneyBetted2=0;
                bac1.moneyBetting2=0;
                bac1.moneyCanbet2=bac1.moneyLimit2;               
                
                bac1.moneyBetted3=0;
                bac1.moneyBetting3=0;
                bac1.moneyCanbet3=bac1.moneyLimit3;
                bac1.moneyBetted4=0;
                bac1.moneyBetting4=0;
                bac1.moneyCanbet4=bac1.moneyLimit4;
                bac1.moneyBetted5=0;
                bac1.moneyBetting5=0;
                bac1.moneyCanbet5=bac1.moneyLimit5;
                bac1.moneyBetted6=0;
                bac1.moneyBetting6=0;
                bac1.moneyCanbet6=bac1.moneyLimit6;
                bac1.moneyBetted7=0;
                bac1.moneyBetting7=0;
                bac1.moneyCanbet7=bac1.moneyLimit7;         
                bac1.moneyBetted8=0;
                bac1.moneyBetting8=0;
                bac1.moneyCanbet8=bac1.moneyLimit8;    
                bac1.moneyBetted9=0;
                bac1.moneyBetting9=0;
                bac1.moneyCanbet9=bac1.moneyLimit9;
                bac1.moneyBetted10=0;
                bac1.moneyBetting10=0;
                bac1.moneyCanbet10=bac1.moneyLimit10;    
                bac1.moneyBetted11=0;
                bac1.moneyBetting11=0;
                bac1.moneyCanbet11=bac1.moneyLimit11;    
            }           
                
        [self upBetAreaInfo];
        }
        else 
        {
            [self showPokers];
        }
        
         myGameInfo.waiting_delay=myGameInfo.waiting_delay-1;
    }
    myGameInfo.oldStatus =myGameInfo.status;
}

- (void)initData
{
    int scrChipTableWidth;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        scrChipTableWidth=iPhoneChipArea;
    }else
    {
         scrChipTableWidth=iPadChipArea;
    }
        
    
    int scrTablesize;
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    scrChipTable.pagingEnabled=YES;
    scrChipTable.delegate=self;
    [scrChipTable setContentSize:CGSizeMake(scrChipTableWidth, scrChipTable.frame.size.height)];
  //  [scrChipTable setContentSize:CGSizeMake(scrChipTable.frame.size.width*3, scrChipTable.frame.size.height)];

  //  btnKategori.frame=CGRectMake(5+100*i, 2, 90, 90);
    
    myUserInfo.changeindex=1;
    myGameInfo.gameCode=@"0";
    myGameInfo.countDown=0;
    myGameInfo.roundNo=@"0";
    myGameInfo.roundSerial=@"0";
    myGameInfo.status= 0 ;
    myGameInfo.poker=@"0";
    myGameInfo.result=@"0";
    
    myGameInfo.dealerName=@"0";
    myGameInfo.roadmap=@"0";
    myGameInfo.dealing_delay=0;
    myGameInfo.waiting_delay=0;
    //btnChangeTable.enabled=NO;
    myUserInfo.asknum=0;
    myUserInfo.gameCode=0;
    baS_Bet1.hidden=YES;
    baS_Bet2.hidden=YES;
    baS_Bet3.hidden=YES;
    baS_Bet4.hidden=YES;
    baS_Bet5.hidden=YES;
    baS_Bet6.hidden=YES;
    baS_Bet7.hidden=YES;
    baS_Bet8.hidden=YES;
    baS_Bet9.hidden=YES;
    baS_Bet10.hidden=YES;
    baS_Bet11.hidden=YES;
    
    btnchang6.hidden=YES;
    btnchang7.hidden=YES;
    btnchang8.hidden=YES;
    btnchang9.hidden=YES;
    btnchang10.hidden=YES;
    labchang6.hidden=YES;
    labchang7.hidden=YES;
    labchang8.hidden=YES;
    labchang9.hidden=YES;
    labchang10.hidden=YES;
    btnchang6.enabled=NO;
    btnchang7.enabled=NO;
    btnchang8.enabled=NO;
    btnchang9.enabled=NO;
    btnchang10.enabled=NO;
    bacinit.moneyBetted1=0; bacinit.moneyBetting1=0; bacinit.moneyCanbet1=myUserInfo.max; bacinit.moneyLimit1=myUserInfo.max;
    bacinit.moneyBetted2=0; bacinit.moneyBetting2=0; bacinit.moneyCanbet2=myUserInfo.max; bacinit.moneyLimit2=myUserInfo.max;
    bacinit.moneyBetted3=0; bacinit.moneyBetting3=0; bacinit.moneyCanbet3=myUserInfo.par; bacinit.moneyLimit3=myUserInfo.par;
    bacinit.moneyBetted4=0; bacinit.moneyBetting4=0; bacinit.moneyCanbet4=myUserInfo.tie; bacinit.moneyLimit4=myUserInfo.tie;
    bacinit.moneyBetted5=0; bacinit.moneyBetting5=0; bacinit.moneyCanbet5=myUserInfo.par; bacinit.moneyLimit5=myUserInfo.par;
    bacinit.moneyBetted6=0; bacinit.moneyBetting6=0; bacinit.moneyCanbet6=myUserInfo.max; bacinit.moneyLimit6=myUserInfo.max;
    bacinit.moneyBetted7=0; bacinit.moneyBetting7=0; bacinit.moneyCanbet7=myUserInfo.max; bacinit.moneyLimit7=myUserInfo.max;
    bacinit.moneyBetted8=0; bacinit.moneyBetting8=0; bacinit.moneyCanbet8=myUserInfo.max; bacinit.moneyLimit8=myUserInfo.max;
    bacinit.moneyBetted9=0; bacinit.moneyBetting9=0; bacinit.moneyCanbet9=myUserInfo.ou;bacinit.moneyLimit9=myUserInfo.ou;
    bacinit.moneyBetted10=0; bacinit.moneyBetting10=0; bacinit.moneyCanbet10=myUserInfo.ou;bacinit.moneyLimit10=myUserInfo.ou;
    bacinit.moneyBetted11=0;bacinit.moneyBetting11=0;bacinit.moneyCanbet11=myUserInfo.max; bacinit.moneyLimit11=myUserInfo.max;
    
    [myUIPageControl setNumberOfPages:6];
    [myUIPageControl setCurrentPage:0];
    
    //去除下注按鈕的初始的背景
    
    UIImage *someImage = [UIImage imageNamed:@"colorless.png"];
    [btnBet1 setImage:someImage forState:UIControlStateNormal];
    [btnBet2 setImage:someImage forState:UIControlStateNormal];
    [btnBet3 setImage:someImage forState:UIControlStateNormal];
    [btnBet4 setImage:someImage forState:UIControlStateNormal];
    [btnBet5 setImage:someImage forState:UIControlStateNormal];
    [btnBet6 setImage:someImage forState:UIControlStateNormal];
    [btnBet7 setImage:someImage forState:UIControlStateNormal];
    [btnBet8 setImage:someImage forState:UIControlStateNormal];
    [btnBet9 setImage:someImage forState:UIControlStateNormal];
    [btnBet10 setImage:someImage forState:UIControlStateNormal];
    [btnBet11 setImage:someImage forState:UIControlStateNormal];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        myGameInfo.roadmapWidth=260;
        myGameInfo.roadmapHight=127;
        [scrDetail setFrame:CGRectMake(0,26,322,394)];
           
    }else {
        myGameInfo.roadmapWidth=781;
        myGameInfo.roadmapHight=130;
        [btnBet1 setImage:[UIImage imageNamed:@"area_P02@2x.png"] forState:UIControlStateHighlighted];
        [btnBet2 setImage:[UIImage imageNamed:@"area_P03@2x.png"] forState:UIControlStateHighlighted];
        [btnBet3 setImage:[UIImage imageNamed:@"area_P04@2x.png"] forState:UIControlStateHighlighted];
        [btnBet4 setImage:[UIImage imageNamed:@"area_T01@2x.png"] forState:UIControlStateHighlighted];
        [btnBet5 setImage:[UIImage imageNamed:@"area_B04@2x.png"] forState:UIControlStateHighlighted];
        [btnBet6 setImage:[UIImage imageNamed:@"area_B03@2x.png"] forState:UIControlStateHighlighted];
        [btnBet7 setImage:[UIImage imageNamed:@"area_B02@2x.png"] forState:UIControlStateHighlighted];
        [btnBet8 setImage:[UIImage imageNamed:@"area_P01@2x.png"] forState:UIControlStateHighlighted];
        [btnBet9 setImage:[UIImage imageNamed:@"area_T02@2x.png"] forState:UIControlStateHighlighted];
        [btnBet10 setImage:[UIImage imageNamed:@"area_T03@2x.png"] forState:UIControlStateHighlighted];
        [btnBet11 setImage:[UIImage imageNamed:@"area_B01@2x.png"] forState:UIControlStateHighlighted];
        [scrDetail setFrame:CGRectMake(0,40,1024,648)];
         }
    
    bac1=bacinit;
    bac2=bacinit;
    bac3=bacinit;
    bac4=bacinit;
    bac5=bacinit;

    NSArray *array =[[NSArray alloc]initWithObjects:@"luck", @"leia",nil];
    self.pickerData =array;
    CGRect RC;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        RC=CGRectMake(0,42,320,380);
    else 
    {
        RC=CGRectMake(0,0,320,666);
    }
    
    [historyTable setFrame:RC];
    [Oscor1 setFrame:CGRectMake( 0 ,Oscor1.frame.origin.y, Oscor1.frame.size.width,Oscor1.frame.size.height)];
   
   scrviewRoadmap.hidden=YES;
    historyTable.hidden=YES;
    Oscor1.hidden=YES;
    [self setHistorytableItemClear];
    scrDetail.hidden=YES;
    pickSelectChips.hidden=YES;
   
    
    NSArray *mon1 = [[NSArray alloc] initWithObjects:@"1", @"5", @"10", @"50 ",@"500",@"1000", @"5000", @"10000", @"50000 ",@"100000",@"100000", nil];   
    
    NSArray *mon2 = [[NSArray alloc] initWithObjects:@"1", @"5", @"10", @"50 ",@"500",@"1000", @"5000", @"10000", @"50000 ",@"100000",@"100000",nil];
    
    NSArray *mon3 = [[NSArray alloc] initWithObjects:@"1", @"5", @"10", @"50 ",@"500",@"1000", @"5000", @"10000", @"50000 ",@"100000",@"100000", nil];    
    
    NSArray *mon4 = [[NSArray alloc] initWithObjects:@"1", @"5", @"10", @"50 ",@"500",@"1000", @"5000", @"10000", @"50000 ",@"100000",@"100000",nil];
    
  //  NSMutableArray *roadmapArray= [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4 ",@"5",@"6", @"7", @"8", @"9",@"10",@"11", @"12", @"13", @"14 ",@"15",@"16", @"17", @"18", @"19",@"20",@"21", @"22", @"23", @"24 ",@"25",@"26", @"27", @"28", @"29",@"30",nil];  
    UIPanGestureRecognizer *panRecognizer1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoney1:)];
    [panRecognizer1 setMinimumNumberOfTouches:1];
    [panRecognizer1 setMaximumNumberOfTouches:1];  
    [imgMoney1 addGestureRecognizer:panRecognizer1];   
    [imgMoney1 setUserInteractionEnabled:YES];
    [imgMoney1 addGestureRecognizer:panRecognizer1];
    
    UIPanGestureRecognizer *panRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoney2:)];
    [panRecognizer2 setMinimumNumberOfTouches:1];
    [panRecognizer2 setMaximumNumberOfTouches:1];  
    [imgMoney2 addGestureRecognizer:panRecognizer2];   
    [imgMoney2 setUserInteractionEnabled:YES];
    [imgMoney2 addGestureRecognizer:panRecognizer2];
    
    UIPanGestureRecognizer *panRecognizer3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoney3:)];
    [panRecognizer3 setMinimumNumberOfTouches:1];
    [panRecognizer3 setMaximumNumberOfTouches:1];  
    [imgMoney3 addGestureRecognizer:panRecognizer3];   
    [imgMoney3 setUserInteractionEnabled:YES];
    [imgMoney3 addGestureRecognizer:panRecognizer3];
    
    UIPanGestureRecognizer *panRecognizer4 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMoney4:)];
    [panRecognizer4 setMinimumNumberOfTouches:1];
    [panRecognizer4 setMaximumNumberOfTouches:1];  
    [imgMoney4 addGestureRecognizer:panRecognizer4];   
    [imgMoney4 setUserInteractionEnabled:YES];
    [imgMoney4 addGestureRecognizer:panRecognizer4];
    
   // UISwipeGestureRecognizer *recognizer;
    
    //scrollView1.scrollEnabled=NO; 
    //recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    //[recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    //recognizer.delaysTouchesBegan =TRUE;
   // [scrollView1 addGestureRecognizer:recognizer];
   
    
   // recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
   // [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
   // [scrollView1 addGestureRecognizer:recognizer];
  
   
    
   

    self.arrPick1 = mon1;
    self.arrPick2 = mon2;
    self.arrPick3 = mon3;
    self.arrPick4 = mon4;
    
    baI_Bet1.hidden =YES;
    baL_Bet1.hidden =YES;
    baE_Bet1.hidden =YES;
    baB_Bet1.hidden =YES;
    
    baI_Bet2.hidden =YES;
    baL_Bet2.hidden =YES;
    baE_Bet2.hidden =YES;
    baB_Bet2.hidden =YES;
    
    baI_Bet3.hidden =YES;
    baL_Bet3.hidden =YES;
    baE_Bet3.hidden =YES;
    baB_Bet3.hidden =YES;
    
    baI_Bet4.hidden =YES;
    baL_Bet4.hidden =YES;
    baE_Bet4.hidden =YES;
    baB_Bet4.hidden =YES;
    
    baI_Bet5.hidden =YES;
    baL_Bet5.hidden =YES;
    baE_Bet5.hidden =YES;
    baB_Bet5.hidden =YES;
    
    baI_Bet6.hidden =YES;
    baL_Bet6.hidden =YES;
    baE_Bet6.hidden =YES;
    baB_Bet6.hidden =YES;
    
    baI_Bet7.hidden =YES;
    baL_Bet7.hidden =YES;
    baE_Bet7.hidden =YES;
    baB_Bet7.hidden =YES;
    
    baI_Bet8.hidden =YES;
    baL_Bet8.hidden =YES;
    baE_Bet8.hidden =YES;
    baB_Bet8.hidden =YES;
    
    baI_Bet9.hidden =YES;
    baL_Bet9.hidden =YES;
    baE_Bet9.hidden =YES;
    baB_Bet9.hidden =YES;
    
    baI_Bet10.hidden =YES;
    baL_Bet10.hidden =YES;
    baE_Bet10.hidden =YES;
    baB_Bet10.hidden =YES;
    
    baI_Bet11.hidden =YES;
    baL_Bet11.hidden =YES;
    baE_Bet11.hidden =YES;
    baB_Bet11.hidden =YES;
    
    betMoney=0.0;
    [scrhistoryTable setFrame:CGRectMake(-320, 40, scrhistoryTable.frame.size.width, 403)];
   // historyTable.hidden=NO;

}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  
           
    if (component == pick1)    
        return (myUserInfo.invalueChips-1);
    
    if (component == pick2)
             return  (myUserInfo.invalueChips-1);
    
    if (component == pick3)
               return  (myUserInfo.invalueChips-1);
    
    if (component == pick4)    
        return  (myUserInfo.invalueChips-1);
  
    
    return  (myUserInfo.invalueChips);

}



#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component == pick1)
    {           
        myBetMoney.betindex1=row;         
        return [self.arrPick1 objectAtIndex:row];           
    }
    if (component == pick2)
    {    myBetMoney.betindex2=row;      
        return [self.arrPick2 objectAtIndex:row];
    }
    if (component == pick3)
    {    myBetMoney.betindex3=row;       
        return [self.arrPick3 objectAtIndex:row];
    }
    if (component == pick4)
    {    myBetMoney.betindex4=row;        
        return [self.arrPick4 objectAtIndex:row];
    }
    
    
}




-(NSString *) showResultArea
{
    int indexResult  ;
    NSString *returnStr ;
    
    indexResult = [myGameInfo.result intValue];
    if (indexResult>0)
    {
        bool BPlayer=NO ;//0
        bool PO=NO;//1
        bool PE=NO;//2
        bool PP=NO;//3
        bool BP=NO;//4
        bool BE=NO;//5
        bool BO=NO;//6
        bool Banker=NO;//7
        bool BIG=NO;//8
        bool Tie=NO;//9
        bool Small=NO;//10
        
        if (indexResult<97)
        {
            switch(indexResult)
            {
                case(1):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單	
                    break;
                case(2):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    
                    break;
                case(3):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    
                    break;
                case(4):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    
                    break;
                case(5):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BPlayer = YES;//閒
                    
                    break;
                case(6):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    BPlayer = YES;//閒
                    
                    break;
                case(7):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    
                    break;
                case(8):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    
                    break;
                case(9):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    break;
                case(10):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(11):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    
                    break;
                case(12):
                    BIG=YES;//大
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(13):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Small= YES;//小
                    
                    break;
                case(14):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(15):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Small= YES;//小
                    
                    break;
                case(16):
                    Banker=YES;//莊
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    
                    break;
                case(17):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(18):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(19):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(20):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    
                    break;
                case(21):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(22):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(23):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(24):
                    PO = YES;//閒單
                    BO=YES;//莊單
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    
                    break;
                case(25):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(26):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    break;
                case(27):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(28):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(29):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(30):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(31):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(32):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(33):
                    BIG=YES;//大
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(34):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(35):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(36):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(37):
                    Banker=YES;//莊
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(38):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(39):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    Small= YES;//小
                    
                    break;
                case(40):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(41):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(42):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(43):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(44):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(45):
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(46):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(47):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(48):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BO=YES;//莊單
                    PE = YES;//閒雙
                    
                    break;
                case(49):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(50):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(51):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(52):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(53):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(54):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(55):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(56):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(57):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(58):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(59):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    
                    break;
                case(60):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    
                    break;
                case(61):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(62):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(63):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(64):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(65):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(66):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(67):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(68):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(69):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(70):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(71):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(72):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PO = YES;//閒單
                    
                    break;
                case(73):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BE=YES;
                    PE = YES;//閒雙
                    
                    
                    break;
                case(74):
                    Banker=YES;//莊
                    BIG=YES;//大
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(75):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(76):
                    Banker=YES;//莊
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(77):
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(78):
                    BIG=YES;//大
                    BP=YES;
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(79):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                    
                case(80):
                    PP = YES;//閒對
                    BP=YES;
                    BIG=YES;//大
                    BPlayer = YES;//閒
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(81):
                    BIG=YES;//大
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(82):
                    BIG=YES;//大
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(83):
                    BIG=YES;//大
                    PP = YES;//閒對
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(84):
                    BIG=YES;//大
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(85):
                    Banker=YES;//莊
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(86):
                    Banker=YES;//莊
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(87):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(88):
                    Banker=YES;//莊
                    PP = YES;//閒對
                    BP=YES;
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(89):
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(90):
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(91):
                    PP = YES;//閒對
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(92):
                    PP = YES;//閒對
                    BP=YES;
                    BPlayer = YES;//閒
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(93):
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(94):
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(95):
                    PP = YES;//閒對
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙
                    
                    break;
                case(96):
                    PP = YES;//閒對
                    BP=YES;
                    Tie = YES;//平
                    Small= YES;//小
                    BE=YES;
                    PE = YES;//閒雙	
                    break;
            }
            
            
        }else
        {
            if ((indexResult & 7) ==1)
                Banker=YES; 
            
            if ((indexResult & 7) ==2)		
                BPlayer=YES; 
            
            if ((indexResult & 7) ==4)
                Tie=YES; 
            
            if ((indexResult & 24) ==8)
                BE=YES; 
            
            if ((indexResult & 24) ==16)
                BP=YES; 
            
            if ((indexResult & 96) ==32)
                PE=YES; 
            
            if ((indexResult & 96) ==64)
                PP=YES; 
            
            if ((indexResult & 384) ==128)
                BO=YES; 
            
            if ((indexResult & 384) ==256)
                BIG=YES; 
            
            if ((indexResult & 1536) ==512)
                PO=YES; 
            
            if ((indexResult & 1536) ==1024)
                Small=YES; 
        }
        
        returnStr=@"";
        if ( BPlayer==YES )//0
            returnStr = [returnStr stringByAppendingString:@"BPlayer,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
                         
        if ( PO==YES )//1
            returnStr = [returnStr stringByAppendingString:@"PO,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];

        if ( PE==YES )//2
            returnStr = [returnStr stringByAppendingString:@"PE,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];

        if ( PP==YES )//3
            returnStr = [returnStr stringByAppendingString:@"PP,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];

        if ( BP==YES )//4
            returnStr = [returnStr stringByAppendingString:@"BP,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];

        if ( BE==YES )//5
            returnStr = [returnStr stringByAppendingString:@"BE,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BO==YES )//6
            returnStr = [returnStr stringByAppendingString:@"BO,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( Banker==YES )//7
            returnStr = [returnStr stringByAppendingString:@"Banker,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        if ( BIG==YES )//8
            returnStr = [returnStr stringByAppendingString:@"BIG,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        
        if ( Tie==YES )//9
            returnStr = [returnStr stringByAppendingString:@"Tie,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];
        
        
        if ( Small==YES )//10
            returnStr = [returnStr stringByAppendingString:@"Small,"];
        else
            returnStr = [returnStr stringByAppendingString:@"0,"];

        //NSLog(@"123abc",returnStr);
       
    }
  
    
    return returnStr;
    
}

- (void) bgPlay:(NSString*)soundName{
    
    [bgAvPlayer stop];
    
    NSURL *murl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundName]];
                  bgAvPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:murl error:nil];
                  bgAvPlayer.numberOfLoops = 0;
                  [bgAvPlayer prepareToPlay];
                  [bgAvPlayer play];
                 // [url release];
}


- (void) bgPlaynostop:(NSString*)soundName{
    
    
    NSURL *murl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundName]];
    bgAvPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:murl error:nil];
    bgAvPlayer.numberOfLoops = 0;
    [bgAvPlayer prepareToPlay];
    [bgAvPlayer play];
    // [url release];
}
#pragma mark -
#pragma mark UIScrollViewDelegate stuff
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    
    if (_scrollView==scrviewRoadmap)
    {
        NSLog(@"scrollViewDidScroll");
        if (pageControlIsChangingPage) {
            return;
        }
       
        int page = floor((_scrollView.contentOffset.x - myGameInfo.roadmapWidth / 2) / myGameInfo.roadmapWidth) + 1;
        myUIPageControl.currentPage = page;
    }
    else if (_scrollView==scrChipTable)
    {
        NSLog(@"11111111111111111");
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    pageControlIsChangingPage = NO;
}

#pragma mark -
#pragma mark PageControl stuff
- (IBAction)changePage:(id)sender 
{
	/*
	 *	Change the scroll view
	 */
    CGRect frame = scrviewRoadmap.frame;
    frame.origin.x = frame.size.width * myUIPageControl.currentPage;
    frame.origin.y = 0;
	
    [scrviewRoadmap scrollRectToVisible:frame animated:YES];
    
	/*
	 *	When the animated scrolling finishings, scrollViewDidEndDecelerating will turn this off
	 */
    pageControlIsChangingPage = YES;
}

- (NSInteger) numberOfSectionsInTableView : (UITableView*)tableView {
    return [heroicaArray count];
}
- (NSInteger) tableView: (UITableView*)tableView numberOfRowsInSection: (NSInteger)section {
     return [[heroicaArray objectAtIndex:section] count];
}
- (NSString*) tableView: (UITableView*)tableView titleForHeaderInSection: (NSInteger)section {

    return [dateList objectAtIndex:section]; 
}
- (UITableViewCell*) tableView: (UITableView*)tableView cellForRowAtIndexPath: (NSIndexPath*)indexPath {
    
    //製作可重復利用的表格欄位Cell
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    //設定欄位的內容與類型
   
    cell.textLabel.lineBreakMode=UILineBreakModeClip;
    
    
    
    cell.textLabel.text = [[heroicaArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=[[heroicaArrayDetail objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    //cell.tag=[[[heroicaArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] intValue] +1;


   /* if ([cell.detailTextLabel.text rangeOfString:@"-"].location == NSNotFound)
    {    cell.detailTextLabel.textColor =[UI;
}
    else
    {      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//UITableViewCellAccessoryDetailDisclosureButton;
}*/
    
   // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate stuff

-(void)setHistorytableItemClear
{
    UIImage *image=[UIImage imageNamed: @"colorless.png" ];
    
    [Op1 setImage:image  ];
    [Op2 setImage:image  ];
    [Op3 setImage:image  ];
    [Op4 setImage:image  ];
    [Op5 setImage:image  ];
    [Op6 setImage:image  ];
    
    labRoundID.text=@"";labTableID.text=@"";labOrderTime.text=@"";labOther.text=@"";labBanker.text=@"";labPlayer.text=@"";labTotal.text=@"";labTotalPay.text=@"";
    Oa1.text=@"";Oa2.text=@"";Oa3.text=@"";Oa4.text=@"";Oa5.text=@"";Oa6.text=@"";Oa7.text=@"";Oa8.text=@"";Oa9.text=@"";Oa10.text=@"";Oa11.text=@"";Oa12.text=@"";Oa13.text=@"";
    Ob1.text=@"";Ob2.text=@"";Ob3.text=@"";Ob4.text=@"";Ob5.text=@"";Ob6.text=@"";Ob7.text=@"";Ob8.text=@"";Ob9.text=@"";Ob10.text=@"";Ob11.text=@"";Ob12.text=@"";Ob13.text=@"";
    Oc1.text=@"";Oc2.text=@"";Oc3.text=@"";Oc4.text=@"";Oc5.text=@"";Oc6.text=@"";Oc7.text=@"";Oc8.text=@"";Oc9.text=@"";Oc10.text=@"";Oc11.text=@"";Oc12.text=@"";Oc13.text=@"";
    Od1.text=@"";Od2.text=@"";Od3.text=@"";Od4.text=@"";Od5.text=@"";Od6.text=@"";Od7.text=@"";Od8.text=@"";Od9.text=@"";Od10.text=@"";Od11.text=@"";Od12.text=@"";Od13.text=@"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self setHistorytableItemClear];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {    
        scrhistoryTable.hidden=NO;
        [btnRelogin setImage:[UIImage imageNamed:@"back_btn_up.png"] forState:UIControlStateNormal];
        btnRelogin.enabled=YES;
        [scrhistoryTable setFrame:CGRectMake(0, 40, scrhistoryTable.frame.size.width, 403)];
        btnRecord.enabled=NO;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //cell.textLabel;
    NSRange isexist;//cell.detailTextLabel;
    isexist=[cell.detailTextLabel.text rangeOfString:@"N"];
    if (isexist.length==0 )
    {
    
    NSArray *temp1=  [ cell.textLabel.text  componentsSeparatedByString:@"                                        "];
    NSString *nowDate2=[temp1 objectAtIndex:1];
 //   NSLog([NSString stringWithFormat:@"jamesss%i,%@,%@,%@,",indexPath,cell.textLabel.text,cell.detailTextLabel.text,nowDate2] );
    
   // NSURL *url = [NSURL URLWithString: @"http://ipl-dm.vir888.com/app/api/LiveDealerAPI.php?type=getBetDetail&sid=iecbc876z6bij005z9acqp4z3nnfgz2141&WagersID=4113&GameType=3001];    
                  
        recodeDetailUrl = [NSString stringWithFormat:@"%@&WagersID=%@&GameType=3001", recodeDetailUrl,nowDate2];
     recodeDetailUrl = [recodeDetailUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *tempAnalyze;
    NSURL *url = [NSURL URLWithString:recodeDetailUrl];
    tempAnalyze = [NSString stringWithContentsOfURL:url];

    SBJsonParser * parser = [[SBJsonParser alloc] init];  
    NSError * error = nil;  
    NSMutableDictionary * jsonDic = [parser objectWithString:tempAnalyze error:&error];  
    int i=0;
    NSArray *records,*records1;
    UIImage *image;
     NSLog(@"------------------------------");  
    for(i=0;i<jsonDic.count-7;i++)
   {
    NSMutableDictionary * dicUserInfo = [jsonDic objectForKey:[NSString stringWithFormat:@"%d",i]];
       switch (i) {
           case 0:
            //   Oa1.text=[self showOrderType @"3001",[[dicUserInfo objectForKey:@"SerialType"] ;
               Oa1.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob1.text=[dicUserInfo objectForKey:@"Odds"];
               Oc1.text=[dicUserInfo objectForKey:@"Bet"];
               Od1.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od1.text floatValue]<0)
                   Od1.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od1.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
           case 1:
               Oa2.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob2.text=[dicUserInfo objectForKey:@"Odds"];
               Oc2.text=[dicUserInfo objectForKey:@"Bet"];
               Od2.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od2.text floatValue]<0)
                   Od2.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od2.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
           case 2:
               Oa3.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob3.text=[dicUserInfo objectForKey:@"Odds"];
               Oc3.text=[dicUserInfo objectForKey:@"Bet"];
               Od3.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od3.text floatValue]<0)
                   Od3.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od3.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;

           case 3:
               Oa4.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob4.text=[dicUserInfo objectForKey:@"Odds"];
               Oc4.text=[dicUserInfo objectForKey:@"Bet"];
               Od4.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od4.text floatValue]<0)
                   Od4.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od4.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
           case 4:
               Oa5.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob5.text=[dicUserInfo objectForKey:@"Odds"];
               Oc5.text=[dicUserInfo objectForKey:@"Bet"];
               Od5.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od5.text floatValue]<0)
                   Od5.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od5.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;

           case 5:
               Oa6.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob6.text=[dicUserInfo objectForKey:@"Odds"];
               Oc6.text=[dicUserInfo objectForKey:@"Bet"];
               Od6.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od6.text floatValue]<0)
                   Od6.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od6.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;

           case 6:
               Oa7.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob7.text=[dicUserInfo objectForKey:@"Odds"];
               Oc7.text=[dicUserInfo objectForKey:@"Bet"];
               Od7.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od7.text floatValue]<0)
                   Od7.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od7.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
               
           case 7:
               Oa8.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob8.text=[dicUserInfo objectForKey:@"Odds"];
               Oc8.text=[dicUserInfo objectForKey:@"Bet"];
               Od8.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od8.text floatValue]<0)
                   Od8.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od8.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];            
               break;

           case 8:
               Oa9.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob9.text=[dicUserInfo objectForKey:@"Odds"];
               Oc9.text=[dicUserInfo objectForKey:@"Bet"];
               Od9.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od9.text floatValue]<0)
                   Od9.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od9.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;

           case 9:
               Oa10.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob10.text=[dicUserInfo objectForKey:@"Odds"];
               Oc10.text=[dicUserInfo objectForKey:@"Bet"];
               Od10.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od10.text floatValue]<0)
                   Od10.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od10.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;

           case 10:
               Oa11.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob11.text=[dicUserInfo objectForKey:@"Odds"];
               Oc11.text=[dicUserInfo objectForKey:@"Bet"];
               Od11.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od11.text floatValue]<0)
                   Od11.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od11.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
               
           case 11:
               Oa12.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob12.text=[dicUserInfo objectForKey:@"Odds"];
               Oc12.text=[dicUserInfo objectForKey:@"Bet"];
               Od12.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od12.text floatValue]<0)
                   Od12.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od12.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
               
           case 12:
               Oa13.text=[self showOrderType:@"3001" code:[[dicUserInfo objectForKey:@"SerialType"] intValue]];
               Ob13.text=[dicUserInfo objectForKey:@"Odds"];
               Oc13.text=[dicUserInfo objectForKey:@"Bet"];
               Od13.text=[dicUserInfo objectForKey:@"Payoff"];
               if ([Od13.text floatValue]<0)
                   Od13.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
               else 
                   Od13.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];               
               break;
               
           default:
               break;
       }
       
       
        NSLog(@"%@",[dicUserInfo objectForKey:@"SerialType"]);  
        NSLog(@"%@",[dicUserInfo objectForKey:@"Bet"]);  
        NSLog(@"%@",[dicUserInfo objectForKey:@"Payoff"]);  
        NSLog(@"%@",[dicUserInfo objectForKey:@"Odds"]);  
         NSLog(@"@@@@@@@@@@@@@@@@@@@@@@@@@");
  }
    
  
    NSLog(@"%i",jsonDic.count);  
 
    labRoundID.text=[jsonDic objectForKey:@"RoundSerial" ] ;
    labTotal.text=[jsonDic objectForKey:@"WagersDate" ];
    labTotalPay.text =[jsonDic objectForKey:@"TotalPayoff" ];
    if ([labTotalPay.text floatValue]<0)
        labTotalPay.textColor = [UIColor colorWithRed:1 green:0 blue:0 alpha: 1];
    else 
        labTotalPay.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha: 1];   
    
    labTotal.text =[jsonDic objectForKey:@"TotalBet" ];
    records=  [ [jsonDic objectForKey:@"Point" ] componentsSeparatedByString:@",CID,"]; 
    labBanker.text=[records objectAtIndex:0] ;
    labPlayer.text=[records objectAtIndex:1] ;
    labOrderTime.text=[jsonDic objectForKey:@"WagersDate" ] ;
    
    if ([[jsonDic objectForKey:@"GameCode" ] intValue] ==1)
        labTableID.text=@"A";
    if ([[jsonDic objectForKey:@"GameCode" ] intValue] ==2)
        labTableID.text=@"B";
    if ([[jsonDic objectForKey:@"GameCode" ] intValue] ==3)
        labTableID.text=@"C";
    if ([[jsonDic objectForKey:@"GameCode" ] intValue] ==6)
        labTableID.text=@"D";
    if ([[jsonDic objectForKey:@"GameCode" ] intValue] ==7)
        labTableID.text=@"E";
    
   

   
    records=  [[jsonDic objectForKey:@"Cards" ] componentsSeparatedByString:@",CID,"]; 
    records1= [ [records objectAtIndex:0] componentsSeparatedByString:@","];     
    image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:0]]];
    [Op1 setImage:image  ];   
    image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:1]]];
    [Op2 setImage:image  ]; 
    if (records1.count==3)
    {
        image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:2]]];
        [Op3 setImage:image  ]; 
        Op3.hidden=NO;
    }else 
        Op3.hidden=YES;
    
    records1= [ [records objectAtIndex:1] componentsSeparatedByString:@","];  
    image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:0]]];
    [Op4 setImage:image  ];   
    image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:1]]];
    [Op5 setImage:image  ]; 
    if (records1.count==3)
    {
        image=[UIImage imageNamed:[NSString stringWithFormat: @"%@.png", [records1 objectAtIndex:2]]];
        [Op6 setImage:image  ]; 
        Op6.hidden=NO;
    }else 
        Op6.hidden=YES;
  
    //  [records objectAtIndex:0] ;
  //  [records objectAtIndex:1] ;
    
  //NSLog(@"%@",[dicUserInfo objectForKey:@"SerialType"]);  
  //c  NSLog(@"%@",[dicUserInfo objectForKey:@"Odds"]); 
     NSLog(@"------------------------------");
    }
  //  NSLog(@"%@",[dicUserInfo objectForKey:@"sex"]);
}

@end
