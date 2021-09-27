notes = containers.Map;

notes('c') = {'C','Cmaj7','C6','C69','F','Fmaj7','F6','Am','Am7','Csus2','Csus','Gsus',...
            'D7','Fm','C#maj7','D#6','F#dim','C7','G#maj7','A#add2','Cm'};
notes('d') = {'Dm7','Em7','G','G7','Cmaj9','Cadd2','Gsus','Dm','Dm6','F6',...
            'E7','Fm6','A#','A#7','A#6','C9','Ddim','D7','D6','D'};
notes('e') = {'C','Cmaj7','C6','C69','G6','Fmaj7','Am','Am7','Em','Em7',...
            'Fminmaj','D9','A','A7','E7','A9','C7','E','Em9'};
notes('f') = {'F','Fmaj7','Dm','Dm7','G7','Bdim','F','Csus',...
            'Fdim','A#','A#7','Fm','Fm6','Fm7','D#m9','D#9'};
notes('g') = {'C','Cmaj7','C6','Am7','Csus2','Csus','G','G7','G9','Gsus','Em','Em7','Dm11'...
            'Edim','D#','C7','D#6','A7','Fm9','A#6','C7','C9','Gaug'};
notes('a') = {'F','Fmaj7','Dm','Dm7','Am','Am7','C6','G9', ...
            'B7','A7','D7','Adim','F7'};%,'C13'};
notes('b') = {'Em','Em7','G','G6','G7','Bdim','Am9'...%,'G13',...
            'B','Bdim','Gaug','B7','E7','C#7','A9'};

distmat = zeros(12);
for i =1:12
    for j = 1:12
        distmat(i,j) = abs(i-j);
    end
end
distmat(distmat>6)  = 6-abs(6-distmat(distmat>6)); 
notenames = {'A','A#','B','C','C#','D','D#','E','F','F#','G','G#'};

Chord1 = printChord('C')
Chord2 = printChord('F')
chorddist(Chord1,Chord2,distmat)

if exist('transmat')==0   
    transmat =  containers.Map;
    transmat('aa') = getTransMatrix(notes('a'),notes('a'),distmat);
    transmat('ab') = getTransMatrix(notes('a'),notes('b'),distmat);
    transmat('ac') = getTransMatrix(notes('a'),notes('c'),distmat);
    transmat('ad') = getTransMatrix(notes('a'),notes('d'),distmat);
    transmat('ae') = getTransMatrix(notes('a'),notes('e'),distmat);
    transmat('af') = getTransMatrix(notes('a'),notes('f'),distmat);
    transmat('ag') = getTransMatrix(notes('a'),notes('g'),distmat);

    transmat('bb') = getTransMatrix(notes('b'),notes('b'),distmat);
    transmat('bc') = getTransMatrix(notes('b'),notes('c'),distmat);
    transmat('bd') = getTransMatrix(notes('b'),notes('d'),distmat);
    transmat('be') = getTransMatrix(notes('b'),notes('e'),distmat);
    transmat('bf') = getTransMatrix(notes('b'),notes('f'),distmat);
    transmat('bg') = getTransMatrix(notes('b'),notes('g'),distmat);

    transmat('cc') = getTransMatrix(notes('c'),notes('c'),distmat);
    transmat('cd') = getTransMatrix(notes('c'),notes('d'),distmat);
    transmat('ce') = getTransMatrix(notes('c'),notes('e'),distmat);
    transmat('cf') = getTransMatrix(notes('c'),notes('f'),distmat);
    transmat('cg') = getTransMatrix(notes('c'),notes('g'),distmat);

    transmat('dd') = getTransMatrix(notes('d'),notes('d'),distmat);
    transmat('de') = getTransMatrix(notes('d'),notes('e'),distmat);
    transmat('df') = getTransMatrix(notes('d'),notes('f'),distmat);
    transmat('dg') = getTransMatrix(notes('d'),notes('g'),distmat);

    transmat('ee') = getTransMatrix(notes('e'),notes('e'),distmat);
    transmat('ef') = getTransMatrix(notes('e'),notes('f'),distmat);
    transmat('eg') = getTransMatrix(notes('e'),notes('g'),distmat);

    transmat('ff') = getTransMatrix(notes('f'),notes('f'),distmat);
    transmat('fg') = getTransMatrix(notes('f'),notes('g'),distmat);

    transmat('gg') = getTransMatrix(notes('g'),notes('g'),distmat);
end
%Start the process of user input
Alphabet = 'abcdefg';
natnotenames = {'a','b','c','d','e','f','g'};

prompt = 'Put in a natural note that you would like to be the melody note: ';
x = input(prompt,'s');

while contains(Alphabet,char(x)) == 0
    x = input(prompt,'s') ;
end

melodyind = randperm(7,1);
%Melodyind override
melodyind = find(Alphabet==x);
melodynote = natnotenames(melodyind);
harmonyind = randperm(length(notes(char(melodynote))),1);
harmonyind

harmonyclass = notes(char(melodynote));
harmony = harmonyclass(harmonyind)
ssss
y = 'y';
while strcmp(y,'y')
    %Change this to adjust for voiceleading
    x = input(prompt,'s');
    while contains(Alphabet,char(x)) == 0
        x = input(prompt,'s');
    end
    nextnoteind = randperm(7,1);
    nextnoteind = find(Alphabet==x)

    nextnote = natnotenames(nextnoteind)
    nextharmonyclass = notes(char(nextnote));
    if melodyind < nextnoteind
        transition = append(melodynote,nextnote);
        dim = 2;
    else
        transition = append(nextnote,melodynote);
        dim = 1;
    end
    %transition
    %This should be right now!
    [M,I] = min(transmat(char(transition)),[],dim);
    melodynote
    nextnote
    harmonyind
    harmony
    I(harmonyind)
    M(harmonyind)
    harmony
    nextnoteharmony = nextharmonyclass(I(harmonyind))
    harmonyind = I(harmonyind);
    melodynote = nextnote;
    harmonyclass = nextharmonyclass;
    harmony = nextnoteharmony;
    melodyind = nextnoteind;
    y = input('Do you want to keep going? Type y for continuing, anything else for not: ' ,'s');
end



%Print out audio!
fs = 44100;
notesHz = [220,233.08,246.94,261.63,277.18,293.66,311.13,329.63,349.23,369.99,392.00,415.3];
%Convert to right Hz with sampling rate!
notesHz = (notesHz*2*pi)/fs;
speltold = printChord(char(harmony))
speltnew = printChord(char(nextnoteharmony))

oldchord = [];
newchord = [];
for i = 1:4
    ind = find(strcmp(notenames,char(speltold(i))));
    if strcmp(char(speltold(i)),upper(char(melodynote)))
        oldchord = [oldchord, 2*notesHz(ind)];
    else
        oldchord = [oldchord, notesHz(ind)];
    end
    ind = find(strcmp(notenames,char(speltnew(i))));
    if strcmp(char(speltnew(i)),upper(char(nextnote)))
        newchord = [newchord, 2*notesHz(ind)];
    else
        newchord = [newchord, notesHz(ind)];
    end
end

x = [1:100000];
yold = sin(oldchord(1)*x)+sin(oldchord(2)*x)+sin(oldchord(3)*x)+sin(oldchord(4)*x);
ynew = sin(newchord(1)*x)+sin(newchord(2)*x)+sin(newchord(3)*x)+sin(newchord(4)*x);
%sound(yold,44100)


