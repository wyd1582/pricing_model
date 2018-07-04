%fmincon examples

%running TFOCS with randomn matrix
% Add TFOCS to your path.
%generating a ramdon matrix in matlab

randn('state',9243); rand('state',234324');
result_unc=zeros(100,7);

%%
% function obj=nlogit(x)
% h1=1/(1+exp(-x*w_1f - c1));
% h2=1/(1+exp(-x*w_2f-p_sub*w_2sub - c2));
% d=c+w_3f(1)*h1+w_3f(2)*h2+w_3f(2:end)*x;
% obj=d*x;
for i=1:100
 
    
    %setting and preparing
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    x0=[1];
    %starting the function
    tic;
    options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
    myfun = @(x)nlogit(x,i);
    [x,fval,exitflag,output, grad, hessian] = fminunc(myfun,x0,options);
    %storing the results
    result_unc(i,1)=i;
    result_unc(i,2)=x;
    result_unc(i,3)=fval;
    result_unc(i,4)=getfield(output, 'iterations');
    result_unc(i,5)=grad;
    result_unc(i,6)=hessian;
    result_unc(i,7)=toc;
    
    fprintf('-------Round number %d end--------------\n', i);
    
end

