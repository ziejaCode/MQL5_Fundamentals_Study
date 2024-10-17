//+------------------------------------------------------------------+
//|                                                  AccountInfo.mq5 |
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
   Print("account balance: "+(string)AccountInfoDouble(ACCOUNT_BALANCE));
   Print("account profit: "+(string)AccountInfoDouble(ACCOUNT_PROFIT));
   Print("account equity: "+(string)AccountInfoDouble(ACCOUNT_EQUITY));
   Print("account margin: "+(string)AccountInfoDouble(ACCOUNT_MARGIN));
   
  }
//+------------------------------------------------------------------+
