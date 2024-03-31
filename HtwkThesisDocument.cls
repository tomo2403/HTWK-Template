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

\RequirePackage{kvoptions} % Erweitert die Klassenoptionen
\SetupKeyvalOptions{
	family=HtwkThesisDocument,
	prefix=HtwkTD@,
	setkeys=\kvsetkeys
}

\usepackage{etoolbox} % Benötigt für Hooks
\usepackage{ifthen}% Benötigt für Verarbeitung von Bedingungen

\newboolean{istAbschlussarbeit}
\newboolean{fakultaetAnzeigen}

\DeclareVoidOption{istAbschlussarbeit}{\setboolean{istAbschlussarbeit}{true}} % Option zum Ändern des Typs der Arbeit
\DeclareVoidOption{fakultaetAnzeigen}{\setboolean{fakultaetAnzeigen}{true}} % Option zum Anzeigen des Logos der Fakultät

\DeclareStringOption[gelb]{farbe} % Option zum festlegen der Anzeigefarbe

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{scrbook}} % Weitere Optionen an Basisklasse weiterreichen
\ProcessKeyvalOptions{HtwkThesisDocument} % Klassenoptionen verarbeiten

\LoadClass[a4paper]{scrbook} % Basisklasse laden

\newdimen\titleheight
\newdimen\logoheight
\newdimen\logoVheight
\newdimen\logowidth

\newcommand{\htwkLogoH}{Bilder/HTWK_Zusatz_H_Black_K}
\newcommand{\htwkLogoV}{Bilder/HTWK_Zusatz_V_Black_K}
\newcommand{\fakultaetLogo}{Bilder/HTWK-Fakultaetszusatz_IM_schwarz}

\newcommand{\htwkfarbe}{} % Befehl für das abrufen der Anzeigefarbe
\IfValueTF{\HtwkTD@farbe}{ % Prüfen der festgelegten Farbe
	\ifdefstring{\HtwkTD@farbe}{gelb}{\renewcommand{\htwkfarbe}{255,237,0}}{
	\ifdefstring{\HtwkTD@farbe}{magenta}{\renewcommand{\htwkfarbe}{229,0,125}}{
	\ifdefstring{\HtwkTD@farbe}{rot}{\renewcommand{\htwkfarbe}{229,48,9}}{
	\ifdefstring{\HtwkTD@farbe}{gruen}{\renewcommand{\htwkfarbe}{0,150,78}}{
	\ifdefstring{\HtwkTD@farbe}{cyan}{\renewcommand{\htwkfarbe}{0,158,227}}{
	\ifdefstring{\HtwkTD@farbe}{blau}{\renewcommand{\htwkfarbe}{0,70,153}}{
	\ifdefstring{\HtwkTD@farbe}{silbergrau}{\renewcommand{\htwkfarbe}{190,195,198}}{
	\ifdefstring{\HtwkTD@farbe}{grau}{\renewcommand{\htwkfarbe}{46,54,57}}{
	\ifdefstring{\HtwkTD@farbe}{dunkelblau}{\renewcommand{\htwkfarbe}{2,37,65}}{
	\ifdefstring{\HtwkTD@farbe}{schwarz}{\renewcommand{\htwkfarbe}{0,0,0}}{
		\ClassError{HtwkThesisDocument}{Farbe nicht vorhanden! Verwende nur Farben aus der Gestaltungsrichtlinie!}{}
		\stop % Ausgewählte Farbe unzulässig
	}}}}}}}}}}}{}

\newcommand{\titlepageboxheight}{3\titleheight}
\ifthenelse{\boolean{istAbschlussarbeit}}{\renewcommand{\titlepageboxheight}{0.5\paperheight}}{}


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

