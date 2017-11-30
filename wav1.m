%
% adapted from https://stackoverflow.com/questions/26393545/python-graphing-the-1d-wave-equation-beginner
%

% model parameters 
dx=0.02; % spatial step
dt=0.005; % temporal step
tmin=0.0; % time limits
tmax=100.0;
xmin=-4; % space limits
xmax=4;  
c1=0.5; % material 1 velocity
c2=0.25; % material 2 velocity 
rsq1=(c1*dt/dx).^2; %  the equation coefficient - there is a name of the guy that invented that
rsq2=(c2*dt/dx).^2;
damping=1e-15; % artificial damping - reduce displacement that much per velocity 
%% some extra model properties.
nx=ceil((xmax-xmin)/dx)+1; 
nt=ceil((tmax-tmin)/dt)+2;
x=linspace(xmin,xmax,nx);
%% reserve output memory
u=zeros(nt,nx);

%% set initial pulse shape
% fn=@(x)( exp(-(x.^2)/0.25) );
% for idxA=1:length(nx)
%     u(1,idxA)=fn(xmin+idxA*dx);
%     u(2,idxA)=u(1,idxA);
% end
wavelet_width = 0.5;
wavelet_location = -3;
u(1,:)=exp(-(((x-wavelet_location)/wavelet_width).^2)/0.25); % gaussian wavelet,

%u(1,:)=0;
u(1,abs(u(1,:))<0.01)=0;  % truncate the wavelet
u(2,:)=u(1,:);            % starting condition: t(1)==t(2), so like, melt from frozen.
%% prepare display
figure(1);
hp=plot(x,real(u(1,:)));
material_break_location = 2;
hBreak = line([0 0]+material_break_location,[-1 1],'color','red');
set(gca,'YLim',[-1 1])

%%  do dynamics
for idxT = 2:(nt-1)
    for idxA=2:(nx-1)
        
        if x(idxA)<material_break_location % material type check - could be a different material for every x(idxA)
            rsq=rsq1;
        else
            rsq=rsq2;
        end
        
        dmpVal=damping*(u(idxT,idxA)-u(idxT-1,idxA)); % material damping, linear-elastic
        
        %dmpVal=sqrt(abs(dmpVal)).*sign(dmpVal); % other damping behaviours
        %dmpVal=sign(dmpVal)*dmpVal.^(1/3);% other damping behaviours
        
        u(idxT+1,idxA)=2*(1-rsq)*u(idxT,idxA)-u(idxT-1,idxA)+rsq*(u(idxT,idxA-1)+u(idxT,idxA+1))-dmpVal; % the wave equation for itxT+1
    end
    hp.YData=real(u(idxT+1,:)); drawnow;
end