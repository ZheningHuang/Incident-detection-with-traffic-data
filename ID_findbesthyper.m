
run ID_Dataprocess.m

%%%%

y=reshape(Tue.',1,[]);
X_time=(1:96);
x = repmat(X_time,[1, size(Tue,1)]);
mean_x=mean(Tue,1);
sd_x= std(Tue);
y_new = sd_x.*randn(10,1) + mean_x;
y_updated=reshape(y_new.',1,[]);
x = repmat(X_time,[1, size(y_new,1)]);
y=y_updated;

x=x(1,1:96*2);
y=y(1,1:96*2);

%%%%

xx = linspace(60,96,20);
yy = linspace(6,9,20);
Z = zeros(length(xx),length(yy));

for i = 1:length(xx)
    for j = 1:length(yy)
              
    meanfunc = [];                    
    covfunc = @covSEiso;              
    likfunc = @likGauss;              

    hyp = struct('mean', [], 'cov', [xx(i) 0], 'lik', yy(j));
    
    nlml = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
    
    Z(j,i) = min(log(nlml),10);
        
    end
end

figure
contourf(xx,yy,Z,30)
colormap('default')

minMatrix1 = min(Z(:));
[row1,col1] = find(Z==minMatrix1);

minMatrix2 = min(min(Z(:,100:200)));
[row2,col2] = find(Z==minMatrix2);

hold on; plot(xx(col1), yy(row1), '+w', 'LineWidth', 1.0); 
plot(xx(col2), yy(row2), '+w', 'LineWidth', 1.0);

set(gca,'fontsize',17);
xlabel(' log (Lengthscale)', 'FontSize', 10,'FontWeight','bold');
ylabel('log (Noise Standard Deviation)', 'FontSize', 10,'FontWeight','bold');