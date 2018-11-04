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
(****************************************************************************)
(*                             DEFAULT ROUTINES                             *)
(*          >> Contains the default routines used by Supernova <<           *)
(*                        Programmer: Scott Miller                          *)
(*                      << Began February 2, 1985 >>                        *)
(*                      Copyright 1985 Scott Miller                         *)
(****************************************************************************)
procedure Default0;
begin
case Vb of

{ N, S, E, W, etc. }
1..8:case Prm of
     14..19:RL(26);
     21:RL(27);
     42..50:RL(279)
     else
      if Prm>7 then writeln('There is not a path leading ',up(Dir[Vb]),'.')
      else writeln('There is not passage in that direction.')
     end;

{ LOOK }
30:begin Brief:=Brief-[Prm];Describe(Prm);
    if(Prm=56)and(T[17]>4)then begin RS(114);RS(115);Pause;end;
   end;

{ SAVE }
82:Save;

{ RESTORE }
87:Restore;

 end {main case}
end; { Default0 }
{----------}
procedure Default1;
begin
case Vb of

{ INVENTORY }
16:if not(Inv=[]) then
    begin
     writeln('You have in your possession...');
     for o:=1 to MMax do
      begin
       if o in Inv then
        begin
         if o=6 then write('  some ',FN(o)) else write('  a ',FN(o));
         if o in Wear then write('  (being worn)');
         case o of
           5:if SatchCon<>Null then write('  (contains something)');
           7:if HolstCon<>Null then write('  (contains something)');
          29:if MugCon<>Null then write('  (has something in it)');
         end;if o in Inv then writeln;
        end;
      end;
    end
   else RL(28);

{ DROP }
18:if not(30 in NounSet)then
    for o:=1 to NMax do
     if o in NounSet then
      if o in Inv then
        begin
         write(FN(o),':  ');
         if o in Wear then
          writeln('First you must remove the ',FN(o),'.')
         else begin writeln('Dropped.');Inv:=Inv-[o];r[o]:=Prm;end;
        end
      else writeln('You don''t have the ',FN(o),'.')
     else begin;end
   else
    begin Min(17); { DROP ALL }
     for o:=1 to MMax do
      if o in Inv then
       begin
        write(FN(o),':  ');Add(17);
        if o in wear then
         writeln('First you must remove the ',FN(o),'.')
        else begin writeln('Dropped.');Inv:=Inv-[o];r[o]:=Prm;end;
       end;
     if not en(17)then RL(303)
    end;

{ DROP ALL BUT }
17:begin
    for o:=1 to MMax do
     if(o in Inv)and not(o in NounSet)then
      begin
       write(FN(o),':  ');
       if o in Wear then
        writeln('First you must remove the ',FN(o),'.')
       else begin writeln('Dropped.');Inv:=Inv-[o];r[o]:=Prm;end;
      end;
   end;

 end; {main case}
end; { Default1 }
{----------}
procedure Default2;
 label JUMP;
begin
case Vb of

{ ROOM DESCRIPTION }
77:if not(en(1))then begin Add(1);RL(14)end
   else begin Min(1);RL(15)end;

{ QUIT }
79:begin Bor(1,0);
    writeln('In ',Tic,' moves you scored ',Sc,
            ' out of a possible 1000 points.');
    writeln('If you want to continue this game at a later date you ',
            'should first use the');writeln('SAVE command.');
    write('Are you still sure you want to QUIT?  ');
    Cur(2);
    CFlag := readkey;
    if upcase(CFlag)='Y' then
     begin
      {$I-}
      RL(12);delay(2200);
      close(R1);close(R2);close(S1);close(L1);close(C1);close(T1);close(T2);
      window(1,1,80,25);nosound;clrscr;halt;
     end
    else RL(13);Bor(0,0);
   end;

{ SLEEP }
62:if(T[5]>32)and(T[8]<1)then
    if(N1 in[19,27,49,69,80,113])then
     begin T[2]:=6;Add(7);
      writeln('You lie down on the ',NStr,
              ' and fall asleep within a few minutes.');
     end
    else RL(16)
   else
    if N1 in[69,80] then
     begin
      T[5]:=230;PStat:=PStat-[5];Bor(0,0);Add(7);
      case N1 of
       69:if T[8]<1 then begin RS(41);Add(128) end
          else begin RS(42);Add(7);Add(10)end;
       80:if T[8]<1 then
           if not en(18)then RS(218)
           else case random(2)of 0:RS(218);1:RS(219)end
          else begin RS(220);Add(128) end
      end;
     end
    else writeln('The ',FN(N1),' is not a suitable place to sleep.');

{ SIT }
35:if(N1 in[16,32,35,49,54,69,71,80,83..86,98,110])then
    begin Add(7);
     case N1 of
      69:if T[8]<1 then begin RS(41);Add(128) end
         else begin RS(42);T[5]:=160;PStat:=PStat-[5];Add(7);Add(10)end
      else writeln('You sit down on the ',NStr,'.')
     end
    end
   else RL(17);

