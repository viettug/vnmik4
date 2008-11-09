% -*-LaTeX-*-
% Copyright 2003-2006 Han The Thanh <hanthethanh@gmx.net>.
% This file is part of vntex.  License: LPPL, version 1.3 or newer,
% according to http://www.latex-project.org/lppl.txt

\ifx\documentclass\undefined\endinput\fi

\newif\ifbookmarks

\ProvidesClass{vnsample}[2005/08/27]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[a4paper]{article}

\RequirePackage{ifpdf}
\ifpdf\IfFileExists{cmap.sty}{\RequirePackage{cmap}}{}\fi
\RequirePackage[viscii]{vietnam}
\RequirePackage{multicol}
\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{fancyhdr}

\DeclareOption{sample}{
  \geometry{a4paper,nofoot,left=1cm,right=1cm,top=2cm,bottom=1cm}
  \pagestyle{fancy}
  \rhead{\thepage}
  \lhead{\textrm{\rightmark}}\cfoot{}\lfoot{}\rfoot{}
  \raggedright
  \parindent0pt
  \lineskiplimit -100pt
  \bookmarkstrue
}

\DeclareOption{test}{
  \geometry{a4paper,landscape,top=1cm,bottom=1cm,left=1cm,right=1cm,%
    nofoot,nohead}
  \pagestyle{empty}
  \bookmarksfalse
  \advance\oddsidemargin -7mm \evensidemargin=\oddsidemargin
  \hbadness=10000\relax\hfuzz=\maxdimen
  \AtBeginDocument{\extrarowheight=5pt}
}

\ProcessOptions

\newdimen\dimenA
\newbox\boxA
\newbox\boxB

\def\vnchars{%
\dochar á
\dochar Õ
\dochar à
\dochar ä
\dochar ã
\dochar å
\dochar ¡
\dochar £
\dochar ¢
\dochar Æ
\dochar Ç
\dochar â
\dochar ¤
\dochar §
\dochar ¥
\dochar ¦
\dochar ç
\dochar ğ
\dochar é
\dochar ©
\dochar è
\dochar ë
\dochar ¨
\dochar ê
\dochar ª
\dochar ®
\dochar «
\dochar ¬
\dochar ­
\dochar í
\dochar ¸
\dochar ì
\dochar ï
\dochar î
\dochar ó
\dochar ÷
\dochar ò
\dochar ö
\dochar õ
\dochar ô
\dochar ¯
\dochar µ
\dochar °
\dochar ±
\dochar ²
\dochar ½
\dochar ¾
\dochar ş
\dochar ¶
\dochar ·
\dochar Ş
\dochar ú
\dochar ø
\dochar ù
\dochar ü
\dochar û
\dochar ß
\dochar Ñ
\dochar ñ
\dochar ×
\dochar Ø
\dochar æ
\dochar ı
\dochar Ü
\dochar Ï
\dochar Ö
\dochar Û
% \break
\dochar Á
\dochar €
\dochar À
\dochar Ä
\dochar Ã
\dochar Å
\dochar 
\dochar ƒ
\dochar ‚
\dochar 
\dochar 
\dochar Â
\dochar „
\dochar ‡
\dochar …
\dochar †
\dochar 
\dochar Ğ
\dochar É
\dochar ‰
\dochar È
\dochar Ë
\dochar ˆ
\dochar Ê
\dochar Š
\dochar 
\dochar ‹
\dochar Œ
\dochar 
\dochar Í
\dochar ˜
\dochar Ì
\dochar ›
\dochar Î
\dochar Ó
\dochar š
\dochar Ò
\dochar ™
\dochar  
\dochar Ô
\dochar 
\dochar “
\dochar 
\dochar ‘
\dochar ’
\dochar ´
\dochar •
\dochar ”
\dochar –
\dochar —
\dochar ³
\dochar Ú
\dochar 
\dochar Ù
\dochar œ
\dochar 
\dochar ¿
\dochar º
\dochar ¹
\dochar »
\dochar ¼
\dochar ÿ
\dochar İ
\dochar 
\dochar Ÿ
\dochar 
\dochar 
\par
}

\def\dochar #1 {%
    #1\kern.1em\penalty0%
}

\def\SL{-Slant}
\def\EMPH#1{\textbf{\textit{#1}}}

