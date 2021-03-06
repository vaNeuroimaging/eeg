function addMenu(h,tplot)

% Copyright 2004-2012 The MathWorks, Inc.
   
%% Install uimenus on time selection rectangle
for k=1:prod(size(h.SelectionPatch))
      h.Menus = [h.Menus; uimenu('Label', ...
          getString(message('MATLAB:timeseries:tsguis:specview:Pass')), ...
          'Parent', ...
          get(h.SelectionPatch(k),'Uicontextmenu'),'Callback',...
          @(es,ed) filter(tplot,'pass'));
          uimenu('Label', ...
          getString(message('MATLAB:timeseries:tsguis:specview:Notch')), ...
          'Parent', ...
          get(h.SelectionPatch(k),'Uicontextmenu'),'Callback',...
          @(es,ed) filter(tplot,'notch'))];
end