{ STAND }
32:if(en(7))then
    begin Min(7);Min(2);Min(3);Min(19);T[6]:=Null;RL(18)end
   else RL(19);

{ UP and CLIMB }
9,51:if(N1 in[32,35,54,68,71,80,81,83..86,89,98,112,125])then
      begin Add(8);
       writeln('You manage to climb up the ',NStr,'.');
      end
     else
      if(Vb=9)then writeln('There is not a path in that direction.')
      else RL(20);

{ DOWN }
10:if(en(8))then
    begin Min(8);RL(21)end
   else writeln('There is not a path in that direction.');

{ IN and OUT }
11,13:writeln('Due to the multiple paths you will have to be more specific.');

{ WAIT }
15:begin writeln('Time passes');y:=wherey;for x:=1 to 6 do
    begin gotoxy(11+x,y-1);write('.');sound(x*99);delay(30);end;
    nosound;writeln;if Region=4 then sound(20);if Region=5 then sound(60);
   end;

 end; {main case}
end; { Default2 }
{----------}
procedure Default3;
begin SFlag:=false;
case Vb of

{ EXAMINE }
28:begin
   case N1 of
   1:if en(41) then RS(116) else begin RS(116);RS(132);Score(5,41)end;
   2:RL(454);
   3:RL(45);
   4:RL(294);
   5:begin RL(105);if SatchCon<>Null then
      if SatchCon=6 then writeln('The satchel contains ',FN(SatchCon),'.')
      else writeln('The satchel contains a ',FN(SatchCon),'.')
     end;
   6:begin RL(54);case FoodCon of 1:RL(55);2:RL(56);3:RL(57);4:RL(58)end end;
   7:begin RL(579);if HolstCon=Null then RL(580)else
      writeln('The gun strap contains a ',FN(HolstCon),'.')end;
   8:RL(59);
   9:RL(374);
   10:RL(262);
   11:RL(311);
   12:RB2(6,13);
   16:RL(151);
   17:RL(263);
   18:if en(34) then begin Score(5,116);RS(92)end else RL(267);
   19:begin RB(12,11);Pause end;
   20:RL(372);
   22:begin RL(527);if 22 in Socket then RL(528)end;
   23:begin RL(529);if 23 in Socket then RL(528)end;
   24:begin RL(530);if 24 in Socket then RL(528)end;
   25:begin RL(531);if 25 in Socket then RL(528)end;
   26:RL(455);
   28:if NStr='badge' then RL(406)else if Md=1 then RL(407)else RL(408);
   29:begin write('The mug is quite small.  ');
       if MugCon=Null then RL(60)else RL(61)end;
   42:begin RS(195);RS(196)end;
   54:if NStr='column' then begin RS(195);RS(196)end;
   56:begin RL(92);if Prm in[81..88]then RL(423)end;
   62:case Prm of 21,25:RS(15);22,24:RS(246)end;
   99:RL(63);
   103:case Prm of 24..34,59,60:RL(317)else RL(326)end;
   113:RR(Prm);
   123:RS(159);
   124:RL(62)
   end; {case}
   if not SFlag then
    case random(20) of
    0..6:writeln('You can''t find anything unusual about the ',FN(N1),'.');
    7..14:writeln('You see nothing special about the ',FN(N1),'.');
    15..17:writeln('It looks like any other ',NStr,' you''ve ever seen.');
    18..20:writeln('It looks like an ordinary ',NStr,'.')
    end
   end;

{ EAT }
47:if N1=6 then
    begin RL(68);FoodCon:=FoodCon-1;T[3]:=175;PStat:=PStat-[2];Bor(0,0);
     if FoodCon=0 then begin Van(6);RL(69)end
    end
   else writeln('The ',NStr,' would not do much for your digestive system.')

 end {main case}
end; { Default3 }
{----------}
procedure Default4;
begin
case VB of

{ GET }
39:begin
    Weight:=Null;Min(17);
    for o:=1 to MMax do if o in Inv then
     begin Weight:=Weight+1;if o=11 then Weight:=Weight+3 end;
    if not(30 in NounSet)then
     for o:=1 to NMax do
      if o in NounSet then
       if o in Mov then
        begin
         write(FN(o),':  ');
         Weight:=Weight+1;if o=11 then Weight:=Weight+3;
         if Weight<9 then
          if not(o in Inv)then
           if(o in Socket)and not(26 in Wear)then RL(524) else
            begin if(o=PyraCon)and(o=9)then Walls(8);
             writeln('Taken.');Van(o);Inv:=Inv+[o];
            end
          else writeln('You already have that.')
         else
          begin RL(587);
           if o=11 then Weight:=Weight-3;
          end
        end
       else begin write(FN(o),':  ');
        if N1 in[32,35,80,83..86,90,121]then RL(502)else crazy;end
      else begin;end
    else
     begin  { GET ALL }
      for o:=1 to MMax do
       if o in Mov then
        if r[o]=Prm then
         begin
          write(FN(o),':  ');Add(17);
          Weight:=Weight+1;if o=11 then Weight:=Weight+3;
          if Weight<9 then
           if(o in Socket)and not(26 in Wear)then RL(524) else
            begin writeln('Taken.');Van(o);Inv:=Inv+[o]end
          else
           begin RL(587);
            if o=11 then Weight:=Weight-3;
           end
         end;
      if not en(17)then RL(29)
     end
   end;

