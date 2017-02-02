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
(*****************************************************************************)
(*                                VOCABULARY                                 *)
(*                >> Contains the word list for Supernova <<                 *)
(*                         Programmer: Scott Miller                          *)
(*                       << Began February 2, 1985 >>                        *)
(*                       Copyright 1985 Scott Miller                         *)
(*****************************************************************************)

                       {VERB LIST:  GROUPS ALL SYNONYMS}
overlay procedure Assign1;
begin
v[1]:='north\n\fore\f\';
v[2]:='south\s\aft\a\';
v[3]:='east\e\starboa\st\';
v[4]:='west\w\port\p\';
v[5]:='ne\northea\';
v[6]:='nw\northwe\';
v[7]:='se\southea\';
v[8]:='sw\southwe\';
v[9]:='up\u\climb up\climb u\';
v[10]:='down\d\climb down\climb d\';
v[11]:='enter\in\land in\land on\';       {cont}
v[12]:='land\cross\across\';
v[13]:='exit\out\leave\retreat\';         {cont}
v[14]:='escape\';
v[15]:='wait\z\rest\relax\';
v[16]:='invento\i\ex invento\inv\';
v[17]:='drop all but\drop all except\';
v[18]:='drop\get rid\put down\let go\';
v[19]:='take off\remove\';
v[20]:='l behind\ex behind\l beside\';
v[21]:='talk to\talk\speak to\greet\';
v[22]:='l above\ex on\l on top\';         {cont}
v[23]:='ex above\ex top\l on\';
v[24]:='l in\ex in\l through\l out\';
v[25]:='say\speak\';
v[26]:='l under\ex underne\ex under\';    {cont}
v[27]:='l underne\ex below\';
v[28]:='ex\search\l at\describ\';         {cont}
v[29]:='study\check\inspect\';
v[30]:='l around\l\';
v[31]:='read\';
v[32]:='stand up\get up\stand\';
v[33]:='put\pour\lay\fill\insert\';       {cont}
v[34]:='place\slide\stick\';
v[35]:='sit on\sit in\sit down at\';      {cont}
v[36]:='get in\sit at\sit\sit down\';
v[37]:='get all but\get all except\';     {cont}
v[38]:='take all but\get everyth but\';
v[39]:='get\take\grab\steal\pick up\';    {cont}
v[40]:='catch\grasp\snatch\';
v[41]:='open\unfaste\';
v[42]:='pull on\flick\pull\flip off\';    {cont}
v[43]:='flip\turn off\deactiv\';
v[44]:='push\move\press\turn on\';        {cont}
v[45]:='activat\flip on\push on\';
end; { Assign1 }
overlay procedure Assign2;
begin
v[46]:='drink some\drink from\drink\';
v[47]:='eat\swallow\digest\consume\';
v[48]:='throw\toss\';
v[49]:='give\offer\show\hand\';
v[50]:='turn\rotate\set\spin\';
v[51]:='climb in\climb over\';            {cont}
v[52]:='climb on\climb\';
v[53]:='close\shut\fasten\connect\';
v[54]:='destroy\punch\knock on\break\';   {cont}
v[55]:='hit\knock\smash\strike\';
v[56]:='type in coordin\type coordin\';   {cont}
v[57]:='type in keyboar\type in\';        {cont}
v[58]:='type on\type on keyboar\type\';
v[59]:='jump in\jump over\jump on\';      {cont}
v[60]:='jump off\leap over\hop\';         {cont}
v[61]:='jump across\jump\leap\hop\';
v[62]:='sleep in\lie down\sleep on\';     {cont}
v[63]:='sleep\';
v[64]:='buy\purchas\pay for\order\';
v[65]:='listen to\listen\hear\';
v[66]:='bartend\waiter\';                  { Characters }
v[67]:='two aliens\alien\aliens\';
v[68]:='scienti\man\him\';
v[69]:='robot\droid\';
v[70]:='help me\pray\clue\help\';
v[71]:='compute\';
v[72]:='wear\don\';
v[73]:='find\where is\where\';
v[74]:='repair\fix\';
v[75]:='touch in\feel\touch\rub\';
v[76]:='reach in\reach under\reach\';
v[77]:='descrip\rd\r d\';
v[78]:='score\rank\';
v[79]:='quit\stop\q\';
v[80]:='hi\hello\bye\good bye\';
v[81]:='yes\no\maybe\';
v[82]:='save\';
v[83]:='smell\sniff\';
v[84]:='taste\lick\';
v[85]:='wake up\awaken\wake\';
v[86]:='restart\';
v[87]:='restore\resume\';
v[88]:='unlock\';
v[89]:='shoot at\shoot\blast\';
v[90]:='tie\untie\damn\shit\hell\';
v[91]:='follow\scott miller\scott\';
v[92]:='dig in\dig\shovel\';
v[93]:='attack\kill\fight\';
v[94]:='clean\wipe off\wipe\';
v[95]:='command\verbs\verb\words\';
end; { Assign2 }

                     {NOUN LIST:  GROUPS ALL OBJECTS}
