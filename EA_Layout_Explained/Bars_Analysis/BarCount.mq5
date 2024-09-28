//+------------------------------------------------------------------+
//|                                                     BarCount.mq5 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Charts\Chart.mqh>

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   int bars=Bars(_Symbol,_Period); 
   if(bars>0) 
     { 
      Print("Number of bars in the terminal history for the symbol-period at the moment = ",bars); 
     } 
    
   //class CChart : public CObject;
   //int count =  CChart.VisibleBars;
   
   //int bar=WindowFirstVisibleBar();
   //for(int i=0; i<bars_count; i++,bar--)
    //{
    
    
     
     
  }     