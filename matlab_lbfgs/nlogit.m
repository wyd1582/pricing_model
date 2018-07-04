function obj=nlogit(x,i)
    p_f=ones(1, 60)*i;  %only one product
    p_sub=ones(1, 18)*i;  
    w_1f=ones(1, 61)*i ;
    w_2f=ones(1, 61)*i ;
    w_2sub=ones(1, 18)*i;
    w_3f=ones(1, 61+2)*i;
    c=i;
    c1=i+1;
    c2=i-1;
    
    h1=1./(1+exp(-[p_f,x]*w_1f' - c1));
    h2=1./(1+exp(-[p_f,x]*w_2f'-p_sub*w_2sub' - c2));
    d=c+w_3f(1)'*h1+w_3f(2)'*h2+w_3f(3:end)*[p_f,x]';
    obj=d'*x';
end