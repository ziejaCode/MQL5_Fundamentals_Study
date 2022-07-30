//+------------------------------------------------------------------+
//|                                                FilePractice1.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Files\FileBin.mqh>

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   
   int ExternaFile = FileOpen("testfile2.txt", FILE_READ, , '|', CP_ACP);
   string contents = FileReadString(ExternaFile);
   
   Alert(contents);
   
   
   
  }
//+------------------------------------------------------------------+)