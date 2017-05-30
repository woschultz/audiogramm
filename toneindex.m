function [n,k] = toneindex(hearLevel,frequenz)

n = int8((hearLevel/5)+1);

switch frequenz
    case 125
        k = 1;
    case 250
        k = 2;
    case 500
        k = 3;
    case 750
        k = 4;
    case 1000
        k = 5;
    case 1500
        k = 6;
    case 2000
        k = 7;
    case 3000
        k = 8;
    case 4000
        k = 9;
    case 6000
        k = 10;
    case 8000
        k = 11;
end