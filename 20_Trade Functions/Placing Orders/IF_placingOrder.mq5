//+------------------------------------------------------------------+
//|                                              IF_placingOrder.mq5 |
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
   
   MqlTradeRequest request = {};
   MqlTradeResult result = {};
   
   request.action    = TRADE_ACTION_DEAL;                     
   request.symbol    = _Symbol;                              
   request.volume    = 0.01;                                   
   request.type      = ORDER_TYPE_BUY;                       
   request.price     = round(SymbolInfoDouble(_Symbol, SYMBOL_ASK)/SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE))*SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE);
   request.type_filling = ORDER_FILLING_IOC;
   request.deviation = 10; 
   request.magic = 101;                                                              
   request.comment   = "Long | " + _Symbol + " | " + string(101);; 
   
   
   if(!OrderSend(request,result))
        {
         Print("Failed to place order: "+(string)GetLastError());
        }
   else
   {
      Print("Order placed");
   }
  }