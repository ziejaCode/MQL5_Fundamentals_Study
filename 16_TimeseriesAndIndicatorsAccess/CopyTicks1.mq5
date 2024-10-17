//+------------------------------------------------------------------+
//|                                                   CopyTicks1.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#define SYMBOL_NAME "EURUSD" 
  
void OnStart() 
  { 

   MqlTick ticks[]; 
    
//--- get the latest prices for the SYMBOL_NAME symbol into the MqlTick structure 
   if(!CopyTicks(SYMBOL_NAME, ticks,COPY_TICKS_ALL,0,10)) 
     { 
      Print("SymbolInfoTick() failed. Error ", GetLastError()); 
      return; 
     } 
 
   PrintFormat("Latest price data for the '%s' symbol:", SYMBOL_NAME); 
   ArrayPrint(ticks); 
   
  }