//
//  ViewController.h
//  casino2
//
//  Created by mobile on 12/7/9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataStruct.h"
#import <AVFoundation/AVFoundation.h> 
#import <UIKit/UIGestureRecognizerSubclass.h>

#define pick1 0
#define pick2 1
#define pick3 2
#define pick4 3
#define iPhoneChipArea 310
#define iPadChipArea 500
#define iPhoneChipSize 52
#define iPadChipSize 90

@interface ViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource,UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource>
{
    AVAudioPlayer *_backgroundMusicPlayer;
	BOOL _backgroundMusicPlaying;
	BOOL _backgroundMusicInterrupted;
    NSInputStream	*inputStream;
	NSOutputStream	*outputStream;
    NSXMLParser *parser;
    NSString *parserCurrent;
    double betMoney;
    
    UIView *loginView;
    UIButton *loginBut;
    UITextField *userName ,*passWord;    
    UIView *loadingView;
    UIImageView *loginImg;
    
    
    
    UIView *betView;
    UIImageView *betViewBG;
    UILabel *betNavigationBarLabel,*gameNameLabel,*userNameLabel,*dealerName;
    UILabel *creditLabel,*lblCountDown, *betTotalLabel;
    UILabel *labPlayerNum,*labBankerNum;
    UIScrollView *scrollView1;
    UIImageView *videoImage;
    
    //UIWebView *webviewDetail; 
    UITableView *historyTable;
    UIScrollView *scrhistoryTable,*scrChipTable;
    UIButton *btnChangeTable, *btnDetail, *btnRecord, *btnClear, *btnBet;
    UIImageView *imgMoney1, *imgMoney2,*imgMoney3,*imgMoney4,*imgCover;   
    UIButton *btnMoney1, *btnMoney2,*btnMoney3,*btnMoney4;
    UIPickerView *F;
    NSArray *pickerData;
    UIButton *btnChangeMoney;
    UIButton *btnBet1,*btnBet2,*btnBet3,*btnBet4,*btnBet5,*btnBet6,*btnBet7,*btnBet8,*btnBet9,*btnBet10,*btnBet11;
  
    UIImageView *baB_Bet1,*baB_Bet2,*baB_Bet3,*baB_Bet4,*baB_Bet5,*baB_Bet6,*baB_Bet7,*baB_Bet8,*baB_Bet9,*baB_Bet10,*baB_Bet11;//下注區背景;
    UIImageView *baS_Bet1,*baS_Bet2,*baS_Bet3,*baS_Bet4,*baS_Bet5,*baS_Bet6,*baS_Bet7,*baS_Bet8,*baS_Bet9,*baS_Bet10,*baS_Bet11;//下注區背景;
    UILabel *baI_Bet1,*baI_Bet2,*baI_Bet3,*baI_Bet4,*baI_Bet5,*baI_Bet6,*baI_Bet7,*baI_Bet8,*baI_Bet9,*baI_Bet10,*baI_Bet11;//下注區下注中;    
    UILabel *baL_Bet1,*baL_Bet2,*baL_Bet3,*baL_Bet4,*baL_Bet5,*baL_Bet6,*baL_Bet7,*baL_Bet8,*baL_Bet9,*baL_Bet10,*baL_Bet11;//下注區限額;    
    UILabel *baE_Bet1,*baE_Bet2,*baE_Bet3,*baE_Bet4,*baE_Bet5,*baE_Bet6,*baE_Bet7,*baE_Bet8,*baE_Bet9,*baE_Bet10,*baE_Bet11;//下注區已下注;
    UIScrollView *showPokerNote;
    UILabel *D1,*D2,*D3,*D4,*D5,*D6,*D7,*D8,*D9,*D10,*D11;//下注區已下注;
    UIButton *btnDetail1,*btnDetail2,*btnDetail3,*btnDetail4;
    UITextView *textviewDetail1;
    UIScrollView *scrDetal1, *scrDetal2, *scrDetal3;
    UIWebView *webViewDetail1;
    UIImageView *showSpacePoker1, *showSpacePoker2,*showSpacePoker3,*showSpacePoker4,*showSpacePoker5,*showSpacePoker6;
    UIButton *btnRelogin,*btnRoadMap;
    UIButton *btnchang1,*btnchang2,*btnchang3,*btnchang4,*btnchang5,*btnchang6,*btnchang7,*btnchang8,*btnchang9,*btnchang10;
    UILabel *labchang1,*labchang2,*labchang3,*labchang4,*labchang5,*labchang6,*labchang7,*labchang8,*labchang9,*labchang10;
    UIImageView *IVmessageBox;
    UILabel *LmessageLab;
    UIImageView *imgRoadMapBG,*imgAllRoadMapBG;
    UIScrollView *scrviewRoadmap,*scrDetail;
    UILabel *countBanker,*countPlayer,*countTie;
    UIButton *btnBankAsk,*btnPlayAsk;
    UIPageControl *myUIPageControl;
    UIScrollView  *scrchangeTable;
    UIImageView *changeBG,*changeFront,*changeTop,*changeUnder;
    UIImageView *imgChangeFront1,*imgChangeFront2,*imgChangeFront3,*imgChangeFront4,*imgChangeFront5,*imgChangeFront6,*imgChangeFront7,*imgChangeFront8,*imgChangeFront9,*imgChangeFront10;
    UILabel *changeTitle;
    IBOutlet UITableView * table; 
    NSMutableArray *list,*dateList, *heroicaArray,*heroicaArrayDetal; 
    UISegmentedControl *seedSegmented;
    UISwitch  *videoSwitch;
    
