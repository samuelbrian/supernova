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
{$c-}
const
  Max = 77;

type
  MaxLength = string[Max];
  OneChar   = string[1];

var
  C1                : file of MaxLength;
  Position,Counter,
  Start,Stop,x      : integer;
  Text1             : MaxLength;
  Answer            : char;
  Letter            : OneChar;
  List              : boolean;

procedure Diskwrite(text1: MaxLength; pointer: integer);
  begin
    seek(C1,pointer);
    WRITE(C1,text1);
    writeln('Clue ',pointer,
            ' is written!  Size = ',filesize(C1));
    close(C1);
  end; {End of Diskwrite.}

procedure Diskread(start,stop: integer);
var
counter : integer;
text1   : MaxLength;
  begin
   assign(C1,'C1');
   reset(C1);
   seek(C1,start);
    for counter:= start to stop do
      begin
        highvideo;
        READ(C1,text1);
        if list then writeln(lst,counter,':',text1)
        else
          begin
            writeln('Here is CLUE # ',counter);
            lowvideo;
            writeln(text1);
            highvideo;
          end;
      end;
    close(C1);
    write('The file contains ',filesize(C1),' CLUES.');
  end;  {End of Diskread.}

procedure Beep;
begin
 if(length(text1)=68)then
  begin sound(99);delay(50);nosound;end;
end;

BEGIN
nosound;
window(2,1,79,25);
repeat          {Main loop.}
  text1:='';

writeln;
writeln('Do you want to R)ead, W)rite or Q)uit?');
read(kbd,answer);
if upcase(answer) = 'Q' then begin writeln('FINISHED');halt;end;
if upcase(answer) <> 'R' then       {Write to 'Clues'.}
    begin
      writeln;writeln;
      assign(C1,'C1');
      textcolor(9);writeln('Now RESETing CLUE files.');highvideo;
            RESET(C1);
      writeln;
      writeln('Input a string not more than ',Max,' characters.',
              '  ''\''-Ends string.');
      x:=wherey;if(x>21)then x:=22;for stop:=1 to 3 do writeln;gotoxy(1,x);
      textcolor(11);
        repeat
          read(trm,letter);
          if letter = ^h then
            begin
              write(^h,' ',^h);
              delete(text1,length(text1),2);
            end;
          beep;
          if (letter <> '\') and (letter <> ^h) then text1:=text1+letter
        until (length(text1)=Max) or (letter='\');
        if letter = '\' then
          begin
            writeln;
            highvideo;
            writeln('Total of ',length(text1),' characters.');
          end;
        writeln; highvideo;
        writeln('Total description length = ',length(text1),' characters.');
      writeln('Now WRITING string to disk.');
      writeln('  At what position?  (Next open is # ',filesize(C1),')');
      textcolor(12);position:=position+1;readln(position);highvideo;
      Diskwrite(text1,position);
    end
else                      {Read from 'Clues'.}
  begin
    writeln;writeln;
    writeln('To the S)creen or the P)rinter');
    read(kbd,answer);
    if(upcase(answer)='P')then List:=True else List:=False;
    assign(C1,'C1');
    reset(C1);
    writeln('Filesize = ',filesize(C1),
            '  (From 0 to ',filesize(C1)-1,')');
    close(C1);
    writeln('Enter starting position:');
    textcolor(12);readln(start);highvideo;
    if(start > filesize(C1)-5)then stop:=(filesize(C1)-1) else
      begin
        writeln('Enter final position:');
        textcolor(12);readln(stop);highvideo;
      end;
    Diskread(start,stop);
  end;  {End of else clause.}
until false;     {End of Main loop.}
END.
