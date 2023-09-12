Program pasheesh;
uses Classes, SysUtils, Process, StrUtils;

type
   TStringDynArray = array of AnsiString;

const
   builtins : Array [0..2] of AnsiString = ('exit', 'cd', 'type');
   Path     : String = ':/bin/:/usr/bin/:/usr/local/bin';

var
   line       : string;
   sfile      : string;
   args       : TStringDynArray;
   workingDir : string;

{$INCLUDE util.pas}
{$INCLUDE exec.pas}
{$INCLUDE buildin.pas}

begin
   GetDir(0, WorkingDir);
   while true do 
   begin
      Write(ShortenHomeDir(WorkingDir), ' % ');
      ReadLn(line);

      args  := SplitString(line, ' ');
      sfile := FileSearch(args[0], Path, []);
      if args[0] = 'exit' then break
      else if args[0] = 'cd' then ChangeDir(BackSlice(args, 1))
      else if args[0] = 'type' then CmdType(args[1])
      else if args[0] = '' then Write()
      else if sfile <> '' then
         Exec(sfile, BackSlice(args, 1))
      else
         WriteLn('Command not found: ', args[0]);
   end
end.
