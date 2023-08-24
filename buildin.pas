procedure change_dir(dir: TStringDynArray);
begin
   if Length(dir) > 1 then WriteLn('cd: too many arguments');
   ChDir(dir[0]);
   if IOresult<>0 then
      WriteLn(dir[0], ': cannot enter directory');
   GetDir(0, working_dir)
end;
