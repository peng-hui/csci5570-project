% grf.sty
% General Research Fund - University Grants Committee of Hong Kong
% 2017-Oct-01 Wei Meng wei@cse.cuhk.edu.hk
%
\def\fileversion{v1.0}
\def\filedate{October 1, 2017}  

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{grf}[2017/10/01 version 1.0 General Research Fund]

% Report options
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{report}
}
\DeclareOption{a4paper}{
  \PassOptionsToClass{\CurrentOption}{report}
}

% Fallback
\DeclareOption*{
  \ClassWarning{grf}{Unknown option '\CurrentOption'}
}

% Execute default options
\ExecuteOptions{12pt,a4paper}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass{report}

% Page layout
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Font
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext} % Times New Roman font for text
\RequirePackage{newtxmath} % Times New Roman font for math
%\RequirePackage{mathptmx} % Times Roman, including math

% Reference
\RequirePackage[square,comma,numbers,sort&compress]{natbib}
\renewcommand{\bibname}{References}
\renewcommand\bibsection{
    \clearpage
    \refstepcounter{chapter}%
    \addcontentsline{toc}{chapter}{\bibname}
    \section*{\bibname}}

% Title spacing
\RequirePackage{titlesec}
\titlespacing\chapter{0pt}{12pt}{4pt}
\titlespacing\section{0pt}{12pt}{4pt}
\titlespacing\subsection{0pt}{12pt}{4pt}
\titlespacing\subsubsection{0pt}{12pt}{0pt}

% Title format
\RequirePackage[normalem]{ulem} % For \uline command
\titleformat{\chapter}
{\normalfont\Large\bfseries}{\thechapter}{1em}{}
\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}
{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{\uline}
\titleformat{\paragraph}[runin]
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}[runin]
{\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}

% Sections
\setcounter{section}{0}
\renewcommand{\thesection}{\thechapter.\Alph{section}}

\newcommand\ichapter[1]{%
  \refstepcounter{chapter}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}%
  \chaptermark{#1}}

\newcommand\isection[1]{%
  \refstepcounter{section}%
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}%
  \sectionmark{#1}}

% Change chapter page style from "plain" to "empty"
\makeatletter
\let\ps@plain\ps@empty
\makeatother

\endinput

