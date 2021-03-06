function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[1 1.125 1]);
set(ax,'PlotBoxAspectRatio',[2 1.3333333333333333 1]);
set(ax,'XLim',[-2 2]);
set(ax,'YLim',[-1.5 1.5]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pderect([-1.5 1.5 1.5 -1.5],'R1');
pderect([-0.029999999999999999 0.029999999999999999 1 0.029999999999999999],'R2');
pderect([-0.029999999999999999 0.029999999999999999 -0.029999999999999999 -1],'R3');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','R1+R2+R3')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')
pdesetbd(5,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'dir',...
1,...
'1',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setuprop(pde_fig,'Hgrad',1.3);
setuprop(pde_fig,'refinemethod','regular');
pdetool('initmesh')

% PDE coefficients:
pdeseteq(1,...
'1.0',...
'0.0',...
'10.0',...
'1.0',...
'0:10',...
'0.0',...
'0.0',...
'[0 100]')
setuprop(pde_fig,'currparam',...
['1.0 ';...
'0.0 ';...
'10.0';...
'1.0 '])

% Solve parameters:
setuprop(pde_fig,'solveparam',...
str2mat('0','1158','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setuprop(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
setuprop(pde_fig,'colstring','');
setuprop(pde_fig,'arrowstring','');
setuprop(pde_fig,'deformstring','');
setuprop(pde_fig,'heightstring','');
