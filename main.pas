Program pasheesh;
uses Classes, SysUtils, Process, StrUtils;
type
   TStringDynArray =  array of AnsiString;
var
   line  : string;
   sfile : string;
   args  : TStringDynArray;

{$INCLUDE util.pas}
{$INCLUDE exec.pas}

begin
   while true do 
   begin
      Write('pasheesh> ');
      ReadLn(line);
      if line = 'exit' then break;

      args  := SplitString(line, ' ');
      sfile := FileSearch(args[0], ':/bin/:/usr/bin/');
      if sfile <> '' then
         Exec(sfile, BackSlice(args, 1))
      else
         WriteLn('Command not found: ', line);
   end
end.
