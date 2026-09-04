\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lug}[2016/08/31]

\LoadClass{beamer}

\usetheme{Luebeck}
\setbeamercovered{dynamic}
\RequirePackage{graphicx}

\RequirePackage{ifxetex}
\ifxetex\RequirePackage{fontspec}\fi

\RequirePackage{minted}
\RequirePackage{xcolor}
\RequirePackage[overlay,absolute]{textpos}
\setminted{autogobble,python3,mathescape,linenos,frame=lines,framesep=2mm,fontsize=\footnotesize}
\usemintedstyle{emacs}

\beamertemplatenavigationsymbolsempty%

\AtBeginDocument{%
    \begin{frame}
        \begin{textblock*}{30mm}%
(\paperwidth-34mm,\paperheight-49mm)
            \includegraphics[width=30mm]{graphics/lug.pdf}
        \end{textblock*}
        \maketitle
    \end{frame}
}
