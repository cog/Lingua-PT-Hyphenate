# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 493;
BEGIN { use_ok('Lingua::PT::Hyphenate') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $tests = '
m� du lo
bar ca �a
bo te
cor ti na
gam bas
sub ma ri no
ca ma r�o
o ce a no
tes te
m�o
li m�o
ma ca co
com pu ta dor
pa lha �o
ques t�o
ma ri nhei ro
bo t�o
for mi guei ro
for mi ga
e le fan te
con ten te
ra to
ra ta za na
a ves truz
co po
a ber to
in fan til
bor bo le ta
em bo ra
ja ne la
ca ne la
con ten ta men to
tes ta men to
li vro
ca ba �a
ca me lo
co lu nas
co lu na
r� di o
te le vi s�o
me di ca men to
pa ler ma
co le te
ca ma
guar da
fa to
ba nho
ba nhei ra
ar m� ri o
mo to ri za da
ca sa co
so bre tu do
por t� til
ca mi sa
ca mi se ta
em pre sa

fan t�s ti co
pro gra ma dor
que
faz
es tes
m� du los

al mo �ar
can ti na
p�o
be bi da
es p� ri to
noi te
dia
co mi da
re fei ��o
pa tro c� ni o
eu ro pa
cas te lo
ci ne ma
gran de
co ber tor

se cre t� ria
cor rei o
fac to
er ro
ser ro te

bar ril
r�p til
f�s sil
fu nil

su ba li men tar
de di car
en car na do
bi sa v�
trans li ne ar
trans mi gra ��o
tran sa tl�n ti co
cons tar
de sa tar
e xa mi nar
�p ti mo
subs cre ver
ac ��o

se guir
pseu d� ni mo
ps� qui co
gra ma

a dop tar
jac to
�p ti ca
dis cen te
ad mi nis trar

se cre to
pro cla mar
a pli car
a fro di te
a pron tar
pro ble m� ti co
a tle ta
o pr� bri o
a trac ��o
ne vri te
re pri mir

sub lo car
sub lu nar

sa char
fa lhar
a pa nhar

oc ci s�o
ac ci o nar
co mum men te
con nos co
nar rar
pas so

con cla mar
em ble m� ti co
em pre en der
ex pli car
trans cre ver
in frin gir

subs tan ti vo
ins t� vel
ins pec tor
pers pec ti var
subs ti tu to

guar dar
al gu�m
i gual
li qui dar
ne guem
pin gue

an dai
jei to so
teus
tro v�o

g� ve a
se me ar
bi bli o te ca
es p� ci e
vo ou
ru iu
sai am
sai ais

tran qui li da de
tra di ci o nal
es pe cia li da de
ma ca cos
';

my @tests = map { [split / /, $_] } split /\n/, $tests;

for (@tests) {
  my ($word, @expected) = ((join '', @$_), @$_);
  my @got = hyphenate($word);
  while ($a = shift @got) {
    $b = shift @expected;
    is($a,$b);
  }
  while (@expected) {
    $b = shift @expected;
    is(undef,$b);
  }
}
