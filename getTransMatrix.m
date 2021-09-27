function transMat = getTransMatrix(set1,set2,distmat)
transMat = zeros(length(set1),length(set2));
for i = 1:length(set1)
    for j = 1:length(set2)
        chord1 = printChord(char(set1(i)));
        chord2 = printChord(char(set2(j)));
        transMat(i,j) = chorddist(chord1,chord2,distmat);
    end
end

end