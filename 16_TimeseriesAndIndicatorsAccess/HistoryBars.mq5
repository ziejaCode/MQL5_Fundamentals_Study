//+------------------------------------------------------------------+
//|                                                  HistoryBars.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Sample request for the number of all history bars:Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   int bars=Bars(_Symbol,_Period);
   if(bars>0)
     {
      Print("Number of bars in the terminal history for the symbol-period at the moment = ",bars);
     }
   else  //no available bars
     {
      //--- data on the symbol might be not synchronized with data on the server
      bool synchronized=false;
      //--- loop counter
      int attempts=0;
      // make 5 attempts to wait for synchronization
      while(attempts<5)
        {
         if(SeriesInfoInteger(Symbol(),0,SERIES_SYNCHRONIZED))
           {
            //--- synchronization done, exit
            synchronized=true;
            break;
           }
         //--- increase the counter
         attempts++;
         //--- wait 10 milliseconds till the next iteration
         Sleep(10);
        }
      //--- exit the loop after synchronization
      if(synchronized)
        {
         Print("Number of bars in the terminal history for the symbol-period at the moment = ",bars);
         Print("The first date in the terminal history for the symbol-period at the moment = ",
               (datetime)SeriesInfoInteger(Symbol(),0,SERIES_FIRSTDATE));
         Print("The first date in the history for the symbol on the server = ",
               (datetime)SeriesInfoInteger(Symbol(),0,SERIES_SERVER_FIRSTDATE));
        }
      //--- synchronization of data didn't happen
      else
        {
         Print("Failed to get number of bars for ",_Symbol);
        }
     }
   
  }
//+------------------------------------------------------------------+
