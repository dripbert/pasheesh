procedure ChangeDir(Dir: TStringDynArray);
begin
   if Length(dir) > 1 then PasheeshError('cd: too many arguments');
   ChDir(Dir[0]);
   if IOresult<>0 then
      WriteLn(dir[0], ': cannot enter directory')
   else GetDir(0, WorkingDir);
end;

procedure CmdTYpe(Cmd: String);
begin
   
   if AnsiIndexStr(Cmd, builtins) <> -1 then
      WriteLn(Cmd, ' is a shell builtin')
   else if FileSearch(Cmd, Path) <> '' then
      WriteLn(Cmd, ' is ', FileSearch(Cmd, Path))
   else WriteLn(Cmd, ': not found');
end;
