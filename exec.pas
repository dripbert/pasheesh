procedure Exec(Path: string; Parameters: TStringDynArray);
const
   BufferSize =  2048;
var
   Process   : TProcess; 
   Parameter : AnsiString;

begin
   Process := TProcess.Create(nil);
   Process.Executable := Path;
   for Parameter in Parameters do
   begin
      Process.Parameters.Add(Parameter)
   end;
   Process.Execute;
   Process.WaitOnExit;
   Process.Free;
end;
