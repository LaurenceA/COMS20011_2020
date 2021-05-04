\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs.exam}[2012/05/04 UoB CS LaTeX class, page@cs.bris.ac.uk]

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}

\pgfkeys{/exam/.cd,
  % options
        type/.store in=\exam@type,       % [question|solution]
       title/.store in=\exam@title,      % string
  authorname/.store in=\exam@authorname, % string
  authoruser/.store in=\exam@authoruser, % string
    unitname/.store in=\exam@unitname,   % string
    unitcode/.store in=\exam@unitcode,   % string
        year/.store in=\exam@year,       % string
       resit/.store in=\exam@resit,      % boolean
      rubric/.store in=\exam@rubric,     % [3/3|3/4|*+1/2|*+2/3]
    duration/.store in=\exam@duration,   % string
      season/.store in=\exam@season,     % [summer|autumn|winter]
  % defaults
        type = {question},
       title = {},
  authorname = {},
  authoruser = {},
    unitname = {},
    unitcode = {},
        year = {},
       resit = {false},
      rubric = {3/4},
    duration = {},
      season = {summer}
}

\ProcessPgfOptions{/exam}
\LoadClass[12pt,twoside]{article}

\RequirePackage{lastpage}
\RequirePackage{refcount}
\RequirePackage{comment}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}

\makeatletter

% =============================================================================

% configure style of pages
\geometry{a4paper,lmargin=3.0cm,rmargin=3.0cm,tmargin=3.0cm,bmargin=3.0cm}

\newcounter{BREAK}

\fancypagestyle{plain}{
  \fancyhf{}

  \renewcommand{\headrulewidth}{0.0pt}
  \renewcommand{\footrulewidth}{0.0pt}

  \fancyfoot[C]{
    \ifcsstring{exam@type}{question}{
      Page \thepage\ of \getpagerefnumber{LastPage}
    }{}
  }
  \fancyfoot[R]{
    \ifcsstring{exam@type}{question}{
            \ifnum \thepage=1
      % blank
      \else \ifnum \thepage=\getpagerefnumber{LastPage} 
      % blank
      \else \ifnum \value{BREAK}=1
        Turn over, question continues
      \else
        Turn over
      \fi
      \fi 
      \fi 
    }{}
  }
}

\pagestyle{plain}

% -----------------------------------------------------------------------------

\renewcommand{\maketitle}{
  \begin{center}
  \bf
                          UNIVERSITY OF BRISTOL                             \\
  \vspace{1cm}
              \ifcsstring{exam@season}{summer}{May/June }{}%
              \ifcsstring{exam@season}{autumn}{September }{}%
              \ifcsstring{exam@season}{winter}{January }{}%
                               {\exam@year} %
                \ifcsstring{exam@resit}{true}{Resit }{}%
                           Examination Period                               \\
  \vspace{1cm}
                      FACULTY OF ENGINEERING                        \\
  \vspace{1cm}
Second Year Examination for the Degrees of BSc, BEng and MEng\\
  \vspace{1cm}
                           {\exam@unitcode}                                 \\
                           {\exam@unitname}                                 \\
  \vspace{1cm}                                                               
                             TIME ALLOWED:                                  \\
                           {\exam@duration}                                 \\
  \vspace{1cm}
  
    \ifcsstring{exam@rubric}{MC}{
This paper contains 20 multiple choice questions worth a maximum of 60 marks\\
The number of marks allocated for each multiple choice question is indicated\\
For each multiple choice, choose only one answer\\
Each question has exactly one correct answer. You must select exactly one answer per question, anything else will not be counted. You must mark your answers with a pencil and only as indicated on the image below. \\
\vspace{1cm}

All questions will be used for assessment.\\
Calculators must have the Engineering Faculty seal of approval.

\vspace{1cm}

\includegraphics[width=0.8\textwidth]{MC.png}
  }{}
  
  \ifcsstring{exam@rubric}{3/3}{
This paper contains {\bf three} questions:\\
All questions carry 20 marks each\\
All three questions will be used for assessment\\
The maximum for this paper is 60 marks\\
\vspace{2cm}

Other Instructions \\

1. Calculators must have the Engineering Faculty seal of approval.
  }{}
  \ifcsstring{exam@rubric}{3/4}{
              This examination contains {\bf four}  questions;                 
                 each question is worth $20$ marks.                            
                     Answer {\bf three} questions.                          \\
  }{}
  \ifcsstring{exam@rubric}{*+1/2}{
                This examination contains {\bf two} sections:
        the questions in section A are worth $20$ marks in total,
        the questions in section B are worth $20$ marks each.                
                Answer {\bf all} questions from section A, 
                  and {\bf one} question  from section B.                   \\
  }{}
  \ifcsstring{exam@rubric}{*+2/3}{
                This examination contains {\bf two} sections:
        the questions in section A are worth $20$ marks in total,
        the questions in section B are worth $20$ marks each.                
               Answer {\bf all} questions from section A,                  
                and {\bf two} questions from section B.                     \\
  }{}
  \vfill
                TURN OVER ONLY WHEN TOLD TO START WRITING
  \end{center}
  \newpage
}

% -----------------------------------------------------------------------------

\newcounter{QUESTION}
\newcounter{SOLUTION}

\renewcommand\labelenumi{\makebox[1.5em][l]{\alph{enumi})}}
\renewcommand\labelenumii{\makebox[1.5em][l]{\roman{enumii})}}

\newcommand{\mks}[1]{\hspace*{\fill}\mbox{\em [#1 marks]}}

%\ifcsstring{exam@type}{question}{ 
   \includecomment{MKQUESTION}
   \renewenvironment{MKQUESTION}[1]{         
     \refstepcounter{QUESTION}
     \addtocounter{BREAK}{+1}
     \begin{trivlist}\item[\hbox to 0pt{\hss\hbox to 0.5in{\bf Q\arabic{QUESTION}.\hfill}}]
   }{
     \end{trivlist}
     \addtocounter{BREAK}{-1}
   }
%}{
%  \excludecomment{MKQUESTION}
%}
 
 \ifcsstring{exam@type}{solution}{ 
   \includecomment{MKSOLUTION}
   \renewenvironment{MKSOLUTION}[1]{         
     \refstepcounter{SOLUTION}
     \addtocounter{BREAK}{+1}
     \begin{trivlist}\item[\hbox to 0pt{\hss\hbox to 0.5in{\bf A\arabic{SOLUTION}.\hfill}}]
   }{
     \end{trivlist}
     \addtocounter{BREAK}{-1}
   }
 }{
   \excludecomment{MKSOLUTION}
 }

\newenvironment{MKEXAM}{
  \newpage
  \maketitle
}{
  ~\\\centerline{\bf END OF PAPER}
}

\newenvironment{MKSECTION}[2]{
  \newcommand{\SAVENAME}{#1}
  \newcommand{\SAVETEXT}{#2}
  \newpage
  \section*{Section \SAVENAME: \SAVETEXT}
}{
  ~\\\centerline{\bf END OF SECTION \SAVENAME}
}

% =============================================================================

\makeatother
  
