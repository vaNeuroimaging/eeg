function schema
%  SCHEMA  Defines properties for @freqview class

%  Author(s):  
%  Copyright 1986-2006 The MathWorks, Inc.

% Register class (subclass)
superclass = findclass(findpackage('wrfc'), 'view');
c = schema.class(findpackage('tsguis'), 'xyview', superclass);

%% Class attributes
schema.prop(c, 'Curves', 'MATLAB array'); % Handles of HG lines

%% Selection lines
schema.prop(c, 'SelectionCurves', 'MATLAB array');

%% List of selected observation indices
schema.prop(c, 'SelectedRectangles', 'MATLAB array');

%% Selection context menu handles
p = schema.prop(c, 'Menus', 'MATLAB array');
p.FactoryValue = struct('delete',[],'remove',[],'keep',[]);