fileprompt = 'Please enter absolute file path for survey.csv: ';
filename = input(fileprompt,'s');
% filename = 'C:/Users/Yasaman/Desktop/survey.csv';
% filename = 'C:/Users/Yasaman/Desktop/BayesNet/RS.csv';
sample = 50000;
g = createNode(0,'p(g)','p(~g)',sample,filename);
h = createNode(1,'p(h)','p(~h)',sample,filename);
t = createNode(2,'p(t)','p(~t)',sample,filename);
m = createNode(3,'p(m)','p(~m)',sample,filename);
p = twoparents(4,sample,filename);
% display(p);
C = threeparents(5,sample,filename);
% display(C);
totalPHCH = 0;

for k = 1:2
    g_value = g(k);
    for n = 1:2
        m_value = m(n);
        for l = 1:2
            t_value = t(l);
            if t_value == t(1)
            for i = 1:2
                p_value = p(i);
                if p_value == p(1)
                    for j = [1 2 5 6]
                    c_Value = C(j);
                    totalPHCH = totalPHCH + (p_value*c_Value*m_value*t_value*g_value);
                    end
                else
                    for j = [3 4 7 8]
                    c_Value = C(j);
                    totalPHCH = totalPHCH + (p_value*c_Value*m_value*t_value*g_value);
                    end
                end
            end
            else 
                for i = 3:4
                p_value = p(i);
                if p_value == p(3)
                    for j = [1 2 5 6]
                    c_Value = C(j);
                    totalPHCH = totalPHCH + (p_value*c_Value*m_value*t_value*g_value);
                    end
                else
                    for j = [3 4 7 8]
                    c_Value = C(j);
                    totalPHCH = totalPHCH + (p_value*c_Value*m_value*t_value*g_value);
                    end
                end
                end
            end
        end
    end
end
    

 disp('P(C|h=true) = ')
 disp(totalPHCH)


totalpCTruemTrue = 0;
counter = 1;
for s = 1:2
    h_value = h(s);
        for l = 1:2
            t_value = t(l);
            HT = h_value * t_value ;
            HTValues (counter) = HT;
            counter = counter+1;
%             disp(HTValues);

        end
end
% disp('HTValues(3)')
% disp(HTValues(3))
for k = 1:2
    g_value = g(k);
    if g_value == g(1)
        A(1) = g_value* C(1);
%         disp('A1');
%         disp(A(1));
        
        A(2) = g_value* C(4);
        o=1;
        for q=1:4
        totalpCTruemTrue = totalpCTruemTrue + A(1)*HTValues(q)*p(o);
        o = o+2;
%         disp('totalpCTruemTrue');
%         disp(totalpCTruemTrue)
        
        end
        e = 2;
        for z=1:4
        totalpCTruemTrue = totalpCTruemTrue + A(2)*HTValues(z)*p(e);
        e = e+2;
        end
       
    else
        A(3) = g_value* C(2);
        A(4) = g_value* C(3);
        o=1;
        for q=1:4
        totalpCTruemTrue = totalpCTruemTrue + A(3)*HTValues(q)*p(o);
        o = o+2;
        end
        e = 2;
        for z=1:4
        totalpCTruemTrue = totalpCTruemTrue + A(4)*HTValues(z)*p(e);
        e = e+2;
        end
    end
end

            
 disp('P(C|m=true) = ')
 disp(totalpCTruemTrue)
            