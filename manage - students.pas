uses crt;
type
     HS=record
     Hovaten:String[20];
     Ngaysinh:String[10];
     Tin:real;
     Toan:real;
     TB:real;
END;

var n,i,j,nn,tm:longint;d,s:real;fo:text;
    chon,chon2,chon3,ch,chr:char;
    A:array[1..100] of HS;st:HS;              stt:longint;
    B,C:array[1..101] of longint;
    tam:string;
    sst:HS;x:string;tb:real;
    KT:boolean;
procedure nhap;
begin
clrscr;
writeln;
writeln;
textcolor(lightred);
Write('                               Nhap so hoc sinh: ');readln(n);
for i:=1 to n do
        with A[i] do
begin
KT:=true;
textcolor(white);
writeln('                               -------------------------------------------');
textcolor(lightred);
if (n<>1) then writeln('                                Nhap thong tin nguoi thu:',i);
textcolor(white);
write('                                                 Ho va ten: ');textcolor(Yellow);readln(Hovaten);
repeat
textcolor(white);
if KT=false then writeln('                                                 Nhap lai');
write('                                                 Nhap sinh nhat (theo dang dd/mm/yyyy): ');textcolor(Yellow);readln(Ngaysinh);
if length(A[i].Ngaysinh)<>10 then KT:=false;
until length(A[i].Ngaysinh)=10;
textcolor(white);
write('                                                 Nhap diem tin: ');textcolor(Yellow);readln(Tin);
textcolor(white);
write('                                                 Nhap diem toan: ');textcolor(Yellow);readln(Toan);
A[i].TB:=(A[i].Toan+A[i].Tin)/2;
writeln;
end;
end;
procedure them;
begin
clrscr;
textcolor(lightred);
write('                 Ban muon them bao nhieu hoc sinh:');readln(nn);
for i:=1 to nn do
 begin
 tm:=i+n;
 with A[tm] do
  begin
  KT:=true;
  textcolor(white);
writeln('                               -------------------------------------------');
textcolor(lightred);
if (n<>1) then writeln('                                Nhap thong tin nguoi thu:',i);
textcolor(white);
write('                                                 Ho va ten: ');textcolor(Yellow);readln(Hovaten);
Repeat
textcolor(white);
if KT=false then writeln('                                                 Nhap lai');
write('                                                 Nhap sinh nhat(theo dang:dd/mm/yyyy): ');textcolor(Yellow);readln(Ngaysinh);
if length(A[tm].Ngaysinh)<>10 then KT:=false;
until length(A[tm].Ngaysinh)=10;
textcolor(white);
write('                                                 Nhap diem tin: ');textcolor(Yellow);readln(Tin);
textcolor(white);
write('                                                 Nhap diem toan: ');textcolor(Yellow);readln(Toan);
A[tm].TB:=(A[tm].Toan+A[tm].Tin)/2;
writeln;
  end;
 end;
inc(n,nn);
end;
procedure capnhatdulieu;
var sua:integer;
begin
clrscr;
//write('Nhap so hoc sinh ban muon sua: ');readln(sua);
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
textcolor(yellow);
writeln('       Ban muon them hoc sinh hay muon sua hoc sinh');
writeln('       Nhan 1 de them, nhan 2 de sua');
ch:=readkey;
if ch='1' then them
 else if ch='2' then
begin
clrscr;
write('         STT hoc sinh ban muon sua la:');textcolor(white);readln(stt);
{ for i:=1 to sua do readln(B[i]);
for i:=1 to sua do }
textcolor(lightgreen);
 with A[stt] do
 begin
 KT:=true;
 writeln('              Chon muc de sua');
 textcolor(lightgray);
 writeln('              1. Ho va ten: ',Hovaten);
 writeln('              2. Sinh nhat (theo dang dd/mm/yyyy): ',Ngaysinh);
 writeln('              3. Diem Tin: ',Tin:0:1);
 writeln('              4. Diem Toan: ',Toan:0:1);

 writeln('             -> Nhap so:');
 Repeat
 chon2:=readkey;
 if chon2='1' then begin textcolor(lightred);write('             Ho va ten: ');textcolor(white);readln(Hovaten);end
  else if chon2='2' then
  begin
Repeat
 if KT=false then writeln('              Nhap lai');
 textcolor(lightred);
 write('            Nhap sinh nhat (theo dang dd/mm/yyyy): ');
 textcolor(white);
 readln(Ngaysinh);
 if length(A[stt].Ngaysinh)<>10 then KT:=false;
until length(A[stt].Ngaysinh)=10;
  end
   else if chon2='3' then begin textcolor(lightred);write('                Nhap diem tin: ');textcolor(white);readln(Tin);end
    else if chon2='4' then begin textcolor(lightred);write('                Nhap diem toan: ');textcolor(white);readln(Toan);end;
  A[stt].TB:=(A[stt].Toan+A[stt].Tin)/2;
  textcolor(yellow);
   writeln;
   Writeln('                   Neu sua tiep nhan so, nguoc lai nhan ESC');
 until chon2=#27;
end;
 end;
end;

procedure sapxep;
begin
clrscr;
for i:=1 to n do
 for j:=i+1 to n do
  if A[i].Tin<A[j].Tin then begin
  tam:=A[i].Hovaten;A[i].Hovaten:=A[j].Hovaten;A[j].Hovaten:=tam;
  tam:=A[i].Ngaysinh;A[i].Ngaysinh:=A[j].Ngaysinh;A[j].Ngaysinh:=tam;
  d:=A[i].Tin;A[i].Tin:=A[j].Tin;A[j].Tin:=d;
  d:=A[i].Toan;A[i].Toan:=A[j].Toan;A[j].Toan:=d;
  d:=A[i].TB;A[i].TB:=A[j].TB;A[j].TB:=d;
  end;
