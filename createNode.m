function PIn = createNode(i,pi,notp,sample,filename)
% sample = 50000;
% filename = 'C:/Users/Yasaman/Desktop/survey.csv';
A = csvread(filename, 0,i,[0 i sample-1 i]);
   p = mean(A);
   disp(pi);
   disp (p);
   Np = 1-p;
   disp (notp)
   disp (Np);
   PIn = [p,Np];
end