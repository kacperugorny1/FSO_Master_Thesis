%Szablon pracy dyplomowej poprawiony i zmodyfikowany na potrzeby wydziału Elektroniki, Mikrosystemów i Fotoniki Politechniki Wrocławskiej

%plik dyplompwr.cls wystarczy umieścić w katalogu zawierającym plik główny pracy .tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dyplompwr}

% Inicjalizacja opcji
\newif\if@archive
\newif\if@oneside
\newif\if@engineer
\newif\if@master
\newif\if@eng
\newif\if@pl
\newif\if@old

\@mastertrue
\@archivetrue
\@pltrue
\DeclareOption{archive}{\@archivetrue\@onesidefalse}
\DeclareOption{oneside}{\@onesidetrue\@archivefalse}
\DeclareOption{engineer}{\@engineertrue\@masterfalse}
\DeclareOption{master}{\@mastertrue\@engineerfalse}
\DeclareOption{enold}{\@engtrue\@plfalse}
\DeclareOption{en}{\@engtrue\@plfalse}
\DeclareOption{pl}{\@pltrue\@engfalse}
\DeclareOption{oldtitlepage}{\@oldtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwrep}}
\ProcessOptions

% Wczytywanie klasy bazowej -- mwrep -- wraz z odpowiednią interlinią i marginesami
\if@archive
	\LoadClass[12pt,openany,twoside]{mwrep}
	\RequirePackage[a4paper,outer=2cm,inner=3.5cm,top=2.5cm,bottom=2.5cm]{geometry}
% Interlinia jest ustawiana na 1
	\RequirePackage[singlespacing]{setspace}
\fi

\if@oneside
	\LoadClass[12pt]{mwrep}
	\RequirePackage[a4paper,top=2.5cm,left=3.5cm,right=2.5cm,bottom=2.5cm]{geometry}
% Zmieniamy interlinię na 1.5 dla poprawienia przejrzystości
	\RequirePackage[onehalfspacing]{setspace}
\fi

%%		Wymagane pakiety
\RequirePackage{graphicx}

\RequirePackage[ddmmyyyy]{datetime}
% standardowy font, ładowany dla pewności
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
% to na potrzeby strony tytułowej
\RequirePackage{xcolor}
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}

%%		Opcje językowe na potrzeby strony tytułowej
\if@pl
	\def\xd{Promotor: }
	\if@master
		\def\thesisheader{PRACA DYPLOMOWA \\ MAGISTERSKA}
	\fi
	\if@engineer
		\def\thesisheader{PRACA DYPLOMOWA \\ IN\.{Z}YNIERSKA}
	\fi
\fi


\if@eng
	\def\xd{Supervisor: }
	\if@master
		\def\thesisheader{Master Thesis}
	\fi
	\if@engineer
		\def\thesisheader{Bachelor Thesis}
	\fi

\fi

%%		Strona tytułowa
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\consultant#1{\gdef\@consultant{#1}}
\def\city#1{\gdef\@city{#1}}
\def\year#1{\gdef\@year{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}
\def\fieldofstudy#1{\gdef\@fieldofstudy{#1}}
\def\speciality#1{\gdef\@speciality{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}
\def\abstract#1{\gdef\@abstract{#1}}
\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
\def\titlen#1{\gdef\@titlen{#1}}
\def\@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}

\consultant{}

\if@pl
	\RequirePackage{polski}
	\renewcommand{\figurename}{Rys.}
	\renewcommand{\tablename}{Tab.}
\fi
\if@eng
	\renewcommand{\figurename}{Fig.}
	\renewcommand{\tablename}{Tab.}
\fi

\renewcommand{\paragraph}{\@startsection{paragraph}{4}{0ex}
   {-3.25ex plus -1ex minus -0.2ex}
   {1.5ex plus 0.2ex}
   {\normalfont\normalsize\itshape}}


