//+------------------------------------------------------------------+
//|                                        SpecificBarTimeSearch.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+ 
//| Script program start function                                    | 
//+------------------------------------------------------------------+ 
void OnStart() 
  { 
//--- The date is on Sunday 
   datetime time=D'2002.04.25 12:00'; 
   string symbol="GBPUSD"; 
   ENUM_TIMEFRAMES tf=PERIOD_H1; 
   bool exact=false; 
//--- If there is no bar at the specified time, iBarShift will return the index of the nearest bar 
   int bar_index=iBarShift(symbol,tf,time,exact); 
//--- Check the error code after the call of iBarShift() 
   int error=GetLastError(); 
   if(error!=0) 
     { 
      PrintFormat("iBarShift(): GetLastError=%d - The requested date %s "+ 
                  "for %s %s is not found in the available history", 
                  error,TimeToString(time),symbol,EnumToString(tf)); 
      return; 
     } 
//--- The iBarShift() function was executed successfully, return a result for exact=false 
   PrintFormat("1. %s %s %s(%s): bar index is %d (exact=%s)", 
               symbol,EnumToString(tf),TimeToString(time), 
               DayOfWeek(time),bar_index,string(exact)); 
   datetime bar_time=iTime(symbol,tf,bar_index); 
   PrintFormat("Time of bar #%d is %s (%s)", 
               bar_index,TimeToString(bar_time),DayOfWeek(bar_time)); 
//--- Request the index of the bar with the specified time; if there is no bar -1 will be returned 
   exact=true; 
   bar_index=iBarShift(symbol,tf,time,exact); 
//--- The iBarShift() function was executed successfully, return a result for exact=true 
   PrintFormat("2. %s %s %s (%s):bar index is %d (exact=%s)", 
               symbol,EnumToString(tf),TimeToString(time) 
               ,DayOfWeek(time),bar_index,string(exact)); 
  } 
//+------------------------------------------------------------------+ 
//| Returns the name of the day of the week                          | 
//+------------------------------------------------------------------+ 
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
/* Execution result 
   1. GBPUSD PERIOD_H1 2018.06.10 12:00(SUNDAY): bar index is 64 (exact=false) 
   Time of bar #64 is 2018.06.08 23:00 (FRIDAY) 
   2. GBPUSD PERIOD_H1 2018.06.10 12:00 (SUNDAY):bar index is -1 (exact=true) 
*/ 