    //下注细单
    UIScrollView *Oscor1;
    UILabel *labRoundID,*labTableID,*labOrderTime,*labOther,*labBanker,*labPlayer,*labTotal,*labTotalPay;
    UIImageView *Op1,*Op2,*Op3,*Op4,*Op5,*Op6;
    UILabel *Oa1,*Oa2,*Oa3,*Oa4,*Oa5,*Oa6,*Oa7,*Oa8,*Oa9,*Oa10,*Oa11,*Oa12,*Oa13;
    UILabel *Ob1,*Ob2,*Ob3,*Ob4,*Ob5,*Ob6,*Ob7,*Ob8,*Ob9,*Ob10,*Ob11,*Ob12,*Ob13;
    UILabel *Oc1,*Oc2,*Oc3,*Oc4,*Oc5,*Oc6,*Oc7,*Oc8,*Oc9,*Oc10,*Oc11,*Oc12,*Oc13;
    UILabel *Od1,*Od2,*Od3,*Od4,*Od5,*Od6,*Od7,*Od8,*Od9,*Od10,*Od11,*Od12,*Od13;
    
    double  moneyBetted1 ;
    double  moneyBetting1;
    double  moneyCanbet1; 
    double  moneyLimit1; 
    BOOL pageControlIsChangingPage;
    int time;
    //,*btnBetbanker,*btnBetbanker,;//為了利用button直接做為bet的變數，故部分變成小寫。
}


@property (nonatomic, retain)IBOutlet UIView *loginView;
@property (nonatomic, retain)IBOutlet UIButton *loginBut;
@property (nonatomic, retain)IBOutlet UITextField *userName,*passWord;

@property (nonatomic, retain)IBOutlet UIView *loadingView;
@property (nonatomic, retain)IBOutlet UIImageView *loginImg;


