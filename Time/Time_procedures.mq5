//+------------------------------------------------------------------+
//|                                              Time_procedures.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
    { 
//--- The date is on Sunday 
   datetime time=D'2024.09.28 12:00'; 
   string symbol="AUDCHF"; 
   ENUM_TIMEFRAMES tf=PERIOD_H1; 
   bool exact=false; 
   
   //--- there is no bar at the specified time, iBarShift will return the index of the nearest bar 
   int bar_index=iBarShift(symbol,tf,time,exact); 
   
   PrintFormat("1. %s %s %s(%s): bar index is %d (exact=%s)",symbol,EnumToString(tf),TimeToString(time),DayOfWeek(time),bar_index,string(exact)); 
   
   datetime bar_time=iTime(symbol, tf, bar_index); 
  
   PrintFormat("Time of bar #%d is %s (%s)", bar_index, TimeToString(bar_time), DayOfWeek(bar_time)); 

   //PrintFormat(iTime(symbol,tf,bar_index));  
   //--- Request the index of the bar with the specified time; but there is no bar, return -1 
   exact=true; 
   
   bar_index=iBarShift(symbol,tf,time,exact); 
   
   PrintFormat("2. %s %s %s (%s):bar index is %d (exact=%s)",symbol,EnumToString(tf),TimeToString(time),DayOfWeek(time),bar_index,string(exact)); 
  } 
//+------------------------------------------------------------------+ 
/**| Returns the name of the day of the week    

     Belows function takes datatime variable and turn it into structure.                | 
//+-----------------------------------------------------------------**/ 
string DayOfWeek(const datetime time) 
  { 
   MqlDateTime dt; 
   string day=""; 
   TimeToStruct(time,dt); 
   switch(dt.day_of_week) 
     { 
      case 0: day=EnumToString(SUNDAY); 
      break; 
      case 1: day=EnumToString(MONDAY); 
      break; 
      case 2: day=EnumToString(TUESDAY); 
      break; 
      case 3: day=EnumToString(WEDNESDAY); 
      break; 
      case 4: day=EnumToString(THURSDAY); 
      break; 
      case 5: day=EnumToString(FRIDAY); 
      break;    
      default:day=EnumToString(SATURDAY); 
      break; 
     } 
//--- 
   return day; 
   
  }
//+------------------------------------------------------------------+
