//+------------------------------------------------------------------+
//|                                         CheckForOpenPosition.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                            https://www.marty.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.marty.com"
#property version   "1.00"




//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {

   // here I check for open position on the chart
   checkForOpenPositions();
   
  }
  
int checkForOpenPositions(){

   bool PositionsOpened = false;
         // here I check for open position on the chart this is just test from cloud fhgfhfh hhh
      if(PositionsTotal()<=0){
            Comment("No open positons ", PositionsTotal());
            PositionsOpened = true;
      }else{
            Comment("Positions open: ", PositionsTotal());
            // get info about open positions
      }
   return PositionsOpened;   
 }