@property (nonatomic,retain) NSArray *pickerData;
@property (strong, nonatomic) NSArray *arrPick1;
@property (strong, nonatomic) NSArray *arrPick2;
@property (strong, nonatomic) NSArray *arrPick3;
@property (strong, nonatomic) NSArray *arrPick4;
@property (nonatomic,retain) IBOutlet UIImageView *betViewBG;
@property (nonatomic,retain) IBOutlet UILabel *labPlayerNum,*labBankerNum;
@property (nonatomic,retain) IBOutlet UIView *betView;
@property (nonatomic,retain) IBOutlet UILabel *betNavigationBarLabel,*gameNameLabel,*userNameLabel,*dealerName;
@property (nonatomic,retain) IBOutlet UIImageView *videoImage;
@property (nonatomic,retain) IBOutlet UIImageView *underImage;
@property (nonatomic,retain) IBOutlet UIImageView *imgMoney1,*imgMoney2,*imgMoney3,*imgMoney4,*imgCover;
@property (nonatomic,retain) IBOutlet UIButton *btnMoney1,*btnMoney2,*btnMoney3,*btnMoney4;
@property (nonatomic,retain) IBOutlet UIButton *btnChangeTable,*btnDetail,*btnRecord,*btnClear,*btnBet;
@property (nonatomic,retain) IBOutlet UITableView *historyTable;
@property (nonatomic,retain) IBOutlet UIScrollView *scrhistoryTable;
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView1,*scrChipTable;
@property (nonatomic,retain) IBOutlet UIPickerView *pickSelectChips;
@property (nonatomic,retain) IBOutlet UIButton *btnChangeMoney;
@property (nonatomic,retain) IBOutlet UILabel *creditLabel,*lblCountDown, *betTotalLabel;
@property (nonatomic,retain) IBOutlet UIButton *btnBet1,*btnBet2,*btnBet3,*btnBet4,*btnBet5,*btnBet6,*btnBet7,*btnBet8,*btnBet9,*btnBet10,*btnBet11;
@property (nonatomic,retain) IBOutlet UIButton *btnDetail1,*btnDetail2,*btnDetail3,*btnDetail4;
@property (nonatomic,retain) IBOutlet UIScrollView *scrDetal1, *scrDetal2, *scrDetal3;
@property (nonatomic,retain) IBOutlet UIWebView *webViewDetail1;
@property (nonatomic,retain) IBOutlet UIScrollView *scrviewRoadmap,*scrDetail;
@property (nonatomic,retain) IBOutlet UIImageView *baB_Bet1,*baB_Bet2,*baB_Bet3,*baB_Bet4,*baB_Bet5,*baB_Bet6,*baB_Bet7,*baB_Bet8,*baB_Bet9,*baB_Bet10,*baB_Bet11;//下注區背景;
@property (nonatomic,retain) IBOutlet UIImageView *baS_Bet1,*baS_Bet2,*baS_Bet3,*baS_Bet4,*baS_Bet5,*baS_Bet6,*baS_Bet7,*baS_Bet8,*baS_Bet9,*baS_Bet10,*baS_Bet11;//下注區背景;
@property (nonatomic,retain) IBOutlet UILabel *baI_Bet1,*baI_Bet2,*baI_Bet3,*baI_Bet4,*baI_Bet5,*baI_Bet6,*baI_Bet7,*baI_Bet8,*baI_Bet9,*baI_Bet10,*baI_Bet11;//下注區下注中;    
@property (nonatomic,retain) IBOutlet UILabel *baL_Bet1,*baL_Bet2,*baL_Bet3,*baL_Bet4,*baL_Bet5,*baL_Bet6,*baL_Bet7,*baL_Bet8,*baL_Bet9,*baL_Bet10,*baL_Bet11;//下注區限額;    
@property (nonatomic,retain) IBOutlet UILabel *baE_Bet1,*baE_Bet2,*baE_Bet3,*baE_Bet4,*baE_Bet5,*baE_Bet6,*baE_Bet7,*baE_Bet8,*baE_Bet9,*baE_Bet10,*baE_Bet11;//下注區已下注;
@property (nonatomic,retain) IBOutlet UIImageView *showSpacePoker1, *showSpacePoker2,*showSpacePoker3,*showSpacePoker4,*showSpacePoker5,*showSpacePoker6;
@property (nonatomic,retain) IBOutlet UILabel *D1,*D2,*D3,*D4,*D5,*D6,*D7,*D8,*D9,*D10,*D11;//下注區已下注;
@property (nonatomic,retain) IBOutlet UIButton *btnchang1,*btnchang2,*btnchang3,*btnchang4,*btnchang5,*btnchang6,*btnchang7,*btnchang8,*btnchang9,*btnchang10;
@property (nonatomic,retain) IBOutlet UITextView *textviewDetail1;
@property (nonatomic,retain) IBOutlet UILabel *labchang1,*labchang2,*labchang3,*labchang4,*labchang5,*labchang6,*labchang7,*labchang8,*labchang9,*labchang10;
@property (nonatomic,retain) IBOutlet UIImageView *imgChangeFront1,*imgChangeFront2,*imgChangeFront3,*imgChangeFront4,*imgChangeFront5,*imgChangeFront6,*imgChangeFront7,*imgChangeFront8,*imgChangeFront9,*imgChangeFront10;
//下注细单
@property (nonatomic,retain) IBOutlet UIImageView *Op1,*Op2,*Op3,*Op4,*Op5,*Op6;
@property (nonatomic,retain) IBOutlet UILabel *labRoundID,*labTableID,*labOrderTime,*labOther,*labBanker,*labPlayer,*labTotal,*labTotalPay;
@property (nonatomic,retain) IBOutlet UILabel *Oa1,*Oa2,*Oa3,*Oa4,*Oa5,*Oa6,*Oa7,*Oa8,*Oa9,*Oa10,*Oa11,*Oa12,*Oa13;
@property (nonatomic,retain) IBOutlet UILabel *Ob1,*Ob2,*Ob3,*Ob4,*Ob5,*Ob6,*Ob7,*Ob8,*Ob9,*Ob10,*Ob11,*Ob12,*Ob13;
@property (nonatomic,retain) IBOutlet UILabel *Oc1,*Oc2,*Oc3,*Oc4,*Oc5,*Oc6,*Oc7,*Oc8,*Oc9,*Oc10,*Oc11,*Oc12,*Oc13;
@property (nonatomic,retain) IBOutlet UILabel *Od1,*Od2,*Od3,*Od4,*Od5,*Od6,*Od7,*Od8,*Od9,*Od10,*Od11,*Od12,*Od13;

