\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%PACKAGES%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{0E5484}
\definecolor{maindarkgray}{HTML}{B3B3B3}
\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{asidecolor}{sidecolor}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
  \colorlet{asidecolor}{sidecolor}
\fi


\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%%%%%%%%
% Profile left SideBar %
%%%%%%%%%%%%%%%%

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%


\newcommand{\profilesection}[2]{{\noindent\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt} \vspace{1pt}}}


\newcommand{\cvdate}[1]{\renewcommand{\givencvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}
\newcommand{\languages}[1]{\renewcommand{\givenlanguages}{#1}}
\newcommand{\computerskills}[1]{\renewcommand{\givencomputerskills}{#1}}
\newcommand{\personalinfo}[1]{\renewcommand{\givenpersonalinfo}{#1}}

\newcommand{\givencvname}{REQUIRED!}
\newcommand{\givencvdate}{}
\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givencvaddress}{} 
\newcommand{\givencvjobtitle}{}
\newcommand{\givenpersonalinfo}{}
\newcommand{\givenlanguages}{}
\newcommand{\givencomputerskills}{}



\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}
\newcommand*\round[2]{%
  \tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm,
    text height=3.6mm,  fill=#2,#2,text=white](char){#1} ;}



  
\newcommand{\makeprofile}
{
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=asidecolor, anchor=west, minimum width=\paperwidth+2cm, minimum height=4.25cm] (box) at (-8cm,0cm){};
\end{tikzpicture}

\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=asidecolor, anchor=north, minimum width=9.90cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
\end{tikzpicture}

\vspace{-10pt}
{\Huge\color{mainblue}\givencvname} \newline
{\Large\color{black!80}\givencvjobtitle}
\vspace{20pt}

\begin{textblock}{6}(0.5, 0.2)
\vspace{63pt}
\begin{flushleft}
\hspace{2pt}
\renewcommand{\arraystretch}{1.6}

\begin{flushleft}
\section{personal info}
\givenpersonalinfo 
\end{flushleft}
\vspace{10pt}

\begin{flushleft}
\section{languages}
\givenlanguages 
\end{flushleft}
\vspace{10pt}

\begin{flushleft}
\section{programming languages}
\givencomputerskills
\end{flushleft}

\end{flushleft}
\end{textblock}
\vspace{-10pt}
 }

%%%%%%%%%%%%%%%%
% Section Color box %
%%%%%%%%%%%%%%%%
\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
   \round{#1#2#3}{
      \ifcase\value{colorCounter}%
        maingray\or%
        mainblue\or%
        maingray\or%
        mainblue\else%
        maingray\fi%
    }%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par%\vspace{\parskip}
  {%
    \LARGE\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List twenty environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{twenty}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitem}[4]{%
  \hspace{5pt}#1&\parbox[t]{12.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize#3}\\%
    #4\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%%%%%%%%%%
% Small twenty List environment %
%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\tabcolsep}{0pt}
\newenvironment{twentyshort}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\color{headercolor}}
\newcommand{\twentyitemshort}[2]{%
  \hspace{5pt}#1&\parbox[t]{12.8cm}{%
    \textbf{#2}%
  }\\}


%%%%%%%%%%%%
% Page Setting %
%%%%%%%%%%%%

\RequirePackage[left=6.0cm,top=0.1cm,right=0.5cm,bottom=0.2cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