overlay procedure Assign3;
begin
n[1]:='clear crystal\clear\crystal\';
n[2]:='device\';
n[3]:='rusty key\rusty\';
n[4]:='shiney key\shiney\';
n[5]:='brown satchel\satchel\brown\';
n[6]:='dried food\food\dried\loaf\';
n[7]:='holster\gun strap\strap\';
n[8]:='goolaa\coin\money\';
n[9]:='red jewel\jewel\red\';
n[10]:='skull\skulls\head\heads\';
n[11]:='rod\thick rod\pole\';
n[12]:='plastic access card\';            {cont}
n[13]:='plastic access\card\';            {cont}
n[14]:='access card\plastic card\';       {cont}
n[15]:='access\plastic\';
n[16]:='worn cushion\cushion\worn\';
n[17]:='grey disk\disk\grey\';
n[18]:='dusty ball\ball\dusty\';          {changes to glass ball!}
n[19]:='paper\piece paper\piece\';
n[20]:='set of goggles\set goggles\';     {cont}
n[21]:='goggles\set\glasses\band\';
n[22]:='orange crystal\orange\';
n[23]:='green crystal\green\';
n[24]:='yellow crystal\yellow\';
n[25]:='blue crystal\blue\';
n[26]:='pair of gloves\pair gloves\';     {cont}
n[27]:='gloves\glove\pair\';
n[28]:='security suit\suit\badge\';       {cont at #31}
n[29]:='mug\cup\drink\';
n[30]:='all\everyth\object\objects\';
n[31]:='securit suit\securit\';
n[32]:='containers\crate\crates\';        {cont}
n[33]:='cargo\contain\storage\';
n[34]:='ceiling\roof\up\';
n[35]:='seat\command chair\chair\';       {cont}
n[36]:='chairs\seats\toilet\';
n[37]:='computer\termina\compute\';
n[38]:='controls\machine\';               {cont}
n[39]:='control panel\control\';
n[40]:='cyan button\cyan\';               { changes to socket }
n[41]:='tan button\tan\';
n[42]:='energy flow\energy\flow\';
n[43]:='purple button\purple\violet\';
n[44]:='button\white button\white\';      {cont}
n[45]:='buttons\';
n[46]:='robot\defense robot\defense\';    {cont at #133}
n[47]:='vines\vine\branche\branch\';
end; { Assign3 }
overlay procedure Assign4;
begin
n[48]:='dial\knob\dials\knobs\tap\';
n[49]:='ground\floor\earth\deck\bay\';    {cont}
n[50]:='glass floor\rocks\down\';
n[51]:='equipment\equipme\';
n[52]:='numeric keypad\keypad\';          {cont}
n[53]:='numeric\numbers\keyboar\';
n[54]:='rail\railing\column\';
n[55]:='panel\compart\';
n[56]:='door\swingin door\doors\';        {cont}
n[57]:='swingin doors\hatch\swingin\';
n[58]:='key\keys\round recess\';
n[59]:='screen\monitor\screens\data\';
n[60]:='player\self\waist\me\myself\';    {cont}
n[61]:='hand\hands\arm\feet\foot\';
n[62]:='ship\my ship\shuttle\vehicle\';   {cont}
n[63]:='space ship\space craft\craft\';
n[64]:='slot\opening\hole\round\';        {cont}
n[65]:='niche\holes\recess\';
n[66]:='acid water\acid river\stream\';   {cont}
n[67]:='acid stream\river\acid\gap\';
n[68]:='pyramid\podium\structure\';
n[69]:='cryo tube\cryogen tube\';         {cont}
n[70]:='cryogen\cryo\tube\tubes\';
n[71]:='steps\step\stairs\ladder\';
n[72]:='picture\mural\drawing\';
n[73]:='bones\bone\skeleto\remains\';
n[74]:='flash\blindin flash\blindin\';    {object never here!}
n[75]:='creature\hairy creatur\hairy\';   {cont}
n[76]:='scaled creatur\creatur\';         {cont}
n[77]:='scaled\';
n[78]:='wheel\handle\';
n[79]:='water\';
n[80]:='bed\bunk\beds\bunks\';
n[81]:='sign\post\menu\message\note\';
n[82]:='solar map\map\solar\drawing\';    {changes to laser beam}
n[83]:='western table\western\';
n[84]:='middle table\middle\';
n[85]:='eastern table\eastern\';
n[86]:='table\tables\';
n[87]:='shelf\shelves\';
n[88]:='gun\ray gun\signpos\';
n[89]:='statue\dog statue\dog\';
n[90]:='serum dispenser\dispens\';        {cont}
n[91]:='serum dispens\';
n[92]:='serum\medicin\cure\liquid\';
n[93]:='platform\platfor\';
end; { Assign4 }
overlay procedure Assign5;
begin
n[94]:='booth\transpo\';
n[95]:='wristband\wristba\transla\';
n[96]:='building\buildin\complex\';       {cont}
n[97]:='store\station\tavern\';
n[98]:='sink\basin\tap\faucet\spout\';
n[99]:='glunk lite\lite\glunk\beer\';
n[100]:='Drink\ambross\';                 {cont}
n[101]:='pink ztulctw\ztulctw\pink\';     {cont}
n[102]:='bloody foeboz\foeboz\bloody\';
n[103]:='red star\red\star\flare\';
n[104]:='telescope\telesco\eyepiec\';
n[105]:='outer planet\inner planet\';     {cont}
n[106]:='line planet\fifth planet\';      {cont}
n[107]:='ringed planet\ringed\';          {cont}
n[108]:='inner\fifth\line\outer\';        {cont}
n[109]:='planets\planet\last\';
n[110]:='keyhole\';              { changes to speaker }
n[111]:='bartender\bartend\waiter\';
n[112]:='trees\tree\forest\jungle\';
n[113]:='path\passage\tunnel\road\';      {cont}
n[114]:='corrido\lobby\chamber\air\';
n[115]:='antenna\dish\hollow\';
n[116]:='wall\south wall\north wall\';    {cont}
n[117]:='east wall\west wall\walls\';
n[118]:='ice\snow\';
n[119]:='writing\chart\list\';
n[120]:='swamp\quicksa\';
n[121]:='radio\transmi\';
n[122]:='dirt\sand\dust\desert\rocks\';
n[123]:='scientist\scienti\him\man\';
n[124]:='aliens\two aliens\alien\';
n[125]:='fence\wire fence\wire\';
n[126]:='bar\';                    { changes to hinge }
n[127]:='window\windows\alarm\siren\';
n[128]:='reactor\regulat\';
n[129]:='gas\fumes\icy mist\mist\icy\';
n[130]:='spears\spear\';
n[131]:='light\glow\lights\catwalk\';
n[132]:='drazil tracks\tracks\drazil\';
n[133]:='droid\sensor\probe\';


                {SEPWORD LIST:  GROUPS ALL PREPOSITIONS}

