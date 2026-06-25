\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dyplompwrr}

% In accordance with: https://wefim.pwr.edu.pl/en/students/studia-1-i-2-stopnia/dyplomanci/zasady-edytowania-pracy
% And:                https://wefim.pwr.edu.pl/studenci/studia-1-i-2-stopnia/dyplomowanie/zasady-edytowania-pracy

\newif\if@engineer
\newif\if@master
\@mastertrue

\DeclareOption{master}{\@mastertrue\@engineerfalse}
\DeclareOption{engineer}{\@engineertrue\@masterfalse}

% can be used as follows:
% \documentclass[master,oneside,en,oldtitlepage]{dyplompwr}
% \documentclass[engineer,oneside,en,oldtitlepage]{dyplompwr}
\DeclareOption{oneside}{}
\DeclareOption{en}{}
\DeclareOption{oldtitlepage}{}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwrep}}
\ProcessOptions\relax

% Base class
\LoadClass[12pt]{mwrep}

% Page layout for oneside
\RequirePackage[a4paper,top=2.54cm,left=2.54cm,right=2.54cm,bottom=2.54cm]{geometry}
\RequirePackage[onehalfspacing]{setspace}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}

% English labels
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Tab.}

% Thesis type
\def\xd{Supervisor: }
\if@master
  \def\thesisheader{Master Thesis}
\fi
\if@engineer
  \def\thesisheader{Bachelor Thesis}
\fi

% Metadata used on title page
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\city#1{\gdef\@city{#1}}
\def\year#1{\gdef\@year{#1}}
\def\fieldofstudy#1{\gdef\@fieldofstudy{#1}}
\def\speciality#1{\gdef\@speciality{#1}}
\def\faculty#1{\gdef\@faculty{#1}}

\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}
\def\@city{\@latex@error{No \noexpand\city given}\@ehc}
\def\@year{\@latex@error{No \noexpand\year given}\@ehc}
\def\@fieldofstudy{\@latex@error{No \noexpand\fieldofstudy given}\@ehc}
\def\@speciality{\@latex@error{No \noexpand\speciality given}\@ehc}
\def\@faculty{\@latex@error{No \noexpand\faculty given}\@ehc}

\newcommand{\TitleLine}[1]{%
  \noindent\makebox[\textwidth][c]{#1}\par
}

\newcommand{\TitleBlock}[2]{%
  \noindent\makebox[\textwidth][c]{%
    \parbox{#1}{\centering #2}%
  }\par
}

\renewcommand\maketitle{%
  \begin{titlepage}
    \newgeometry{left=25.4mm,right=25.4mm,top=12.5mm,bottom=12.5mm}
    % \pagenumbering{alph}
    \pagenumbering{roman}
    \thispagestyle{empty}

    \vspace*{-4mm}

    \TitleLine{%
      {\fontsize{20pt}{20pt}\selectfont\fontfamily{ptm}\selectfont
      \textbf{Wroc\l{}aw University of Science and Technology}}%
    }

    \vspace{1mm}

    \TitleLine{%
      {\fontsize{18pt}{18pt}\selectfont\fontfamily{ptm}\selectfont
      \@faculty}%
    }

    \vspace{1mm}
    \noindent\rule{\textwidth}{0.5mm}

    \vspace{14mm}

    \TitleLine{%
      {\fontsize{17pt}{17pt}\selectfont\fontfamily{ptm}\selectfont
      Field of study: \@fieldofstudy}%
    }

    \vspace{2mm}

    \TitleLine{%
      {\fontsize{16pt}{16pt}\selectfont\fontfamily{ptm}\selectfont
      Speciality: \@speciality}%
    }

    \vspace{24mm}

    \TitleBlock{140mm}{%
      \onehalfspacing
      {\fontsize{28pt}{28pt}\selectfont\fontfamily{ptm}\selectfont
      \textbf{\thesisheader}}%
    }

    \vspace{38mm}

    \TitleBlock{140mm}{%
      \onehalfspacing
      {\fontsize{18pt}{18pt}\selectfont\fontfamily{ptm}\selectfont
      Title of Thesis:\\[4mm]
      \fontsize{20pt}{20pt}\textbf{\@title}}%
    }

    \vspace{40mm}

    \TitleLine{%
      {\fontsize{18pt}{18pt}\selectfont\fontfamily{ptm}\selectfont
      AUTHOR:}%
    }

    \vspace{5mm}

    \TitleBlock{140mm}{%
      \onehalfspacing
      {\fontsize{16pt}{16pt}\selectfont\fontfamily{ptm}\selectfont
      \@author}%
    }

    \vspace{16mm}

    \TitleLine{%
      {\fontsize{18pt}{18pt}\selectfont\fontfamily{ptm}\selectfont
      SUPERVISOR:}%
    }

    \vspace{5mm}

    \TitleBlock{140mm}{%
      \onehalfspacing
      {\fontsize{16pt}{16pt}\selectfont\fontfamily{ptm}\selectfont
      \@supervisor}%
    }

    \vspace{15mm}

    \noindent\rule{\textwidth}{0.5mm}

    \vspace{4mm}

    \TitleLine{%
      {\fontsize{18pt}{18pt}\selectfont\fontfamily{ptm}\selectfont
      \@city\ \@year}%
    }

  \end{titlepage}

  \restoregeometry
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@faculty\@empty
  \global\let\@supervisor\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\faculty\relax
  \global\let\supervisor\relax
  \pagenumbering{arabic}
}

\endinput