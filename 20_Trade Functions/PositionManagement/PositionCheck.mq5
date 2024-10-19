#property version   "1.00"
 
/*
 
Create a script similar to #1. 
However, after the successful selection of the position, 
the script should print the following information about the selected position: ticket, symbol, volume, position type, entry price, stoploss, and takeprofit. 
 
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
   if (TradeRequestMarket(ORDER_TYPE_BUY))
   {
      Sleep(500);
      if (PositionSelect(Symbol()))
      {
         Print("position is selected");
         ulong ticket = PositionGetInteger(POSITION_TICKET);
         string symbol = PositionGetString(POSITION_SYMBOL);
         double volume = PositionGetDouble(POSITION_VOLUME);
         ENUM_POSITION_TYPE position_type = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
         double entry_price = PositionGetDouble(POSITION_PRICE_OPEN);
         double stoploss = PositionGetDouble(POSITION_SL);
         double takeprofit = PositionGetDouble(POSITION_TP);
         Print("ticket: "+(string)ticket);
         Print("symbol: "+(string)symbol);
         Print("volume: "+(string)volume);
         Print("position_type: "+EnumToString(position_type));
         Print("entry_price: "+(string)entry_price);
         Print("stoploss: "+(string)stoploss);
         Print("takeprofit: "+(string)takeprofit);
      }
   }  
  }
//+------------------------------------------------------------------+