p[1]:='on top\around\above\over\';        {cont}
p[2]:='across\on\to\onto\';
p[3]:='against\at\toward\towards\';       {cont}
p[4]:='in directi\';
p[5]:='in\through\down\';
p[6]:='using\with\making use\by\';
p[7]:='beside\near\close to\next to\';    {cont}
p[8]:='leaning against\';
p[9]:='off\from\';
p[10]:='under\underne\beneath\below\';
p[11]:='a\for\';

                     {ADVERB LIST:  GROUPS ALL MOODS}

a[1]:='gently1careful2softly3calmly4quietly5lightly6easily7';
a[2]:='slowly1leisure2slow3with care4cautiou5closely6';
a[3]:='strongl1firmly2solidly3powerfu4with force5hard6';
a[4]:='quickly1fast2rapidly3speedil4very fast5';
end; { Assign5 }

                               {ROOM  NAMES}

overlay procedure Names1;
begin
rn[1]:='Bridge';
rn[2]:='Forward Corridor';
rn[3]:='Rear Corridor';
rn[4]:='Ship''s Lab';
rn[5]:='Sanitary Facilities';
rn[6]:='Sleep Chamber';
rn[7]:='Cargo Area';
rn[8]:='Tavern';
rn[9]:='West Hallway';
rn[10]:='Central Hallway';
rn[11]:='East Hallway';
rn[12]:='Suite #4';
rn[13]:='Crossroads';
rn[14]:='Dusty Road';
rn[15]:='Dusty Road';
rn[16]:='Gravel Road';
rn[17]:='Gravel Road';
rn[18]:='Paved Road';
rn[19]:='Paved Road';
rn[20]:='General Store';
rn[21]:='Gravel Lot';
rn[22]:='Top of Ship';
rn[23]:='Deep Pit';
rn[24]:=rn[22];
rn[25]:='Sandy Clearing';
rn[26]:='Winding Path';
rn[27]:=rn[26];
rn[28]:=rn[26];
rn[29]:=rn[26];
rn[30]:='Top of Tree';
rn[31]:='Quicksand Pit';
rn[32]:=rn[26];
rn[33]:=rn[26];
rn[34]:='Front of Pyramid';
rn[35]:='Vestibule';
rn[36]:='Descending Stairs';
rn[37]:='Halcyon Hall';
rn[38]:='Departure Room';
rn[39]:='Holey Hall';
rn[40]:='Pyramid Lobby';
  end; { Names1 }
