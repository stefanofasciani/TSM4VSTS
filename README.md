
========
TSM4VSTS
========


==============================================================================
Timbre Space Mapping for VST Synthesizers (TSM4VSTS)

The TSM4VSTS is a collection of MAX patches and MATLAB functions.
 
The TSM4VSTS, more information, related publications, and demo video can be found at http://stefanofasciani.com/tms4vsts.html

TSM4VSTS Copyright (C) 2015 Stefano Fasciani, Nanyang Technological University
Inquiries: stefanofasciani@stefanofasciani.com
Website: http://stefanofasciani.com

==============================================================================


========
OVERVIEW
========

The TSM4VSTS is implemented in Max and MATLAB.

The TSM4VSTS has been developed and tested on the following platform:
OSX 10.7.5
MAX 7.0.4 (32-bit)
MATLAB 7.12.0 (R2011a)
FTM 2.6.0 beta


============
DEPENDENCIES
============

MATLAB

Drtoolbox
http://lvdmaaten.github.io/drtoolbox/

Oscmex
http://sourceforge.net/projects/oscmex/files/



Max

FTM
http://ftm.ircam.fr/index.php/Main_Page

Sfa-MaxLib
https://github.com/sfasciani/SFA-MaxLib


============
INSTRUCTIONS
============

Run the TSM4VSTS.maxpat in Max and the TSM4VSTS.m script in MATLAB.
The system control is completely implemented in the MAX GUI.
The TSM4VSTS.m is a mapping engine which runs in the background.
TSM4VSTS.maxpat controls TSM4VSTS.m via OSC.
You can use the MATLAB to compile TSM4VSTS.m into a standalone application and run it from the Terminal.

Running TSM4VSTS.m in MATLAB is needed only to compure new mappings.
To use previously computed mappings stored on files MATLAB is not necessary.

TSM4VSTS.maxpat provides a 2D lightweight visualization of the timbre space (based on max LCD objects). TSM4VSTS_3DopenGL.maxpat provides a 3D computationally expensive visualization of the timbre space (based on open GL).