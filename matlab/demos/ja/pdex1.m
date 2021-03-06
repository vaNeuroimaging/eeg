% PDEX1  PDEPE 用の例 1
%
% これは、単一 PDE を直接的に定式化し、解を計算し、プロットすることを
% 示す解析解をもつ簡単な例です。
%
% PDEPE で期待される型の中で、単一 PDE は、つぎの型をしています。
%
%   [pi^2] .*  D_ [u] =  D_ [   Du/Dx   ] +      [0]
%              Dt        Dx
%    ----         ---       -------------    -------------
%     c            u        f(x,t,u,Du/Dx)   s(x,t,u,Du/Dx)
%
% 方程式は、時間 t>=0 、区間 0<= x <= 1 で成り立っています。そして、
% 解析解 u(x,t) = exp(-t)*sin(pi*x) が存在します。境界条件が設定され、
% そのために、初期値-境界値問題の解になります。明らかに、初期値は、
% sin(pi*x) です。2 種類の境界条件は、ソルバにより期待される型になる
% ように選択されます。左の境界条件は、u(0,t) = 0;
%
%     [u]    +     [0] .* [       Du/Dx          ] = [0]
% 
%     ---          ---    ------------------------   ---
%   p(0,t,u)      q(0,t)        f(0,t,u,Du/Dx)        0
%
% 右の境界条件は、pi*exp(-t) + Du/Dx(1,t) = 0:
%
%   [ pi*exp(-t) ] + [1] .* [   Du/Dx    ] = [0]
%
%   --------------   ---    --------------   ---
%      p(1,t,u)     q(1,t)   f(1,t,u,Du/Dx)   0
%
% です。問題は、サブ関数 PDEX1PDE, PDEX1IC, PDEX1BC にコード化されて
% います。
%
% 参考  PDEPE, FUNCTION_HANDLE.


%   Copyright 1984-2006 The MathWorks, Inc.