writeln;
writeln;
textcolor(lightred);
Writeln('                    STT   Ho va ten              Sinh nhat           Diem Tin     Diem Toan     DTB');
textcolor(lightgray);
for i:=1 to n do
 with A[i] do
   begin
   Write('                    ',i:2,'    ',Hovaten);
   x:=A[i].Hovaten;
   for j:=1 to 23-length(x) do write(' ');
   writeln(Ngaysinh, Tin:16:1,Toan:12:1,(A[i].Tin+A[i].Toan)/2:12:1);
   end;
readln;
end;

procedure sapxep2;
begin
clrscr;
for i:=1 to n do
 for j:=i+1 to n do
  if A[i].TB<A[j].TB then begin
  tam:=A[i].Hovaten;A[i].Hovaten:=A[j].Hovaten;A[j].Hovaten:=tam;
  tam:=A[i].Ngaysinh;A[i].Ngaysinh:=A[j].Ngaysinh;A[j].Ngaysinh:=tam;
  d:=A[i].Tin;A[i].Tin:=A[j].Tin;A[j].Tin:=d;
  d:=A[i].Toan;A[i].Toan:=A[j].Toan;A[j].Toan:=d;
  d:=A[i].TB;A[i].TB:=A[j].TB;A[j].TB:=d;
  end;
writeln;
writeln;
textcolor(lightred);
Writeln('                    STT   Ho va ten              Sinh nhat           Diem Tin     Diem Toan     DTB');
textcolor(lightgray);
for i:=1 to n do
 with A[i] do
   begin
   Write('                    ',i:2,'    ',Hovaten);
   x:=A[i].Hovaten;
   for j:=1 to 23-length(x) do write(' ');
   writeln(Ngaysinh, Tin:16:1,Toan:12:1,(A[i].Tin+A[i].Toan)/2:12:1);
   end;
readln;
end;

procedure loc;
begin
clrscr;
writeln;
writeln;
textcolor(lightred);
Writeln('                    STT   Ho va ten              Sinh nhat           Diem Tin     Diem Toan     DTB');
textcolor(lightgray);
for i:=1 to n do
 with A[i] do
  if Tin>=9.0 then
   begin
   Write('                    ',i:2,'    ',Hovaten);
   x:=A[i].Hovaten;
   for j:=1 to 23-length(x) do write(' ');
   writeln(Ngaysinh, Tin:16:1,Toan:12:1,(A[i].Tin+A[i].Toan)/2:12:1);
   end;
readln;
end;
procedure xulidulieu;
begin
clrscr;
writeln;
writeln;
textcolor(green);
writeln('               Ban muon xu li gi < Chon so > ');
writeln('               --------------------------------------------');
textcolor(white);
writeln('               1. Sap xep theo thu tu diem Tin cao -> thap');
writeln('               2. Loc ra nhung hoc sinh diem Tin tren 9.0 ');
writeln('               3. Sap xep theo thuc tu diem trung binh cao -> thap');
textcolor(green);
writeln('               --------------------------------------------');
textcolor(white);
chon3:=readkey;
if chon3='1' then sapxep
 else if chon3='2' then loc
  else if chon3='3' then sapxep2;
end;

procedure indulieu;
begin
Clrscr;
s:=0;
writeln;
writeln;
textcolor(lightred);
Writeln('                    Danh sach hoc sinh hien tai:');
Writeln;
textcolor(lightgreen);
Writeln('                    STT   Ho va ten              Sinh nhat           Diem Tin     Diem Toan     DTB');
textcolor(lightgray);
For i:=1 to n do
 With a[i] do
  begin
  Write('                    ',i:2,'    ',Hovaten);
  x:=A[i].Hovaten;
  for j:=1 to 23-length(x) do write(' ');

  writeln(Ngaysinh, Tin:16:1,Toan:12:1,(A[i].Tin+A[i].Toan)/2:12:1);
  s:=s+A[i].Tin;

  end;
  textcolor(lightred);

//writeln('                                                                DTB     ',s/n:0:1);
writeln;
writeln('                       -> Ban co muon xuat du lieu ra file khong?(du lieu luu o "file.out")');
writeln('                       Yes:1                   No:2');
chr:=readkey;
if chr='1' then
begin
assign(fo,'file.out');rewrite(fo);
Writeln(fo,'STT   Ho va ten              Sinh nhat           Diem Tin     Diem Toan     DTB');
For i:=1 to n do
 With a[i] do
  begin
  Write(fo,i:2,'    ',Hovaten);
  x:=A[i].Hovaten;
  for j:=1 to 23-length(x) do write(fo,' ');

  writeln(fo,Ngaysinh, Tin:16:1,Toan:12:1,(A[i].Tin+A[i].Toan)/2:12:1);
  end;
close(fo);
exit;
end
  else exit;
Readln;
end;

procedure thoat;
begin
exit;
end;

BEGIN
Repeat
clrscr;
textcolor(white);
gotoXY(50,20);writeln;
writeln('                                           ---------------');
writeln('                                           1. Nhap du lieu');
writeln('                                           2. Cap nhat du lieu');
writeln('                                           3. Xu ly du lieu');
writeln('                                           4. In du lieu');
writeln('                                           Nhan ESC de EXIT');
writeln('                                           ---------------');
textcolor(green);
gotoXY(90,45);writeln('Developed by: Ton That Hai - 11 Tin ');
textcolor(white);
Chon:=readkey;
       Case chon of
      '1':nhap;
      '2':capnhatdulieu;
      '3':xulidulieu;
      '4':indulieu;
end;

until chon=#27;
END.