{ GET ALL BUT }
37:begin
    Weight:=Null;Min(17);
    for o:=1 to MMax do if o in Inv then
      begin Weight:=Weight+1;if o=11 then Weight:=Weight+3 end;
     for o:=1 to MMax do
      if(o in Mov)and not(o in NounSet)then
       if r[o]=Prm then
        begin
         write(FN(o),':  ');
         Weight:=Weight+1;if o=11 then Weight:=Weight+3;
         if Weight<9 then
          if(o in Socket)and not(26 in Wear)then RL(524) else
           begin writeln('Taken.');Van(o);Inv:=Inv+[o];Add(17)end
         else
          begin RL(587);
           if o=11 then Weight:=Weight-3;
          end
        end;
     if not en(17)then RL(29)
   end;

 end; {main case}
end; { Default4 }
{----------}
procedure Default5;
 label JUMP,JUMP1;
begin
case Vb of

{ PURCHASE }
64:if Prm=8 then
    if N1=100 then RS(10) else
    if(N1 in[29,99])or(Pr=11)then
     if Pr in[6,9] then
      if N2 in[8,111] then
       if Here(8) then
        begin Inv:=Inv+[29];Van(8);Score(15,21);RS(11);T[1]:=21;Add(9);Add(16)
        end
       else RL(39)
      else RL(40)
     else
      if Pr=11 then
       if(N1 in[29,99,111,124])and(N2 in[29,99,111,124])then begin
        if(N1=111)xor(N2=111)then RL(196)else
        if(N1=124)xor(N2=124)then RL(197)
        else crazy end
       else crazy
      else NoSense
    else
     if N2<>124 then RL(34) else RL(35)
   else
    if Prm=AlienRm then RL(35) else
    if Prm=FriendRm then RL(36)
    else RL(38);

{ DRINK }
46:if N1=Null then
    if Here(29) then
     if(Prm=8)and not(29 in Inv)then RL(67) else
JUMP: if MugCon<>Null then
       case MugCon of
        99:begin MugCon:=Null;T[4]:=130;Bor(0,0);PStat:=PStat-[6];RL(64)end;
        79:begin MugCon:=Null;T[4]:=130;Bor(0,0);PStat:=PStat-[6];RL(66);
            Van(79)end;
        92:JUMP1:begin MugCon:=Null;
            if T[12]<2 then RL(162)else
            if en(42) then begin RS(136);Van(92);T[12]:=Null;Bor(0,0);
             PStat:=PStat-[3];Score(20,124)end
            else RL(162)
           end;
       end
      else RL(65)
    else
     if Here(98) then  { For the Sink }
      if SinkRm=Prm then begin T[4]:=130;Bor(0,0);PStat:=PStat-[6];RL(66)end
      else RL(67)
     else RL(67)
   else  { If N1 = something }
    case N1 of
     29,99:if 29 in Inv then goto JUMP else RL(87);
     98:if SinkRm=Prm then begin T[4]:=130;Bor(0,0);PStat:=PStat-[6];RL(66)end
        else RL(67);
     121,66:begin RS(12);Add(128);end;
     92:goto JUMP1;
     79:begin
         if(Here(29)and(MugCon=79))then
          begin T[4]:=130;Bor(0,0);MugCon:=Null;Van(79);PStat:=PStat-[6];
           RL(66)end
         else if Here(79)then begin T[4]:=130;Bor(0,0);PStat:=PStat-[6];
               RL(66)end
              else RL(67);
        end
     else writeln('The ',NStr,' would not quench your thirst.')
    end;

 end; {main case}
end; { Default5 }
{----------}
procedure Default6;
 function Word(W:Str29):boolean;
  begin if pos(' '+W+' ',input)>0 then Word:=true else Word:=false end;
begin
case Vb of

