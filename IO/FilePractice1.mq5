//+------------------------------------------------------------------+
//|                                                FilePractice1.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"


input int InpSettingFile = "ziejacode/Templates/DonchianInputs.ini";

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
   
   if(FileIsExist("ziejacode/Templates/DonchianInputs.ini",0)){
      
      LoadFile();
      
      Comment("Exists");
      
   }else{
      Comment("Not exists");
   }
   
   
  }
  
  
  
bool LoadFile(){

   bool result = false;
   
   if(InpSettingFile != ""){
      Print("point1");
      //return (result);
   }
   
   if(!FileIsExist(InpSettingFile)){
      Print("point2");
      //return (result);
   }
   static long lastModeDate = 0;
   long modeDate = FileGetInteger(InpSettingFile, FILE_MODIFY_DATE);
   
   Print("modeDate ", modeDate);
   
   if(modeDate == lastModeDate) //return (result);
   lastModeDate = modeDate;
   
   Print("lastModeDate ", lastModeDate);
   
   string key     = "";
   string svalue  = "";
   string line    = "";
   string parts[];
   
   int  handle = FileOpen(InpSettingFile, FILE_SHARE_READ | FILE_TXT | FILE_ANSI);
   Print("handle ", handle);
   
   if (handle == INVALID_HANDLE) return (result);
   FileSeek(handle, 0, SEEK_SET);
   
   while(!FileIsEnding(handle)){
      line = FileReadString(handle);
      StringSplit(line, '=', parts);
      key      = "";
      svalue   = "";
      int size = ArraySize(parts);
      if (size > 0) key = parts[0];
      if (size > 1) svalue = parts[1];
      
      Alert(key, " -- ", svalue);
      
      //StringToLower(key);
      //if(key == "donchianbars")
      //   result |= SetValue(DonchianBars, (int)StringToInteger(svalue));
      //else if(key == "highlabel") PlotIndexSetString(0, PLOT_LABEL, svalue);
      //else if(key == "lowlabel") PlotIndexSetString(1, PLOT_LABEL, svalue);
   
   }
   FileClose(handle);
   
return (result);

} 
//+------------------------------------------------------------------+)