\long\def\vntext{%
\centerline{\textbf{Chí Phèo}}
\vskip -.5\baselineskip
\rightline{\textsc{--- Nam Cao}}
H¡n v×a ği v×a chØi. Bao gi¶ cûng thª, cÑ rßşu xong là h¡n chØi. B¡t ğ¥u
chØi tr¶i. Có h« gì? Tr¶i có cüa riêng nhà nào? R°i h¡n chØi ğ¶i. Thª
cûng chÆng sao: ğ¶i là t¤t cä nhßng chÆng là ai. TÑc mình h¡n chØi ngay t¤t
cä làng Vû ĞÕi. Nhßng cä làng Vû ĞÕi ai cûng nhü, \textit{``Ch¡c nó tr×
mình ra!''} Không ai lên tiªng cä. TÑc th§t! ! Thª này thì tÑc th§t! TÑc
chªt ği ğßşc m¤t! Ğã thª, h¡n phäi chØi cha ğÑa nào không chØi nhau v¾i
h¡n. Nhßng cûng không ai ra ği«u. M© kiªp! Thª thì có phí rßşu không? Thª
thì có kh± h¡n không? Không biªt ğÑa chªt m© nào ğë ra thân h¡n cho h¡n kh±
ğªn nông n²i này? A ha! Phäi ğ¤y, h¡n cÑ thª mà chØi, h¡n chØi ğÑa chªt m©
nào ğë ra thân h¡n, ğë ra cái th¢ng \EMPH{Chí Phèo}! H¡n nghiªn rång vào
mà chØi cái ğÑa ğã ğë ra Chí Phèo. Nhßng mà biªt ğÑa nào ğã ğë ra
Chí Phèo? Có tr¶i mà biªt! H¡n không biªt, cä làng Vû ĞÕi cûng không ai
biªt.

Mµt anh ği thä ¯ng lß½n, mµt bu±i sáng tinh sß½ng ğã th¤y h¡n
tr¥n tru°ng và xám ng¡t trong mµt váy ğøp ğ¬ bên mµt lò gÕch bö
không, anh ta rß¾c l¤y và ğem v« cho mµt ngß¶i ğàn bà góa mù.
Ngß¶i ğàn bà góa mù này bán h¡n cho mµt bác phó c¯i không con, và
khi bác phó c¯i này chªt thì h¡n b½ v½, hªt ği · cho nhà này lÕi ği
· cho nhà n÷. Nåm hai mß½i tu±i, h¡n làm canh ği«n cho ông lı Kiªn,
b¤y gi¶ cø bá Kiªn, ån tiên chï làng. Hình nhß có m¤y l¥n bà ba nhà
ông lı, còn trë l¡m mà lÕi hay ¯m lØng, b¡t h¡n bóp chân, hay xoa
bøng, ğ¤m lßng gì ğ¤y. Ngß¶i ta bäo ông lı ra ğình thì hách d¸ch,
cä làng phäi sş, mà v« nhà thì lÕi sş cái bà ba còn trë này. Ngß¶i
bà ¤y ph¯p pháp, má bà ¤y hây hây, mà ông lı thì hay ğau lßng l¡m;
nhæng ngß¶i có b®nh ğau lßng hay sş vş mà chúa ğ¶i là khoë ghen.
Có ngß¶i bäo ông lı ghen v¾i anh canh ği«n khoë mÕnh mà sş bà ba
không dám nói. Có ngß¶i thì bäo anh canh ği«n ¤y ğßşc bà ba quy«n
thu quy«n b± trong nhà tin c¦n nên l¤y trµm ti«n trµm thóc nhi«u.
M²i ngß¶i nói mµt cách. ChÆng biªt ğâu mà l¥n. Chï biªt mµt hôm
Chí b¸ ngß¶i ta giäi huy®n r°i bi®t tåm ğªn bäy, tám nåm r°i mµt
hôm, h¡n lÕi lù lù · ğâu l¥n v«. H¡n v« l¾p này trông khác
hÆn, m¾i ğ¥u chÆng ai biªt h¡n là ai. Trông ğ£c nhß th¢ng s¡ng
cá! Cái ğ¥u thì tr÷c l¯c, cái rång cÕo tr¡ng h¾n, cái m£t thì ğen
mà r¤t câng câng, hai m¡t gß¶m gß¶m trông g¾m chªt! H¡n m£c qu¥n
áo nái ğen v¾i áo Tây vàng. Cái ngñc phanh, ğ¥y nhæng nét chÕm tr±
r°ng, phßşng v¾i mµt ông thày tß¾ng c¥m chuÏ, cä hai cánh tay cûng
thª. Trông g¾m chªt!
}

