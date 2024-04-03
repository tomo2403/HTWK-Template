%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HTWK Leipzig Aufgabe (Vorlage)
% LaTeX Class
% Version 1.0 (Apr 08, 2024)
%
% Author:
% Tom Mohr (tom.mohr@stud.htwk-leipzig.de)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	KLASSEN KONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HtwkAssignment}[2024/04/08 HTWK Leipzig Aufgabe v1.0]

%\RequirePackage{kvoptions} % Erweitert die Klassenoptionen
%\SetupKeyvalOptions{
%	family=HtwkAssignment,
%	prefix=HtwkAssignment@,
%	setkeys=\kvsetkeys
%}

%\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrartcl}} % Weitere Optionen an Basisklasse weiterreichen
%\ProcessKeyvalOptions{HtwkAssignment} % Klassenoptionen verarbeiten

\PassOptionsToClass{\CurrentOption}{scrartcl}
\ProcessOptions*

\LoadClass[a4paper, oneside, 12pt]{scrartcl} % Basisklasse laden

\usepackage[ngerman]{babel}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{lastpage}
\usepackage[headsepline]{scrlayer-scrpage}

\pagestyle{scrheadings}
\renewcommand\pagemark{{\usekomafont{pagenumber}\thepage\ von \pageref{LastPage}}}
\setkomafont{pageheadfoot}{\normalfont\footnotesize\scshape}

%----------------------------------------------------------------------------------------
%	STANDARD Inhalt
%----------------------------------------------------------------------------------------

\AtBeginDocument{
	\makeatletter
	\let\thisauthor\@author
	\makeatother

	% Header
	\ohead{HTWK Leipzig}
	\ihead{\thisauthor}

	\maketitle
}