//+------------------------------------------------------------------+
//|                                               OrderPlaceCode.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
/* This script is purely for practice purpose

   It will present an example of opening and closing order on the market

*/


uint MagicNumber = 101;

void OnStart()
  {

   double askPrice = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
   double bidPrice = SymbolInfoDouble(_Symbol, SYMBOL_BID);
   double tickSize = SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   
   askPrice = round(askPrice/tickSize) * tickSize;
   bidPrice = round(bidPrice/tickSize) * tickSize;
   
   string comment = "Long | " + _Symbol + " | " + string(MagicNumber);
   
   MqlTradeRequest request = {};
   MqlTradeResult  result  = {};
   
   
   // this is just a test
   
   // Filling request parameters
   request.action    = TRADE_ACTION_DEAL;                     
   request.symbol    = _Symbol;                              
   request.volume    = 0.01;                                   
   request.type      = ORDER_TYPE_BUY;                       
   request.price     = askPrice; 
   request.type_filling = ORDER_FILLING_IOC;
   request.deviation = 10; 
   request.magic = MagicNumber;                                                              
   request.comment   = comment;   
   
   if(!OrderSend(request, result))
   {
      Print("Trade not executed, error: ", GetLastError());
   }
   //Trade Information
      Print("Broker reply ", result.retcode, " comm: ", result.comment);
      Print("Open ", request.symbol,  " LONG "," order #", result.order,": ",result.retcode,", Volume: ",result.volume,", Price: ",DoubleToString(result.price,_Digits));
  
   
  }
