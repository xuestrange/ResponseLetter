% Author: Junzhi Xue
% Date: 2024-11-06
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{response}[2023/08/04 Paper comment-by-comment responses]
\LoadClass[12pt,letterpaper]{article}

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[breakable,skins]{tcolorbox}

% \RequirePackage{xr}
\RequirePackage{color}

\RequirePackage{titlesec}
\RequirePackage{amsmath,amssymb,amsthm,bm,fixdif}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{pdflscape}
% ===================== Font Setting ===================== %
\RequirePackage{newtxtext} % text font
\RequirePackage{newtxmath} % math font

% \RequirePackage{newpxtext} % text font
% \RequirePackage{newpxmath} % math font

% \RequirePackage{fourier}     % text font
% \RequirePackage{fouriernc}   % math font
% ======================================================== %
\RequirePackage{setspace}
\onehalfspacing
\RequirePackage{geometry}
\geometry{top=1in,bottom=1in,left=1in,right=1in}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\fancypagestyle{plain}{%
	\fancyhf{} % 清空所有预设样式
	\fancyfoot[C]{\thepage{}/\pageref*{LastPage}} % 设置页脚中心位置
	\renewcommand{\headrulewidth}{0pt} % 页眉横线的宽度
	\renewcommand{\footrulewidth}{0pt}   % 页脚横线的宽度
}
\pagestyle{plain}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage[noabbrev]{cleveref}

\def\mycolor{blue}
\hypersetup{colorlinks=true,linkcolor=\mycolor,citecolor=\mycolor,urlcolor=\mycolor}
\RequirePackage[style=apa, backend=biber, natbib=true]{biblatex}

% Counter for comments
\RequirePackage{nameref}
\newcommand*{\reviewer}{\@currentlabelname}

\newcounter{commentcounter}[section]
\setcounter{commentcounter}{0}
\RequirePackage[normalem]{ulem}
\renewcommand{\thecommentcounter}{{\uline{Comment\,\,\arabic{commentcounter}, \reviewer}}}

\titleformat{\section}[hang]{\LARGE\bfseries}{}{0em}{}[]
\renewcommand{\thesubsection}{\arabic{subsection}}

\definecolor{background_color}{RGB}{245, 248, 250}
\definecolor{point_color}{RGB}{70, 95, 115}
\definecolor{response_color}{RGB}{0, 0, 255} % blue

\RequirePackage{xparse}
% color config comes from https://zhuanlan.zhihu.com/p/336171630
\RenewDocumentEnvironment{comment}{o}  % 'o' for optional argument
{
    \IfValueTF{#1}  % Check if the optional argument is provided
    {

        % No argument, void environment
    	\begin{tcolorbox}[left = 2mm, right = 2mm, outer arc = 1mm, arc = 1mm, leftrule = 0mm, rightrule = 0mm, toprule = 0mm, bottomrule = 0mm, breakable, enhanced, before upper={\parindent15pt},
        colback=Emerald!10,colframe=cyan!40!black
        ]
    }
    {

        \refstepcounter{commentcounter}
        \begin{tcolorbox}[
         title={\flushleft \noindent Comment \#\arabic{commentcounter}}, 
          fonttitle = \bfseries, left = 2mm, right = 2mm, outer arc = 1mm, arc = 1mm, leftrule = 0mm, rightrule = 0mm, toprule = 0mm, bottomrule = 0mm, breakable, enhanced, before upper={\parindent15pt}, 
          colback=Emerald!10,colframe=cyan!40!black,
          ]
    }
}
{
    \IfValueTF{#1}
    {
        \end{tcolorbox}
    }
    {
        \end{tcolorbox}
    }
}

\newenvironment{response}[1][Response]
{\medskip \noindent \hspace{0em} \textcolor{Blue}{\textbf{#1}\textbf{:}\,\,}}
{\medskip \par}

\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\green}[1]{\textcolor{PineGreen}{#1}}

\newcommand{\placeholder}[0]{\textcolor{red}{Section X.x}}