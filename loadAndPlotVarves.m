cd ~/GitHub/PetersVarveComp/varveShp/


A = varveshaperead('Annie.shp');
C = varveshaperead('Charlotte.shp');
N = varveshaperead('NickVarves.shp');

close all
plot(2017-(1:length(A.thickness)),A.thickness,'k')
hold on
plot(2017-(1:length(C.thickness)),C.thickness,'r')
plot(2017-(1:length(N.thickness)),N.thickness,'b')
legend('Annie','Charlotte','Nick')
xlabel('Year')
ylabel('Thickness (mm)')

print -dpdf 'VarveComparison.pdf'

xlim([2003 2017])


print -dpdf 'VarveComparison20032017.pdf'
