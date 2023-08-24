Program pasheesh;
uses Classes, SysUtils, Process, StrUtils;

type
   TStringDynArray =  array of AnsiString;
var
   line       : string;
   sfile      : string;
   args       : TStringDynArray;
   WorkingDir : string;

{$INCLUDE util.pas}
{$INCLUDE exec.pas}
{$INCLUDE buildin.pas}

begin
   GetDir(0, WorkingDir);
   while true do 
   begin
      Write(ReplaceHomeDir(WorkingDir), '> ');
      ReadLn(line);

      args  := SplitString(line, ' ');
      sfile := FileSearch(args[0], ':/bin/:/usr/bin/');
      if args[0] = 'exit' then break
      else if args[0] = 'cd' then ChangeDir(BackSlice(args, 1))
      else if args[0] = '' then Write()
      else if sfile <> '' then
         Exec(sfile, BackSlice(args, 1))
      else
         WriteLn('Command not found: ', line);
   end
end.
