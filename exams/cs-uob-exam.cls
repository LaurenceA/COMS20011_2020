\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs-uob-exam}[2014/02/06 UoB CS LaTeX class, stam@cs.bris.ac.uk]
\LoadClass[12pt,addpoints]{exam}[]

%MSM: loading package to ease layout etc.
\RequirePackage{times}			% MSM: required by Faculty 
\RequirePackage{soul}			% MSM: to underline text
\RequirePackage{fmtcount}		% MSM: to convert numbers into text

%MSM: set up exam.cls to provide correct UoB layout for questions
\renewcommand\thequestion{{{\bf Q\arabic{question}}}}
\pointsdroppedatright
\marksnotpoints
\marginpointname{ \points}
\pointformat{{\itshape[\themarginpoints]}}
\setlength{\rightpointsmargin}{2.4cm}

%MSM: set up exam.cls to provide correct UoB page layout
\pagestyle{headandfoot}
\lhead{\ifcontinuation{\oddeven{}{(cont.)}}{}}
\chead{}
\rhead{\ifcontinuation{\oddeven{(cont.)}{}}{}}
\lfoot{}
\cfoot{{\bfseries Page \thepage\ of \numpages}}
\rfoot[]{{\bfseries \iflastpage{}{\ifincomplete%
{\oddeven{Turn Over/Qu.~continues \ldots}{Qu.~continues \ldots}}%
{\oddeven{Turn Over/\ldots}{}}%
}}}
