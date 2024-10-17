//+------------------------------------------------------------------+
//|                                              SymbolInfoTick2.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+


#define SYMBOL_NAME "EURUSD" 
  
//+------------------------------------------------------------------+ 
//| Script program start function                                    | 
//+------------------------------------------------------------------+ 
void OnStart() 
  { 
//--- declare an array with the MqlTick structure type of dimension 1 
   MqlTick tick[5]={}; 
    
//--- get the latest prices for the SYMBOL_NAME symbol into the MqlTick structure 
   
   for(int a = 0; a < 5; a++){
      if(!SymbolInfoTick(SYMBOL_NAME, tick[a])) 
        { 
         Print("SymbolInfoTick() failed. Error ", GetLastError()); 
         return; 
        } 
  
       PrintFormat("Current no '%s' a:", (string)a);  
      
      
    } 
    PrintFormat("Latest price data for the '%s' symbol:", SYMBOL_NAME);  
    ArrayPrint(tick);  
      
   /* 
   result: 
   Latest price data for the 'EURUSD' symbol: 
                    [time]   [bid]   [ask] [last] [volume]    [time_msc] [flags] [volume_real] 
   [0] 2024.05.17 23:58:54 1.08685 1.08695 0.0000        0 1715990334319       6       0.00000 
   */ 
  }