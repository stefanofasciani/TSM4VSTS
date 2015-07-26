function [period_hz] = period_detection(window,hop,d,sr)

% This file is part of the Timbre Space Mapping for VST Synthesizers (TSM4VSTS).
% 
% The TSM4VSTS can be obtained at http://stefanofasciani.com/tms4vsts.html
% TSM4VSTS Copyright (C) 2015 Stefano Fasciani, Nanyang Technological University
% Inquiries: stefanofasciani@stefanofasciani.com
% 
% The TSM4VSTS is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% The TSM4VSTS is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Less General Public License for more details.
% 
% You should have received a copy of the GNU Lesser General Public License
% along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
% 
% If you use the TSM4VSTS or any part of it in any program or publication,
% please acknowledge its authors by adding a reference to this pubblication:
% 
% S. Fasciani, 2015, "Interactive computation of timbre spaces for sound synthesis control"
% in proceedings of the 2nd international symposium on Sound and Interactivity, Singapore.


period_hz=zeros(1,size(d,2));

for i=1:size(d,2)
       
        temp=d(:,i);
        temp=temp-max(temp);
        fil_out=filter(((window)/sr), [1 ((window)/sr)-1], temp);
        autocx=xcorr(fil_out,size(d,1),'coeff');
        [pk_loc,pk_val]=findpeaks(autocx(1:size(d,1)));
        pk_val(pk_val==1)=0;
        [~,idx]=max(pk_val);
        pk_loc=pk_loc(idx);
        if ~isempty(pk_loc)
            period_smp=((size(d,1)-pk_loc+2)*hop);
            period_time=(period_smp/sr);
            period_hz(i)=(1.0/period_time);
        else
            period_hz(i)=0;
        end

end



% if size(period_hz,2)>3
%     period_hz=period_hz(period_hz~=max(period_hz));
%     period_hz=period_hz(period_hz~=min(period_hz));
%     hz=mean(period_hz);
%     dev=std(period_hz);
% elseif size(period_hz)==0
%    hz=-1;
%    dev=0;
% else
%    hz=mean(period_hz); 
%    dev=std(period_hz);
% end








