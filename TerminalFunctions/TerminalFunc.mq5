//+------------------------------------------------------------------+
//|                                                 TerminalFunc.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"



void OnStart()
  {
  
   Print("terminal build: "+(string)TerminalInfoInteger(TERMINAL_BUILD));
   Print("terminal status: "+(string)TerminalInfoInteger(TERMINAL_CONNECTED));
   Print("terminal trade allowed: "+(string)TerminalInfoInteger(TERMINAL_TRADE_ALLOWED));
   Print("terminal dlls allowed: "+(string)TerminalInfoInteger(TERMINAL_DLLS_ALLOWED));
   Print("terminal max bars per chart: "+(string)TerminalInfoInteger(TERMINAL_MAXBARS));
   
  }