\usepackage[firstpage=true, scale=1, angle=0, opacity=1]{background}	%%% Hintergrundelemente

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
	\newgeometry{left=3.0cm, right=2.5cm, top=2.5cm, bottom=2.5cm, noheadfoot, nomarginpar} % Layout für Titelseite anpassen
	\renewcommand\arraystretch{1}
	\pagenumbering{gobble}

	\settoheight{\titleheight}{\parbox{\textwidth-4cm}{\Huge\bfseries\@title\\}}
	\settoheight{\logoheight}{\includegraphics[width=0.4\paperwidth]{\htwkLogoH}} % HTWK Logo Höhe messen
	\settowidth{\logowidth}{\adjustbox{trim=0 0 {0.524\width} 0, clip}{\includegraphics[height=\logoheight]{\htwkLogoH}}} % HTWK Logo Breite messen
	\settoheight{\logoVheight}{\includegraphics[width=0.24\paperwidth]{\htwkLogoV}} % Vertikales HTWK Logo Höhe messen

	\begin{titlepage}
		\ifthenelse{\boolean{istAbschlussarbeit}}{ % Titelseite für Abschlussarbeit
			\centering
			\includegraphics[width=0.24\paperwidth]{\htwkLogoV} % Logo HTWK

			\ifthenelse{\boolean{fakultaetAnzeigen}}{
				\ClassInfo{HtwkThesisDocument}{Das Logo der Fakultät ist auf Abschlussarbeiten nicht sichtbar.}
			}{}

			\vfill
			\vspace*{-\logoVheight}

			\begin{minipage}{\textwidth-4cm}
				\centering
				% Ziel der Abschlussarbeit (Bachelor, Master, Diplom...)
				{\scshape Abschlussarbeit zur Erlangung\break des akademischen Grades\\}
				{\scshape\LARGE\abschluss\\}

				% Titel
				\vspace{2\baselineskip}
				{\Huge\bfseries\@title\\}
				\vspace{2\baselineskip}

				% Autor
				{vorgelegt von:\\\Large\itshape\@author}\\
				\vspace{2\baselineskip}

				% Prüfer
				Erstprüfer: \erstpruefer\\
				Zweitprüfer: \zweitpruefer\\

				\vspace{2\baselineskip}

				Abgegeben am \@date
			\end{minipage}
			\vfill
		}{ % Titelseite für schriftliche Arbeit
			\raggedright
			\ifthenelse{\boolean{fakultaetAnzeigen}}{
				\adjustbox{trim=0 0 {0.524\width} 0, clip}{\includegraphics[height=\logoheight]{\htwkLogoH}} % Logo HTWK ohne Zusatz
				\hfill
				\includegraphics[height=\logoheight]{\fakultaetLogo} % Logo Fakultät
			}{
				\includegraphics[height=\logoheight]{\htwkLogoH} % Logo HTWK
			}

			\vspace*{\logoheight}
			\large
			\begin{tabular}{@{}ll@{}}
				Studiengang: & \studiengang \\
				Semester:    & \semester    \\
				Modul:       & \modul       \\
				Dozent:      & \erstpruefer
			\end{tabular}\\

			\vfill

			\centering
			\begin{minipage}{\textwidth-4cm}
				% Titel
				\vspace{2\baselineskip}
				\centering\Huge\bfseries\@title
				\vspace{2\baselineskip}
			\end{minipage}

			\vfill

			\raggedright\large
			\begin{tabular}{@{}ll@{}}
				Vorgelegt von:  & \@author        \\ % Autor
				Matrikelnr.:    & \matrikelnummer \\
				E-Mail-Adresse: & \email          \\
				Fachsemester:   & \fachsemester
			\end{tabular}\break\\

			Leipzig, den \@date % Ort & Datum
		}

		\backgroundsetup{hshift=1cm, contents={
				\hspace*{\dimexpr-\leftmargin+\rightmargin-\oddsidemargin+\evensidemargin\relax}
				\colorbox[RGB]{\htwkfarbe}{\rule{24mm}{0pt}\rule{0pt}{\titlepageboxheight}}
				\hspace*{\dimexpr-\textwidth-24mm-\leftmargin+\rightmargin+\oddsidemargin-\evensidemargin\relax}
				\colorbox[RGB]{\htwkfarbe}{\rule{24mm}{0pt}\rule{0pt}{\titlepageboxheight}}
			}
		} % Farbige Streifen links und rechts
	\end{titlepage}

	\restoregeometry % Standardlayout wiederherstellen
	\blankpage

	\include{Kurzfassung}
	\blankpage
	\pagenumbering{Roman}\setcounter{page}{3}
	\tableofcontents						% Erstellt ein Inhaltsverzeichnis

	\include{Abkuerzungsverzeichnis}		% Vorlage zum selber füllen

	\listoffigures							% Erstellt Abbildungsverzeichnis
	\addcontentsline{toc}{chapter}{Abbildungsverzeichnis}		% Fügt den Titel ins Inhaltsverzeichnis

	\listoftables							% Erstellt Tabellenverzeichnis
	\addcontentsline{toc}{chapter}{Tabellenverzeichnis}		% Fügt den Titel ins Inhaltsverzeichnis
}

\AtEndDocument{
	\bibliographystyle{unsrt}				% Legt Zitationsstil fest
	\bibliography{Literatur}				% Erstellt ein Literaturverzeichnis
	\addcontentsline{toc}{chapter}{Literaturverzeichnis}

	\appendix
	\include{Anhang}

	\newpage
	\pagenumbering{gobble}
	\chapter*{Selbstständigkeitserklärung}
	\vspace{3cm}

	Hiermit erkläre ich, dass ich die vorliegende Bachelorarbeit selbständig verfasst und nicht
	anderweitig zu Prüfungszwecken vorgelegt habe. Es wurden nur die in der Arbeit ausdrücklich benannten Quellen und Hilfsmittel benutzt. Wörtlich oder sinngemäß übernommenes Gedankengut habe ich als solches kenntlich gemacht.
	\vspace{3cm}

	Ort, Datum: $ \underline{\hspace{4cm}} $ \hspace{2cm} Unterschrift: $ \underline{\hspace{4cm}} $
}

%----------------------------------------------------------------------------------------
%	EIGENE BEFEHLE
%----------------------------------------------------------------------------------------

\newcommand{\blankpage}{\newpage \ \newpage}

\newcommand{\email}[1]{\renewcommand{\email}{#1}} % E-Mail-Adresse des Autor
\newcommand{\erstpruefer}[1]{\renewcommand{\erstpruefer}{#1}} % Name des ersten Prüfers
\newcommand{\zweitpruefer}[1]{\renewcommand{\zweitpruefer}{#1}} % Name des zweiten Prüfers
\newcommand{\abschluss}[1]{\renewcommand{\abschluss}{#1}} % Abschluss welcher mit dieser Arbeit erlangt wird
\newcommand{\fachsemester}[1]{\renewcommand{\fachsemester}{#1}} % Fachsemester des Autors
\newcommand{\matrikelnummer}[1]{\renewcommand{\matrikelnummer}{#1}} % Matrikelnummer des Autors
\newcommand{\modul}[1]{\renewcommand{\modul}{#1}} % Das Modul in welchem die Arbeit verfasst wird
\newcommand{\semester}[1]{\renewcommand{\semester}{#1}} % Das aktuelle Semester (WiSe 2023/24, SoSe 2024)
\newcommand{\studiengang}[1]{\renewcommand{\studiengang}{#1}} % Studengang des Autors