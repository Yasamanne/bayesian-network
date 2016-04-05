function output = generateSample(str)

    if str == 'H'
    r = rand(10,6);
    for i = 1:10
        for j = 1:6
        if r(i,j)> 0.5000 || r(i,j)== 0.5000
            r(i,j)=1;
        else 
            r(i,j)=0;
        end
        disp(r);
        end
    end
    
        for i=1:size(r)
        indices = find(r(:,2)==0);
        r(indices,:) = [];
%          disp(r);
        end
    elseif str == 'M'
        r = rand(10,6);
    for i = 1:10
        for j = 1:6
        if r(i,j)> 0.5000 || r(i,j)== 0.5000
            r(i,j)=1;
        else 
            r(i,j)=0;
        end
        disp(r);
        end
    end
        for i=1:size(r)
        indices = find(r(:,4)==0);
        r(indices,:) = [];
%           disp(r);
        end
    end
   
output = size(r,1);
disp(output)

csvwrite('RS.csv',r);


