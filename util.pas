function BackSlice(strings: TStringArray; n: Integer): TStringDynArray;
var
   str   : AnsiString;
   slice : TStringDynArray;
   i     : Word;
begin
   SetLength(slice, Length(strings) - n);
   i := 0;
   for str in strings do
   begin
      i := i + 1;
      if i > n then slice[i-n-1] := str
   end;
   BackSlice := slice;
end;

function ShortenHomeDir(Dir: string): string;
var
   HomeDir : string;
begin
{$ifdef FreeBSD}
   HomeDir := Concat('/usr', GetUserDir());
{$else}
   HomeDir := GetUserDir();
{$endif}

   ShortenHomeDir := StringReplace(Dir, HomeDir, '~/', []);
end;


procedure PasheeshError(msg: string);
begin
   WriteLn(msg);
end;