overlay procedure Names2;
begin
rn[41]:='Treasure''s Keeper';
rn[42]:='Ladder Room';
rn[43]:='Shifting Room';
rn[44]:=rn[43];
rn[45]:=rn[43];
rn[46]:=rn[43];
rn[47]:=rn[43];
rn[48]:=rn[43];
rn[49]:=rn[43];
rn[50]:='Stairway Room';
rn[51]:='Lower Stairway';
rn[52]:='Misty Passage';
rn[53]:='Damp Passage';
rn[54]:='Dark Passage';
rn[55]:='Circular Chamber';
rn[56]:='The Erusaert';
rn[57]:='Solar Chamber';
rn[58]:='Eternal Trap';
rn[59]:='Overgrown Path';
rn[60]:='Antenna Building';
rn[61]:='Monitor Outpost';
rn[62]:='Booth';
rn[63]:='Booth';
rn[64]:='Lobby';
rn[65]:='North Corridor';
rn[66]:='Central Corridor';
rn[67]:='South Corridor';
rn[68]:='Decontamination';
rn[69]:='Waiting Room';
rn[70]:='Transporter Booth';
rn[71]:='Monitor Station';
rn[72]:='Reactor Control';
rn[73]:='Communications';
rn[74]:='Computer Station';
rn[75]:='Elevator  1st Floor';
rn[76]:='Elevator  2nd Floor';
rn[77]:='Observatory';
rn[78]:='Icy Platform';
rn[79]:='Confirmation Port';
rn[80]:='Inspection Lobby';
  end; { Names2 }
overlay procedure Names3;
begin
rn[81]:='Circular Corridor';
rn[82]:=rn[81];
rn[83]:=rn[81];
rn[84]:=rn[81];
rn[85]:=rn[81];
rn[86]:=rn[81];
rn[87]:=rn[81];
rn[88]:=rn[81];
rn[89]:='Reactors West';
rn[90]:='Reactors East';
rn[91]:='Emergency Override';
rn[92]:='Climate Control';
rn[93]:='Elevator';
rn[94]:='Maintenance';
rn[95]:='Transmission Room';
rn[96]:='Station Control';
rn[97]:='Cryogenic Chamber';
rn[98]:='Indentity Booth';
rn[99]:='Security Tunnel #1';
rn[100]:='Security Tunnel #2';
rn[101]:='Security Tunnel #3';
rn[102]:='North Catwalk';
rn[103]:='East Catwalk';
rn[104]:='South Catwalk';
rn[105]:='West Catwalk';
rn[106]:='Junction';
rn[107]:='Conference Room';
rn[108]:='Reactor Regulators';
rn[109]:='Medical Quarters #6';
  end; { Names3 }


                               {ROOM  NAMES}
overlay procedure Place1;
 begin
