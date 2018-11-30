\ProvidesClass{navyletter}
% Revision Original, Dennis Evangelista, 2016
% Still needs tweaking
% todo - add record note
% check against style guide

\RequirePackage{ifthen}
\newboolean{istenpt}
\setboolean{istenpt}{false}
\newboolean{istwelvept}
\setboolean{istwelvept}{false}
\DeclareOption{10pt}{\setboolean{istenpt}{true}}
\DeclareOption{12pt}{\setboolean{istwelvept}{true}}

\newboolean{istimes}
\setboolean{istimes}{false}
\newboolean{iscourier}
\setboolean{iscourier}{false}
\DeclareOption{times}{\setboolean{istimes}{true}}
\DeclareOption{courier}{\setboolean{iscourier}{true}}

% process options here
% \DeclareOption{...
\ProcessOptions



% inherits from article
\ifthenelse{\boolean{istenpt}}{\LoadClass[10pt]{article}}{\LoadClass[12pt]{article}}

% set page size
\setlength\paperwidth{8.5in}
\setlength\paperheight{11in}
\setlength\textwidth{6.5in}
\setlength\textheight{9in}
\setlength\headheight{1in}
\setlength\headsep{-1in}
\setlength\footskip{0in}
\setlength\topmargin{0in}
\setlength\parskip{12pt}
\newlength{\navyright} % for spacing of date, signature, etc
\setlength\navyright{5in}
\RequirePackage[letterpaper,top=1in,bottom=1in,left=1in,right=1in]{geometry}

% set font to Courier
\ifthenelse{\boolean{iscourier}}{\RequirePackage{courier} % for main body of text
\renewcommand{\familydefault}{\ttdefault}}{}



% letterhead and classification markings
\RequirePackage{helvet} % for letterhead and classification markings
\RequirePackage{fancyhdr}

\newcommand{\thenavymarking}{}
\newcommand{\navymarking}[1]{\renewcommand{\thenavymarking}{{\textbf{\sffamily\Large{\uppercase{#1}}}}}}
\navymarking{}
\newcommand{\thenavyaddresszero}{}
\newcommand{\navyaddresszero}[1]{\renewcommand{\thenavyaddresszero}{\sffamily\footnotesize\textbf{\uppercase{#1}}}}
\newcommand{\thenavyaddressone}{}
\newcommand{\navyaddressone}[1]{\renewcommand{\thenavyaddressone}{\sffamily\scriptsize\textbf{\uppercase{#1}}}}
\newcommand{\thenavyaddresstwo}{}
\newcommand{\navyaddresstwo}[1]{\renewcommand{\thenavyaddresstwo}{\sffamily\scriptsize{\uppercase{#1}}}}
\newcommand{\thenavyaddressthree}{}
\newcommand{\navyaddressthree}[1]{\renewcommand{\thenavyaddressthree}{\sffamily\scriptsize{\uppercase{#1}}}}
\navyaddresszero{Department of the Navy}
\navyaddressone{United States Naval Academy}
\navyaddresstwo{105 Maryland Avenue}
\navyaddressthree{Annapolis, MD 21402}

% for first page
\RequirePackage{graphicx}
\fancypagestyle{plain}{%
\setlength{\headheight}{1.5in}
\setlength{\topmargin}{-1in}
\setlength{\headsep}{0pt}
\setlength{\textheight}{8in}
\fancyhf{}
\lhead{\hspace*{-0.5in}\includegraphics[width=1in]{DODb.jpg}}
\chead{\thenavymarking\\
\vspace{1ex}
\thenavyaddresszero\\
\thenavyaddressone\\
\thenavyaddresstwo\\
\thenavyaddressthree\\
\vspace{2ex} }
\rhead{\raggedright\hspace{\navyright}\sffamily\tiny\textbf{\uppercase{Reply to}}\\
\hspace{\navyright}\sffamily\tiny\textbf{\uppercase{attention of:}}}
\cfoot{\vspace{0.25in}\thenavymarking}
\renewcommand{\headrulewidth}{0pt}
}

% for default pages
\setlength{\headheight}{1in}
\setlength{\topmargin}{-1in}
\setlength{\headsep}{0pt}
\setlength{\textheight}{9in}
\fancyhf{}
\lhead{}
\chead{\thenavymarking\vspace{0.5in}}
\cfoot{\vspace{0.25in}\thenavymarking}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}






% letter reference data
% Navy date format
\RequirePackage{datetime2}
\RequirePackage{datetime2-calc}
\DTMlangsetup[en_US]{abbr}
\DTMnewdatestyle{navy}{\renewcommand*{\DTMdisplaydate}[4]{\number##3\ \DTMshortmonthname{##2}\ ##1}}
\DTMsetdatestyle{navy}

\RequirePackage{ifthen}

% serial number
\newcommand{\thenavyserial}{}
\newcommand{\navyserial}[1]{\renewcommand{\thenavyserial}{#1}}
%\navyserial{08E-C12345}

% filing number
\newcommand{\thenavyfiling}{}
\newcommand{\navyfiling}[1]{\renewcommand{\thenavyfiling}{#1}}
%\navyfiling{9290/1}

\providecommand{\makedateblock}{%
\thispagestyle{plain}
\sloppy
\noindent\hspace{\navyright}%
\begin{minipage}{2in}
\vspace{1ex}
\ifthenelse{\equal{\thenavyfiling}{}}{}{\noindent\thenavyfiling\\}
\ifthenelse{\equal{\thenavyserial}{}}{}{\noindent Ser \thenavyserial\\}
\noindent\makeatletter\@date\makeatother
\end{minipage}%
%\vspace{1em}
}






% to from blocks
% originator
\newcommand{\navyfrom}[1]{From: & #1 \\}

% recipient
\newcommand{\navyto}[1]{To: & #1 \\}

% via
\newcommand{\navyvia}[1]{Via: & #1 \\}

% numbered via
\newcounter{navyviacounter}
\renewcommand*{\thenavyviacounter}{\arabic{navyviacounter}}
\newcommand{\navynumberedvia}[1]{\ifthenelse{\equal{\thenavyviacounter}{0}}{Via: & (\refstepcounter{navyviacounter}\thenavyviacounter) #1 \\}{& (\refstepcounter{navyviacounter}\thenavyviacounter) #1 \\}}

% skip lines
\newcommand{\navyskip}{ &  \\}

% subject
\newcommand{\thenavysubj}{set title with navysubj}
\newcommand{\navysubj}[1]{%
\renewcommand*{\thenavysubj}{\MakeUppercase{#1}}}
\newcommand{\navysubjline}{\textbf{Subj:} & \textbf{\uppercase{\thenavysubj}}\\}

% references
\newcounter{navyrefcounter}
\renewcommand*{\thenavyrefcounter}{\alph{navyrefcounter}}
\newcommand{\navyref}[2]{\ifthenelse{\equal{\thenavyrefcounter}{}}{Ref: & (\refstepcounter{navyrefcounter}\thenavyrefcounter\label{#1}) #2 \\}{& (\refstepcounter{navyrefcounter}\thenavyrefcounter\label{#1}) #2 \\}}
\newcommand{\navyreference}[1]{reference (\ref{#1})}
\newcommand{\Navyreference}[1]{Reference (\ref{#1})}

% enclosures
\newcounter{navyenclcounter}
\newcommand{\navyencl}[2]{\ifthenelse{\equal{\thenavyenclcounter}{0}}{Encl: & (\refstepcounter{navyenclcounter}\thenavyenclcounter\label{#1}) #2 \\}{& (\refstepcounter{navyenclcounter}\thenavyenclcounter\label{#1}) #2 \\}}
\newcommand{\navyenclosure}[1]{enclosure (\ref{#1})}
\newcommand{\Navyenclosure}[1]{Enclosure (\ref{#1})}

% environment definition
\newenvironment{navyletterheader}%
{\flushleft\begin{tabular}{@{}p{0.5in}p{6in}@{}}}%
{\end{tabular}}








% body of letter
% numbered paragraphs using sectioning commands 
\usepackage[explicit]{titlesec}
\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}[runin]% command and shape
	{\normalfont\normalsize}% format
	{\thesection.~}% label
	{0em}% sep
	{\bfseries\underline{\ifthenelse{\equal{#1}{}}{}{#1:}}}% before code
	[]% after code
\titlespacing{\section}{0em}{0em}{\wordsep}

\renewcommand{\thesubsection}{\alph{subsection}}
\titleformat{\subsection}[runin]%command and shape
	{\normalfont\normalsize}%fornat
	{\thesubsection.~}%label
	{0em}%sep
	{\underline{\ifthenelse{\equal{#1}{}}{}{#1:}}}% before code
	[]%after code
\titlespacing{\subsection}{2em}{0em}{\wordsep}
	
\renewcommand{\thesubsubsection}{\roman{subsubsection}}
\titleformat{\subsubsection}[runin]%
	{\normalfont\normalsize}%
	{\thesubsubsection.~}%
	{0em}%
	{{\ifthenelse{\equal{#1}{}}{}{#1:}}}%
	[]
\titlespacing{\subsubsection}{4em}{0em}{\wordsep}








% end stuff
% signature and copy to
\newlength{\navysignright}
\setlength{\navysignright}{4in}
\newlength{\navysignheight}
\setlength{\navysignheight}{2em}
\newcommand{\noclosing}{\noindent\hspace*{\navysignright}{}}
\newcommand{\respectfully}{\noindent\hspace*{\navysignright}{Respectfully,}}
\newcommand{\veryrespectfully}{\noindent\hspace*{\navysignright}{Very respectfully,}}
\newcommand{\signspace}{\\ \vspace{\navysignheight}}
\newcommand{\signature}[1]{\\ \noindent\hspace*{\navysignright}\uppercase{#1}}
\newcommand{\bydirection}{\\ \noindent\hspace*{\navysignright}{By direction}}
\newcommand{\sendertitle}[1]{\\ \noindent\hspace*{\navysignright}{#1}}
\newcommand{\copyto}{\noindent{Copy to:\\}}
\newcommand{\copytonextpage}{\noindent{Copy to: (next page)}}


% record note - LATER
\newcommand{\navyrecordnote}{%
  \newpage
  \thispagestyle{empty}
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}}

% environment definition
\newcommand{\navyrecordnotedistribution}[1]{%
\noindent\begin{minipage}[t]{2.5in}
\textbf{DISTRIBUTION:}\\
{#1}
\end{minipage}}

\newcommand{\navyrecordnoteconcurrences}[1]{%
\begin{minipage}[t]{4in}
\flushleft\textbf{CONCURRENCES:}\\
\vspace{1em}
#1
\end{minipage}}

\newcommand{\navyrecordnoteconcurrence}[1]{%
\vspace{1em}
\makebox[2.5in]{\hrulefill} \hspace{0.1in} \makebox[1in]{\hrulefill} \\
\makebox[2.5in][c]{#1} \hspace{0.1in} \makebox[1in][c]{date}\\}

\newcommand{\navyrecordnotesubjline}{
\flushleft\begin{tabular}{@{}p{0.5in}p{6in}@{}}
\navysubjline{}
\end{tabular}
\flushleft{\textbf{RECORD NOTE}}
}






%\RequirePackage{ifthen}
%\newboolean{isdraft}
%\setboolean{isdraft}{false}
%
%
%\DeclareOption{manuscript}{\setboolean{isdraft}{true}
%}  % DeclareOption{draft}
%\DeclareOption{manu}{\setboolean{isdraft}{true}
%}  % DeclareOption{draft}
%\DeclareOption{m}{\setboolean{isdraft}{true}
%}  % DeclareOption{draft}
%
%\ProcessOptions
%
%
%



%
%% The following typesets the title block.
%\ifthenelse{\boolean{isdraft}}
%{\renewcommand{\maketitle}{%
%\onehalfspacing
%\begin{center}
%{\sffamily\Large\bfseries \jeb@title} \\
%\bigskip
%{\sffamily\normalsize\mdseries\jeb@authorlist} \\
%\medskip
%{\sffamily\small\mdseries\jeb@affiliationlist} \\
%\medskip
%{\sffamily\footnotesize\mdseries\jeb@contact}\\
%\medskip
%{\sffamily\small\mdseries\jeb@date}\\
%\bigskip
%{\sffamily\small\bfseries SUMMARY}\\
%\end{center}
%{\sffamily\small\bfseries\jeb@summary}
%{\sffamily\small\mdseries\jeb@supplementary}
%{\sffamily\small\mdseries\jeb@keywords}
%\medskip
%}}%then
%{\renewcommand{\maketitle}{%
%\twocolumn[{\sffamily\bfseries\fontsize{6pt}{6pt}\selectfont%
%The Journal of Experimental Biology xxx, xxxx-xxxx\\[-0.9em]
%Published by The Company of Biologists xxxx\\[-0.9em]
%doi:10.1242/jeb.xxxxxx}
%\begin{center}
%{\sffamily\Large\bfseries \jeb@title} \\
%\vspace{5mm}
%{\sffamily\normalsize\mdseries\jeb@authorlist} \\
%\vspace{3mm}
%{\sffamily\small\mdseries\jeb@affiliationlist} \\
%\vspace{2mm}
%{\sffamily\footnotesize\mdseries\jeb@contact}\\
%\vspace{4mm}
%{\sffamily\small\mdseries\jeb@date}\\
%\vspace{10mm}
%{\sffamily\small\bfseries SUMMARY}
%\end{center}%
%\vspace{-6pt}
%{\sffamily\small\bfseries\jeb@summary}
%{\sffamily\small\mdseries\jeb@supplementary}
%{\sffamily\small\mdseries\jeb@keywords}
%\vspace{5mm}
%]\small
%\thispagestyle{plain}
%\fancypagestyle{plain}{%
%\fancyhead{}
%\fancyhead[RO]{\sffamily\thepage}
%\fancyfoot{}
%\fancyfoot[CO,CE]{\small THE JOURNAL OF EXPERIMENTAL BIOLOGY (draft)}
%\renewcommand{\headrulewidth}{0 pt}
%\renewcommand{\footrulewidth}{0 pt}}
%}} % else
%
%



%
%% Change formatting of Fig. and Table x. 
%\ifthenelse{\boolean{isdraft}}
%{\usepackage[figurename = Fig.,labelsep= period,font={sf, normalsize, singlespacing} ]{caption}}
%{\usepackage[figurename = Fig.,labelsep= period,font={sf, scriptsize, singlespacing} ]{caption}}
%\newcommand\jebtablefont{\sffamily\small}
%% Setup for side cap figures
%%\RequirePackage[raggedright,rightcaption]{sidecap}
%%\sidecaptionvpos{figure}{c}
%\newcommand{\jebSCfigure}[3]{%
%\begin{center}%
%\begin{minipage}[c]{\jebtwothirdswidth}%
%#3%
%\end{minipage}\hspace*{4mm}%
%\begin{minipage}[c]{60mm}%
%\caption{#2}%
%\label{#1}%
%\end{minipage}%
%\end{center}}
%\ifthenelse{\boolean{isdraft}}
%{\renewcommand{\jebSCfigure}[3]{
%%\begin{figure*}%
%#3%
%\caption{#2}%
%\label{#1}%
%%\end{figure*}
%}}%then
%{}%else
%
%

%
%
%% Typeset acknowledgements section
%\ifthenelse{\boolean{isdraft}}
%{\newcommand{\jebacknowledgements}[1]{\medskip\sffamily\normalsize\noindent\par #1}}
%{\newcommand{\jebacknowledgements}[1]{\vspace{2mm}\sffamily\scriptsize #1}}
%


%
%\ifthenelse{\boolean{isdraft}}
%{% Place floats at end when manuscript mode
%\usepackage[nolists,heads,tablesfirst]{endfloat}
%%\include{jebendfloat.cfg}
%\AtBeginDelayedFloats{\cleardoublepage}
%\renewcommand{\figuresection}{FIGURES}
%\renewcommand{\tablesection}{TABLES}
%} % then
%{% Change some float parameters to get nicer placement
%\setcounter{topnumber}{3}
%\setcounter{bottomnumber}{3}
%\setcounter{totalnumber}{6}
%\renewcommand{\topfraction}{0.85}
%\renewcommand{\bottomfraction}{0.85}
%} % else do not place floats at end
%
%
