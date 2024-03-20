%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HTWK Leipzig Abschlussarbeit (Vorlage)
% LaTeX Class
% Version 1.0 (Mar 20, 2024)
%
% Author:
% Tom Mohr (tom.mohr@stud.htwk-leipzig.de)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	KLASSEN KONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HtwkThesis}[2024/03/20 HTWK Leipzig Abschlussarbeit (Vorlage) v1.0]

\usepackage{etoolbox} % Required for conditional logic and easily changing commands

\DeclareOption{ngerman}{\PassOptionsToPackage{main=\CurrentOption}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{main=\CurrentOption}{babel}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}} % Pass through any extra options specified to the base class
\ProcessOptions\relax % Process class options

\LoadClass{scrbook} % Load the base class


%----- Schrift und Sprache --------------
\usepackage[ngerman]{babel}				%%% Sprachpaket für Deutsche Sprache

\usepackage[utf8]{inputenc}				%%% Verwendung von Umlauten und Kodierung dieser, sodass Latex es kompilieren kann

\usepackage[T1]{fontenc} 				%%% Silbentrennung bei Sonderzeichen

\usepackage{textcomp}					%%% Zusätzlihe Symbolzeichen

\usepackage{courier}					%%% Schriftart-Paket

\usepackage{lmodern}					%%% (=Lain Modern) Ausgabe von flüssigem, wenig verpixeltem Text

\usepackage{romanbar}					%%% Verwendung römischer Zahlen

\usepackage{siunitx}					%%% Setzt Einheiten und Zahlen korrekt - nützlich besonders bei naturwissenschaftlichen Arbeiten

%------ Seite einrichten ----------------
\usepackage[includehead,includefoot, left=3.0cm, right=2.5cm, top=2.5cm, bottom=2.5cm,showframe]{geometry}								%%% Gestaltung der Seitenrändern, Kopf- und Fußzeile

\usepackage[onehalfspacing]{setspace} 	%%% Zeilenbstand anpassen, Hier:1,5-fach

\usepackage{scrextend}					%%% Erweitert die Möglichkeiten von bestimmten Dokumentklassen

%----- Mathemaische Formeln ------------
\usepackage{amsmath} 					%%% Erweitert den möglichen Formelsatz
\usepackage{amssymb}					%%% Fügt weiter mathematische Symbole und Pfeile ein

%----- Tabellen ------------------------
\usepackage{booktabs}					%%% Tabellen formatieren - horizotale Linien

\usepackage{multirow}					%%% Tabellen foratieren - mehrzeiliger Text in einer Zelle

\usepackage{colortbl}					%%% Um Zellen in Tabellen einzufärben
\usepackage{xcolor} 					%%% Bindet ein Farb-Paket ein

%%% Vergrößerung des Platzes in Tabellen, besonders nach \hline notwenig
\newcommand\T{\rule{0pt}{2.6ex}}       	% oben
\newcommand\B{\rule[-1.2ex]{0pt}{0pt}} 	% unten

\usepackage{subfigure}					%%% Zur beschriftung mehrerer Bilder mit dem gleichen Titel

\usepackage{float}						%%% Biler und Tabellen werden horizontal umflossen

\usepackage[export]{adjustbox}			%%% Ausrichtung von Figuren links, rechts, zentriert, innen und außen

%----- Zitieren und Referenzen -----------------
\usepackage[sort]{natbib}				%%% Zitationstil festlegen (Hier: Autor, Jahr)

\usepackage[german=quotes]{csquotes} 	%%% korrektes Anzeigen von Zitaten

\usepackage{makeidx}
\makeindex

%----- Hyperlinks -----------------------------
\usepackage{hyperref}					%%% Einbinden von Links und Verweisen im Dokument
\hypersetup{colorlinks=true} 			%%% Ermöglicht das einfärben von Links
\hypersetup{urlcolor=blue}				%%% URL werden blau angezeigt
\hypersetup{citecolor=black}			%%% Zitate werden schwarz angezeigt
\hypersetup{linkcolor=black}			%%% Verweise werden schwarz angezeigt

%----- Importieren -----

\usepackage{graphicx}					%%% Einbinden von Graiken und Bildern

\usepackage{wrapfig}					%%% um Grafiken und Bilder textumflossen einzubinden - muss als letztes Paket eingebunden werden, da es zum Teil auf andere Pakete zugreift
\usepackage{pdfpages}					%%% PDF können importiert werden


%----------------------------------------------------------------------------------------
%	RECOMMAND
%----------------------------------------------------------------------------------------

\setcounter{tocdepth}{3}			% Regelt Tiefe des Inhaltsverzeichnisses - bis \subsubsections

\setcounter{secnumdepth}{3}			% Regelt Tiefe der Nummerierung - nur bis subsection

\renewcommand{\arraystretch}{1.4}	% Vergrößert den Abstand von Zeiler innerhalb einer Tabelle

\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5cm}}		% Die Titel haben einen kleineren Abstand zur oberen Seitenkante

\renewcommand{\figurename}{Abb.}	% Bilder werden nicht mehr mit "Abbildung" betitelt, sondern mit "Abb."

%----------------------------------------------------------------------------------------
%	TITELSEITE
%----------------------------------------------------------------------------------------

\AtBeginDocument{
	\begin{titlepage}
		\centering

		% LOGO HTWK
		\includegraphics[width=0.4\textwidth]{Bilder/LOGO}\par
		\vspace{1cm}

		% Thema der Arbeit
		\hspace{0.09\linewidth}
		\begin{figure}[H]
			\begin{minipage}{3cm}
				\colorbox[RGB]{255,242,0}{\rule{3cm}{0pt}\rule{0pt}{8cm}}
			\end{minipage}
			\begin{minipage}{\dimexpr\linewidth-6.5cm}
				\huge\bfseries\centering
				Das ist das Thema der Abschlussarbeit
			\end{minipage}
			\begin{minipage}{3cm}
				\colorbox[RGB]{255,242,0}{\rule{3cm}{0pt}\rule{0pt}{8cm}}
			\end{minipage}
		\end{figure}

		% Ziel der Abschlussarbeit (Bachelor, Master, Diplom...)
		{\scshape\Large Abschlussarbeit zur Erlangung des akademischen Grades\par}
		{\scshape\LARGE Bachelor of Engineering \par}
		\vspace{2cm}
		% Autor
		{\Large\itshape Max Mustermann \par}
		\vfill
		% Prüfer
		Erstprüfer: Prof. Dr. \textsc{Muster}\par
		Zweitprüfer: Prof. Dr.-Ing. M. \textsc{Dios}\par
		\vfill

		% Ort & Datum
		{\large Leipzig, den \today\par}


	\end{titlepage}
}