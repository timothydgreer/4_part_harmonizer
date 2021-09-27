function finalChord = printChord(chord)
    notenames = {'A','A#','B','C','C#','D','D#','E','F','F#','G','G#'};
    if length(chord) == 1
        root = chord(1);
        rest = '';
    elseif strcmp(chord(2),'#')
        root = chord(1:2);
        rest = chord(3:end);
    else
        root = chord(1);
        rest = chord(2:end);
    end
    %major chord
    if isempty(rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = root;
        note1= root;
    %minor chord
    elseif strcmp('m',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = root;
        note1= root;
    %minor 7th chord
    elseif strcmp('m7',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+9,12)+1};
        note1= root;   
    %major 7th chord
    elseif strcmp('maj7',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+10,12)+1};
        note1= root;
    %dominant 7th chord
    elseif strcmp('7',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+9,12)+1};
        note1= root;
    %dim chord
    elseif strcmp('dim',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+5,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+8,12)+1};
        note1= root;
    %6 chord
    elseif strcmp('6',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+8,12)+1};
        note1= root;
    %69 chord
    elseif strcmp('69',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+8,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+13,12)+1};
        note1= root;
    %aug chord
    elseif strcmp('aug',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+7,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+11,12)+1};
        note1= root;
    %m6 chord
    elseif strcmp('m6',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+8,12)+1};
        note1= root;
    %9 chord
    elseif strcmp('9',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+9,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+13,12)+1};
        note1= root;
    %sus chord
    elseif strcmp('sus',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+4,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+11,12)+1};
        note1= root;
    %sus2 chord
    elseif strcmp('sus2',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+1,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+11,12)+1};
        note1= root;
    %add2 chord
    elseif strcmp('add2',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+1,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note1= root;    
    %minmaj chord
    elseif strcmp('minmaj',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+6,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+10,12)+1};
        note1= root;
    %m9 chord
    elseif strcmp('m9',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+9,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+13,12)+1};
        note1= root;
    %maj9 chord
    elseif strcmp('maj9',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+3,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+10,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+13,12)+1};
        note1= root;
    %m11 chord
    elseif strcmp('m11',rest)
        note2 = notenames{mod(find(strcmp(notenames,root))+2,12)+1};
        note3 = notenames{mod(find(strcmp(notenames,root))+9,12)+1};
        note4 = notenames{mod(find(strcmp(notenames,root))+16,12)+1};
        note1= root;
    else
        chord
        asdsadln
    end
    finalChord = {note1,note2,note3,note4};
end
