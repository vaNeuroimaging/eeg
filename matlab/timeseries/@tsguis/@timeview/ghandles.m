function h = ghandles(this)
%  GHANDLES  Returns a 3-D array of handles of graphical objects associated
%            with a timeview object.

%  Author(s):  
%  Revised:
%  Copyright 1986-2004 The MathWorks, Inc.

h = cat(3, [this.Curves(:); this.SelectionCurves(:); ...
    this.WatermarkCurves(:); this.SelectionPatch(:)]);
