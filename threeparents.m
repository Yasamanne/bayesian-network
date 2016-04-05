function PC = threeparents(i,sample,filename)
%    sample = 50000;
%    filename = 'C:/Users/Yasaman/Desktop/survey.csv';
   csvread(filename, 0,i,[0 i sample-1 i]);


    
    CT = 0;
    CMPG = 0;
    CNMPG = 0;
    CNMNPG = 0;
    CNMNPNG = 0;
    CMNPNG = 0;
    CNMPNG = 0;
    CMNPG = 0;
    CMPNG = 0;
    G = csvread(filename, 0,0,[0 0 sample-1 0]);
    M = csvread(filename, 0,3,[0 3 sample-1 3]);
    P = csvread(filename, 0,4,[0 4 sample-1 4]);
    C = csvread(filename, 0,5,[0 5 sample-1 5]);


    for i=1:sample       % find the total number of Computer Science is true
        if C(i)==1
           CT = CT+1;
        end

    end
    for i=1:sample       % C & M & P & G True
        if C(i)==1&&M(i)==1&&P(i)==1&&G(i)==1
           CMPG= CMPG+1;
        end

    end
    for i=1:sample       % C & P & G True -- M False
        if C(i)==1&&M(i)==0&&P(i)==1&&G(i)==1
           CNMPG= CNMPG+1;
        end

    end
    for i=1:sample       % C & P  True -- M & G False
        if C(i)==1&&M(i)==0&&P(i)==1&&G(i)==0
           CNMPNG= CNMPNG+1;
        end

    end
    for i=1:sample       % C & M  True -- P & G False
        if C(i)==1&&M(i)==1&&P(i)==0&&G(i)==0
           CMNPNG= CMNPNG+1;
        end

    end
    for i=1:sample       % C & G  True -- M & P False
        if C(i)==1&&M(i)==0&&P(i)==0&&G(i)==1
           CNMNPG= CNMNPG+1;
        end

    end
    for i=1:sample       % C  True -- M & G & P False
        if C(i)==1&&M(i)==0&&P(i)==0&&G(i)==0
           CNMNPNG= CNMNPNG+1;
        end

    end
    for i=1:sample       % C & M & G  True -- P False
        if C(i)==1&&M(i)==1&&P(i)==0&&G(i)==1
           CMNPG= CMNPG+1;
        end

    end
    for i=1:sample       % C  True -- M & G & P False
        if C(i)==1&&M(i)==1&&P(i)==0&&G(i)==0
           CMPNG= CMNPNG+1;
        end

    end


    CMTruePtrueGtrue = CMPG/CT;
    disp('p(C = 1| mpg = 111)')
    disp(CMTruePtrueGtrue)
    
    CNotTrueMTruePtrueGtrue = 1- CMTruePtrueGtrue;
    disp('p(C = 0| mpg = 111)')
    disp(CNotTrueMTruePtrueGtrue)
    
    CMNotTruePTrueGTrue = CNMPG/CT;
    disp('p(C = 1| mpg = 011)')
    disp(CMNotTruePTrueGTrue)
    
    CNotTrueMNotTruePTrueGTrue = 1-CMNotTruePTrueGTrue;
    disp('p(C = 0| mpg = 011)')
    disp(CNotTrueMNotTruePTrueGTrue)
    
    CMNotTruePNotTrueGTrue = CNMNPG/CT;
    disp('p(C = 1| mpg = 001)')
    disp(CMNotTruePNotTrueGTrue)
    
    CNotTrueMNotTruePNotTrueGTrue = 1-CMNotTruePNotTrueGTrue;
    disp('p(C = 0| mpg = 001)')
    disp(CNotTrueMNotTruePNotTrueGTrue)
    
    CMNotTruePTrueGNotTrue = CNMPNG/CT;
    disp('p(C = 1| mpg = 010)')
    disp(CMNotTruePTrueGNotTrue)
    
    CNotTrueMNotTruePTrueGNotTrue = 1-CMNotTruePTrueGNotTrue;
    disp('p(C = 1| mpg = 010)')
    disp(CNotTrueMNotTruePTrueGNotTrue)
    
    CMNotTruePNotTrueGNotTrue = CNMNPNG/CT;
    disp('p(C = 1| mpg = 000)')
    disp(CMNotTruePNotTrueGNotTrue)
    
    CNotTrueMNotTruePNotTrueGNotTrue = 1 - CMNotTruePNotTrueGNotTrue;
    disp('p(C = 0| mpg = 000)')
    disp(CNotTrueMNotTruePNotTrueGNotTrue)
    
    CMTruePNotTrueGNotTrue = CMNPNG/CT;
    disp('p(C = 1| mpg = 100)')
    disp(CMTruePNotTrueGNotTrue)
    
    CNotTrueMTruePNotTrueGNotTrue = 1- CMTruePNotTrueGNotTrue;
    disp('p(C = 0| mpg = 100)')
    disp(CNotTrueMTruePNotTrueGNotTrue)
    
    CMTruePNotTrueGTrue = CMNPG/CT;
    disp('p(C = 1| mpg = 101)')
    disp(CMTruePNotTrueGTrue)
    
    CNotTrueMTruePNotTrueGTrue = 1- CMTruePNotTrueGTrue;
    disp('p(C = 0| mpg = 101)')
    disp(CNotTrueMTruePNotTrueGTrue)
    
    CMTruePTrueGNotTrue = CMPNG/CT;
    disp('p(C = 1| mpg = 110)')
    disp(CMTruePTrueGNotTrue)
    
    CNotTrueMTruePTrueGNotTrue = 1- CMTruePTrueGNotTrue;
    disp('p(C = 0| mpg = 110)')
    disp(CNotTrueMTruePTrueGNotTrue)
    PC = [CMTruePtrueGtrue,CMTruePTrueGNotTrue,CMTruePNotTrueGNotTrue,CMTruePNotTrueGTrue,CMNotTruePTrueGTrue,CMNotTruePTrueGNotTrue,CMNotTruePNotTrueGTrue,CMNotTruePNotTrueGNotTrue,CNotTrueMTruePtrueGtrue,CNotTrueMNotTruePTrueGTrue,CNotTrueMNotTruePNotTrueGTrue,CNotTrueMNotTruePTrueGNotTrue,CNotTrueMNotTruePNotTrueGNotTrue,CNotTrueMTruePNotTrueGNotTrue,CNotTrueMTruePNotTrueGTrue,CNotTrueMTruePTrueGNotTrue];
end    