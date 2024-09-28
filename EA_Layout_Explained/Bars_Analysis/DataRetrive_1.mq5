//+------------------------------------------------------------------+
//|                                                DataRetrive_1.mq5 |
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

   MqlRates bar[];  // this is creating an array objec
   Print("Size of array before is ",ArraySize(bar));
   ArraySetAsSeries(bar,true); // it sets the array
   CopyRates(_Symbol,PERIOD_CURRENT,0,3,bar); // this copy an information about bars 0,1,2 into bar[] array.
   Print("Size of array after is ",ArraySize(bar));
  
   for(int i = 0; i<ArraySize(bar); i++){
     
     MqlRates rates = bar[i];
     Print("Bar ", i ," data: ,", rates.open, " , ", rates.close, " , " ,rates.spread);
   }
   

   
}


