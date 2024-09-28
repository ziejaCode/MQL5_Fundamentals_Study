//+------------------------------------------------------------------+
//|                                              Simple_datatime.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

input int shift = 4;

datetime time;

void OnStart()
  {
   
   for(int i = 0; i < shift; i++){
   
   
   //This method gived time of new bar opening.
   time = iTime(Symbol(),PERIOD_CURRENT,i);
   Print("This is time for bar ", i ,": ", time);
   }
  }