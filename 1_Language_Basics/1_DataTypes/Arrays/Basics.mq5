//+------------------------------------------------------------------+
//|                                                       Basics.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
int numbers[5] = {4,5,8,34,23};
int size = ArraySize(numbers); 

void OnStart()
  {
//---
   Alert(size);
  }
//+------------------------------------------------------------------+
