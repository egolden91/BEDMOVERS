function [Path] = RecoPath(FROM,Start,Target)

rePath = Target;
Path = rePath;

k = 1;
while ~all(rePath==Start)
    Path = [Path; squeeze(FROM(rePath(1), rePath(2), rePath(3), :))'];
    rePath = squeeze(FROM(rePath(1), rePath(2), rePath(3), :))';
    k = k+1 ;
end
Path = flip(Path); 
end