\ProvidesClass{cv}[CV]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\renewcommand{\baselinestretch}{1.2}

\RequirePackage{xcolor}

\definecolor{inverse}{RGB}{255,255,255}
\definecolor{secondary}{HTML}{4D4D4D}
\definecolor{note}{HTML}{999999}
\definecolor{highlight}{HTML}{1E9FBF}

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont
[BoldFont=OpenSans-Bold.ttf,
ItalicFont=OpenSans-Italic.ttf]
{OpenSans-Regular.ttf}
\newfontfamily\thinfont[]{OpenSans-Light.ttf}
\newfontfamily\headingfont[]{OpenSans-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=secondary,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf
]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}

\RequirePackage{tikz}

\newcommand{\header}[3]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=secondary, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {
      \fontsize{40pt}{72pt}\color{inverse}
      {\thinfont #1}{\headingfont #2}
    };
    \node [anchor=north] at (name.south) {
      \fontsize{14pt}{24pt}\color{note}
      \thinfont #3
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {
    \LARGE\headingfont\color{highlight} #1
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}
  {
  \large\headingfont\color{secondary} #1
  }
  \par\vspace{.25\parskip}
}

\pagestyle{empty}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{secondary}}
\newcommand{\entry}[4]{
  {\footnotesize #1}&\parbox[t]{10.5cm}{
    \textbf{#2}
    \hfill
    {\footnotesize\addfontfeature{Color=note} #3}\\
    #4\vspace{\parsep}
  }\\}

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{2\baselineskip}{\Large\headingfont\color{note} ##1}
  }
  \begin{textblock}{3.6}(1.5, 3.65)
  \begin{flushright}
  \obeycr
}{
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\RequirePackage[left=6.05cm,top=2cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