for x:=1 to RMax do L[x]:=[];
L[1]:=[16,35..41,43,44,52,55,56,59,62,112,120,125];
L[2]:=[38,56,62,64,71,78];
L[3]:=[38,55,81];
L[4]:=[38,44,51,52,55,62,64,81,90,119];
L[5]:=[35,38,48,62,98];
L[6]:=[38,62,69,80];
L[7]:=[32,51,62,87];
L[8]:=[29,35,56,71,81,83..86,96,99,100,111,119,126];
L[9]:=[56,71];
L[10]:=[56];
L[11]:=[56];
L[12]:=[7,48,56,80,87,98,110];
L[13]:=[56,81,88,96];
L[14]:=[81,96,125];
L[15]:=[125];
L[16]:=[81,96];
L[17]:=[]; {empty}
L[18]:=[81,125];
L[19]:=[]; {empty}
L[20]:=[5,6,32,38,51,86,87,96,132];
L[21]:=[62,71,81,125];
L[22]:=[56,62,71,78,81,96,125];
L[23]:=[73,81];
L[24]:=[56,62,71,78,112,120];
L[25]:=[62,71,112,120];
L[26]:=[66,112,120];
L[27]:=[66,112,120];
L[28]:=[112,120];
L[29]:=[112,120];
L[30]:=[68,112,120];
L[31]:=[47,112,120];
L[32]:=[112,120];
L[33]:=[112,120];
L[34]:=[56,64,68,71,81,89,112,119,120,126];
L[35]:=[56,71];
L[36]:=[71];
L[37]:=[71];
L[38]:=[10,51,73];
L[39]:=[129];
L[40]:=[56,68];
L[41]:=[18,73,56,68];
L[42]:=[71];
{ L[43] through L[49] are empty }
L[50]:=[71];
L[51]:=[71];
L[52]:=[64];
L[53]:=[];
L[54]:=[];
L[55]:=[11];
 end; { Place1 }
overlay procedure Place2;
 begin
L[56]:=[66,68,110];
L[57]:=[56,72,82,103,109];
L[59]:=[112,120];
L[60]:=[56,96,112,115,120];
L[61]:=[37,38,44,56,59,93,94,96];
L[62]:=L[61];
L[63]:=L[61]+[20];
L[64]:=[35,56,72,81,86,109,127];
L[65]:=[56];
L[66]:=[56,64];
L[67]:=[56];
L[68]:=[44,56,131];
L[69]:=[35,56,131];
L[70]:=[40,41,43,44,56,93,94];
L[71]:=[59];
L[72]:=[37,38,44,46,55,128];
L[73]:=[28,35,38,48,56,115,121,127];
L[74]:=[37,38,44,52,59];
L[75]:=[44,56];
L[76]:=[44,56];
L[77]:=[56,104,127];
L[78]:=[54,56,93,96,115,118];
L[79]:=[44,56,64];
L[80]:=[35,55,56,72,86];
L[81]:=[56,72];       { Picture of a Grey Disk }
L[82]:=[56,72,103];   { Picture of the Red Star }
L[83]:=[56,72,115];   { Picture of an Antenna }
L[84]:=[46,56,72];    { Picture of a Robot }
L[85]:=[56,72];       { Picture of a Cloud }
L[86]:=[56,64,69,72]; { Picture of a Cryogenic Tube }
L[87]:=[56,72];       { Picture of an Atomic Nucleus }
L[88]:=[56,72];       { Picture of an Atomic Nucleus }
L[89]:=[38,44,56,59,95,128];
L[90]:=[38,56,59,128];
L[91]:=[37,38,44,51,52,56,59,64,69,95,127,129];
L[92]:=[35,56,59];
L[93]:=[44,52,56];
L[94]:=[2,51,56,87];
L[95]:=[38,44,52,56,121,127];
L[96]:=[38,56,59];
L[97]:=[56,69,129];
L[98]:=[56,59,81,119];
L[99]:=[46,55,56,88];
L[100]:=[55,56];
L[101]:=[46,55,56,88];
L[102]:=[42,54,56,131];
L[103]:=[42,54,131];
L[104]:=[42,54,131];
L[105]:=[42,54,56,131];
L[106]:=[56];
L[107]:=[19,35,56,86];
L[108]:=[55,56,128];
for x:=1 to RMax do L[x]:=L[x]+[30,34,49,60,103,113,116,122,131];
 end;
                           {<<<*** END ***>>>}
