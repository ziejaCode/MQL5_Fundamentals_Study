//+------------------------------------------------------------------+
//|                                                FilePractice2.mq5 |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart() 
  { 
//--- incorrect file opening method 
   string terminal_data_path=TerminalInfoString(TERMINAL_DATA_PATH); 
   string filename=terminal_data_path+"\\MQL5\\Files\\"+"fractals.csv"; 
   int filehandle=FileOpen(filename,FILE_WRITE|FILE_CSV); 
   if(filehandle<0) 
     { 
      Print("Failed to open the file by the absolute path "); 
      Print("Error code ",GetLastError()); 
     } 
  
//--- correct way of working in the "file sandbox" 
   ResetLastError(); 
   filehandle=FileOpen("fractals.csv",FILE_WRITE|FILE_CSV); 
   if(filehandle!=INVALID_HANDLE) 
     { 
      FileWrite(filehandle,TimeCurrent(),Symbol(), EnumToString(_Period)); 
      FileClose(filehandle); 
      Print("FileOpen OK"); 
     } 
   else Print("Operation FileOpen failed, error ",GetLastError()); 
//--- another example with the creation of an enclosed directory in MQL5\Files\ 
   string subfolder="Research"; 
   filehandle=FileOpen(subfolder+"\\fractals.txt",FILE_WRITE|FILE_CSV); 
      if(filehandle!=INVALID_HANDLE) 
     { 
      FileWrite(filehandle,TimeCurrent(),Symbol(), EnumToString(_Period)); 
      FileClose(filehandle); 
      Print("The file must be created in the folder "+terminal_data_path+"\\"+subfolder); 
     } 
   else Print("File open failed, error ",GetLastError()); 
  }