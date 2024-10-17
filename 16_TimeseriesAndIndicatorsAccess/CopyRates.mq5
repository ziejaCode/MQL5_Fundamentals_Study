//+------------------------------------------------------------------+
//|                                                    CopyRates.mq5 |
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
   MqlRates rates[]; 
    
//--- get the latest prices for the SYMBOL_NAME symbol into the MqlTick structure 
   if(CopyRates(Symbol(), PERIOD_H1,0,10,rates)>0) 
     { 
      Print("SymbolInfoTick() failed. Error ", GetLastError()); 
      return; 
     } 
 
   PrintFormat("Latest price data for the '%s' symbol:", _Symbol); 
   ArrayPrint(rates); 
}   