{ TALKING TO CHARACTERS}
66..69,71:
  begin Spaces(input);
   if Vb=66 then  { Bartender }
    if Here(111)then
     if Word('follow')then RL(46)else
     if Word('go')or Word('east')or Word('south')then RL(567)else
     if Word('hi')or Word('hello')then RL(51)else
     if Word('infocom')then RL(498)else
     if Word('scott')or Word('miller')then RL(499)else
     if Word('what')or Word('why')or Word('where')or Word('who')or
        Word('how')or Word('which')or Word('when')then RL(463)else
     if(Word('ill')or Word('give')or Word('buy')or Word('get me')or
        Word('purchas'))and(Word('drink')or Word('glunk'))then RL(47)else
     if Word('ambross')or Word('pink')or Word('bloody')or Word('foeboz')or
        Word('ztulctw')then RL(565)else
     if Word('kill')or Word('fight')or Word('hit')then RL(566)else
     if Word('give')then RL(564)else
     if Word('help')or Word('tell me')then RL(479)else
     case random(3) of 0:RL(50); 1:RL(480); 2:RL(481)end
    else RL(52);
   if Vb=67 then  { Two Aliens }
    if Here(124)then
     if Word('follow')then RL(48)else
     if Word('go')or Word('south')or Word('east')then RL(568)else
     if Word('crystal')then RL(484)else
     if Word('coordin')or Word('where')or Word('world')or Word('sagan')or
        Word('planet')or Word('locatio')then RL(485)else
     if Word('what')or Word('why')or Word('who')or Word('tell me')or
        Word('how')or Word('which')or Word('when')then RL(464)else
     case random(3) of 0:RL(49); 1:RL(482); 2:RL(483)end
    else RL(53);
   if Vb=68 then  { Scientist }
    if here(123)then
     if Word('follow')then RL(440)else
     if Word('hi')or Word('hello')or Word('bye')then RL(441)else
     if Word('wristba')then RL(442)else
     if Word('card')or Word('green')then RL(459)else
     if Word('give')then RL(456)else
     if Word('go')or Word('east')or Word('west')then RL(457)else
     if Word('help')then RL(462)else
     if Word('ship')or Word('planets')then RL(497)else
     if Word('star')or Word('superno')then RL(486)else
     if(Word('crystal')or Word('clear'))and((T[24]>1)and(T[24]<6))and
       (1 in Inv)then begin T[24]:=Null;T[25]:=7;RS(181)end else
     if(Word('crystal')or Word('clear'))and((T[23]>1)or(T[24]>5))then
      RL(446)else
     if Word('crystal')or Word('clear')then RL(487)else
     if(Word('who')or Word('what'))and Word('you')then RL(461)else
     if Word('what')or Word('why')or Word('where')or Word('who')or
        Word('how')or Word('which')or Word('when')or
        Word('tell me')then RL(458)else
     case random(3) of 0:RL(443); 1:RL(477); 2:RL(478)end
    else RL(439);
    if Vb=69 then  { Robot }
     if here(46)then RL(508)
     else RL(584);
    if Vb=71 then  { Computer }
     if here(37) then RL(545)
     else RL(546)
  end; {characters}

 end; {main case}
end; { Default6 }
{----------}
procedure Default7;
begin
case Vb of

{ READ }
31:case N1 of
    12:RB2(6,13);
    19:begin RB(12,7);Pause end
    else writeln('There is nothing on the ',FN(N1),' to read.')
   end;

{ TOUCH }
75:if 26 in Wear then RL(571)else
    case N1 of
     1,22..25:if N1 in Socket then RL(569)else RL(570);
     79:RL(552);
     120:RL(551);
     34,103,115:writeln('You can''t reach the ',NStr,'.')
     else writeln('You feel nothing unusual about the ',NStr,'.')
    end;

{ TASTE }
84:case N1 of
    6:RL(377);
    29,92,99:if MugCon=99 then RL(70) else RL(71);
    111:RL(466)
    else writeln('It tastes like a ',NStr,' should taste.')
   end;

{ SMELL }
83:case N1 of
    6:RL(378);
    29,99:if MugCon=99 then RL(72)else RL(599);
    111:RL(466)
    else
     if Prm in[42..50]then RL(572)
     else writeln('It smells like an ordinary ',NStr,'.')
   end;

{ LISTEN }
65:case N1 of
    42:RL(501);
    62:if Region=4 then RL(573)else RL(574);
    111:RL(73)
    else writeln('The ',NStr,' is not making any sound.')
   end;

{ HELLO }
80:if(word='hi')or(word='hello')then writeln('Hello to you.') else RL(74);

{ YES/NO/MAYBE }
81:RL(random(6)+75);

{ COMMANDS }
95:begin RB(4,11);Pause;RB(6,11);Pause;end;

{ ATTACK }
93:if Pr=6 then
    if(N2 in Mov)or(N2=60)then
     case N1 of
      60:begin Cur(2);write('Are you sure? ');CFlag := readkey;Cur(3);writeln;
          if upcase(CFlag)='Y' then begin RL(488);Add(128);end
          else writeln('Whew!')end;
      123:RL(465);
      124:case random(6) of
           0:RL(175);
           1:begin RL(176);Add(7)end;
           2:begin RL(177);Van(N2);R[N2]:=Prm;end;
           3:begin RS(33);T[3]:=26;T[4]:=23;T[5]:=33;end;
           4:begin RS(34);Van(N2);Prm:=13;Add(7)end;
           5:begin RS(36);T[7]:=9;PStat:=PStat+[4];Add(7)end
          end
      else writeln('The ',FN(N1),' offers no resistance.')
     end
    else crazy
   else NoSense;

 end; {main case}
end; { Default7 }
{----------}
procedure Default8;
 label JUMP;
begin
case Vb of

