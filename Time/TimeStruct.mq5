//+------------------------------------------------------------------+
//|                                                   TimeStruct.mq5 |
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
   long time = SymbolInfoInteger(Symbol(),SYMBOL_TIME);
   MqlDateTime time_struct;
   TimeToStruct(time,time_struct);
   Print((string)time_struct.year);
   Print((string)time_struct.day_of_year);
   Print((string)time_struct.mon);
   Print((string)time_struct.day_of_week);
   Print((string)time_struct.day);
   Print((string)time_struct.hour);
   Print((string)time_struct.min);   
   Print((string)time_struct.sec);    
  }
//+------------------------------------------------------------------+
