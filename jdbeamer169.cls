\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jdbeamer169}[2019/07/12 Beamer presentation class of Joern Dietrich]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[aspectratio=169]{beamer}

\RequirePackage{fontspec} 
\RequirePackage{polyglossia} 
\setmainlanguage{english}
\setotherlanguage{german}

\RequirePackage[autostyle,english=american]{csquotes}
\RequirePackage{amsmath,amssymb,amsthm,amsfonts} 
\allowdisplaybreaks
\RequirePackage{graphicx}

\RequirePackage{tikz} 
\usetikzlibrary{calc}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.16}

\RequirePackage{hyperref}

%% SETTINGS
% redefine this color for other faculties
\definecolor{basecolor}{RGB}{86,170,28}% faculty_green

\setbeamercolor{structure}{fg=basecolor,bg=white}
%\usecolortheme{rose} %use for colored blocks

\setbeamerfont{title}{size=\large,series=\bfseries,parent=structure}
\setbeamerfont{subtitle}{size=\footnotesize,parent=title}
%\setbeamerfont{footnote}{size=\tiny}

\setbeamertemplate{section in toc}[default] 
\setbeamertemplate{subsection in toc}[default]
\setbeamertemplate{subsubsection in toc}{$\blacktriangleright$}

\setbeamertemplate{itemize items}[default] 
\setbeamertemplate{enumerate items}[default]
\setbeamertemplate{navigation symbols}{}

\setbeamertemplate{headline} {\vspace{1mm} \color{basecolor} 
    \begin{tikzpicture}
	\draw (0,0) -- (\pagewidth-0.4pt,0cm);
	\node[fill=basecolor,text=white,below right,inner sep=1mm] (page) at (0,0) 
	{\pagename~\insertframenumber};
	\node[right,inner sep=1mm] at (page.east) 
	{\quad\insertshorttitle \; $|$ \; \insertshortauthor \; $|$ \; \insertdate};
    \end{tikzpicture}
    \vspace*{3mm}
}

\def\titlegraphic#1{\def\thetitlegraphic{#1}}

\renewcommand{\titlepage}
{
    \begin{center}
    \vspace{5mm}
    \@ifundefined{thetitlegraphic}{
	\includegraphics[height=5cm]{figures/missingFigure}
    }{%
	\vspace{1ex} 
	\includegraphics[height=4cm]{\thetitlegraphic}
	\vspace{1ex}
    }
    \end{center}
    \begin{tikzpicture}[overlay, remember picture]
        \node[below left] at ($(current page.north east)-(3mm,3mm)$)
        {\includegraphics[width=0.4\linewidth]{figures/UniLogo}};

        \node[above right] at ($(current page.south west)+(6mm,3mm)$) {%
	    \begin{tabular}{p{0.35\linewidth} p{0.6\linewidth}}
        	{\color{black} \footnotesize \insertauthor \;$|$ \insertdate} 
        	& {\usebeamerfont{title}\color{basecolor} \inserttitle} \\
        	\tiny \insertinstitute
        	& \vspace{-2mm} {\usebeamerfont{subtitle}\color{basecolor} \insertsubtitle} 
            \end{tabular}
            \vspace*{3mm}
        };
    \end{tikzpicture}
}

% Provides simple node anchors
\newcommand{\jdnode}[2]{\tikz[remember picture,baseline=(#1.base)]\node[inner sep=0] (#1){#2};}