\renewcommand\maketitle{

    \begin{titlepage}
        \newgeometry{left=25mm,right=25mm,top=25mm,bottom=25mm}
        \pagenumbering{alph}

        \begin{center}

            % --- Nazwa uczelni (trochę mniejsza) ---
            {\fontsize{20pt}{22pt}\fontfamily{ptm}\selectfont\bfseries
            \if@pl Politechnika Wroc\l{}awska \fi
            \if@eng Wroc\l{}aw University of Science and Technology \fi
            \par}

            \vspace{1mm}

            % --- Wydział (wyraźnie większy i pogrubiony) ---
            {\fontsize{18pt}{20pt}\fontfamily{ptm}\selectfont
            \@faculty \par}

            \vspace{2mm}
            \rule{0.9\textwidth}{0.3pt}

            \vspace{10mm}

            % --- Kierunek (bez caps locka) ---
            {\fontsize{17pt}{17pt}\selectfont
             \if@pl Kierunek: \fi
             \if@eng Field of study: \fi
             \@fieldofstudy \par}

             \vspace{0.5mm}

             {\fontsize{16pt}{16pt}\selectfont
             \if@pl Specjalność: \fi
             \if@eng Speciality: \fi
             \@speciality \par}

            \vspace{15mm}

            % --- Typ pracy – CAPS LOCK (tekst w \thesisheader już caps) ---
            {\fontsize{28pt}{30pt}\selectfont\bfseries
             \thesisheader\par}

            \vspace{20mm}

            % --- Tytuł ---
            {\fontsize{18pt}{20pt}\selectfont
            \if@pl Tytu\l{} pracy: \fi
            \if@eng Title of Thesis: \fi
            \par}

            \vspace{3mm}

            {\fontsize{22pt}{22pt}\selectfont\bfseries
            \@title \par}

            % --- Autor (niżej) ---
            \vspace{35mm}

            {\fontsize{18pt}{20pt}\selectfont
            \if@pl {AUTOR:} \fi
            \if@eng {AUTHOR:} \fi
            \par}

            \vspace{2mm}

            {\fontsize{16pt}{18pt}\selectfont
            \@author \par}

            \vspace{12mm}

            % --- Promotor / Supervisor ---
            {\fontsize{18pt}{20pt}\selectfont
            \if@pl {OPIEKUN:} \fi
            \if@eng {SUPERVISOR:} \fi
            \par}

            \vspace{2mm}

            {\fontsize{16pt}{18pt}\selectfont
            \@supervisor \par}

            \vfill

            \rule{0.9\textwidth}{0.3pt}

            \vspace{3mm}

            {\fontsize{16pt}{18pt}\fontfamily{ptm}\selectfont
            {\@city\ \@year}\par}

        \end{center}

        \cleardoublepage
    \end{titlepage}

    \restoregeometry
    \pagenumbering{arabic}
}




%wymuszenie ukrywania rozdziałów w spisie treści
\renewcommand*\chapter@toc{%
  \ifHeadingNumbered\typeout{\@chapapp\space\thechapter.}
  \addcontentsline{toc}{chapter}{%
        \ifHeadingNumbered
 \protect\numberline{\mw@seccntformat{\HeadingNumber}}%
        \fi
            \HeadingTOCText}\fi%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  }
%

% Wymusza jednopoziomowe numerowanie tabel rysunków i wzorów.
% W przypadku chęci powrotu do domyślengo wielopoziomowego numerowania usunąć poniższe linie.
\newcommand{\oneLevelNumbering}{
	\usepackage{chngcntr}
	\counterwithout{figure}{chapter}
	\counterwithout{table}{chapter}
	\counterwithout{equation}{chapter}
}
%

% wymuszenie numeru strony po prawej
\newcommand{\pageNumberOnTheRight}{
	\RequirePackage{fancyhdr}
	\pagestyle{fancy}
	\if@oneside
		\fancyhf{}\fancyfoot[R]{\thepage}

		\fancypagestyle{opening}{\fancyhf{}\fancyfoot[R]{\thepage}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0pt}}
		\fancypagestyle{closing}{\fancyhf{}\fancyfoot[R]{\thepage}%
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0pt}}
	\else
		\fancyhf{}\fancyfoot[RO,LE]{\thepage}

		\fancypagestyle{opening}{\fancyhf{}\fancyfoot[RO,LE]{\thepage}
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0pt}}
		\fancypagestyle{closing}{\fancyhf{}\fancyfoot[RO,LE]{\thepage}%
			\renewcommand{\headrulewidth}{0pt}
			\renewcommand{\footrulewidth}{0pt}}
	\fi
}

\endinput