{ TURN }
50:if Pr=Null then   {eg. turn knob}
    case N1 of
     48:JUMP:begin
         if Prm=SinkRm then begin SinkRm:=Null;L[Prm]:=L[Prm]-[79];RL(81)end
         else if Prm in[5,12] then
               begin SinkRm:=Prm;L[Prm]:=L[Prm]+[79];RL(82)end
              else RL(540)
        end
     else RL(83)
    end {case}
   else
    if input='' then  {eg. turn sink on}
     case N1 of
      2:begin RL(460);Score(5,123);
        case random(4)of
         0:for i:=20 to random(99)+50 do play(20,i,1);
         1:for i:=random(5000)+4500 downto 20 do begin sound(i);
            delay(1);sound(31)end;
         2:begin i:=random(9999)+1;x:=0;repeat j:=random(9999);play(j,i,0);
            i:=random(9999)+1;play(i,j,0);x:=x+1;until x>9 end;
         3:for x:=1 to 200 do begin i:=random(9999)+1;play(i,i,1);delay(16)end
        end;nosound;if Region=5 then sound(60);
       end;
      37,38:RL(373);
      48,79,98:goto JUMP;
      46:RL(360);
      127:if NStr<>'window' then RL(360);
      131:RL(84)
      else crazy
     end
    else             {eg. turn dial to 123}
     if Pr=1 then
      if N1=48 then
       case Prm of
        79:begin;end;
       end
      else crazy
     else NoSense;

{ OPEN and UNLOCK }
41,88:
  if N1=5 then RL(289)
  else
   if N2=Null then
    case N1 of { if N1 only }
     56:RL(409)
     else RL(100)
    end
   else
    if Pr=6 then
     if N1=56 then
      if Prm in[9,11] then
       if N2=3 then RL(101)
       else crazy
      else
       if Prm=10 then
        if N2=3 then begin RL(102);Add(11)end
        else crazy
       else RL(103)
     else
      if N1 in[32,38,45,55,62,68,69,78,89,90,119] then RL(103)
      else crazy
    else NoSense;

 end; {main case}
end; { Default8 }
{----------}
procedure Default9;
 label JUMP;
begin
case Vb of

{ LOOK INSIDE }
24:case N1 of
    5:if SatchCon<>Null then writeln('The satchel contains ',FN(SatchCon),'.')
      else RL(110);
    7:if HolstCon=Null then RL(580)else
       writeln('The gun strap contains a ',FN(HolstCon),'.');
    18:if en(34)then RL(270)else RL(271);
    29:if MugCon<>Null then writeln('The mug contains ',FN(MugCon),'.')
       else RL(111);
    35:if NStr='toilet' then RL(114)else RL(113);
    10,26,28,32,62,64,69,98,113:writeln('The ',NStr,' is empty.');
    119:RL(112);
    103..109,115,118:if Prm=63 then RL(113)else RL(115)
    else RL(113)
   end;

{ LOOK UNDER, LOOK BEHIND and REACH IN }
20,26,76:
   case N1 of
    5:if SatchCon<>Null then writeln('The satchel contains ',FN(SatchCon),'.')
      else RL(110);
    80:if not en(127) then begin RS(16);Add(127)end else RL(116);
    103..109,115,118:if Prm=63 then RL(113)else RL(115)
    else RL(116)
   end;

{ LOOK ON TOP }
22:case N1 of
    66:RL(117);
    80:RL(118);
    99:RL(119);
    103..109,115,118:if Prm=63 then RL(113)else RL(115)
    else RL(120)
   end;

{ CLUE }
70:begin if Sc<25 then begin RL(302);goto JUMP;end;
    if not en(15) then
     begin Add(15);RS(30);
      Cur(2);
      write('Do you still wish to see the clue? ');CFlag := readkey;writeln;
      if upcase(CFlag)='N' then
       begin writeln('OK, no clue will be shown.');goto JUMP;end
     end;
    Cn('---Here is your clue---');Sc:=Sc-25;
    if(Prm<>StoreC)then
     begin StoreC:=Prm;
      seek(C1,Prm);
      read(C1,Text5)
     end;
    col(12,9);Cn(Text5);col(11,7); JUMP:
   end; { Read Clue }

 end; {main case}
end; { Default9 }
{----------}
procedure Default10;
begin
case Vb of

