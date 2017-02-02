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
  Max = 234;

type
  MaxLength = string[Max];
  OneChar   = string[1];

var
  S1                : file of MaxLength;
  Position,Counter,
  Start,Stop,x      : integer;
  Text1             : MaxLength;
  Answer            : char;
  Letter            : OneChar;
  List              : boolean;

procedure Diskwrite(text1: MaxLength; pointer: integer);
  begin
    seek(S1,pointer);
    WRITE(S1,text1);
    writeln('SPECIAL decription ',pointer,
            ' is written!  Size = ',filesize(S1));
    close(S1);
  end; {End of Diskwrite.}

procedure Diskread(start,stop: integer);
var
counter : integer;
text1   : MaxLength;
  begin
   assign(S1,'S1');
   reset(S1);
   seek(S1,start);
    for counter:= start to stop do
      begin
        highvideo;
        READ(S1,text1);
        if list then
          begin
            writeln(lst,'Discription # ',counter);
            writeln(lst,text1);
          end
        else
          begin
            writeln('Here is SPECIAL description # ',counter);
            lowvideo;
            writeln(text1);
            highvideo;
          end;
      end;
    close(S1);
    write('The file contains ',filesize(S1),' SPECIAL descriptions.');
  end;  {End of Diskread.}

procedure Beep;
begin
 if(length(text1)in[68,146,224])then
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
if upcase(answer) <> 'R' then       {Write to 'SPECIAL'.}
    begin
      writeln;writeln;
      assign(S1,'S1');
      textcolor(9);writeln('Now RESETing SPECIAL files.');highvideo;
            RESET(S1);
      writeln;
      writeln('Input a string not more than ',Max,' characters.',
              '  ''\''-Ends string.');
      x:=wherey;if(x>17)then x:=18;for stop:=1 to 7 do writeln;gotoxy(1,x);
      textcolor(11);
        repeat
          read(trm,letter);
          if letter = ^h then
            begin
              if(wherex=1)then
               begin window(2,1,80,25);gotoxy(79,wherey-1)end;
              write(^h,' ',^h);
              delete(text1,length(text1),2);
              window(2,1,79,25);
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
      writeln('  At what position?  (Next open is # ',filesize(S1),')');
      textcolor(12);position:=position+1;readln(position);highvideo;
      Diskwrite(text1,position);
    end
else                      {Read from 'SPECIAL'.}
  begin
    writeln;writeln;
    writeln('To the S)creen or the P)rinter');
    read(kbd,answer);
    if(upcase(answer)='P')then List:=True else List:=False;
    assign(S1,'S1');
    reset(S1);
    writeln('Filesize = ',filesize(S1),
            '  (From 0 to ',filesize(S1)-1,')');
    close(S1);
    writeln('Enter starting position:');
    textcolor(12);readln(start);highvideo;
    if(start > filesize(S1)-5)then stop:=(filesize(S1)-1) else
      begin
        writeln('Enter final position:');
        textcolor(12);readln(stop);highvideo;
      end;
    Diskread(start,stop);
  end;  {End of else clause.}
until false;     {End of Main loop.}
END.


