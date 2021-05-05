clear all; 
clf;
run ID_Dataprocess.m

y=reshape(Tue.',1,[]);
X_time=(1:96);
x = repmat(X_time,[1, size(Tue,1)]);

plot(x,y,'r.','LineWidth', 1.0);
%hold on
%mean_x=mean(Tue,1);
%sd_x= std(Tue);

%y_new = sd_x.*randn(10,1) + mean_x;
%y_updated=reshape(y_new.',1,[]);
%x = repmat(X_time,[1, size(y_new,1)]);

%plot(x,y_updated);

%y=y_updated;


xs = linspace(1, 96, 1000)';  

x=x';
y=y';

meanfunc = [];                    
covfunc = @covSEiso;              
likfunc = @likGauss;              
hyp = struct('mean', [], 'cov', [0 0], 'lik', 0);
hyp2 = minimize(hyp, @gp, -100, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
nlml_1= gp(hyp2, @infExact, meanfunc, covfunc, likfunc, x, y)
p=exp(-nlml_1)
[nlZ, dnlZ] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
[mu s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs);
f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs; flipdim(xs,1)], f, [7 7 7]/8)
hold on; 

plot(xs, mu, 'Color', 'k', 'LineWidth', 1.0); plot(x, y, 'ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5)
set(gca,'fontsize',17);
xlabel('Time', 'FontSize', 17,'FontWeight','bold');
ylabel('Number of Car', 'FontSize', 17,'FontWeight','bold');