{ PUT }
33:begin SFlag:=False;if VStr='fill' then begin x:=N1;N1:=N2;N2:=x;end;
    if((N1 in Mov)and(N1 in Inv))or(N1 in[66,79])then
     case N2 of
      64:case Prm of
         34:if N1 in[3,8,9] then
             if Pr=5 then
              if PyraCon=Null then
               begin Van(N1);R[N1]:=34;PyraCon:=N1;
                if N1=9then begin RS(83);Walls(8);Add(30)end else RL(224)
               end
              else RL(223)
             else RL(222)
            else RL(221);
         end;
     126:if en(31) then
          if N1 in[3,8,9] then
           if Pr in[1,5,7,10] then
            if HingeCon=Null then
             begin Van(N1);R[N1]:=34;HingeCon:=N1;RL(231)end
            else RL(230)
           else NoSense
          else RL(229)
         else RL(232);
      35:if Prm=1 then
          if N1=16 then
           begin Van(16);Add(6);R[16]:=1;RL(144);Score(5,25)end
          else begin RL(143);Van(N1);R[N1]:=1;end;
      120:begin RL(550);Van(N1)end;
      62:if Prm in[22,24] then
          if en(23) then begin Van(N1);R[N1]:=2;RL(134)end else RL(99);
      66:begin if random(2)=0 then RL(375)else RL(376);Van(N1)end;
      42:RL(495);
      29:if MugCon=Null then
          if N1 in[3,4,9,17,19,66,79,99] then begin
           writeln('The ',FN(N1),' is now in the mug.');
           if N1 in Mov then Van(N1);L[Prm]:=L[Prm]+[N1];MugCon:=N1;end
          else if N1 in Mov then RL(137)else crazy
         else RL(136);
      5 :if SatchCon=Null then
          if N1 in[3,4,6,8,9,12,17,19] then
           begin Van(N1);L[Prm]:=L[Prm]+[N1];SatchCon:=N1;
            writeln('The ',FN(N1),' is now in the brown satchel.')end
          else if N1 in Mov then RL(137)else crazy
         else RL(138);
      7 :if HolstCon=Null then
          if N1 in[3,4,8,9,12,17,19] then
           begin Van(N1);L[Prm]:=L[Prm]+[N1];HolstCon:=N1;
            writeln('The ',FN(N1),' is now in the holster.')end
          else if N1 in Mov then RL(137)else crazy
         else RL(581);
     end {main N2 case}
    else writeln('First you must have the ',FN(N1),'.');

     if not SFlag then
      case Pr of
       1:if N2 in[32..37,49,71,80,83..87,90,93,98,113,112,126,132] then
          begin Van(N1);R[N1]:=Prm;
           writeln('The ',FN(N1),' is now on the ',FN(N2),'.')end
         else RL(139);
       5:RL(139);
       7:if N2 in[32,35,37,49,51,54,56,62,66..73,80..87,89,90,94..98,104,112,
                  113,116,120..122,125..128,132] then
          begin Van(N1);R[N1]:=Prm;
           writeln('The ',FN(N1),' is now beside the ',FN(N2),'.')end
         else RL(139);
      10:if N2 in[80,81,83..86,98,104,112] then
          begin Van(N1);R[N1]:=Prm;
           writeln('The ',FN(N1),' is now under the ',FN(N2),'.')end
         else RL(139)
       else crazy
      end

   end

 end; {main case}
end; { Default10 }
{----------}
procedure Default11;
begin
case Vb of

{ PUSH and TURN ON }
44:if(VStr='turn on')or(VStr='activat')then
    case N1 of
     2:begin RL(460);Score(5,117);
        case random(4)of
         0:for i:=400 to random(250)+420 do play(400,i,1);
         1:begin y:=random(35)+2;for x:=1 to 99 do
            begin i:=random(9000)+60;play(i,i,y);delay(y)end end;
         2:for x:=1 to random(230)+21 do
            for y:=1 to random(230)+22 do sound(x*y);
         3:for i:=1 to random(9999)+999 do sound(random(i)+i);
        end;nosound;if Region=5 then sound(60);
       end;
     37,38:RL(373);
     98,48:if Prm=SinkRm then say('water','flowing out')
        else begin SinkRm:=Prm;L[Prm]:=L[Prm]+[79];RL(82)end;
     127:if NStr<>'window' then RL(360)
     else RL(164)
    end
   else
    case N1 of
     116:if Prm in[42..50]then RL(282)else RL(281);
     123:RL(472)
     else RL(103)
    end;

{ PULL and TURN OFF }
42:if(VStr='turn off')or(VStr='deactiv')then
    case N1 of
     98,48,79:if Prm<>SinkRm then say('water','off')
        else begin SinkRm:=Null;L[Prm]:=L[Prm]-[79];RL(81)end;
     127:if NStr<>'window' then RL(360)else RL(165)
     else RL(165)
    end
   else RL(103);

{ CLEAN }
94:case N1 of
    18:if en(34) then RL(265) else
        begin if 18 in L[41] then R[18]:=41;Score(15,34);
         RS(91);n[18]:='glass ball\ball\glass\';;;end;
    126:if NStr='bar' then RL(167);
    80:RL(166);
    98:RL(168)
    else writeln('The ',NStr,' doesn''t need to be cleaned.');
   end;

{ RESTART }
86:begin Bor(1,0);Cur(2);
    write('Are you sure you want to restart your game? ');
    CFlag := readkey;
    if upcase(CFlag)<>'Y' then RL(169)
    else
     begin RL(170);delay(2000);window(1,1,80,25);clrscr;Bor(0,0);nosound;
      {$I-}
      close(R1);close(R2);close(S1);close(L1);close(C1);close(T1);close(T2);
      halt(executeProcess(ParamStr(0), '', []));
     end;Bor(0,0);
   end;

{ SHOOT }
89:RL(171);

