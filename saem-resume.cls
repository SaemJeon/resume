% Saem's Resume Style File: saem-resume.cls
\LoadClass{article}
\ProvidesClass{saem-resume}[5/19/2021 Saem's resume style]
\NeedsTeXFormat{LaTeX2e}

% -------------------------------------------------------------------------
% Package
% -------------------------------------------------------------------------
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage[hidelinks,unicode]{hyperref}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage{anyfontsize}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}

% -------------------------------------------------------------------------
% Configuration
% -------------------------------------------------------------------------
%% Page layout
\geometry{left=1.5cm, top=1.5cm, right=1.5cm, bottom=2.0cm, footskip=.5cm}

%% Remove header and footer
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

%% Color
\definecolor{black}{HTML}{000000}

%% Font
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\thinfont[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

% -------------------------------------------------------------------------
% Header
% -------------------------------------------------------------------------
%% Common
\newcommand{\headerbar}{\quad\textbar\quad}

%% Style
\newcommand{\headerName}[1]{\centerline{\fontsize{32pt}{1em}\headerfont\bfseries #1}}
\newcommand{\headerAddress}[1]{\centerline{\fontsize{9pt}{1em}\headerfont\itshape #1}}
\newcommand{\headerContact}[5]{\centerline{\fontsize{7pt}{1em}\headerfont
  \faMobile\space #1\headerbar
  \href{mailto:#2}{\faEnvelope\space #2\headerbar}
  \href{http://#3}{\faHome\space #3\headerbar}
  \href{https://github.com/#4}{\faGithubSquare\space #4\headerbar}
  \href{https://linkedin.com/in/#5}{\faLinkedinSquare\space #5}
}}

%% Create header
\newcommand{\header}[7]{
  \headerName{#1}
  \headerAddress{#2}
  \headerContact{#3}{#4}{#5}{#6}{#7}
  \smallskip
}

% -------------------------------------------------------------------------
% New commands
% -------------------------------------------------------------------------
%% Section
\renewcommand{\section}[1]{
  {\noindent\raggedright\fontsize{16pt}{1em}\bfseries\bodyfont #1 \hrulefill}
  \medskip
}

%% Entries
\newcommand{\entryPosition}[1]{{\noindent\fontsize{9.5pt}{1em}\bodyfont\bfseries #1}}
\newcommand{\entryDescription}[1]{{\noindent\fontsize{9pt}{1em}\bodyfontlight #1}}
\newcommand{\entryDate}[1]{{\fontsize{9pt}{1em}\bodyfontlight\itshape #1}}
\newcommand{\entryItem}[1]{
  \noindent\begin{description}
    \item[]{\textbullet\space\space\fontsize{9pt}{1em}\bodyfontlight\upshape #1}
  \end{description}
  \vspace{-5mm}
}


% -------------------------------------------------------------------------
% Education
% -------------------------------------------------------------------------
\newcommand{\education}[7]{
\noindent\begin{tabularx}{\textwidth}{@{\extracolsep{\fill}\hspace{1mm}\vspace{0.5mm}}
  >{\raggedright\arraybackslash}X 
  >{\raggedleft\arraybackslash}X}
  \entryPosition{#1} & \entryDate{#2} \\
  \entryDescription{#3} & \entryDate{#4} \\
  \entryDescription{#5} & \entryDate{#6} \\
  \entryDescription{#7} \\
  \\[-4mm]
 \end{tabularx}
}

% -------------------------------------------------------------------------
% Skills
% -------------------------------------------------------------------------
\newcommand{\skills}[6]{
\noindent\begin{tabularx}{\textwidth}{@{\extracolsep{\fill}\hspace{1mm}\vspace{0.4mm}}
  >{\raggedright\arraybackslash\hsize=.2\hsize\linewidth=\hsize}X 
  >{\raggedright\arraybackslash}X}
  \entryPosition{#1} & \entryDescription{#2} \\
  \entryPosition{#3} & \entryDescription{#4} \\
  \entryPosition{#5} & \entryDescription{#6} \\
  \\[-4mm]
 \end{tabularx}
}

% \newcommand{\skills}[2]{
%   \indent\hspace{-4mm}\entryPosition{#1} \quad \entryDescription{#2} \hfill
% }

% -------------------------------------------------------------------------
% Experience
% -------------------------------------------------------------------------
\newenvironment{cvitems}{%
  \vspace{-5.0mm}
}{%
  \vspace{4.5mm}
}

\newcommand{\experience}[4]{
\noindent\begin{tabularx}{\textwidth}{@{\extracolsep{\fill}\hspace{1mm}\vspace{1mm}}
  >{\raggedright\arraybackslash}X 
  >{\raggedleft\arraybackslash\hsize=.3\hsize\linewidth=\hsize}X}
  \entryPosition{#1} & \entryDate{#2} \\
  \entryDescription{#3} & \entryDate{#4} \\
 \end{tabularx}
}

% -------------------------------------------------------------------------
% Activities
% -------------------------------------------------------------------------
\newcommand{\activity}[3]{
  \indent\hspace{-4mm}\entryPosition{#1}, \entryDescription{#2} \hfill \entryDate{#3}
}