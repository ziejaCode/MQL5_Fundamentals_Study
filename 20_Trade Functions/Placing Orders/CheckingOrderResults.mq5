#property version   "1.00"
 
/*
 
Create a script that sends a market order. But before sending the order, use the OrderCheck() function to check the request details.
It should print the retcode struct member when OrderCheck() failed. 
 
*/
 
bool TradeRequestMarket(ENUM_ORDER_TYPE type)
  {
   MqlTradeRequest request= {};
   MqlTradeResult result = {};
   request.action = TRADE_ACTION_DEAL;
   request.symbol = Symbol();
   request.volume = 1.0;
   request.deviation = 5;
   request.type = type;
   request.type_filling = ORDER_FILLING_IOC;
   request.magic = 0;
   if(type==ORDER_TYPE_BUY)
     {
      request.price = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
     }
   else
      if(type==ORDER_TYPE_SELL)
        {
         request.price = SymbolInfoDouble(Symbol(),SYMBOL_BID);
        }
   MqlTradeCheckResult check_result = {};
   if (!OrderCheck(request,check_result))
   {
      Print(__FUNCTION__": order check failure: "+(string)check_result.retcode);
   }
   if(OrderSend(request,result))
     {
      return(true);
     }
   Print(__FUNCTION__": failed to place order: "+(string)GetLastError());
   return(false);
  }
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   TradeRequestMarket(ORDER_TYPE_BUY);
   TradeRequestMarket(ORDER_TYPE_SELL);
  }
//+------------------------------------------------------------------+