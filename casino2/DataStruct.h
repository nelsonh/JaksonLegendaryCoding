//
//  DataStruct.h
//  casino2
//
//  Created by mobile on 12/7/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataStruct : NSObject

struct betAreaInfo
{
    double  moneyBetted1 ;
    double  moneyBetting1 ;
    double  moneyCanbet1; 
    double  moneyLimit1; 
    
    double  moneyBetted2 ;
    double  moneyBetting2;
    double  moneyCanbet2;   
    double  moneyLimit2; 
    
    double  moneyBetted3 ;
    double  moneyBetting3;
    double  moneyCanbet3;   
    double  moneyLimit3; 
    
    double  moneyBetted4 ;
    double  moneyBetting4;
    double  moneyCanbet4;   
    double  moneyLimit4; 
    
    double  moneyBetted5 ;
    double  moneyBetting5;
    double  moneyCanbet5;   
    double  moneyLimit5; 
    
    double  moneyBetted6 ;
    double  moneyBetting6;
    double  moneyCanbet6; 
    double  moneyLimit6; 
    
    double  moneyBetted7 ;
    double  moneyBetting7;
    double  moneyCanbet7;   
    double  moneyLimit7; 
    
    double  moneyBetted8 ;
    double  moneyBetting8;
    double  moneyCanbet8;   
    double  moneyLimit8; 
    
    double  moneyBetted9 ;
    double  moneyBetting9;
    double  moneyCanbet9;   
    double  moneyLimit9; 
    
    double  moneyBetted10 ;
    double  moneyBetting10;
    double  moneyCanbet10;   
    double  moneyLimit10; 
    
    double  moneyBetted11 ;
    double  moneyBetting11;
    double  moneyCanbet11;   
    double  moneyLimit11; 

    
};

struct betMoneys
{
    double betmoney1;
    double betmoney2;
    double betmoney3;
    double betmoney4;
    int betindex1;
    int betindex2;
    int betindex3;
    int betindex4;

};



typedef struct userInfo
{
  __unsafe_unretained   NSString    *sid;
  __unsafe_unretained   NSString    *action;
  __unsafe_unretained   NSString    *gameType;
                        int         gameCode;
                        double      credit;
  __unsafe_unretained   NSString    *currency;
  __unsafe_unretained   NSString    *hallID;
                        bool        *kick;
  __unsafe_unretained   NSString    *vip;
                        int         max;
                        int         ou;
                        int         par;
                        int         tie;
                        int         min;
  __unsafe_unretained   NSString    *userID;
  __unsafe_unretained   NSString    *userName;
  __unsafe_unretained   NSString    *payOfftal;
  __unsafe_unretained   NSString    *siteLevel;
  __unsafe_unretained   NSString    *chipList;
  __unsafe_unretained   NSString    *phone;
  __unsafe_unretained   NSString    *chipFilter;  
  __unsafe_unretained   NSString    *payoff; 
  __unsafe_unretained   NSString    *betAmount  ;  
  __unsafe_unretained   NSMutableArray *myBetAreaInfo   ;
                        int         asknum;  
                        int         askconstnum;
                        int         changeindex;
                        int         unbetround;
                        int         round;
                        int         invalueChips;
;
}userInfo;

struct gameInfo
{
    __unsafe_unretained   NSString    *gameCode;                            
    __unsafe_unretained   NSString    *roundNo; 
    __unsafe_unretained   NSString    *roundSerial; 
                            int         countDown;
                            int         status; 
                            int         oldStatus;
                            int         dealing_delay ;
                            int         waiting_delay ;
                            int         betweenstatus ;//1 wait to bet //2 bet to dail //3dail to wait;
                            int         waitingDelayTime ;//1 wait to bet //2 bet to dail //3dail to wait;
    __unsafe_unretained   NSString    *poker; 
    __unsafe_unretained   NSString    *result; 
    __unsafe_unretained   NSString    *dealerName; 
    __unsafe_unretained   NSString    *roadmap;
    __unsafe_unretained   NSMutableArray *bac1BetAreaInfo   ;
    __unsafe_unretained   NSMutableArray *bac2BetAreaInfo   ;
    __unsafe_unretained   NSMutableArray *bac3BetAreaInfo   ;
    __unsafe_unretained   NSMutableArray *bac4BetAreaInfo   ;
    __unsafe_unretained   NSMutableArray *bac5BetAreaInfo   ;
                            int         time1; 
                            int         time2;
                            int         time3;
                            int         time4;
                            int         time5;
                            int         time6; 
                            int         time7;
                            int         time8;
                            int         time9;
                            int         time10;
                            int         roadmapWidth;
                            int         roadmapHight;
    
};

@end