\def\mksample#1{%
    \leftline{\normalsize\bf\fbox{line spacing #1}\hrulefill}
    \vskip 5pt
    \ifnum\pdftexversion<130\relax
      \dimenA=\pdffontsize\font pt\relax
    \else
      \dimenA=\pdffontsize\font
    \fi
    \setbox\boxA=\vbox{%
        \baselineskip=#1\dimenA
        \parskip=.5\baselineskip
        \noindent\vntext\par}%
    \setbox\boxB=\vsplit\boxA to 3in
    \nobreak
    \box\boxB
    \vskip 10pt
}

\def\showfontsize#1#2#3{{%
    \leftline{\large\bf\fbox{#2}\hrulefill}
    \nobreak
    \font\f=#1 at #2\f
    \baselineskip=#3
    \noindent
    \vnchars\par
    \vskip .5\baselineskip
}}

\def\mkfontname#1#2#3{\hbox{%
    \hbox to .25\textwidth{NFSS:\kern1em \texttt{#1}\hss}%
    \hbox to .25\textwidth{TFM:\kern1em \texttt{#2}\hss}%
    PostScript:\kern1em \texttt{#3}}}


\def\getdesignsize#1{\def\designsize{}%
  \expandafter\@tfor\expandafter\x\expandafter:\expandafter=#1
  \do{\ifcat\x0\edef\designsize{\designsize\x}\fi%
    \if\x-\def\designsize{}\fi}}


\def\showletters#1#2#3#4#5#6{\getdesignsize{#5}%
    \ifx\HasDesignsize\undefined
      \subsection{#2-#3-#4}{#5}%
    \else
      \subsection{#2-#3-#4 (\designsize pt)}{#5}%
    \fi
    \markright{\mkfontname{#1/#2/#3/#4}{#5}{#6}}
    \showfontsize{#5}{18pt}{27pt}
    \showfontsize{#5}{36pt}{54pt}
    \showfontsize{#5}{72pt}{108pt}
    \clearpage
}

\def\showCMfont#1#2#3#4#5#6{
    \showletters{#1}{#2}{#3}{#4}{#5}{#6}
    \clearpage
    \markright{#5}
    \subsection{Text}{#5-text}%
    \showtextsize{%
        \font\f=#5\f 
        \let\EMPH=\relax 
        \let\textit=\relax
        \let\textsc=\relax}
}

\def\showtextsize#1{
    \columnsep=20pt
    \columnseprule=.4pt
    \begin{multicols}{2}
    #1
    \mksample{1}
    \mksample{1.2}
    \mksample{1.4}
    \mksample{1.1}
    \mksample{1.3}
    \mksample{1.5}
    \end{multicols}
    \clearpage
}

\def\showtext#1#2#3#4#5#6{\subsection{Text}{#5-text}%
    \markright{#6 at 8pt}\showtextsize{\fontsize{8pt}{8pt}\usefont{#1}{#2}{#3}{#4}}
    \markright{#6 at 10pt}\showtextsize{\fontsize{10pt}{10pt}\usefont{#1}{#2}{#3}{#4}}
    \markright{#6 at 12pt}\showtextsize{\fontsize{12pt}{12pt}\usefont{#1}{#2}{#3}{#4}}
    \clearpage
}

\def\samplesentence{%
     H¡n nghiªn rång vào mà chØi cái ğÑa ğã ğë ra Chí Phèo làng Vû ĞÕi}

\newenvironment{shortsample}
    {\normalfont\fontencoding{OT1}\ttfamily \selectfont
     \begin{tabular*}{\textwidth}{llll<{\samplesentence}}
     NFSS&TFM&PostScript&\multicolumn{1}{l}{Sample}\\ \hline
    }
    {\end{tabular*}}

\def\shorttext#1#2#3#4#5#6{%
    \textbackslash{usefont}\{#1\}\{#2\}\{#3\}\{#4\}
		& #5 & #6 & \normalsize\usefont{#1}{#2}{#3}{#4}\\}

%%%\endinput

\ifbookmarks\RequirePackage{hyperref}
  \def\section#1{\gdef\currsec{#1}\hypertarget{#1}{}\pdfbookmark[0]{#1}{#1}}
%\subsection{<Text>}{<label>}
  \def\subsection#1#2{\def\target{\currsec-#2}%
    \hypertarget{\target}{}\pdfbookmark[1]{#1}{\target}}
\fi


\def\mapfile#1{\ifpdf\IfFileExists{./useinternalmap}{\pdfmapfile{=#1.map}}{}\fi}
\IfFileExists{./nocompress}{\pdfcompresslevel0 }{\pdfcompresslevel9 }

% Local Variables:
% coding: viscii
% End:
