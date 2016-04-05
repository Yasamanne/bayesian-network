function PH = twoparents(i,sample,filename)
% sample = 50000;
% prompt = 'whats the sample '
% filename = 'C:/Users/Yasaman/Desktop/survey.csv';
csvread(filename, 0,i,[0 i sample-1 i]);

    P = csvread(filename, 0,4,[0 4 sample-1 4]);
    H = csvread(filename, 0,1,[0 1 sample-1 1]);
    T = csvread(filename, 0,2,[0 2 sample-1 2]);
    L = 0;
    N = 0;
    NT = 0;
    NHT = 0;
    NHNT = 0;
    for i = 1:sample    %find the number of P true
        if P(i)==1
        L= L+1;
        end
    %PTrue = L;
    end
    for i=1:sample       % find where H and T is true when P true
        if P(i)==1&&H(i)==1&&T(i)==1
        N= N+1;
        end
    
    end
    for i=1:sample       % find where H is true and T is not true when P true
        if P(i)==1&&H(i)==1&&T(i)==0
         NT= NT+1;
        end
    
    end
    for i=1:sample       % find where H is not true and T is true when P true
        if P(i)==1&&H(i)==0&&T(i)==1
        NHT= NHT+1;
        end
    
    end
    for i=1:sample       % find where H and T is not true when P true
        if P(i)==1&&H(i)==0&&T(i)==0
         NHNT= NHNT+1;
        end
    
    end
        
    PHTrueTTrue = N/L;
    disp('p(p = 1|ht = 11 )')
    disp(PHTrueTTrue)
    PNotTruePHTrueTTrue = 1-PHTrueTTrue;
    disp('p(p = 0|ht = 11 )')
    disp(PNotTruePHTrueTTrue)
    PHTrueTNotTrue = NT/L ;
    disp('p(p = 1|ht = 10 )')
    disp(PHTrueTNotTrue)
    PNotTrueHTrueTNotTrue = 1-PHTrueTNotTrue;
    disp('p(p = 0|ht = 10 )')
    disp(PNotTrueHTrueTNotTrue)
    PHNotTrueTTrue = NHT/L;
    disp('p(p = 1|ht = 01 )')
    disp(PHNotTrueTTrue)
    PNotTruePHNotTrueTTrue = 1-PHNotTrueTTrue;
    disp('p(p = 0|ht = 01 )')
    disp(PNotTruePHNotTrueTTrue)
    PHNotTRueTNotTrue = NHNT/L;
    disp('p(p = 1|ht = 00 )')
    disp(PHNotTRueTNotTrue)
    PNotTrueHNotTRueTNotTrue = 1- PHNotTRueTNotTrue;
    disp('p(p = 0|ht = 00 )')
    disp(PNotTrueHNotTRueTNotTrue)
%     pPTrue = L/sample;
%     pPNotTrue = 1 - pPTrue;
% 
%     disp(pPTrue)
%     
%     disp(pPNotTrue)
    PH = [PHTrueTTrue,PNotTruePHTrueTTrue,PHTrueTNotTrue,PNotTrueHTrueTNotTrue,PHNotTrueTTrue,PNotTruePHNotTrueTTrue,PHNotTRueTNotTrue,PNotTrueHNotTRueTNotTrue];
%     PHTrue = [PHTrueTTrue,PNotTruePHTrueTTrue,PHTrueTNotTrue,PNotTrueHTrueTNotTrue];
%     output = PH ;
end
