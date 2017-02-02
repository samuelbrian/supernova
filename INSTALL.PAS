{//-------------------------------------------------------------------------}
{/*                                                                         }
{Copyright (C) 1990, 2009 - Apogee Software, Ltd.                           }
{                                                                           }
{This file is part of Supernova.  Supernova is free software; you can       }
{redistribute it and/or modify it under the terms of the GNU General Public }
{License as published by the Free Software Foundation; either version 2     }
{of the License, or (at your option) any later version.                     }
{                                                                           }
{This program is distributed in the hope that it will be useful,            }
{but WITHOUT ANY WARRANTY; without even the implied warranty of             }
{MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                       }
{                                                                           }
{See the GNU General Public License for more details.                       }
{                                                                           }
{You should have received a copy of the GNU General Public License          }
{along with this program; if not, write to the Free Software                }
{Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.}
{                                                                           }
{Original Source: 1990 Scott Miller                                         }
{Prepared for public release: 03/19/09 - Joe Siegler, Apogee Software, Ltd. }
{*/                                                                         }
{//-------------------------------------------------------------------------}
program Install;  { Used to add FILES=16 to a CONFIG.SYS file. }

uses crt, dos, turbo3;

{$V-}
label JUMP;

var x,y,i    :integer;
    Fil      :Text;
    ComTest  :File;
    TestStr  :string[200];
    ch       :char;
    result   :registers;

procedure Pause(X:integer);
 begin
  textcolor(7);
  if X=1 then write('Press any key to continue . . .')
  else write('Press any key to end installation program . . .');
  read(kbd,CH);textcolor(15);writeln;
 end;

BEGIN JUMP:
textbackground(0);clrscr;textcolor(15);
clrscr;with Result do begin ax:=$b00;bx:=$1;end;intr($10,result);
gotoxy(25,2);writeln('SUPERNOVA INSTALLATION PROGRAM');
gotoxy(25,3);writeln('------------------------------');writeln;
textcolor(7);
writeln;
writeln('NOTE: Hard disk users don''t need to install SUPERNOVA! Hit <Ctrl-C> to abort.');
writeln;
writeln
('This program will prepare a "boot" disk for SUPERNOVA.  The disk you wish');
writeln
('to make your "boot" disk MUST have DOS already on it (version 2.0 or higher.)');
writeln
('SUPERNOVA makes use of DOS file handles (explained in your DOS manual.)');
writeln
('Everytime you play SUPERNOVA you must use this "boot" disk--which you are in');
writeln
('the process of making--to power-on your computer.');writeln;
writeln('This program will either:');
writeln
('* Create a CONFIG.SYS with the Files=16 DOS option,');
writeln
('* Add the Files=16 DOS option to a CONFIG.SYS file that is found on the disk,');
writeln
('* Modify a CONFIG.SYS file that already has the Files=# option in it.');
writeln;textcolor(15);
writeln('Insert the disk you wish to have installed for SUPERNOVA.');Pause(1);
gotoxy(1,wherey-1);delline;
writeln;
assign(ComTest,'command.com');
{$I-}
reset(ComTest);
{$I+}
if IOResult<>0 then
 begin textbackground(0);textcolor(15);close(ComTest);
  writeln('This disk does not have the DOS system on it (it''s missing COMMAND.COM).',^g);
  write('You must install a disk that already has DOS, please find another disk...');
  textbackground(0);textcolor(7);
  writeln;writeln;Pause(1);goto JUMP;
 end;
close(ComTest);
write('Searching for CONFIG.SYS...');
assign(Fil,'config.sys');
{$I-}
reset(Fil);
{$I+}
if IOResult<>0 then  { config.sys file needs to be created! }
 begin
  writeln('not found...will create one for you!');
  rewrite(Fil);
  writeln(Fil,'Files=16');
  close(Fil);
 end
else                 { config.sys file exists already! }
 begin
  writeln('found...will now modify it correctly.');
  append(Fil);
  writeln(Fil);
  writeln(Fil,'Files=16');
  close(Fil);
 end;
writeln;
writeln('Your CONFIG.SYS file is now configured correctly for SUPERNOVA.');
Pause(1);
textbackground(0);textcolor(15);
clrscr;with Result do begin ax:=$b00;bx:=$1;end;intr($10,result);
gotoxy(25,3);writeln('SUPERNOVA INSTALLATION PROGRAM');
gotoxy(25,4);writeln('------------------------------');writeln;
textcolor(7);
writeln;
writeln
('From now on you MUST use this disk (or any other "boot" disk you make) when');
writeln
('you want to play SUPERNOVA, or the game will crash after you load it!');
writeln;
writeln
('Simply turn on your computer with this "boot" disk in drive A: when you want');
writeln
('to play SUPERNOVA, then after you see the DOS prompt A> type in NOVA and');
writeln
('press <enter>.');writeln;
writeln
('Before you can play SUPERNOVA you must turn your computer off, then follow');
writeln
('the above instructions.');
writeln;
writeln('REMEMBER: If you boot from a hard disk you don''t need to make a "boot" disk.');
writeln;Pause(2);

textbackground(0);textcolor(7);
clrscr;with Result do begin ax:=$b00;bx:=$0;end;intr($10,result);


END.