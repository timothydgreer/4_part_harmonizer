function [dist] = chorddist(chord1,chord2,distmat)
    notenames = {'A','A#','B','C','C#','D','D#','E','F','F#','G','G#'};
    P = perms(chord2)
    minD = 10000;
    for ii = 1:length(P)  

        distance = 0;
        for i = 1:length(chord1)
            distance = distance + distmat(find(strcmp(notenames,chord1(i))),find(strcmp(notenames,P(ii,i))));
        end
        if distance < minD
            minD = distance;
        end
    end
    dist = minD
    
end