{ TIE and UNTIE }
90:if VStr='tie' then RL(172)else if VStr='untie' then RL(173)else RL(437);

{ FIND }
73:if N1 in Inv then
    writeln('You are carrying the ',NStr,'.')
   else writeln('The ',NStr,' is close by, just look around.');

 end; {main case}
end; { Default11 }
{----------}
procedure Default12;
begin
case Vb of

{ HIT and BREAK }
54:if N2<>Null then
    if(N2 in Mov)or(N2=60)then
     if N1<>N2 then
      if Pr in[3,6] then
       case N1 of
        1:if(Prm=56)and(1 in L[56])then RL(300)else RL(83);
        18:if N2 in[10,11,29] then begin RS(97);Van(18);R[4]:=Prm;end
           else RL(272);
        123:RL(416)
        else RL(273)
       end {case}
      else NoSense
     else crazy
    else crazy
   else { N2=Null }
    case N1 of
     18:RL(274)
     else
      if random(3)=0 then
       writeln('At the last moment you decide to spare the ',NStr,'''s life!')
      else writeln('Hitting the ',NStr,' doesn''t help.')
    end;

{ THROW }
48:if N2<>Null then
    if N1 in Inv then
     if N1 in Mov then
      if N1<>N2 then
       if Pr in[1..5] then
        begin
         if(N1=29)and(MugCon in[79,92,99])then begin
          MugCon:=Null;RL(585);SFlag:=false;end;
         if(N2=1)and(Prm=56)and(1 in L[56])then
          begin Van(N1);R[N1]:=56;RL(301)end;
         if(N2=49)and(Prm=56)and(N1 in[1,10,18,29])then
          begin RS(112);Add(128);end;
         if(N2=69)and(Prm=91)then begin RS(160);L[91]:=L[91]+[123];
          L[91]:=L[91]-[44,129];T[23]:=15;Add(51);Van(N1);R[N1]:=91;end;
         if(N1 in[1,22..25])then begin Van(N1);RL(430)end;
         if(N2=46)and(Prm in[99,101])then begin RL(514);Blast;
          if Prm=99 then T[27]:=2000 else T[28]:=2000;Van(N1)end;
         case N2 of
          1,22..25:begin Van(N2);RL(431)end;
          42:begin Van(N1);RL(515)end;
          66:begin RL(375);Van(N1)end;
          111:begin RL(449);Van(N1)end;
          120:begin RL(550);Van(N1)end;
          123:begin RL(450);RL(451);Van(N1);R[N1]:=Prm;end;
          124:begin RL(452);RL(453);Van(N1);R[N1]:=Prm;end;
          127:if Prm=64 then if Md=3 then begin RL(537);Add(128);end else RL(538);
         end;
         if(N1=18)or(N2=18)then
          begin Van(N1);R[N1]:=Prm;Van(18);RS(97);R[4]:=Prm;end;
         if not SFlag then begin writeln('The ',FN(N1),' collides with the ',
         FN(N2),', but nothing interesting happens.');Van(N1);R[N1]:=Prm;end
        end
       else NoSense
      else crazy
     else crazy
    else writeln('First you must have the ',FN(N1),'.')
   else { N2=Null }
    begin Van(N1);R[N1]:=Prm;RL(275)end;

 end; {main case}
end; { Default12 }
{----------}
procedure Default13;
begin
case Vb of

{ CLOSE }
53:case N1 of
    5:RL(289);
    56:RL(92)
    else writeln('The ',NStr,' is not something that can be closed.')
   end;

{ SCORE }
78:begin col(11,7);
    write('In ');col(12,9);write(Tic);col(11,7);
    write(' moves you scored ');col(12,9);write(Sc);col(11,7);
    writeln(' out of a possible 1000 points.');
    write('This score earns you the rank of ');col(12,9);
    case Sc of
    0..9:writeln(Up('ABSOLUTE BEGINNER!'));
    10..99:write('Rookie');
    100..179:write('Struggling');
    180..259:write('Novice');
    260..349:write('Competent');
    350..449:write('Fair');
    450..549:write('Good');
    550..649:write('Great');
    650..744:write('Brilliant');
    745..829:write('Genius');
    830..899:write('Elite');
    900..949:write('Champion');
    950..1000:write('Galaxy Class')
    end;
    if Sc>9 then writeln(' Adventurer.')
   end;

{ REPAIR }
74:RL(357);

{ FOLLOW }
91:if VStr='follow' then
    case N1 of 123:RL(358);124:RL(359)
     else writeln('Why, did the ',NStr,' leave?')
    end else RL(432+random(5)); { for Scott in VOCAB! }

{ WEAR }
72:if N1 in[7,20,26,28]then
    if N1 in Inv then
     if not(N1 in Wear)then
      begin Wear:=Wear+[N1];writeln('You are now wearing the ',FN(N1),'.');
       if(Prm in[102..105])and(N1=20)then RL(503);
      end
     else writeln('You are already wearing the ',FN(N1),'.')
    else writeln('First you must have the ',FN(N1),'.')
   else crazy;

{ REMOVE }
19:if N1 in Wear then begin Wear:=Wear-[N1];
    writeln('You are no longer wearing the ',FN(N1),'.');
    if Prm in[102..105]then RL(492)end
   else writeln('You are not wearing the ',FN(N1),' to begin with.');

{ TYPE }
56:if here(37)or here(52)then RL(273)else RL(361);

 end; {main case}
end; { Default13 }
{----------}
procedure Default14;
begin
case Vb of

{ SHOW / GIVE }
49:if N2 in[46,111,123,124]then
    if Pr=1 then
     case N2 of
      46:RL(447);
      111:if N1=8 then begin Inv:=Inv+[29];Van(8);Score(10,21);RS(11);
           T[1]:=21;Add(9);Add(16)end
          else RL(444);
      124:RL(445);
      123:RL(446)
     end
    else nosense
   else crazy;

{ JUMP }
59:if N1<>Null then
    if(VStr='jump over')or(VStr='leap over')or(VStr='jump across')then
     if N1 in[1..29,36,49,51,69,71,73,132]then
      writeln('You land on the other side of the ',NStr,'.')
     else crazy
    else
     if(VStr='jump off')and en(8)then begin RL(475);Min(8)end else
     if N1 in[34,56,60,62,68,72,82,92] then crazy else
     if(N1 in[1..29])and not(N1 in Inv)then
      writeln('You land on the ',NStr,'.')
     else
      if NStr='quicksa' then begin RL(582);Add(128)end else
      if NStr='swamp' then begin RL(583);Add(128)end
      else RL(476)
   else
    if(VStr='jump off')and en(8)then begin RL(475);Min(8)end
    else RL(539);

{ DIG }
92:case N1 of
    49,116,122:RL(556);
    120:RL(557)
    else crazy
   end;

{ TALK / GREET }
21:if VStr='greet' then
    case N1 of 111:RL(51); 124:RL(46); 123:RL(441) else crazy end
   else
    if N1 in[111,123,124] then
     begin writeln('To talk to the ',FN(N1),' enter:');
      writeln(FN(N1),', < what you want to say goes here >')
     end
    else crazy;

25:RS(245);

 end; {main case}
end; { Default14 }
{----------}
procedure DeadMain;
  label JUMP;
 begin writeln;
  gotoxy(1,20);for x:=5 downto 1 do
   begin writeln;delay(99);sound(300+(x*50));Bor(x,7)end;
  repeat x:=random(14)+1 until not(x in [4,12]);
  gotoxy(1,15);col(x,15);bak(4,7);
  writeln('***************************************',
          '***************************************');
  delay(99);sound(300);Bor(6,0);
  gotoxy(1,16);for x:=3 downto 1 do begin
  write('*                                      ',
        '                                      *');
        delay(99);sound(100+(x*50));Bor(x+8,15)end;gotoxy(1,19);
  write('***************************************',
        '***************************************');
  delay(99);sound(100);Bor(14,0);
  gotoxy(30,17);col(16,31);write('YOU HAVE DIED!!!');delay(99);sound(50);
  gotoxy(1,20);bak(0,0);col(11,7);Bor(12,7);writeln;delay(99);nosound;
  delay(999);i:=random(3)+2;
  tune(i,3,830);tune(i,3,770);tune(i,3,200);tune(i,3,0);delay(800);
  tune(i,6,400);tune(i,5,400);tune(i,5,400);
  tune(i,3,400);tune(i,3,400);tune(i,2,400);tune(i,3,810);
  JUMP: Col(11,7);Cur(2);
  repeat
   write('Would you like to ');Col(14,15);write('S');Col(11,7);
   write('tart a new game, ');Col(14,15);write('R');Col(11,7);
   write('estore or ');Col(14,15);write('Q');Col(11,7);write('uit? ');
   CFlag := readkey;CFlag:=upcase(CFlag);Col(9,15);writeln(CFlag);
   play(500,500,40);Col(11,7);
  until CFlag in['S','R','Q'];Bor(0,0);Cur(3);
  case CFlag of
   'S':begin RL(170);delay(1500);window(1,1,80,25);clrscr;
        {$I-}
        close(R1);close(R2);close(S1);close(L1);close(C1);close(T1);close(T2);
        halt(executeProcess(ParamStr(0), '', []));
       end;
   'R':begin Min(126);Restore;if not en(126)then goto JUMP end;
   'Q':begin window(1,1,80,25);clrscr;Col(3,7);
        close(R1);close(R2);close(S1);close(L1);close(C1);close(T1);close(T2);
        writeln('In ',Tic,' moves you scored ',Sc,
                ' out of a possible 1000 points.');writeln;
        Col(31,16);Bak(1,7);writeln('Good-bye!');writeln;Cur(1);
        HALT;
       end
  end {case}
 end; {DEAD}

procedure DEAD; begin DEADMAIN end;
procedure Call13; begin Default13 end;
{************************* END OF DEFAULT ROUTINES **************************}

