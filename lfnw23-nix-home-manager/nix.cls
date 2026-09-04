% vim: ft=tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nix}[2023/06/03]

\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{beamer}} 
\ProcessOptions\relax
\LoadClass{beamer}

% Define colors
\definecolor{nixlightblue}{RGB}{126, 186, 228}
\definecolor{nixdarkblue}{RGB}{82, 119, 195}

\usetheme[progressbar=frametitle, block=fill]{metropolis}
% \setbeamercolor{normal text}{fg=beeperblue}
% \setbeamercolor{altered text}{fg=red}
% \setbeamercolor{example text}{fg=red}
\setbeamercolor{palette primary}{bg=nixdarkblue}
\setbeamercolor{progress bar}{fg=nixlightblue}
\setbeamercolor{title separator}{fg=nixlightblue}

\makeatletter
\setlength{\metropolis@titleseparator@linewidth}{2pt}
\setlength{\metropolis@progressonsectionpage@linewidth}{2pt}
\setlength{\metropolis@progressinheadfoot@linewidth}{1.5pt}
\makeatother

\setbeamercovered{dynamic}
\RequirePackage{graphicx}

\RequirePackage{ifxetex}
\ifxetex\RequirePackage{fontspec}\fi

\RequirePackage{minted}
\RequirePackage{xcolor}
\RequirePackage{hyperref}

\renewcommand*\footnoterule{}
\setminted{autogobble,python3,mathescape,breaklines}
%\usemintedstyle{emacs}

\beamertemplatenavigationsymbolsempty%

\setlength\parindent{0pt}

\AtBeginDocument{%
    \maketitle
}