@property (nonatomic, retain) IBOutlet UITableView * table;
@property (nonatomic, retain) NSMutableArray * list; 
@property (nonatomic, retain) NSMutableArray * dateList;//Group; 
@property (nonatomic, retain) NSMutableArray * heroicaArray;//Group; 
@property (nonatomic, retain) NSMutableArray * heroicaArrayDetail;//Group; 
@property (nonatomic,retain) IBOutlet UIScrollView *showPokerNote;
@property (nonatomic,retain) IBOutlet UIButton *btnRelogin,*btnRoadMap;
@property (nonatomic,retain) IBOutlet UIImageView *IVmessageBox;
@property (nonatomic,retain) IBOutlet UILabel *LmessageLab;
@property (nonatomic,retain) IBOutlet UIImageView *imgRoadMapBG,*imgAllRoadMapBG;
@property (nonatomic,retain) IBOutlet UILabel *countBanker,*countPlayer,*countTie;
@property (nonatomic,retain) IBOutlet UIButton *btnBankAsk,*btnPlayAsk;
@property (nonatomic,retain) IBOutlet UIPageControl *myUIPageControl;
@property (nonatomic,retain) IBOutlet UIScrollView  *scrchangeTable;
@property (nonatomic,retain) IBOutlet UIImageView *changeBG,*changeFront,*changeTop,*changeUnder;
@property (nonatomic,retain) IBOutlet UILabel *changeTitle;
@property (nonatomic,retain) IBOutlet UISegmentedControl *seedSegmented;
@property (nonatomic,retain) IBOutlet UISwitch  *videoSwitch;
@property (nonatomic,retain) IBOutlet UIScrollView *Oscor1;

- (void) initNetworkCommunication;
- (void) transformUserinfo;
- (void) transformUserinfo_update;
- (void) messageReceived:(NSString *)message;

- (IBAction) joinBet;
- (IBAction) sentBet;
- (IBAction) changeBet;
- (IBAction) clearBet;
- (IBAction) seeHistory;
- (IBAction) seeDetail;
- (IBAction) seeRoadmap;
- (IBAction) changeTable;
- (IBAction) relogin;
- (IBAction) Down_btnBet1;
- (IBAction) Down_btnBet2;
- (IBAction) Down_btnBet3;
- (IBAction) Down_btnBet4;
- (IBAction) Down_btnBet5;
- (IBAction) Down_btnBet6;
- (IBAction) Down_btnBet7;
- (IBAction) Down_btnBet8;
- (IBAction) Down_btnBet9;
- (IBAction) Down_btnBet10;
- (IBAction) Down_btnBet11;
- (IBAction) down_BankAsk;
- (IBAction) down_PlayAsk;
- (IBAction) down_money1;
- (IBAction) down_money2;
- (IBAction) down_money3;
- (IBAction) down_money4;
- (IBAction) down_changeICO1;
- (IBAction) down_changeICO2;
- (IBAction) down_changeICO3;
- (IBAction) down_changeICO4;
- (IBAction) down_changeICO5;
- (IBAction) down_changeICO6;
- (IBAction) down_changeICO7;
- (IBAction) down_changeICO8;
- (IBAction) down_changeICO9;
- (IBAction) down_changeIC10;
- (IBAction) down_reentergame;
- (IBAction) down_btnDetail1;
- (IBAction) down_btnDetail2;
- (IBAction) down_btnDetail3;
- (IBAction) down_btnDetail4;
- (IBAction) chickSwitch;
- (IBAction) segmentedControlIndexChanged:(id)sender;

@end
