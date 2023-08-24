procedure ChangeDir(Dir: TStringDynArray);
begin
   if Length(dir) > 1 then PasheeshError('cd: too many arguments');
   ChDir(Dir[0]);
   if IOresult<>0 then
      WriteLn(dir[0], ': cannot enter directory')
   else GetDir(0, WorkingDir);
end;
