%fmincon examples

%running TFOCS with randomn matrix
% Add TFOCS to your path.
%generating a ramdon matrix in matlab

randn('state',9243); rand('state',234324');
result_con=zeros(100,3);

%%
% function obj=nlogit(x)
% h1=1/(1+exp(-x*w_1f - c1));
% h2=1/(1+exp(-x*w_2f-p_sub*w_2sub - c2));
% d=c+w_3f(1)*h1+w_3f(2)*h2+w_3f(2:end)*x;
% obj=d*x;
for i=1:100
 
    
    %setting and preparing
    lb = 0;
    ub = inf;
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    x0=[i]; %only one product
    %starting the function
    tic;
    myfun = @(x)nlogit(x,i)
    [x,fval,exitflag,output,grad,hessian] = fminunc(myfun,x0); %fminunc
    %storing the results
    result_con(i,1)=i;
    result_con(i,2)=x;
    result_con(i,3)=toc;
    fprintf('-------Round number %d end--------------\n', i);
    
end
