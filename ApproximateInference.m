counter = 1;
pSample = [];
Status = true;
prompt = 'Do you want to generate samples for H or M?(H/M): ';
str = input(prompt,'s');
fileprompt = 'Please enter absolute file path for RS.csv: ';
filename = input(fileprompt,'s');
while Status
sample = generateSample(str);
g = createNode(0,'p(g)','p(~g)',sample,filename);
h = createNode(1,'p(h)','p(~h)',sample,filename);
t = createNode(2,'p(t)','p(~t)',sample,filename);
m = createNode(3,'p(m)','p(~m)',sample,filename);
p = twoparents(4,sample,filename);
 display(p);
C = threeparents(5,sample,filename);
 display(C);
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
 counter = counter+1;
 pSample(counter) = totalPHCH;
 disp('P(C|h=true) = ')
 disp(totalPHCH)
 for i = 1:size(pSample)
     if pSample(counter)- pSample(i)==0.001
         Status = false;
     else
         Status = true;
     end
 end
 disp(counter);    
end
 