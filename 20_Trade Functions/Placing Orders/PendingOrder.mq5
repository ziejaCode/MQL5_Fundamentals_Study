//+------------------------------------------------------------------+
//|                                                 PendingOrder.mq5 |
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
   TradeRequestPending(ORDER_TYPE_BUY_STOP);
   TradeRequestPending(ORDER_TYPE_BUY_LIMIT);
   TradeRequestPending(ORDER_TYPE_SELL_STOP);
   TradeRequestPending(ORDER_TYPE_SELL_LIMIT);
   
  }
//+------------------------------------------------------------------+

 
/*
 
Create a script with a function that is capable of sending either a long or short position. 
Send trade requests to enter a long and short position, respectively, using that function.
 
*/
 
bool TradeRequestPending(ENUM_ORDER_TYPE type)
  {
   MqlTradeRequest request= {};
   MqlTradeResult result = {};
   request.action = TRADE_ACTION_PENDING;
   request.symbol = Symbol();
   request.volume = 1.0;
   request.type = type;
   request.type_filling = ORDER_FILLING_IOC;
   request.magic = 0;
   
   double point = SymbolInfoDouble(Symbol(),SYMBOL_POINT);
   if(type==ORDER_TYPE_BUY_STOP)
     {
      request.price = SymbolInfoDouble(Symbol(),SYMBOL_ASK)+500*point;
     }
   else
      if(type==ORDER_TYPE_BUY_LIMIT)
        {
         request.price = SymbolInfoDouble(Symbol(),SYMBOL_ASK)-500*point;
        }
   else 
      if(type==ORDER_TYPE_SELL_STOP)
     {
      request.price = SymbolInfoDouble(Symbol(),SYMBOL_BID)-500*point;
     }
   else
      if(type==ORDER_TYPE_SELL_LIMIT)
        {
         request.price = SymbolInfoDouble(Symbol(),SYMBOL_BID)+500*point;
        }
   if(OrderSend(request,result))
     {
      return(true);
     }
   Print(__FUNCTION__": failed to place order: "+(string)GetLastError());
   return(false);
  }
