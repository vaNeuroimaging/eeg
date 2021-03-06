function F = expm(A)
%EXPM   Matrix exponential.
%   EXPM(X) is the matrix exponential of X.  EXPM is computed using
%   a scaling and squaring algorithm with a Pade approximation.
%
%   Although it is not computed this way, if X has a full set
%   of eigenvectors V with corresponding eigenvalues D, then
%   [V,D] = EIG(X) and EXPM(X) = V*diag(exp(diag(D)))/V.
%
%   EXP(X) computes the exponential of X element-by-element.
%
%   See also LOGM, SQRTM, FUNM.

%   Reference:
%   N. J. Higham, The scaling and squaring method for the matrix
%   exponential revisited. SIAM J. Matrix Anal. Appl.,
%   26(4) (2005), pp. 1179-1193.
%
%   Nicholas J. Higham
%   Copyright 1984-2013 The MathWorks, Inc.

[m_vals, theta] = expmchk(A); % Initialization
normA = norm(A,1);

if normA <= theta(end)
    % no scaling and squaring is required.
    for i = 1:length(m_vals)
        if normA <= theta(i)
            F = PadeApproximantOfDegree(m_vals(i),A);
            break;
        end
    end
else
    [t, s] = log2(normA/theta(end));
    s = s - (t == 0.5); % adjust s if normA/theta(end) is a power of 2.
    A = A/2^s;    % Scaling
    F = PadeApproximantOfDegree(m_vals(end),A);
    for i = 1:s
        F = F*F;  % Squaring
    end
end
% End of expm

function [m_vals, theta] = expmchk(A)
%EXPMCHK Check the class of input A and initialize M_VALS and THETA accordingly.
switch class(A)
    case 'double'
        m_vals = [3 5 7 9 13];
        % theta_m for m=1:13.
        theta = [%3.650024139523051e-008
                 %5.317232856892575e-004
                  1.495585217958292e-002  % m_vals = 3
                 %8.536352760102745e-002
                  2.539398330063230e-001  % m_vals = 5
                 %5.414660951208968e-001
                  9.504178996162932e-001  % m_vals = 7
                 %1.473163964234804e+000
                  2.097847961257068e+000  % m_vals = 9
                 %2.811644121620263e+000
                 %3.602330066265032e+000
                 %4.458935413036850e+000
                  5.371920351148152e+000];% m_vals = 13
    case 'single'
        m_vals = [3 5 7];
        % theta_m for m=1:7.
        theta = [%8.457278879935396e-004
                 %8.093024012430565e-002
                  4.258730016922831e-001  % m_vals = 3
                 %1.049003250386875e+000
                  1.880152677804762e+000  % m_vals = 5
                 %2.854332750593825e+000
                  3.925724783138660e+000];% m_vals = 7
    otherwise
        error(message('MATLAB:expm:inputType'))
end

function F = PadeApproximantOfDegree(m,A)
%PADEAPPROXIMANTOFDEGREE  Pade approximant to exponential.
%   F = PADEAPPROXIMANTOFDEGREE(M,A) is the degree M diagonal
%   Pade approximant to EXP(A), where M = 3, 5, 7, 9 or 13.
%   Series are evaluated in decreasing order of powers, which is
%   in approx. increasing order of maximum norms of the terms.
n = length(A);
c = getPadeCoefficients(m);
classA = class(A);
I = eye(n,classA);
% Evaluate Pade approximant.
switch m
    case {3, 5, 7, 9}
        Apowers = cell(ceil((m+1)/2),1);
        Apowers{1} = I;
        Apowers{2} = A*A;
        for j = 3:ceil((m+1)/2)
            Apowers{j} = Apowers{j-1}*Apowers{2};
        end
        U = 0;
        V = 0;
        for j = m+1:-2:2
            U = U + c(j)*Apowers{j/2};
        end
        U = A*U;
        for j = m:-2:1
            V = V + c(j)*Apowers{(j+1)/2};
        end
    case 13
        % For optimal evaluation need different formula for m >= 12.
        A2 = A*A; A4 = A2*A2; A6 = A2*A4;
        U = A * (A6*(c(14)*A6 + c(12)*A4 + c(10)*A2) ...
            + c(8)*A6 + c(6)*A4 + c(4)*A2 + c(2)*I);
        V = A6*(c(13)*A6 + c(11)*A4 + c(9)*A2) ...
            + c(7)*A6 + c(5)*A4 + c(3)*A2 + c(1)*I;
end
F = (V-U)\(2*U) + I; % (-U+V)\(U+V);

function c = getPadeCoefficients(m)
% GETPADECOEFFICIENTS Coefficients of numerator P of Pade approximant
%    C = GETPADECOEFFICIENTS(M) returns coefficients of numerator
%    of [M/M] Pade approximant, where M = 3,5,7,9,13.
switch m
    case 3
        c = [120, 60, 12, 1];
    case 5
        c = [30240, 15120, 3360, 420, 30, 1];
    case 7
        c = [17297280, 8648640, 1995840, 277200, 25200, 1512, 56, 1];
    case 9
        c = [17643225600, 8821612800, 2075673600, 302702400, 30270240, ...
            2162160, 110880, 3960, 90, 1];
    case 13
        c = [64764752532480000, 32382376266240000, 7771770303897600, ...
            1187353796428800,  129060195264000,   10559470521600, ...
            670442572800,      33522128640,       1323241920,...
            40840800,          960960,            16380,  182,  1];
end
