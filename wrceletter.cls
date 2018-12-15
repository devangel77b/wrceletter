% wrceletter.sty
% Revision Original, Dennis Evangelista, 2018
% Format based on Cornell University letter (cornell-letter.sty), Stanford 
% suletter.sty and MIT mitletter3.cls 

\ProvidesClass{wrceletter}
\typeout{** USNA Dept of Weapons, Robotics, and Control Engineering}
\typeout{** Letterhead Document Class}
\typeout{** Based on the Navy Correspondence Manual for flag letters}



% process options here, following uw-cs-letterhead
\RequirePackage{kvoptions}
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOption}{letter}%
}
\ProcessKeyvalOptions*
\LoadClass{letter}


% load stuff
\RequirePackage{etoolbox}
\RequirePackage{mathptmx}
\RequirePackage{fancyhdr}
\RequirePackage[margin=1in,papersize={8.5in,11in}]{geometry}
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}
\RequirePackage{hyperref}

%%% letter.cls already defines the following:
% \newcommand*{\name}[1]{\def\fromname{#1}}
% \newcommand*{\signature}[1]{\def\fromsig{#1}}
% \newcommand*{\address}[1]{\def\fromaddress{#1}}
% \newcommand*{\location}[1]{\def\fromlocation{#1}}
% \newcommand*{\telephone}[1]{\def\telephonenum{#1}}
%% Add the following to customize:
\newcommand*{\position}[1]{\def\mypos{#1}}
\newcommand*{\email}[1]{\def\emailaddr{#1}}
\position{}
\email{}

%\setlength{\headwidth}{\paperwidth}

% for first page with address
\fancypagestyle{firstpage}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\chead{}
\lhead{%
\hspace*{-0.9in}
\raisebox{0.0625in}{\includegraphics[height=1.25in,valign=c]{crest-cropped.png}}%
\begin{minipage}[c]{5.25in}
\hspace*{0.4375in}\normalsize\fromname%
\hrule
\vspace{2pt}
\hspace*{0.4375in}\scriptsize\mypos, Weapons, Robotics and Control Engineering\\
\hspace*{0.4375in}United States Naval Academy\\
\hspace*{0.4375in}\emailaddr\\
\hspace*{0.4375in}\telephonenum
\end{minipage}%
\raisebox{0.05in}{\includegraphics[height=0.875in,valign=c]{WRCE-logo.png}%
\includegraphics[height=0.875in,valign=c]{WRCE-wordmark.png}%
}}
\rhead{}
}

% for first page no address is the same
\fancypagestyle{empty}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\chead{}
\lhead{%
\hspace*{-0.9in}
\raisebox{0.0625in}{\includegraphics[height=1.25in,valign=c]{crest-cropped.png}}%
\begin{minipage}[c]{5.25in}
\hspace*{0.4375in}\normalsize\fromname%
\hrule
\vspace{2pt}
\hspace*{0.4375in}\scriptsize\mypos, Weapons, Robotics and Control Engineering\\
\hspace*{0.4375in}United States Naval Academy\\
\hspace*{0.4375in}\emailaddr\\
\hspace*{0.4375in}\telephonenum
\end{minipage}%
\raisebox{0.05in}{\includegraphics[height=0.875in,valign=c]{WRCE-logo.png}%
\includegraphics[height=0.875in,valign=c]{WRCE-wordmark.png}%
}}
\rhead{}
}

% other pages
\fancypagestyle{plain}{%
\fancyhf{}
}




