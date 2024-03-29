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
\ProvidesClass{HtwkThesisDocument}[2024/03/20 HTWK Leipzig schriftliche Arbeit (Vorlage) v1.0]

\RequirePackage{keyval}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
	family=HtwkThesisDocument,%
	prefix=HtwkTD@,%
	setkeys=\kvsetkeys
}

\usepackage{etoolbox} % Benötigt für Verarbeitung von Bedingungen
\RequirePackage{xcolor}

\DeclareVoidOption{ngerman}{\PassOptionsToPackage{main=\CurrentOption}{babel}}
\DeclareVoidOption{english}{\PassOptionsToPackage{main=\CurrentOption}{babel}}

\DeclareBoolOption{fakultaet}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}} % Weitere Optionen an Basisklasse weiterreichen
\ProcessKeyvalOptions* % Klassenoptionen verarbeiten

\LoadClass{scrbook} % Basisklasse laden

%----- Schrift und Sprache --------------
\usepackage[ngerman]{babel}				%%% Sprachpaket für Deutsche Sprache

\usepackage[utf8]{inputenc}				%%% Verwendung von Umlauten und Kodierung dieser, sodass Latex es kompilieren kann

\usepackage[default,regular,black]{sourceserifpro}				%%% Schriftart

\usepackage[T1]{fontenc} 				%%% Silbentrennung bei Sonderzeichen

\usepackage{textcomp}					%%% Zusätzlihe Symbolzeichen

\usepackage{courier}					%%% Schriftart-Paket

\usepackage{lmodern}					%%% (=Lain Modern) Ausgabe von flüssigem, wenig verpixeltem Text

\usepackage{romanbar}					%%% Verwendung römischer Zahlen

\usepackage{siunitx}					%%% Setzt Einheiten und Zahlen korrekt - nützlich besonders bei naturwissenschaftlichen Arbeiten

%------ Seite einrichten ----------------
\usepackage[includehead,includefoot, left=3.0cm, right=2.5cm, top=2.5cm, bottom=2.5cm]{geometry}								%%% Gestaltung der Seitenrändern, Kopf- und Fußzeile

\usepackage[onehalfspacing]{setspace} 	%%% Zeilenbstand anpassen, Hier:1,5-fach

%\usepackage{scrextend}					%%% Erweitert die Möglichkeiten von bestimmten Dokumentklassen

\usepackage[firstpage=true]{background}	%%% Hintergrundelemente

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
%	STANDARD Seiten
%----------------------------------------------------------------------------------------

\AtBeginDocument{
	\newgeometry{left=3.0cm, right=2.5cm, top=2.5cm, bottom=2.5cm, noheadfoot, nomarginpar}

	\begin{titlepage}
		\backgroundsetup{
			scale=1, angle=0, opacity=1, hshift=1cm, contents={
				\hspace*{\dimexpr-\leftmargin+\rightmargin-\oddsidemargin+\evensidemargin\relax}
				\colorbox[RGB]{255,237,0}{\rule{24mm}{0pt}\rule{0pt}{0.5\paperheight}}
				\hspace*{\dimexpr\textwidth-24mm-\leftmargin+\rightmargin+\oddsidemargin-\evensidemargin\relax}
				\colorbox[RGB]{255,237,0}{\rule{24mm}{0pt}\rule{0pt}{0.5\paperheight}}
			}
		}

		\newdimen\imageheight % goes into the preamble
		\settoheight{\imageheight}{%
			\includegraphics[width=0.4\paperwidth]{Bilder/HTWK_Zusatz_H_Black_K}
		}

		\raggedright

		\ifHtwkTD@fakultaet
			\begin{figure}[!htb]
				% Logo HTWK
				\begin{minipage}{0.48\textwidth}
					\includegraphics[height=\imageheight]{Bilder/HTWK_Black_K}
				\end{minipage}
				\hfill
				% Logo Fakultät
				\begin{minipage}{0.3\textwidth}
					\includegraphics[height=\imageheight]{Bilder/HTWK-Fakultaetszusatz_IM_schwarz}
				\end{minipage}
			\end{figure}
		\else
			% Logo HTWK
			\includegraphics[height=\imageheight]{Bilder/HTWK_Zusatz_H_Black_K}
		\fi


		\vfill
		\centering
		\makeatletter
		\begin{minipage}{\textwidth-4cm}
			\centering

			% Ziel der Abschlussarbeit (Bachelor, Master, Diplom...)
			{\scshape Abschlussarbeit zur Erlangung des akademischen Grades\\}
			{\scshape\LARGE\abschluss\\}
			\vspace{1.5cm}

			% Titel
			{\huge\bfseries\@title\\}
			\vspace{1.5cm}

			% Autor
			{\Large\itshape\@author}\\
			\vspace{24pt}

			% Prüfer
			Erstprüfer: \erstpruefer\\
			Zweitprüfer: \zweitpruefer\\
			\vspace{24pt}

			% Ort & Datum
			{\large Leipzig, den \@date}
		\end{minipage}\\
		\makeatother
		\raggedright
		\vfill
	\end{titlepage}


	\restoregeometry
}

%----------------------------------------------------------------------------------------
%	EIGENE BEFEHLE
%----------------------------------------------------------------------------------------

\newcommand{\email}[1]{\renewcommand{\email}{#1}}
\newcommand{\erstpruefer}[1]{\renewcommand{\erstpruefer}{#1}}
\newcommand{\zweitpruefer}[1]{\renewcommand{\zweitpruefer}{#1}}
\newcommand{\abschluss}[1]{\renewcommand{\abschluss}{#1}}