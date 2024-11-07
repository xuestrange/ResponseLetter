\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{response}[2023/08/04 Paper comment-by-comment responses]
\LoadClass[12pt,letterpaper]{article}

\RequirePackage[breakable,skins]{tcolorbox}

\RequirePackage{xr}
\RequirePackage{color}
\RequirePackage[dvipsnames]{xcolor}

\RequirePackage{titlesec}
\RequirePackage{amsmath,amssymb,amsthm,bm,fixdif}
\RequirePackage{graphicx}
\RequirePackage{float}
% ===================== Font Setting ===================== %
% \RequirePackage{newtxtext} % text font
% \RequirePackage{newtxmath} % math font

% \RequirePackage{newpxtext} % text font
% \RequirePackage{newpxmath} % math font

\RequirePackage{fourier}     % text font
\RequirePackage{fouriernc}   % math font
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


\newcommand{\red}[1]{\textit{\textcolor{red}{#1}}}

% \titleformat{\section}[hang]{\Large\bfseries}{}{0em}{}[\rule{\textwidth}{0.5em}]
\titleformat{\section}[hang]{\LARGE\bfseries}{}{0em}{}[]
\renewcommand{\thesubsection}{\arabic{subsection}}

\definecolor{background_color}{RGB}{64, 64, 64}
\definecolor{point_color}{RGB}{255, 255, 255}
\definecolor{response_color}{RGB}{26, 115, 242}

\RequirePackage{xparse}

% renew the 'comment' environment
\RenewDocumentEnvironment{comment}{o}  % 'o' for optional argument
{
    \IfValueTF{#1}  % Check if the optional argument is provided
    {
        % No argument, viod environment, you better set the optional argument to be `void'
        \begin{tcolorbox}[left = 2mm, right = 2mm, outer arc = 1mm, arc = 1mm, leftrule = 0mm, rightrule = 0mm, toprule = 0mm, bottomrule = 0mm, breakable, enhanced, before upper={\parindent15pt}]

    }
    {

        \refstepcounter{commentcounter}
        \begin{tcolorbox}[title={\flushleft \noindent Comment \#\arabic{commentcounter}}, coltitle = point_color, fonttitle = \bfseries, colframe = background_color, left = 2mm, right = 2mm, outer arc = 1mm, arc = 1mm, leftrule = 0mm, rightrule = 0mm, toprule = 0mm, bottomrule = 0mm, breakable, enhanced, before upper={\parindent15pt}]
    }
}
{
    \IfValueTF{#1}
    {
        \end{tcolorbox}
    }{
        \end{tcolorbox}
    }
}

\newenvironment{response}[1][Response]
{\medskip \noindent \hspace{0.5em} \textcolor{response_color}{\textbf{#1}\textbf{:}\,\,}  }
{\medskip \par}

\renewcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\green}[1]{\textcolor{PineGreen}{#1}}
\newcommand{\placeholder}[0]{\textcolor{red}{Section X.x}}